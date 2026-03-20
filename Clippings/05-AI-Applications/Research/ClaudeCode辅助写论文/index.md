---
title: "Using Claude Code While Writing a Research Paper在撰写研究论文时使用 Claude Code"
source: "https://x.com/liulicheng10/status/2032487597214490969"
author:
  - "[[Unknown]]"
published: 2026-03-14
created: 2026-03-14
description: "#TruthSeeker #INTJ #AIxEverything事上磨练，道在行中"
tags:
  - "clippings"
---
We just wrapped up a paper, and Claude Code ended up doing a surprising amount of the grunt work. The big takeaway: it's incredibly good at tasks where the goal is obvious and the workflow is repeatable. But the moment a problem requires you to think about the system as a whole, it hits a wall.我们刚完成一篇论文，Claude Code 竟然承担了大量繁琐的工作。最大的收获是：它非常擅长处理目标明确、工作流程可重复的任务。但一旦问题需要你从整体上思考系统 ，它就束手无策了。

Here's what that looked like in practice.以下是实际情况。

## Where it crushed it它被压碎的地方

The tasks Claude Code nailed all had something in common: clear inputs, clear outputs, and mostly execution, not judgment calls.克劳德·科德出色完成的任务都有一个共同点：清晰的输入、清晰的输出，以及主要依靠执行力，而不是判断力。

**Plotting.** I had it generate three figures for the paper. For one of them (reasoning length trends across eight environments) I literally just said "plot the reasoning length trends for me." It picked a 2×4 subplot layout on its own, added variance bands with smoothed curves, and even annotated each panel with the early-to-late-stage percentage change (e.g., "-40%", "-87%"). I never asked for that. Then I said "make it look better," and it applied Savitzky-Golay smoothing, swapped the color scheme, cleaned up the spines and ticks, and adjusted fonts to look publication-ready. We tried the same task with Codex; the main gap was in aesthetic judgment. Claude Code is weirdly good at inferring what you mean from vague instructions.**绘图。** 我让它为论文生成了三张图。其中一张（八种环境下推理时长趋势图）我只是简单地说了句“帮我画出推理时长趋势图”。它自动选择了一个 2×4 的子图布局，添加了带有平滑曲线的方差带，甚至还标注了每个面板从早期到晚期的百分比变化（例如，“-40%”、“-87%”）。这些我都没要求过。然后我说“让它看起来更美观一些”，它应用了 Savitzky-Golay 平滑，更换了配色方案，清理了图表边缘和刻度线，并调整了字体，使其看起来符合出版标准。我们用 Codex 尝试了同样的任务；主要差距在于审美判断。Claude Code 非常擅长从模糊的指令中推断出你的意思。

![图像](https://pbs.twimg.com/media/HDTJeGYa0AAgSbb?format=jpg&name=large)

Previous version先前版本

![图像](https://pbs.twimg.com/media/HDUoIvJa0AAl7Yw?format=jpg&name=large)

Edited by CC由 CC 编辑

**Code migration.** We had a multi-turn search environment that needed porting from one codebase to our codebase. Completely different architectures: ToolEnvironment on one side, BaseLanguageBasedEnv + gym.Env dual inheritance on the other, plus 128 concurrent instances hitting the retrieval server during training. Doing it by hand would've been a solid half-day to full-day job. Claude Code knocked it out in under an hour. It had everything it needed: clear goal, source code on both ends, and the work was mostly "understand the architecture, then adapt."**代码迁移。** 我们有一个多轮搜索环境，需要从一个代码库移植到我们的代码库。架构完全不同：一端是 ToolEnvironment，另一端是 BaseLanguageBasedEnv + gym.Env 双重继承，而且在训练期间有 128 个并发实例访问检索服务器。如果手动完成，至少需要半天到一天的时间。Claude Code 不到一个小时就搞定了。它具备所有必要的条件：明确的目标、两端的源代码，而且工作主要就是“理解架构，然后进行适配”。

**Formatting math proofs.** This one surprised me, since Claude Code is fundamentally a coding tool. Our appendix has a bunch of mathematical proofs, and the workflow was: write a rough draft, then hand it off for formatting. But it went beyond formatting. In a gradient decomposition derivation for the SNR mechanism, my draft used the Cauchy-Schwarz inequality to bound a quantity but left the bound conditions incomplete. Claude Code caught this and filled in the definition and constraints for the constant C. It was also solid at writing section overviews, usually tighter and more accurate than what I'd write manually. The entire appendix (12+ pages of LaTeX) could be reviewed in one pass with edits throughout.**格式化数学证明。** 这一点让我很意外，因为 Claude Code 本质上是一个编码工具。我们的附录里有很多数学证明，工作流程是：先写个草稿，然后交给它进行格式化。但它的功能远不止于此。在推导信噪比机制的梯度分解时，我的草稿使用了柯西-施瓦茨不等式来限定一个量，但限定条件并不完整。Claude Code 发现了这个问题，并补充了常数 C 的定义和约束条件。它在编写章节概述方面也表现出色，通常比我手动写的更简洁、更准确。整个附录（超过 12 页的 LaTeX 文档）只需一次审阅即可完成，并且可以随时进行编辑。

## The compounding effect复利效应

![图像](https://pbs.twimg.com/media/HDTUUrlaYAAupHL?format=jpg&name=large)

Plotting is the clearest example. The first figure took some back-and-forth to nail the interaction pattern: feed it a csv, give a vague request, let it pick the layout and colors, then iterate on details. Figures two and three followed the same flow and came together fast. Same with proof formatting: the first section took time to calibrate, but the rest were basically free.绘图就是最明显的例子。第一个图的绘制过程反复推敲，才最终确定了交互模式：先输入一个 CSV 文件，给出一个大致的请求，让它自动选择布局和颜色，然后再逐步完善细节。第二个和第三个图的绘制流程相同，很快就完成了。证明格式的设置也是如此：第一部分花了一些时间进行校准，但其余部分基本上都是免费的。

This is where Claude Code really pays off. The prompting patterns you develop carry over directly. You're not starting from zero each time.这就是克劳德代码的真正价值所在。你开发的提示模式可以直接沿用，无需每次都从零开始。

## Where it can't help它无能为力的地方

A bug after the search environment went live is a good example of the boundary.搜索环境上线后出现的错误是边界的一个很好的例子。

![图像](https://pbs.twimg.com/media/HDTR_IabUAAmyqX?format=jpg&name=large)

Some context: the search environment was migrated from a large open-source RL framework, which is a pretty large and established codebase. So when things broke, the setup itself was the last thing we'd suspect. On top of that, everything had been running fine on our Slurm cluster. After migrating to [Vast.ai](https://vast.ai/), training started hitting constant timeouts and random crashes. Logs showed the Flask server slowing down, timeouts cascading, but the root cause was nowhere in sight. I asked Claude Code to take a look; it went through the code, configs, and logs, and came up empty. The code hadn't changed at all. What used to work just… didn't.背景：搜索环境是从一个大型开源强化学习框架迁移过来的，该框架拥有相当庞大且成熟的代码库。因此，当出现问题时，我们最不可能怀疑的就是配置本身。此外，一切在我们的 Slurm 集群上运行良好。迁移到…… [Vast.ai](https://vast.ai/) 训练过程中开始频繁出现超时和随机崩溃。日志显示 Flask 服务器运行速度变慢，超时事件层层叠加，但始终找不到根本原因。我请 Claude Code 帮忙查看；它检查了代码、配置和日志，但一无所获。代码根本没有改动。以前运行正常的功能现在却失效了。

Turns out the [Vast.ai](https://vast.ai/) machine simply didn't have enough CPU cores for the concurrency load. On Slurm this was never an issue because Slurm silently allocates generous CPU resources when you submit a job, totally invisible to the user.原来是 [Vast.ai](https://vast.ai/) 这台机器的 CPU 核心数不足以应对并发负载。但在 Slurm 上，这从来都不是问题，因为 Slurm 会在你提交作业时自动分配大量的 CPU 资源，用户完全察觉不到。

The hard part about this kind of bug is that you know something's wrong, but the answer isn't in the code or the logs. You have to go check the machine's resource allocation yourself. That's not something a code tool can do for you.这类 bug 的难点在于，你知道肯定出了问题，但答案却不在代码或日志里。你必须自己去检查机器的资源分配情况。这不是代码工具能帮你做的。

## TL;DR太长不看

Plotting, code migration, proof formatting: all went smoothly because the goals were clear and the workflows were reusable. The debugging didn't, because the problem lived outside the codebase. If you're doing research: find the task types where it fits, build repeatable workflows around them, and don't expect it to debug your infra.绘图、代码迁移、证明格式化：一切都很顺利，因为目标明确，工作流程可复用。调试却遇到了麻烦，因为问题出在代码库之外。如果你在做研究：找到合适的任务类型，围绕它们构建可重复的工作流程，不要指望它能帮你调试基础设施。