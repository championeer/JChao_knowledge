---
title: "扫了1000+个仓库，测了200+个技能，终于找到这90个真正能用的AI神器！"
source: "https://x.com/gxjdian/status/2035273411602358646"
author:
  - "[[Unknown]]"
published: 2026-03-21
created: 2026-03-21
description:
tags:
  - "clippings"
---
说实话，现在 AI 工具多到让人眼花缭乱。GitHub 上随便一搜，几千个仓库；技能市场上一看，6 万多个 Skills。但你知道吗？大部分都是凑数的，真正好用的其实就那么几十个。

我花了好几周时间，扫描了 1000 多个 GitHub 仓库，亲手测试了 200 多个 Claude Skills，就为了帮你省下这个时间。今天就把这份压箱底的清单分享给你——90 个真正值得装的 AI 工具，包括 Claude Skills、MCP 服务器和 GitHub 仓库。零废话，全是干货。

## 第一部分：Claude Skills——你的 AI 技能商店

先说说 Claude Skills 是啥。简单理解，它就像是给 AI 装插件，教会它做各种专业的事儿。现在市面上有 6 万多个社区技能，但我测下来，真正值得装的就这 22 个。

文档办公类（Anthropic 官方出品）📰

这几个是官方出的，质量有保证，做知识工作的人必装：

**01 — PDF 处理** 能读 PDF、提取表格、填表单、合并拆分文档。对知识工作者来说，这是使用率最高的技能。 👉 [https://github.com/anthropics/skills/tree/main/skills/pdf](https://github.com/anthropics/skills/tree/main/skills/pdf)

**02 — Word 文档（DOCX）** 创建和编辑 Word 文档，支持修订追踪、批注、格式调整。写报告、改文档必备。 👉 [https://github.com/anthropics/skills/tree/main/skills/docx](https://github.com/anthropics/skills/tree/main/skills/docx)

**03 — PPT 制作（PPTX）** 用自然语言就能生成幻灯片，自动排版、插图表、加备注。做汇报再也不用熬夜了。 👉 [https://github.com/anthropics/skills/tree/main/skills/pptx](https://github.com/anthropics/skills/tree/main/skills/pptx)

**04 — Excel 表格（XLSX）** 用大白话就能搞定公式、数据分析、图表生成。不用再死记 Excel 函数了。 👉 [https://github.com/anthropics/skills/tree/main/skills/xlsx](https://github.com/anthropics/skills/tree/main/skills/xlsx)

**05 — 文档协作** 真正的人机协作写作。你写一段，Claude 接一段，来回对话式创作。 👉 [https://github.com/anthropics/skills/tree/main/skills/doc-coauthoring](https://github.com/anthropics/skills/tree/main/skills/doc-coauthoring)

设计创意类 🎨

这几个能让你的 AI 摆脱那种“一看就是 AI 做的”廉价感：

**06 — 前端设计** 告别“AI 垃圾美学”。真正的设计系统，大胆的排版，专业的视觉效果。已经有 27.7 万+人装了。 👉 [https://github.com/anthropics/skills/tree/main/skills/frontend-design](https://github.com/anthropics/skills/tree/main/skills/frontend-design)

**07 — 画布设计** 做社交媒体图、海报、封面图，输入文字就能输出 PNG/PDF。 👉 [https://github.com/anthropics/skills/tree/main/skills/canvas-design](https://github.com/anthropics/skills/tree/main/skills/canvas-design)

**08 — 算法艺术** 用 p5.js 生成分形图案、几何构图。玩创意的人会喜欢。 👉 [https://github.com/anthropics/skills/tree/main/skills/algorithmic-art](https://github.com/anthropics/skills/tree/main/skills/algorithmic-art)

**09 — 主题工厂** 一句话批量生成配色方案。做品牌设计的时候特别好用。 👉 [https://github.com/anthropics/skills/tree/main/skills/theme-factory](https://github.com/anthropics/skills/tree/main/skills/theme-factory)

**10 — Web 组件构建器** 用自然语言做计算器、仪表盘这些交互组件。不需要懂前端也能做。 👉 [https://github.com/anthropics/skills/tree/main/skills/web-artifacts-builder](https://github.com/anthropics/skills/tree/main/skills/web-artifacts-builder)

开发工程类 👨‍💻

程序员的福音来了：

**11 — Superpowers 超能力包** 这是个技能合集，包含 20 多个久经考验的技能。TDD 测试驱动开发、调试、从计划到执行的完整流程。GitHub 上 9.6 万+星标。 👉 [https://github.com/obra/superpowers](https://github.com/obra/superpowers)

**12 — 系统化调试** 先找根本原因，再动手修 bug。四阶段方法论，SkillHub 评分 9.2。 👉 [https://github.com/obra/superpowers](https://github.com/obra/superpowers)

**13 — 文件搜索** 精通 ripgrep 和 ast-grep 的搜索大师。评分 9.0。 👉 [https://github.com/massgen/massgen](https://github.com/massgen/massgen)

**14 — 上下文优化** 降低 token 成本，玩转 KV-cache 技巧。GitHub 1.39 万星。 👉 [https://github.com/muratcankoylan/agent-skills-for-context-engineering](https://github.com/muratcankoylan/agent-skills-for-context-engineering)**14 — 上下文优化** 降低代币成本，玩转 KV-cache 技巧。GitHub 1.39 万星。 👉 [https://github.com/muratcankoylan/agent-skills-for-context-engineering](https://github.com/muratcankoylan/agent-skills-for-context-engineering)

**15 — 技能创建器（官方）** 这是个元技能：描述一个工作流程，5 分钟就能生成一个 SKILL.md 文件。 👉 [https://github.com/anthropics/skills/tree/main/skills/skill-creator](https://github.com/anthropics/skills/tree/main/skills/skill-creator)

**16 — Remotion 最佳实践** AI 视频生成。每周 11.7 万次安装。 👉 [https://github.com/remotion-dev/remotion](https://github.com/remotion-dev/remotion)

营销 SEO 类 🗞️

做增长、做内容的看这里：

**17 — Corey Haines 的营销技能包** 20 多个技能：转化率优化、文案写作、SEO、邮件序列、增长策略。 👉 [https://github.com/coreyhaines31/marketingskills](https://github.com/coreyhaines31/marketingskills)

**18 — Claude SEO** 全站 SEO 审计、Schema 验证。包含 12 个子技能。 👉 [https://github.com/AgriciDaniel/claude-seo](https://github.com/AgriciDaniel/claude-seo)**18 — Claude SEO** 全站 SEO 审计、Schema 验证。包含 12 个子技能。 👉 [https://github.com/AgriciDaniel/claude-seo](https://github.com/AgriciDaniel/claude-seo)

**19 — 品牌指南** 把你的品牌规范编码成技能，自动应用到所有地方。 👉 [https://github.com/anthropics/skills/tree/main/skills/brand-guidelines](https://github.com/anthropics/skills/tree/main/skills/brand-guidelines)

知识学习类 🧠

最后是学习和知识管理：

**20 — NotebookLM 集成** Claude 和 NotebookLM 的桥梁。生成摘要、思维导图、记忆卡片。 👉 [https://github.com/PleasePrompto/notebooklm-skill](https://github.com/PleasePrompto/notebooklm-skill)

**21 — Obsidian 技能** Obsidian CEO 亲自做的。自动打标签、自动链接、原生支持笔记库。 👉 [https://github.com/kepano/obsidian-skills](https://github.com/kepano/obsidian-skills)

**22 — Excel MCP 服务器** 不用装 Microsoft Excel 也能操作 Excel 文件。 👉 [https://github.com/haris-musa/excel-mcp-server](https://github.com/haris-musa/excel-mcp-server)

**想看更多？**

- 官方技能库：[github.com/anthropics/skills](http://github.com/anthropics/skills)官方技能库： [github.com/anthropics/skills](http://github.com/anthropics/skills)
- 社区技能市场：[skillsmp.com](http://skillsmp.com/)（8 万+技能）

## 第二部分：我最爱用的 MCP 服务器

说完 Skills，再聊聊 MCP 服务器。简单说，Skills 是教 Claude“怎么做事”，MCP 是给它“连接外部世界的能力”。这三个改变了我的工作流程：

Tavily塔维利

专门为 AI Agent 打造的搜索引擎。不是给你一堆蓝色链接，而是直接返回干净的结构化数据。四个工具：搜索、提取、爬取、映射。一分钟就能接入。

👉 [https://github.com/tavily-ai/tavily-mcp](https://github.com/tavily-ai/tavily-mcp)

Context7上下文7

把最新的库文档实时注入到 LLM 的上下文里。不会再有幻觉 API 了，不会再有过时方法了。只需要在提示词里加一句“use context7”。支持 Next.js、React、Supabase、MongoDB 等几千个库。

👉 [https://github.com/upstash/context7](https://github.com/upstash/context7)

Task Master AI任务大师人工智能

你的 AI 项目经理。输入一个 PRD（产品需求文档）→ 生成带依赖关系的结构化任务 → Claude 一个接一个执行。把混乱的对话变成规范的流水线。支持 Cursor、Claude Code、Windsurf。

👉 [https://github.com/eyaltoledano/claude-task-master](https://github.com/eyaltoledano/claude-task-master)

## 第三部分：GitHub 仓库——25 个驱动 AI 革命的开源引擎

现在进入重头戏。这 25 个开源项目，是整个 AI 革命背后的引擎。

Agent 框架类

**23 — OpenClaw** 那个爆火的 AI Agent。持久化、多渠道、会自己写技能。GitHub 21 万+星标。 👉 [https://github.com/openclaw/openclaw](https://github.com/openclaw/openclaw)

**24 — AutoGPT** 完整的 Agent 平台，专门处理长时间运行的任务。 👉 [https://github.com/Significant-Gravitas/AutoGPT](https://github.com/Significant-Gravitas/AutoGPT)

**25 — LangGraph** 把 Agent 当作图来编排。多 Agent 协作。2.68 万星。 👉 [https://github.com/langchain-ai/langgraph](https://github.com/langchain-ai/langgraph)**25 — LangGraph** 把 Agent 当作图来编排。多 Agent 协作。 2.68 万星。 👉 [https://github.com/langchain-ai/langgraph](https://github.com/langchain-ai/langgraph)

**26 — OWL** 多 Agent 协作框架。在 GAIA 基准测试中名列前茅。 👉 [https://github.com/camel-ai/owl](https://github.com/camel-ai/owl)

**27 — Dify** 开源的 LLM 应用构建器。工作流、RAG、Agent 一体化。 👉 [https://github.com/langgenius/dify](https://github.com/langgenius/dify)

**28 — CrewAI** 多 Agent 系统，每个 Agent 有角色、目标、背景故事。 👉 [https://github.com/crewAIInc/crewAI](https://github.com/crewAIInc/crewAI)

**29 — CopilotKit** 把 AI 副驾驶嵌入到 React 应用里。 👉 [https://github.com/CopilotKit/CopilotKit](https://github.com/CopilotKit/CopilotKit)**29 — 副驾驶套件** 把 AI 副驾驶嵌入到 React 应用里。 👉 [https://github.com/CopilotKit/CopilotKit](https://github.com/CopilotKit/CopilotKit)

本地 AI 类

**30 — Ollama** 一条命令就能在本地运行大语言模型。 👉 [https://github.com/ollama/ollama](https://github.com/ollama/ollama)

**31 — Open WebUI** 自托管的 ChatGPT 式界面。 👉 [https://github.com/open-webui/open-webui](https://github.com/open-webui/open-webui)31 — 打开 WebUI 自托管的 ChatGPT 式界面。 👉 https://github.com/open-webui/open-webui

**32 — LlamaFile** 把 LLM 打包成单个可执行文件。零依赖。 👉 [https://github.com/Mozilla-Ocho/llamafile](https://github.com/Mozilla-Ocho/llamafile)

**33 — Unsloth** 微调速度提升 2 倍，内存占用减少 70%。 👉 [https://github.com/unslothai/unsloth](https://github.com/unslothai/unsloth)

工作流自动化类

**34 — n8n** 开源自动化平台，400 多个集成+AI 节点。 👉 [https://github.com/n8n-io/n8n](https://github.com/n8n-io/n8n)

**35 — Langflow** 可视化拖拽构建 Agent 流水线。14 万星。 👉 [https://github.com/langflow-ai/langflow](https://github.com/langflow-ai/langflow)

**36 — Huginn** 自托管的 Web Agent。监控、告警。隐私优先。 👉 [https://github.com/huginn/huginn](https://github.com/huginn/huginn)

搜索数据类

**37 — GPT Researcher** 自主研究→编译成报告。 👉 [https://github.com/assafelovic/gpt-researcher](https://github.com/assafelovic/gpt-researcher)37 — GPT 研究员 自主研究→编译成报告。 👉 https://github.com/assafelovic/gpt-researcher

**38 — Firecrawl** 把任何网站转成 LLM 可用的数据。 👉 [https://github.com/mendableai/firecrawl](https://github.com/mendableai/firecrawl)

**39 — Vanna AI** 自然语言转 SQL。 👉 [https://github.com/vanna-ai/vanna](https://github.com/vanna-ai/vanna)39 — AI 浴室 自然语言转 SQL。 👉 https://github.com/vanna-ai/vanna

开发工具类

**40 — Codebase Memory MCP** 把代码库转成持久化的知识图谱。 👉 [https://github.com/DeusData/codebase-memory-mcp](https://github.com/DeusData/codebase-memory-mcp)40 — 代码库内存 MCP 把代码库转成持久化的知识图谱。 👉 https://github.com/DeusData/codebase-memory-mcp

**41 — DSPy** 编程（而不是提示词工程）基础模型。 👉 [https://github.com/stanfordnlp/dspy](https://github.com/stanfordnlp/dspy)

**42 — Spec Kit（GitHub 出品）** 规范驱动开发。写规范，AI 生成代码。5 万+星。 👉 [https://github.com/github/spec-kit](https://github.com/github/spec-kit)

**43 — NVIDIA NemoClaw** 自主 Agent 的安全沙箱。 👉 [https://github.com/NVIDIA/NemoClaw](https://github.com/NVIDIA/NemoClaw)43 — NVIDIA NemoClaw 自主 Agent 的安全沙箱。 👉 https://github.com/NVIDIA/NemoClaw

精选合集类

**44 — Awesome Claude Skills** 最好的技能精选列表。2.2 万+星。 👉 [https://github.com/travisvn/awesome-claude-skills](https://github.com/travisvn/awesome-claude-skills)44 — 克劳德的超棒技能 最好的技能精选列表。 2.2 万+星。 👉 https://github.com/travisvn/awesome-claude-skills

**45 — Anthropic Skills 仓库** 官方参考实现。 👉 [https://github.com/anthropics/skills](https://github.com/anthropics/skills)45 — 人类技能仓库 官方参考实现。 👉 https://github.com/anthropics/skills

👉 [https://github.com/wlzh/skills](https://github.com/wlzh/skills)👉 [https://github.com/wlzh/skills](https://github.com/wlzh/skills)

**46 — Awesome Agents** 100 多个开源 Agent 工具。 👉 [https://github.com/kyrolabs/awesome-agents](https://github.com/kyrolabs/awesome-agents)**46 — 优秀经纪人** 100多个开源代理工具。 👉 [https://github.com/kyrolabs/awesome-agents](https://github.com/kyrolabs/awesome-agents)

**47 — MAGI//ARCHIVE** 每日更新的新鲜 AI 仓库动态。 👉 [https://tom-doerr.github.io/repo\_posts/](https://tom-doerr.github.io/repo_posts/)

## 第四部分：40 个值得关注的新鲜 GitHub 仓库

我从 GitHub 论坛扫描了 1000 多个仓库，挑出了最有意思的 AI 项目。记得自己做安全检查哦。

Agent 编排与多 Agent 🤖

- **gstack** — 把 Claude Code 变成虚拟工程团队 [https://github.com/garrytan/gstack](https://github.com/garrytan/gstack)**gstack** — 把 Claude Code 变成虚拟工程团队 [https://github.com/garrytan/gstack](https://github.com/garrytan/gstack)
- **cmux** — 并行运行多个 Claude Agent [https://github.com/craigsc/cmux](https://github.com/craigsc/cmux)**cmux** — 上行这些最好的 Claude Agent [https://github.com/craigsc/cmux](https://github.com/craigsc/cmux)
- **figaro** — 在桌面上编排 Claude Agent 舰队 [https://github.com/byt3bl33d3r/figaro](https://github.com/byt3bl33d3r/figaro)**Figaro** — 在桌面上编排 Claude Agent 舰队 [https://github.com/byt3bl33d3r/figaro](https://github.com/byt3bl33d3r/figaro)
- **claude-squad** — 终端里的并行 Agent 会话 [https://github.com/smtg-ai/claude-squad](https://github.com/smtg-ai/claude-squad)**claude-squad** — 终端里的并行 Agent 会话 [https://github.com/smtg-ai/claude-squad](https://github.com/smtg-ai/claude-squad)
- **deer-flow（字节跳动）** — 通过技能实现子 Agent 和沙箱 [https://github.com/bytedance/deer-flow](https://github.com/bytedance/deer-flow)
- **SWE-AF** — 一个 API 调用就能启动工程团队 [https://github.com/Agent-Field/SWE-AF](https://github.com/Agent-Field/SWE-AF)
- **AIlice** — 复杂任务→动态 Agent [https://github.com/myshell-ai/AIlice](https://github.com/myshell-ai/AIlice)**AIlice** — 复杂任务 → 动态代理 [https://github.com/myshell-ai/AIlice](https://github.com/myshell-ai/AIlice)
- **Agent Alchemy** — Claude Code + 插件 + 任务管理器 [https://github.com/sequenzia/agent-alchemy](https://github.com/sequenzia/agent-alchemy)**Agent Alchemy** — Claude Code + 插件+ 任务管理器 [https://github.com/sequenzia/agent-alchemy](https://github.com/sequenzia/agent-alchemy)

Agent 基础设施与安全 🔐

- **Ghost OS** — AI Agent 操作所有 Mac 应用 [https://github.com/ghostwright/ghost-os](https://github.com/ghostwright/ghost-os)**Ghost OS** — AI Agent 操作所有 Mac 应用 [https://github.com/ghostwright/ghost-os](https://github.com/ghostwright/ghost-os)
- **e2b/desktop** — 为 Agent 隔离的虚拟桌面 [https://github.com/e2b-dev/desktop](https://github.com/e2b-dev/desktop)**e2b/desktop** — 为 Agent 隔离的虚拟桌面 [https://github.com/e2b-dev/desktop](https://github.com/e2b-dev/desktop)
- **container-use（Dagger）** — 编码 Agent 的容器化环境 [https://github.com/dagger/container-use](https://github.com/dagger/container-use)**container-use（Dagger）** — 编码 Agent 的容器化环境 [https://github.com/dagger/container-use](https://github.com/dagger/container-use)
- **Canopy** — AI Agent 的加密 P2P 网格 [https://github.com/kwalus/Canopy](https://github.com/kwalus/Canopy)**Canopy** — AI Agent 的加密 P2P 网格 [https://github.com/kwalus/Canopy](https://github.com/kwalus/Canopy)
- **agent-governance-toolkit（微软）** — Agent 的安全中间件 [https://github.com/microsoft/agent-governance-toolkit](https://github.com/microsoft/agent-governance-toolkit)**agent-governance-toolkit（微软）** — Agent 的安全中间件 [https://github.com/microsoft/agent-governance-toolkit](https://github.com/microsoft/agent-governance-toolkit)
- **claude-code-security-review（Anthropic）** — 分析 PR 的安全性 [https://github.com/anthropics/claude-code-security-review](https://github.com/anthropics/claude-code-security-review)**claude-code-security-review（Anthropic）** — 分析 PR 的安全性 [https://github.com/anthropics/claude-code-security-review](https://github.com/anthropics/claude-code-security-review)
- **promptfoo** — AI 模型的自动化安全测试 [https://github.com/promptfoo/promptfoo](https://github.com/promptfoo/promptfoo)**promptfoo** — AI 模型的自动化安全测试 [https://github.com/promptfoo/promptfoo](https://github.com/promptfoo/promptfoo)

记忆与上下文 📝

- **Mem9** — AI Agent 的记忆系统 [https://github.com/mem9-ai/mem9](https://github.com/mem9-ai/mem9)**Mem9——** 人工智能代理的记忆系统 [https://github.com/mem9-ai/mem9](https://github.com/mem9-ai/mem9)
- **Codefire** — 编码 Agent 的持久化记忆 [https://github.com/websitebutlers/codefire-app](https://github.com/websitebutlers/codefire-app)**Codefire** — 编码代理的持久化记忆 [https://github.com/websitebutlers/codefire-app](https://github.com/websitebutlers/codefire-app)
- **Memobase** — LLM 的用户画像记忆 [https://github.com/memodb-io/memobase](https://github.com/memodb-io/memobase)**Memobase** — LLM 的用户画像记忆 [https://github.com/memodb-io/memobase](https://github.com/memodb-io/memobase)

编码 Agent 与开发工具 💻

- **Qwen Code** — QwenLM 出品的终端 AI 编码 Agent [https://github.com/QwenLM/qwen-code](https://github.com/QwenLM/qwen-code)
- **gptme** — 终端里的个人 AI Agent [https://github.com/gptme/gptme](https://github.com/gptme/gptme)**gptme** — 终端里的个人 AI 代理 [https://github.com/gptme/gptme](https://github.com/gptme/gptme)
- **Claude Inspector** — 看到 Claude Code 隐藏的提示词机制 [https://github.com/kangraemin/claude-inspector](https://github.com/kangraemin/claude-inspector)**Claude Inspector** — 看到 Claude Code 隐藏的提示词机制 [https://github.com/kangraemin/claude-inspector](https://github.com/kangraemin/claude-inspector)
- **TDD Guard** — 为 AI Agent 强制执行测试优先 [https://github.com/nizos/tdd-guard](https://github.com/nizos/tdd-guard)**TDD Guard** — 为 AI Agent 强制执行测试优先 [https://github.com/nizos/tdd-guard](https://github.com/nizos/tdd-guard)
- **rendergit（Karpathy）** — Git 仓库→单个文件，人类和 LLM 都能读 [https://github.com/karpathy/rendergit](https://github.com/karpathy/rendergit)**rendergit（Karpathy）** — Git 仓库→单个文件，人类和 LLM 都能读 [https://github.com/karpathy/rendergit](https://github.com/karpathy/rendergit)
- **autoresearch（Karpathy）** — 自主 LLM 训练系统 [https://github.com/karpathy/autoresearch](https://github.com/karpathy/autoresearch)**autoresearch（Karpathy）** — 自主 LLM 训练系统 [https://github.com/karpathy/autoresearch](https://github.com/karpathy/autoresearch)
- **pydantic-ai** — 类型安全的 Agent 框架 [https://github.com/pydantic/pydantic-ai](https://github.com/pydantic/pydantic-ai)**pydantic-ai** — 类型安全代理框架 [https://github.com/pydantic/pydantic-ai](https://github.com/pydantic/pydantic-ai)
- **claude-deep-research-skill** — 8 阶段研究，支持自动续写 [https://github.com/199-biotechnologies/claude-deep-research-skill](https://github.com/199-biotechnologies/claude-deep-research-skill)**claude-deep-research-skill** — 8 阶段研究，支持自动续写 [https://github.com/199-biotechnologies/claude-deep-research-skill](https://github.com/199-biotechnologies/claude-deep-research-skill)

MCP 与集成 🔗

- **MCP Playwright** — 为 LLM 提供浏览器自动化 [https://github.com/executeautomation/mcp-playwright](https://github.com/executeautomation/mcp-playwright)**MCP Playwright** — 为 LLM 提供浏览器自动化 [https://github.com/executeautomation/mcp-playwright](https://github.com/executeautomation/mcp-playwright)
- **stealth-browser-mcp** — 无法检测的浏览器自动化 [https://github.com/vibheksoni/stealth-browser-mcp](https://github.com/vibheksoni/stealth-browser-mcp)**stealth-browser-mcp** — 无法检测的浏览器自动化 [https://github.com/vibheksoni/stealth-browser-mcp](https://github.com/vibheksoni/stealth-browser-mcp)
- **fastmcp** — 用最少的 Python 代码构建 MCP 服务器 [https://github.com/jlowin/fastmcp](https://github.com/jlowin/fastmcp)
- **markdownify-mcp** — PDF、图片、音频→Markdown [https://github.com/zcaceres/markdownify-mcp](https://github.com/zcaceres/markdownify-mcp)
- **MCPHub** — 通过 HTTP 管理多个 MCP 服务器 [https://github.com/samanhappy/mcphub](https://github.com/samanhappy/mcphub)**MCPHub** — 通过 HTTP 管理多个 MCP 服务器 [https://github.com/samanhappy/mcphub](https://github.com/samanhappy/mcphub)

搜索、数据与 LLM 工具 🔍

- **CK（BeaconBay）** — 按语义搜索代码，不是关键词 [https://github.com/BeaconBay/ck](https://github.com/BeaconBay/ck)
- **ExtractThinker** — 文档智能的 ORM [https://github.com/enoch3712/ExtractThinker](https://github.com/enoch3712/ExtractThinker)
- **OmniRoute** — 44+个 AI 提供商的 API 代理 [https://github.com/diegosouzapw/OmniRoute](https://github.com/diegosouzapw/OmniRoute)**OmniRoute** — 44+个 AI 提供商的 API 代理 [https://github.com/diegosouzapw/OmniRoute](https://github.com/diegosouzapw/OmniRoute)
- **dlt** — 从 5000+数据源构建 LLM 原生数据管道 [https://github.com/dlt-hub/dlt](https://github.com/dlt-hub/dlt)
- **simonw/llm** — 本地和远程 LLM 的轻量级 CLI [https://github.com/simonw/llm](https://github.com/simonw/llm)
- **Portkey-AI/gateway** — 路由请求到 250+个 LLM [https://github.com/Portkey-AI/gateway](https://github.com/Portkey-AI/gateway)**Portkey-AI/网关** — 路由请求到 250+个 LLM [https://github.com/Portkey-AI/gateway](https://github.com/Portkey-AI/gateway)
- **lmnr** — 追踪和评估 Agent 行为 [https://github.com/lmnr-ai/lmnr](https://github.com/lmnr-ai/lmnr)**lmnr** — 追踪和评估座席行为 [https://github.com/lmnr-ai/lmnr](https://github.com/lmnr-ai/lmnr)

视频与其他 📽️

- **LTX-Desktop（Lightricks）** — 本地生成和编辑视频 [https://github.com/Lightricks/LTX-Desktop](https://github.com/Lightricks/LTX-Desktop)**LTX-Desktop（Lightricks）** — 本地生成和编辑视频 [https://github.com/Lightricks/LTX-Desktop](https://github.com/Lightricks/LTX-Desktop)
- **MetaClaw** — 不用 GPU 也能进化 AI Agent [https://github.com/aiming-lab/MetaClaw](https://github.com/aiming-lab/MetaClaw)
- **Vane** — 用本地 LLM 的 AI 问答引擎 [https://github.com/ItzCrazyKns/Vane](https://github.com/ItzCrazyKns/Vane)**Vane** — 使用本地 LLM 的 AI 问答引擎 [https://github.com/ItzCrazyKns/Vane](https://github.com/ItzCrazyKns/Vane)

## 去哪里找更多技能？

想要探索更多？这几个地方是宝库：

- [skillsmp.com](http://skillsmp.com/) — 8 万+技能，最大的目录
- [aitmpl.com/skills](http://aitmpl.com/skills) — 模板库，一键安装
- [skillhub.club](https://skillhub.club/) — 3.1 万+技能，AI 评分
- [agentskills.io](http://agentskills.io/) — 官方规范

**怎么安装技能？**

- 个人级：~/.claude/skills/
- 项目级：.claude/skills/

克隆、复制、重启。搞定。

## 总结一下

说到底就三句话：

- **Skills** = 教 Claude 怎么把事情做得更好
- **MCP** = 给 Claude 访问外部工具和数据的能力
- **GitHub 仓库** = 驱动这一切的开源引擎

把这三者结合起来→无敌的 AI 工作流。

## 就这样，现在去搞点东西吧

这份清单我花了好几个小时整理——扫描 1000 多个仓库、测试技能、读文档。如果帮你省了时间，你懂的。

我经常发这类内容——AI 工具、工作流程、提示词，还有我真正在用的东西。没废话，没炒作，只有真正有用的。

关注我，别错过下次更新： **Telegram** → [https://t.me/tgmShareAI](https://t.me/tgmShareAI)

推特→[https://x.com/gxjdian](https://x.com/gxjdian)推特→ [https://x.com/gxjdian](https://x.com/gxjdian)

Youtube→[https://youtube.com/@gxjdian](https://youtube.com/@gxjdian) YouTube→ [https://youtube.com/@gxjdian](https://youtube.com/@gxjdian)

如果你发现了我漏掉的工具——DM 我。我会加到下次更新里。

## 引用链接汇总

Claude Skills 官方资源

- Anthropic 官方技能库：[https://github.com/anthropics/skills](https://github.com/anthropics/skills)Anthropic 官方技能库： [https://github.com/anthropics/skills](https://github.com/anthropics/skills)
- 社区技能市场：[https://skillsmp.com](https://skillsmp.com/)
- 技能模板库：[https://aitmpl.com/skills](https://aitmpl.com/skills)技能模板库： [https://aitmpl.com/skills](https://aitmpl.com/skills)
- SkillHub:[https://skillhub.club](https://skillhub.club/)技能中心： [https://skillhub.club](https://skillhub.club/)
- Agent Skills 官方规范：[https://agentskills.io](https://agentskills.io/)代理技能官方规范： [https://agentskills.io](https://agentskills.io/)