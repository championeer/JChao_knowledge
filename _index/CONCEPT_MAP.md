# 概念关系图

> 跨文章的概念映射。帮助 LLM 发现主题关联和知识间隙。
> 每个概念节点列出核心文章和关联概念。
> 编译自 MASTER_INDEX.md，2026-04-03。

---

## 概念节点

### 1. Agent 记忆架构

跨越记忆设计、持久化、多 Agent 共享、腐化修复等维度，是知识库中积累最深的概念。

- **核心文章**:
  - `01-AI-Agents/Memory/OpenClaw永久记忆搭建/index.md` — 三层自动化记忆架构
  - `01-AI-Agents/Memory/OpenClaw记忆管理实战指南/index.md` — NOW/日志/MEMORY 三层架构
  - `01-AI-Agents/Memory/全天候Agent团队记忆管理/index.md` — 六个 Agent 共享三层记忆
  - `01-AI-Agents/Memory/OpenClaw记忆问题分析/index.md` — 原生记忆/QMD/Supermemory 对比
  - `01-AI-Agents/Memory/OpenClaw记忆维护实录/index.md` — 记忆腐化六个暗伤
  - `01-AI-Agents/Memory/字节OpenViking记忆架构/index.md` — .abstract 索引按需加载
  - `01-AI-Agents/Memory/OpenClaw本地记忆系统/index.md` — memos-local 插件节省 token
- **关联文章**:
  - `04-AI-Infrastructure/Optimization/QMD搜索与ZenMux省Token/index.md` — QMD 本地语义检索替代全量上下文
  - `01-AI-Agents/Architecture/文件系统即数据库/index.md` — 三层信息架构的渐进式披露
  - `01-AI-Agents/Workflows/Agent工作交接继任Prompt/index.md` — 会话间记忆传递
- **关联概念**: → Context 工程与信息架构, → Token 优化与成本控制, → 多 Agent 协作

---

### 2. Context 工程与信息架构

如何组织、分层、按需披露信息给 LLM，贯穿 Agent 架构、System Prompt、个人操作系统等主题。

- **核心文章**:
  - `01-AI-Agents/Architecture/Agent信息经济学/index.md` — context 质量比数量更重要（Epiplexity）
  - `01-AI-Agents/Architecture/文件系统即数据库/index.md` — 三层信息架构与渐进式披露
  - `01-AI-Agents/Architecture/SystemPrompt九层塔解析/index.md` — 九层 System Prompt 分层
  - `01-AI-Agents/Architecture/SystemPrompt九层架构详解/index.md` — 每层组成与设计权衡
  - `03-Claude-Code/Tutorials/ClaudeCode架构与治理/index.md` — 六层架构与上下文治理
- **关联文章**:
  - `01-AI-Agents/Architecture/万字提示词造数字灵魂/index.md` — TELOS 十维度个人化信息结构
  - `01-AI-Agents/Workflows/Agent工作交接继任Prompt/index.md` — 结构化交接文档
  - `04-AI-Infrastructure/Optimization/QMD搜索与ZenMux省Token/index.md` — 语义检索替代全量上下文
- **关联概念**: → Agent 记忆架构, → System Prompt 设计, → Token 优化与成本控制

---

### 3. 多 Agent 协作

多个 AI Agent 的编排、分工、路由、记忆共享和团队协作模式。

- **核心文章**:
  - `01-AI-Agents/Multi-Agent/4人AI高管团队构建/index.md` — CEO/COO/CMO/CFO 四角色团队
  - `01-AI-Agents/Multi-Agent/OpenClaw-Agent-Swarm单人开发/index.md` — Agent 集群编排
  - `01-AI-Agents/Multi-Agent/OpenClaw多Agent配置实战/index.md` — 路由匹配与渠道绑定
  - `01-AI-Agents/Memory/全天候Agent团队记忆管理/index.md` — 多 Agent 记忆共享
- **关联文章**:
  - `05-AI-Applications/Content-Creation/OpenClaw四兄弟写作实战/index.md` — 四 Agent 协作写作
  - `02-AI-Skills-and-Plugins/Integrations/Telegram多角色群聊搭建/index.md` — 多角色 AI 群组
  - `01-AI-Agents/Workflows/个人业务Agent升级指南/index.md` — 业务 Agent 化三层架构
  - `06-LLM-Foundations/百万步LLM任务零错误/index.md` — 多 Agent 投票纠错
- **关联概念**: → Agent 记忆架构, → OpenClaw 生态, → 自动化工作流

---

### 4. System Prompt 设计

Prompt 工程中专注于系统级指令的分层构造、人格注入和能力配置。

- **核心文章**:
  - `01-AI-Agents/Architecture/SystemPrompt九层塔解析/index.md` — 科普向九层拆解
  - `01-AI-Agents/Architecture/SystemPrompt九层架构详解/index.md` — 技术向配置详解
  - `01-AI-Agents/Architecture/万字提示词造数字灵魂/index.md` — TELOS 十维度数字身份
  - `03-Claude-Code/Tutorials/CLAUDE.md配置示例/index.md` — CLAUDE.md 作为 System Prompt
- **关联文章**:
  - `01-AI-Agents/Architecture/公司即文件系统/index.md` — 组织架构映射到 Agent 决策
  - `05-AI-Applications/Content-Creation/OpenClaw四兄弟写作实战/index.md` — SOUL.md 人格系统
- **关联概念**: → Context 工程与信息架构, → Agent 记忆架构, → OpenClaw 生态

---

### 5. OpenClaw 生态

OpenClaw 平台的部署、配置、插件、Skills、Cron、记忆、集成等全栈实践。知识库中覆盖面最广的单一平台。

- **核心文章**:
  - `01-AI-Agents/Workflows/OpenClaw从入门到精通/index.md` — 全面指南
  - `01-AI-Agents/Workflows/100小时OpenClaw使用经验/index.md` — 100 小时浓缩
  - `01-AI-Agents/Workflows/OpenClaw中级到高级教程/index.md` — 进阶教程
  - `01-AI-Agents/Workflows/OpenClaw十大真实用例/index.md` — 10 个生产级用例
  - `01-AI-Agents/Workflows/OpenClaw定时任务教程/index.md` — Cron 子系统
  - `02-AI-Skills-and-Plugins/Plugins/OpenClaw插件终极指南/index.md` — Skill/Tool/Plugin 边界
- **关联文章**: 涉及 Memory(7)、Multi-Agent(3)、Skills(2)、Integrations(4)、Content-Creation(2)、Finance-Tools(1) 等 19+ 篇文章
- **关联概念**: → Agent 记忆架构, → 多 Agent 协作, → Skills 与插件体系, → 自动化工作流

---

### 6. Skills 与插件体系

AI Agent 的能力扩展机制：Skill 创建、维护、评估，Plugin 开发，以及 Skill/Tool/Plugin 的架构边界。

- **核心文章**:
  - `02-AI-Skills-and-Plugins/Skills/从聊天到干活只差一个Skills/index.md` — Prompt/Skills/MCP 区别
  - `02-AI-Skills-and-Plugins/Skills/ClaudeSkills2.0终极指南/index.md` — Skills 2.0 新功能
  - `02-AI-Skills-and-Plugins/Skills/SkillCreator2.0实战指南/index.md` — Skills 维护方法
  - `02-AI-Skills-and-Plugins/Plugins/OpenClaw插件终极指南/index.md` — Skill/Tool/Plugin 边界
  - `02-AI-Skills-and-Plugins/Skills/OpenClaw五十大升级技能/index.md` — 50 个核心 Skills
- **关联文章**:
  - `05-AI-Applications/Finance-Tools/金融行业十大Skills/index.md` — 金融场景 Skills
  - `01-AI-Agents/Workflows/OpenClaw中级到高级教程/index.md` — Skill 开发教程
  - `03-Claude-Code/Tutorials/ClaudeCode架构与治理/index.md` — Skills/Hooks 设计
- **关联概念**: → OpenClaw 生态, → Claude Code 工具链, → 自动化工作流

---

### 7. Token 优化与成本控制

减少 Token 消耗、优化 API 调用成本、聚合多平台额度的实践。

- **核心文章**:
  - `04-AI-Infrastructure/Optimization/QMD搜索与ZenMux省Token/index.md` — QMD + ZenMux 20 倍 Token 节省
  - `01-AI-Agents/Memory/OpenClaw本地记忆系统/index.md` — 本地记忆节省 35% token
  - `04-AI-Infrastructure/Optimization/OpenClaw-API聚合工具大全/index.md` — API 聚合与免费额度
- **关联文章**:
  - `04-AI-Infrastructure/API-Proxy/自建中转零封号/index.md` — 自建中转站降成本
  - `04-AI-Infrastructure/API-Proxy/从零搭建API中转站/index.md` — 安全中转站
  - `01-AI-Agents/Architecture/Agent信息经济学/index.md` — context 质量替代数量
  - `01-AI-Agents/Workflows/个人业务Agent升级指南/index.md` — 500 美金替代 5 人团队
- **关联概念**: → Agent 记忆架构, → Context 工程与信息架构, → API 基础设施

---

### 8. Claude Code 工具链

Claude Code 的架构、配置、最佳实践、环境搭建和工作流。

- **核心文章**:
  - `03-Claude-Code/Tutorials/ClaudeCode架构与治理/index.md` — 六层架构与上下文治理
  - `03-Claude-Code/Tutorials/ClaudeCode官方十三条指导/index.md` — 官方最佳实践
  - `03-Claude-Code/Tutorials/ClaudeCode三十一天教程/index.md` — 31 天系统教程
  - `03-Claude-Code/Tutorials/ClaudeCowork入门套件/index.md` — Cowork 工作流
  - `03-Claude-Code/Tutorials/CLAUDE.md配置示例/index.md` — 配置模板
- **关联文章**:
  - `03-Claude-Code/Environment/Ghostty搭配ClaudeCode/index.md` — 终端配置
  - `03-Claude-Code/Scraping/ClaudeCode五种抓取方案/index.md` — 工具链扩展
  - `05-AI-Applications/Research/ClaudeCode辅助写论文/index.md` — 学术场景应用
- **关联概念**: → Context 工程与信息架构, → Skills 与插件体系, → 自动化工作流

---

### 9. 自动化工作流

将人工流程 Agent 化：定时任务、自动采集发布、自主研究循环、批量内容生产。

- **核心文章**:
  - `01-AI-Agents/Workflows/OpenClaw定时任务教程/index.md` — Cron 子系统
  - `05-AI-Applications/Content-Creation/OpenClaw自动采集发公众号/index.md` — 自动采集+发布
  - `01-AI-Agents/Training/Agent研究循环/index.md` — autoresearch 自主循环
  - `05-AI-Applications/Research/Karpathy自动研究入门/index.md` — 自动化 ML 实验
  - `01-AI-Agents/Workflows/个人业务Agent升级指南/index.md` — 业务 Agent 化
- **关联文章**:
  - `01-AI-Agents/Workflows/OpenClaw十大真实用例/index.md` — 生产级自动化用例
  - `06-LLM-Foundations/百万步LLM任务零错误/index.md` — 百万步任务分解
  - `03-Claude-Code/Tutorials/ClaudeCowork入门套件/index.md` — Cowork 自动化
- **关联概念**: → 多 Agent 协作, → OpenClaw 生态, → Agent 训练与强化学习

---

### 10. API 基础设施

LLM API 的中转、聚合、安全部署和成本优化底层支撑。

- **核心文章**:
  - `04-AI-Infrastructure/API-Proxy/自建中转零封号/index.md` — Sub2API 自建中转
  - `04-AI-Infrastructure/API-Proxy/从零搭建API中转站/index.md` — Cloudflare+Sub2API 安全部署
  - `04-AI-Infrastructure/API-Proxy/sub2api部署指南/index.md` — Docker 部署教程
  - `04-AI-Infrastructure/Optimization/OpenClaw-API聚合工具大全/index.md` — API 聚合工具
- **关联文章**:
  - `04-AI-Infrastructure/Optimization/QMD搜索与ZenMux省Token/index.md` — ZenMux 订阅管理
- **关联概念**: → Token 优化与成本控制, → OpenClaw 生态

---

### 11. 投资分析框架

从筛选标准、财务分析到决策流程的价值投资方法论体系。

- **核心文章**:
  - `20-Investment/Fundamentals/投资Checklist/index.md` — 完整决策流程
  - `20-Investment/Fundamentals/欲行其事先立其规/index.md` — 资金配置与纪律框架
  - `20-Investment/Fundamentals/先筛选再判断/index.md` — 择股筛选漏斗
  - `20-Investment/Analysis/企业地图财务与业务/index.md` — 企业分析方法论
  - `20-Investment/Analysis/好投资的延长公式/index.md` — 好投资扩展公式
- **关联文章**:
  - `20-Investment/Fundamentals/看看择偶结果/index.md` — 标准实测验证
  - `20-Investment/Analysis/解读成长的含金量/index.md` — 成长质量判断
  - `20-Investment/Analysis/透视利润的外衣/index.md` — 财务透视
  - `20-Investment/Analysis/增速为何不同频/index.md` — 成本结构分析
  - `20-Investment/Analysis/打开一份年报/index.md` — 年报阅读方法
- **关联概念**: → 宏观经济与地缘博弈, → 深度思考与信息消费

---

### 12. 宏观经济与地缘博弈

A 股宏观数据、关税战、中美博弈、经济周期等宏观层面分析。

- **核心文章**:
  - `20-Investment/Macro/关税观察和应对/index.md` — 关税战首轮冲击
  - `20-Investment/Macro/关税懂王的算盘/index.md` — 美国关税策略拼图
  - `20-Investment/Macro/关税盘点谁的内忧外患/index.md` — 美债困局与博弈推演
  - `20-Investment/Macro/正眼看数据当下身在何处/index.md` — 2025Q1 行业利润
  - `20-Investment/Macro/侧眼看数据冰火两重天/index.md` — 行业分化与周期拐点
  - `20-Investment/Macro/回看数据2024年末/index.md` — 2024Q4 全景数据
- **关联概念**: → 投资分析框架, → 深度思考与信息消费

---

### 13. 深度思考与信息消费

AI 时代的信息管理哲学：抗 FOMO、深度阅读 vs 摘要消费、能力模型转型。

- **核心文章**:
  - `20-Investment/Commentary/告别信息FOMO/index.md` — 信息流清零与分层筛选
  - `20-Investment/Commentary/深度处理VS摘要消费/index.md` — 深度精读 vs 浅层消费
  - `20-Investment/Commentary/番外十项全能新时代/index.md` — CEO 式多维能力构建
- **关联文章**:
  - `06-LLM-Foundations/AI原生时代个人系统M-PPS/index.md` — AI 原生个人管理系统
  - `01-AI-Agents/Architecture/Agent信息经济学/index.md` — 信息质量理论
- **关联概念**: → 投资分析框架, → Context 工程与信息架构, → 个人 AI 操作系统

---

### 14. 个人 AI 操作系统

用 AI 构建个人化基础设施：数字身份、个人大脑、目标管理系统。

- **核心文章**:
  - `01-AI-Agents/Architecture/文件系统即数据库/index.md` — Personal Brain OS
  - `01-AI-Agents/Architecture/万字提示词造数字灵魂/index.md` — TELOS 数字身份
  - `06-LLM-Foundations/AI原生时代个人系统M-PPS/index.md` — M-PPS 个人管理系统
- **关联文章**:
  - `01-AI-Agents/Architecture/公司即文件系统/index.md` — 文件系统建模组织
  - `01-AI-Agents/Workflows/个人业务Agent升级指南/index.md` — 业务 Agent 化
  - `05-AI-Applications/Content-Creation/OpenClaw四兄弟写作实战/index.md` — 数字分身
- **关联概念**: → Context 工程与信息架构, → Agent 记忆架构, → 深度思考与信息消费

---

### 15. Agent 训练与强化学习

从用户对话中提取奖励信号、策略蒸馏、过程奖励模型等 Agent 进化机制。

- **核心文章**:
  - `01-AI-Agents/Training/OpenClaw对话式RL训练/index.md` — 在线强化学习
  - `01-AI-Agents/Training/OpenClaw强化学习详解/index.md` — RL 核心概念图解
  - `01-AI-Agents/Training/Agent研究循环/index.md` — 自主实验循环
- **关联文章**:
  - `06-LLM-Foundations/百万步LLM任务零错误/index.md` — 任务分解与纠错
  - `05-AI-Applications/Research/Karpathy自动研究入门/index.md` — autoresearch 框架
- **关联概念**: → 自动化工作流, → 多 Agent 协作

---

## 跨分类关联发现

以下是跨越不同顶层分类的重要概念桥梁：

| 桥梁 | 连接的分类 | 说明 |
|------|-----------|------|
| QMD 本地语义检索 | 01-Agents ↔ 04-Infrastructure | 记忆系统的底层存储与 Token 优化的交叉点 |
| autoresearch 循环 | 01-Agents/Training ↔ 05-Applications/Research | Agent 训练理论到科研应用的实践落地 |
| 文件系统建模 | 01-Agents/Architecture ↔ 06-LLM-Foundations | 从 Personal OS 到企业架构的统一抽象 |
| 信息质量理论 | 01-Agents/Architecture ↔ 20-Investment/Commentary | Agent context 质量与人类深度阅读的同构映射 |
| Skills 体系 | 02-Skills ↔ 03-Claude-Code ↔ 05-Applications | 能力扩展机制贯穿 Claude 和 OpenClaw 两大平台 |
| 业务 Agent 化 | 01-Agents ↔ 05-Applications ↔ 20-Investment | 从技术架构到业务落地到投资降本的完整链路 |

---

## 知识间隙

以下主题有多篇文章积累但缺少综合概念文章：

1. **Agent 记忆系统设计模式综述**: 8 篇 Memory 文章 + 2 篇 Optimization 文章覆盖了三层架构、腐化修复、向量检索、多 Agent 共享等维度，但缺少一篇将所有记忆模式抽象为设计模式的综述文章（如：何时用文件记忆 vs 向量记忆 vs 图谱记忆的决策树）。

2. **OpenClaw 完整架构参考**: 19+ 篇文章涉及 OpenClaw 的记忆/插件/Cron/路由/多 Agent/集成等子系统，但缺少一篇将所有子系统整合为统一架构视图的参考文章（类似 ClaudeCode 架构与治理对 Claude Code 的定位）。

3. **API 成本优化决策框架**: 5 篇文章分别讲中转站、API 聚合、Token 节省、ZenMux、免费额度，但缺少一篇整合性的成本优化决策框架（何时自建 vs 第三方、Token 预算规划、多模型混合调度）。

4. **跨平台 Skills/工具链互操作**: Claude Skills(7 篇) + OpenClaw Plugins(2 篇) + Claude Code Hooks 分散在三个分类，但缺少一篇对比三个平台的能力扩展机制并指导统一开发策略的文章。

5. **AI 时代个人知识管理体系**: 涉及 NotebookLM、Personal Brain OS、M-PPS、信息 FOMO、深度阅读等 5+ 篇文章，但缺少一篇整合个人知识获取-处理-存储-检索的端到端系统设计。

6. **安踏企业研究案例集**: Analysis 分类中 3 篇以安踏为案例（好投资的延长公式、增速为何不同频、打开一份年报），但缺少一篇将散落分析整合为完整企业研究报告的综合文章。

7. **A 股宏观数据追踪方法论**: 3 篇宏观数据文章 + 3 篇关税分析，数据已跨越 2024Q4 到 2025Q1，但缺少一篇将数据追踪流程标准化的方法论文章（数据源、更新节奏、关注指标、异常判定）。
