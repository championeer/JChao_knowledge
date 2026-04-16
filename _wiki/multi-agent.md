---
title: 多 Agent 协作
slug: multi-agent
type: concept-page
status: active
aliases: [multi-agent, 多智能体, agent swarm, agent team, 多Agent协作, agent orchestration]
source_count: 10
last_updated: 2026-04-16
related_wikis: [openclaw, agent-memory, context-engineering, automation-workflows]
---

# 多 Agent 协作

> 综合 10 篇源文章的常青概念页。多 Agent 系统的编排、分工、路由、记忆共享和可靠性工程。最后更新：2026-04-16。

## TL;DR

本库的多 Agent 实践从六种协作模式中收敛到三条共识：**上下文窗口是零和博弈**（业务与代码上下文必须分层）、**分解粒度越细系统越可靠**（MAKER 数学证明 m=1 是唯一可行极端）、**人类角色从执行者转变为审批者**（给方向不给方法）。记忆共享是多 Agent 最难的子问题——"一次修正六个 Agent 更新"只能靠第三层长期记忆（如 Vertex Memory Bank）解决，工作记忆层无法自动传播。渐进式构建是所有文章的共识起点：1 Agent → bindings → N Agents，能用 bindings 解决的别创建新 Agent。

## 核心观点

- **上下文窗口是零和博弈**：业务上下文和代码上下文必须分层到不同 Agent，塞在一起两边都做不好——这是双层编排架构的根本理由
- **分解是第一性原理**：MAKER 的数学证明（MAD m=1）、Karpathy 的宏观委派、五种控制模式——粒度越细、Agent 越聚焦，系统越可靠
- **验证闭环不可或缺**：投票机制、三模型 Code Review、自动化测试——三种路径都拒绝"生成即完成"
- **错误是系统问题而非模型问题**：Harness 质量、工具定义、上下文管理的影响往往大于换更强的模型
- **记忆传播是最难子问题**：六个 Agent 收到同一个纠正的"day-two 问题"只能靠跨 Agent 长期记忆层解决
- **能用 bindings 解决的别创建新 Agent**：多 Agent 意味着多套记忆/上下文隔离，又慢又耗 token

## 证据与分主题

### 1. 六种协作模式谱系

本库记录了六种多 Agent 协作模式，复杂度和适用场景各异：

| 模式 | 架构 | 人类角色 | 典型场景 | 出处 |
|------|------|----------|----------|------|
| **星型拓扑** | 人类居中，Agent 各自独立 | 审阅-批准-执行 | 高管团队（CEO/COO/CMO/CFO） | [4人AI高管团队构建](../01-AI-Agents/Multi-Agent/4人AI高管团队构建/index.md) |
| **双层编排** | 编排器 + 执行 Agent 群 | 最终审核 | 软件开发（94次提交/天） | [OpenClaw-Agent-Swarm单人开发](../01-AI-Agents/Multi-Agent/OpenClaw-Agent-Swarm单人开发/index.md) |
| **路由分发** | 单 Bot + 群组路由 | 按需召唤 | Telegram 多角色客服 | [Telegram多角色群聊搭建](../02-AI-Skills-and-Plugins/Integrations/Telegram多角色群聊搭建/index.md) |
| **对等协作** | 协调者 + 专家团 | 深度在环 | 写作/内容生产 | [OpenClaw四兄弟写作实战](../05-AI-Applications/Content-Creation/OpenClaw四兄弟写作实战/index.md) |
| **人-系统协作** | 知识库 + Skills + CRON | 只做最终判断 | 投研业务 Agent 化 | [个人业务Agent升级指南](../01-AI-Agents/Workflows/个人业务Agent升级指南/index.md) |
| **统计投票** | 独立采样 + 多数投票 | 设计框架 | 百万步零错误任务 | [百万步LLM任务零错误](../06-LLM-Foundations/百万步LLM任务零错误/index.md) |

### 2. 双层编排架构：Swarm 模式详解

[OpenClaw-Agent-Swarm 单人开发](../01-AI-Agents/Multi-Agent/OpenClaw-Agent-Swarm单人开发/index.md) 展示了最成熟的多 Agent 开发架构：

**上层（编排器 Zoe）**：持有全部业务上下文（Obsidian vault 中的客户数据、会议记录、决策历史），负责任务分解、路由和失败恢复。

**下层（执行 Agent 群）**：Codex / Claude Code / Gemini 等，只持有代码上下文。每个 Agent 独立 git worktree + tmux session，物理隔离。

**关键工程细节：**
- 任务注册在 `.clawdbot/active-tasks.json`，cron 每 10 分钟通过脚本检查 tmux/PR/CI 状态（不轮询 Agent，避免 token 消耗）
- "完成定义"严格：PR 创建 + CI 通过 + 三模型 Code Review 全部通过
- 通过 tmux `send-keys` 实现任务中途重定向，不用杀掉 Agent 重启
- 失败时 Zoe 结合业务上下文重写 prompt（Ralph Loop V2），而非简单重试
- 按 Agent 特长路由：Codex 擅长后端/复杂推理（90% 任务），Claude Code 擅长前端/git，Gemini 擅长 UI

**物理约束**：5 个并行 Agent 各需独立 node_modules + 编译器，16GB RAM 不够用。

### 3. 渐进式配置路径

[OpenClaw 多 Agent 配置实战](../01-AI-Agents/Multi-Agent/OpenClaw多Agent配置实战/index.md) 提出四级升级路径：

```
1 Agent : 1 场景（基础）
  → 1 Agent : N 场景（bindings，性价比最高）
    → N Agents : 1 用户（职责划分）
      → N Agents : N 用户（多人路由）
```

**核心概念区分：**
- **Agent**：独立 workspace、SOUL.md、MEMORY.md、session，有完整身份
- **Binding**：同一 Agent 在不同频道使用不同模型/行为，共享 workspace，**最省 token**

**路由匹配优先级**（最具体原则）：peer > guildId > accountId > channel > 默认 Agent

**Agent 间通信三种方式：**
| 方式 | 机制 | 风险 |
|------|------|------|
| `sessions_send` | 跨 Session 直接通信 | 推荐，需显式开启 `agentToAgent` |
| 频道内 @ | Agent 在同一频道互相回复 | **无限循环**（A@B → B@A → ...） |
| 渠道隔离 | 不同 Channel 各自独立 | 无协作能力 |

**权限控制两层**：工具限制（`tools.allow/deny`，软性）+ Docker 沙箱（硬性隔离，`docker.binds` 精确挂载）。Elevated Mode 给白名单用户开"穿透沙箱"后门。

**实战经验**：5 Agent 配置的核心思路——"能省则省，该强则强"，日常 Sonnet 重要工作 Opus，省 40% token。

### 4. 记忆共享与传播

多 Agent 记忆是最难的子问题。[全天候 Agent 团队记忆管理](../01-AI-Agents/Memory/全天候Agent团队记忆管理/index.md) 揭示了核心挑战——**day-two 问题**：告诉 Kelly "不要用 emoji"，第二天 Rachel 的 LinkedIn、Pam 的 newsletter、Ross 的稿子全是 emoji——同一个纠正被做了六次。

**三层记忆架构解决方案：**

| 层 | 内容 | 范围 | 持久性 |
|----|------|------|--------|
| 工作记忆 | SOUL.md / MEMORY.md / 每日日志 | 单 Agent | 跨 session |
| 会话记忆 | 对话 + cron 输出 | 单 session | 刻意短暂 |
| 长期记忆 | Vertex AI Memory Bank | **全部 Agent 共享** | 永久 |

**传播链路**：人类告诉某 Agent → 该 Agent 记入日志（工作记忆）→ 提炼进 MEMORY.md → Memory Bank 自动捕获事实（长期记忆）→ 所有 Agent 每次行动前自动召回。**一次修正，六个 Agent 更新。**

**冗余是设计意图**：同一修正存三处（日志 / MEMORY.md / Memory Bank），某层失效时其他层兜底。

**失败路径**：自托管 Mem0 + Ollama + SQLite 频繁崩溃；OpenClaw 内置 memory-core 索引原始记录导致噪声过大（"检查 cron 状态...一切正常"被反复召回）。最终方案：将"捕获"（LLM 提取事实）和"召回"（相似性搜索）分离。

> 记忆系统的完整分析见 [[agent-memory]]

### 5. 对等协作：角色化 Agent 团队

[OpenClaw 四兄弟写作实战](../05-AI-Applications/Content-Creation/OpenClaw四兄弟写作实战/index.md) 展示了"协作空间"模式——区别于"辩论室"和"流水线"，核心是长期陪伴与持续进化：

- **协调者**（黄家1号）：接收需求、分解任务、路由分配、验收结果
- **工程师**（技术顾问）：写代码、搞数据、造工具
- **创意官**（创意伙伴）：写文案、做内容、调语气
- **策略顾问**（智库）：审稿、质疑、把关——专门负责说"这里不对"

每个 Agent 运行独立 Gateway + workspace，通过 `sessions_send` 异步通信。SOUL.md 定义人格需反复微调（改了三四版），角色边界必须写明确否则 Agent 会越界。

### 6. 业务 Agent 化：三层金字塔

[个人业务 Agent 升级指南](../01-AI-Agents/Workflows/个人业务Agent升级指南/index.md) 展示了不同于多 Agent 对等协作的模式——人与 Agent 系统的深度协作：

**知识库层**（记忆）→ **Skills 层**（判断框架）→ **CRON 层**（自动执行）

实战成果：投研工作从 6 小时/天降到 2 小时，成本 $500/月替代 5 人团队。2 月初市场暴跌前 48 小时成功预警，避免约 30% 回撤。核心是将隐性判断标准显性化为结构化 Skills。

### 7. 极端可靠性：MAKER 的数学证明

[百万步 LLM 任务零错误](../06-LLM-Foundations/百万步LLM任务零错误/index.md) 从理论层面证明了多 Agent 投票纠错的可行性：

**MDAP 三大支柱：**
1. **最大代理分解（MAD, m=1）**：每个微代理只处理一个原子操作，上下文极度精简
2. **First-to-ahead-by-k 投票**：独立采样多次，某答案领先 k 票即胜出，成本仅 O(s ln s)
3. **红旗标记**：输出过长或格式错误直接丢弃——"坏行为在 LLM 中是相关联的"

关键发现：小型非推理模型（如 gpt-4.1-mini）的每步错误率与大型模型相当但成本远低，性价比最优。**相关错误是最大威胁**——红旗标记的主要价值不在提升单步成功率 p，而在打断错误的相关性链条。

### 8. Karpathy 协作十则

[Karpathy-AI-Agent 协作十则](../01-AI-Agents/Workflows/Karpathy-AI-Agent协作十则/index.md) 提供了宏观层面的协作心法：

- 从"写代码"转向"委派功能"，人的价值在于不可约的创造性洞察
- 并行非冲突任务，屏幕平铺，各自独立功能
- 失败时先假设是"技能问题"（prompt / AGENTS.md），而非模型本身
- 模型能力呈锯齿状——可验证任务强，软判断弱，围绕盲点设计工作流
- 指令文件（ProgramMD）视为可调代码，A/B 迭代优化
- 文档为 Agent 而非人类编写：Markdown 优先

### 9. 工程基础设施

[Agent 原理架构与工程实践](../01-AI-Agents/Architecture/Agent原理架构与工程实践/index.md) 提供了多 Agent 的系统级工程指南：

**五种控制模式覆盖绝大多数场景：**
| 模式 | 适用 | 示例 |
|------|------|------|
| 提示链 | 线性流程 | 翻译 → 校对 → 排版 |
| 路由 | 分类分发 | 客服分流 |
| 并行/投票 | 独立同质任务 | MAKER 投票 |
| 编排器-工作者 | 异构协作 | Swarm 模式 |
| 评估器-优化器 | 迭代改进 | autoresearch |

**多 Agent 组织原则：**
- 先隔离再协作：JSONL inbox 协议通信、Worktree 隔离文件修改、任务图管理依赖
- 子 Agent 有独立 messages[]，只回传摘要；最小系统提示不带 Skills 和 Memory
- 幻觉会互相放大——需要交叉验证打断错误传播链
- 深度限制防无限递归，先有协议和任务图再谈并行

## 决策参考

| 场景 | 推荐模式 | 依据 |
|---|---|---|
| 多场景但想省 token | 1 Agent + N Bindings | 共享 workspace，最省 token |
| 角色明确的团队协作 | 星型拓扑（高管团队） | 简单直观，Agent 间不直接通信 |
| 软件开发密集 | 双层编排（Swarm） | 业务上下文与代码上下文分离 |
| 内容生产 | 对等协作（四兄弟） | SOUL.md 人格 + 长期进化 |
| 多渠道客服 | 路由分发（Telegram） | 15 分钟配置，极简架构 |
| 投研/业务自动化 | 三层金字塔 | 知识库 + Skills + CRON |
| 需要极端可靠性 | MAKER 统计投票 | 数学证明 O(s ln s) 成本 |
| Agent 间修正不传播 | 接入第三层长期记忆 | Vertex Memory Bank / 向量图谱 |

## 开放问题 / 演进方向

- **Agent 间通信协议标准化**：`sessions_send`、JSONL inbox、频道 @、文件系统共享——四种方式各有优劣但缺少统一的 Agent-to-Agent 通信协议标准
- **动态 Agent 编排**：当前所有编排都是静态定义的（配置文件 / 代码），缺少基于任务复杂度自动决定 Agent 数量和分工的动态编排能力
- **成本模型**：多 Agent 的 token 消耗和 API 成本缺少系统性的成本预测模型——何时多 Agent 的效率提升抵不过额外的 token 开销？
- **跨平台 Agent 协作**：OpenClaw Agent 与 Claude Code Agent 的协作（Swarm 模式）目前靠 tmux + git worktree 手工串联，缺少原生的跨平台编排协议

## 相关概念页

- [[agent-memory]] — 多 Agent 记忆共享的三层架构，day-two 问题的完整分析
- [[openclaw]] — 多 Agent 配置的具体平台实现（路由、bindings、权限）
- [[context-engineering]] — 上下文窗口是零和博弈的理论基础，渐进式披露的分层策略
- [[automation-workflows]] — CRON 子系统和自动化执行是多 Agent 场景的常见触发机制

## 源文章清单

| # | 路径 | 贡献的观点 |
|---|---|---|
| 1 | `01-AI-Agents/Multi-Agent/4人AI高管团队构建/index.md` | 星型拓扑、ROI 顺序构建、"审批者"角色转变 |
| 2 | `01-AI-Agents/Multi-Agent/OpenClaw-Agent-Swarm单人开发/index.md` | 双层编排、上下文分离、三重 Code Review、Ralph Loop V2 |
| 3 | `01-AI-Agents/Multi-Agent/OpenClaw多Agent配置实战/index.md` | 四级升级路径、Agent vs Binding、路由优先级、权限两层 |
| 4 | `01-AI-Agents/Memory/全天候Agent团队记忆管理/index.md` | day-two 问题、三层记忆传播、噪声是记忆系统杀手 |
| 5 | `05-AI-Applications/Content-Creation/OpenClaw四兄弟写作实战/index.md` | 协作空间模式、SOUL.md 人格微调、sessions_send 异步通信 |
| 6 | `02-AI-Skills-and-Plugins/Integrations/Telegram多角色群聊搭建/index.md` | 单 Bot 多群组路由、5 步配置、requireMention 防冲突 |
| 7 | `01-AI-Agents/Workflows/个人业务Agent升级指南/index.md` | 三层金字塔、$500 替代 5 人团队、判断标准显性化 |
| 8 | `06-LLM-Foundations/百万步LLM任务零错误/index.md` | MAKER/MDAP、MAD m=1、投票纠错 O(s ln s)、红旗标记 |
| 9 | `01-AI-Agents/Workflows/Karpathy-AI-Agent协作十则/index.md` | 委派思维、并行非冲突、锯齿状能力、ProgramMD 迭代 |
| 10 | `01-AI-Agents/Architecture/Agent原理架构与工程实践/index.md` | 五种控制模式、Harness > 模型、子 Agent 隔离原则 |
