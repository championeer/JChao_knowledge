---
title: "How to 10x your Claude Skills (using Karpathy's autoresearch method) 如何将你的克劳德技能提升10倍（使用卡帕西的自动研究方法）"
source: "https://x.com/itsolelehmann/status/2033919415771713715"
author:
  - "[[Unknown]]"
published: 2026-03-17
created: 2026-03-18
description:
tags:
  - "clippings"
---
Your Claude skills probably fail 30% of the time and you don't even notice. 你的克劳德技能可能有 30% 的概率会失败，而你甚至都没有注意到。

I built a method that auto-improves any skill on autopilot, and in this article I'm going to show you **exactly** how to run it yourself.我开发了一种方法，可以自动提升任何技能，在本文中，我将向您展示**如何**自己运行它。

You kick it off, and the agent tests and refines the skill over and over without you touching anything.你启动它，然后特工会一遍又一遍地测试和完善技能，而你无需做任何事情。

My landing page copy skill went from passing its quality checks 56% of the time to 92%. With **zero** manual work at all.我的落地页文案通过率从 56% 提升到了 92%，而且完全**没有**人工干预。

The agent just kept testing and tightening the prompt on its own.该代理程序会自行不断地测试和完善提示。

Here's the method and the exact skill I built so you can run it on your own stuff:以下是我开发的具体方法和技巧，你可以将其应用到你自己的项目中：

P.S. If you want more AI workflows like this one delivered to your inbox every week, join 34k readers getting them free: [aisolo.beehiiv.com/subscribe](http://aisolo.beehiiv.com/subscribe)PS：如果您想每周收到更多类似的 AI 工作流程，请加入我们，与 3.4 万名读者一起免费获取： [aisolo.beehiiv.com/subscribe](http://aisolo.beehiiv.com/subscribe)

## Where this comes from这源自何处？

Andrej Karpathy (co-founder of OpenAI, former head of AI at Tesla, guy who coined “vibe coding”) released a method called **autoresearch.**安德烈·卡帕西（OpenAI 的联合创始人，特斯拉前人工智能主管，也是“氛围编码”的创造者）发布了一种名为**自动研究的方法。**

The idea is simple: instead of you manually improving something, you let an AI agent do it for you in a loop.这个想法很简单：与其手动改进某些东西，不如让 AI 代理循环地为你完成这项工作。

![图像](https://pbs.twimg.com/media/HDnlDjwWkAANoH8?format=jpg&name=large)

It tries a small change. Checks if the result got better. Keeps it if it did, throws it out if it didn't.它尝试做一个小改动，检查结果是否有所改善。如果改善了则保留，如果没有改善则舍弃。

Then it does it again. And again.然后它又重复了一遍。又一遍。

He used it for machine learning code. But the method works on **anything you can measure and improve.**他将其用于机器学习代码。但这种方法适用于**任何可以衡量和改进的事物。**

Including the skills you've built in Claude.包括你培养的克劳德的技能。

I took his method and turned it into a skill that works in both Claude Code and Cowork. I just run it on any other skill in my setup.我采用了他的方法，并将其转化为一项可以在 Claude Code 和 Cowork 中通用的技能。我只需在我的设置中将其应用于任何其他技能即可。

I say "run autoresearch on my landing page skill" and it handles the whole thing.我只需说“对我的着陆页技能进行自动研究”，它就能处理所有事情。

## How one loop auto-improves your skills一个循环如何自动提升你的技能

Think of it like this.你可以这样想。

You have a recipe that turns out great 7 out of 10 times. The other 3 times, something's off. Maybe the sauce is bland, maybe the seasoning is wrong.你的食谱十次里有七次都做得非常成功。但剩下的三次，总感觉哪里不对劲。也许是酱汁味道太淡，也许是调味料放错了。

Instead of rewriting the whole recipe from scratch, you **change one ingredient.** You cook it 10 times with that change.你不用从头开始重写整个食谱， **只需改变一种配料。** 然后用这种改变烹饪 10 次。

- Did it get better? Keep the change.情况好转了吗？不用找了。
- Did it get worse? Put the old ingredient back.情况更糟了吗？那就把原来的配料换回去。

Then you change the next thing. Cook 10 more times. Better or worse? Keep or revert.然后你改变下一个步骤。再做十次。更好还是更糟？保留还是恢复原状。

After 50 rounds of this, your recipe works **9.5 out of 10 times.**经过 50 次这样的尝试，你的配方**有 9.5 次成功。**

That's exactly what autoresearch does to your skills.这正是自动搜索对你技能的影响。

- The "recipe" is your skill prompt.“配方”就是你的技能提示。
- The "cooking" is running the skill.“烹饪”指的是运用这项技能。
- The "tasting" is scoring the output.“品尝”指的是对输出结果进行评分。

The only thing you need to provide is the scoring criteria.您只需要提供评分标准即可。

## The checklist that tells the agent exactly what 'good' means这份清单明确告诉经纪人“好”的含义。

You give the agent a simple checklist of what "good" looks like. **That's your only job in this whole process.**你只需要给经纪人一份简单的清单，列出“好”的标准。 **这就是你在整个过程中唯一的工作。**

You do it with a simple checklist of yes/no questions.你只需使用一份简单的是非题清单即可。

Each question checks one specific thing about the output. Pass or fail. That's it.每个问题只检查输出结果的一个特定方面。通过或失败，仅此而已。

The agent uses this checklist to score every output, and those scores tell it whether its changes are helping or hurting.该代理使用此清单对每个输出进行评分，这些分数告诉它所做的更改是有帮助还是有损害。

Think of it like a teacher grading a paper with a checklist.你可以把它想象成老师用清单给论文打分。

But instead of "rate the writing quality 1-10" (which is vague and different every time), each item on the checklist is a **clear yes or no:**但是，清单上的每一项都**明确地回答“是”或“否”，** 而不是像以前那样“给写作质量打分，1-10 分”（这种说法既模糊又每次都不一样） ：

- Did the student include a thesis statement? Yes or no.该学生是否撰写了论文陈述？ 是或否。
- Is every source cited? Yes or no.所有来源都注明了吗？ 是或否。
- Is it under 5 pages? Yes or no.页数少于 5 页吗？ 是或否。

You can grade 100 papers with that checklist and get **consistent results every time.**使用这份检查清单，您可以批改 100 份试卷，并且**每次都能得到一致的结果。**

Same idea here. For a landing page copy skill, your checklist might look like:道理是一样的。对于着陆页文案撰写技巧，你的检查清单可能如下所示：

- "Does the headline include a specific number or result?" (catches vague headlines like "Grow Your Business")“标题是否包含具体数字或结果？” （可以识别出诸如“发展您的业务”之类的模糊标题）
- "Is the copy free of buzzwords like 'revolutionary,' 'synergy,' 'cutting-edge,' 'next-level'?"“文案中是否没有‘革命性的’、‘协同效应’、‘尖端的’、‘更高层次的’之类的流行语？”
- "Does the CTA use a specific verb phrase?" (catches weak CTAs like "Learn More" or "Click Here")“行动号召是否使用了特定的动词短语？” （可以识别出诸如“了解更多”或“点击此处”之类的弱行动号召）
- "Does the first line call out a specific pain point?" (catches generic openers like "In today's fast-paced world...")“第一句话是否指出了具体的痛点？” （可以识别出诸如“在当今快节奏的世界里……”之类的通用开头）
- "Is the total copy under 150 words?" (catches bloated pages that lose the reader)“全文是否少于 150 字？” （可以发现冗长的篇幅，避免读者流失）

You don't need to figure these out on your own. When you start the autoresearch, the agent walks you through it.您无需自行摸索。当您开始自动搜索时，代理人会引导您完成整个过程。

It asks what good looks like, helps you turn your vibes into specific yes/no questions, and even offers to pull from existing style guides if you have them.它会询问你认为好的风格是什么样的，帮助你将你的感觉转化为具体的是/否问题，甚至还提供从现有的风格指南中汲取灵感的功能（如果你有的话）。

**3-6 questions is the sweet spot.** More than that and the skill starts gaming the checklist (like a student who memorizes the answers without understanding the material).**3-6 道题是最佳数量。** 超过这个数量，答题技巧就开始变通，就像学生死记硬背答案而不理解内容一样。

## Here's how to run it以下是运行方法

**Step 1: Download the skill.** Grab it [here](https://www.dropbox.com/scl/fi/57v11vtj9gzqz10ybv7or/autoresearch.zip?rlkey=f0zbieol7beeykn04erun79ot&dl=1). Drop it into your skills folder in Claude Code or Cowork.**第一步：下载技能。** 获取它[这里](https://www.dropbox.com/scl/fi/57v11vtj9gzqz10ybv7or/autoresearch.zip?rlkey=f0zbieol7beeykn04erun79ot&dl=1)将其拖放到 Claude Code 或 Cowork 的技能文件夹中。

**Step 2: Pick a skill to improve.** Say "run autoresearch on my \[skill name\] skill." Pick the one that annoys you most. The one where you get a great output half the time and garbage the other half.**第二步：选择一项技能进行提升。** 输入“自动研究我的\[技能名称\]技能”。选择你最恼火的那项技能。就是那种一半时间成果丰硕，另一半时间却一无是处的技能。

**Step 3: The agent asks you 3 things.** Which skill to optimize. What test inputs to use (like "write landing page copy for an AI productivity tool"). And what your checklist questions are.**步骤 3：代理会问你 3 件事。** 要优化哪项技能？使用哪些测试输入（例如“为 AI 生产力工具编写着陆页文案”）？以及你的检查清单问题是什么？

**Step 4: It runs your skill and shows you your starting score.** This is the baseline. My landing page skill started at **56%.** Vague headlines, buzzword soup, weak CTAs. More than half the checks were failing.**第四步：它会运行你的技能测试并显示你的初始分数。** 这是基准线。我的落地页技能初始分数是 **56%。** 标题含糊不清，充斥着流行语，行动号召力薄弱。超过一半的测试项目都失败了。

**Step 5: It opens a live dashboard in your browser.** Score chart going up over time. Pass/fail breakdown for each checklist question. A log of every change it tried. Auto-refreshes every 10 seconds.**第五步：它会在您的浏览器中打开一个实时仪表盘。** 分数图表会随时间推移而上升。每个检查清单问题的通过/未通过情况细分。记录每次尝试的更改。每 10 秒自动刷新一次。

**Step 6: Walk away.** The agent enters the loop. Analyzes what's failing. Makes one small change to the skill prompt. Tests again. Keeps the change if the score goes up, undoes it if it goes down.**步骤 6：离开。** 智能体进入循环。分析失败原因。对技能提示进行一处小改动。再次测试。如果分数提高，则保留改动；如果分数降低，则撤销改动。

Then does it again. And again. It keeps going **autonomously** until you stop it or it hits 95%+ three times in a row.然后它又重复一遍。一遍又一遍。它会一直**自主**运行 ，直到你把它叫停，或者它连续三次达到 95% 以上为止。

You can watch the dashboard or walk away entirely. It runs without you. And it saves the improved version as a separate file, so your original skill stays untouched.你可以看着控制面板，也可以完全离开。它会在你不注意的情况下运行。而且它会将改进后的版本保存为一个单独的文件，所以你的原始技能不会受到影响。

## What happened to my landing page skill我的落地页设计技能怎么了？

I ran it on my landing page copy skill. Here's what came back:我用它测试了一下我的落地页文案撰写能力。以下是结果：

**56% → 92%.** 4 rounds of changes. 3 kept, 1 undone.**56% → 92%。** 共修改 4 轮，保留 3 轮，撤销 1 轮。

Here's what the agent actually changed in my skill prompt:以下是代理人实际修改我的技能提示的内容：

- **Added a specific rule** for the most common failure: "Your headline must include a specific number or result. Never use vague promises like 'Transform Your Business.'"针对最常见的错误， **新增了一条具体规则** ：“你的标题必须包含具体的数字或结果。切勿使用‘改变你的企业’之类的模糊承诺。”
- **Added a banned buzzwords list:** "NEVER use: revolutionary, cutting-edge, synergy, next-level, game-changing, leverage, unlock, transform."**新增禁用流行语列表：** “绝对禁止使用：革命性的、尖端的、协同作用、下一级、颠覆性的、利用、解锁、转变。”
- **Added a worked example** of a strong landing page section with the pain point opener and CTA highlighted, so the skill could see what good looks like instead of guessing.**添加了一个优秀的着陆页示例，** 其中突出了痛点开头和 CTA，以便技能可以了解好的着陆页是什么样子，而不是靠猜测。
- **Tried a tighter word count, undid it** because the copy got too thin and the CTA suffered. (The system catches changes that seem like improvements in isolation but hurt the overall output.)**尝试过减少字数，但后来又改回去了，** 因为文案太单薄，行动号召效果也不好。（系统会检测到一些看似改进实则损害整体效果的改动。）

When it was done, I got:完成后，我得到了：

- **The improved skill**, saved separately (the original stays untouched in case you want to revert)**改进后的技能**会单独保存（原始技能保持不变，以防您想要恢复）。
- **A results log** showing every round's score**结果记录**显示每一轮的得分
- **A changelog** explaining every change that was tried, why the agent tried it, and whether it helped**一份变更日志，** 解释尝试过的每一次更改、代理尝试更改的原因以及更改是否有效。
- **A backup** of my original skill in case I ever want to go back**备份**我的原始技能，以防我以后想重拾这项技能。

That changelog is probably the most valuable piece. It's a complete record of what works and what doesn't for that specific skill.那份变更日志可能是最有价值的部分。它完整地记录了针对特定技能哪些方法有效，哪些无效。

When smarter models come out down the road, you hand them that changelog and they **pick up right where the last agent left off.**将来如果出现更智能的模型，你只需把变更日志交给它们，它们就能**从上一个代理完成的工作继续下去。**

## This works on way more than skills这不仅仅关乎技能。

The method works on **anything you can score.**这种方法适用于**任何你能得分的东西。**

- **Website speed:** One person ran this on page load time. Changed one thing, measured the speed, kept or reverted. Went from **1100ms to 67ms** in 67 rounds.**网站速度：** 由一人测试页面加载时间。每次只更改一个参数，测量速度，然后决定保留或恢复原状。 经过 67 轮测试，速度从 **1100 毫秒降至 67 毫秒** 。
- **Cold outreach:** Define your checklist: "Does it mention the prospect's company? Is it under 75 words? Does it end with a specific question?" Let the agent run 50 variations.**陌生拜访：** 制定检查清单：“是否提及潜在客户的公司？是否少于 75 个字？是否以具体问题结尾？”让销售人员尝试 50 个不同的版本。
- **Newsletter intros:** "Does the opener include a personal detail?" and "Is it free of cliche phrases?" Let the agent tighten your writing on autopilot.**电子报开头：** “开头是否包含个人细节？”以及“是否避免了陈词滥调？”让经纪人自动帮你精简文稿。
- **Any prompt you use repeatedly你反复使用的任何提示**

If you can score it, you can autoresearch it.如果能给它评分，就可以自动进行研究。

## Go run it去跑吧

Pick your worst-performing skill. Start the autoresearch. Come back to something that actually works.选择你表现最差的技能。启动自动搜索。然后回来查看一些真正有效的方法。

**Download the skill** [here](https://www.dropbox.com/scl/fi/57v11vtj9gzqz10ybv7or/autoresearch.zip?rlkey=f0zbieol7beeykn04erun79ot&dl=1) **(uploaded to dropbox) Or check my github** [here](https://github.com/olelehmann100kMRR/autoresearch-skill)**下载该技能**[这里](https://www.dropbox.com/scl/fi/57v11vtj9gzqz10ybv7or/autoresearch.zip?rlkey=f0zbieol7beeykn04erun79ot&dl=1) **（已上传至 Dropbox）** 或者查看我的 GitHub [这里](https://github.com/olelehmann100kMRR/autoresearch-skill)

P.S. If you want more AI workflows that help you get more customers, more attention, and more done (without working more hours), I send them to 34k readers every week for free.PS：如果您想要更多能帮助您获得更多客户、更多关注和更多工作的 AI 工作流程（而无需增加工作时间），我每周都会免费向 34000 名读者发送这些工作流程。

Plus you get a free Claude Cowork masterclass when you join: [aisolo.beehiiv.com/subscribe](http://aisolo.beehiiv.com/subscribe)此外，加入即可免费获得 Claude Cowork 大师课程： [aisolo.beehiiv.com/subscribe](http://aisolo.beehiiv.com/subscribe)