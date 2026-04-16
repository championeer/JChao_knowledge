---
title: OpenClaw 生态
slug: openclaw
type: concept-page
status: active
aliases: [OpenClaw, openclaw, Clawbot, Moltbot, AI管家, Agent框架]
source_count: 29
last_updated: 2026-04-16
related_wikis: [agent-memory, context-engineering, multi-agent, skills-and-plugins, automation-workflows]
---

# OpenClaw 生态

> 综合 29 篇源文章的常青概念页。知识库中覆盖面最广的单一平台。最后更新：2026-04-16。

## TL;DR

OpenClaw 是开源的个人 AI Agent 框架（Peter Steinberger，2025 年底发布，2026 年 1 月 GitHub 60000+ Star），标志着 AI 从"对话工具"到"自主执行者"的范式转变。核心定位是"住在电脑里的 AI 管家"——**本地优先、24x7 常驻、Skill 可扩展、多渠道接入**。架构四大组件：模型层（大脑）+ 执行器（手脚）+ 接入适配器（外联部）+ 持久化记忆（档案室），通过三层扩展体系（Skill / Tool / Plugin）实现能力无限延展，已形成覆盖记忆、多 Agent、定时任务、渠道接入、强化学习的完整工程生态。

## 核心观点

- **本地优先 = 安全底线**：任务调度和文件处理在本地完成，仅向模型传必要指令，配合 Ollama 可完全离线；但权限极高——"千万不要在主电脑上部署"
- **Skill 是 Agent 的 App Store**：按需加载的 Markdown 指令集解决了"Prompt 膨胀"问题，ClawHub 已收录 5000+ Skill，六大分类覆盖基础到垂直行业
- **三层扩展体系分明**：Skill（教怎么做 / 知识注入）< Tool（单点动作）< Plugin（系统级扩展），选错层级会导致架构错乱
- **飞轮效应才是核心竞争力**：单模块不稀奇，模块间的数据联动（CRM 喂顾问委员会，知识库喂选题流水线）才是"一个人替代一个团队"的关键
- **Agent 场景的工程复杂度被严重低估**：时间精度、LLM 不确定性、多通道投递、异构模型兼容性叠加后，复杂度指数级上升
- **人机协作闭环**：你是经理不是工程师——给方向不给方法，关键操作保留审批权，日常运维交给 AI 自动执行

## 证据与分主题

### 1. 架构四大组件与部署模型

OpenClaw 的核心架构由四个组件构成，命名经历 Clawbot → Moltbot → OpenClaw 三次变迁：

- **模型层（大脑）**：可接入任何支持 OpenAI API 协议的大模型（Claude、GPT、DeepSeek 等），推荐"大脑 + 肌肉"架构——Opus 做决策协调，专业模型做具体任务（编码用 Codex，搜索用 Brave API）
- **执行器（手脚）**：直接操控文件系统、终端、浏览器
- **接入适配器（外联部）**：Gateway 架构支持 Discord / Telegram / 飞书 / 微信 / Web 等多平台
- **持久化记忆（档案室）**：本地存储操作偏好、文件路径、对话重点

> 全面指南见 [OpenClaw 从入门到精通](../01-AI-Agents/Workflows/OpenClaw从入门到精通/index.md)；100 小时实战浓缩见 [100 小时 OpenClaw 使用经验](../01-AI-Agents/Workflows/100小时OpenClaw使用经验/index.md)

部署模式上，作为系统守护进程 24x7 运行，支持扣子、Kimi、飞书秒搭等一键部署。**安全三铁律**：不在主力机部署、不接触外部输入防注入、先审计执行计划再动手。

### 2. 三层扩展体系：Skill / Tool / Plugin

本库积累了对扩展体系最细致的分层认知：

| 层级 | 定义 | 本质 | 示例 |
|------|------|------|------|
| Skill | 教 AI 怎么做 | Markdown 指令集（SKILL.md），按需加载 | copywriting、systematic-debugging |
| Tool | 给 AI 一个可调用动作 | 函数接口 | memory_search、web_fetch |
| Plugin | 系统级扩展机制 | 代码级，运行在 Gateway 进程内 | 新聊天渠道、替换记忆引擎、webhook |

Plugin 可注册的能力包括：Agent 工具、Hook（生命周期干预）、CLI 命令、HTTP 路由、Gateway RPC、后台服务、上下文引擎、消息渠道、Provider 认证等。关键设计是 **Manifest 驱动的声明式注册**（`openclaw.plugin.json` + JSON Schema），不执行代码即可验证配置。

> 三层边界详解见 [OpenClaw 插件终极指南](../02-AI-Skills-and-Plugins/Plugins/OpenClaw插件终极指南/index.md)；50 个核心 Skill 推荐见 [OpenClaw 五十大升级技能](../02-AI-Skills-and-Plugins/Skills/OpenClaw五十大升级技能/index.md)

Skill 的六大分类：基础核心（6）、逻辑与创作（10）、编程与产品（11）、设计与视觉（8）、营销与增长（8）、办公生产力（7），强调"Operator 思维"——把 AI 当基础设施来构建，而非聊天对象。

### 3. 记忆子系统

OpenClaw 的记忆系统是本知识库积累最深的子话题（8 篇专文），已独立为 Wiki 页 [[agent-memory]]。此处仅列核心结论：

- **三层记忆架构是共识**：短期 NOW.md（覆写式工作台）+ 中期每日日志（追加式流水）+ 长期 MEMORY.md + 结构化子目录
- **五层进阶架构**（[中级到高级教程](../01-AI-Agents/Workflows/OpenClaw中级到高级教程/index.md)）：索引层 / 项目层 / 基础设施层 / 教训层 / 日志层
- **memoryFlush 机制**：上下文压缩前自动持久化重要信息，softThresholdTokens 推荐 4000
- **备份三层防护**：Patch 自动备份 + Cron Git 备份（每 5 分钟）+ 系统 .bak，核心原则是用 `config.patch` 而非直接编辑 JSON

> 完整踩坑教程见 [OpenClaw 永久记忆搭建](../01-AI-Agents/Memory/OpenClaw永久记忆搭建/index.md)；记忆腐化修复见 [OpenClaw 记忆维护实录](../01-AI-Agents/Memory/OpenClaw记忆维护实录/index.md)

### 4. 多 Agent 编排

本库记录了三种多 Agent 模式，复杂度递增：

**模式一：高管团队**——CEO / COO / CMO / CFO 四角色，各自独立 workspace 和 SOUL.md，通过 Discord 汇报。按 ROI 顺序构建：COO 优先（节省最多时间），CEO 最后（需前三者数据积累）。见 [4 人 AI 高管团队构建](../01-AI-Agents/Multi-Agent/4人AI高管团队构建/index.md)。

**模式二：Agent Swarm**——两层架构：OpenClaw 编排层（orchestrator）+ 多个编码 Agent（Codex / Claude Code / Gemini），核心洞察是"上下文窗口是零和博弈"——业务上下文与代码上下文必须分离。每个 Agent 独立 git worktree + tmux 会话，失败时结合业务上下文重写 prompt 而非简单重试。见 [OpenClaw-Agent-Swarm 单人开发](../01-AI-Agents/Multi-Agent/OpenClaw-Agent-Swarm单人开发/index.md)。

**模式三：配置级多 Agent**——Agent 有独立 workspace / SOUL.md / MEMORY.md / session；Binding 允许同一 Agent 在不同频道使用不同模型（日常 Sonnet、开发 Opus），是最省 token 的方案。路由匹配优先级：peer > guildId > accountId > channel > 默认。

> 配置实战详解见 [OpenClaw 多 Agent 配置实战](../01-AI-Agents/Multi-Agent/OpenClaw多Agent配置实战/index.md)

升级路径：1 Agent : 1 场景 → 1 Agent : N 场景（binding）→ N Agents : 1 用户 → N Agents : N 用户。

### 5. 定时任务（Cron）子系统

OpenClaw 的 Cron 子系统经历了 60+ issues 的大规模重构，暴露了 Agent 场景下独有的工程挑战：

- **亚秒精度对齐**：`Math.floor` 将毫秒对齐到秒边界，解决调度延迟 24 小时问题
- **LLM 执行超时**：默认 10 分钟 wall-clock 超时，`Promise.race` 兜底防卡死
- **指数退避**：30s → 1min → 5min → 15min → 60min，与自然调度频率配合
- **投递管道统一**：子 Agent 和 Cron 的结果投递合并到共享管道（`applyJobResult`），消除多入口状态更新重复
- **模型参数畸形恢复**：对 LLM 生成的不合 Schema 工具参数做防御性恢复

> 源码级拆解见 [OpenClaw 定时任务教程](../01-AI-Agents/Workflows/OpenClaw定时任务教程/index.md)

### 6. 渠道接入矩阵

| 渠道 | 方式 | 关键依赖 | 参考 |
|------|------|----------|------|
| 微信 | WorkBuddy 客户端绑定客服号 | WorkBuddy | [OpenClaw 微信接入](../02-AI-Skills-and-Plugins/Integrations/OpenClaw微信接入/index.md) |
| 语音 TTS | ElevenLabs / Edge TTS | API Key + `openclaw.json` 配置 | [OpenClaw 语音能力开通](../02-AI-Skills-and-Plugins/Integrations/OpenClaw语音能力开通/index.md) |
| 语音通话 | TEN-framework + Docker | DeepSeek + Deepgram + ElevenLabs + Agora | [OpenClaw 通话功能实现](../02-AI-Skills-and-Plugins/Integrations/OpenClaw通话功能实现/index.md) |
| 语音克隆 | Noiz API + Python + ffmpeg | 飞书自建应用 | [Openclaw 语音克隆实战](../02-AI-Skills-and-Plugins/Integrations/Openclaw语音克隆实战/index.md) |
| OCR 文档识别 | PaddleOCR Skill | 百度 AI Studio 免费 API（1 万页/天） | [OpenClaw 文档识别配置](../02-AI-Skills-and-Plugins/Integrations/OpenClaw文档识别配置/index.md) |
| Telegram | 多角色群聊路由 | 单 Bot + 路由规则 | [Telegram 多角色群聊搭建](../02-AI-Skills-and-Plugins/Integrations/Telegram多角色群聊搭建/index.md) |
| 飞书 | 官方插件 | 飞书开放平台应用 | [OpenClaw 飞书插件指南](../02-AI-Skills-and-Plugins/Plugins/OpenClaw飞书插件指南/index.md) |

### 7. 生产级应用场景

[OpenClaw 十大真实用例](../01-AI-Agents/Workflows/OpenClaw十大真实用例/index.md) 展示了一个人用一台 MacBook 替代小公司中台团队的可能性：

| 用例 | 核心能力 | 亮点 |
|------|----------|------|
| 自然语言 CRM | 30 分钟搭建，371 个联系人语义搜索 | 关系健康评分 + 自动重复检测 |
| 会议行动项追踪 | 转录 → 匹配联系人 → 提取任务 → 审批 → Todoist | 区分"我的"和"对方的"任务 |
| 个人知识库 | 丢链接到 Telegram 即自动向量化 | 文章/YouTube/X/PDF 全格式 |
| 商业顾问委员会 | 8 个 AI 专家角色每晚并行分析 14 个数据源 | 互相辩论后输出优先级建议 |
| 安全委员会 | 4 个安全视角 AI 每晚审查代码/日志 | 回复"fix it"自动修复 |
| 自动采集发公众号 | Google News RSS + 生图 + 公众号发文 | 半月 16 篇含 10 万+ 爆文，约 1 元/篇 |
| 精简版彭博终端 | OpenBB 接入 100+ 金融数据源 | 自然语言查行情/宏观/期权 |
| 量化投研 | 7 个金融 Skill 一键安装 | 六条安全铁律 + 人工复核 |

> 详见 [OpenClaw 自动采集发公众号](../05-AI-Applications/Content-Creation/OpenClaw自动采集发公众号/index.md)、[OpenClaw 精简版彭博终端](../05-AI-Applications/Finance-Tools/OpenClaw精简版彭博终端/index.md)、[OpenClaw 量化投研安全铁律](../05-AI-Applications/Finance-Tools/OpenClaw量化投研安全铁律/index.md)

核心理念是**"人类在环"**——AI 执行，人类决策，关键操作保留 Telegram 审批。

### 8. 强化学习（OpenClaw-RL）

OpenClaw-RL 框架提出了 Agent 自我进化的工程化路径，核心洞察：**每个已部署 Agent 的每次交互后都有"下一状态信号"（用户回复、终端输出、测试结果），这些信号本质上是免费训练数据，但现有系统全部丢弃了。**

两种可回收信号：
- **评价信号**：隐式评分前一动作好坏（用户重新提问 = 不满，测试通过 = 成功），转化为标量过程奖励
- **指令信号**：包含 token 级别的修正方向，比标量奖励信息丰富

四引擎异步架构（零阻塞）：环境服务器 → PRM/Judge → Megatron 策略训练器 → SGLang 策略服务器。两种训练方法互补：Binary RL（广覆盖粗信号）+ OPD 在线策略蒸馏（高分辨率 token 级指导）。

> Qwen3 4B/8B/32B 实验：个人 Agent 仅需 36 次交互即可显著改善。详见 [OpenClaw 对话式 RL 训练](../01-AI-Agents/Training/OpenClaw对话式RL训练/index.md) 和 [OpenClaw 强化学习详解](../01-AI-Agents/Training/OpenClaw强化学习详解/index.md)

### 9. System Prompt 九层架构

OpenClaw 的 System Prompt 采用九层分层设计，从底层系统约束到顶层人格表达：

> 科普向拆解见 [SystemPrompt 九层塔解析](../01-AI-Agents/Architecture/SystemPrompt九层塔解析/index.md)；技术向配置详解见 [SystemPrompt 九层架构详解](../01-AI-Agents/Architecture/SystemPrompt九层架构详解/index.md)

配合 SOUL.md（人格）、USER.md（用户信息）、IDENTITY.md（身份）、AGENTS.md（行为规范）、MEMORY.md（长期记忆）构成完整的 .md 文件体系——**文件即配置，Markdown 即接口**。

## 决策参考

| 场景 | 推荐方案 | 依据 |
|---|---|---|
| 刚入门，想跑起来 | 单 Agent + 3 个 .md 文件起步 | 渐进式搭建，每周加一层 |
| 多场景但省 token | 1 Agent + N Binding（不同渠道不同模型） | Binding 共享 workspace，最省 token |
| 团队协作 / 角色分工 | 多 Agent，各自 workspace + SOUL.md | 上下文窗口是零和博弈，必须分离 |
| 编码密集任务 | OpenClaw 编排 + Codex/Claude Code 执行 | 两层架构：业务上下文 vs 代码上下文 |
| 记忆频繁丢失 | memoryFlush + QMD 语义检索 + 周度体检 | 三层兜底 + 复发追踪计数器 |
| 定时自动化 | Cron + 审批闭环（Telegram 审批） | 关键操作保留人工审批 |
| 扩展能力 | Skill（知识）→ Tool（动作）→ Plugin（系统级） | 选错层级会架构错乱 |
| 成本控制 | 日常 Sonnet + 关键 Opus + 缓存 + 月限额 | 可降 40% token 费用 |

## 开放问题 / 演进方向

- **缺少统一架构参考文档**：19+ 篇文章涉及各子系统，但缺少一篇将所有子系统整合为统一架构视图的参考（类似 ClaudeCode 架构与治理对 Claude Code 的定位），这是知识间隙 #2
- **跨平台 Skills 互操作**：Claude Skills / OpenClaw Plugins / Claude Code Hooks 分散在三个分类，缺少统一开发策略指导，知识间隙 #4
- **RL 训练的实际部署成本**：论文级实验结果优异（36 次交互即改善），但生产环境的四引擎部署门槛和持续训练成本尚无实战报告
- **安全模型的系统性文档**：分散在多篇文章中的安全建议（三铁律、六条铁律、Docker 沙箱、提示注入防御）需要整合为统一安全框架

## 相关概念页

- [[agent-memory]] — OpenClaw 记忆子系统的完整分析，本页的子话题 #3 的详细展开
- [[context-engineering]] — 九层 System Prompt 设计属于 Context 工程的实践分支
- [[multi-agent]] — 多 Agent 编排模式跨越 OpenClaw 和其他平台
- [[skills-and-plugins]] — 三层扩展体系的通用设计原理
- [[automation-workflows]] — Cron 子系统和自动化应用场景的上位概念

## 源文章清单

| # | 路径 | 贡献的观点 |
|---|---|---|
| 1 | `01-AI-Agents/Workflows/OpenClaw从入门到精通/index.md` | 架构四组件定义、历史沿革、部署方式 |
| 2 | `01-AI-Agents/Workflows/100小时OpenClaw使用经验/index.md` | Brain Dump、反向提示、大脑+肌肉架构、安全三铁律 |
| 3 | `01-AI-Agents/Workflows/OpenClaw中级到高级教程/index.md` | AGENTS.md 规范、五层记忆架构、memoryFlush、子 Agent 配置 |
| 4 | `01-AI-Agents/Workflows/OpenClaw十大真实用例/index.md` | 10 个生产级用例、数据飞轮效应、人机审批闭环 |
| 5 | `01-AI-Agents/Workflows/OpenClaw定时任务教程/index.md` | Cron 子系统源码拆解、7 个可靠性问题及修复 |
| 6 | `01-AI-Agents/Memory/OpenClaw永久记忆搭建/index.md` | 三层自动化记忆架构踩坑教程 |
| 7 | `01-AI-Agents/Memory/OpenClaw记忆管理实战指南/index.md` | NOW/日志/MEMORY 三层架构、30 天 5 Agent 实战 |
| 8 | `01-AI-Agents/Memory/OpenClaw记忆问题分析/index.md` | 原生/QMD/Supermemory 对比、Memory Bench 数据 |
| 9 | `01-AI-Agents/Memory/OpenClaw记忆维护实录/index.md` | 记忆腐化六个暗伤、周度体检、复发追踪 |
| 10 | `01-AI-Agents/Memory/OpenClaw本地记忆系统/index.md` | MemTensor 插件、token 省 35%、自动 Skill 沉淀 |
| 11 | `01-AI-Agents/Memory/OpenClaw多层备份策略/index.md` | 三层备份防护、config.patch 原则 |
| 12 | `01-AI-Agents/Multi-Agent/4人AI高管团队构建/index.md` | CEO/COO/CMO/CFO 四角色、ROI 顺序构建 |
| 13 | `01-AI-Agents/Multi-Agent/OpenClaw-Agent-Swarm单人开发/index.md` | 两层编排架构、上下文分离、三重代码审查 |
| 14 | `01-AI-Agents/Multi-Agent/OpenClaw多Agent配置实战/index.md` | Agent vs Binding、路由优先级、权限两层控制 |
| 15 | `01-AI-Agents/Training/OpenClaw对话式RL训练/index.md` | 下一状态信号回收、四引擎异步架构 |
| 16 | `01-AI-Agents/Training/OpenClaw强化学习详解/index.md` | Binary RL + OPD 互补、36 次交互改善 |
| 17 | `02-AI-Skills-and-Plugins/Plugins/OpenClaw插件终极指南/index.md` | Skill/Tool/Plugin 三层边界、Manifest 声明式注册 |
| 18 | `02-AI-Skills-and-Plugins/Skills/OpenClaw五十大升级技能/index.md` | 六大分类 50 个 Skill、Operator 思维 |
| 19 | `02-AI-Skills-and-Plugins/Integrations/Openclaw语音克隆实战/index.md` | Noiz API + 飞书语音发送 |
| 20 | `02-AI-Skills-and-Plugins/Integrations/OpenClaw语音能力开通/index.md` | ElevenLabs TTS 配置 |
| 21 | `02-AI-Skills-and-Plugins/Integrations/OpenClaw文档识别配置/index.md` | PaddleOCR + 百度 AI Studio |
| 22 | `02-AI-Skills-and-Plugins/Integrations/OpenClaw微信接入/index.md` | WorkBuddy 绑定微信客服号 |
| 23 | `02-AI-Skills-and-Plugins/Integrations/OpenClaw通话功能实现/index.md` | TEN-framework + 四服务 Docker 部署 |
| 24 | `02-AI-Skills-and-Plugins/Plugins/OpenClaw飞书插件指南/index.md` | 飞书官方插件安装配置 |
| 25 | `05-AI-Applications/Content-Creation/OpenClaw自动采集发公众号/index.md` | RSS 采集 + 生图 + 公众号发文自动化 |
| 26 | `05-AI-Applications/Content-Creation/OpenClaw四兄弟写作实战/index.md` | 4 Agent 协作写作、SOUL.md 人格系统 |
| 27 | `05-AI-Applications/Finance-Tools/OpenClaw精简版彭博终端/index.md` | OpenBB 100+ 金融数据源接入 |
| 28 | `05-AI-Applications/Finance-Tools/OpenClaw量化投研安全铁律/index.md` | 7 个金融 Skill + 六条安全铁律 |
| 29 | `01-AI-Agents/Architecture/SystemPrompt九层塔解析/index.md` | 九层 System Prompt 分层设计 |
