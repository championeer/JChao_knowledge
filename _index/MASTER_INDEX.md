# 知识库主索引

> LLM 编译层。每篇文章一行摘要，按分类组织。
> 更新方式：归档新文章后追加条目；定期用 LLM 重新编译。
> 格式：`- [中文短名](相对路径) — 一句话摘要 #概念标签`

---

## 01-AI-Agents

### Architecture (7)

- [Agent信息经济学](../01-AI-Agents/Architecture/Agent信息经济学/index.md) — 用Epiplexity理论解释为何Agent的context质量比数量更重要 `#信息论` `#Context工程` `#Epiplexity`
- [pi-ai与pi-agent-core解析](../01-AI-Agents/Architecture/pi-ai与pi-agent-core解析/index.md) — 逐行解读pi-ai/pi-agent-core源码的分层设计、类型系统与Provider机制 `#源码分析` `#TypeScript` `#Agent框架`
- [SystemPrompt九层塔解析](../01-AI-Agents/Architecture/SystemPrompt九层塔解析/index.md) — 科普向拆解OpenClaw九层System Prompt如何组装Agent人格与能力 `#SystemPrompt` `#Agent人格` `#分层架构`
- [SystemPrompt九层架构详解](../01-AI-Agents/Architecture/SystemPrompt九层架构详解/index.md) — 技术向详解九层Prompt每层的组成内容、设计权衡与配置方法 `#SystemPrompt` `#配置指南` `#设计权衡`
- [万字提示词造数字灵魂](../01-AI-Agents/Architecture/万字提示词造数字灵魂/index.md) — 基于TELOS系统用十个维度文件构建AI的持久个人化基础设施 `#TELOS` `#个人AI` `#数字身份`
- [公司即文件系统](../01-AI-Agents/Architecture/公司即文件系统/index.md) — 将企业建模为文件系统，用Unix权限映射组织架构驱动Agent决策 `#文件系统` `#企业Agent` `#架构理念`
- [文件系统即数据库](../01-AI-Agents/Architecture/文件系统即数据库/index.md) — 用80+文件构建Personal Brain OS，实现渐进式披露的三层信息架构 `#PersonalOS` `#渐进式披露` `#文件架构`

### Memory (8)

- [OpenClaw多层备份策略](../01-AI-Agents/Memory/OpenClaw多层备份策略/index.md) — 三层防护体系解决配置频繁损坏问题，含Patch/Cron/系统备份 `#配置备份` `#容灾` `#运维`
- [OpenClaw本地记忆系统](../01-AI-Agents/Memory/OpenClaw本地记忆系统/index.md) — 安装memos-local插件实现本地记忆，节省35%token并自动生成Skill `#本地记忆` `#插件` `#token优化`
- [OpenClaw永久记忆搭建](../01-AI-Agents/Memory/OpenClaw永久记忆搭建/index.md) — 从丢失两天记忆到搭建三层自动化记忆架构的完整踩坑教程 `#记忆架构` `#自动化` `#向量搜索`
- [OpenClaw记忆管理实战指南](../01-AI-Agents/Memory/OpenClaw记忆管理实战指南/index.md) — 基于5个Agent协作30天经验的三层记忆架构（NOW/日志/MEMORY） `#三层架构` `#Markdown记忆` `#QMD`
- [OpenClaw记忆维护实录](../01-AI-Agents/Memory/OpenClaw记忆维护实录/index.md) — 运行30天后记忆系统腐化的六个暗伤及修复方案 `#记忆腐化` `#运维实录` `#数据一致性`
- [OpenClaw记忆问题分析](../01-AI-Agents/Memory/OpenClaw记忆问题分析/index.md) — 深度对比OpenClaw原生记忆、QMD与Supermemory的架构差异和性能 `#记忆评测` `#Supermemory` `#向量图谱`
- [全天候Agent团队记忆管理](../01-AI-Agents/Memory/全天候Agent团队记忆管理/index.md) — 六个Agent共享三层记忆的架构设计，一次纠正修复所有Agent `#多Agent记忆` `#Vertex AI` `#记忆传播`
- [字节OpenViking记忆架构](../01-AI-Agents/Memory/字节OpenViking记忆架构/index.md) — 接入字节OpenViking的.abstract索引机制实现按需加载记忆 `#OpenViking` `#索引机制` `#按需加载`

### Multi-Agent (3)

- [4人AI高管团队构建](../01-AI-Agents/Multi-Agent/4人AI高管团队构建/index.md) — 用OpenClaw搭建CEO/COO/CMO/CFO四角色Agent团队实现自主运营 `#AI高管` `#角色分工` `#自主运营`
- [OpenClaw-Agent-Swarm单人开发](../01-AI-Agents/Multi-Agent/OpenClaw-Agent-Swarm单人开发/index.md) — 用OpenClaw编排Codex/Claude Code集群，单人日产94次提交 `#Agent编排` `#开发效率` `#Swarm`
- [OpenClaw多Agent配置实战](../01-AI-Agents/Multi-Agent/OpenClaw多Agent配置实战/index.md) — 详解多Agent的路由匹配、Bindings配置与跨渠道协作机制 `#多Agent配置` `#路由匹配` `#渠道绑定`

### Training (3)

- [Agent研究循环](../01-AI-Agents/Training/Agent研究循环/index.md) — 解析Karpathy autoresearch模式如何将科学方法压缩为Agent可执行的自主循环 `#autoresearch` `#科学方法` `#自主实验`
- [OpenClaw对话式RL训练](../01-AI-Agents/Training/OpenClaw对话式RL训练/index.md) — Princeton论文：从用户对话的下一状态信号中提取奖励实现Agent在线强化学习 `#强化学习` `#在线训练` `#PRM`
- [OpenClaw强化学习详解](../01-AI-Agents/Training/OpenClaw强化学习详解/index.md) — 图解OpenClaw-RL核心概念：状态信号、过程奖励、策略蒸馏与OPD机制 `#RL详解` `#策略蒸馏` `#OPD`

### Workflows (7)

- [100小时OpenClaw使用经验](../01-AI-Agents/Workflows/100小时OpenClaw使用经验/index.md) — 浓缩100小时经验的完整指南：本地部署、Brain Dump、定时简报到进阶技巧 `#入门指南` `#最佳实践` `#Brain Dump`
- [Agent工作交接继任Prompt](../01-AI-Agents/Workflows/Agent工作交接继任Prompt/index.md) — 上下文过长时让Agent生成结构化交接文档给下一个会话的实用Prompt `#会话交接` `#Prompt技巧` `#上下文管理`
- [OpenClaw中级到高级教程](../01-AI-Agents/Workflows/OpenClaw中级到高级教程/index.md) — 覆盖AGENTS.md规范、记忆优化、子Agent、Cron、Skill开发的进阶教程 `#进阶教程` `#Skill开发` `#Cron`
- [OpenClaw从入门到精通](../01-AI-Agents/Workflows/OpenClaw从入门到精通/index.md) — 从理论到实战的全面指南，含项目历史、安装部署、配置详解与常见问题 `#入门到精通` `#安装部署` `#全面指南`
- [OpenClaw十大真实用例](../01-AI-Agents/Workflows/OpenClaw十大真实用例/index.md) — 拆解CRM、知识库、商业顾问团、安全审查等10个生产级落地用例 `#真实用例` `#CRM` `#自动化工作流`
- [OpenClaw定时任务教程](../01-AI-Agents/Workflows/OpenClaw定时任务教程/index.md) — 从源码角度拆解Cron子系统的七个可靠性问题及解决方案 `#Cron` `#可靠性` `#源码分析`
- [个人业务Agent升级指南](../01-AI-Agents/Workflows/个人业务Agent升级指南/index.md) — 将投研业务Agent化的三层架构实践，用500美金替代5人团队产出 `#业务Agent化` `#投研` `#降本增效`

---

## 02-AI-Skills-and-Plugins

### Skills (7)

- [ClaudeSkills小白入门](../02-AI-Skills-and-Plugins/Skills/ClaudeSkills小白入门/index.md) — 面向非技术用户讲解Skills原理与官方Skill启用方法 `#Skills入门` `#Claude.ai`
- [ClaudeSkills十五分钟上手](../02-AI-Skills-and-Plugins/Skills/ClaudeSkills十五分钟上手/index.md) — 用skill-creator元技能快速创建自定义Skill的分步教程 `#Skills创建` `#非技术用户`
- [ClaudeSkills2.0终极指南](../02-AI-Skills-and-Plugins/Skills/ClaudeSkills2.0终极指南/index.md) — Skills 2.0新增评估测试、A/B对比和描述优化三大功能 `#Skills2.0` `#技能评估` `#A/B测试`
- [ClaudeSkills做PPT演示](../02-AI-Skills-and-Plugins/Skills/ClaudeSkills做PPT演示/index.md) — 实战演示用Skills封装PPT风格并稳定批量生成透明PNG卡片 `#Skills实战` `#PPT制作`
- [OpenClaw五十大升级技能](../02-AI-Skills-and-Plugins/Skills/OpenClaw五十大升级技能/index.md) — 六大分类50个核心Skills推荐，从基础到营销全覆盖 `#OpenClaw` `#Skills推荐`
- [SkillCreator2.0实战指南](../02-AI-Skills-and-Plugins/Skills/SkillCreator2.0实战指南/index.md) — 用体检、盲测和描述优化三步法维护Skills最佳状态 `#SkillCreator` `#Skills维护`
- [从聊天到干活只差一个Skills](../02-AI-Skills-and-Plugins/Skills/从聊天到干活只差一个Skills/index.md) — 用比喻讲透Prompt/Skills/MCP区别及Skills结构设计原理 `#Skills概念` `#入门科普`

### Plugins (2)

- [OpenClaw飞书插件指南](../02-AI-Skills-and-Plugins/Plugins/OpenClaw飞书插件指南/index.md) — 飞书官方插件安装配置，让OpenClaw以用户身份操作飞书 `#OpenClaw` `#飞书集成`
- [OpenClaw插件终极指南](../02-AI-Skills-and-Plugins/Plugins/OpenClaw插件终极指南/index.md) — 系统讲解Skill/Tool/Plugin三者边界及Plugin开发全流程 `#Plugin开发` `#OpenClaw架构`

### Integrations (5)

- [OpenClaw语音能力开通](../02-AI-Skills-and-Plugins/Integrations/OpenClaw语音能力开通/index.md) — 通过ElevenLabs API为OpenClaw启用TTS语音回复功能 `#TTS` `#语音集成`
- [OpenClaw文档识别配置](../02-AI-Skills-and-Plugins/Integrations/OpenClaw文档识别配置/index.md) — 接入PaddleOCR实现低成本文档识别，打通线下数据到AI流程 `#OCR` `#文档识别`
- [OpenClaw微信接入](../02-AI-Skills-and-Plugins/Integrations/OpenClaw微信接入/index.md) — 通过WorkBuddy将微信变为OpenClaw对话入口的配置教程 `#微信` `#渠道接入`
- [OpenClaw通话功能实现](../02-AI-Skills-and-Plugins/Integrations/OpenClaw通话功能实现/index.md) — 基于TEN-framework为OpenClaw搭建实时语音通话能力 `#语音通话` `#RTC`
- [Telegram多角色群聊搭建](../02-AI-Skills-and-Plugins/Integrations/Telegram多角色群聊搭建/index.md) — 单Bot多群组路由实现Telegram多角色AI团队协作 `#Telegram` `#多Agent`

---

## 03-Claude-Code

### Tutorials (7)

- [CLAUDE.md配置示例](../03-Claude-Code/Tutorials/CLAUDE.md配置示例/index.md) — 一份包含工作流编排、任务管理和核心原则的CLAUDE.md参考模板 `#CLAUDE.md` `#配置模板`
- [Claude百小时实测指南](../03-Claude-Code/Tutorials/Claude百小时实测指南/index.md) — 百小时实战总结Claude订阅选择、提示工程和高级工具链用法 `#Claude入门` `#实战经验`
- [Claude新手终极指南2026](../03-Claude-Code/Tutorials/Claude新手终极指南2026/index.md) — 英文版Claude全功能入门指南，涵盖提示公式到Code和Cowork `#新手指南` `#Claude全栈`
- [ClaudeCode架构与治理](../03-Claude-Code/Tutorials/ClaudeCode架构与治理/index.md) — 深度解析Claude Code六层架构、上下文治理与Skills/Hooks设计 `#架构设计` `#上下文工程`
- [ClaudeCode官方十三条指导](../03-Claude-Code/Tutorials/ClaudeCode官方十三条指导/index.md) — Claude Code创始工程师Boris分享的13条官方最佳实践 `#官方指导` `#最佳实践`
- [ClaudeCode三十一天教程](../03-Claude-Code/Tutorials/ClaudeCode三十一天教程/index.md) — 31天每日一技巧，从快捷键到子代理模式的系统性功能教程 `#每日技巧` `#功能速查`
- [ClaudeCowork入门套件](../03-Claude-Code/Tutorials/ClaudeCowork入门套件/index.md) — Cowork完整入门包：插件安装、上下文文件和日常工作流模板 `#Cowork` `#工作流自动化`

### Environment (3)

- [Ghostty-SAND快捷键方案](../03-Claude-Code/Environment/Ghostty-SAND快捷键方案/index.md) — 用SAND四字母助记法掌握Ghostty分屏导航与多Agent布局 `#Ghostty` `#快捷键`
- [Ghostty搭配ClaudeCode](../03-Claude-Code/Environment/Ghostty搭配ClaudeCode/index.md) — 小白友好的Ghostty安装配置教程，含主题美化和分屏实操 `#Ghostty` `#终端配置`
- [Yazi文件管理器配置](../03-Claude-Code/Environment/Yazi文件管理器配置/index.md) — Rust终端文件管理器Yazi的安装配置，补齐Claude Code文件浏览短板 `#Yazi` `#文件管理`

### Scraping (2)

- [ClaudeCode五种抓取方案](../03-Claude-Code/Scraping/ClaudeCode五种抓取方案/index.md) — 实测对比WebFetch到Agent-Reach五种方案的适用场景与选型建议 `#网页抓取` `#方案对比`
- [Scrapling抓取工作流](../03-Claude-Code/Scraping/Scrapling抓取工作流/index.md) — Scrapling自适应解析框架介绍，适合长期维护的批量采集底座 `#Scrapling` `#爬虫框架`

---

## 04-AI-Infrastructure

### API-Proxy (3)

- [自建中转零封号](../04-AI-Infrastructure/API-Proxy/自建中转零封号/index.md) — Sub2API自建中转站完整部署流程，两个月零封号实战经验 `#API中转` `#Sub2API` `#防封号`
- [从零搭建API中转站](../04-AI-Infrastructure/API-Proxy/从零搭建API中转站/index.md) — 揭露第三方中转五大隐患，用Cloudflare+Sub2API从零自建安全中转站 `#API中转` `#Cloudflare` `#安全部署`
- [sub2api部署指南](../04-AI-Infrastructure/API-Proxy/sub2api部署指南/index.md) — Sub2API小白向Docker部署教程，含六步完整配置和运维命令 `#Sub2API` `#Docker` `#部署指南`

### Optimization (2)

- [OpenClaw-API聚合工具大全](../04-AI-Infrastructure/Optimization/OpenClaw-API聚合工具大全/index.md) — 汇总十余个开源LLM API聚合与中转项目，涵盖多平台免费接入方案 `#API聚合` `#开源工具` `#免费额度`
- [QMD搜索与ZenMux省Token](../04-AI-Infrastructure/Optimization/QMD搜索与ZenMux省Token/index.md) — QMD本地语义检索替代全量上下文，配合ZenMux订阅实现20倍Token节省 `#QMD` `#Token优化` `#ZenMux`

---

## 05-AI-Applications

### Content-Creation (4)

- [AI生成PPT方案汇总](../05-AI-Applications/Content-Creation/AI生成PPT方案汇总/index.md) — 对比Gemini图片生成、Agent编辑模板、SVG网页三种AI做PPT路线的优缺点 `#PPT生成` `#Gemini` `#Claude`
- [NotebookLM快速上手](../05-AI-Applications/Content-Creation/NotebookLM快速上手/index.md) — Google NotebookLM十大功能详解，基于资料零幻觉的研究、笔记与PPT工具 `#NotebookLM` `#知识管理` `#Google`
- [OpenClaw自动采集发公众号](../05-AI-Applications/Content-Creation/OpenClaw自动采集发公众号/index.md) — 用OpenClaw自动抓取资讯、配图并发布微信公众号，成本每篇约1元 `#OpenClaw` `#公众号` `#自动化`
- [OpenClaw四兄弟写作实战](../05-AI-Applications/Content-Creation/OpenClaw四兄弟写作实战/index.md) — 四个AI Agent组队协作实战，利用OpenClaw记忆与人格系统打造数字分身 `#OpenClaw` `#多Agent协作` `#SOUL.md`

### Research (2)

- [ClaudeCode辅助写论文](../05-AI-Applications/Research/ClaudeCode辅助写论文/index.md) — Claude Code在绘图、代码迁移和数学证明格式化上表现出色，但无法调试基础设施问题 `#ClaudeCode` `#学术写作` `#科研工具`
- [Karpathy自动研究入门](../05-AI-Applications/Research/Karpathy自动研究入门/index.md) — 基于Karpathy autoresearch框架一条命令启动自动化ML实验循环并追踪结果 `#autoresearch` `#ML实验` `#Karpathy`

### Finance-Tools (2)

- [OpenClaw精简版彭博终端](../05-AI-Applications/Finance-Tools/OpenClaw精简版彭博终端/index.md) — 接入OpenBB开源金融数据平台，让OpenClaw免费获取股票、宏观、期权等数据 `#OpenBB` `#金融数据` `#OpenClaw`
- [金融行业十大Skills](../05-AI-Applications/Finance-Tools/金融行业十大Skills/index.md) — 金融场景十个ClawHub必装Skill，覆盖A股数据、监控告警到办公自动化全流程 `#ClawHub` `#金融Skills` `#量化数据`

---

## 06-LLM-Foundations

- [AI原生时代个人系统M-PPS](../06-LLM-Foundations/AI原生时代个人系统M-PPS/index.md) — 用自然语言驱动的Claude Skills构建个人目标、日程、反思管理系统，无需编码 `#M-PPS` `#AI原生` `#个人管理`
- [百万步LLM任务零错误](../06-LLM-Foundations/百万步LLM任务零错误/index.md) — MAKER系统通过极端任务分解与多Agent投票纠错，实现百万步LLM任务零错误 `#MDAP` `#错误纠正` `#任务分解`

---

## 07-Software-Engineering

*暂无条目*

---

## 10-Thinking-Models

- [四种产品发现模型](../10-Thinking-Models/四种产品发现模型/index.md) — 用2x2矩阵梳理产品发现的四种组织模式及各自利弊 `#产品管理` `#决策模型` `#组织设计`

---

## 11-Philosophy

*暂无条目*

---

## 12-Psychology

*暂无条目*

---

## 13-History

*暂无条目*

---

## 20-Investment

### Fundamentals (6)

- [好久不见](../20-Investment/Fundamentals/好久不见/index.md) — 市场估值升温后如何看待仓位调整与回归企业研究 `#估值` `#资产配置` `#市场温度`
- [欲行其事先立其规](../20-Investment/Fundamentals/欲行其事先立其规/index.md) — 个股投资的资金配置、买卖策略和持有纪律框架 `#投资框架` `#仓位管理` `#纪律`
- [先筛选再判断](../20-Investment/Fundamentals/先筛选再判断/index.md) — 以ROE、营收增速、PEG等指标建立择股筛选漏斗 `#择股标准` `#ROE` `#PEG`
- [投资Checklist](../20-Investment/Fundamentals/投资Checklist/index.md) — 从定量指标到定性关键问题构建完整投资决策流程 `#决策流程` `#Checklist` `#企业研究`
- [看看择偶结果](../20-Investment/Fundamentals/看看择偶结果/index.md) — 用筛选标准实测A股5000余家公司仅8家达标的过程 `#实战筛选` `#标准验证` `#A股`
- [胡猛北大价值投资课2025](../20-Investment/Fundamentals/胡猛北大价值投资课2025/index.md) — 65亿美元对冲基金经理区分投资与投机并分享实战经验 `#投机` `#对冲基金` `#价值投资`

### Analysis (6)

- [好投资的延长公式](../20-Investment/Analysis/好投资的延长公式/index.md) — 提出好投资=好企业x好价格x长时间x可持有度的扩展公式 `#投资公式` `#安踏` `#长期持有`
- [企业地图财务与业务](../20-Investment/Analysis/企业地图财务与业务/index.md) — 以财务为线索深入业务本质的企业分析方法论 `#财务分析` `#企业研究` `#分析框架`
- [解读成长的含金量](../20-Investment/Analysis/解读成长的含金量/index.md) — 通过营收与净利润增速的同步性判断企业成长质量 `#成长性` `#营收分析` `#利润质量`
- [透视利润的外衣](../20-Investment/Analysis/透视利润的外衣/index.md) — 用扣非净利润剥离资本运作等非经常性损益看真实盈利 `#扣非净利润` `#非经常性损益` `#财务透视`
- [增速为何不同频](../20-Investment/Analysis/增速为何不同频/index.md) — 拆解安踏营收与利润增速差异背后的成本费用结构变化 `#增速分析` `#成本结构` `#安踏`
- [打开一份年报](../20-Investment/Analysis/打开一份年报/index.md) — 以安踏年报为例介绍阅读和评估上市公司年报的方法 `#年报阅读` `#信息披露` `#企业分析`

### Macro (6)

- [正眼看数据当下身在何处](../20-Investment/Macro/正眼看数据当下身在何处/index.md) — 2025年一季度A股各行业利润数据边际改善但仍含水分 `#宏观数据` `#行业利润` `#经济周期`
- [侧眼看数据冰火两重天](../20-Investment/Macro/侧眼看数据冰火两重天/index.md) — 统计各行业利润同比变化揭示结构性分化与周期拐点 `#行业分化` `#数据分析` `#周期`
- [回看数据2024年末](../20-Investment/Macro/回看数据2024年末/index.md) — 2024年四季度A股利润创五年新低的全景数据复盘 `#季度数据` `#利润趋势` `#房地产`
- [关税观察和应对](../20-Investment/Macro/关税观察和应对/index.md) — 2025年关税战首轮冲击下的市场观察与逆全球化思考 `#关税战` `#逆全球化` `#博弈`
- [关税懂王的算盘](../20-Investment/Macro/关税懂王的算盘/index.md) — 拆解美国关税策略背后的制造业、美元霸权和债务拼图 `#美债` `#美元霸权` `#关税策略`
- [关税盘点谁的内忧外患](../20-Investment/Macro/关税盘点谁的内忧外患/index.md) — 关税战下半场美债困局与中美博弈的利益推演 `#美债危机` `#中美博弈` `#关税盘点`

### Commentary (4)

- [告别信息FOMO](../20-Investment/Commentary/告别信息FOMO/index.md) — 清零重启信息流建立分层筛选机制对抗信息焦虑 `#信息管理` `#FOMO` `#深度阅读`
- [深度处理VS摘要消费](../20-Investment/Commentary/深度处理VS摘要消费/index.md) — AI摘要时代更应深度精读少量内容而非浅层消费 `#深度处理` `#AI摘要` `#认知构建`
- [猫眼价值专栏](../20-Investment/Commentary/猫眼价值专栏/index.md) — 投资系列全篇目录索引从框架到企业分析的完整脉络 `#专栏索引` `#投资系列` `#目录`
- [番外十项全能新时代](../20-Investment/Commentary/番外十项全能新时代/index.md) — AI时代个人应从螺丝钉心态转向CEO式多维能力构建 `#AI时代` `#多维能力` `#角色转变`

---

## 21-Business

- [特拉华州公司年审缴税指南](../21-Business/特拉华州公司年审缴税指南/index.md) — 特拉华州LLC年审缴税的保姆级实操流程与费用说明 `#公司注册` `#年审报税` `#特拉华`

---

## 22-Political-Economy

*暂无条目*

---

## 30-Medicine-and-Health

*暂无条目*
