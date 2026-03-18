---
title: "深度解析：pi-ai 与 pi-agent-core"
source: "https://guangzhengli.com/notes/pi-ai-and-agent-core-course#%E7%AC%AC%E4%B8%80%E7%AB%A0%E8%AE%BE%E8%AE%A1%E5%93%B2%E5%AD%A6"
author:
  - "[[@guangzhengli]]"
published:
created: 2026-02-21
description: "基于 pi-mono v0.54.0 源码逐行阅读后编写，完全吃透 pi-ai 与 pi-agent-core 的设计哲学、实现原理和使用方式"
tags:
  - "clippings"
---
2026年2月20日 · 6330 字

> 本课程基于 pi-mono v0.54.0 源码逐行阅读后编写，目标是让你完全吃透这两个包的设计哲学、实现原理和使用方式。

---

## 第一章：设计哲学

### 核心原则：关注点分离 + 最小化接口

这两个包的分层关系体现了一个清晰的设计哲学：

```md
pi-ai        = "我只管跟 LLM 通信，不关心你拿回复做什么"
pi-agent-core = "我只管编排 Agent 循环，不关心你用什么 UI"
```

### pi-ai 的设计哲学

1. **Provider 是实现细节，不是用户 API** — 用户只需要 `stream(model, context)` ，不需要知道 Anthropic 和 OpenAI 的 API 格式有什么不同
2. **流是一等公民** — 所有操作都是流式的， `complete()` 只是 `stream().result()` 的语法糖
3. **类型即文档** — `Model<TApi>` 携带 API 类型信息，TypeScript 编译器就是你的文档
4. **zero-config** — import 就能用，provider 自动注册（ `register-builtins.ts` 在 import 时执行）

### pi-agent-core 的设计哲学

1. **AgentMessage 是应用层概念，Message 是 LLM 层概念** — 两者在 `convertToLlm` 边界处转换
2. **事件驱动，不是回调地狱** — 一个 `subscribe()` 搞定所有 UI 更新
3. **Steering/FollowUp 是显式的控制流** — 不是 hack，而是正式的消息队列机制
4. **工具是可组合的独立单元** — 每个工具自包含，不依赖全局状态

---

## 第二章：pi-ai 架构全解

### 2.1 类型系统 — 一切的基础

> 源码位置： `packages/ai/src/types.ts`

整个包围绕 **5 个核心类型** 构建。理解它们就理解了整个包。

#### 内容块类型 — LLM 输出的原子单位

```typescript
// 文本内容
interface TextContent {
  type: "text";
  text: string;
  textSignature?: string; // OpenAI Responses API 的消息签名
}

// 思维链内容（扩展推理）
interface ThinkingContent {
  type: "thinking";
  thinking: string;
  thinkingSignature?: string; // OpenAI 的加密推理签名
}

// 图片内容
interface ImageContent {
  type: "image";
  data: string;     // base64 编码
  mimeType: string; // "image/jpeg", "image/png" 等
}

// 工具调用
interface ToolCall {
  type: "toolCall";
  id: string;
  name: string;
  arguments: Record<string, any>;
  thoughtSignature?: string; // Google 专有：不透明签名，用于复用思维上下文
}
```

#### 消息类型 — 对话的基本单元

```typescript
// 用户消息
interface UserMessage {
  role: "user";
  content: string | (TextContent | ImageContent)[]; // 纯文本或混合内容
  timestamp: number; // Unix 毫秒时间戳
}

// 助手消息
interface AssistantMessage {
  role: "assistant";
  content: (TextContent | ThinkingContent | ToolCall)[]; // 可以混合多种内容
  api: Api;           // 来源 API（如 "anthropic-messages"）
  provider: Provider; // 来源供应商（如 "anthropic"）
  model: string;      // 来源模型（如 "claude-sonnet-4-20250514"）
  usage: Usage;       // Token 使用和成本
  stopReason: StopReason; // "stop" | "length" | "toolUse" | "error" | "aborted"
  errorMessage?: string;
  timestamp: number;
}

// 工具结果消息
interface ToolResultMessage<TDetails = any> {
  role: "toolResult";
  toolCallId: string;
  toolName: string;
  content: (TextContent | ImageContent)[]; // 支持返回图片
  details?: TDetails; // 可选的额外细节（给 UI 用）
  isError: boolean;
  timestamp: number;
}

// 三者的联合类型 — 这就是 LLM 能理解的全部
type Message = UserMessage | AssistantMessage | ToolResultMessage;
```

**设计要点** ：

- `AssistantMessage` 带 `api` 、 `provider` 、 `model` 字段 — 为了 **跨 provider 对话** 。当你把 Claude 的回复发给 GPT 时， `transformMessages()` 需要知道原始来源来正确转换 thinking 块
- `timestamp` 在所有消息上 — 为了会话持久化和排序
- `Usage.cost` 嵌套在 `Usage` 内 — token 数和金额是同一次调用的不同视角

#### 上下文 — 传给 LLM 的完整输入

```typescript
interface Context {
  systemPrompt?: string;
  messages: Message[];
  tools?: Tool[];
}
```

简洁到极致。这就是调用 LLM 需要的全部。

#### 模型 — 带类型的模型引用

```typescript
interface Model<TApi extends Api> {
  id: string;          // "claude-sonnet-4-20250514"
  name: string;        // "Claude Sonnet 4"
  api: TApi;           // "anthropic-messages" — 决定了路由到哪个 provider
  provider: Provider;  // "anthropic"
  baseUrl: string;     // "https://api.anthropic.com"
  reasoning: boolean;  // 是否支持推理/思维
  input: ("text" | "image")[]; // 支持的输入类型
  cost: {
    input: number;      // $/百万 token
    output: number;
    cacheRead: number;
    cacheWrite: number;
  };
  contextWindow: number; // 上下文窗口大小
  maxTokens: number;     // 最大输出 token
}
```

**关键设计** ： `TApi` 泛型参数使得 TypeScript 可以在编译期知道一个 model 用的是哪个 API。

#### 事件流 — LLM 输出的实时流

```typescript
type AssistantMessageEvent =
  | { type: "start"; partial: AssistantMessage }
  | { type: "text_start"; contentIndex: number; partial: AssistantMessage }
  | { type: "text_delta"; contentIndex: number; delta: string; partial: AssistantMessage }
  | { type: "text_end"; contentIndex: number; content: string; partial: AssistantMessage }
  | { type: "thinking_start"; contentIndex: number; partial: AssistantMessage }
  | { type: "thinking_delta"; contentIndex: number; delta: string; partial: AssistantMessage }
  | { type: "thinking_end"; contentIndex: number; content: string; partial: AssistantMessage }
  | { type: "toolcall_start"; contentIndex: number; partial: AssistantMessage }
  | { type: "toolcall_delta"; contentIndex: number; delta: string; partial: AssistantMessage }
  | { type: "toolcall_end"; contentIndex: number; toolCall: ToolCall; partial: AssistantMessage }
  | { type: "done"; reason: "stop" | "length" | "toolUse"; message: AssistantMessage }
  | { type: "error"; reason: "aborted" | "error"; error: AssistantMessage };
```

**每个事件都携带 `partial`** — 这是到当前为止构建的 `AssistantMessage` 。这意味着你在任何时刻都可以拿到"当前已知的完整消息"，而不需要自己拼接 delta。

---

### 2.2 Provider 注册机制

> 源码位置： `packages/ai/src/api-registry.ts`

这是一个经典的 **Strategy + Registry 模式** 。

#### 核心接口

```typescript
// Registry 是一个 Map<Api, ApiProvider>
const apiProviderRegistry = new Map<string, RegisteredApiProvider>();

// 每个 provider 必须提供两个函数
interface ApiProvider<TApi extends Api, TOptions extends StreamOptions> {
  api: TApi;                                         // "anthropic-messages"
  stream: StreamFunction<TApi, TOptions>;            // 底层流（provider 特定选项）
  streamSimple: StreamFunction<TApi, SimpleStreamOptions>; // 简单流（统一选项）
}
```

#### 为什么需要两个 stream 函数？

- `stream()` — 接受 **provider 特定选项** （如 Anthropic 的 `thinkingEnabled` 、 `effort` ）
- `streamSimple()` — 接受 **统一选项** （只有 `reasoning: ThinkingLevel` ），内部自动映射到 provider 特定参数

这就是两层抽象的关键：

- 需要精细控制时用 `stream()`
- 需要跨 provider 统一时用 `streamSimple()`

#### 注册流程

```typescript
// register-builtins.ts — 9 个内置 provider
registerApiProvider({
  api: "anthropic-messages",
  stream: streamAnthropic,
  streamSimple: streamSimpleAnthropic,
});

registerApiProvider({
  api: "openai-completions",
  stream: streamOpenAICompletions,
  streamSimple: streamSimpleOpenAICompletions,
});

// ... 其余 7 个
```

#### 自动注册魔法

```typescript
// register-builtins.ts 的最后一行：
registerBuiltInApiProviders(); // 模块加载时立即执行

// stream.ts 的第一行：
import "./providers/register-builtins.js"; // 确保 provider 已注册
```

当你 `import { stream } from "@mariozechner/pi-ai"` 时， `register-builtins.js` 作为副作用自动执行，9 个内置 provider 全部注册完毕。用户 **零配置** 。

#### 调用路由

```typescript
// stream.ts
export function stream<TApi extends Api>(
  model: Model<TApi>,
  context: Context,
  options?: ProviderStreamOptions,
): AssistantMessageEventStream {
  const provider = resolveApiProvider(model.api);  // 根据 model.api 查注册表
  return provider.stream(model, context, options);
}
```

完整流程：

```md
stream(model, context)
  → resolveApiProvider(model.api)    // 从 Map 中查找
  → provider.stream(model, context)  // 调用具体实现
  → AssistantMessageEventStream      // 返回统一的流
```

#### 已注册的内置 Provider

---

### 2.3 Model Registry

> 源码位置： `packages/ai/src/models.ts`

```typescript
// models.generated.ts 是构建时自动生成的，包含所有已知模型的静态数据
// models.ts 在模块加载时将其灌入 Map
const modelRegistry: Map<string, Map<string, Model<Api>>> = new Map();
// 结构: provider → (modelId → Model)
```

#### 类型安全的模型查询

```typescript
function getModel<
  TProvider extends KnownProvider,
  TModelId extends keyof (typeof MODELS)[TProvider]
>(
  provider: TProvider,
  modelId: TModelId
): Model<ModelApi<TProvider, TModelId>>
```

这意味着：

```typescript
const m = getModel("anthropic", "claude-opus-4-20250514");
// TypeScript 推断出: Model<"anthropic-messages">
// IDE 自动补全 provider 名和 model ID！

const m2 = getModel("openai", "gpt-4o");
// TypeScript 推断出: Model<"openai-responses">
```

#### 其他查询函数

```typescript
getProviders(): KnownProvider[]           // 列出所有 provider
getModels("anthropic"): Model<...>[]      // 列出某 provider 的所有模型
calculateCost(model, usage): Usage["cost"] // 计算成本
supportsXhigh(model): boolean             // 检查是否支持 xhigh 思维级别
modelsAreEqual(a, b): boolean             // 比较两个模型是否相同
```

---

### 2.4 EventStream — 流式系统的基石

> 源码位置： `packages/ai/src/utils/event-stream.ts`

这是整个流式系统的基石，设计极其精巧。

#### 实现原理

```typescript
class EventStream<T, R = T> implements AsyncIterable<T> {
  private queue: T[] = [];                    // 事件缓冲区
  private waiting: ((value) => void)[] = [];  // 等待消费的 Promise resolve
  private done = false;
  private finalResultPromise: Promise<R>;     // 最终结果 Promise

  constructor(
    private isComplete: (event: T) => boolean,  // 判断事件是否是最终事件
    private extractResult: (event: T) => R,      // 从最终事件提取结果
  ) { }

  push(event: T): void {
    if (this.done) return;
    if (this.isComplete(event)) {
      this.done = true;
      this.resolveFinalResult(this.extractResult(event));
    }
    // 如果有消费者在等 → 直接交付
    const waiter = this.waiting.shift();
    if (waiter) {
      waiter({ value: event, done: false });
    } else {
      // 否则 → 入队列
      this.queue.push(event);
    }
  }

  async *[Symbol.asyncIterator](): AsyncIterator<T> {
    while (true) {
      if (this.queue.length > 0) {
        yield this.queue.shift()!;        // 有缓冲 → yield
      } else if (this.done) {
        return;                            // 队列空且完成 → return
      } else {
        // 队列空且未完成 → 创建 Promise 等待
        const result = await new Promise<IteratorResult<T>>(
          (resolve) => this.waiting.push(resolve)
        );
        if (result.done) return;
        yield result.value;
      }
    }
  }

  result(): Promise<R> {
    return this.finalResultPromise; // 一直等到 done/error 事件
  }
}
```

#### AssistantMessageEventStream

```typescript
class AssistantMessageEventStream extends EventStream<AssistantMessageEvent, AssistantMessage> {
  constructor() {
    super(
      (event) => event.type === "done" || event.type === "error",  // done 或 error 即完成
      (event) => {
        if (event.type === "done") return event.message;
        if (event.type === "error") return event.error;
        throw new Error("Unexpected event type");
      },
    );
  }
}
```

#### 三种消费方式

```typescript
// 方式 1：流式消费每个事件
for await (const event of stream(model, context)) {
  if (event.type === "text_delta") process.stdout.write(event.delta);
}

// 方式 2：只要最终结果
const message = await stream(model, context).result();

// 方式 3：混合 — 消费事件 + 最终拿结果
const s = stream(model, context);
for await (const event of s) { /* 实时处理 */ }
const finalMessage = await s.result();
```

**设计精妙之处** ： `EventStream` 同时是 `AsyncIterable` （可以 `for await` ）和 `Promise` -like（可以 `.result()` ）。生产者用 `push()` 放事件，消费者用 `for await` 或 `result()` 取。

---

### 2.5 跨 Provider 消息转换

> 源码位置： `packages/ai/src/providers/transform-messages.ts`

这解决了一个现实问题： **用 Claude 开始的对话，切换到 GPT 继续** 。

#### 问题场景

```md
场景 1：Claude 的回复中有 ThinkingContent 块，但 GPT 不认识
场景 2：OpenAI 的 tool call ID 长 450+ 字符，但 Anthropic 限 64 字符
场景 3：被中断的 assistant 消息不应该发给新 LLM（会导致 API 错误）
```

#### transformMessages() 做两遍扫描

**第一遍 — 逐消息转换** ：

```typescript
// 对每条 assistant 消息：
const isSameModel = assistantMsg.provider === model.provider
                 && assistantMsg.api === model.api
                 && assistantMsg.model === model.id;

// 同 provider/model：保持原样（包括 thinking signature）
if (isSameModel && block.thinkingSignature) return block;

// 不同 provider：thinking 块 → 纯文本
if (!isSameModel) return { type: "text", text: block.thinking };

// tool call ID 规范化
if (!isSameModel && normalizeToolCallId) {
  const normalizedId = normalizeToolCallId(toolCall.id, model, assistantMsg);
  toolCallIdMap.set(toolCall.id, normalizedId);
}
```

**第二遍 — 修复孤儿 tool call** ：

```typescript
// 如果 assistant 消息调用了工具但没有对应的 toolResult
// → 插入合成错误结果
if (!existingToolResultIds.has(tc.id)) {
  result.push({
    role: "toolResult",
    toolCallId: tc.id,
    toolName: tc.name,
    content: [{ type: "text", text: "No result provided" }],
    isError: true,
    timestamp: Date.now(),
  });
}

// 跳过 stopReason === "error" | "aborted" 的消息
// （不完整的轮次不应回放）
if (assistantMsg.stopReason === "error" || assistantMsg.stopReason === "aborted") {
  continue;
}
```

---

### 2.6 工具验证

> 源码位置： `packages/ai/src/utils/validation.ts`

#### 工具定义

```typescript
import { Type } from "@sinclair/typebox"; // 从 pi-ai 重导出

const myTool: Tool = {
  name: "get_weather",
  description: "获取指定城市的天气",
  parameters: Type.Object({
    city: Type.String({ description: "城市名称" }),
    units: StringEnum(["celsius", "fahrenheit"], {
      description: "温度单位",
      default: "celsius",
    }),
  }),
};
```

#### StringEnum 辅助函数

> 源码位置： `packages/ai/src/utils/typebox-helpers.ts`

```typescript
// 标准 TypeBox 的 enum 在 Google API 上会出问题（anyOf/const 格式）
// StringEnum 生成兼容所有 provider 的格式
function StringEnum<T extends readonly string[]>(
  values: T,
  options?: { description?: string; default?: T[number] }
): TUnsafe<T[number]> {
  return Type.Unsafe<T[number]>({
    type: "string",
    enum: values as any,
    ...(options?.description && { description: options.description }),
  });
}
```

#### AJV 验证

```typescript
const ajv = new Ajv({
  allErrors: true,    // 报告所有错误，不是遇到第一个就停
  strict: false,      // 不做额外的 schema 检查
  coerceTypes: true,  // 自动类型强转（"42" → 42）
});

function validateToolArguments(tool: Tool, toolCall: ToolCall): any {
  const args = structuredClone(toolCall.arguments); // clone，因为 AJV 会原地修改
  if (validate(args)) return args;                   // 验证通过
  throw new Error(\`Validation failed for tool "${toolCall.name}":\n${errors}\`);
}
```

**为什么用 `coerceTypes: true` ？** 因为 LLM 经常返回 `"42"` 而不是 `42` 。AJV 的类型强转会自动修复。

**为什么在浏览器扩展中跳过验证？** Chrome Manifest V3 禁止 `eval` / `Function` 构造器，而 AJV 依赖它们。

---

### 2.7 SimpleStreamOptions 与 reasoning 映射

> 源码位置： `packages/ai/src/providers/simple-options.ts`

```typescript
// 统一选项 — 用户只需要设置一个 reasoning 级别
interface SimpleStreamOptions extends StreamOptions {
  reasoning?: ThinkingLevel; // "minimal" | "low" | "medium" | "high" | "xhigh"
  thinkingBudgets?: ThinkingBudgets;
}

// 内部映射到 provider 特定参数
function adjustMaxTokensForThinking(
  baseMaxTokens: number,
  modelMaxTokens: number,
  reasoningLevel: ThinkingLevel,
  customBudgets?: ThinkingBudgets,
): { maxTokens: number; thinkingBudget: number } {
  const defaultBudgets = {
    minimal: 1024,
    low: 2048,
    medium: 8192,
    high: 16384,
  };
  const budgets = { ...defaultBudgets, ...customBudgets };
  // maxTokens = 基础 + 思维预算，但不超过模型限制
  // thinkingBudget 也不能超过 maxTokens
}
```

不同 provider 如何映射 reasoning：

- **Anthropic**: `reasoning: "high"` → `thinkingEnabled: true, thinkingBudgetTokens: 16384`
- **OpenAI**: `reasoning: "high"` → `reasoning_effort: "high"`
- **Google**: `reasoning: "high"` → `thinking: { enabled: true, budgetTokens: 16384 }`

用户不需要知道这些细节。

---

## 第三章：pi-agent-core 架构全解

### 3.1 核心分层

```md
Agent (agent.ts)               ← 高层：状态管理 + 事件订阅 + 消息队列
  │
  └── agentLoop (agent-loop.ts)  ← 低层：双重循环编排 + LLM 调用 + 工具执行
        │
        └── streamSimple (pi-ai)   ← 底层：LLM API 调用
```

**为什么分两层？**

- `Agent` 适合大多数场景 — 有状态，有事件，有队列
- `agentLoop` 适合需要 **完全控制** 的场景 — 无状态，返回 EventStream，你自己管理上下文

---

### 3.2 AgentMessage vs Message — 关键边界

> 源码位置： `packages/agent/src/types.ts`

```typescript
// pi-ai 的 Message（LLM 层） — 3 种角色
type Message = UserMessage | AssistantMessage | ToolResultMessage;

// pi-agent-core 的 AgentMessage（应用层） — 3 种 + 自定义
type AgentMessage = Message | CustomAgentMessages[keyof CustomAgentMessages];

// 自定义消息类型通过声明合并扩展
interface CustomAgentMessages {
  // 空的 — 应用通过声明合并添加
}
```

**为什么需要 AgentMessage？** 因为现实的应用中，对话历史里不只有 user/assistant/toolResult：

```typescript
// 你可能需要：系统通知、压缩摘要、artifact 操作……
declare module "@mariozechner/pi-agent-core" {
  interface CustomAgentMessages {
    "compaction-summary": { role: "compaction-summary"; summary: string; timestamp: number };
    "artifact": { role: "artifact"; filename: string; content: string; timestamp: number };
  }
}
```

#### 转换管道

```md
AgentMessage[]
  ↓ transformContext()  [可选：裁剪上下文、注入外部信息]
  ↓ convertToLlm()     [必须：过滤/转换为 Message[]]
  ↓
Context { systemPrompt, messages: Message[], tools }
  ↓
streamSimple(model, context, options)
```

这个管道在 `streamAssistantResponse()` 内执行（ `agent-loop.ts:204` ），是 **唯一** 将 AgentMessage 转为 Message 的地方。

#### 默认的 convertToLlm

```typescript
// agent.ts:31
function defaultConvertToLlm(messages: AgentMessage[]): Message[] {
  return messages.filter(
    (m) => m.role === "user" || m.role === "assistant" || m.role === "toolResult"
  );
}
```

简单粗暴：只保留 LLM 能理解的 3 种消息，其他全部过滤。

---

### 3.3 双重循环 — 核心编排逻辑

> 源码位置： `packages/agent/src/agent-loop.ts`

#### 伪代码

```md
外层 while(true) {                    ← 处理 follow-up 消息
  内层 while(hasMoreToolCalls || pendingMessages) {  ← 处理工具调用 + steering
    1. 注入 pending messages（发射 message_start/end 事件）
    2. streamAssistantResponse()  → 拿到 AssistantMessage
    3. 如果 error/aborted → agent_end，返回
    4. 如果有 tool calls → executeToolCalls()
       - 每个工具执行后检查 steering 队列
       - 如果有 steering → 跳过剩余工具（标记为 "Skipped"）
    5. 发射 turn_end
    6. 再次检查 steering 队列
  }
  检查 follow-up 队列 → 如果有 → 设为 pending → continue 外层
  没有了 → break
}
agent_end
```

#### 为什么是双重循环？

因为 **steering** 和 **follow-up** 的语义不同：

| 类型 | 语义 | 检查时机 | 效果 |
| --- | --- | --- | --- |
| **Steering** | "别做了，改做这个" | 每个工具执行后 | 跳过剩余工具，注入新消息 |
| **Follow-up** | "做完了再做这个" | Agent 即将停止时 | 追加消息，继续循环 |

#### 关键函数：streamAssistantResponse()

```typescript
async function streamAssistantResponse(context, config, signal, stream, streamFn) {
  // 1. 可选：transformContext（AgentMessage[] → AgentMessage[]）
  let messages = context.messages;
  if (config.transformContext) {
    messages = await config.transformContext(messages, signal);
  }

  // 2. 必须：convertToLlm（AgentMessage[] → Message[]）
  const llmMessages = await config.convertToLlm(messages);

  // 3. 构建 LLM 上下文
  const llmContext = { systemPrompt: context.systemPrompt, messages: llmMessages, tools: context.tools };

  // 4. 动态解析 API key（支持短期 OAuth token 刷新）
  const resolvedApiKey = config.getApiKey
    ? await config.getApiKey(config.model.provider)
    : config.apiKey;

  // 5. 调用 LLM
  const response = await streamFunction(config.model, llmContext, { ...config, apiKey: resolvedApiKey, signal });

  // 6. 转发流事件，同时原地更新 context.messages
  for await (const event of response) {
    switch (event.type) {
      case "start":
        context.messages.push(event.partial);         // 加入 partial
        stream.push({ type: "message_start", message: event.partial });
        break;
      case "text_delta": case "thinking_delta": /* ... */
        context.messages[context.messages.length - 1] = event.partial; // 更新 partial
        stream.push({ type: "message_update", assistantMessageEvent: event, message: event.partial });
        break;
      case "done": case "error":
        const finalMessage = await response.result();
        context.messages[context.messages.length - 1] = finalMessage;  // 替换为最终消息
        stream.push({ type: "message_end", message: finalMessage });
        return finalMessage;
    }
  }
}
```

#### 关键函数：executeToolCalls()

```typescript
async function executeToolCalls(tools, assistantMessage, signal, stream, getSteeringMessages) {
  const toolCalls = assistantMessage.content.filter(c => c.type === "toolCall");
  const results = [];

  for (let index = 0; index < toolCalls.length; index++) {
    const toolCall = toolCalls[index];
    const tool = tools?.find(t => t.name === toolCall.name);

    stream.push({ type: "tool_execution_start", toolCallId: toolCall.id, toolName: toolCall.name, args: toolCall.arguments });

    try {
      if (!tool) throw new Error(\`Tool ${toolCall.name} not found\`);
      const validatedArgs = validateToolArguments(tool, toolCall); // AJV 验证
      result = await tool.execute(toolCall.id, validatedArgs, signal, (partialResult) => {
        stream.push({ type: "tool_execution_update", ... }); // 流式进度
      });
    } catch (e) {
      result = { content: [{ type: "text", text: e.message }], details: {} };
      isError = true;
    }

    stream.push({ type: "tool_execution_end", ... });
    results.push(toolResultMessage);

    // === 关键：每个工具执行后检查 steering ===
    if (getSteeringMessages) {
      const steering = await getSteeringMessages();
      if (steering.length > 0) {
        // 跳过剩余工具
        for (const skipped of toolCalls.slice(index + 1)) {
          results.push(skipToolCall(skipped, stream)); // "Skipped due to queued user message"
        }
        return { toolResults: results, steeringMessages: steering };
      }
    }
  }
  return { toolResults: results };
}
```

---

### 3.4 Agent 类的状态机

> 源码位置： `packages/agent/src/agent.ts`

```md
idle (isStreaming=false)
  │
  └── prompt("hello") ──→ streaming (isStreaming=true)
        │                    │
        │                    ├── message_start/update/end 事件
        │                    ├── tool_execution_start/update/end 事件
        │                    ├── steer() → 队列消息，等工具执行完后注入
        │                    ├── followUp() → 队列消息，等 agent 停止前注入
        │                    ├── abort() → 中止当前 LLM 调用
        │                    │
        │                    └── agent_end ──→ idle
        │
        └── prompt() 时已在 streaming → throw Error!
```

#### 事件序列（一次完整的 prompt 调用）

```md
agent_start
  └── turn_start
        ├── message_start (userMessage)
        ├── message_end (userMessage)
        ├── message_start (assistantMessage — 开始流式)
        ├── message_update × N (text_delta, thinking_delta, toolcall_delta...)
        ├── message_end (assistantMessage — 完成)
        ├── tool_execution_start ("read", {path: "/foo"})
        ├── tool_execution_update × N (流式进度)
        ├── tool_execution_end (结果)
        ├── message_start (toolResultMessage)
        ├── message_end (toolResultMessage)
        └── turn_end { message, toolResults }
  └── turn_start (如果有更多工具调用)
        └── ...
  └── agent_end { messages: [所有新产生的消息] }
```

#### 状态保护

```typescript
async prompt(input) {
  if (this._state.isStreaming) {
    throw new Error(
      "Agent is already processing a prompt. " +
      "Use steer() or followUp() to queue messages, or wait for completion."
    );
  }
  // ...
}
```

想在运行中发消息？用 `steer()` 或 `followUp()` ，不要重复调用 `prompt()` 。

#### Steering 和 Follow-up 队列

```typescript
// 两种出队模式
steeringMode: "all" | "one-at-a-time"   // 默认 one-at-a-time
followUpMode: "all" | "one-at-a-time"   // 默认 one-at-a-time

// one-at-a-time: 每次只取队列第一条
// all: 一次性取出全部
```

---

### 3.5 工具执行的精妙设计

> 源码位置： `packages/agent/src/types.ts`

```typescript
interface AgentTool<TParameters extends TSchema, TDetails = any> extends Tool<TParameters> {
  label: string;  // UI 显示名（"文件读取"，不是 "read"）

  execute: (
    toolCallId: string,                         // 关联回 LLM 的 tool call
    params: Static<TParameters>,                // 经 AJV 验证 + 强转后的参数
    signal?: AbortSignal,                       // 可中止
    onUpdate?: AgentToolUpdateCallback<TDetails>, // 流式进度回调
  ) => Promise<AgentToolResult<TDetails>>;
}

interface AgentToolResult<T> {
  content: (TextContent | ImageContent)[];  // LLM 看到的
  details: T;                                // UI 看到的
}
```

#### 为什么 content 和 details 分开？

```md
content → 放入 ToolResultMessage → 发给 LLM（"文件内容是..."）
details → 给 UI 渲染（diff 预览、文件元数据、执行时间...）
```

LLM 不需要知道所有细节，UI 不需要跟 LLM 看到的一模一样。

#### 流式工具执行

```typescript
const readTool: AgentTool = {
  name: "read",
  label: "文件读取",
  description: "读取文件内容",
  parameters: Type.Object({ path: Type.String() }),

  execute: async (id, params, signal, onUpdate) => {
    const chunks = [];
    for await (const chunk of readFileChunked(params.path)) {
      chunks.push(chunk);
      // 每读一块就通知 UI
      onUpdate?.({
        content: [{ type: "text", text: chunks.join("") }],
        details: { bytesRead: chunks.reduce((s, c) => s + c.length, 0) },
      });
    }

    return {
      content: [{ type: "text", text: chunks.join("") }],
      details: { bytesRead: totalBytes, path: params.path },
    };
  },
};
```

---

### 3.6 Proxy 模式

> 源码位置： `packages/agent/src/proxy.ts`

为浏览器场景提供后端代理，解决 CORS 和密钥安全问题。

#### 核心思路

```md
浏览器 → POST /api/stream (携带 authToken) → 后端服务器
后端服务器 → 调用 LLM API（携带真正的 API key）
后端服务器 → SSE 事件流（去掉 partial 字段减少带宽）→ 浏览器
浏览器 → 从 delta 重建 partial 消息
```

#### ProxyAssistantMessageEvent

```typescript
// 服务端发送的精简事件（没有 partial 字段）
type ProxyAssistantMessageEvent =
  | { type: "start" }                                          // 没有 partial
  | { type: "text_delta"; contentIndex: number; delta: string } // 只有 delta
  | { type: "done"; reason: "stop"; usage: Usage }              // 最终 usage
```

客户端的 `processProxyEvent()` 维护一个 `partial: AssistantMessage` ，从每个事件中增量重建完整消息。

---

## 第四章：完整使用示例

### 4.1 最简示例：单次 LLM 调用

```typescript
import { getModel, stream, complete } from "@mariozechner/pi-ai";

// 设置环境变量: ANTHROPIC_API_KEY=sk-ant-...

const model = getModel("anthropic", "claude-sonnet-4-20250514");

const context = {
  systemPrompt: "你是一个简洁的助手。",
  messages: [
    { role: "user" as const, content: "什么是 TypeScript？", timestamp: Date.now() }
  ],
};

// 流式调用
for await (const event of stream(model, context)) {
  if (event.type === "text_delta") {
    process.stdout.write(event.delta);
  }
}

// 或者只要结果
const result = await complete(model, context);
console.log(result.content[0].text);
console.log(\`花费: $${result.usage.cost.total}\`);
```

---

### 4.2 带工具的手动循环

```typescript
import { getModel, stream, Type, StringEnum, validateToolCall } from "@mariozechner/pi-ai";

const model = getModel("openai", "gpt-4o");

const calculatorTool = {
  name: "calculate",
  description: "计算数学表达式",
  parameters: Type.Object({
    expression: Type.String({ description: "要计算的表达式" }),
    precision: Type.Optional(Type.Number({ description: "小数位数", default: 2 })),
  }),
};

const context = {
  systemPrompt: "你是一个数学助手。用 calculate 工具来计算。",
  messages: [
    { role: "user" as const, content: "123 * 456 等于多少？", timestamp: Date.now() }
  ],
  tools: [calculatorTool],
};

// 手动实现工具调用循环
while (true) {
  const s = stream(model, context);
  const message = await s.result();
  context.messages.push(message);

  // 没有工具调用 → 完成
  if (message.stopReason !== "toolUse") {
    const text = message.content.find(c => c.type === "text");
    console.log(text?.text);
    break;
  }

  // 执行每个工具调用
  for (const block of message.content) {
    if (block.type !== "toolCall") continue;

    const args = validateToolCall(context.tools, block);
    let resultText: string;
    try {
      resultText = String(new Function(\`return ${args.expression}\`)());
    } catch (e) {
      resultText = \`错误: ${e}\`;
    }

    context.messages.push({
      role: "toolResult",
      toolCallId: block.id,
      toolName: block.name,
      content: [{ type: "text", text: resultText }],
      isError: false,
      timestamp: Date.now(),
    });
  }
}
```

---

### 4.3 使用 Agent（推荐方式）

```typescript
import { Agent } from "@mariozechner/pi-agent-core";
import { getModel, Type } from "@mariozechner/pi-ai";

// 定义带执行逻辑的工具
const calculatorTool = {
  name: "calculate",
  label: "计算器",
  description: "计算数学表达式",
  parameters: Type.Object({
    expression: Type.String({ description: "数学表达式" }),
  }),
  execute: async (toolCallId, params, signal, onUpdate) => {
    const result = new Function(\`return ${params.expression}\`)();
    return {
      content: [{ type: "text" as const, text: \`${params.expression} = ${result}\` }],
      details: { expression: params.expression, result },
    };
  },
};

// 创建 Agent
const agent = new Agent({
  initialState: {
    systemPrompt: "你是一个数学助手。用 calculate 工具来计算。",
    model: getModel("anthropic", "claude-sonnet-4-20250514"),
    tools: [calculatorTool],
  },
});

// 订阅事件 — 一个 subscribe 搞定所有 UI 更新
agent.subscribe((event) => {
  switch (event.type) {
    case "message_update":
      if (event.assistantMessageEvent.type === "text_delta") {
        process.stdout.write(event.assistantMessageEvent.delta);
      }
      break;
    case "tool_execution_start":
      console.log(\`\n[工具] ${event.toolName}(${JSON.stringify(event.args)})\`);
      break;
    case "tool_execution_end":
      console.log(\`[结果] ${event.result.content[0].text}\`);
      break;
    case "agent_end":
      console.log(\`\n--- 完成，共 ${event.messages.length} 条新消息 ---\`);
      break;
  }
});

// 发送消息 — Agent 自动处理工具调用循环！
await agent.prompt("计算 (123 + 456) * 789");
```

> **对比 4.2 和 4.3** ：Agent 内部帮你做了工具调用循环、参数验证、错误处理、事件发射。你只需要定义工具的 `execute` 和订阅事件。

---

### 4.4 Steering 和 Follow-up

```typescript
const agent = new Agent({
  initialState: {
    systemPrompt: "你是一个助手。一步一步完成任务。",
    model: getModel("anthropic", "claude-sonnet-4-20250514"),
    tools: [readTool, writeTool, bashTool],
  },
});

agent.subscribe((event) => { /* UI 更新 */ });

// === 场景 1: Steering — 用户中途改主意 ===
const task = agent.prompt("帮我写 3 个文件：config.ts, utils.ts, main.ts");

// 1 秒后用户说 "算了只要 main.ts"
setTimeout(() => {
  agent.steer({
    role: "user",
    content: "停下！只需要 main.ts 就行了，其他不要",
    timestamp: Date.now(),
  });
}, 1000);

await task;
// Agent 在完成当前工具后，收到 steering 消息，跳过剩余工具，按新指令继续

// === 场景 2: Follow-up — 做完了再加任务 ===
const task2 = agent.prompt("写一个 hello world");

agent.followUp({
  role: "user",
  content: "写完后帮我加上错误处理",
  timestamp: Date.now(),
});

await task2;
// Agent 完成 hello world 后，不会停止，而是继续处理 follow-up 消息
```

---

### 4.5 自定义消息类型

```typescript
import { Agent, type AgentMessage } from "@mariozechner/pi-agent-core";
import type { Message } from "@mariozechner/pi-ai";

// 1. 声明自定义消息类型（TypeScript 声明合并）
declare module "@mariozechner/pi-agent-core" {
  interface CustomAgentMessages {
    "system-note": {
      role: "system-note";
      text: string;
      timestamp: number;
    };
  }
}

// 2. 自定义 convertToLlm — 告诉 Agent 如何把自定义消息转给 LLM
function myConvertToLlm(messages: AgentMessage[]): Message[] {
  return messages.flatMap((m) => {
    if (m.role === "system-note") {
      // 系统笔记 → 作为 user 消息让 LLM 知道
      return [{
        role: "user" as const,
        content: \`[系统] ${m.text}\`,
        timestamp: m.timestamp,
      }];
    }
    if (m.role === "user" || m.role === "assistant" || m.role === "toolResult") {
      return [m]; // 标准消息直接通过
    }
    return []; // 未知类型 → 过滤掉
  });
}

// 3. 使用
const agent = new Agent({
  initialState: { /* ... */ },
  convertToLlm: myConvertToLlm,
});

agent.appendMessage({
  role: "system-note",
  text: "用户已切换到深色主题",
  timestamp: Date.now(),
});

await agent.prompt("你好");
// LLM 会看到 [系统] 用户已切换到深色主题 这条消息
```

---

### 4.6 上下文裁剪（transformContext）

```typescript
const agent = new Agent({
  initialState: { /* ... */ },

  // transformContext 在 convertToLlm 之前运行
  // 在 AgentMessage 层面操作（包含自定义消息）
  transformContext: async (messages) => {
    if (messages.length > 50) {
      const summary: AgentMessage = {
        role: "user",
        content: "[上下文已裁剪，以下是最近 50 条消息]",
        timestamp: Date.now(),
      };
      return [summary, ...messages.slice(-50)];
    }
    return messages;
  },
});
```

---

### 4.7 切换模型和思维级别

```typescript
const agent = new Agent({
  initialState: {
    model: getModel("anthropic", "claude-sonnet-4-20250514"),
    thinkingLevel: "off",
  },
});

// 简单任务 → 便宜模型，不需要思考
await agent.prompt("什么是 1+1？");

// 复杂任务 → 强模型 + 高思维
agent.setModel(getModel("anthropic", "claude-opus-4-20250514"));
agent.setThinkingLevel("high");
await agent.prompt("设计一个分布式锁的算法");

// 恢复
agent.setModel(getModel("anthropic", "claude-sonnet-4-20250514"));
agent.setThinkingLevel("off");
```

---

### 4.8 低层 API（agentLoop）

```typescript
import {
  agentLoop,
  agentLoopContinue,
  type AgentContext,
  type AgentLoopConfig,
} from "@mariozechner/pi-agent-core";
import { getModel, type Message } from "@mariozechner/pi-ai";

const context: AgentContext = {
  systemPrompt: "你是助手。",
  messages: [],
  tools: [],
};

const config: AgentLoopConfig = {
  model: getModel("anthropic", "claude-sonnet-4-20250514"),
  convertToLlm: (msgs) =>
    msgs.filter(
      (m) => m.role === "user" || m.role === "assistant" || m.role === "toolResult"
    ) as Message[],
};

const userMsg = {
  role: "user" as const,
  content: "你好",
  timestamp: Date.now(),
};

// agentLoop 返回 EventStream<AgentEvent, AgentMessage[]>
const stream = agentLoop([userMsg], context, config);

for await (const event of stream) {
  console.log(event.type);
}

const newMessages = await stream.result();
console.log(\`产生了 ${newMessages.length} 条新消息\`);

// 注意：context.messages 已被 agentLoop 原地修改！
console.log(\`上下文中现在有 ${context.messages.length} 条消息\`);
```

---

### 4.9 Proxy 模式（浏览器场景）

```typescript
import { Agent } from "@mariozechner/pi-agent-core";
import { streamProxy } from "@mariozechner/pi-agent-core";

const agent = new Agent({
  initialState: { /* ... */ },
  streamFn: (model, context, options) =>
    streamProxy(model, context, {
      ...options,
      authToken: "your-jwt-token",
      proxyUrl: "https://your-backend.com",
    }),
});

// 使用方式完全一样！Agent 不知道也不关心 LLM 调用是直连还是代理的
await agent.prompt("你好");
```

---

## 第五章：命名规范与速查表

### 核心类型命名

| 名称 | 层级 | 含义 |
| --- | --- | --- |
| `Api` | pi-ai | LLM 协议标识（ `"anthropic-messages"` ），一个 provider 可以有多个 api |
| `Provider` | pi-ai | 供应商标识（ `"anthropic"` ），用于 `getModel` 的第一个参数 |
| `Model<TApi>` | pi-ai | 携带类型的模型引用， `TApi` 约束了可用的选项类型 |
| `Context` | pi-ai | LLM 层的完整输入： `{systemPrompt, messages: Message[], tools}` |
| `Message` | pi-ai | LLM 能理解的 3 种消息： `user \| assistant \| toolResult` |
| `Tool` | pi-ai | 工具定义（name + description + TypeBox parameters） |
| `AgentContext` | agent-core | Agent 层的上下文（messages 是 `AgentMessage[]` ） |
| `AgentMessage` | agent-core | 应用层的所有消息类型： `Message + 自定义消息` |
| `AgentTool` | agent-core | 可执行的工具，比 `Tool` 多了 `label` 和 `execute` |
| `AgentState` | agent-core | Agent 的完整状态快照 |

### 选项类型命名

| 名称 | 含义 |
| --- | --- |
| `StreamOptions` | 所有 provider 共享的基础选项（temperature, maxTokens, signal...） |
| `ProviderStreamOptions` | `StreamOptions & Record<string, unknown>` — 允许 provider 特定字段 |
| `SimpleStreamOptions` | `StreamOptions + reasoning: ThinkingLevel` — 统一的推理选项 |
| `AgentLoopConfig` | `SimpleStreamOptions + model + convertToLlm + transformContext + ...` |
| `AgentOptions` | 创建 Agent 时的选项 |

### 函数命名

| 名称 | 层级 | 含义 |
| --- | --- | --- |
| `stream()` | pi-ai | 底层流（provider 特定选项） |
| `complete()` | pi-ai | `stream().result()` 的语法糖 |
| `streamSimple()` | pi-ai | 简单流（统一 reasoning 选项） |
| `completeSimple()` | pi-ai | `streamSimple().result()` 的语法糖 |
| `agentLoop()` | agent-core | 低层：带新消息启动循环 |
| `agentLoopContinue()` | agent-core | 低层：从现有上下文继续 |
| `agent.prompt()` | agent-core | 高层：发送消息并运行 |
| `agent.steer()` | agent-core | 队列中断消息 |
| `agent.followUp()` | agent-core | 队列后续消息 |

### 事件命名

| 事件 | 发射者 | 含义 |
| --- | --- | --- |
| `text_delta` | pi-ai | LLM 生成了一段文本 |
| `thinking_delta` | pi-ai | LLM 生成了一段思维 |
| `toolcall_delta` | pi-ai | LLM 生成了工具调用参数片段 |
| `done` / `error` | pi-ai | LLM 调用完成/失败 |
| `agent_start` / `agent_end` | agent-core | Agent 循环开始/结束 |
| `turn_start` / `turn_end` | agent-core | 一轮（LLM 调用 + 工具执行）的开始/结束 |
| `message_start` / `message_end` | agent-core | 任何消息的开始/结束 |
| `message_update` | agent-core | Assistant 消息流式更新 |
| `tool_execution_start` / `end` | agent-core | 工具执行开始/结束 |
| `tool_execution_update` | agent-core | 工具执行流式进度 |

---

## 一句话总结

**pi-ai** = 把 20+ LLM 供应商统一成一个 `stream(model, context)` 调用，用 `EventStream` 流式返回，用 TypeBox 定义工具，用 AJV 验证参数，用 `transformMessages` 处理跨 provider 迁移。

**pi-agent-core** = 在 pi-ai 之上加一个双重循环（工具执行 + 消息队列），把手动的"调用 LLM → 执行工具 → 再调用 LLM"循环自动化，通过 `AgentMessage` 扩展消息类型，通过 `convertToLlm` / `transformContext` 控制发给 LLM 的内容，通过 `steering` / `followUp` 实现运行时控制。