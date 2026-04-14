---
title: Agent 记忆架构
slug: agent-memory
type: concept-page
status: active
aliases: [agent memory, 记忆系统, 记忆架构, memory architecture, 智能体记忆]
source_count: 10
last_updated: 2026-04-14
related_wikis: [context-engineering, token-optimization, multi-agent]
---

# Agent 记忆架构

> 综合 10 篇源文章的常青概念页。Agent 的记忆不在"脑子"里，而在文件系统上。最后更新：2026-04-14。

## TL;DR

LLM Agent 的上下文窗口（context window）不是记忆，**文件系统才是记忆**：所有重要事实必须实时落盘，Agent 每次启动从文件读取状态，不依赖模型的"记得去检查"。本库的共识是**三层记忆架构**——短期工作台（NOW/SOUL）+ 中期日志（daily notes）+ 长期知识库（MEMORY/lessons/decisions），叠加 P0/P1/P2 生命周期与语义检索（QMD/向量图谱）实现写入-提炼-检索-遗忘的闭环。分歧主要在于检索层该用"静态文件 + 工具召回"还是"隐式 hook + 向量图谱自动更新"。

## 核心观点

- **文件 = 事实来源**：你没写进文件的东西 = 你从来不知道的东西；context window 只是工作台，磁盘才是仓库
- **三层架构是共识**：几乎所有实践者都收敛到"短期状态 + 中期日志 + 长期知识"三层结构，只是命名不同（NOW/SOUL/MEMORY vs L0/L1/L2 vs Working/Session/Long-term）
- **写入 ≠ 检索**：写入要全、要结构化、要打时间戳；检索要精、要按需、要用语义搜索而不是整文件塞入
- **生命周期比容量更重要**：P0/P1/P2 分级 + TTL + 自动归档，否则 MEMORY.md 会从精炼的 20 条膨胀到 100+ 条
- **记忆会腐化**：设计完美 ≠ 运行完美，没有周度体检的记忆系统一定会产生死链、重复索引、过期标签不生效等暗伤
- **多 Agent 需要第三层传播**：六个 Agent 收到同一个纠正的"day-two 问题"只能靠跨 Agent 的长期记忆层（Memory Bank / 向量图谱）解决，工作记忆层无法自动传播

## 证据与分主题

### 1. 三层架构是什么：短期 / 中期 / 长期的职责划分

本库所有一线实践者几乎独立收敛到相同的三层模型，差异仅在命名和具体实现：

- **短期层（工作台 / 状态仪表盘）**：NOW.md / SOUL.md / SESSION-STATE.md，是"Compaction 的救生筏"，每次 heartbeat **覆写**，只保留当天的聚焦项与阻塞。详见 [OpenClaw 记忆管理实战指南](../01-AI-Agents/Memory/OpenClaw记忆管理实战指南/index.md) 和 [全天候 Agent 团队记忆管理](../01-AI-Agents/Memory/全天候Agent团队记忆管理/index.md)。
- **中期层（每日日志）**：`memory/YYYY-MM-DD.md`，**追加式**流水，事件实时入库，是原始素材池。由 cron job 按晚 11 点触发蒸馏任务捕获当天所有 session（见 [OpenClaw 永久记忆搭建](../01-AI-Agents/Memory/OpenClaw永久记忆搭建/index.md)）。
- **长期层（知识库）**：MEMORY.md + INDEX.md + `lessons/` `decisions/` `people/` 子目录，结构化的可复用知识。关键设计是 INDEX.md 带**健康度指标**（优先级、status、last_verified），让 Agent 扫描时立即判断哪些知识可信。

[字节 OpenViking 记忆架构](../01-AI-Agents/Memory/字节OpenViking记忆架构/index.md) 进一步把长期层拆成 L0/L1/L2：每个目录放一个 `.abstract` 索引（100 tokens），Agent 先读目录索引再按需打开子文件，"先看目录 → 定位章节 → 按需读详情"，节省日常场景 10 倍以上 token。

三层之间的信息流是**向下提炼**：对话 → 日志（保留细节）→ 知识库（抽取可复用教训）→ 归档（.archive/ 冷存储，以 `.` 开头让 QMD 不再索引）。

### 2. 文件记忆 vs 向量检索 vs 向量图谱：什么时候用什么

本库四种检索方案存在明显张力：

- **纯文件 + 静态注入**（OpenClaw 默认）：会话开始时把 MEMORY.md + 最近两天 daily log 一次性塞进 context。优点简单，缺点是"一个文件 8000+ tokens 全读"、压缩后就丢。
- **文件 + 语义搜索工具**（QMD / memory_search）：写入仍是 Markdown 单一事实源，但读取走 BM25 + 向量 + rerank 的语义召回，只把"字典相关那一页撕下来贴进去"。[OpenClaw QMD + ZenMux 省 Token](../04-AI-Infrastructure/Optimization/QMD搜索与ZenMux省Token/index.md) 实测 50k 对话历史从全量 500k tokens/10 轮降到 60k tokens/10 轮，省 88%。规则必须写进 AGENTS.md 强制 Agent **先 query 再读**，否则它会暴力读整文件。
- **向量图谱 + Hook 隐式捕获**（supermemory / Vertex Memory Bank）：抛弃"工具调用"模型，用 hook 在后台自动从对话抽取事实、去重、随时间衰减遗忘。[OpenClaw 记忆问题分析](../01-AI-Agents/Memory/OpenClaw记忆问题分析/index.md) 在 Memory Bench 上给出的对比数据是 Filesystem 54.2% / RAG 58.3% / Supermemory 85.9%，并指出工具式召回"counter-intuitively 反而更费 token"，因为 tool call 本身有开销。
- **按需加载索引**（OpenViking `.abstract` + Personal Brain OS Progressive Disclosure）：不做向量，而是人为分层——Level 1 路由文件（始终加载）→ Level 2 模块指令（任务匹配时加载）→ Level 3 数据文件（实际需要时逐行读），见 [文件系统即数据库](../01-AI-Agents/Architecture/文件系统即数据库/index.md)。

这四种方案并非互斥：实战上 QMD 的文件层 + supermemory 的向量图谱层 + `.abstract` 的按需加载层可以叠加使用。

### 3. 记忆腐化的典型症状与防护清单

[OpenClaw 记忆维护实录](../01-AI-Agents/Memory/OpenClaw记忆维护实录/index.md) 给出了本库最完整的"记忆体检清单"，其"六个暗伤"是所有实践者都会踩的坑：

1. **语义误分类**：自动分类把"投资策略"和"内容策略"归到同一分区——语义分类 ≠ 逻辑分类，80% 自动化 + 20% 人工审核
2. **多处维护同一索引**：X 文章链接同时存在于三个文件，永远有一份 stale；修法是砍到**单一主索引**，其他位置只放指针
3. **写死的数字假设有机制更新**："粉丝数 1,680"以为有机制自动刷新其实从来没有——假设性腐化最隐蔽
4. **过期标签缺日期**：`[P1]` 没带日期，janitor 算不出 TTL，整个清理机制跑了一个月零效果——"设计了但没跑通"
5. **脚本路径无验证**：TOOLS.md 里的死链 Agent 不会报错，会用"补全"执行不存在的命令——**文档里的死链比没有文档更危险**
6. **操作手册从未抽检**：19 份 procedure 写完就没人回看，UI 改了步骤没同步

防护手段：周度健康检查（脚本路径存在性、手册随机抽检、过期数据自动归档）+ 三层兜底（prompt 硬格式 / AGENTS.md 硬规则 / 后处理脚本兜底）+ **复发追踪计数器**（失败两次直接升级为脚本硬约束，"规则从知道到做到差的不是自律是硬约束"）。

容量上 [全天候 Agent 团队记忆管理](../01-AI-Agents/Memory/全天候Agent团队记忆管理/index.md) 报告了另一个失败模式：Kelly 的 daily log 一度达 161,000 tokens，输出质量直接崩溃——"读了太多历史，没有剩余空间做实际工作"——**更多记忆并非总是更好，垃圾回收本身就是设计**。

### 4. 多 Agent 如何共享与传播记忆

[全天候 Agent 团队记忆管理](../01-AI-Agents/Memory/全天候Agent团队记忆管理/index.md) 提出了多 Agent 场景特有的 **"day-two 问题"**：六个 Agent 跑 cron，"不要用 emoji"告诉 Kelly 后，Rachel 的 LinkedIn、Pam 的 newsletter、Ross 的稿子第二天还是全是 emoji——**同一个纠正被做了六次**。

三层架构中只有**第三层长期记忆**能解决传播问题。作者的方案是 Google Vertex AI Memory Bank 插件：

- **Auto-capture**：用 LLM 从每次对话抽取事实并存储（不是存原始 transcript，[OpenClaw 记忆问题分析](../01-AI-Agents/Memory/OpenClaw记忆问题分析/index.md) 说"存原始 transcript 会召回运维噪音如'cron 检查通过'"）
- **File sync**：监视 21 个工作区文件，变更自动同步
- **Auto-recall**：每次 Agent turn 前用相似性搜索拉取 top-10 最相关记忆

信息流是**同一纠正存三处服务三目的**：daily log（近期上下文）+ MEMORY.md（本 Agent 启动注入）+ Memory Bank（跨 Agent 传播）。冗余是刻意设计——"一层失效其他层兜底"。

这个场景下单靠文件方案不够：文件方案依赖每个 Agent 启动时**读到同一份 MEMORY.md**，而六个 Agent 各有各的 SOUL/MEMORY，修正 Kelly 的 MEMORY 不会自动同步到 Rachel。

### 5. Token 优化与记忆系统的交叉点

记忆架构本质上就是 **context engineering** 的一个子问题——怎么让 Agent 在固定的注意力预算内拿到最相关的信息。本库在这一交叉点上给了三个可量化结论：

- **QMD 语义搜索**：50k 对话历史场景，10 轮对话从 500k tokens 降到 60k，**省 88%**（[QMD + ZenMux](../04-AI-Infrastructure/Optimization/QMD搜索与ZenMux省Token/index.md)）
- **.abstract 按需加载**：日常场景 token 节省 **10 倍以上**（[字节 OpenViking](../01-AI-Agents/Memory/字节OpenViking记忆架构/index.md)）
- **本地 memos 插件**：节省约 **35.24%** 记忆 token，准确率比 OpenAI Memory 高 43.70%，并自动把重复任务沉淀为 Skill（[OpenClaw 本地记忆系统](../01-AI-Agents/Memory/OpenClaw本地记忆系统/index.md)）

共同机制是三条：(1) 把长 MEMORY.md 从 session 启动的"静态注入"变成"查询时按需拉取"；(2) 用 embedding 模型和摘要模型代替主力大模型做记忆处理（硅基流动 bge-m3 + deepseek-chat 远比 Opus 便宜）；(3) 注意力有限 + U 型记忆曲线决定了"context 越大 ≠ 效果越好"——[文件系统即数据库](../01-AI-Agents/Architecture/文件系统即数据库/index.md) 强调 token position 会影响召回概率，塞太多反而稀释关键信息的权重。

[Agent 工作交接继任者 Prompt](../01-AI-Agents/Workflows/Agent工作交接继任Prompt/index.md) 则给出了记忆系统失效时的**降级方案**：当对话太长、幻觉累积时，让当前 Agent 写一份 `./{yymmdd}-handoff.md` 交接摘要给下一个会话——这是人工触发的"一次性长期记忆"，本质上是对记忆架构的兜底。

## 决策参考

### 什么时候用什么记忆方案

| 场景 | 推荐方案 | 依据 |
|---|---|---|
| 单 Agent + 个人项目 + <30 天历史 | 纯文件三层（NOW + daily + MEMORY）| 简单、可读、git 版本控制、门槛最低 |
| 单 Agent + 长历史 + 高 token 成本 | 文件三层 + QMD 语义搜索 | 省 88% token，单一事实源仍在 Markdown |
| 目录内子文件多、按主题分散 | 文件三层 + `.abstract` 索引（OpenViking 模式） | 先读 100 tokens 目录，再按需打开 |
| 多 Agent 协作 + 纠正需传播 | 文件三层 + Vertex Memory Bank / supermemory 向量图谱 | 只有长期层能跨 Agent 传播 |
| 知识频繁更新、需要温度衰减 | 向量图谱 + hook 隐式捕获 | 文件方案不会自动遗忘，静态 markdown 会腐化 |
| 对话已炸、准备开新 session | Handoff prompt 写 `handoff.md` | 人工触发的一次性长期记忆兜底 |

### 写入规则快速检查表

- [ ] 所有重要信息实时写文件，不依赖"记得去检查"
- [ ] 短期层唯一覆写；中期/长期追加式（append-only），JSONL 更安全
- [ ] 每条长期记忆带 frontmatter：priority（🔴🟡⚪）、status、last_verified、tags
- [ ] TTL 规则：P0 永久、P1 90 天、P2 30 天，janitor 自动归档
- [ ] 归档目录以 `.` 开头，让索引器跳过
- [ ] AGENTS.md 强制规则：Never read MEMORY.md in full；先 query 再 get；写入后立即 `qmd update && qmd embed`
- [ ] 周度体检：路径存在性、stale 指标、手册抽检、复发计数器

## 开放问题 / 演进方向

- **文件 vs 向量图谱之争**：[OpenClaw 记忆问题分析](../01-AI-Agents/Memory/OpenClaw记忆问题分析/index.md) 的 Memory Bench 给出 Supermemory 85.9% vs Filesystem 54.2% 的数据，暗示文件方案天花板较低；但该数据来自 supermemory 团队自己的 benchmark，其他文章（如 [实战指南](../01-AI-Agents/Memory/OpenClaw记忆管理实战指南/index.md)）坚持"可读性 / 可调试性 / git 友好"的文件派立场。**本库暂无文章用第三方 benchmark 同时测试两种方案**，选型仍需实测。
- **遗忘机制缺失**：多篇文章用 P0/P1/P2 + TTL 近似实现遗忘，但只有 supermemory 系方案提到"时间衰减的向量遗忘"。**本库暂无文章系统讨论"主动遗忘 vs 被动归档"的差别与设计空间**。
- **写入噪音过滤**：[记忆问题分析](../01-AI-Agents/Memory/OpenClaw记忆问题分析/index.md) 指出"存原始 transcript 会召回运维噪声（cron 检查通过）"，[记忆维护实录](../01-AI-Agents/Memory/OpenClaw记忆维护实录/index.md) 也提到"自动语义分类会错放"——**"什么该记、什么不该记"的抽取规则**在本库仍缺乏系统性方法论。
- **Benchmark 与评估**：除 Memory Bench 一次外，本库**暂无文章报告自建记忆系统的召回率/准确率/延迟等定量指标**，绝大多数判断停留在"感觉好多了""零失忆"层面。
- **多 Agent 记忆一致性**：[全天候 Agent 团队](../01-AI-Agents/Memory/全天候Agent团队记忆管理/index.md) 承认"同一纠正存三处"是刻意冗余，但没讨论**当三处出现冲突时谁胜出**。分布式系统的一致性问题在多 Agent 记忆场景中尚未被本库任何文章触及。
- **记忆的所有权与隐私**：[记忆维护实录](../01-AI-Agents/Memory/OpenClaw记忆维护实录/index.md) 结尾引用的"Claw 了解你多少，这些了解属于谁"是一个悬而未决的议题，**本库暂无文章讨论记忆数据的导出/迁移/销毁协议**。

## 相关概念页

- [[context-engineering]] — 记忆架构是 context engineering 的具体实现；"注意力预算 + 渐进式披露"是两者共同底层
- [[token-optimization]] — QMD/按需加载/embedding 模型替换都是记忆系统的副产品
- [[multi-agent]] — "day-two 问题"和跨 Agent 记忆传播是多 Agent 架构特有的挑战

## 源文章清单

| # | 路径 | 贡献的观点 |
|---|---|---|
| 1 | `01-AI-Agents/Memory/OpenClaw永久记忆搭建/index.md` | 三层 cron 架构（Daily 11pm + Weekly Sunday + Hourly micro-sync）+ 强制 qmd query 不读全文件的 AGENTS.md 规则 |
| 2 | `01-AI-Agents/Memory/OpenClaw记忆管理实战指南/index.md` | 完整的三层架构规范（NOW/daily/INDEX）、frontmatter schema、目录结构、.archive 冷存储、信息向下提炼流程图 |
| 3 | `01-AI-Agents/Memory/全天候Agent团队记忆管理/index.md` | 多 Agent "day-two 问题"；Working/Session/Long-term 三层中只有第三层能跨 Agent 传播；同一纠正存三处的冗余设计 |
| 4 | `01-AI-Agents/Memory/OpenClaw记忆问题分析/index.md` | 批评文件 + 工具式召回"反而更费 token"；Memory Bench 数据 Filesystem 54.2% / RAG 58.3% / Supermemory 85.9%；遗忘机制的价值 |
| 5 | `01-AI-Agents/Memory/OpenClaw记忆维护实录/index.md` | "设计完美 ≠ 运行完美"；记忆腐化的六个暗伤；周度健康检查 + 复发计数器 + 三层兜底修复方法 |
| 6 | `01-AI-Agents/Memory/字节OpenViking记忆架构/index.md` | L0/L1/L2 分层 + `.abstract` 目录索引 + "P + L 互补"（生命周期 × 检索层级）；token 节省 10x |
| 7 | `01-AI-Agents/Memory/OpenClaw本地记忆系统/index.md` | memos 本地插件方案；embedding 模型用 bge-m3 + 摘要用 deepseek-chat；自动把重复任务沉淀为 Skill；token 省 35% |
| 8 | `04-AI-Infrastructure/Optimization/QMD搜索与ZenMux省Token/index.md` | QMD 核心原理"撕字典那一页"；BM25 + 向量 + rerank 三种模式；实测 50k 对话省 88% token |
| 9 | `01-AI-Agents/Architecture/文件系统即数据库/index.md` | 文件系统即数据库；注意力预算 + U 型记忆曲线；渐进式披露三层；JSONL append-only 防止历史覆写；episodic memory（experiences/decisions/failures） |
| 10 | `01-AI-Agents/Workflows/Agent工作交接继任Prompt/index.md` | 对话过长的降级方案：让当前 Agent 写 `handoff.md` 交接给下一会话；记忆系统失效时的人工兜底 |
