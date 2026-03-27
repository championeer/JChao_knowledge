---
title: "Claude Cowork: The Complete Guide (From 0 to 100)Claude Cowork：完整指南（从 0 到 100）"
source: "https://x.com/dr_cintas/status/2036853598793994449"
author:
  - "[[Unknown]]"
published: 2026-03-26
created: 2026-03-27
description: "#TruthSeeker #INTJ #AI #ChinaData #Founder"
tags:
  - "clippings"
---
## Everything you need to know to set up, automate, and master Claude's desktop agent.你需要了解的关于如何设置、自动化和精通 Claude 桌面代理的一切信息。

Most AI tools are conversation tools. You type, they respond, and then you still have to go do the actual work yourself. 大多数人工智能工具都是对话工具。你输入内容，它们做出回应，但你仍然需要自己完成实际工作。

Claude Cowork works differently. Claude Cowork 的运作方式不同。

You describe what you want done, Claude figures out the steps, accesses your actual files, runs the work, and gives you finished outputs directly to your file system. 你描述你想做的事情，Claude 会找出步骤，访问你的实际文件，运行工作，并将完成的输出直接发送到你的文件系统。

Think about your daily routine. You might have to pull data from 3 different places, reformat a report, send status updates to 5 clients. Cowork can run that whole block of work in a few minutes while you are doing something else.想想你的日常工作流程。你可能需要从三个不同的地方提取数据，重新格式化报告，并向五个客户发送进度更新。Cowork 可以在你做其他事情的时候，在几分钟内完成所有这些工作。

## 1\. Setup and installation1. 设置和安装

Getting started takes about 2 minutes.入门大约需要 2 分钟。

- **Step 1:** Go to [claude.ai/download](https://claude.ai/download) and grab the Claude desktop app. It's available on both macOS and Windows with full feature parity on both platforms.**步骤 1：** 前往 [claude.ai/download](https://claude.ai/download) 然后下载 Claude 桌面应用程序。它同时支持 macOS 和 Windows 系统，并且在两个平台上功能完全相同。
- **Step 2:** Open the app and log in. Look for the mode selector at the top of the interface. You'll see 3 options: Chat, Code, and Cowork. Click **Cowork**.**步骤二：** 打开应用并登录。在界面顶部找到模式选择器。你会看到三个选项：聊天、编程和协作。点击**协作** 。

![图像](https://pbs.twimg.com/media/HERQwfbWkAgScly?format=jpg&name=large)

That's it. You're now in.好了，你现在已经成功登录了。

One thing to know: Cowork requires a paid Claude plan. It's available on Pro ($20/month), and Max ($100/month or $200/month for higher limits). The usage cost is higher than regular chat because multi-step agentic tasks are more compute-intensive. 需要注意的是：Cowork 功能需要付费的 Claude 套餐。该功能适用​​于 Pro 套餐（每月 20 美元）和 Max 套餐（每月 100 美元或 200 美元，后者包含更高额度）。由于多步骤的智能体任务需要更高的计算资源，因此其使用成本高于普通聊天功能。

A single Cowork session organizing files might use as much quota as dozens of regular chat messages.一次 Cowork 会话（例如整理文件）可能消耗的流量与几十条普通聊天消息的流量一样多。

**Your first configuration step (don't skip this):您的第一步配置（请勿跳过此步骤）：**

Go to Settings > Cowork > Edit next to Global Instructions. This is where you tell Claude who you are and how you work, and it applies to every session automatically.前往 “设置” > “协作办公” > “编辑 ”>“全局说明” 。您可以在这里告诉 Claude 您是谁以及您的工作方式，这些设置将自动应用于每次会话。

> EXAMPLE: Global Instructions I'm a professor and AI content creator. My viewers are a mixed of general professionals and non-technical people who want to understand AI simply and practically. Written outputs should be clear, direct, and free of jargon. Reports in Word format unless I say otherwise. Default to landscape orientation for slides. My main projects are: social media content, newsletter posts, and YouTube videos on AI news and tutorials.示例：全局指令 我是一名教授，同时也是人工智能内容创作者。我的受众群体涵盖了各行各业的专业人士和非技术人员，他们都希望以简单易懂、实用有效的方式了解人工智能。书面内容应清晰明了、简洁明了，避免使用专业术语。除非另有说明，报告均以 Word 文档格式提交。幻灯片默认采用横向显示。我的主要项目包括：社交媒体内容、新闻简报以及关于人工智能新闻和教程的 YouTube 视频。

![图像](https://pbs.twimg.com/media/HERRZUWWEAAhL9y?format=jpg&name=large)

Now every task starts with Claude already knowing your context. You never re-explain yourself. You can also set folder-specific instructions, so your marketing folder gets different context than your research folder.现在，Claude 会自动了解您的任务背景，无需您重复解释。您还可以设置文件夹专属指令，例如，市场营销文件夹和研究文件夹的指令就有所不同。

## 2\. Your first task (and the Cowork loop)2. 你的第一个任务（以及联合办公循环）

Here's the core workflow that every Cowork task follows:以下是所有 Cowork 任务遵循的核心工作流程：

1. You describe the outcome you want你描述一下你想要的结果。
2. Claude plans the steps克劳德计划了以下步骤
3. You review and approve您审核并批准
4. Claude executes克劳德执行
5. Finished work lands in your file system完成的工作会保存到你的文件系统中。

Let me start with something almost everyone needs: organizing a messy folder (this actually was my first task when I used it for the very first time).让我先从几乎每个人都需要做的事情说起：整理杂乱的文件夹（这实际上是我第一次使用它时的第一个任务）。

> Help me organize my Downloads folder. Scan the contents and propose a plan: categories and folders to create, how files should be sorted, any naming conventions to apply, and files to flag for review. Show me the plan before making any changes. Only proceed after I approve.请帮我整理一下我的下载文件夹。扫描一下文件夹内容并 提出一个计划：要创建的类别和文件夹，文件如何创建 文件应该进行排序，需要应用任何命名规则，以及文件。 标记为待审核。在进行任何更改之前，请先向我展示方案。 只有在我批准后才能进行。

Notice the last two sentences. Telling Cowork to show you the plan before executing is one of the most important habits you can build. Claude will come back with a structured proposal: categories like Documents, Media, Installers, Archives, the naming conventions it recommends, and a list of files it thinks you should look at. You review. You approve. Then it executes.请注意最后两句话。让 Cowork 在执行前先向您展示计划，这是您可以养成的最重要的习惯之一。Claude 会提供一份结构化的方案：包括文档、媒体、安装程序、归档等类别，推荐的命名规则，以及它认为您应该查看的文件列表。您审核并批准后，它才会执行。

![图像](https://pbs.twimg.com/media/HERSdiQaoAATXx4?format=jpg&name=large)

Here's a more advanced example that shows what Cowork can really do with local files:以下是一个更高级的示例，展示了 Cowork 如何处理本地文件：

> In this folder, I have meeting notes from client calls over the last 3 months. Synthesize the key themes, recurring pain points, and open action items into a single formatted Word document. Organize it by client, then chronologically within each client. Flag any action items that were mentioned more than once.这个文件夹里有我与客户通话的会议记录。 过去三个月。总结关键主题和反复出现的痛点。 并将所有待办事项合并到一个格式化的 Word 文档中。 按客户分类，然后在每个客户内部按时间顺序分类。 标记出被多次提及的行动事项。

That task would take a human assistant most of a day. Claude runs it in minutes, reading every document, pulling threads across them, and producing a clean Word report ready to share.这项任务如果由人工助理完成，需要花费大半天的时间。而克劳德只需几分钟就能搞定，他能阅读每一份文档，梳理其中的线索，并生成一份清晰明了、可以直接分享的 Word 报告。

**Key detail about file access:** Cowork can only access the folders you explicitly grant it permission to. You control which folders Claude can read from and write to, either at the start of a task or through your Settings. This is direct local file access, not uploads or copy-paste. Claude reads your actual files and writes outputs back to your file system.**关于文件访问权限的关键细节：** Cowork 只能访问您明确授予权限的文件夹。您可以控制 Claude 可以读取和写入哪些文件夹，既可以在任务开始时进行设置，也可以通过“设置”进行设置。这是直接的本地文件访问，而非上传或复制粘贴。Claude 会读取您的实际文件，并将输出写回您的文件系统。

**A WORD OF CAUTION:** **Claude Cowork can make mistakes, and because it has real access to your real files, those mistakes have real consequences. It can delete files you didn't want deleted, overwrite something you needed, or reorganize things in ways that break your workflow**. **Get in the habit of backing up important folders before running Cowork on them.****一句提醒：** **Claude Cowork 可能会出错，而且由于它能真正访问你的文件，这些错误会造成实际后果。它可能会删除你不想删除的文件，覆盖你需要的文件，或者以破坏你工作流程的方式重新组织文件** 。 **养成在运行 Cowork 之前备份重要文件夹的习惯。**

## 3\. Connectors (linking Claude to your external tools)3. 连接器（将 Claude 连接到您的外部工具）

Connectors are what turn Cowork from a local file assistant into something that touches your entire workflow. They link Claude to your external services via MCP (Model Context Protocol).连接器让 Cowork 从一个本地文件助手转变为一个能够影响您整个工作流程的工具。它们通过 MCP（模型上下文协议）将 Claude 与您的外部服务连接起来。

To browse them: Settings > Connectors > Browse Connectors.要浏览它们：设置 > 连接器 > 浏览连接器。

You'll find connectors for Google Workspace (Calendar, Drive, Gmail), Slack, Notion, and a growing catalog of others. 您会找到适用于 Google Workspace（日历、云端硬盘、Gmail）、Slack、Notion 以及其他越来越多产品的连接器。

![图像](https://pbs.twimg.com/media/HERSxPeWYAAZiUn?format=jpg&name=large)

There are 2 types: web connectors that run through browser-based APIs, and desktop extensions that run locally with deeper system access.有两种类型：一种是通过基于浏览器的 API 运行的 Web 连接器，另一种是可以在本地运行并具有更深层系统访问权限的桌面扩展程序。

What makes connectors in Cowork different from connectors in regular Claude chat? Cowork 中的连接器与 Claude 常规聊天中的连接器有何不同？

In chat, a Google Drive connector just shows you data. 在聊天中，Google Drive 连接器只会显示数据。

In Cowork, that same connector can save data locally, combine it with your other files, run analysis on it, and push the output back to Drive, all in one task. The integration is active, not passive like qwith Chat.在 Cowork 中，同一个连接器可以将数据保存到本地，将其与其他文件合并，运行分析，并将结果推送回云端硬盘，所有操作都可以在一个任务中完成。这种集成是主动的，不像 qwith Chat 那样是被动的。

> Pull the last 5 project status reports from my Google Drive. Summarize the key milestones and blockers from each. Then draft individual email updates for each project lead, using their name, referencing the specific context of their project, and flagging anything overdue. Save the drafts to Gmail, ready to review and send.从我的 Google 云端硬盘中提取最近 5 个项目状态报告。 总结每个阶段的关键里程碑和障碍。然后起草草案。 为每个项目负责人发送单独的电子邮件更新，邮件中会使用他们的姓名。 参考他们项目的具体背景，并加以标记 所有逾期邮件。将草稿保存到 Gmail，以便审核和发送。

That runs end to end: pulling from Drive, synthesizing across documents, writing personalized emails, and dropping them into Gmail. You review and hit send.整个流程包括：从云端硬盘提取内容、整合文档、撰写个性化邮件，然后将其发送到 Gmail。您只需审核并点击发送即可。

**Claude in Chrome** is another connector worth knowing about. When enabled, Claude can browse the web as part of a task without you switching windows. **Chrome 浏览器中的 Claude** 连接器也值得了解。启用后，Claude 可以在您执行任务的同时浏览网页，而无需您切换窗口。

![图像](https://pbs.twimg.com/media/HERZ075WcAAhCNI?format=jpg&name=large)

It can pull data from websites, fill in forms, do competitive research, and combine what it finds online with your local files.它可以从网站提取数据、填写表格、进行竞品分析，并将在线找到的信息与本地文件结合起来。

> Visit these 5 websites \[list URLs\], note any new blog posts, product announcements, or pricing changes since last week, and write a competitor intelligence summary saved to my Drive folder in this format: \[describe format\].访问以下 5 个网站\[列出网址\]，并记下任何新的博客文章， 产品公告或价格变动（自上周以来） 并撰写一份竞争对手情报摘要，保存到我的账户中。 驱动器文件夹格式如下：\[描述格式\]。

That runs as a real task touching the actual web and your actual file system.它会像真正的任务一样运行，直接访问实际的网络和你的实际文件系统。

## 4\. Scheduled tasks (putting work on autopilot)4. 定时任务（让工作自动进行）

This is the feature that I love,it's like a digital employee that I've hired. You set a task, pick a schedule, and it just runs.我最喜欢这个功能，它就像我雇佣的一名数字员工。你设定任务，选择时间安排，它就会自动运行。

**How to set one up:** Type /schedule in any Cowork task. You can set tasks to run daily, weekly, monthly, or at a specific time. To manage them all, click "Scheduled" in the left sidebar where you can create, view, edit, pause, or delete any of them.**如何设置：** 在任何 Cowork 任务中输入 /schedule 。您可以设置任务每日、每周、每月或在特定时间运行。要管理所有任务，请点击左侧边栏中的“ 已安排 ”，您可以在这里创建、查看、编辑、暂停或删除任何任务。

![图像](https://pbs.twimg.com/media/HERTUgEWQAADj9c?format=jpg&name=large)

**One limitation to know:** scheduled tasks only run while your computer is awake and the Claude desktop app is open. If your machine is asleep when a task is due, Cowork will run it automatically once you wake your computer or reopen the app. This works best for tasks during your working hours, not overnight automation.**需要注意的一点是：** 计划任务仅在您的计算机处于唤醒状态且 Claude 桌面应用程序打开时运行。如果任务到期时您的计算机处于睡眠状态，Cowork 会在您唤醒计算机或重新打开应用程序后自动运行该任务。此功能最适合工作时间内执行的任务，不适用于夜间自动化。

Here are 3 scheduled task prompts you can try:以下是您可以尝试的 3 个定时任务提示：

> **SCHEDULED TASK: Monday morning priorities (weekly, 8am)** Pull my calendar for the week from Google Calendar. Identify my 3 busiest days. Draft a weekly priorities document that includes my key meetings, deadlines, and recommended focus blocks. Save it to my Desktop.**已安排任务：周一上午优先事项（每周一次，上午 8 点）** 从谷歌日历中提取我本周的日程安排。 我最忙的三天。起草一份每周工作重点清单。 包括我的重要会议、截止日期和建议的重点事项。 块。保存到我的桌面。

> **SCHEDULED TASK: Friday file cleanup (weekly, 4pm)** Scan my Downloads folder for anything added this week. Sort new files into the right project folders based on filename and content. Flag anything that doesn't clearly belong anywhere and needs my attention.**计划任务：周五文件清理（每周一次，下午 4 点）** 扫描我的下载文件夹，查看本周是否有新增内容。排序 根据文件名将新文件放入正确的项目文件夹中 以及内容。标记任何明显不属于此范畴的内容。 随时随地需要我的关注。

> **SCHEDULED TASK: Daily urgent email check (daily, 12pm)** Check my Gmail for any messages marked urgent or flagged today. Draft suggested responses for each one. Save as a text file on my Desktop with the subject lines and my draft replies.**定时任务：每日紧急邮件检查（每日中午 12 点）** 请查看我的 Gmail 邮箱，看看是否有任何标记为紧急或已标记的邮件。 今天。为每个问题拟定回复草稿。保存为。 我桌面上的文本文件包含主题行和我的 草拟回复。

Something interesting that happens with scheduled tasks: after the first run, Claude rewrites its own instructions based on what it learned (which connectors it used, where it found data, what worked). The second run is usually better than the first because Claude has refined its own playbook.定时任务会发生一件很有趣的事：第一次运行后，Claude 会根据它学到的东西（使用了哪些连接器、从哪里找到数据、哪些方法有效）重写自己的指令。第二次运行通常会比第一次更好，因为 Claude 已经完善了自己的操作手册。

## 5\. Plugins (turning Cowork into a role-specific agent)5. 插件（将 Cowork 变成特定角色的代理）

Plugins are bundles of skills, connectors, slash commands, and sub-agents packaged together for a specific role or workflow. 插件是将技能、连接器、斜杠命令和子代理打包在一起，用于特定角色或工作流程的集合。

Instead of setting up each piece individually and re-explaining your process every session, you install a plugin once and Claude becomes a specialist from the first message.无需单独设置每个部分，也无需每次会话都重新解释您的流程，您只需安装一次插件，Claude 就能从第一条消息开始成为专家。

**How to install:** Click the Customize menu in the left sidebar (this is where you see all your plugins, skills, and connectors in one place). Click Browse Plugins. Anthropic has open-sourced tons of plugins built by their own team, and new ones keep getting added.**安装方法：** 点击左侧边栏的“自定义”菜单（您可以在这里查看所有插件、技能和连接器）。点击“浏览插件”。Anthropic 已开源了大量由其团队开发的插件，并且还在不断添加新的插件。

![图像](https://pbs.twimg.com/media/HERTu6IbYAEHlIC?format=jpg&name=large)

Some examples of what's available:以下是一些可供选择的选项：

The **marketing plugin** connects Claude to your content tools and gives you commands like /seo-audit, /content-brief, and /social-post. The **sales plugin** connects to your CRM with commands for prospect research and call prep. There are plugins for HR, legal, engineering, operations, financial analysis, and more. 营销**插件**将 Claude 与您的内容工具连接起来，并提供诸如 /seo-audit、/content-brief 和 /social-post 之类的命令。 **销售插件**连接到您的 CRM 系统，提供用于潜在客户研究和电话准备的命令。此外，还有用于人力资源、法律、工程、运营、财务分析等领域的插件。

Each was designed with practitioners in the relevant field, so the workflows and output formats match how that work actually gets done.每个产品都是与相关领域的从业人员共同设计的，因此其工作流程和输出格式与实际工作方式相符。

**The slash command** is super useful too. Once a plugin is installed, type / in the Cowork chat or click the + button to see all available commands. Select one, fill in the structured form, hit go, and Claude runs the full workflow. You can also build your own custom plugins. If you have a workflow that's specific to your team or company, you can package it up so every team member gets the same agent experience from day one.**斜杠命令**也超级实用。安装插件后，在 Cowork 聊天窗口中输入 / 或点击 + 按钮即可查看所有可用命令。选择一个命令，填写表单，点击“开始”，Claude 就会运行整个工作流程。 您还可以构建自己的自定义插件。如果您有团队或公司特有的工作流程，您可以将其打包，以便每个团队成员从第一天起就能获得相同的客服体验。

## 6\. Power user tips and what's next6. 高级用户技巧及后续步骤

A few things to get real value out of Cowork:要想真正从共享办公空间中获益，以下几点建议或许能帮到你：

**Always ask for the plan first.** End your prompts with "Show me the plan before making any changes. Only proceed after I approve." This takes 5 extra seconds and prevents mistakes.**务必先索要方案。** 在提示语的结尾加上一句：“请先给我看方案，再做任何修改。只有在我批准后才能继续。” 这只需额外花费 5 秒钟，就能避免出错。

**Stack connectors in a single task.** You can really take it a a whole level by chaining connectors, instead of using Google Drive or Gmail or Slack individually. Pull data from Drive, cross-reference with Slack threads, draft emails in Gmail, all in one prompt.**在单个任务中堆叠连接器。** 通过链式连接连接器，您可以真正提升效率，而无需单独使用 Google 云端硬盘、Gmail 或 Slack。从云端硬盘提取数据，与 Slack 对话进行交叉引用，在 Gmail 中撰写邮件草稿，所有操作都可以在一个提示中完成。

**Write detailed global instructions.** The more context Claude has about you, your role, your preferences, and your projects, the less time you spend correcting outputs. Spend 10 minutes on this once. It pays off on every task after.**编写详细的全局指令。Claude** 对你、你的角色、你的偏好以及你的项目了解得越多，你花在修改输出结果上的时间就越少。只需花 10 分钟完成这项工作，就能在之后的所有任务中受益匪浅。

**Use folder-specific instructions for different projects.** If you manage multiple clients or departments, each folder can carry its own context. Claude adapts automatically.**针对不同的项目使用文件夹专属指令。** 如果您管理多个客户或部门，每个文件夹都可以包含各自的内容。Claude 会自动适应。

**Build habits around scheduled tasks.** Start with 1 or 2. A Monday morning planner. A Friday file cleanup. Once you see them running reliably, add more.**围绕预定任务养成习惯。** 先从一两项开始，比如周一早上做计划，周五清理文件。一旦这些习惯运行稳定，就可以增加更多。

Cowork is still in research preview. Anthropic is shipping updates fast, including recent additions like **Computer Use** (Claude can control your keyboard and mouse when connectors aren't available), **Dispatch** (assign tasks from your phone), and a **Projects** feature for organizing work by local folders. Cowork 功能目前仍处于研究预览阶段。Anthropic 正在快速发布更新，包括最近新增的 **“电脑使用”** （当连接器不可用时，Claude 可以控制您的键盘和鼠标）、 **“调度”** （通过手机分配任务）以及 **“项目”** 功能（用于按本地文件夹组织工作）。

The trajectory here is clear: every knowledge worker gets their own custom agent. 这条发展轨迹很明确：每个知识工作者都将拥有自己的专属代理。

The people who learn the patterns now will have a structural advantage over everyone who waits.现在就掌握这些规律的人，将比所有等待的人拥有结构性优势。

If you've made it this far, you'll enjoy my free newsletter: [simplifyingAI.co](https://simplifyingai.co/). Every day, I send to your inbox a break down the most important AI news and practical AI tutorials like this.如果你已经看到这里，你一定会喜欢我的免费电子报： [简化 AI.co](https://simplifyingai.co/) 我每天都会向您的邮箱发送一份汇总最重要的 AI 新闻和实用 AI 教程的邮件，就像这篇一样。