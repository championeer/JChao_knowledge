---
title: "How I Manage Memory for My 24/7 OpenClaw Agent Team (and why one correction fixes all Agents) 我如何管理我的全天候 OpenClaw 代理团队的内存（以及为什么一个修正可以修复所有代理的问题）"
source: "https://x.com/Saboo_Shubham_/status/2033026472856952849"
author:
  - "[[Unknown]]"
published: 2026-03-14
created: 2026-03-16
description: "#TruthSeeker #INTJ #AIxEverything事上磨练，道在行中"
tags:
  - "clippings"
---
Most AI agents forget everything the moment the session ends.大多数人工智能代理在会话结束后会立即忘记所有内容。

I run six agents 24/7 on a Mac Mini. Research, content, engineering, newsletters, LinkedIn, coordination. They run on cron schedules. They wake up fresh every session with zero memory of what happened before.我在一台 Mac Mini 上 24/7 全天候运行六个代理程序。它们负责研究、内容创作、工程设计、新闻简报、LinkedIn 管理和协调工作。这些程序通过 cron 定时任务运行。每次启动后，它们都会以全新的状态运行，完全不保留之前的任何信息。

That should be a disaster. It's not.那本该是一场灾难，但事实并非如此。

Because the memory isn't in the agent. It's in the files around it.因为内存不在代理程序本身，而是在它周围的文件中。

I wrote recently about how I built this autonomous agent team. The number one follow-up question: "How do you get them to actually remember anything?"我最近写了一篇关于如何构建这个自主代理团队的文章。读者最关心的后续问题是：“如何才能让它们真正记住一些东西？”

This is the answer. The memory architecture, the failures, and what actually worked.这就是答案。内存架构、故障以及真正有效的方案。

## The day two problem第二天的问题

Every agent framework sells you on capabilities. Tool use. Multi-agent coordination. Streaming. Fancy orchestration patterns.每个代理框架都会向你推销各种功能。工具使用、多代理协调、流式处理、复杂的编排模式。

Nobody talks about what happens on day two.没人谈论第二天发生的事情。

Your agent nails the first session. Great output. You're excited. You close the terminal. You come back tomorrow. The agent has no idea who you are, what you told it yesterday, or what mistakes you already corrected.你的代理第一次会话就非常成功，效果显著。你很兴奋，关掉了终端。第二天你又回来了。然而，代理却完全不知道你是谁，也不知道你昨天告诉了它什么，更不知道你已经纠正了哪些错误。

You re-explain everything. Again.你又把所有事情重新解释了一遍。

This is the fundamental problem of autonomous agents. Every session starts from zero. The corrections you gave yesterday? Gone. The preferences you explained? Gone. Unless you make memory explicit, your agents wake up with amnesia every single time.这就是自主智能体的根本问题。每次会话都从零开始。你昨天做的修正？没了。你解释过的偏好？也没了。除非你明确地存储记忆，否则你的智能体每次醒来都会失忆。

I hit this wall in week one. I told Kelly, my X/Twitter agent, to stop using emojis. She fixed it. Then I saw Rachel's LinkedIn draft. Emojis. I corrected Rachel. Next day, Pam's newsletter draft landed. Emojis.第一周我就遇到了这个问题。我告诉我的前推特经纪人凯莉不要再用表情符号了。她改正了。然后我看到了瑞秋的领英草稿。表情符号。我纠正了瑞秋。第二天，帕姆的邮件草稿也出来了。表情符号。

Six agents. Same correction. Six separate conversations. Every single time.六名客服人员。同样的更正。六次单独的对话。每次都是如此。

I was spending more time repeating myself than doing actual work. A preference I told Kelly didn't reach Rachel. A rule I set for Pam didn't exist for Ross.我花在重复同样话上的时间比实际工作的时间还多。我告诉凯莉的偏好，瑞秋却没听到。我为帕姆定下的规矩，罗斯却不以为然。

OpenClaw already handles the first two layers. SOUL.md files, daily logs, session structure. But I needed a third layer on top, one where corrections propagate across all six agents automatically.OpenClaw 已经处理了前两层：SOUL.md 文件、每日日志和会话结构。但我还需要第三层，让修正能够自动传播到所有六个代理。

## Three layers of Agent Memory代理记忆的三层结构

Agent memory isn't one thing. It's three layers, each solving a different problem.智能体的记忆并非单一因素，而是由三层组成，每一层都解决不同的问题。

![图像](https://pbs.twimg.com/media/HDavz2caMAYNArL?format=jpg&name=large)

**Layer 1: Working memory第一层：工作记忆**

Markdown files loaded at boot. Every agent reads these before doing anything else.启动时加载 Markdown 文件。每个代理程序在执行任何其他操作之前都会读取这些文件。

SOUL.md tells the agent who it is. USER.md tells it who I am. MEMORY.md holds the curated lessons it's learned over time. Daily logs (memory/YYYY-MM-DD.md) hold yesterday's raw session notes.SOUL.md 文件告诉代理它的身份。USER.md 文件告诉代理我的身份。MEMORY.md 文件保存着代理随着时间推移而学习到的精选经验教训。每日日志（memory/YYYY-MM-DD.md）保存着昨天的原始会话记录。

This is the layer that makes agents feel like they remember.这一层让代理人感觉他们记得。

Kelly has a MEMORY.md section called "BAD (what I did wrong)" where she lists every content pattern I've rejected. Emojis. Hashtags. LinkedIn tone. Bullet-point threads. She wrote that list herself, unprompted, after I gave corrections. It loads every session. She never repeats those mistakes.Kelly 的 MEMORY.md 文件里有一个名为“错误（我做错了什么）”的部分，列出了我否决过的所有内容模式。表情符号、话题标签、LinkedIn 的语气、要点式列表等等。这份清单是她在我提出修改意见后主动写的，每次打开都会加载。她再也没有犯过同样的错误。

Dwight has one rule in his memory that changed everything: "If Alex (our target persona) can't DO something with it TODAY, skip it." He went from flagging 47 stories to delivering 7. Same model. Different memory file.德怀特牢记着一条规则，这条规则彻底改变了一切：“如果亚历克斯（我们的目标用户）今天不能处理这件事，那就跳过它。”他之前标记了 47 个故事，现在只提交了 7 个。同样的模式，不同的记忆方式。

**Layer 2: Session memory.第二层：会话内存。**

Live conversations. Cron job outputs. Cross-agent messaging. Everything that happens during a single session.实时对话。定时任务输出。跨代理消息传递。单次会话期间发生的一切。

This layer is ephemeral by design. When Kelly runs at 5 PM, she reads Dwight's intel, drafts posts, logs what she produced in her daily file, and the session ends. The conversation itself disappears. What mattered got written to a file. What didn't matter is gone.这一层机制是刻意设计的，它转瞬即逝。凯莉下午五点开始工作时，她会阅读德怀特的情报，撰写帖子草稿，并将工作内容记录在每日文件中，然后会话结束。对话本身也会消失。重要的信息会被写入文件，不重要的信息则会被删除。

That's not a limitation. That's garbage collection.那不是限制，那是垃圾回收机制。

More memory isn't always better. Kelly's daily logs hit 161,000 tokens once and her output quality collapsed. She was reading so much history that she had no room left to do actual work. Now she loads only today plus yesterday. The important stuff lives in MEMORY.md anyway.内存并非越多越好。凯莉的每日日志曾经达到 161,000 个标记，结果输出质量急剧下降。她读取了太多历史记录，以至于没有剩余空间进行实际工作。现在她只加载今天和昨天的日志。反正重要的数据都保存在 MEMORY.md 文件中。

**Layer 3: Long-term memory第三层：长期记忆**

Google Vertex AI Memory Bank. This is the layer that connects all six agents. It works through three channels.Google Vertex AI 记忆库。这一层连接了所有六个智能体。它通过三个通道工作。

- Auto-capture extracts facts from every conversation and stores them.自动捕获功能会从每次对话中提取事实并存储起来。
- File sync watches 21 workspace files and syncs changes when they update.文件同步功能会监视 21 个工作区文件，并在文件更新时同步更改。
- Auto-recall pulls the 10 most relevant memories before every agent turn using similarity search.自动回忆功能会在每次代理行动之前，利用相似性搜索提取 10 个最相关的记忆。

This is the layer where one correction fixes all of them.这一层只需要一次修正就能解决所有问题。

> 3月14日
> 
> Just open-sourced an OpenClaw Plugin for Google Vertex AI Memory Bank. Auto capture, auto recall with cross-agent persistent memory. Send this repo link to your agent and watch it install itself.

## How the memory layers work together内存层如何协同工作

Here's how a single correction flows through all three layers.以下是单个校正如何流经所有三个层级的过程。

I tell Monica "never use em dashes in any content." That's session memory. Monica logs it in her daily file. That's working memory for tomorrow. She distills it into her MEMORY.md. That's permanent working memory. The Memory Bank captures the fact from our conversation. That's long-term memory, shared across every agent.我告诉莫妮卡“任何内容中都不要使用破折号”。这是会话记忆。莫妮卡将其记录在她的每日文件中。这是明天的工作记忆。她将其提炼到她的 MEMORY.md 文件中。这是永久工作记忆。记忆库会记录我们对话中的信息。这是长期记忆，所有智能体共享。

![图像](https://pbs.twimg.com/media/HDa4REZaMAUiisn?format=jpg&name=large)

Now when any agent starts a session, that preference surfaces automatically. Kelly avoids them. So does Rachel. So does Pam. So does Ross. One conversation. Six agents updated. I never said it twice.现在，任何客服人员开始会话时，这种偏好都会自动显示。凯莉会避开他们。瑞秋也会。帕姆也会。罗斯也会。一次对话，六位客服人员的偏好就更新了。我从未重复过这句话。

The same correction exists in three places, serving three purposes. Daily log for recent context. MEMORY.md for Monica's session startup. Memory Bank for cross-agent propagation.同一个修正出现在三个地方，分别用于三个目的：每日日志（用于记录近期上下文）、MEMORY.md（用于记录 Monica 的会话启动信息）以及内存库（用于跨代理传播）。

Redundancy is the point. If one layer fails, the others catch it.冗余设计是关键。如果一层出现故障，其他层可以弥补。

## What I tried before this worked我之前尝试的方法奏效了。

I did not land on this architecture on the first attempt. Let me save you the failures.我第一次尝试并没有采用这种架构。让我来帮你避开那些失败的尝试吧。

**Attempt 1:** Self-hosted Mem0 with Ollama and SQLite. Crashed constantly. Stored nothing useful. The embeddings were unreliable and the retrieval was worse. Abandoned after a week.**尝试 1：** 使用 Ollama 和 SQLite 自托管 Mem0。频繁崩溃。没有存储任何有用数据。嵌入数据不可靠，检索情况更糟。一周后放弃。

**Attempt 2:** OpenClaw's built-in memory-core with Gemini embeddings and hybrid search. Worked technically. But it indexed raw session transcripts. That meant agents were recalling operational noise like "checking cron status... all healthy" instead of actual preferences and decisions.**尝试二：** 使用 OpenClaw 内置的内存核心，结合 Gemini 嵌入和混合搜索。技术上可行，但它索引的是原始会话记录。这意味着智能体回忆的是诸如“正在检查 cron 状态……一切正常”之类的操作噪声，而不是实际的偏好和决策。

The noise problem was the killer. Memory systems that store everything are memory systems that recall garbage.噪声问题是致命的。存储所有数据的内存系统最终只会调用垃圾数据。

The current system works because it separates capture from recall. The Memory Bank uses an LLM to extract facts from conversations, not raw transcripts. What gets stored are actual preferences, decisions, and lessons.目前的系统之所以有效，是因为它将信息采集与回忆分开。记忆库使用逻辑学习模型（LLM）从对话中提取事实，而不是原始的文本记录。存储的是实际的偏好、决策和经验教训。

## Start here从这里开始

You don't need all three layers on day one. Start with one file.第一天不需要全部三个图层，先从一个文件开始。

Write a MEMORY.md with your three most important preferences. Make your agent load it at session start.

Give feedback for a week. When you find yourself correcting the same thing twice, add it to the file.

That alone will cut your repeat corrections in half within a week.

When you hit the wall I hit, the one where you're correcting six agents for the same thing, that's when you need Layer 3. I open-sourced the plugin that solved it for me: [openclaw-vertex-memorybank](https://github.com/Shubhamsaboo/openclaw-vertexai-memorybank)当你遇到我遇到的瓶颈，也就是需要纠正六个代理的同一个错误时，你就需要第三层了。我已经开源了解决我问题的插件： [openclaw-vertex-memorybank](https://github.com/Shubhamsaboo/openclaw-vertexai-memorybank)

Start with one file. One correction. The rest will follow.