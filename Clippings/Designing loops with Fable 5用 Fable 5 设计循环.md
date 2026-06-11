---
title: "Designing loops with Fable 5用 Fable 5 设计循环"
source: "https://x.com/RLanceMartin/status/2064397389189071163"
author:
  - "[[@RLanceMartin]]"
published: 2026-05-05
created: 2026-06-11
description: "Mythos-class models like Claude Fable 5 have changed the way many of us work at Anthropic. I want to share two tips for getting the most out..."
tags:
  - "clippings"
---
![图像](https://pbs.twimg.com/media/HKYnS0Za8AA_BoV?format=jpg&name=large)

Mythos-class models like Claude Fable 5 have changed the way many of us work at Anthropic. I want to share two tips for getting the most out of this class of models.像 Claude Fable 5 这样的 Mythos 级模型改变了 Anthropic 许多人的工作方式。我想分享两个技巧，助你充分利用这类模型。

**Self-correction loops自我校正循环**

There’s been a lot of interest in loops recently. [@bcherny](https://x.com/@bcherny) [has mentioned](https://x.com/sairahul1/status/2064279904989147577?s=20) that “(his) job is to write loops.” Letting models hillclimb on an evaluation is a common recipe for improving task performance: [/goal](https://code.claude.com/docs/en/goal) in Claude Code and [Outcomes](https://platform.claude.com/docs/en/managed-agents/define-outcomes) in Claude Managed Agent are primitives that let you apply this general recipe for your specific task.最近大家对循环（loops）的关注度很高。@bcherny 提到过“（他的）工作就是写循环”。让模型在评估中逐步优化（hillclimb）是提升任务性能的常见方法：Claude Code 中的 /goal 和 Claude Managed Agent 中的 Outcomes 就是让你针对特定任务应用这一通用方法的原语。

As mentioned in our [prompting guide](https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/prompting-claude-fable-5), Fable 5 is good at self-correcting in a loop. A well designed goal or rubric adds feedback to the environment that Claude is running in. This let’s Claude run, collect feedback via the goal or rubric, self-correct, and proceed until the goal or rubric is satisfied.正如我们在提示指南中提到的，Fable 5 擅长在循环中进行自我修正。精心设计的目标或评分标准能为 Claude 运行的环境提供反馈。这让 Claude 能够运行、通过目标或评分标准收集反馈、自我修正，并持续进行直到目标或评分标准达成。

![图像](https://pbs.twimg.com/media/HKYoS3maMAoXYHR?format=jpg&name=large)

I’ll share one toy example that I used to test Fable: [Parameter Golf](https://github.com/openai/parameter-golf) is an open source ML engineering challenge to train the best model that fits in a 16MB artifact in < 10 minutes on 8xH100s.我来分享一个我用 Fable 测试的小例子：Parameter Golf 是一个开源机器学习工程挑战，目标是在 8 块 H100 上、10 分钟内训练出能装入 16MB 工件的模型。

It’s a bit like [@karpathy](https://x.com/@karpathy)'s [autoresearch](https://github.com/karpathy/autoresearch) project: it tests the ability of an agent to edit basic training code (a single train\_gpt.py file), launch training, poll the log, read the score, and decide what experiment to run next.这有点像 @karpathy 的自动研究项目：它能测试智能体编辑基础训练代码（一个单独的 train\_gpt.py 文件）、启动训练、轮询日志、读取评分并决定下一步运行什么实验的能力。

I compared Fable 5 to Opus 4.7 on this challenge using [Claude Managed Agents](https://platform.claude.com/docs/en/managed-agents/overview) (CMA). CMA provides [the agent harness as well as a hosted sandbox](https://www.anthropic.com/engineering/managed-agents), so it’s well-suited for long-running tasks with Fable 5. For Parameter Golf, I gave CMA access to 8xH100 GPUs as a [self-hosted sandbox](https://platform.claude.com/docs/en/managed-agents/self-hosted-sandboxes).我在这项挑战中对比了 Fable 5 与 Opus 4.7，使用的是 Claude 托管代理（CMA）。CMA 提供了代理框架以及托管沙盒，因此非常适合与 Fable 5 配合处理长时间运行的任务。对于参数高尔夫（Parameter Golf），我让 CMA 使用 8 块 H100 GPU 作为自托管沙盒。

One subtle point: what does the judging is important. We’ve seen that models have problems with self-critique on their own outputs. Prithvi Rajasekaran wrote about this in our engineering blog [here](https://www.anthropic.com/engineering/harness-design-long-running-apps).一个微妙的要点：评判者的身份至关重要。我们发现模型在自我审视自身输出时会遇到问题。Prithvi Rajasekaran 在我们的工程博客中对此进行了阐述。

![图像](https://pbs.twimg.com/media/HKYo5xEaMAAjeKL?format=jpg&name=large)

We’ve found that a verifier sub-agent [tends to outperform](https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/prompting-claude-fable-5) self-critique with Fable 5, because grading is done in an independent context window. [Outcomes](https://platform.claude.com/docs/en/managed-agents/define-outcomes) in CMA handles this by spawning a grader sub-agent for you.我们发现，使用 Fable 5 时，验证子代理通常优于自我批评，因为评分是在独立的上下文窗口中完成的。CMA 中的 Outcomes 通过为你生成一个评分子代理来处理这一问题。

For each test, I supplied a rubric (a file) with the nine checkable criteria (e.g., run a baseline, run 20 experiments, etc). Then, I ran Parameter Golf for up to 8 hours. The Outcomes grader confirmed that all experimental criteria were met before allowing Claude to stop the work.每次测试，我都提供了一份包含九项可核查标准（例如运行基线、进行 20 次实验等）的评分细则（一个文件）。随后，我运行参数优化程序长达 8 小时。结果评估器确认所有实验标准均已达标后，才允许 Claude 停止工作。

Fable 5 improved the training pipeline ~6x more than Opus 4.7. If we consider experiments as structural (e.g., architecture changes) or scalar (e.g., adjusts a constant), Fable 5 bet on larger structural changes and showed resilience (e.g., pushing through a quantization regression to its biggest win).Fable 5 将训练流程提升了 ~6 倍，远超 Opus 4.7。若将实验分为结构性（如架构变更）和标量性（如调整常数），Fable 5 押注于更大的结构性变革并展现出韧性（例如，在量化回归中逆势突围，最终取得最大胜利）。

Opus 4.7's first experiment produced a small win and nearly everything after followed the same template: adjust a scalar, measure, keep if positive.Opus 4.7 的首次实验取得了小幅成功，之后几乎所有的尝试都遵循了相同的模式：调整一个标量，测量效果，若为正则保留。

**Memory记忆**

Memory is [another area where Fable excels](https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/claude-prompting-best-practices). We can think about this as a outer loop that spans across sessions: Claude writes to memory during a session and those memories can be retrieved in future sessions.记忆是 Fable 另一个表现出色的领域。我们可以将其视为跨越多个会话的外部循环：Claude 在会话期间写入记忆，而这些记忆可以在未来的会话中被检索。

[@pgasawa](https://x.com/@pgasawa) and team recently published Continual Learning Bench 1.0, so I wanted to test this on Fable 5 vs earlier models.@pgasawa 及其团队最近发布了 Continual Learning Bench 1.0，因此我想在 Fable 5 与早期模型上测试一下。

> 5月5日
> 
> Today, we’re releasing Continual Learning Bench 1.0: the first, realistic benchmark for measuring how AI systems can improve in online settings. Benchmarks today assume models are stateless. Each example is independent, and once a system finishes a task, it moves on as if今天，我们发布了 Continual Learning Bench 1.0：首个用于衡量 AI 系统在在线环境中如何提升的现实基准。 当今的基准测试假设模型是无状态的。每个示例都是独立的，一旦系统完成一项任务，它就会继续前进，仿佛

I compared Fable 5, Opus 4.7, and Sonnet 4.6 on one of the tasks from the benchmark: the task asks an agent to answer sequential questions given access to a SQL database. Each question is a separate agent session and memory is provided.我对比了 Fable 5、Opus 4.7 和 Sonnet 4.6 在基准测试中的一项任务：该任务要求智能体在访问 SQL 数据库的情况下回答连续问题。每个问题都是一个独立的智能体会话，并提供了记忆。

For this, I used CMA with [memory](https://platform.claude.com/docs/en/managed-agents/memory), which gives each agent access to a mounted filesystem that can be shared across sessions. 为此，我使用了带记忆的 CMA，使每个智能体都能访问一个可跨会话共享的挂载文件系统。

![图像](https://pbs.twimg.com/media/HKYq6HvaMAEfFJg?format=jpg&name=large)

For this task, effective use of memory benefits from a progression: fail (get something wrong and document), investigate (before moving on, figure out why), verify (turn the diagnosis into a checked fact), distill (turn verification into a general rule), and consult (read the rule, instead of re-deriving it).对于这项任务，有效利用记忆得益于一个递进过程：失败（出错并记录）、调查（继续前先弄清原因）、验证（将诊断转化为经核查的事实）、提炼（将验证转化为通用规则）、参考（阅读规则，而非重新推导）。

Sonnet 4.6 exits around step 1: its store is a list of failure notes and open guesses (e.g., "maybe prc instead of prc\_usd?"). It rarely consults prior notes. To improve performance, task-specific memory instructions are needed. Sonnet 4.6 在第一步左右退出：其存储是一系列失败记录和未确定的猜测（例如，“也许用 prc 而不是 prc\_usd？”）。它很少查阅之前的记录。要提升性能，需要任务特定的记忆指令。

Opus 4.7 exits around step 3: it creates a schema reference with uncertainty flagged (e.g., "possibly prc in cents? Verify."), but verification coverage is low: at 7-33% of questions (median run ~17%). Opus 4.7 在第 3 步左右退出：它创建了一个带有不确定性标记的模式引用（例如，“可能在美分中是 prc？请确认。”），但验证覆盖率较低：仅为问题的 7-33%（中位数运行 ~17%）。

Fable 5 tends to complete the progression: in its strongest runs, verification coverage is up to 73% (22 of 30) and it distills learnings into general rules that help with future tasks.Fable 5 倾向于完成这一进化过程：在其最强运行中，验证覆盖率高达 73%（30 项中完成 22 项），并能将学到的经验提炼为通用规则，从而帮助应对未来任务。

Rather than directly prompting and steering Fable 5, it's often better to design loops that let the model to self-correct in response to environment feedback (e.g., /goal or Outcomes) and manage its own context (e.g., via memory). 与其直接提示和引导 Fable 5，通常更好的做法是设计循环机制，让模型能够根据环境反馈（如/goal 或 Outcomes）自我修正，并通过记忆等方式自主管理上下文。

I've shared just a few small scale experiments that I've run, but its worth testing Fable 5 for yourself on challenging tasks and using loops for self-correction or memory.我只分享了一些我运行过的小规模实验，但值得你自己在具有挑战性的任务上测试 Fable 5，并使用循环进行自我修正或记忆。

To get started, see our [docs](https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/prompting-claude-fable-5) or ask the latest version of Claude Code, which can use our built-in [/claude-api](https://github.com/anthropics/skills/tree/main/skills/claude-api) skill to tell you about Fable 5 (e.g., prompting best practices), /goal, Claude Managed Agents, or other API features.要开始使用，请查阅我们的文档或询问最新版本的 Claude Code，它可以使用内置的 /claude-api 技能告诉你关于 Fable 5 的信息（例如提示最佳实践）、/goal、Claude 托管代理或其他 API 功能。