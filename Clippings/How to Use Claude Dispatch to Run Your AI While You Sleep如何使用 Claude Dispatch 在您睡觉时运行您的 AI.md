---
title: "How to Use Claude Dispatch to Run Your AI While You Sleep如何使用 Claude Dispatch 在您睡觉时运行您的 AI"
source: "https://x.com/heynavtoor/status/2034679349157536233"
author:
  - "[[Unknown]]"
published: 2026-03-20
created: 2026-03-20
description:
tags:
  - "clippings"
---
## The biggest complaint about Claude Cowork since it launched in January has been five words: I have to be there.自 Claude Cowork 于 1 月份推出以来， 用户最大的抱怨可以用五个字概括：我必须在那里。

You had to sit at your desk. You had to keep the app open. You had to watch Claude work. It was powerful, but it was anchored. Your AI assistant was chained to your laptop like it was 2019.你必须坐在办公桌前，必须让应用一直开着，必须看着克劳德工作。它功能强大，但却束缚了你的行动。你的 AI 助手就像 2019 年那样，被锁在你的笔记本电脑旁。

On March 17, 2026, Anthropic fixed that. And almost nobody has noticed yet.2026 年 3 月 17 日，Anthropic 公司修复了这个问题。但几乎没人注意到。

They shipped a feature called Dispatch. It does something deceptively simple: it lets you text your desktop AI from your phone. You send a task from anywhere. Claude runs it on your computer. You come back to finished work.他们推出了一项名为“调度”（Dispatch）的功能。它的功能看似简单，实则不然：它允许你通过手机向桌面 AI 发送短信。无论你身在何处，都可以发送任务。Claude 会在你的电脑上运行任务。你回来后就能看到完成的工作。

That is it. That is the whole pitch. And if you have spent any time building a Cowork system, you already understand why this changes everything.就是这样。这就是全部内容。如果你曾经搭建过联合办公系统，你就会明白这为什么会改变一切。

The launch tweet hit 2.7 million views in 48 hours. Felix Rieseberg, the Anthropic engineer who announced it, described it in one line: "One persistent conversation with Claude that runs on your computer. Message it from your phone. Come back to finished work."发布推文在 48 小时内获得了 270 万次浏览。发布该推文的 Anthropic 工程师 Felix Rieseberg 用一句话概括了它的功能：“与 Claude 在你的电脑上进行持续对话。用手机发送消息。回来后即可完成工作。”

Dispatch is not a mobile version of Cowork. It is not a cloud agent. It is not a new AI model. It is a remote control for the system you have already built. And that distinction is what makes it the most important Cowork update since launch.Dispatch 并非 Cowork 的移动版本，也不是云代理，更不是什么全新的 AI 模型。它只是你现有系统的远程控制工具。正是这种区别，使它成为 Cowork 自发布以来最重要的更新。

This is the complete guide. Setup. Configuration. Real workflows that work today. Honest limitations. And the exact strategies that turn Dispatch from a novelty into a genuine productivity multiplier.这是一份完整的指南。涵盖设置、配置、当今行之有效的实际工作流程、坦诚的局限性，以及如何将 Dispatch 从新奇工具转变为真正提升生产力的利器。

Bookmark this. You will need it.把这个链接收藏起来，你会用到的。

# What Dispatch actually is (and what it is not)Dispatch 的真正含义（以及它不包含的内容）

Before you set anything up, you need to understand what you are working with. Dispatch has been live for two days and the misconceptions are already spreading.在进行任何设置之前，您需要了解您正在使用的设备。调度系统上线仅两天，误解就已经开始传播。

Here is the precise definition: Dispatch creates one persistent conversation between the Claude mobile app on your phone and the Claude Desktop app on your computer. Your phone is the messaging interface. Your computer is the engine. Everything Claude does, every file it reads, every connector it accesses, every skill it loads, happens on your desktop. Your phone just sends the instructions and receives the results.以下是精确定义：Dispatch 会在您手机上的 Claude 移动应用和您电脑上的 Claude 桌面应用之间建立一条持久的对话。您的手机是消息界面，您的电脑是引擎。Claude 的所有操作，包括读取的每个文件、访问的每个连接器以及加载的每个技能，都在您的电脑上完成。您的手机仅负责发送指令和接收结果。

Think of it as a walkie-talkie to a computer that is already running. Not a cloud service. Not a mobile agent. A remote control.你可以把它想象成一台连接正在运行的电脑的对讲机。它不是云服务，也不是移动代理，而是一个遥控器。

This means three things you need to internalize before going further:这意味着在继续之前，你需要牢记三件事：

**Your computer must be awake.** If your Mac goes to sleep or the Claude Desktop app closes, Dispatch goes dark. This is not a limitation. It is a security feature. No always-on cloud server means no always-on attack surface. Your files stay local. Your data stays on your machine. The tradeoff is that you need to keep the lid open.**您的电脑必须保持唤醒状态。** 如果您的 Mac 进入睡眠状态或 Claude Desktop 应用程序关闭，Dispatch 将停止运行。这并非功能限制，而是一项安全措施。没有始终在线的云服务器，也就意味着没有始终存在的攻击面。您的文件和数据都保留在本地，数据也始终保存在您的电脑上。但代价是您需要保持电脑盖子打开。

**Everything you built in Cowork carries over.** Your context files, your skills, your connectors, your global instructions. All of it loads into the Dispatch session. This is critical. Dispatch is not starting from zero. It inherits your entire architecture. The system you spent weeks building is now accessible from your pocket.**你在 Cowork 中构建的一切都将被保留。** 你的上下文文件、技能、连接器、全局指令，所有这些都会加载到 Dispatch 会话中。这一点至关重要。Dispatch 并非从零开始，而是继承了你整个架构。你花费数周时间构建的系统，现在只需动动手指即可访问。

**It is a research preview.** MacStories tested it and reported roughly 50/50 reliability on complex tasks. Information retrieval works well. Cross-app actions are inconsistent. This is early software. Treat it accordingly. But "early" in the Claude ecosystem tends to mean "transformative within 60 days." Cowork itself went from rough preview to daily workhorse in under eight weeks.**这是一个研究预览版。MacStories** 对其进行了测试，报告称其在复杂任务上的可靠性约为 50/50。信息检索功能运行良好。跨应用操作不一致。这是一款早期软件，请谨慎对待。但在 Claude 生态系统中，“早期”通常意味着“60 天内即可带来变革”。Cowork 本身从粗略预览版到成为日常主力应用，只用了不到八周时间。

# Setup in under 5 minutes (step by step)5分钟内即可完成设置（分步指南）

The setup is absurdly simple. I timed it. Two minutes and fourteen seconds from start to paired devices. Here is every step.设置过程极其简单。我计时过了，从开始到设备配对完成只用了两分十四秒。以下是详细步骤。

## What you need before you start开始之前你需要准备什么

The latest version of the Claude Desktop app on your Mac or Windows PC. If you have not updated recently, go to [claude.com/download](https://claude.com/download) and grab the newest version. Dispatch requires the March 2026 update.请在您的 Mac 或 Windows PC 上安装最新版本的 Claude Desktop 应用程序。如果您最近没有更新，请前往\[此处插入链接\]。 [claude.com/download](https://claude.com/download) 请下载最新版本。Dispatch 需要 2026 年 3 月的更新。

The latest version of the Claude mobile app on your iPhone or Android. Open your app store and update. Dispatch will not appear if you are on an older version.请在您的 iPhone 或 Android 设备上安装最新版本的 Claude 移动应用。打开应用商店并更新。如果您使用的是旧版本，则可能无法显示调度功能。

A paid Claude plan. Max subscribers ($100 to $200 per month) have access right now. Pro subscribers ($20 per month) are getting access within days. If you are reading this on Pro and do not see Dispatch yet, check back tomorrow.克劳德付费计划现已推出。Max 会员（每月 100 至 200 美元）现在即可使用。Pro 会员（每月 20 美元）将在几天内获得访问权限。如果您正在使用 Pro 服务阅读此内容但尚未看到 Dispatch，请明天再来查看。

An internet connection on both devices. Your phone talks to your computer through the internet, not Bluetooth or local Wi-Fi.两台设备都需要连接互联网。你的手机通过互联网与电脑通信，而不是通过蓝牙或本地 Wi-Fi。

## Step 1: Open Dispatch on your desktop步骤 1：在桌面上打开 Dispatch。

Launch Claude Desktop. Click the Cowork tab. In the left sidebar, you will see a new option: Dispatch. Click it. You will land on a page explaining the feature. Click "Get started."启动 Claude Desktop。点击“协作办公”选项卡。在左侧边栏中，您会看到一个新选项：“调度”。点击它。您将进入一个介绍该功能的页面。点击“开始使用”。

On the next screen, you get two toggles. The first gives Claude access to your files. The second keeps your computer awake while Dispatch is active. Turn both on. The file access toggle is what lets Dispatch use your entire Cowork setup. Without it, Claude can only chat. With it, Claude can read your folders, use your skills, and access your connectors.下一个屏幕上有两个开关。第一个开关允许 Claude 访问您的文件。第二个开关用于在 Dispatch 运行时保持您的计算机处于唤醒状态。请同时启用这两个开关。文件访问权限开关允许 Dispatch 使用您的整个 Cowork 设置。如果没有启用此开关，Claude 只能聊天。启用后，Claude 可以读取您的文件夹、使用您的技能并访问您的联系人。

## Step 2: Pair your phone步骤二：配对手机

A QR code appears on your desktop screen. Open the Claude app on your phone. You will see a new Dispatch entry in the sidebar. Tap it. Scan the QR code.桌面屏幕上会出现一个二维码。打开手机上的 Claude 应用。您会在侧边栏看到一条新的调度信息。点击它。扫描二维码。

That is it. No API keys. No configuration files. No OAuth dance. Scan and go.就是这样。无需 API 密钥。无需配置文件。无需 OAuth 认证。扫描即可使用。

Once paired, you will see the same conversation on both devices. Send a message from your phone, it appears on your desktop. Claude's responses show up on both. One persistent thread. Two devices. Zero sync headaches.配对成功后，您将在两台设备上看到相同的对话。用手机发送消息，消息会立即显示在电脑上。Claude 的回复也会同时显示在两台设备上。一个持续的对话线程，两台设备，告别同步烦恼。

## Step 3: Test the connection步骤 3：测试连接

From your phone, type: "What files do you have access to right now?"在手机上输入：“您现在可以访问哪些文件？”

Claude should respond with a list of folders and files from your Cowork setup. If it does, you are live. If it does not, check that file access is toggled on in the Dispatch settings on your desktop.Claude 应该会回复您 Cowork 设置中的文件夹和文件列表。如果回复了，说明您的设置已生效。如果没有回复，请检查您桌面上的 Dispatch 设置中是否已启用文件访问权限。

Total setup time: under five minutes. Probably under three.总共设置时间：不到五分钟。可能不到三分钟。

# 12 Dispatch workflows that actually work right now12 个目前真正有效的调度工作流程

Marketing copy and early reviews are flooding in. Most of them describe what Dispatch could do. Here is what it actually does, tested in the 48 hours since launch. I have categorized these by reliability: what works consistently, what works sometimes, and what you should wait on.营销文案和早期评测铺天盖地而来。大多数都在描述 Dispatch 的功能。以下是自发布以来 48 小时内测试的实际表现。我根据可靠性对这些功能进行了分类：哪些功能始终有效，哪些功能时好时坏，以及哪些功能需要等待。

## Works reliably (80%+ success rate)运行稳定可靠（成功率80%以上）

**1\. Morning inbox triage from bed1. 早上在床上处理收件箱邮件。**

Before you get up, text Dispatch: "Summarize my top 10 unread emails and flag anything urgent." By the time you are brushing your teeth, you know what your day looks like. This works because it is information retrieval through your Gmail connector. Dispatch excels at pulling data and summarizing it.起床前，给 Dispatch 发条短信：“汇总我未读邮件最多的 10 封，并标记任何紧急邮件。” 等你刷牙的时候，就已经知道今天一天的安排了。这之所以有效，是因为它通过 Gmail 连接器检索信息。Dispatch 非常擅长提取数据并进行汇总。

**2\. File lookups while you are away2. 您不在时查找文件**

"Find the PDF I downloaded last week about the Q1 budget." Instead of remoting into your computer or trying to remember the filename, Dispatch searches your files and sends back what it finds. Fast and reliable.“找到我上周下载的关于第一季度预算的 PDF 文件。” Dispatch 无需远程连接到您的电脑或费力记住文件名，它会搜索您的文件并将找到的内容发送给您。快速可靠。

**3\. Meeting prep on the commute3. 通勤途中进行会议准备**

"Check my calendar for today and prepare briefing docs for each meeting using files from my project folder." You walk into the office with prep already done. This combines your calendar connector with file access and your meeting prep skill if you have one.“查看我今天的日程安排，并使用项目文件夹中的文件为每次会议准备简报文件。” 你走进办公室时，一切准备就绪。这结合了你的日程安排、文件访问权限以及你的会议准备技能（如果你有的话）。

**4\. Quick research summaries4. 快速研究摘要**

"Read the three most recent documents in my Research folder and give me a one-paragraph summary of each." Perfect for catching up on reading you have been putting off. Claude reads the files on your desktop and sends the summaries to your phone.“请阅读我研究文件夹中最新的三份文档，并为每份文档撰写一段摘要。” 非常适合用来补读那些你一直搁置的书籍。Claude 会读取你桌面上的文件，并将摘要发送到你的手机。

**5\. Notion and Slack catch-ups5. Notion 和 Slack 的追赶**

"Summarize my recent Notion notes" or "What were the key messages in the marketing Slack channel today?" If you have these connectors set up, Dispatch pulls the data and delivers a clean summary. Tested and working.“总结我最近的 Notion 笔记”或“今天市场部 Slack 频道里的关键信息是什么？” 如果您已设置这些连接器，Dispatch 会提取数据并提供简洁的摘要。经测试，功能正常。

**6\. Expense processing6. 费用处理**

"Process all receipt images from my receipts folder and create a categorized spreadsheet." If you have an expense processing skill, Dispatch loads it automatically and runs the whole workflow. You come home to a finished spreadsheet.“处理我收据文件夹中的所有收据图像，并创建一个分类电子表格。” 如果您具备费用处理技能，Dispatch 会自动加载并运行整个工作流程。您回家后即可获得一份完成的电子表格。

## Works sometimes (50-70% success rate)有时有效（成功率50-70%）

**7\. Creating documents from templates7. 使用模板创建文档**

"Draft a client proposal for the Anderson account using my proposal template and the latest email thread." This involves multiple steps: reading emails, loading a template, generating content. It works when all connectors respond cleanly. It fails when one step times out.“请使用我的提案模板和最新的邮件往来，为 Anderson 客户撰写一份提案。” 这涉及多个步骤：读取邮件、加载模板、生成内容。当所有连接器都正常响应时，此任务可以成功完成。但如果其中任何一个步骤超时，任务就会失败。

**8\. Multi-step file organization8. 多步骤文件整理**

"Organize everything in my Downloads folder by file type." This works but can be slow. Dispatch processes the task on your desktop and the results appear gradually. For large folders, expect some lag.“按文件类型整理我下载文件夹中的所有内容。” 这个方法可行，但速度可能较慢。Dispatch 会在您的桌面上处理任务，结果会逐渐显示。对于较大的文件夹，可能会出现一些延迟。

**9\. Spreadsheet creation from raw data9. 根据原始数据创建电子表格**

"Create an Excel spreadsheet summarizing the data in the three CSV files in my analytics folder." This works when the files are clean. Complex data or ambiguous column names can cause issues.“创建一个 Excel 表格，汇总我分析文件夹中三个 CSV 文件中的数据。” 如果文件干净，此方法有效。复杂的数据或含义模糊的列名可能会导致问题。

## Wait on these (unreliable in the preview)请稍等（预览不可靠）

**10\. Cross-app workflows10. 跨应用工作流程**

"Read this email, create a task in Notion, and send a summary to Slack." Multi-step workflows that chain multiple connectors together are the most likely to fail. The individual steps work. The chaining is inconsistent. Give it a few weeks.“阅读此邮件，在 Notion 中创建一个任务，并将摘要发送到 Slack。” 将多个连接器串联起来的多步骤工作流程最容易失败。单个步骤本身没有问题，但串联起来却不一致。请等待几周时间。

**11\. Browser-based actions11. 基于浏览器的操作**

"Open this URL in my browser and save the content." Dispatch can trigger browser actions through Cowork, but reliability is low. Stick to file and connector-based workflows for now.“在我的浏览器中打开此 URL 并保存内容。” Dispatch 可以通过 Cowork 触发浏览器操作，但可靠性较低。目前建议坚持使用基于文件和连接器的工作流程。

**12\. Sharing or sending outputs12. 共享或发送输出**

MacStories found that summarizing and finding data worked well, but sharing from Claude did not. If your workflow ends with "and send it to someone," do the sending yourself for now.MacStories 发现，数据汇总和查找功能运行良好，但从 Claude 平台共享数据却不尽如人意。如果你的工作流程以“并将其发送给其他人”结束，那么目前最好还是自己发送。

# The real shift: from synchronous to asynchronous AI真正的转变：从同步人工智能到异步人工智能

Here is why Dispatch matters more than its current feature set suggests.这就是为什么 Dispatch 的重要性远超其当前功能集所展现出来的原因。

Every AI tool you have used until now has been synchronous. You sit down. You type. You wait. You read. You type again. The AI only works when you are watching.你之前使用的所有人工智能工具都是同步的。你坐下来，输入文字，等待，阅读，然后再输入。人工智能只有在你观看时才会运行。

Dispatch is the first consumer AI feature that is genuinely asynchronous. You send a task and walk away. Claude works while you live your life. You come back to results.Dispatch 是首个真正意义上的异步消费级 AI 功能。你只需发送任务即可离开。Claude 会在你享受生活的同时默默工作。回来后即可看到结果。

This is not a small distinction. This is the difference between a calculator and a factory. A calculator is powerful, but it only works when you press the buttons. A factory runs whether you are there or not.这并非微不足道的区别。这就好比计算器和工厂的区别。计算器功能强大，但只有在你按下按钮时才会工作。而工厂无论你是否在场都会运转。

Think about what your Cowork system does right now. It drafts emails. It processes expenses. It organizes files. It creates presentations. It summarizes documents. Every single one of those tasks currently requires you to be sitting at your desk, watching Claude work.想想你的共享办公系统现在都在做什么。它能起草邮件，处理费用，整理文件，制作演示文稿，汇总文档。而所有这些任务，目前都需要你坐在办公桌前，看着系统自动完成。

Dispatch removes that requirement. Not for every task. Not with perfect reliability. But enough to change how you think about what AI does for you.Dispatch 消除了这一要求。并非所有任务都适用，也并非绝对可靠，但足以改变你对人工智能功能的固有认知。

The people who will get the most from this feature are not the ones who use it to check emails from bed. They are the ones who realize that every Cowork workflow they have already built is now triggerable from anywhere. Your morning briefing. Your expense processing. Your meeting prep. Your file organization. All of it, from your phone, while you are doing something else entirely.这项功能的最大受益者并非那些躺在床上查看邮件的人，而是那些意识到自己已经建立的所有 Cowork 工作流程现在都可以随时随地触发的人。晨间简报、费用报销、会议准备、文件整理……所有这些都可以在你忙于其他事情的同时，通过手机完成。

Cowork made AI do your work. Dispatch makes AI do your work while you are not there.Cowork 让 AI 帮你完成工作。Dispatch 让 AI 在你不在的时候帮你完成工作。

That is the shift. And it is just beginning.这就是转变。而这仅仅是个开始。

# How to make Dispatch 10x more reliable如何让 Dispatch 的可靠性提高 10 倍

The 50/50 reliability that early reviewers reported is real. But it is not the whole story. Most of those tests were run without optimized Cowork setups. When you pair Dispatch with a properly architected system, reliability jumps significantly. Here is how.早期评测者提到的 50/50 可靠性确实存在。但这并非全部真相。大多数测试都是在没有优化的共享办公环境的情况下进行的。当 Dispatch 与架构合理的系统配合使用时，可靠性会显著提升。具体来说，方法如下。

## 1\. Build context files if you have not already1. 如果尚未创建上下文文件，请创建它们。

Dispatch inherits everything from your Cowork setup. If your Cowork setup is bare, Dispatch has nothing to work with. Create your about-me.md, brand-voice.md, and working-style.md files. These give Claude the context it needs to produce quality output on the first try, even when you are giving terse instructions from your phone.Dispatch 会继承您 Cowork 设置中的所有配置。如果您的 Cowork 设置非常简陋，Dispatch 将无法使用任何资源。请创建 about-me.md、brand-voice.md 和 working-style.md 文件。这些文件能够为 Claude 提供必要的上下文信息，即使您仅通过手机发出简短的指令，也能确保 Dispatch 一次性生成高质量的输出。

Phone prompts tend to be short. "Process my receipts" is a typical Dispatch message. Without context files and skills, Claude has to guess how you want receipts processed. With them, it already knows.电话提示通常都很简短。“处理我的收据”是 Dispatch 系统典型的提示信息。如果没有上下文文件和相关技能，Claude 系统只能猜测您希望如何处理收据。有了这些，它就能自动识别。

## 2\. Use skills for every repeated workflow2. 在每个重复的工作流程中运用技能

Skills are even more important in Dispatch than in regular Cowork. When you are typing on your phone, you do not want to write detailed instructions. You want to say "do the thing" and have Claude know exactly what "the thing" means.在调度中心，技能比在普通共享办公空间更为重要。当你用手机打字时，你不想写详细的指令，你只想说“做这件事”，然后让克劳德确切地知道“这件事”指的是什么。

If you have a meeting prep skill, you can text "prep for my 2pm meeting" and get a complete briefing. Without the skill, you would need to explain the format, the sources, the level of detail. That is painful on a phone keyboard.如果你有会议准备技巧，只需发条短信“准备下午2点的会议”，就能收到完整的简报。如果没有这项技巧，你就需要解释会议形式、资料来源和细节程度。用手机键盘打字非常麻烦。

## 3\. Keep tasks focused and information-based3. 保持任务重点突出且以信息为导向

The workflows with the highest success rates are all information-focused: summarize, find, list, retrieve, compile, analyze. These are read operations. Claude reads your files, reads your connectors, and sends you text.成功率最高的流程都以信息为中心：汇总、查找、列出、检索、编译、分析。这些都是读取操作。Claude 会读取您的文件、读取您的连接器，并向您发送文本。

The workflows that fail most are write operations that span multiple tools: create a document AND send it via email AND log it in Notion. Keep each Dispatch message to one clear action. If you need a chain, send the tasks separately.最容易失败的工作流程是跨多个工具的写入操作：例如，创建文档、通过电子邮件发送，以及在 Notion 中记录。请确保每个 Dispatch 消息只包含一个明确的操作。如果需要一系列操作，请分别发送各个任务。

## 4\. Set global instructions for Dispatch-specific behavior4. 设置 Dispatch 特定行为的全局指令

Add a line to your Cowork Global Instructions: "When receiving a message via Dispatch, confirm the task before executing. If any step is ambiguous, ask for clarification before proceeding."在您的 Cowork 全局指令中添加一行：“通过 Dispatch 收到消息后，请在执行任务前确认任务内容。如果任何步骤不清楚，请在继续操作前寻求澄清。”

This prevents Claude from misinterpreting a terse phone message and running in the wrong direction. A quick confirmation round-trip adds thirty seconds and saves you from a ten-minute redo.这样可以避免克劳德误解简短的电话留言而跑错方向。快速确认往返只需花费三十秒，却能避免十分钟的返工。

## 5\. Test before you trust5. 信任之前先测试

Run every new Dispatch workflow while you are near your computer first. Watch what Claude does on the desktop while you send instructions from your phone. Identify where it succeeds and where it stumbles. Only add workflows to your "dispatch from anywhere" rotation after they have worked three times in a row.首先，请在电脑旁运行所有新的调度工作流程。一边用手机发送指令，一边观察 Claude 在电脑上的操作。找出哪些环节成功，哪些环节失败。只有当工作流程连续成功运行三次后，才能将其添加到“随时随地调度”轮换列表中。

# Dispatch vs. everything else: where it fits调度与其他一切：它该如何定位？

Before Dispatch, the only way to control an AI agent remotely was to build it yourself. The most talked-about approach was OpenClaw, an open-source framework that lets you set up always-on AI agents on a dedicated machine.在 Dispatch 出现之前，远程控制 AI 代理的唯一方法是自行构建。当时最受关注的方案是 OpenClaw，这是一个开源框架，允许用户在专用机器上设置始终在线的 AI 代理。

OpenClaw requires a dedicated computer (most people bought a Mac Mini), Node.js 22+, a WebSocket gateway, extensive configuration, and significant technical knowledge. A Czech productivity author bought a Mac Mini, set up OpenClaw, and ran six AI agents that assigned tasks to each other. It worked. It also required the kind of setup that would make most people quit before finishing.OpenClaw 需要一台专用电脑（大多数人购买的是 Mac Mini）、Node.js 22+、WebSocket 网关、大量的配置以及相当高的技术知识。一位捷克效率书籍作家购买了一台 Mac Mini，安装了 OpenClaw，并运行了六个 AI 代理，这些代理可以互相分配任务。它成功运行了。但这套配置方案的复杂程度足以让大多数人望而却步。

Dispatch requires a QR code scan.发货需要扫描二维码。

That gap is not just convenience. It is accessibility. OpenClaw is for developers and power users who enjoy configuring infrastructure. Dispatch is for everyone who has a Claude subscription and a phone. The audience difference is a hundred to one.这种差距不仅仅在于便利性，更在于可及性。OpenClaw 面向的是喜欢配置基础设施的开发者和高级用户，而 Dispatch 则面向所有拥有 Claude 订阅和一部手机的用户。两者的用户群体差异巨大，堪比百比一。

Claude Code also has a Remote Control feature that serves a similar purpose for developers. If you are already using Claude Code in a terminal, Remote Control lets you monitor and interact with coding sessions from your phone. Dispatch is the same concept, adapted for Cowork's non-technical audience.Claude Code 也提供远程控制功能，其用途与此类似，专为开发者设计。如果您已经在终端中使用 Claude Code，远程控制功能可以让您通过手机监控编码会话并与之互动。Dispatch 的概念与之相同，但针对 Cowork 的非技术用户群体进行了调整。

The positioning is clear: Dispatch is the remote control for the rest of us.定位很明确：调度部门就像遥控器，控制着我们其他人。

# Honest limitations (read this before you rely on it)诚实的局限性（在依赖它之前请阅读此内容）

I am not going to oversell this. Dispatch is a research preview. It shipped two days ago. Here is what you need to know about its current state.我不会夸大其词。Dispatch 是一个研究预览版，两天前发布。以下是您需要了解的关于其当前状态的信息。

**No notifications.** When Claude finishes a task, your phone does not buzz. You have to manually check the Dispatch thread to see if work is done. This is the most-requested missing feature and Anthropic will almost certainly add it. For now, check back periodically.**没有通知。** 当 Claude 完成任务时，你的手机不会震动。你必须手动查看调度线程才能知道任务是否已完成。这是用户呼声最高的缺失功能，Anthropic 几乎肯定会添加它。目前，请定期查看。

**One thread only.** There is no way to start a new conversation or manage multiple threads. Everything lives in a single persistent thread. If you send five tasks, they all run sequentially in the same context. For now, keep the thread focused.**仅支持单线程。** 无法创建新对话或管理多个线程。所有操作都在同一个持久线程中进行。如果您发送五个任务，它们将在同一上下文中按顺序执行。目前，请保持线程专注。

**No scheduled tasks.** Dispatch and scheduled tasks are managed separately. You cannot use Dispatch to create or modify scheduled tasks. Your existing scheduled tasks still run on their normal cadence.**没有计划任务。** 调度和计划任务是分开管理的。您不能使用调度来创建或修改计划任务。您现有的计划任务仍将按原计划运行。

**Speed is inconsistent.** Some tasks return in seconds. Others take minutes. Complex file operations can feel slow compared to sitting at your desktop. This is the reality of a remote operation: there is network latency on top of processing time.**速度并不稳定。** 有些任务几秒钟就能完成，而有些则需要几分钟。与坐在电脑前相比，复杂的文件操作会感觉很慢。这就是远程操作的现实：除了处理时间之外，还有网络延迟。

**No mobile Cowork.** Dispatch is not Cowork on your phone. You cannot browse files, manage skills, or adjust settings from mobile. You can only send messages and receive responses. All configuration happens on the desktop.Dispatch 不支持**移动办公。Dispatch 并非移动**版 Cowork。您无法通过移动设备浏览文件、管理技能或调整设置。您只能发送消息和接收回复。所有配置均需在电脑上完成。

These limitations are real. They are also temporary. Cowork went from "rough but promising" to "daily workhorse" in eight weeks. Dispatch will follow the same trajectory. The question is not whether these problems get fixed. It is whether you build the habit now so you are ready when they do.这些限制是真实存在的，但它们也是暂时的。Cowork 在八周内就从“粗糙但充满希望”变成了“日常工作必备工具”。Dispatch 也将遵循同样的轨迹。关键不在于这些问题是否能得到解决，而在于你是否现在就养成习惯，以便在问题解决时做好准备。

# The 5-minute daily Dispatch routine每日5分钟调度流程

Here is the exact routine I am building around Dispatch. Five minutes total. Run it every morning before you leave your desk.以下是我围绕 Dispatch 制定的完整流程。总共五分钟。每天早上离开办公桌前运行一次。

**6:00 AM — Before getting out of bed.** Pick up your phone. Open the Claude app. Go to Dispatch. Type: "Good morning. Summarize my top emails, check my calendar for today, and list any files that changed in my project folder yesterday." Put the phone down. Get ready for your day.**早上 6:00 — 起床前。** 拿起手机。打开 Claude 应用。进入“调度”页面。输入：“早上好。请汇总我的重要邮件，查看我今天的日程安排，并列出我项目文件夹中昨天所有已更改的文件。” 放下手机。准备开始新的一天。

**6:30 AM — While having breakfast.** Check Dispatch on your phone. Your briefing is waiting. Scan it. If anything needs action, send a follow-up: "Draft a reply to the email from \[person\] about \[topic\]. Keep it under 100 words." Put the phone down again.**早上 6:30——吃早餐时，** 查看手机上的调度系统。你的简报已准备就绪，请快速浏览。如有任何需要跟进的内容，请发送后续通知：“回复\[联系人\]关于\[主题\]的邮件，字数控制在 100 字以内。”说完，放下手机。

**7:00 AM — Commute or transition.** Text one more task: "Prepare a briefing doc for my 10am meeting using the latest files in my project folder." By the time you sit down at your desk, the briefing is done.**早上 7:00 — 通勤或换班期间。** 再发一条任务短信：“用我项目文件夹里的最新文件，准备一份上午 10 点会议的简报文件。” 等你坐到办公桌前，简报文件已经准备好了。

Three messages. Five minutes of phone time. An hour of work completed before you touch your keyboard.三条信息。五分钟通话时间。在你敲击键盘之前，已经完成了一个小时的工作。

That is the promise of asynchronous AI. Not more screen time. Less screen time, with more done.这就是异步人工智能的优势所在：不是增加屏幕时间，而是减少屏幕时间，完成更多工作。

# What this means for the next six months这意味着接下来的六个月

Dispatch is a research preview. It launched two days ago. But the trajectory it signals is unmistakable.《Dispatch》是一份研究报告预览版，两天前发布。但它所预示的发展趋势已十分明确。

Anthropic built Cowork in ten days after launch and shipped Dispatch six weeks later. That pace tells you everything about where this is going.Anthropic 在项目启动后十天内就搭建好了 Cowork 平台，六周后又发布了 Dispatch 系统。这样的速度足以说明一切。

Today, your computer has to be awake. Tomorrow, we will see always-on cloud agents that run on Anthropic's infrastructure. No hardware dependency. No lid-open requirement. Just a persistent AI that works when you work and works when you sleep.今天，你的电脑必须保持唤醒状态。明天，我们将看到运行在 Anthropic 基础设施上的全天候云代理。无需依赖任何硬件，无需打开电脑盖。它只是一个持久运行的 AI，无论你工作还是睡觉，它都能正常工作。

Today, there are no notifications. Tomorrow, Claude will message you when your task is done, when something needs your attention, or when it found something you should see.今天没有通知。明天，克劳德会在你的任务完成、有需要你注意的事情或发现你应该查看的内容时给你发消息。

Today, it is one thread. Tomorrow, it will be multiple parallel threads, each handling a different domain of your work. A thread for email. A thread for files. A thread for research.今天，它只有一个线程。明天，它将是多个并行线程，每个线程处理你工作的不同领域。一个线程用于电子邮件，一个线程用于文件，一个线程用于研究。

Every system you build in Cowork today becomes more powerful when these features arrive. Your context files. Your skills. Your connectors. Your scheduled tasks. None of that work is wasted. All of it transfers directly to whatever Dispatch becomes next.这些功能上线后，您在 Cowork 中构建的每个系统都会变得更加强大。您的上下文文件、技能、连接器、计划任务，所有这些工作都不会浪费，它们都会直接迁移到 Dispatch 的未来版本中。

The people who start building now are not just getting value from Dispatch today. They are positioning themselves for the system Dispatch is becoming.现在就开始构建的人，不仅仅是在从 Dispatch 获得当下的价值，他们更是在为 Dispatch 未来的系统发展做好准备。

Claude has over one million new signups per day. It just overtook ChatGPT as the number one app in the Apple App Store. Anthropic's daily active users have more than tripled since the beginning of 2026. The migration is real. The ecosystem is growing. And the people who build their systems earliest will have the deepest foundations when everyone else catches up.Claude 每天新增注册用户超过一百万，刚刚超越 ChatGPT，成为苹果应用商店排名第一的应用。Anthropic 的日活跃用户自 2026 年初以来增长了两倍多。迁移是真实存在的，生态系统正在蓬勃发展。那些最早构建系统的人，将在其他人赶上时拥有最坚实的基础。

Download Claude Desktop. Set up Cowork. Pair your phone. Send your first Dispatch task.下载 Claude Desktop。设置 Cowork。配对您的手机。发送您的第一个 Dispatch 任务。

Then go live your life. The work will be done when you get back.然后就去好好享受你的生活吧。等你回来，工作自然就完成了。