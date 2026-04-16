---
title: Context 工程与信息架构
slug: context-engineering
type: concept-page
status: active
aliases: [Context Engineering, 上下文工程, 信息架构, context management, 渐进式披露, progressive disclosure]
source_count: 11
last_updated: 2026-04-16
related_wikis: [agent-memory, openclaw, system-prompt, token-optimization]
---

# Context 工程与信息架构

> 综合 11 篇源文章的常青概念页。如何组织、分层、按需披露信息给 LLM，是 Agent 性能的第一杠杆。最后更新：2026-04-16。

## TL;DR

Context Engineering 的核心命题是：**对算力有限的观察者（LLM），信息的组织方式比信息量本身更重要。** 本库 11 篇文章从理论（Epiplexity 信息经济学）、架构（渐进式披露三层漏斗 / 九层 System Prompt）、工程实践（上下文预算管理 / QMD 语义检索 / 跨会话交接）三个维度收敛到同一个设计直觉——**路由优先于全量注入、结构密度优先于覆盖面、按需加载优先于预加载**。200K context window 的真实可用空间只有 160-180K，瓶颈不是"怎么问更好"（prompt engineering），而是"AI 需要什么信息才能做出正确决策，以及如何结构化这些信息"。

## 核心观点

- **Epiplexity > Shannon 熵**：同一份数据对不同模型的"可提取结构性信息"不同，塞进去的 context 越多反而可能越蠢——确定性变换（如经验写成 Skill）可为有限观察者"创造"结构性信息
- **渐进式披露是通用范式**：Level 1 路由（始终加载）→ Level 2 模块指令（任务匹配时加载）→ Level 3 实际数据（需要时逐行读），三层之间严格解耦
- **变与不变分离**：框架层（自动生成，不可编辑）/ 用户层（可配置）/ 运行时层（动态注入）三区隔离，升级不破坏配置，配置不影响稳定
- **文件系统 = 上下文接口**：工具调用产生的大量 JSON 不应在上下文中反复流转，应写入文件，Agent 通过 grep 按需读取——Cursor 实验证明 token 消耗减少 46.9%
- **上下文预算是硬约束**：200K 窗口中固定开销 15-20K、半固定 5-10K，5 个 MCP Server 光工具定义吃掉 25K，真正可用的动态空间有限
- **先修评测，再改 Agent**：能力评测（Pass@k，找上限）和回归测试（Pass^k，防退化）必须分开，混用会误判

## 证据与分主题

### 1. 理论基础：Epiplexity 与信息经济学

[Agent 信息经济学](../01-AI-Agents/Architecture/Agent信息经济学/index.md) 引入 CMU/NYU 的 Epiplexity 概念（epi-认识论 + plexity-复杂度）：对算力有限的观察者能从数据中提取多少结构性信息。与 Shannon 熵不同，Epiplexity 不是数据固有属性——同一份数据，不同架构/算力的模型看到的"可学结构"不同。

核心推论：
- "确定性变换"（把经验写成 Skill、把规则编码为结构化数据）可为有限观察者"创造"结构性信息
- 信息排列顺序影响学习效果（"lost in the middle"效应），身份定义应放在 primacy 位置
- 作者实操：10,773 tokens always-on 压缩到 2,652 tokens（减少 75%），信息零丢失

这个理论为所有"少即是多"的上下文工程实践提供了形式化解释。

### 2. 渐进式披露：三层信息漏斗

[文件系统即数据库](../01-AI-Agents/Architecture/文件系统即数据库/index.md) 提出 Personal Brain OS 的渐进式披露架构，被后续多篇文章引用为通用范式：

| 层级 | 内容 | 加载时机 | 示例 |
|------|------|----------|------|
| Level 1（路由层） | 轻量 SKILL.md，告知哪个模块相关 | 始终加载 | 几十 tokens 的描述符 |
| Level 2（模块指令） | 40-100 行领域指令 | 任务匹配时加载 | CONTENT.md / NETWORK.md |
| Level 3（实际数据） | JSONL 日志、YAML 配置、研究文档 | 需要时逐行读 | contacts.jsonl / decisions.jsonl |

指令层级体系与之配套：仓库级（CLAUDE.md）→ 大脑级（AGENT.md，含决策表）→ 模块级（每个目录独立指令），消除跨模块指令冲突。

关键设计原则：
- **格式匹配功能**：JSONL 用于日志（追加安全）、YAML 用于配置（支持注释）、Markdown 用于叙事（LLM 原生可读）
- **情景记忆 > 事实存储**：不只存事实，还存判断（decisions.jsonl 记录推理过程和替代方案）
- **Append-only 不可妥协**：防止 Agent 意外覆盖历史数据
- **教训**：初版 schema 15+ 字段太多（Agent 会强填空字段），精简到 8-10 个必要字段

[字节 OpenViking 记忆架构](../01-AI-Agents/Memory/字节OpenViking记忆架构/index.md) 进一步把长期层拆成 L0/L1/L2：每个目录放一个 `.abstract` 索引（100 tokens），Agent 先读目录索引再按需打开子文件——"先看目录 → 定位章节 → 按需读详情"，节省日常场景 10 倍以上 token。

### 3. System Prompt 九层分层设计

OpenClaw 的 System Prompt 采用三区九层架构，是渐进式披露在 prompt 工程中的直接应用：

**三个控制域：**
- **框架层（Layer 1-6，~26-29KB）**：所有 Agent 共享，框架自动生成——核心身份(8KB) / 工具定义(12KB) / 技能注册(5KB) / 模型别名(2KB) / 协议规范(3KB) / 运行时信息(2KB)
- **用户层（Layer 7-8，~14-17KB）**：每个 Agent 独立配置——工作区文件(IDENTITY/SOUL/USER/MEMORY) / Bootstrap Hook
- **运行时层（Layer 9，~3KB）**：每次请求动态注入——消息元信息、发送者、对话历史

> 科普向拆解见 [SystemPrompt 九层塔解析](../01-AI-Agents/Architecture/SystemPrompt九层塔解析/index.md)；技术向配置详解见 [SystemPrompt 九层架构详解](../01-AI-Agents/Architecture/SystemPrompt九层架构详解/index.md)

**Layer 8 四种 Hook 机制**提供了动态注入的灵活性梯度：
| Hook 类型 | 适用场景 |
|-----------|----------|
| `bootstrap-extra-files` | 简单追加文件（项目文档） |
| `agent:bootstrap` | 条件判断、增删改 bootstrapFiles 数组 |
| `before_prompt_build` | 最终 prompt 前注入实时上下文或覆盖系统提示词 |
| `bootstrapMaxChars` | 控制字符预算（单文件默认 20K，总计默认 150K） |

**反模式**：重复框架已知信息、把 Skill 详情复制到 Workspace Files、Hook 中执行耗时操作、使用过多修辞装饰语言。

### 4. TELOS：十维身份基础设施

[万字提示词造数字灵魂](../01-AI-Agents/Architecture/万字提示词造数字灵魂/index.md) 提出 PAI（Personal AI Infrastructure）范式——AI 不是自动售货机（无状态、用完即弃），而是操作系统（持久、个性化、可编程、可版本控制）。

TELOS 系统用 10 个 Markdown 文件构建 AI 的"数字身份"：core-identity / values / background / skills / communication-style / goals / knowledge-domains / work-approach / relationships-context / interests。这些文件不是一次性问卷，而是**持续进化的档案**。

工程原则三支柱：
1. **确定性**：配置文件化、交互可回放、版本控制变更
2. **模块化**：TELOS / Memory / Hooks / Skills / Tools 各自独立可替换
3. **可追溯性**：纯文本格式（MD/YAML/JSON），可 diff、可 grep

已知挑战：冷启动需深度自我反思、持久记忆增加 API 成本、遗忘策略尚在探索。

### 5. 上下文预算管理

[ClaudeCode 架构与治理](../03-Claude-Code/Tutorials/ClaudeCode架构与治理/index.md) 给出了最具体的上下文预算分析：

| 开销类型 | 消耗 | 示例 |
|----------|------|------|
| 固定开销 | 15-20K tokens | 系统指令 + Skill 描述符 + MCP 工具定义 + LSP 状态 |
| 半固定开销 | 5-10K tokens | CLAUDE.md + Memory |
| 动态可用 | 160-180K tokens | 代码读取、对话、工具调用结果 |

5 个 MCP Server 光工具定义就吃掉约 25K tokens（12.5%）——这在需要读大量代码的场景中是关键瓶颈。

**分层加载策略**：始终常驻（CLAUDE.md：项目契约、构建命令）→ 按路径加载（rules/：语言/目录规则）→ 按需加载（Skills：工作流/领域知识）→ 隔离加载（Subagent：大量探索）→ 完全不进上下文（Hooks：确定性脚本/审计/阻断）。

**三种压缩策略**：滑动窗口（丢弃旧消息）、LLM 摘要（保留决策丢细节）、工具结果替换（占位符替换）。压缩时最常丢失的是架构决策和约束理由——因此必须在 CLAUDE.md 中写明 Compact Instructions，定义保留优先级：**架构决策 > 已修改文件 > 验证状态 > TODO > 工具输出**。

**Prompt Caching 的架构影响**：缓存按前缀匹配，顺序至关重要——System Prompt（静态）→ Tool Definitions（静态）→ Chat History（动态）→ 当前输入。会话中途切模型导致缓存全失效。工具的延迟加载（defer_loading）让轻量 stub 常驻，完整 schema 按需拉取，保持缓存前缀稳定。

### 6. 语义检索替代全量注入

[QMD 搜索与 ZenMux 省 Token](../04-AI-Infrastructure/Optimization/QMD搜索与ZenMux省Token/index.md) 将"背全书"改为"查字典"：

- **QMD**（Shopify 创始人 Tobi 开发）：按 Markdown 结构智能分块，三种检索模式（BM25 / 向量 / 混合+重排），以 sidecar 方式后台运行自动增量更新
- **实测**：50K Token 历史压缩到每轮约 6K，10 轮省 88%，100 轮省 95%+
- **组合 ZenMux**：综合约 20 倍费用节省（QMD 4x 压缩 × ZenMux 5x 价格杠杆）
- **隐藏收益**：上下文精简后模型更"清醒"，减少幻觉

关键前提：必须在 AGENTS.md 中写规则强制 Agent **先 query 再读**，否则它会暴力读整文件，语义检索形同虚设。

### 7. 跨会话状态传递

[Agent 工作交接继任 Prompt](../01-AI-Agents/Workflows/Agent工作交接继任Prompt/index.md) 解决长对话退化后的连续性问题：在退出前让当前 Agent 生成结构化交接文档（`./{yymmdd}-handoff.md`），关键约束是明确告知"继任者看不到当前上下文"，迫使输出自包含的完整摘要。

[ClaudeCode 架构与治理](../03-Claude-Code/Tutorials/ClaudeCode架构与治理/index.md) 进一步系统化：长任务拆为 Initializer Agent（只跑一次，生成 feature-list.json + 初始 commit）和 Coding Agent（可重入），状态通过 `claude-progress.txt` 和 git 传递——**真正跨 session 传递状态的不是上下文窗口，而是文件系统中的进度文件和 git 记录。**

### 8. 五层信息价值链

[五层信息价值链情报系统](../01-AI-Agents/Architecture/五层信息价值链情报系统/index.md) 将 Context Engineering 应用于信息过滤场景，提出"不存在信息过载，只存在过滤失败"：

1. **感知层（Sense）**：多源接入 + 语义去重（SemHash）
2. **过滤层（Filter）**：五维质量评分（证据、信誉、新颖度、一致性、时效性）
3. **关联层（Connect）**：弱信号放大 + 非共识识别 + 二跳推理——最核心环节
4. **个性化层（Personalize）**：多维向量兴趣建模 + "品味发现"（刻意推送跨界内容避免茧房）
5. **激活层（Activate）**："So What"框架——分层格式（3 行推送 / 15 分钟晨报 / 长文图谱）

编排采用黑板模式（Blackboard Pattern）：6 个 Agent 围绕共享黑板协作（哨兵 / 仲裁者 / 织者 / 魔鬼代言人 / 裁缝 / 信使），而非线性 Pipeline。

### 9. 治理模式：三层叠加

[ClaudeCode 架构与治理](../03-Claude-Code/Tutorials/ClaudeCode架构与治理/index.md) 和 [Agent 原理架构与工程实践](../01-AI-Agents/Architecture/Agent原理架构与工程实践/index.md) 共同收敛到三层叠加治理：

| 层 | 机制 | 职责 | 例 |
|----|------|------|----|
| 声明层 | CLAUDE.md / AGENTS.md | 规则声明 | "提交前必须通过测试" |
| 工作流层 | Skills | 定义执行步骤 | 按什么顺序跑测试、如何修复 |
| 执行层 | Hooks | 硬性校验/阻断 | 关键路径拦截 |

三层少任何一层都有漏洞——只写规则 Claude 经常忽略，只靠 Hook 做不了细节判断。Agent 通用循环体本身不到 20 行代码，新能力只通过三种方式接入：扩展工具集、调整系统提示结构、把状态外化到文件。**Harness 比模型更关键**——约束编码化（Linter/CI）比约束文档化更可靠。

## 决策参考

| 场景 | 推荐方案 | 依据 |
|---|---|---|
| 信息量小（<5K tokens） | 全量注入 CLAUDE.md | 简单直接，无需基础设施 |
| 信息量中（5-50K） | 渐进式披露三层漏斗 | L1 路由常驻 + L2/L3 按需加载 |
| 信息量大（50K+） | QMD 语义检索 + 按需加载 | 实测省 88-95% token |
| 长对话退化 | 交接文档 + 可重入 Agent 设计 | 文件系统传递状态，不依赖压缩质量 |
| 多 Agent 场景 | 每个 Agent 独立上下文 + 文件共享 | 上下文窗口是零和博弈 |
| 上下文常被压缩丢失 | Compact Instructions 定义保留优先级 | 架构决策 > 文件 > 状态 > TODO > 输出 |
| Prompt Caching 命中率低 | 保持前缀稳定 + defer_loading | 中途切模型 = 缓存全失效 |

## 开放问题 / 演进方向

- **Epiplexity 的可操作化**：理论优美但目前缺少"给定一份 context 预测其对模型 X 的 epiplexity"的实用度量方法——如何从定性直觉变为定量优化？
- **自动化上下文预算分配**：当前的分层加载策略依赖人工设计，是否可能基于任务类型自动决定每层的 token 预算？
- **压缩算法的可控性**：LLM 摘要压缩丢失架构决策的问题只靠 Compact Instructions 缓解而非根治——需要更精确的"保留什么丢什么"的控制机制
- **跨平台 Context 协议**：OpenClaw 九层架构、Claude Code 六层架构、TELOS 十维模型各自独立——是否可能收敛为一个通用的 Context Schema？

## 相关概念页

- [[agent-memory]] — 记忆系统是 Context Engineering 的持久化子系统，三层记忆架构直接对应渐进式披露的三个层级
- [[openclaw]] — 九层 System Prompt 和 Skill 体系是 Context Engineering 在 OpenClaw 平台的具体实现
- [[token-optimization]] — QMD 语义检索和 ZenMux 是 Context Engineering 的成本优化维度
- [[system-prompt]] — System Prompt 设计是 Context Engineering 在 prompt 层面的专项实践

## 源文章清单

| # | 路径 | 贡献的观点 |
|---|---|---|
| 1 | `01-AI-Agents/Architecture/Agent信息经济学/index.md` | Epiplexity 理论、context 质量 > 数量、确定性变换创造结构性信息 |
| 2 | `01-AI-Agents/Architecture/文件系统即数据库/index.md` | 渐进式披露三层漏斗、格式匹配功能、情景记忆 vs 事实存储 |
| 3 | `01-AI-Agents/Architecture/五层信息价值链情报系统/index.md` | 五层价值链、黑板模式编排、弱信号放大 |
| 4 | `01-AI-Agents/Architecture/SystemPrompt九层塔解析/index.md` | 三区九层框架、变与不变分离 |
| 5 | `01-AI-Agents/Architecture/SystemPrompt九层架构详解/index.md` | 每层设计权衡、四种 Hook 机制、反模式 |
| 6 | `01-AI-Agents/Architecture/万字提示词造数字灵魂/index.md` | TELOS 十维身份档案、PAI 范式、工程三支柱 |
| 7 | `03-Claude-Code/Tutorials/ClaudeCode架构与治理/index.md` | 六层架构、上下文预算分析、压缩策略、Prompt Caching、三层治理 |
| 8 | `01-AI-Agents/Architecture/Agent原理架构与工程实践/index.md` | Agent 四层通用架构、循环体极简主义、ACI 工具设计 |
| 9 | `01-AI-Agents/Architecture/公司即文件系统/index.md` | 文件系统作为上下文接口、Unix 权限映射组织架构 |
| 10 | `04-AI-Infrastructure/Optimization/QMD搜索与ZenMux省Token/index.md` | QMD 语义检索实测数据、20 倍费用节省 |
| 11 | `01-AI-Agents/Workflows/Agent工作交接继任Prompt/index.md` | 跨会话交接文档、Prompt 自举方法 |
