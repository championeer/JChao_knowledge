---
title: "The Agent Research Loop代理研究循环"
source: "https://x.com/hamostaf04/status/2033305681395392932"
author:
  - "[[Unknown]]"
published: 2026-03-16
created: 2026-03-16
description:
tags:
  - "clippings"
---
**TL;DR:** Karpathy's autoresearch is more important than people realize. Not because of the results, but because of the pattern. A tight loop with structured feedback turns a coding agent into an autonomous researcher. I think this pattern generalizes far beyond ML training, and I think it changes what humans actually do in technical work. My friend [@DennwsLee](https://x.com/@DennwsLee) and I built an open-source harness to test this. 550+ experiments across four tasks over a weekend, zero babysitting.**简而言之：** Karpathy 的自动研究比人们意识到的更重要。这并非因为结果，而是因为其模式。一个带有结构化反馈的紧密循环可以将编码代理转变为自主研究员。我认为这种模式的适用范围远远超出机器学习训练，而且我认为它会改变人类在技术工作中的实际行为。我的朋友 [@DennwsLee](https://x.com/@DennwsLee) 我搭建了一个开源框架来测试这个。周末两天，在四个任务上进行了 550 多次实验，全程无人值守。

## Autoresearch Is Bigger Than Pre-Training自动研究比预训练更重要

When Karpathy released [autoresearch](https://github.com/karpathy/autoresearch) earlier this month, a lot of the coverage focused on the results. 126 experiments overnight. 20 additive improvements. 11% speedup on Time-to-GPT-2.Karpathy 发行时[自动研究](https://github.com/karpathy/autoresearch)本月初，很多报道都集中在结果上。一夜之间进行了 126 次实验。新增了 20 项改进。GPT-2 测试速度提升了 11%。

Those are good numbers. But I think people are missing the more important thing: the pattern.这些数据不错。但我认为人们忽略了更重要的一点：那就是其中的规律。

One GPU, one file, one metric. The agent reads the training script, forms a hypothesis, modifies the code, runs the experiment for exactly 5 minutes, checks if the result improved, keeps or discards, and repeats. Git is the memory. The fixed time budget makes comparison fair. One change at a time so you know what caused the effect.一个 GPU，一个文件，一个指标。智能体读取训练脚本，形成假设，修改代码，运行实验 5 分钟，检查结果是否有所改进，保留或舍弃，然后重复此过程。Git 充当内存。固定的时间预算确保了比较的公平性。每次只进行一项更改，以便了解究竟是什么导致了效果。

This isn't a pre-training trick. This is the scientific method compressed into a loop that an agent can execute indefinitely. And there's nothing about it that's specific to training neural networks.这并非预训练技巧。这只是将科学方法压缩成一个循环，智能体可以无限期地执行该循环。而且，它与训练神经网络并无特殊之处。

## Why the Loop Works为什么循环有效

A month ago I wrote about [letting AI agents train models](https://hamzamostafa.com/blog/agents-training-their-own-models). My conclusion was that agents could execute training pipelines but couldn't do ML research. Training is execution. Research is judgment.一个月前我写过关于[让 AI 代理训练模型](https://hamzamostafa.com/blog/agents-training-their-own-models)我的结论是，智能体可以执行训练流程，但不能进行机器学习研究。训练是执行，研究是判断。

What I've come to understand since then is that the problem wasn't missing judgment. It was missing structure. When I gave agents open-ended freedom, they made bad decisions: changing reward functions mid-training, ignoring broken learning rate schedulers, starting from scratch every session with no memory of what worked. But those are the same mistakes a junior researcher makes when they don't have a protocol.我后来逐渐明白，问题不在于缺乏判断力，而在于缺乏结构。当我赋予智能体完全的自由时，它们会做出错误的决定：在训练过程中随意更改奖励函数，无视失效的学习率调度器，每次都从头开始，完全不记得哪些方法有效。但这些错误，正是初级研究人员在没有既定流程时常犯的。

Autoresearch is a protocol. And it works because it forces two things:自动研究是一种协议。它之所以有效，是因为它强制执行两件事：

**Discipline.** One change at a time. Hypothesis before experiment. Confirm or refute after. This sounds obvious, but agents without this structure will change three things at once, get a result, and have no idea what mattered. The constraint is what makes the exploration useful.**纪律。** 一次只做一项改变。先提出假设，再进行实验。实验后验证或推翻假设。这听起来显而易见，但缺乏这种结构的行动者会同时改变三件事，得到一个结果，却根本不知道什么才是真正重要的。正是这种约束使得探索变得有意义。

**Memory.** The git history is a lab notebook. The agent can see what it already tried, what worked, what didn't. Without this, agents repeat themselves endlessly. With it, they build on their own results.**记忆。Git** 历史记录就像一本实验记录本。智能体可以查看它已经尝试过什么，哪些成功了，哪些失败了。如果没有它，智能体就会无休止地重复操作。有了它，它们就能在自身结果的基础上不断进步。

The deeper insight is about the balance between freedom and constraint. You need to give agents real space to explore. Their stochastic nature is a feature, not a bug. They'll try things a human wouldn't think to try, and some of those end up being genuine findings. But you need walls too. Without guardrails, agents go off the rails. Too much freedom is just as bad as too little.更深层次的洞察在于自由与约束之间的平衡。你需要给予智能体真正的探索空间。它们的随机性是一种特性，而非缺陷。它们会尝试人类想不到的事情，其中​​一些最终会成为真正的发现。但你也需要界限。如果没有护栏，智能体就会偏离轨道。过多的自由和过少的自由一样糟糕。

The right model: **human sets direction and constraints, agent does exhaustive exploration within those bounds.** The human brings taste. Which problems are worth solving, which metrics matter, what "good" looks like. The agent brings tirelessness. Trying every combination, running every ablation, waiting patiently through the flat periods that a human would quit on.理想的模型： **人类设定方向和约束，智能体在这些范围内进行详尽的探索。** 人类带来品味。哪些问题值得解决，哪些指标重要，以及“好”的标准是什么。智能体带来不知疲倦。尝试每一种组合，运行每一次消融实验，耐心等待人类早已放弃的平缓时期。

## What Changes for Humans对人类而言，哪些变化？

There's a question lurking in all of this: if agents can run 550 experiments over a weekend, what do humans actually do?这一切背后隐藏着一个问题：如果智能体可以在一个周末内运行 550 个实验，那么人类实际会做什么呢？

I think the answer is that human decisions get more important, not less. When the cost of running an experiment drops to near-zero, the bottleneck shifts entirely to the decisions that happen before the loop starts. Which task? Which model? Which metric? What levers can the agent pull? What's the feedback loop?我认为答案是，人的决策变得越来越重要，而不是越来越不重要。当运行实验的成本降至接近于零时，瓶颈完全转移到循环开始之前的决策上。执行哪个任务？使用哪个模型？采用哪个指标？智能体可以采取哪些措施？反馈回路是什么？

These are strategic decisions. They're the difference between an agent that discovers something useful and an agent that burns compute on a dead end. And they're the kind of decisions that require context, taste, and judgment about what matters. Exactly the things agents are still developing.这些都是战略决策。它们决定了智能体是能发现有用的东西，还是会白白浪费计算资源在死胡同里。这类决策需要结合具体情况、个人喜好以及对重要事项的判断。而这些恰恰是智能体仍在发展的能力。

The other thing that changes is time. Agents don't have a clock. They don't context-switch, they don't get tired, they don't have meetings. An agent told "never stop" will run experiment 88 at 3 AM with the same rigor as experiment 1. It'll wait through 100 flat training steps for a phase transition that a human would've given up on. The grunt work that separates a good result from a great one (the 50th hyperparameter sweep, the careful ablation, the 12th self-distillation round) is exactly what agents are built for.另一个改变的是时间。智能体没有时钟。它们不会切换上下文，不会感到疲倦，也不会开会。一个被告知“永不停歇”的智能体，会在凌晨3点以与实验1相同的严谨程度运行实验88。它会耐心等待100个平缓的训练步骤，直到出现人类早已放弃的相变。那些将优秀结果与卓越结果区分开来的繁琐工作（例如第50次超参数扫描、细致的消融、第12轮自我提炼），正是智能体存在的意义所在。

This is already happening, but I think it becomes mainstream quickly. Right now it's ML researchers running agent loops. Soon it'll be performance engineers, security auditors, data engineers, anyone who iterates against a metric. The lines between "human work" and "agent work" will keep blurring, and I think that's OK as long as we're honest about where the boundaries are.这种情况已经出现了，但我认为它会很快成为主流。目前，机器学习研究人员正在运行智能体循环。很快，性能工程师、安全审计员、数据工程师，以及任何需要根据指标进行迭代的人员都会用到它。“人类工作”和“智能体工作”之间的界限将越来越模糊，我认为只要我们对界限的界定保持诚实，这并没有什么问题。

## Where This Goes这将走向何方

I see two flavors of agent loop emerging.我看到两种类型的代理循环正在出现。

The first is **closed-loop optimization**, where there's a defined end state and the agent searches for it. [AlphaEvolve](https://deepmind.google/discover/blog/alphaevolve-a-gemini-powered-coding-agent-for-designing-advanced-algorithms/) and [OpenEvolve](https://github.com/codelion/openevolve) are examples. You have a benchmark, the agent evolves solutions toward it, and eventually you converge or hit a ceiling.第一种是**闭环优化** ，其中有一个明确的最终状态，智能体会朝着这个状态进行搜索。 [AlphaEvolve](https://deepmind.google/discover/blog/alphaevolve-a-gemini-powered-coding-agent-for-designing-advanced-algorithms/) 和 [OpenEvolve](https://github.com/codelion/openevolve) 这些都是例子。你设定一个基准，智能体朝着这个基准演化解决方案，最终你会收敛或达到上限。

The second is **open-ended research**, where there's a metric to improve but no finish line. Autoresearch is the prototype. The agent just keeps going, and the human decides when to stop and what to do with the findings.第二种是**开放式研究** ，它有一个需要改进的指标，但没有终点。自动研究就是这种研究的原型。智能体会持续运行，而人类则决定何时停止以及如何利用研究结果。

Both are useful. Both will get more popular. And both need some kind of structured interface for the human to specify what the agent should do.两者都很有用，都会越来越受欢迎，而且都需要某种结构化的界面，供用户指定智能体应该执行的操作。

Right now that interface is a prompt, or a CLAUDE.md, or an AGENTS.md. Those work for conversational tasks. But for long-running autonomous loops, you need something different. Something that specifies the metric, the levers, the feedback loop, and the constraints.目前，这个界面要么是提示信息，要么是 CLAUDE.md 文件，要么是 AGENTS.md 文件。这些适用于对话式任务。但对于长时间运行的自主循环，你需要不同的东西。你需要一种能够明确定义指标、控制机制、反馈回路和约束条件的东西。

Karpathy's autoresearch uses a program.md. We used the same pattern. I think something like this, a structured document that programs an agent session rather than prompting a conversation, becomes a standard primitive. Not a conversation starter. A research specification.Karpathy 的自动研究使用了一个 program.md 文件。我们也采用了相同的模式。我认为像这样的结构化文档——它用于设置代理会话，而不是引导对话——会成为一种标准的基本功能。它不是对话的引子，而是研究规范。

Maybe this gets baked into agent harnesses directly. A "research mode" in Claude Code or Codex or Cursor or Windsurf where you define a program and it loops. Maybe it stays a file convention, like how CLAUDE.md emerged organically. Either way, I think the programmatized agent loop becomes a normal part of how software gets built and improved.或许这会直接集成到代理框架中。比如在 Claude Code、Codex、Cursor 或 Windsurf 中设置一个“研究模式”，允许你定义一个程序并使其循环运行。也可能它会保留为一种文件规范，就像 CLAUDE.md 那样自然而然地出现。无论如何，我认为程序化的代理循环会成为软件构建和改进过程中不可或缺的一部分。

## What We Built我们打造了什么

To test whether the autoresearch pattern generalizes beyond pre-training, we built an open-source harness over the past week called [PraxLab](https://github.com/Hamza-Mos/praxlab).为了测试自动研究模式是否能在预训练之外进行泛化，我们在过去一周构建了一个名为 的开源工具箱。 [PraxLab](https://github.com/Hamza-Mos/praxlab) 。

The idea: a tree of self-contained workspaces. Each leaf has its own program.md (agent instructions), mutable training scripts, and experiment tracking. You pick a leaf, edit Section 1 with your task, and spin up your favourite coding agent with the prompt: "Read program.md and begin the loop!" The agent creates a git worktree and starts running experiments.其理念是：构建一个由独立工作区组成的树状结构。每个叶子节点都有自己的 program.md 文件（智能体指令）、可变的训练脚本和实验跟踪功能。你选择一个叶子节点，编辑第一部分来添加你的任务，然后输入提示“读取 program.md 文件并开始循环！”来启动你最喜欢的编码智能体。智能体会创建一个 Git 工作树并开始运行实验。

![图像](https://pbs.twimg.com/media/HDeuajRbgAA01et?format=png&name=large)

The lab CLI is the structured memory layer. 5 commands, SQLite, zero dependencies. Before each experiment the agent runs 'lab context' and 'lab failures'. After each experiment it logs a result with flag confirming or refuting the mechanism. This is what turns random search into research. The agent has to say why before and what it learned after.实验室命令行界面 (CLI) 是结构化内存层。它包含 5 个命令，使用 SQLite，且没有任何依赖项。每次实验前，智能体都会运行“实验室上下文”和“实验室失败”命令。每次实验后，它会记录一个结果，并用标志来确认或否定该机制。正是这一点将随机搜索转化为研究。智能体必须说明实验前的原因以及实验后学到了什么 。

We configured four leaves, started four Claude Code instances, and let them run for 48+ hours over the weekend. 550+ experiments total, zero intervention. Some highlights:我们配置了四个叶节点，启动了四个 Claude Code 实例，并让它们在周末运行了 48 小时以上。总共进行了 550 多次实验，期间无人干预。以下是一些亮点：

- **RL**: 93% on MATH level 4-5 from pure binary reward. Reasoning emerged from scratch. The agent discovered a MAX\_TOKENS scaling law on its own.**强化学习** ：数学难度 4-5 级，仅凭二元奖励就达到了 93% 的正确率。推理能力完全从零开始发展。智能体自主发现了 MAX\_TOKENS 缩放规律。
- **SFT**: Self-distillation hit 93-95% majority vote, matching RL at half the cost. The agent found that training roughness (higher LR) preserves output diversity for majority voting.**SFT** ：自蒸馏算法以一半的成本达到了 93-95%的多数投票率，与强化学习算法（RL）的水平相当。该智能体发现，训练粗糙度（更高的学习率）能够保持多数投票的输出多样性。
- **Tool routing** (Prime Intellect): 0.76→0.94 on 6-tool routing. Phase transitions at steps 50-100, difficulty filtering as the key lever.**刀具路径规划** （Prime Intellect）：6 刀路径规划的精度为 0.76→0.94。在第 50-100 步出现阶段性转变，过滤困难是关键因素。
- **Prompt co-evolution** (GEPA): 0.75→0.94 over four generations. System prompt and evaluation rubric evolving simultaneously.**提示协同演化** （GEPA）：四代后从 0.75 提升至 0.94。系统提示和评估标准同步演化。

The experiment branch has the full history. Every commit, every hypothesis, every result. The notes.md in each leaf reads like a lab notebook.实验分支包含了完整的历史记录，包括每一次提交、每一个假设和每一个结果。每个叶子节点下的 notes.md 文件就像一本实验记录本。

## Try It, Extend It试试看，延长使用时间

The repo: [github.com/Hamza-Mos/praxlab](https://github.com/Hamza-Mos/praxlab)存储库： [github.com/Hamza-Mos/praxlab](https://github.com/Hamza-Mos/praxlab)

Clone it, edit Section 1 of a program.md, spin up your favourite coding agent. But more than that, I'd love to see what happens when people add their own leaves. The tree structure means anyone can contribute a new workspace for their framework or task. Some starting ideas: RL with [OpenRLHF](https://github.com/OpenRLHF/OpenRLHF) or [SkyRL](https://github.com/NovaSky-AI/SkyRL), training with [veRL](https://github.com/volcengine/verl) or [TRL](https://github.com/huggingface/trl), fine-tuning with [Unsloth](https://github.com/unslothai/unsloth). Each one is just a new leaf with a program.md and a training script. But all ideas and collaborations are welcome.克隆它，编辑 program.md 文件的第一部分，启动你最喜欢的编码代理。但更重要的是，我很想看看当人们添加自己的“叶子节点”时会发生什么。树状结构意味着任何人都可以为他们的框架或任务贡献新的工作区。一些初步想法：强化学习 [OpenRLHF](https://github.com/OpenRLHF/OpenRLHF) 或者[天空 RL](https://github.com/NovaSky-AI/SkyRL) 接受培训 [veRL](https://github.com/volcengine/verl) 或者 [TRL](https://github.com/huggingface/trl) ，进行微调 [Unsloth](https://github.com/unslothai/unsloth) 每个程序都像一片新叶子，附带一个 program.md 文件和一个训练脚本。我们欢迎所有想法和合作。

If you build a leaf, open a PR. Let's grow this together into a hub for autonomous research on anything.如果你创建了一个叶节点，请提交一个 PR。让我们共同努力，把它发展成为一个涵盖所有主题的自主研究中心。