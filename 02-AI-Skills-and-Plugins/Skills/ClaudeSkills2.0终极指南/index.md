---
title: "Ultimate Guide to Claude Skills 2.0 (the biggest skills update yet)克劳德技能终极指南 2.0（迄今为止最大的技能更新）"
source: "https://x.com/itsolelehmann/status/2031461162768867622"
author:
  - "[[Unknown]]"
published: 2026-03-11
created: 2026-03-12
description: "#TruthSeeker #INTJ #AIxEverything事上磨练，道在行中"
tags:
  - "clippings"
---
**Claude Skills 2.0** just dropped and most people missed it.**Claude Skills 2.0** 刚刚发布，但大多数人都错过了。

Anthropic quietly upgraded the **Skill Creator,** and it fixes the 3 biggest problems everyone has with skills right now.Anthropic 悄悄地升级了**技能创建器，** 解决了目前大家在使用技能时遇到的 3 个最大问题。

If you use this right, you tell Claude what you need and it one-shots the output exactly how you want it.如果使用得当，你告诉 Claude 你的需求，它就能一次性准确地按照你想要的方式输出结果。

You're cooking stunning landing pages in 2 minutes, producing brilliant email copy that actually converts, cranking out a week's worth of content in an hour... whatever you've built skills for.你可以在 2 分钟内制作出精美的落地页，撰写出真正能带来转化的出色电子邮件文案，在一小时内制作出一周的内容……无论你掌握了哪些技能。

First try. Minimal to no editing.第一次尝试。几乎没有修改。

Here's what changed and how to actually use it (step-by-step):以下是变更内容以及实际使用方法（分步详解）：

## Problem 1: You have no idea if your skill actually works.问题 1：你不知道你的技能是否真的有效。

Be honest. You probably built a skill, tested it once or twice, and called it done.说实话，你可能掌握了一项技能，测试了一两次，就觉得大功告成了。

Maybe the outputs looked decent so you assumed it was working.也许输出结果看起来不错，所以你以为它运行正常。

But you've been guessing.但你一直在猜测 。

There was literally no way to measure whether your skill was making outputs better or just adding noise.根本无法衡量你的技能是提高了产出质量还是仅仅增加了噪音。

That just changed.情况已经改变了。

**What's new: Real testing for skills.新增内容：真正的技能测试。**

Skill Creator 2.0 lets you run **real tests** on any skill.Skill Creator 2.0 可以让你对任何技能进行**真实测试** 。

Here's how it works:它的运作方式如下：

1. Tell Claude "use the Skill Creator to evaluate \[your skill name\]."告诉克劳德“使用技能创建器评估\[你的技能名称\]”。
2. It reads your skill and generates **test prompts** based on what it's supposed to do (so if you have a blog post skill, it might generate "write a 500 word blog post about productivity").它会读取你的技能，并根据技能的功能生成**测试提示** （例如，如果你有撰写博客文章的技能，它可能会生成“撰写一篇关于生产力的 500 字博客文章”）。
3. It runs each prompt with your skill loaded and checks whether the output actually followed your instructions (your tone, your formatting rules, your structure, etc).它会加载你的技能来运行每个提示，并检查输出是否真正遵循了你的指示（你的语气、你的格式规则、你的结构等）。
4. You get a **report** showing which tests passed, which failed, and exactly what the skill missed.你会收到一份**报告** ，其中显示哪些测试通过了，哪些测试失败了，以及该技能具体缺少哪些内容。

So instead of "I think my skill works?" you now get "my skill passes 7 out of 9 tests, and here's exactly where it's falling short."所以， 现在你不再问 “我认为我的技能有效吗？”， 而是问 “我的技能通过了 9 项测试中的 7 项，而它的不足之处就在这里。”

**Then what? You fix it and retest.然后呢？修复它，然后重新测试。**

And the best part is, once you know what's failing, you can fix it and retest.最棒的是，一旦你知道哪里出了问题，你就可以修复它并重新测试。

The loop looks like this:循环过程如下：

1. Run the eval → see that your skill passes **7 out of 9** tests.运行评估 → 查看您的技能通过**了 9 项**测试中的 7 项。
2. Read the failures → maybe it keeps ignoring your formatting rules or drifting from your tone in longer outputs.阅读失败示例 → 也许它一直忽略你的格式规则，或者在较长的输出中偏离你的语气。
3. Tell Claude "update the skill to fix \[specific problem\]."告诉克劳德“更新技能以解决\[具体问题\]”。
4. Rerun the eval → now it passes **8 out of 9**.重新运行评估 → 现在通过了 **9 个中的 8 个** 。
5. Repeat until you're at **9 out of 9**.重复以上步骤，直到达到 **9/9** 。

You go from a skill you hope works to a skill you've actually proven works.你从一项你希望有效的技能，变成了一项你已经实际证明有效的技能。

And anytime something feels off in the future, you can rerun the tests in 2 minutes to check.以后如果感觉有什么不对劲，你可以在 2 分钟内重新运行测试进行检查。

P.S. If you want to implement AI workflows like this into your business, get them 100% free in your inbox here: [aisolo.beehiiv.com/subscribe](https://aisolo.beehiiv.com/subscribe)PS：如果您想在您的业务中实施类似的 AI 工作流程，请点击此处，即可在您的邮箱中免费获取： [aisolo.beehiiv.com/subscribe](https://aisolo.beehiiv.com/subscribe)

## Problem 2: Your skills break when models update (and you don't even notice).问题 2：当模型更新时，你的技能会失效（而你甚至没有注意到）。

This one is sneaky and most people don't think about it.这一点很隐蔽，大多数人都不会想到。

Say you built a skill 3 months ago that helps Claude write better landing pages.假设你三个月前掌握了一项技能，可以帮助克劳德编写更好的着陆页。

At the time, Claude wasn't great at landing pages on its own, so your detailed instructions genuinely helped.当时，克劳德不太擅长独立制作落地页，所以你提供的详细说明确实帮了他很大的忙。

Then Anthropic releases a **new, smarter model**.然后，Anthropic 发布了一款**新的、更智能的车型** 。

This new model is already great at landing pages by default.这个新模型本身在落地页方面就已经非常出色了。

But your old skill is still loaded, and it's still telling Claude to follow a rigid set of steps that were written for the older, less capable model.

The result?

Claude is now following your **outdated instructions** instead of using its own improved abilities.克劳德现在遵循的是你**过时的指令，** 而不是运用它自身提升后的能力。

Your skill is actually holding it back.实际上，你的技术反而拖了后腿 。

And this happens **silently**.这一切都**在悄无声息地**发生 。

You'd never know unless you tested it.

**What's new: A/B comparisons.**

Skill Creator 2.0 now lets you run **A/B comparisons** to catch exactly this:Skill Creator 2.0 现在允许您运行 **A/B 对比测试** ，以准确捕捉到这一点：

1. Tell Claude "use the Skill Creator to benchmark \[your skill name\]."
2. It runs the same tests twice: once **with your skill** loaded and once **without it** (just raw Claude).它会运行两次相同的测试：一次加载**你的技能** ，一次**不加载** （只有原始的克劳德）。
3. A separate agent reviews both outputs side by side without knowing which one used the skill (so there's no bias).
4. You get a comparison showing which version actually produced **better results**.你会看到对比结果，显示哪个版本实际产生了**更好的结果** 。

You can also compare **two versions** of the same skill this way.你也可以用这种方法比较同一技能的**两种不同版本** 。

So if you made edits, you can test old version vs new version to see if they actually helped.

**Then what? Here's what to do with the results.**

- **If raw Claude is winning:** you can retire the skill entirely. Delete it or disable it. Your outputs will actually get better by removing it.**如果克劳德的原始技能已经足够强大：** 你可以完全移除这个技能。删除或禁用它。移除后，你的输出实际上会更好。
- **If the skill is winning but only slightly:** the model is catching up. Keep the skill for now but retest after the next update.**如果技能略胜一筹，说明**模型正在迎头赶上。暂时保留该技能，待下次更新后再进行测试。
- **If the skill is winning by a lot:** great, your skill is still earning its place. Keep it.**如果这项技能优势明显：** 太好了，你的技能依然占据着应有的地位。保留它。

This is the **first thing you should run after any model update**.这是**模型更新后您应该运行的第一件事** 。

Takes a few minutes and could save you from running a skill that's quietly making your work worse.

## Problem 3: Claude doesn't even use your skill half the time.

Probably the most frustrating one.

You built a skill, you know it exists, you expect Claude to use it, and it just... doesn't.你创造了一项技能，你知道它的存在，你期望克劳德会使用它，但它就是…… 没用 。

**Why this happens: The toolbox problem.**

Think of your skills like **tools in a toolbox**.把你的技能想象**成工具箱里的工具** 。

Claude doesn't dump the entire toolbox into every conversation.

Instead it reads the **label** on each tool and decides which ones to grab based on what you asked for.它会读取每个工具上的**标签** ，并根据你的要求决定要使用哪些工具。

So if the label on your skill is too vague (like "writing help") Claude might grab it for things it was never meant for.所以，如果你的技能标签太模糊（比如 “写作帮助” ），克劳德可能会把它用于一些它原本不该用于的事情。

And if the label is too specific (like "Q4 2025 product launch email sequence") Claude won't recognize when it should be using it even when the task is a perfect fit.如果标签过于具体（例如 “2025 年第四季度产品发布电子邮件序列” ），即使任务非常合适，Claude 也无法识别何时应该使用它。

The problem is almost always in that label (the **skill description**).问题几乎总是出在那个标签（ **技能描述** ）上。

And up until now you had no way to know if your descriptions were actually working.

**What's new: Automatic description optimization.**

Skill Creator 2.0 now fixes this for you:

1. Tell Claude "use the Skill Creator to optimize the description for \[your skill name\]."
2. It looks at your current description and tests it against a bunch of different prompts.
3. It checks: does the skill correctly **activate** when someone asks for something it should handle? Does it **stay quiet** when someone asks for something unrelated?它会检查： 当有人提出它应该处理的事情时， 该技能是否能正确**激活** ？ 当有人提出无关的事情时， 它是否**保持沉默** ？
4. It rewrites your description so it triggers at the right times and stays out of the way when it should.

Anthropic ran this on their own official skills (the ones they built themselves) and saw **better triggering on 5 out of 6** of them.Anthropic 使用他们自己的官方技能（他们自己开发的技能）进行了测试，发现其中 **6 个技能中有 5 个触发效果更好** 。

So even the people who made Claude had this problem with their own skills (which honestly makes me feel better about mine).

**The end result.**

Your skills start firing when they should and staying quiet when they shouldn't.

If you have more than a handful of skills, this is probably the **single fastest thing** you can do to make all of them more reliable.如果你掌握了不止一项技能，这可能是让所有技能都更加可靠的**最快捷方法** 。

## How to get started:

If you're on [Claude.ai](https://claude.ai/) or **Cowork**, the Skill Creator is already available.如果你在 [Claude.ai](https://claude.ai/) 或者 ， **Cowork 的**技能创建器已经可用。

Just ask Claude to use it.

If you're on **Claude Code**, install the plugin:如果您使用的是 **Claude Code** ，请安装该插件：

1. Type /plugin.
2. Search "Skill Creator."
3. Install it.
4. Restart Claude Code.

Then just tell Claude what you want to do:

- "Use the Skill Creator to evaluate my \[skill name\]."
- "Use the Skill Creator to benchmark my \[skill name\] against baseline."
- "Use the Skill Creator to optimize the description for \[skill name\]."

Go test your existing skills.

You'll probably find at least one that's either broken, triggering wrong, or being outperformed by raw Claude.

Takes maybe 10 minutes to run your first eval.

**Do it once and you'll never go back to guessing.**

P.S. If you want to implement AI workflows like this into your business, get them 100% free in your inbox here: [aisolo.beehiiv.com/subscribe](https://aisolo.beehiiv.com/subscribe)PS：如果您想在您的业务中实施类似的 AI 工作流程，请点击此处，即可在您的邮箱中免费获取： [aisolo.beehiiv.com/subscribe](https://aisolo.beehiiv.com/subscribe)