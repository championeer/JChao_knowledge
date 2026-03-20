---
title: "OpenClaw RL, explained clearlyOpenClaw 强化学习，解释得很清楚"
source: "https://x.com/neural_avb/status/2032489770648256956"
author:
  - "[[Unknown]]"
published: 2026-02-19
created: 2026-03-14
description: "#TruthSeeker #INTJ #AIxEverything事上磨练，道在行中"
tags:
  - "clippings"
---
The premise of this new research paper is actually very simple. **What if your AI agent got smarter every time you talk to it?** To test this, they designed a very practical experiment:这篇新研究论文的前提其实很简单。 **如果你的 AI 智能体每次与你对话都变得更聪明，会怎么样？** 为了验证这一点，他们设计了一个非常实际的实验：

> A student uses Openclaw and he wants his LLM to complete homework on a personal computer, **while trying to avoid being perceived as relying on AI**. 一名学生使用 Openclaw，他希望他的法学硕士能够在个人电脑上完成作业， **同时又想避免被认为依赖人工智能** 。

> Basically, the student **does not want to be found using AI,** and wants the AI to copy the student's **personal preferences and writing style.**基本上，这名学生**不希望被人工智能找到，** 并且希望人工智能能够模仿学生的**个人喜好和写作风格。**

> The archaic way of solving this problem would be doing supervised finetuning on the student's own written notes解决这个问题的古老方法是在老师的指导下，对学生自己写下的笔记进行微调。

> The even more archaic thing would be to write long prompts to teach the model rules of writing like this student.更古老的做法是写很长的写作提示来教授像这位学生一样的写作规范。

> **But we are in 2026 so we are going to learn how to do this in a way cooler way - OpenClaw RL.但现在是 2026 年，我们将学习如何以一种更酷的方式来做这件事——OpenClaw RL。**

But first, let's start with some terminologies to set the record straight for the rest of this article. 但首先，让我们从一些术语入手，为本文的其余部分厘清概念。

![图像](https://pbs.twimg.com/media/HDTWOaeaYAAwSaU?format=jpg&name=large)

# Background背景

1. **What is RL?什么是 RL？**

> RL is a Machine Learning framework where an **agent** learns to make better **decisions** by interacting with an **environment**. 强化学习（RL）是一种机器学习框架，其中**智能体**通过与**环境**交互来学习做出更好的**决策** 。

> It observes a state, takes a decision, receives feedback from the environment about how favourable it's action were, and then it slowly improves it's decision making abilities (policy).它观察一种状态，做出决定，从环境中获得关于其行动有多有利的反馈，然后慢慢提高其决策能力（政策）。

**2\. What is Policy Distillation?2. 什么是政策提炼？**

While RL trains LLMs by making it take actions and collect experiences in an environment, policy distillation takes a different approach.强化学习通过让学习逻辑模型在环境中采取行动和收集经验来训练学习逻辑模型，而策略蒸馏则采用了不同的方法。

> Policy Distillation comes from the broader concept of **Knowledge Distillation** in deep learning.策略蒸馏源于深度学习中更广泛的**知识蒸馏**概念 。

> We transfer knowledge from a more **capable teacher model** into a **smaller, faster student model** - without the student having to learn from scratch.我们将知识从**能力更强的教师模式**转移到规模**更小、速度更快的学生模式**中 ——学生无需从零开始学习。

In other words, we take a model that is more capable (either a larger model, or a model that has more information) and distill it's behavior into a smaller, less capable model.换句话说，我们采用一个功能更强大的模型（要么是更大的模型，要么是拥有更多信息的模型），并将其行为提炼到一个更小、功能更弱的模型中。

We will soon see how OpenClaw-RL uses this concept. 我们很快就能看到 OpenClaw-RL 如何运用这一概念。

**3\. RLVR vs RLRF 3. RLVR 与 RLRF 的比较**

> **RLVR (RL with Verifiable Rewards)** is RL applied to tasks where the reward signal is **verifiable**. Meaning there is a simple deterministic way to verify if a task was successful or not. Example: math problems (is the answer correct?) or code (does the test pass?). These require no human annotation, so you can pretty much automate these rewards.**RLVR（可验证奖励强化学习）** 是指将强化学习应用于奖励信号**可验证的**任务 。这意味着存在一种简单确定的方法来验证任务是否成功。例如：数学题（答案是否正确？）或代码（测试是否通过？）。这些任务不需要人工标注，因此几乎可以实现奖励的自动化。

> There is one more term you should know about - **RLRF (RL with Rich Feedback)**. RLRF design provides richer feedback compared (ex: stack trace of generated code, or just feedback from an LLM judge) compared to just a scalar reward. This rich feedback can be used to train LLM models to generate better rollouts.还有一个术语你也应该了解 **——RLRF（RL with Rich Feedback，强化学习与丰富反馈）** 。与仅提供标量奖励相比，RLRF 设计提供更丰富的反馈（例如：生成代码的堆栈跟踪，或来自 LLM 评测员的反馈）。这种丰富的反馈可用于训练 LLM 模型，从而生成更好的部署结果。

**4\. Process Reward Models (PRMs)4. 过程奖励模型（PRM）**

RLVR gives feedback at the very end of a trajectory (a sequence of action that lead to a success/failure state). Traditionally this has led to some scary situations in RL training history resulting in people quitting their research careers at a young age. Google: "credit assignment in RL" and "sparse reward environments in RL" ... you'll get the gist.RLVR（强化学习算法的反馈机制）会在训练轨迹（一系列导致成功/失败状态的动作）的最后阶段提供反馈。传统上，这在强化学习的训练史上曾导致一些令人担忧的情况，甚至让一些研究人员在很年轻的时候就放弃了他们的研究生涯。你可以搜索一下“强化学习中的奖励分配”和“强化学习中的稀疏奖励环境”，就能明白我的意思了。

> A **PRM** provides **step-level** feedback rather than outcome-level feedback. Instead of waiting until the end, it scores each intermediate step atat​ of the agent's reasoning chain.PRM 提供的是**步骤级**反馈，而不是结果级反馈。它不会等到最后才进行反馈，而是在智能体推理链的每个中间步骤**进行**评分 。

Originally studied in **mathematical reasoning**, PRMs have been shown to dramatically outperform outcome-only rewards in long-horizon tasks. PRM 最初是在**数学推理**中进行研究的 ，研究表明，在长期任务中，PRM 的表现远胜于仅以结果为导向的奖励。

OpenClaw-RL extends this idea to the **online, live, continual setting -** where process rewards are inferred from live next-state signals rather than pre-collected ground truth. OpenClaw-RL 将这一理念扩展到**在线、实时、连续的设置中——** 其中过程奖励是从实时的下一个状态信号推断出来的，而不是从预先收集的真实状态推断出来的。

**5\. States and Next State-Signal5. 状态和下一状态信号**

This is the most central Openclaw-RL concept you must grasp. After every action a​, the environment responds with a **next-state signal** st+1​. Think of it as the "reaction" to what the agent just did **0**:这是你必须掌握的 Openclaw-RL 最核心的概念。每次执行动作 a 后 ，环境都会以下一个**状态信号** st+1 来响应。你可以把它理解为智能体对刚刚执行的动作 **0 的** “反应” ：

- A **user reply** after a chatbot response (are they thankful or pissed off?)用户在收到聊天机器人回复后**的反应** （他们是感激还是生气？）
- A **terminal output** after a shell command (did it work? did it cause error?)执行 shell 命令后的**终端输出** （ 命令是否生效？是否出现错误？）
- A **test output** after code is submitted (did it compile? did it cause error?)提交代码后的测试输出（是否编译通过？是否出现错误 ？ **）**

> This next-state signal is **implicit feedback**. It tells you both how well the action performed and, often, how it should have been different.这种下一状态信号是**一种隐式反馈** 。它既能告诉你动作执行得如何 ，而且通常还能告诉你动作本应如何改进 。

It is kind of a "rich-text" feedback. The Agent can infer both the reward and the next state from paying attention to this. 这是一种“富文本”反馈。智能体可以通过关注这种反馈来推断奖励和下一个状态。

**6\. Two Types of RL Supervision6. 两种类型的强化学习监督**

This is another crucial thing for understanding what makes OpenClaw-RL different:这是理解 OpenClaw-RL 与众不同之处的另一个关键点：

**Evaluative Signals → Scalar Rewards评价信号 → 标量奖励**

> A signal that **scores** the action. Did it work? How well? This is the traditional form of RL supervision - a scalar reward or a boolean flag that says "good" or "bad."对动作**进行评分**的信号 。动作是否有效？效果如何？这是传统的强化学习监督形式——标量奖励或布尔标志，表示“好”或“坏”。

**Directive Signals → Token-Level Guidance指令信号 → 令牌级指导**

> A signal that **directs** the action. Tells it exactlywhat should have been different and how. For example: "You should have checked the file first" tells the agent exactly which tokens to reconsider一个**指导**行动的信号 。它准确地告诉代理应该做出哪些改变以及如何改变 。例如： “你应该先检查一下文件” 会准确地告诉代理应该重新考虑哪些标记。

You can read more about token level guidance in some cool papers that came out this year like您可以阅读今年发表的一些很棒的论文，了解更多关于代币级别指导的信息，例如

[Experiential Reinforcement Learning体验式强化学习](https://x.com/neural_avb/status/2024874677609660831?s=20)

and和

[SDPO (Self-Distillation via Policy Optimization)SDPO（通过策略优化实现自蒸馏）](https://x.com/neural_avb/status/2021216205684781094?s=20)

# The Goal目标

> OpenClaw-RL aims to show that **every agent interaction naturally produces a "next-state signal"** (a user reply, tool output, or screen state change) that can be used as a live training source. OpenClaw-RL 旨在表明， **每个智能体交互都会自然地产生一个“下一个状态信号”** （用户回复、工具输出或屏幕状态变化），该信号可用作实时训练源。

The framework unifies these signals across diverse settings - personal conversations, terminal, GUI, SWE, and tool-call, to train a **single policy continuously and online**, without any separate data collection phase.该框架统一了来自不同环境（个人对话、终端、GUI、SWE 和工具调用）的这些信号，以**持续在线地训练单一策略** ，而无需任何单独的数据收集阶段。

> It's a recipe for lifelong learning through experience collection.这是通过经验积累实现终身学习的秘诀。

![图像](https://pbs.twimg.com/media/HDTWUYmasAAZUCV?format=jpg&name=large)

## The Main Observation: You're Already Collecting the Data!

Here is the insight the paper opens with:

> "Every deployed AI agent is already collecting the data it needs to improve - and discarding it." “每个已部署的人工智能代理都已在收集改进所需的数据，然后将其丢弃。”

Every single time an agent takes an action a​, the environment fires back a **next-state signal** s'​. Like I mentioned in point 2 in my epic terminology section: this could be a user's reply, a terminal error trace, a test result. Most systems treat this signal as nothing more than **context for the next action.**每次智能体执行动作 a 时，环境都会返回一个**下一状态信号** s'。正如我在术语表第二点中提到的：这可以是用户的回复、终端错误跟踪或测试结果。大多数系统将此信号视为下**一个动作的上下文信息。**

Meaning the AI simply takes the "next step" decision based off of this latest context, without realizing it can also learn from it.这意味着人工智能只是根据最新的上下文做出“下一步”的决定，而没有意识到它也可以从中学习。

The paper's boldest claim is the following:

> Personal conversations, terminal executions, GUI interactions, SWE tasks, and tool-call traces are not separate training problems. They are all interactions that generate next-state signals, and a single policy can learn from all of them simultaneously.

OpenClaw-RL's core claim is that this is a "**massive WASTE"**, and it identifies exactly **two forms of recoverable information** sitting inside every next state signal​:OpenClaw-RL 的核心论点是，这是一种“ **巨大的浪费”** ，它指出每个下一个状态信号中都包含**两种可恢复的信息** ：

**Waste 1: Evaluative Signals (The "****How Good?****" Signal)****浪费 1：评价信号（“** **好不好？** **”信号）**

The next-state signal **implicitly scores** the preceding action:下一个状态信号隐含地对前一个动作**进行评分** ：

- A **user re-query** (e.g., "That's not what I meant") → dissatisfaction signal用户**重新询问** （例如， “我不是那个意思” ）→ 不满信号
- A **passing test** → success signal通过**测试** → 成功信号
- An **error trace** → failure signal错误**跟踪** → 故障信号

This is a **natural process reward.** It arises for **free** at every step, requires **zero annotation**, and provides the dense per-step credit assignment that long-horizon tasks desperately need. Yet existing systems either ignore it entirely or only exploit it in **offline, pre-collected form** - after the fact, on fixed datasets. 这是一种**自然的过程奖励。** 它在每一步都会**自动**产生，无需**任何标注** ，并能提供长期任务迫切需要的密集型每步奖励分配。然而，现有系统要么完全忽略它，要么仅仅在**离线、预先收集的情况下** ——事后在固定数据集上——利用它。

**Waste 2: Directive Signals (The "****How to Fix It?****" Signal)****废物 2：指令信号（“** **如何修复？** **”信号）**

Beyond scoring, next-state signals often carry **directional information.** I.e. how the action should have been different:除了得分之外，下一状态信号通常还包含**方向性信息，** 例如， 原本应该采取的行动应该如何不同：

- A user saying "you should have checked the file first" specifies the **exact correction direction** at the token level用户说 “你应该先检查一下文件”， 这在词法层面上明确指出了**具体的纠正方向。**
- A detailed SWE error trace **implies a concrete fix**详细的软件工程错误跟踪**表明存在具体的修复方案。**

Current RLVR methods compress everything into a **scalar reward**, which throws this rich directional information away entirely. OpenClaw-RL recovers it through a mechanism called "**Hindsight-Guided OPD"** (oooooo we'll cover in a later section).当前的 RLVR 方法将所有内容压缩成**标量奖励** ，完全丢弃了丰富的方向信息。OpenClaw-RL 通过一种称为“ **后见之明引导的 OPD”** （我们将在后面的章节中介绍）的机制来恢复这些信息。

**The Unifying Framework: One Policy, All Streams** Let's look at this more closely.统一框架：一项政策，所有流 让我们仔细看看。

## The Architecture: A Four-Engine Machine

![图像](https://pbs.twimg.com/media/HDTWC2SakAEiW63?format=jpg&name=large)

At the heart of OpenClaw-RL is one radical architectural principle: **break everything apart**. Complete decoupling. Trad RL training are tightly coupled: the model waits for an environment response, the environment waits for a reward, the reward waits for the trainer. Every component blocks the next. This slows down real-world agents that need to keep serving live users.OpenClaw-RL 的核心是一个激进的架构原则： **将一切拆解开来** 。完全解耦。 传统强化学习训练机制紧密耦合：模型等待环境响应，环境等待奖励，奖励等待训练器。每个组件都会阻塞下一个组件的运行。这会降低需要持续服务实时用户的实际应用场景的运行速度。

OpenClaw-RL's answer? **Four completely independent, asynchronous loops** - none that blocks the other.OpenClaw-RL 的解决方案是什么？ **四个完全独立、异步的循环** ——彼此之间互不阻塞。

The four decoupled, asynchronous components ("engines") of OpenClaw-RL are:

1. **Environment Server :** Hosts the agent's environment (user devices for personal agents, cloud services for general agents). It collects interaction samples and feeds them into the training pipeline.**环境服务器：** 托管代理的环境（个人代理使用用户设备，通用代理使用云服务）。它收集交互样本并将其输入到训练流程中。
2. **PRM / Judge:** Evaluates the quality of each action by computing rewards from the next-state signal. It runs independently, judging previous responses while the model is already serving new ones.**PRM/评判器：** 通过计算下一状态信号的奖励来评估每个动作的质量。它独立运行，在模型处理新动作的同时，评判之前的响应。
3. **Megatron (Policy Trainer):** Applies gradient updates to the policy using the rewards computed by the PRM. Built on the Megatron framework for large-scale training. Megatron-LM is a high-performance library for training very large language models by the good folks at Nvidia. It is designed to handle the massive computational demands through several parallelism strategies like tensor parallelism, pipeline parallelism, data parallelism.**Megatron（策略训练器）：** 使用 PRM 计算出的奖励对策略应用梯度更新。它基于 Megatron 框架构建，用于大规模训练。Megatron-LM 是由 Nvidia 开发的高性能库，用于训练超大型语言模型。它通过多种并行策略（例如张量并行、流水线并行和数据并行）来应对巨大的计算需求。
4. **SGLang (Policy Server):** Serves the live policy to users, handling inference requests. It supports **graceful weight updates**, meaning the policy can be updated without interrupting ongoing inference.**SGLang（策略服务器）：** 向用户提供实时策略，处理推理请求。它支持**优雅的权重更新** ，这意味着可以在不中断正在进行的推理的情况下更新策略。

The key insight is that **none of these four components waits for the others** they all run asynchronously, which is what makes continuous, online learning from live interactions practical.关键在于， **这四个组成部分彼此之间互不等待** ，它们都是异步运行的，这使得通过实时互动进行持续的在线学习成为可能。

These four engines spin simultaneously, **with zero blocking dependencies between them**.这四个引擎同时运转， **彼此之间没有任何阻塞依赖关系** 。

**How Data Flows Through the System**

1. A user (or environment) sends a message → the **SGLang Policy Server** generates a response in real-time.用户（或环境）发送消息 → **SGLang 策略服务器**实时生成响应。
2. The response lands in the environment (a user's device, a terminal, a GUI) → the **Environment Server** captures the next-state signal (user reply, terminal output, GUI change).响应到达环境（用户的设备、终端、GUI）→ **环境服务器**捕获下一个状态信号（用户回复、终端输出、GUI 更改）。
3. That interaction is logged asynchronously → the **PRM Judge** scores the quality of the action.该交互以异步方式记录 → **PRM 裁判**对操作质量进行评分。
4. Scored trajectories accumulate in a replay buffer → the **Megatron Trainer** pulls batches and updates the policy weights.评分轨迹累积在回放缓冲区中 → **Megatron Trainer** 拉取批次并更新策略权重。
5. Updated weights are **gracefully pushed** back to the serving layer without interrupting live inference.更新后的权重会**优雅地推**送回服务层，而不会中断实时推理。

Many RL projects are switching to exactly this kind of system design including the GLM-5 and Minimax training stack.

> 2月19日
> 
> LLM research in 2026 is basically all about 3 things: - scaling Asynchronous RL at a system design level - harnesses/recipes to train independent (clawdbot style) agentic systems - make low-level architectural choices that achieve this cheaply2026 年的 LLM 研究主要围绕以下三件事展开： - 在系统设计层面扩展异步强化学习 - 用于训练独立（爪形机器人式）智能体的工具/方法 - 做出能够以低成本实现此目标的底层架构选择

In the next section let's talk about how the actual RL stuff happens in more detail.

# The PRM Judge

**PRM** stands for **Process Reward Model**. Unlike a standard outcome reward model that only tells you "did you succeed at the end?", a PRM assigns a **reward at every step** of the agent's trajectory providing much richer training signal. **PRM** 代表**过程奖励模型** 。与仅告诉你 “你最终是否成功？” 的标准结果奖励模型不同 ，PRM 会在智能体轨迹的**每一步都分配奖励，** 从而提供更丰富的训练信号。

![图像](https://pbs.twimg.com/media/HDTWwVIa0AAaCWL?format=jpg&name=large)

In OpenClaw-RL, the PRM Judge is an **LLM-based evaluator** that looks at:在 OpenClaw-RL 中，PRM 评测器是一个**基于 LLM 的评估器** ，它会考察以下方面：

- The agent's action a​ (at a step t)
- The **next state** s\`​ (the user reply, tool output, terminal state, etc.)下一个**状态** s\`​（用户回复、工具输出、终端状态等）
- And outputs a scalar reward score: **R** (usually +1, 0, -1)并输出一个标量奖励分数： **R** （通常为 +1、0、-1）
- They run this multiple times prompts and take the **majority vote reward** as the final.他们会多次运行此提示，并将**多数票奖励**作为最终结果。

Problem with scalar reward for whole sequence is that it pushes **all tokens** in the response in the same direction. If the response was bad (r=−1), every single token gets penalized equally, even the tokens that were actually fine对整个序列应用标量奖励的问题在于，它会将响应中的**所有标记都**推向同一方向。如果响应很差（r=-1），那么每个标记都会受到相同的惩罚，即使是那些实际上表现良好的标记也不例外。

# Hindsight-Guided On-Policy Distillation (OPD) 事后指导的政策提炼（OPD）

Along with PRM Judge, we also use rich reward text feedback to do training.除了 PRM Judge 之外，我们还使用丰富的奖励文本反馈来进行训练。

The basic gist of OPD is simple:

> If you augment the original prompt with a **textual hint** extracted from the next state s'​, the same model will produce a **different token distribution** - one that "knows" what the response should have been.如果在原始提示中添加从下一个状态 s' 中提取的**文本提示** ，则同一模型将产生**不同的标记分布** ——一个“知道”响应应该是什么的标记分布。

![图像](https://pbs.twimg.com/media/HDTW0AFacAEjtBr?format=jpg&name=large)

Basically, suppose you ask the AI a difficult question and record it's answer.... Then you asked the AI the same difficult question BUT ALSO give a hint what went wrong previously.

The **gap** between this hint-enhanced distribution and the original student distribution gives a **per-token directional advantage**: positive where the model should upweight a token, negative where it should downweight.这种提示增强分布与原始学生分布之间的差距，使得每个**标记****具有方向性优势** ：正优势表示模型应该提高标记的权重，负优势表示模型应该降低标记的权重。

This is fundamentally different from:

- **RLHF** - uses scalar preference signals**RLHF** - 使用标量偏好信号
- **DPO** - requires paired preferences (often annotated by human or another AI)**DPO——** 需要成对的偏好（通常由人或其他人工智能标注）
- **Standard distillation** - requires a separate, stronger teacher model**标准蒸馏** ——需要单独的、更强大的教师模式

OPD uses **the model itself** as its own teacher, just with extra context!OPD 以**模型本身**作为教师，只是增加了额外的背景信息！

The policy is run under enhanced​ with the original response atat​ as forced input. The per-token log-probability gap gives the advantage. If teacher assigns a token higher probability, student would upweight this token, If teacher assigns a lower probability, student should downweight.该策略在增强模式下运行，并将原始响应作为强制输入。每个词元的对数概率差距使其具有优势。如果教师赋予某个词元更高的概率，学生应提高该词元的权重；如果教师赋予该词元更低的概率，学生则应降低其权重。

> **Basically we try to update the model by moving the student's token log-probs closer to the teacher's log-prob.** The teacher's log-probs are generated using the hint, and the student's log-probs were generated without the hint. **我们基本上是通过将学生的词元对数概率值更接近教师的对数概率值来更新模型的。** 教师的对数概率值是使用提示生成的，而学生的对数概率值则是在没有提示的情况下生成的。

> With distillation, we are training the student to get to the correct solution in one attempt WITHOUT requiring the hint!

## PRM + OPD: Better Together

![图像](https://pbs.twimg.com/media/HDTWqT4a8AAHrKA?format=jpg&name=large)

Process Reward Models (generating scalar/ternary rewards) and OPD (generating rich feedback) are used together during training.

> The advantage of each token is basically the global advantage of the entire sequence (coming from PRM) plus the distillation lift from the OPD.

So the combination is simply a **weighted sum of the two advantages**:因此，这种组合就是**两种优势的加权**和 ：

# Final Thoughts

![图像](https://pbs.twimg.com/media/HDTWe4SaYAAERdE?format=jpg&name=large)

OpenClaw-RL is useful in two contexts:

- **Personal Agents** run on a single user's device. Interactions are sparse, session-based, and deeply personalized. Agent trains on interaction with it's user (for example, personalizing to a student who uses OpenClaw to do homework)**个人代理**运行在单个用户的设备上。交互稀疏、基于会话且高度个性化。代理通过与用户的交互进行训练（例如，针对使用 OpenClaw 做作业的学生进行个性化设置）。
- **General Agents** are learning agentic tasks. **Terminal**, **GUI**, **SWE (software engineering)**, and **Tool-call** agents - covering virtually every real-world deployment setting.**通用代理**正在学习代理任务。 **终端**代理 、 **图形用户**界面代理 、 **软件工程代理**和**工具调用**代理——几乎涵盖所有现实世界的部署环境。

They do experiments with small Qwen3 models (4B, 8B, and 32B variants). Here are a list of their main takeaways:

1. **Binary RL alone** barely moves the needle - marginal improvement only**单靠二进制强化学习**几乎无法取得显著成效——只有微弱的改进。
2. **OPD alone** starts slow (sparse hints early on) but jumps significantly later**单独进行 OPD 测试**初期进展缓慢（早期迹象不明显），但后期会显著加速。
3. **Combined** (Binary + OPD) wins convincingly at both personal and general agents**组合** （二进制+OPD）在个人代理和一般代理方面都取得了压倒性优势。
4. PRM gains is especially dramatic in the **tool-call** setting (250 steps long) - a 76% jump. This makes sense intuitively: the longer the horizon, the more the agent suffers from sparse outcome-only rewards, and the more dense PRM step signals help!PRM 在**工具调用**场景（250 步长） 中的效果尤为显著 ——提升了 76%。这符合直觉：时间跨度越长，智能体就越容易受到稀疏结果奖励的影响，而密集的 PRM 步信号则越有帮助！
5. The Qwen Models learned very fast. **36 problem-solving interactions** in the student setting (described in the intro).Qwen 模型学习速度非常快。 在学生环境中**进行了 36 次问题解决互动** （详见引言）。

The paper provides prompts how these tasks were learnt, and how PRM and OPD rewards were extracted. It is all very cool, I encourage yall to read the main paper for their experiments and results!

**Their Repo:** [https://github.com/Gen-Verse/OpenClaw-RL](https://github.com/Gen-Verse/OpenClaw-RL) **Read paper on your own at Arxiv:** [arxiv.org/abs/2603.10165](https://arxiv.org/abs/2603.10165)他们的仓库： [https://github.com/Gen-Verse/OpenClaw-RL](https://github.com/Gen-Verse/OpenClaw-RL) 请自行在 Arxiv 上阅读论文： [arxiv.org/abs/2603.10165](https://arxiv.org/abs/2603.10165)

**Study the paper with an AI that highlights relevant sections for you as it answers your questions:** [http://paperbreakdown.com/abs/2603.10165](http://paperbreakdown.com/abs/2603.10165) 利用人工智能学习论文，它会在回答你的问题的同时，突出显示相关章节： [http://paperbreakdown.com/abs/2603.10165](http://paperbreakdown.com/abs/2603.10165)

If you are into links, here is where to find me:

**Follow me for more**:**关注我获取更多内容** ：

[@neural\_avb](https://x.com/@neural_avb)

**My YouTube channel:**

[https://www.youtube.com/@avb\_fj](https://www.youtube.com/@avb_fj)

**Patreon:**

[https://www.patreon.com/NeuralBreakdownwithAVB](https://www.patreon.com/NeuralBreakdownwithAVB)

A bit of kindness goes a long way, RT or comment to support! 💙一点善意就能带来很大的影响，转发或评论表示支持！ 💙