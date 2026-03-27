---
title: "Claude Cowork: The AI Tool That Actually Does Your Work While You SleepClaude Cowork：一款在你睡觉时也能帮你工作的 AI 工具"
source: "https://x.com/zodchiii/status/2036707977642602899"
author:
  - "[[Unknown]]"
published: 2026-03-20
created: 2026-03-27
description: "#TruthSeeker #INTJ #AI #ChinaData #Founder"
tags:
  - "clippings"
---
Here's what using AI looks like for 99% of people right now:以下是目前99%的人使用人工智能的真实情况：

You ask a question, copy the answer, paste it into a doc, format it, fix it, save it, and do the whole thing again for the next file.你提出一个问题，复制答案，将其粘贴到文档中，进行格式化、修改、保存，然后对下一个文件重复整个过程。

You're the middleman between AI and your own files.你是人工智能和你自己的文件之间的中间人。

That's insane when you think about it. You're doing all the boring work yourself and using the smartest tool on the planet as a glorified search bar.仔细想想，这简直太荒谬了。你得自己做所有枯燥乏味的工作，却把地球上最智能的工具当成一个高级搜索栏来用。

Anthropic killed that workflow. And almost nobody is talking about it.Anthropic 毁掉了那种工作流程。但几乎没人谈论这件事。

**Before we dive in,** sharing daily notes on AI & vibe coding in my Telegram channel: [https://t.me/zodchixquant](https://t.me/zodchixquant) 🧠**在深入探讨之前，我会**在我的 Telegram 频道分享一些关于人工智能和氛围编码的日常笔记： [https://t.me/zodchixquant](https://t.me/zodchixquant) 🧠

![图像](https://pbs.twimg.com/media/HEPOjwcaoAAFwlT?format=jpg&name=large)

## What Cowork Actually Is (And Why It's Different From Chat)联合办公究竟是什么（以及它与聊天有何不同）

In January 2026, Anthropic quietly dropped something called Cowork. It's a tab inside the Claude Desktop app - right next to Chat and Code.2026 年 1 月，Anthropic 悄然推出了名为 Cowork 的功能。它是 Claude 桌面应用程序中的一个标签页，就在聊天和代码旁边。

Here's the difference in one sentence:一句话概括区别：

> Chat = you ask, AI answers, YOU do the work Cowork = you describe the outcome, AI does the work聊天 = 你提问，AI 回答，你完成工作 协同办公 = 你描述结果，AI 完成工作

![图像](https://pbs.twimg.com/media/HEPOfrZXQAAw876?format=jpg&name=large)

Not "AI helps you do the work" - it literally does it, on your actual files, on your actual computer.不是“人工智能帮助你完成工作”，而是它真的在你实际的电脑上，处理你的实际文件，完成你的工作。

You point Claude at a folder on your machine. It can read, edit, create, delete, rename, sort - whatever needs to happen. Everything runs inside a sandboxed Linux VM so it's not going rogue on your system. You pick which folders it can access and nothing else.你只需让 Claude 访问你电脑上的一个文件夹。它就可以读取、编辑、创建、删除、重命名、排序——任何你需要的操作它都能做到。所有操作都在一个沙盒化的 Linux 虚拟机中运行，所以它不会在你的系统上造成任何意外。你可以选择它能访问哪些文件夹，仅此而已。

The best part? Anthropic built Cowork using Claude Code itself and it took them reportedly 10 days. The tool that builds things autonomously was used to build the tool that does things autonomously. We're already in the loop lol.最棒的是什么？Anthropic 竟然用 Claude Code 自己搭建了 Cowork，据说只用了 10 天。这款能够自主构建的工具，反过来又被用来构建另一款能够自主运行的工具。我们已经身处其中了，哈哈。

# The 5 Things That Make It Actually Useful使其真正有用的 5 个因素

## 1\. Real File Access (No Upload/Download Dance)1. 真正的文件访问（无需上传/下载）

No more "upload your file → get response → download result → rename → move to right folder." 不再需要“上传文件→获取响应→下载结果→重命名→移动到正确的文件夹”。

Claude sees your folder directly.Claude 可以直接看到你的文件夹。

> Old workflow: 1. Find file 2. Upload to Claude 3. Wait for response 4. Copy text 5. Paste into new doc 6. Format 7. Save 8. Repeat for next file Cowork workflow: 1. "Organize my Downloads folder" 2. Done旧工作流程： 1. 查找文件 2. 上传至克劳德 3. 等待回复 4. 复制文本 5. 粘贴到新文档中 6. 格式 7. 保存 8. 对下一个文件重复上述步骤 联合办公工作流程： 1. “整理我的下载文件夹” 2. 完成

Tell it "sort my Downloads - docs in /Docs, images in /Images, delete anything older than 6 months" and it actually does it. 告诉它“整理我的下载文件夹——文档放在 /Docs 文件夹，图片放在 /Images 文件夹，删除 6 个月以前的文件”，它真的会照做。

Renames files, creates subfolders, moves everything. 重命名文件，创建子文件夹，移动所有内容。

![图像](https://pbs.twimg.com/media/HEPRT3kWUAAkhXf?format=jpg&name=large)

## 2\. Sub-Agents (Parallel Processing)2. 子代理（并行处理）

When Claude gets a big task, it doesn't just grind through it sequentially. 当克劳德接到一项大任务时，他不会按部就班地完成它。

It spins up multiple sub-agents that work in parallel. Think of it like having 5 interns working on different parts of the same project simultaneously.它会启动多个并行工作的子代理。你可以把它想象成有 5 个实习生同时负责同一个项目的不同部分。

> Sequential (old way): 10 files × 3 min each = 30 min Parallel sub-agents: 10 files ÷ 5 agents = ~2 files each × 3 min = 6 min顺序处理（旧方法）：10 个文件 × 每个文件 3 分钟 = 30 分钟 并行子代理：10 个文件 ÷ 5 个代理 = 每个代理约 2 个文件 × 3 分钟 = 6 分钟

That's not a theoretical number btw. People are reporting exactly that kind of speedup on file processing tasks.顺便说一句，这并非理论值。人们确实反映文件处理任务的速度提升了这么多。

## 3\. Scheduled Tasks (Set It and Forget It)3. 定时任务（设置好就不用管了）

Type /schedule in Cowork and you can set up recurring tasks. This is where it starts feeling less like a tool and more like having an actual assistant.在 Cowork 中输入 /schedule，即可设置重复性任务。这时，它不再像是一个工具，而更像是一个真正的助理。

Real examples people are running:人们正在跑步的真实例子：

> Morning briefing (daily, 7am): → Summarize overnight emails → Pull calendar for the day → Check Slack for anything urgent → Save summary to /Daily folder Weekly expense report (Fridays, 5pm): → Process all receipt screenshots from /Receipts → Create categorized spreadsheet → Calculate totals by category Friday file cleanup: → Sort Downloads by type → Delete anything older than 30 days → Move important docs to archive晨间简报（每日上午7点）： → 总结隔夜邮件 → 查看当日日历 → 查看 Slack 是否有任何紧急事项 → 将摘要保存到 /Daily 文件夹 每周费用报告（周五下午5点）： → 处理 /Receipts 目录中的所有收据截图 → 创建分类电子表格 → 按类别计算总计 周五文件清理： → 按类型对下载进行排序 → 删除超过 30 天的任何内容 → 将重要文档移至归档库

! One catch - your computer needs to be on and Claude Desktop needs to be open. If your laptop's sleeping during a scheduled run, it skips. 需要注意一点——您的电脑必须开机，并且 Claude Desktop 必须处于打开状态。如果您的笔记本电脑在计划运行期间处于睡眠状态，则会跳过。

Shows up in history though and auto-runs when you reopen.不过会在历史记录中显示，并在重新打开时自动运行。

## 4\. Plugins and Skills4. 插件和技能

Plugins are pre-built bundles of capabilities for specific roles. Product managers, marketers, finance people, legal - there are dedicated plugins for each.插件是为特定角色预先构建的功能包。产品经理、市场营销人员、财务人员、法务人员——每个角色都有专门的插件。

The Product Management plugin gives you /strategy - type that and Claude walks you through a full strategic canvas.产品管理插件提供 /strategy 命令，输入该命令后，Claude 将引导您完成完整的战略画布。

Chain commands together: /strategy → /business-model → /pricing → /plan-launch. That's an entire PM workflow triggered by slash commands.将命令串联起来：/strategy → /business-model → /pricing → /plan-launch。这是一个由斜杠命令触发的完整项目管理工作流程。

There's a marketplace at [claude.com/plugins](https://claude.com/plugins) with 15+ verified plugins.那里有个市场 [claude.com/plugins](https://claude.com/plugins) 拥有 15 个以上经过验证的插件。

![图像](https://pbs.twimg.com/media/HEPSWyBa8AADTw6?format=jpg&name=large)

Skills are what Claude knows how to do - handling xlsx, pptx, docx, pdf files with native formatting. 克劳德的技能在于他能够处理具有原生格式的 xlsx、pptx、docx、pdf 文件。

I made a big post about most useful Skills already here: 我之前已经发过一篇关于最实用技能的长文，链接在这里：

> 3月20日

## 5\. Connectors (Your Apps, Connected)5. 连接器（您的应用，已连接）

Gmail, Google Calendar, Slack, Google Drive, Notion, OneDrive, SharePoint, Microsoft 365 - Claude connects to all of them.Claude 可以连接到 Gmail、Google 日历、Slack、Google 云端硬盘、Notion、OneDrive、SharePoint、Microsoft 365 等所有这些应用。

Claude can pull data from them directly into your local files. The Microsoft 365 connector is the big one - Claude reads Outlook emails, accesses SharePoint docs, works with OneDrive files. Claude 可以直接从这些平台提取数据到本地文件中。其中最重要的就是 Microsoft 365 连接器——Claude 可以读取 Outlook 电子邮件、访问 SharePoint 文档并处理 OneDrive 文件。

![图像](https://pbs.twimg.com/media/HEPS0UHbcAAQ8v9?format=jpg&name=large)

Cross-app workflows like analyzing data in Excel and then building a PowerPoint from those findings. 跨应用程序工作流程，例如在 Excel 中分析数据，然后根据分析结果创建 PowerPoint。

If you add Claude in Chrome on top of that, Cowork can also do browser-based research. It picks the fastest path - connector for Slack, Chrome for web research, screen interaction for apps without direct integration.如果在此基础上，再在 Chrome 浏览器中安装 Claude，Cowork 还可以进行基于浏览器的研究。它会选择最快的路径——Slack 使用连接器，Chrome 浏览器用于网页研究，而对于没有直接集成的应用，则通过屏幕交互实现。

## The Worst Part: It Eats Your Limits Fast最糟糕的是：它会迅速消耗你的极限。

This is actually a fly in the ointment.这其实是个美中不足的问题。

```markdown
Regular Claude chat:   ~1x token usage
Cowork task:           ~3-5x token usage (complex multi-step tasks)
```

If you're on Pro ($20/mo), you'll burn through limits quick with heavy Cowork usage. 如果你使用的是专业版（每月 20 美元），并且经常使用 Cowork 服务，那么你的流量限制很快就会用完。

Max plan ($100 or $200/mo) gives you way more room. 最高套餐（每月 100 或 200 美元）提供更大的空间。

Anthropic is pretty upfront about this - agentic tasks need more compute.Anthropic 对此非常坦诚——智能体任务需要更多的计算能力。

Tips to manage it:应对方法：

- Batch related work into single sessions instead of multiple small ones将批量相关工作合并到单个会话中，而不是多个小型会话中。
- Schedule heavy tasks for off-peak hours (evenings/weekends reportedly give 2x throughput)将繁重任务安排在非高峰时段（据报道，晚上/周末的吞吐量可提高 2 倍）。
- Be specific in your prompts - vague requests = more back-and-forth = more tokens burned你的请求要具体明确——模糊的要求会导致更多来回沟通，最终消耗更多代币。

## What You Need to Get Started入门所需物品

Requirements: ✓ Claude Desktop app ([claude.com/download](https://claude.com/download)) ✓ macOS or Windows (arm64 Windows not supported yet) ✓ Paid plan: Pro ($20/mo), Max ($100-200/mo), Team, or Enterprise ✓ Internet connection (required throughout) The app must stay open while Claude is working. Close it = session ends.要求： ✓ Claude 桌面应用程序（ [claude.com/download](https://claude.com/download) ） ✓ macOS 或 Windows（暂不支持 arm64 Windows） ✓ 付费方案：专业版（每月 20 美元）、高级版（每月 100-200 美元）、团队版或企业版 ✓ 全程需要网络连接 Claude 工作时，应用程序必须保持打开状态。 关闭窗口 = 会话结束。

Open Claude Desktop → click the Cowork tab → describe your task → review Claude's plan → let it run. 打开 Claude Desktop → 点击 Cowork 选项卡 → 描述您的任务 → 查看 Claude 的计划 → 让它运行。

![图像](https://pbs.twimg.com/media/HEPT_fyWEAAc3V5?format=png&name=large)

## Who This Is Actually For这究竟是为谁准备的？

At particular moment of time - Cowork isn't for everyone yet.在某个特定时期，联合办公空间并不适合所有人。

If you're a developer who already uses Claude Code in the terminal, Cowork doesn't add much. - because code gives you more control.如果你是一名已经在终端中使用 Claude Code 的开发者，那么 Cowork 并没有带来太多新功能——因为 Claude Code 已经提供了更多的控制权。

But if your day looks like :但如果你的一天是这样的：

\- Sorting through files and emails - Compiling reports from scattered notes - Processing receipts or invoices - Prepping for meetings - Organizing research - Creating docs/spreadsheets/slides from raw data整理文件和电子邮件 - 从零散的笔记中整理报告 - 处理收据或发票 - 会议准备 - 组织研究 - 根据原始数据创建文档/电子表格/幻灯片

Then Cowork is built for you. Researchers, analysts, ops people, PMs, finance teams, content creators - anyone doing knowledge work that's time-consuming but not technically complex.那么，共享办公空间就是为你量身打造的。研究人员、分析师、运营人员、项目经理、财务团队、内容创作者——任何从事耗时但技术难度不高的知识型工作的人。

The pitch is simple: describe the outcome you want, step away, come back to finished work.道理很简单：描述你想要的结果，然后离开一会儿，回来就能看到完成的作品。

![图像](https://pbs.twimg.com/media/HEPTy3ua8AAuLlG?format=jpg&name=large)

## Conclusion 结论

We're watching AI shift from "tool you talk to" to "tool that works for you." Cowork is still in research preview - it has rough edges and it's not perfect. 我们正在见证人工智能从“与你对话的工具”向“为你工作的工具”转变。联合办公仍处于研究预览阶段——它还有不完善的地方，并不完美。

The people who figure out how to delegate effectively to AI agents right now are going to have a massive advantage. 现在那些能够有效利用人工智能代理进行任务委派的人将会拥有巨大的优势。

Not because the tech is magic, but because everyone else is still copy-pasting from chat windows.不是因为技术有多神奇，而是因为其他人还在从聊天窗口复制粘贴。

Don't be the person still uploading files manually in 2026.别到了2026年还在手动上传文件。

I post stuff like this regularly — AI tools, workflows, prompts, and things I actually use. 我经常发布这类内容——人工智能工具、工作流程、提示以及我实际使用的东西。

![图像](https://pbs.twimg.com/media/HEPUYG4WoAAQotK?format=jpg&name=large)

Follow me so you don't miss the next one:关注我，以免错过下一期：

**Telegram →** [https://t.me/zodchixquant](https://t.me/zodchixquant)**Telegram →** [https://t.me/zodchixquant](https://t.me/zodchixquant)