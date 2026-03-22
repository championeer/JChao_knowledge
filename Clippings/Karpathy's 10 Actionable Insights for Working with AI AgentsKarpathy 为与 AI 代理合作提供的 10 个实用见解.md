---
title: "Karpathy's 10 Actionable Insights for Working with AI AgentsKarpathy 为与 AI 代理合作提供的 10 个实用见解"
source: "https://x.com/daniel_mac8/status/2035683886756196499"
author:
  - "[[Unknown]]"
published: 2026-03-22
created: 2026-03-22
description:
tags:
  - "clippings"
---
Or, how to fix your skill issues.或者，如何解决你的技能问题。

Use all of these to become more effective at working with AI agents.运用这些方法可以更有效地与人工智能代理合作。

**1\. Think in macro actions, not lines of code** — Run multiple agents in parallel on non-conflicting tasks. Tile your screen with agent sessions. Assign each one a distinct functionality, review their outputs, and integrate. Stop thinking "here's a line of code" and start thinking "here's a whole new feature — delegate it."**1\. 着眼于宏观操作，而非代码行数** ——并行运行多个代理执行不冲突的任务。将代理会话平铺在屏幕上。为每个代理分配不同的功能，检查它们的输出，并进行整合。停止思考“这里有一行代码”，开始思考“这里有一个全新的功能——把它委托出去”。

<video preload="none" tabindex="-1" playsinline="" aria-label="嵌入式视频" poster="https://pbs.twimg.com/amplify_video_thumb/2035683050097369088/img/LihYGQv6ygacadyq.jpg" style="width: 100%; height: 100%; position: absolute; background-color: black; top: 0%; left: 0%; transform: rotate(0deg) scale(1.005);"><source type="video/mp4" src="blob:https://x.com/aad2d313-669d-4723-93d5-c4db2eb868d6"></video>

0:00 / 0:46

**2\. When something fails, assume it's a skill issue first** — The capability is almost certainly there. If an agent isn't delivering, the problem is more likely your prompt, your AGENTS.md file, your memory tool setup, or your orchestration — not the model itself. Karpathy says it "all kind of feels like skill issue when it doesn't work."**2\. 当出现故障时，首先要假设是技能问题** ——能力几乎肯定是有的。如果代理无法正常工作，问题更有可能出在你的提示、AGENTS.md 文件、内存工具设置或编排流程上，而不是模型本身。Karpathy 说：“当一切不正常时，感觉都像是技能问题。”

<video preload="none" tabindex="-1" playsinline="" aria-label="嵌入式视频" poster="https://pbs.twimg.com/amplify_video_thumb/2035680028881813504/img/kJyPDJToAitU_Dv_.jpg" style="width: 100%; height: 100%; position: absolute; background-color: black; top: 0%; left: 0%; transform: rotate(0deg) scale(1.005);"><source type="video/mp4" src="blob:https://x.com/ebec43f9-5ed0-456a-b529-0b6c967bb782"></video>

0:00 / 0:30

**3\. Remove yourself as the bottleneck** — You can't be there to prompt the next thing. Arrange your agent workflows so they're completely autonomous. The name of the game is leverage: put in very few tokens occasionally, and a huge amount of stuff happens on your behalf. Maximize your token throughput by not being in the loop.**3\. 避免成为瓶颈** ——你不能时刻在场触发下一步操作。安排好代理的工作流程，使其完全自动化。关键在于杠杆作用：偶尔投入少量令牌，就能自动完成大量工作。通过避免参与流程，最大化令牌吞吐量。

<video preload="none" tabindex="-1" playsinline="" aria-label="嵌入式视频" poster="https://pbs.twimg.com/amplify_video_thumb/2035680181776486400/img/leuFBBkCo58KFcUY.jpg" style="width: 100%; height: 100%; position: absolute; background-color: black; top: 0%; left: 0%; transform: rotate(0deg) scale(1.005);"><source type="video/mp4" src="blob:https://x.com/edcd198a-e5e5-442d-a32b-0601dac31f84"></video>

![](https://pbs.twimg.com/amplify_video_thumb/2035680181776486400/img/leuFBBkCo58KFcUY.jpg?name=large)

**4\. Build muscle memory for agent orchestration** — Like any new skill, managing agents takes deliberate practice. Learn to tile multiple agent instances across your monitor, develop a rhythm for assigning work and reviewing outputs, and recognize when to parallelize vs. sequence tasks. Karpathy describes this as "developing a muscle memory" for the new workflow.**4\. 培养代理编排的肌肉记忆** ——和任何新技能一样，管理代理需要刻意练习。学习如何在显示器上平铺多个代理实例，养成分配任务和查看输出的节奏，并了解何时应该并行处理任务，何时应该按顺序处理任务。Karpathy 将此描述为对新工作流程“培养肌肉记忆”。

<video preload="none" tabindex="-1" playsinline="" aria-label="嵌入式视频" poster="https://pbs.twimg.com/amplify_video_thumb/2035680501151760384/img/6qwZUhnEkA0h9aiC.jpg" style="width: 100%; height: 100%; position: absolute; background-color: black; top: 0%; left: 0%; transform: rotate(0deg) scale(1.005);"><source type="video/mp4" src="blob:https://x.com/6c539e71-fedc-415e-806f-c2aef83662c2"></video>

0:00 / 0:21

**5\. Treat your agent instructions (ProgramMDs) as tunable code** — Your markdown instruction files aren't static docs — they're code you iterate on. Different instructions produce different behaviors. You can run variants, see which instructions produce better outcomes, and even meta-optimize: let agents write better instructions based on what worked. (This is what [aceagent.io](https://aceagent.io/) does for you.)**5\. 将你的代理指令（ProgramMD）视为可调代码** ——你的 Markdown 指令文件并非静态文档，而是需要迭代优化的代码。不同的指令会产生不同的行为。你可以运行不同的变体，观察哪些指令能产生更好的结果，甚至可以进行元优化：让代理根据有效指令编写更优的指令。（这就是……） [aceagent.io](https://aceagent.io/) 为你做。）

<video preload="none" tabindex="-1" playsinline="" aria-label="嵌入式视频" poster="https://pbs.twimg.com/amplify_video_thumb/2035680949833519104/img/SUJ6TRZG6k9bJK2o.jpg" style="width: 100%; height: 100%; position: absolute; background-color: black; top: 0%; left: 0%; transform: rotate(0deg) scale(1.005);"><source type="video/mp4" src="blob:https://x.com/a7f24dca-202a-440e-be1c-5bbd123a0124"></video>

![](https://pbs.twimg.com/amplify_video_thumb/2035680949833519104/img/SUJ6TRZG6k9bJK2o.jpg?name=large)

**6\. Replace bespoke apps with agent-driven API glue** — Stop logging into six separate UIs. If your devices and tools expose APIs, a single agent can orchestrate across all of them and do things no individual app can. Karpathy unified his entire smart home into one WhatsApp-driven assistant. Think API endpoints + agent intelligence, not custom UIs.**6\. 用基于代理的 API 粘合剂取代定制应用** ——无需再登录六个不同的用户界面。如果你的设备和工具都开放了 API，那么一个代理就可以协调所有设备和工具，完成单个应用无法完成的任务。Karpathy 将他的整个智能家居系统整合到一个基于 WhatsApp 的助手中。想想 API 端点 + 代理智能，而不是定制的用户界面。

<video preload="none" tabindex="-1" playsinline="" aria-label="嵌入式视频" poster="https://pbs.twimg.com/amplify_video_thumb/2035681137465368576/img/jIriPl_9aVw6-jMi.jpg" style="width: 100%; height: 100%; position: absolute; background-color: black; top: 0%; left: 0%; transform: rotate(0deg) scale(1.005);"><source type="video/mp4" src="blob:https://x.com/cb559a95-a7cf-4d31-8fa6-d71c39ef7518"></video>

![](https://pbs.twimg.com/amplify_video_thumb/2035681137465368576/img/jIriPl_9aVw6-jMi.jpg?name=large)

**7\. Invest in persistent, looping agent setups** — Move beyond single interactive sessions. Set up agents that keep looping and acting on your behalf even when you're not watching — with their own sandboxes, more sophisticated memory systems, and the ability to resume work across sessions.**7\. 投资构建持久循环的代理系统** ——超越单一的交互式会话。构建即使在您不监控的情况下也能持续循环并代表您执行操作的代理系统——这些代理系统拥有独立的沙箱、更完善的记忆系统，并且能够在不同会话之间恢复工作。

<video preload="none" tabindex="-1" playsinline="" aria-label="嵌入式视频" poster="https://pbs.twimg.com/amplify_video_thumb/2035681310648279040/img/Q3yoPINeIcRDR41u.jpg" style="width: 100%; height: 100%; position: absolute; background-color: black; top: 0%; left: 0%; transform: rotate(0deg) scale(1.005);"><source type="video/mp4" src="blob:https://x.com/ce981426-3198-43ae-b48c-6f65d7e8d45a"></video>

0:00 / 0:46

**8\. Understand that model improvements are jagged, not uniform** — Models are incredible at verifiable tasks (passing tests, writing code) but weak at soft, non-verifiable things (humor, nuanced intent). Don't assume capability in one domain transfers everywhere. Know the blind spots and design your agent workflows around them.**8\. 要明白模型改进并非一帆风顺，而是呈锯齿状的** ——模型在可验证的任务（通过测试、编写代码）上表现出色，但在难以验证的模糊领域（幽默、微妙的意图）却表现不佳。不要想当然地认为一个领域的能力可以迁移到其他领域。了解模型的盲点，并围绕这些盲点设计代理的工作流程。

<video preload="none" tabindex="-1" playsinline="" aria-label="嵌入式视频" poster="https://pbs.twimg.com/amplify_video_thumb/2035681495143059456/img/NsWAReGm1lGqwa_U.jpg" style="width: 100%; height: 100%; position: absolute; background-color: black; top: 0%; left: 0%; transform: rotate(0deg) scale(1.005);"><source type="video/mp4" src="blob:https://x.com/e26a3320-538e-4c47-9a10-741f638e0b3d"></video>

![](https://pbs.twimg.com/amplify_video_thumb/2035681495143059456/img/NsWAReGm1lGqwa_U.jpg?name=large)

**9\. Write documentation for agents, not humans** — Instead of HTML guides for people, write Markdown for agents. If agents understand your codebase, they'll explain it to each human in their language with infinite patience. Your job is the irreducible insight — the few bits the model can't generate itself. Everything else is delegation.**9\. 为智能体而非人类编写文档** ——与其为人类编写 HTML 指南，不如为智能体编写 Markdown 文档。如果智能体能够理解你的代码库，它们会用人类能理解的语言，以无限的耐心向每个人解释。你的工作是提供不可简化的洞察——模型自身无法生成的那一小部分信息。其他一切都可以委托他人完成。

<video preload="none" tabindex="-1" playsinline="" aria-label="嵌入式视频" poster="https://pbs.twimg.com/amplify_video_thumb/2035681639863611392/img/PquoUR6qa9B1K1eb.jpg" style="width: 100%; height: 100%; position: absolute; background-color: black; top: 0%; left: 0%; transform: rotate(0deg) scale(1.005);"><source type="video/mp4" src="blob:https://x.com/bb1ffaba-6987-4fee-ace5-4f019870dce5"></video>

0:01 / 0:50

**10\. Focus your energy exclusively on what agents can't do** — The things agents can do, they'll soon do better than you. Be strategic about where you spend time. Your value-add is the irreducible creative insight, the taste judgment, the novel framing that agents can't yet produce. Everything else? Hand it off.**10\. 将精力集中在经纪人做不到的事情上** ——经纪人能做的事情，他们很快就会比你做得更好。要策略性地安排时间。你的价值在于经纪人目前无法提供的、不可或缺的创造性洞察力、品味判断力和新颖的框架构建。至于其他的事情？交给他们吧。

<video preload="none" tabindex="-1" playsinline="" aria-label="嵌入式视频" poster="https://pbs.twimg.com/amplify_video_thumb/2035681979153178624/img/qXBA7_WHk8CIdA_I.jpg" style="width: 100%; height: 100%; position: absolute; background-color: black; top: 0%; left: 0%; transform: rotate(0deg) scale(1.005);"><source type="video/mp4" src="blob:https://x.com/51f034f2-8318-499e-b95b-6a56538b9307"></video>

0:01 / 0:44

All the tips and clips come from [@NoPriorsPod](https://x.com/@NoPriorsPod): [https://youtu.be/kwSVtQ7dziU?si=5MuLx8QVjRvQIWfl](https://youtu.be/kwSVtQ7dziU?si=5MuLx8QVjRvQIWfl)所有技巧和片段均来自 [@NoPriorsPod](https://x.com/@NoPriorsPod) ： [https://youtu.be/kwSVtQ7dziU?si=5MuLx8QVjRvQIWfl](https://youtu.be/kwSVtQ7dziU?si=5MuLx8QVjRvQIWfl)