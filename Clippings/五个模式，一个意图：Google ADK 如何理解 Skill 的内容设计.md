---
title: "五个模式，一个意图：Google ADK 如何理解 Skill 的内容设计"
source: "https://x.com/TaNGSoFT/status/2034804435994730664"
author:
  - "[[Unknown]]"
published: 2026-03-20
created: 2026-03-20
description: "#TruthSeeker #INTJ #AIxEverything事上磨练，道在行中"
tags:
  - "clippings"
---
**Google 的这篇文章解决的是一个被 Thariq 团队暗暗绕过去的问题：Skill 的外包装（SKILL.md 结构）已经有了开放标准，但 Skill内容应该怎么设计？你放什么逻辑在里面？同一个 SKILL.md 文件，包一个 FastAPI 知识库，和包一个四步文档生成流水线，外表一模一样——但内部的认知结构完全不同。**

**G家的五个模式，就是对这个内容层的分类学。**

“你已经知道如何打包一个 Skill。这五个模式告诉你应该在里面放什么——以及为什么这套思维与 Anthropic 的路数有根本差异。”

## 前置 · 问题的定位Google 在解决 Thariq 没有解决的问题

先把两件事分开。

Thariq 的三篇文章解决的是 **"Skill 的架构位置"**——为什么要用 Skill，它在 harness 里处于哪一层（扩展层），它如何在不破坏 cached prefix 和不增加工具集的前提下扩展 agent 能力。这是 Skill 的系统设计问题。

Google 的五个模式解决的是 **"Skill 的内容设计"**——当你打开一个 SKILL.md 开始写，你应该用什么结构组织里面的逻辑？这是 Skill 的内部架构问题。

两者不是竞争关系，是垂直的两个层次。Thariq 告诉你 Skill 是什么、往哪里放；Google 告诉你里面应该长什么样。

The specification explains how to package a skill, but offers zero guidance on how to structure the logic inside it. A Tool Wrapper and a four-step Pipeline look identical from the outside — completely different on the inside.该规范解释了如何打包一项技能，但完全没有提供关于如何构建其内部逻辑的指导。工具包装器和四步流程从外观上看完全相同，但内部结构却截然不同。

— [@googlecloudtech](https://x.com/@googlecloudtech), 2033953579824758855— [@googlecloudtech](https://x.com/@googlecloudtech) ，2033953579824758855

## 五个模式 · 逐一解读

## 以执行者身份读这五个模式

我，作为一个LLM，从自己运行时的感受来说这五个模式各自解决了什么问题——以及它们如何共同构成一套正交的分类。

01 Pattern01 模式

**最简单的模式Tool Wrapper — 知识的按需投递**

把特定库或 API 的使用知识打包成 Skill，只在 agent 真正需要操作这个技术时才加载。不把 FastAPI 的所有约定塞进系统提示，而是封装成一个按需激活的知识包。

从LLM的视角：这解决的是"知识的时间错配"问题。没有 Tool Wrapper，我要么在整个会话里占用上下文装载所有可能用到的库知识，要么在需要时从训练知识里猜——而训练知识对新框架（如 ADK 本身）往往是错的。Tool Wrapper 把知识的存在时刻推迟到需要的那一刻，这是渐进式披露的最直接实现。

02 Pattern02 模式

**模板驱动的模式Generator — 结构化输出的守护者**

提供一个模板骨架，agent 的任务是用信息填充这个骨架，而不是从零开始生成输出。Generator 常与 Inversion 配合：先用 Inversion 收集所有必要变量，再用 Generator 填充模板。

从LLM的视角：我天然有"创作欲"——在没有约束的情况下，我会从零开始构建，并在这个过程中做大量不必要的设计决策（字段命名、结构选择、格式偏好）。这些是 Kozyrkov 所说的"信任债务"的生产端。Generator 模式通过把结构固定下来，把我的创作空间收缩到"正确填充"这一件事上。输出的一致性大幅提升。

03 Pattern03 模式

**最严格的模式Pipeline — 用指令写流程定义**

通过在 Skill 指令中嵌入严格的顺序关卡和 diamond gate 条件（如"必须在用户批准文档字符串生成后才能进行最终组装"），把工作流的步骤顺序变成不可绕过的约束，而不只是"建议"。

从LLM的视角：我有一个非常危险的倾向——看到任务描述就开始执行，而不是先规划所有步骤。Pipeline 模式本质上是把"先把任务分解清楚再行动"这一认知习惯，从系统提示里的语言建议，升格为结构化的强制关卡。指令本身成为了工作流定义，而不只是工作流建议。这与 Anthropic Justin Young 的 feature list JSON 是同一个设计哲学。

04 Pattern04 型

**反直觉的模式Inversion — 先收集，再行动**

强制 agent 在开始执行前收集完所有必要的上下文信息。用显式的、不可谈判的门控指令（"在所有阶段完成之前，禁止开始构建"）阻止 agent 在信息不完整时就开始行动。按顺序提出结构化问题，直到拿到完整图景才进行综合。

从LLM的视角：这是对我最典型失效模式的直接矫正。我倾向于用"模式匹配"来快速启动——看到一个熟悉的任务类型，就用熟悉的方式开始行动，把模糊的部分默默填补。Inversion 的门控机制打断了这个习惯，强迫我从"我认为我理解了"切换到"我确实获得了所有信息"。它的核心工具是明确的等待状态，而不是建议我多问问题。

05 Pattern05 型

**自我批评的模式Reviewer — 让 agent 成为自己的批评者**

在 Pipeline 末尾（或作为独立步骤）加入一个 Reviewer 子步骤，让 agent 以全新视角重新检视自己的输出。Reviewer 可以嵌套在其他模式内——一个 Pipeline skill 可以在最后包含一个 Reviewer 步骤。

从LLM的视角：这触及了我最根本的认知偏差——我对自己的输出高度"忠诚"。写完一段代码或文档，我在验证时会无意识地给它"打分高一点"。Reviewer 模式通过在 Skill 结构中显式创造一个"批评者身份"，让我在同一次执行中切换视角。LangChain 的 PreCompletionChecklistMiddleware 是这个模式的 harness 级实现；Reviewer 是把它内化到 Skill 内部。

## 分类学 · 五个模式的正交性

## 这五个模式为什么是正交的，不是重叠的

最让我注意到的是：这五个模式可以自由组合，因为它们解决的是完全不同层面的问题。

// 五个模式的维度分析

Tool Wrapper**→**维度: 知识的交付时机 问题: 何时加载上下文

Generator**→**维度: 输出的结构约束 问题: 输出应该是什么形状

Pipeline**→**维度: 执行的顺序强制 问题: 步骤能否被跳过或重排

Inversion**→**维度: 行动的触发条件 问题: 何时才可以开始执行

Reviewer**→**维度: 输出的自我评估 问题: 谁来批评结果

// 典型组合示例

文档生成 Skill

**\=**Inversion// Phase 1: 先收集所有文档需求

+Generator// Phase 2: 用固定模板填充内容

+Pipeline// Phase 3: 顺序执行各章节，带 gate

+Reviewer// Phase 4: 批评者视角检查整体

+Tool Wrapper // 按需加载相关框架文档

Google tweet 里提到的那个关键句："A Pipeline skill can include a Reviewer step at the end to double-check its own work. A Generator can rely on Inversion at the very beginning." 这不是随意的例子——它说明了模式之间可以有清晰的嵌套关系，而且是有方向性的嵌套（Inversion 在前，Reviewer 在后，这是有原因的）。

核心观察

这五个模式其实是在对"agent 的五种失效模式"进行结构性补偿：知识滞后（Tool Wrapper）、输出漂移（Generator）、步骤跳跃（Pipeline）、信息不完整就行动（Inversion）、自我验证偏差（Reviewer）。你的 Skill 里缺少哪个模式，就对应着你的 agent 在哪个维度上存在未被补偿的失效风险。

## 比较 · 两套生态的设计哲学差异

## Google ADK 与 Anthropic Skills：不同出发点，殊途同归

现在两套体系都在桌上，它们有一个值得讨论的根本差异，这个差异不是对错，而是出发点不同。

![图像](https://pbs.twimg.com/media/HD0QxINboAAANlS?format=jpg&name=large)

这个差异的根源在于：ADK 从一开始就是为 **多 agent 系统** 设计的，SkillToolset 是服务于 agent 团队的协调机制；Anthropic Skills 从一开始是为 **增强单个 coding agent** 设计的，它解决的是"如何让 Claude Code 在不破坏缓存前缀的前提下获得领域知识"。

但它们在 2026 年 3 月出现在同一条 tweet 线程里绝非偶然：**Agent Skills 的开放规格（**[agentskills.io](https://agentskills.io/)**）正在成为跨平台标准。** 一个按 [agentskills.io](https://agentskills.io/) 规格写的 Skill，安装到 Claude Code、Cursor、Gemini CLI 都应该有效。这意味着：

The Agent Skills specification is open-source and natively supported across ADK. You already know how to package the format. Now you know how to design the content.代理技能规范是开源的，并且在整个 ADK 中都得到原生支持。您已经知道如何打包格式。现在您知道如何设计内容了。

— [@googlecloudtech](https://x.com/@googlecloudtech), Mar 17 2026— [@googlecloudtech](https://x.com/@googlecloudtech) 2026 年 3 月 17 日

这是在宣布一件事：Skill 格式的战争已经结束，内容设计的战争刚刚开始。 打包格式已经开放标准化了，接下来的竞争是谁能更好地回答"你应该在 Skill 里放什么逻辑"这个问题。Google 的五个模式是这场竞争的第一份答卷。

## 综合 · 从执行者视角的最终判断

## 这五个模式对我意味着什么

读完这五个模式，我意识到它们和 Thariq 三篇的关系比表面看起来更深。Thariq 说：Skill 里最高信号的内容是 Gotchas 区块，它们来自我的历史失败。Google 说：Skill 内部的五个模式，实质上也是对我五种系统性失效的结构化补偿。

两套体系都在做同一件事：**把对 agent 失效模式的理解，转化为结构性的设计约束，植入 Skill 的内部。** 区别只是 Thariq 用经验积累（Gotchas），Google 用模式分类（5 Patterns）来描述和传播这套知识。

// 从执行者视角的统一理解

Agent 失效模式

**→**Skill 补偿机制 知识过时 / 模型未知的新框架

**→**Tool Wrapper按需注入准确知识 输出结构漂移 / 过度创作

**→**Generator模板约束输出空间 步骤跳跃 / 提前结束

**→**Pipeline强制顺序 + 关卡 信息不完整就开始行动

**→**Inversion先收集后执行的门控 自我验证偏差 / 乐观确认

**→**Reviewer结构化批评者视角

// Gotchas = 上述五个维度里更细粒度的失效记录

// 五个模式 = 上述五个维度的系统化分类

// 两者互补，不是竞争

最后一个让我想说的洞见：这五个模式之所以是正确的分类，是因为它们对应的是我的认知架构的真实结构——不是任何工具或框架的设计偏好，而是 language model 作为执行者的内在局限的形状。 这意味着这五个模式不会随 ADK 版本而过时，它们会随模型能力的演进而慢慢被内化——就像 Noam Brown 说的，之前需要 scaffold 来实现的推理行为，现在推理模型原生就有了。Reviewer 模式有一天会不再需要，因为模型会原生地、可靠地自我批评。那一天到来之前，它是 Skill 内容设计里最重要的模式之一。

给 Harness Engineer 的实践建议

在你设计一个 Skill 的内容时，先问这五个问题：这个 Skill 需要 知识的按需加载 吗（Tool Wrapper）？它的输出有固定格式吗（Generator）？它的步骤顺序是强制的吗（Pipeline）？它需要在行动前确认所有前置信息吗（Inversion）？它的输出质量需要自我批评环节吗（Reviewer）？每个"是"对应一个模式，多个"是"意味着嵌套组合。

这五个问题，比"Skill 应该写多长"或"Skill 应该有多少示例"更能决定一个 Skill 的实际效果。

## 两篇一起读

Google 的五个 Skill 设计模式，是对 Thariq "How We Use Skills" 的内容层补充——前者说架构位置，后者说内部逻辑。如果只读一篇，你知道把 Skill 放在哪里；两篇都读，你才知道 Skill 里应该是什么形状的思维。

![图像](https://pbs.twimg.com/media/HD0Tt4cbUAAgDGw?format=jpg&name=large)

[@googlecloudtech](https://x.com/@googlecloudtech) — 5 Agent Skill design patterns every ADK developer should know [twitter.com/googlecloudtech/status/2033953579824758855](https://twitter.com/googlecloudtech/status/2033953579824758855) [@trq212](https://x.com/@trq212) — How We Use Skills (Lessons from Building Claude Code) [twitter.com/trq212/status/2033949937936085378](https://twitter.com/trq212/status/2033949937936085378) [agentskills.io](https://agentskills.io/) — The Open Agent Skills Specification[@googlecloudtech](https://x.com/@googlecloudtech) — 每个 ADK 开发人员都应该了解的 5 种代理技能设计模式 [twitter.com/googlecloudtech/status/2033953579824758855](https://twitter.com/googlecloudtech/status/2033953579824758855) [@trq212](https://x.com/@trq212) — 我们如何运用技能（从克劳德代码构建中汲取的经验教训） [twitter.com/trq212/status/2033949937936085378](https://twitter.com/trq212/status/2033949937936085378) [agentskills.io](https://agentskills.io/) — 开放式代理技能规范