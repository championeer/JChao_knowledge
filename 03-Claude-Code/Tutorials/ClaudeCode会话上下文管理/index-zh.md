---
title: "Using Claude Code: Session Management & 1M Context"
source: "https://x.com/trq212/status/2044548257058328723"
author:
  - "[[@trq212]]"
published: 2026-04-16
created: 2026-04-16
description: "In my recent calls with Claude Code users, one theme keeps coming up: the 1M token context window is a double-edged sword. It lets Claude Co..."
tags:
  - "clippings"
---
![Image](https://pbs.twimg.com/media/HF-p1RUbEAIH-6t?format=jpg&name=large)

在我近期与 Claude Code 用户的交流中，一个主题反复出现：百万 token 上下文窗口是把双刃剑。

它让 Claude Code 能够更长时间地自主运行并更可靠地处理任务，但如果你在管理会话时不够谨慎，也会为上下文污染打开方便之门。

会话管理比以往任何时候都更加重要，围绕它的问题似乎也越来越多。你是在终端中保持一个会话，还是两个？每次提示都全新开始？什么时候该用 compact、rewind，或者子代理？什么情况会导致糟糕的 compact？这里有大量细节会真正影响你使用 Claude Code 的体验，而几乎所有这些都来自对上下文窗口的管理。

## 上下文、压缩与上下文衰退快速入门

![Image](https://pbs.twimg.com/media/HF-nqWCbEAE3Oan?format=jpg&name=large)

上下文窗口就是模型在生成下一个响应时能够"看到"的全部内容。它包括你的系统提示、迄今为止的对话、每次工具调用及其输出，以及所有已被读取的文件。Claude Code 拥有一百万 token 的上下文窗口。

不幸的是，使用上下文有一定代价，这通常被称为上下文衰退（context rot）。上下文衰退是一种观察：随着上下文增长，模型性能会下降，因为注意力被分散到更多 token 上，而较旧、无关的内容开始干扰当前任务。对于我们的百万上下文模型，我们发现在约 30-40 万 token 左右会出现一定程度的上下文衰退，但这高度依赖于具体任务——并非一成不变的规律。

上下文窗口是硬性上限，因此当你接近上下文窗口末尾时，需要将正在处理的任务总结为更短的描述，并在新的上下文窗口中继续工作，我们称之为压缩（compaction）。你也可以自行触发压缩。

![Image](https://pbs.twimg.com/media/HF-ntaxboAAZuCm?format=jpg&name=large)

# 每个回合都是一个分叉点

假设你刚刚让 Claude 完成了某件事，任务结束后，你的上下文中已有一些信息（工具调用、工具输出、你的指令），而你接下来有令人惊讶的多种选择：

- **继续（Continue）** — 在同一会话中发送另一条消息
- **/rewind（Esc Esc）** — 跳回之前的某条消息并从那里重试
- **/clear** — 开始新会话，通常附带你从刚才学到的内容提炼出的简介
- **Compact** — 对迄今为止的会话进行摘要，并在摘要基础上继续
- **子代理（Subagents）** — 将下一块工作委托给拥有干净上下文的代理，只将其结果带回来

虽然最自然的选择是直接继续，但其他四个选项的存在就是为了帮助管理你的上下文。

![Image](https://pbs.twimg.com/media/HF-n6mMbEAEImhv?format=jpg&name=large)

## 何时开始新会话

全新的百万上下文窗口意味着你现在可以更可靠地完成更长的任务，例如让它从头构建一个全栈应用。但仅仅因为模型还没用完上下文，并不意味着你不应该开始新会话。

我们的一般经验法则是：当你开始一项新任务时，也应该开始一个新会话。

灰色地带是当你可能想做相关任务，其中一些上下文仍然必要，但并非全部。

例如，为你刚刚实现的功能编写文档。虽然你可以开始一个新会话，但 Claude 需要重新读取你刚刚实现的文件，这会更慢更贵。由于文档可能不是一项高度智能敏感的任务，额外的上下文带来的效率收益可能值得。

## 用 Rewind 代替纠正

![Image](https://pbs.twimg.com/media/HF-oDqjbEAI94h5?format=jpg&name=large)

如果我必须选出一个标志着良好上下文管理的习惯，那就是 rewind。

在 Claude Code 中，双击 Esc（或运行 /rewind）可以跳回任意之前的消息并从那里重新提示。该点之后的消息会从上下文中删除。

Rewind 通常是纠正的更好方式。例如，Claude 读取了五个文件，尝试了一种方法，但没有成功。你的本能可能是输入"那不行，改试 X 吧"，但更好的做法是 rewind 到文件读取结束之后，用你所学到的内容重新提示。"不要用方法 A，foo 模块没有暴露那个接口——直接用 B。"

你也可以使用"从这里总结"让 Claude 总结其学到的内容并创建一份交接消息，有点像是从未来的自己（已经尝试了某件事却没成功的那个版本）写给之前版本 Claude 的消息。

![Image](https://pbs.twimg.com/media/HF-oKwBbEAAdb6I?format=jpg&name=large)

## Compact 与全新会话

当一个会话变长时，你有两种方式减负：/compact 或 /clear（然后全新开始）。它们感觉相似，但行为截然不同。

**Compact** 让模型总结迄今为止的对话，然后用该摘要替换历史记录。它有损耗——你信任 Claude 来决定什么是重要的——但你不需要自己写任何东西，Claude 可能在包含重要学习成果或文件方面更为全面。你也可以通过传递指令来引导它（`/compact 专注于 auth 重构，丢弃测试调试部分`）。

![Image](https://pbs.twimg.com/media/HF-oPtxaAAAUKMr?format=jpg&name=large)

用 /clear 则需要你写下重要的内容（"我们在重构 auth 中间件，约束条件是 X，重要文件是 A 和 B，我们已排除方法 Y"）并全新开始。工作量更大，但最终的上下文是你决定相关的内容。

## 什么导致糟糕的 Compact？

![Image](https://pbs.twimg.com/media/HF-oy22bEAE_Jd8?format=jpg&name=large)

如果你运行了很多长时间会话，你可能已经注意到有时 compact 效果特别差。在这种情况下，我们通常发现当模型无法预测你工作走向时，会发生糟糕的 compact。

例如，自动 compact 在一次漫长的调试会话后触发，并总结了调查过程，而你的下一条消息是"现在修复我们在 [bar.ts](http://bar.ts/) 中看到的那个其他警告。"

但由于会话聚焦于调试，那个其他警告可能已从摘要中被删除。

这特别棘手，因为由于上下文衰退，模型在 compact 时处于其最不智能的状态。有了百万上下文，你有更多时间主动使用 /compact 并描述你想做的事情。

## 子代理与全新上下文窗口

![Image](https://pbs.twimg.com/media/HF-o6v1bQAA7pS6?format=jpg&name=large)

子代理是一种上下文管理形式，适用于当你提前知道某块工作会产生大量你不会再需要的中间输出时。

当 Claude 通过 Agent 工具生成子代理时，该子代理获得自己全新的上下文窗口。它可以做任意多的工作，然后综合其结果，只有最终报告才会返回给父代理。

我们使用的心智测试是：我会再次需要这个工具输出，还是只需要结论？

虽然 Claude Code 会自动调用子代理，但你可能想明确告诉它这样做。例如，你可能想告诉它：

- "派一个子代理根据以下规范文件验证这项工作的结果"
- "派出一个子代理读取那个其他代码库并总结它如何实现 auth 流程，然后以相同方式自己实现"
- "派出一个子代理根据我的 git 变更为这个功能编写文档"

# 总结

总之，当 Claude 结束一个回合而你即将发送新消息时，你面临一个决策点。

随着时间推移，我们期望 Claude 能帮你自己处理这些，但目前这是你引导 Claude 输出的方式之一。

![Image](https://pbs.twimg.com/media/HF-qwt9bEAEa1eq?format=jpg&name=large)
