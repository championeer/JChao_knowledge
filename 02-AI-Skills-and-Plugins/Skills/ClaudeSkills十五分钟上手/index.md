---
title: "How to Set Up Claude Skills in <15 Minutes (for Non-Technical People)    如何在 15 分钟内设置 Claude 技能（非技术人员指南）"
source: "https://www.reddit.com/r/ClaudeAI/comments/1onjxs9/how_to_set_up_claude_skills_in_15_minutes_for/?rdt=54858"
author:
  - "[[chasing_next]]"
published: 2025-11-04
created: 2025-11-05
description:
tags:
  - "clippings"
---
if you're not using claude skills you're missing out.  
如果你还没使用 Claude 技能，那可就亏大了。

they can seem intimidating but they're actually stupid simple to set up. here's how (images in the link below):  
这些功能看起来复杂，但其实设置起来简单得离谱。具体步骤如下（图文教程见下方链接）：

1/ make sure claude skills are enabled within settings > capabilities > skills  
1/ 确保在设置 > 功能 > 技能中已启用 Claude 技能

2/ turn on the "skill-creator" skill under skills within settings. this is the meta-skill that you use to have claude build other skills for you  
2/ 在设置中的技能选项下启用“技能创建器”技能。这是一个元技能，用于让 Claude 为你构建其他技能

3/ open a new chat window and ask claude to use the "skill-creator" skill to help you create a new skill  
3/ 打开一个新聊天窗口，要求 Claude 使用“技能创建器”技能帮助你创建新技能

4/ describe the skill you want to create in detail, be specific about the output you need (you can also have an existing project be turned into a skill by asking the project to use "skill-creator" to turn the project into a skill)  
4/ 详细描述你想要创建的技能，明确说明所需的输出内容（你也可以让现有项目通过调用“技能创建器”将项目转化为技能）

5/ claude will probably ask some clarifying questions, then build out the complete skill file and a read-me document  
5/ Claude 可能会询问一些澄清性问题，随后会生成完整的技能文件和说明文档

6/ read the read-me document and download the skill file it creates. this tells you what it created and your next steps to get it working  
6/ 阅读自述文档并下载它生成的技能文件。这能告诉你它创建了什么以及让技能生效的后续步骤。

7/ go back to settings > capabilities > skills > upload skills. select the file you downloaded and upload it. it'll add it to your skills list. make sure the toggle is on so you know it's live  
7/ 返回设置 > 功能 > 技能 > 上传技能。选择你下载的文件并上传，它会添加到你的技能列表中。确保开关已开启，这样你就知道它正在运行中。

8/ test it in a new chat by asking claude to use your skill by name  
8/ 在新聊天中测试它，让 Claude 按名称使用你的技能

9/ if your skill isn't creating the output you need, go back to the conversation you created the skill in and tell it what you want to change (if you make an edit, you'll need to upload the new version of the skills file in settings & turn the old version off)  
9/ 如果技能输出不符合预期，返回创建该技能的对话并说明需要修改的内容（若进行编辑，需在设置中上传新版技能文件并关闭旧版本）

start with something simple (something you already do regularly already). you'll figure out the rest as you go.  
从简单任务开始（最好是日常重复性工作）。熟能生巧。

step by step w/ visuals: [https://www.chasingnext.com/this-15-minute-claude-upgrade-will-change-how-you-work/](https://www.chasingnext.com/this-15-minute-claude-upgrade-will-change-how-you-work/)  
图文分步指南：https://www.chasingnext.com/this-15-minute-claude-upgrade-will-change-how-you-work/

---

## Comments

> **Megapixelicious** • [7 points](https://reddit.com/r/ClaudeAI/comments/1onjxs9/comment/nmxejru/) •
> 
> I am still trying to figure out the benefit of using skills. I have seen some toy examples (ex: business colour scheme), but in real life, what are the benefits vs using / commands? Ex: I have a / command to run my tests and act on it. Is there a benefit to have a skill run the CLI test runner?  
> 我仍在尝试理解使用技能的好处。我见过一些玩具示例（比如：商业配色方案），但在现实生活中，相比使用/命令，它有什么优势？例如：我有一个/命令来运行测试并据此行动。让技能运行 CLI 测试运行器有什么好处吗？
> 
> > **chasing\_next** • [2 points](https://reddit.com/r/ClaudeAI/comments/1onjxs9/comment/nmxfkq4/) •
> > 
> > I think the value is more for non-technical people to set up structured processes within the interface, less so for someone already running commands and scripts.  
> > 我认为其价值更多在于让非技术人员在界面内设置结构化流程，对于已经能运行命令和脚本的人来说，价值相对较小。
> > 
> > > **Plinian** • [2 points](https://reddit.com/r/ClaudeAI/comments/1onjxs9/comment/nmyfvxe/) •
> > > 
> > > Yeah, I'm not a technical person here at all, but they are great for me because they force semi-consistent processes and outputs. If I want to review a few different reports with a similar process I use a specific skill.  
> > > 是的，我完全不是技术人员，但技能对我来说非常棒，因为它们强制实现了半一致的流程和输出。如果我想用类似的流程审阅几份不同的报告，我就会使用特定的技能。
> > > 
> > > And OP was right, the skill build skill is super helpful. If I find an output or process that I like, I build a skill. I repeat that skill for similar tasks and get comparable results.  
> > > 确实，楼主说得对，技能构建功能非常实用。如果我遇到喜欢的输出或流程，就会构建一个技能。对于类似的任务，我会重复使用这个技能，并获得相当的结果。
> > > 
> > > **hyperstarter** • [1 points](https://reddit.com/r/ClaudeAI/comments/1onjxs9/comment/nmyy9fm/) •
> > > 
> > > What's the difference with say, uploading a detailed .md file in the prompt window?  
> > > 与在提示窗口上传详细的.md 文件相比，这有什么不同呢？
> > > 
> > > Skills and situations change all the time. I saw there was a cool debugger skill, then realised agents can do that anyway...  
> > > 技能和情况总是在变化。我之前看到一个很酷的调试技能，但后来发现代理本身就能做到这一点……
> > > 
> > > On the surface, it just seems like a great way to eat up tokens.  
> > > 表面上，这似乎只是消耗代币的一种好方法。
> 
> **Suitable-Opening3690** • [1 points](https://reddit.com/r/ClaudeAI/comments/1onjxs9/comment/nmyyftj/) •
> 
> This is my issue. They’re removing out styles something immediately useful and a lot of us have done and replaced it with these skills that are god damn useless.  
> 这就是我的问题。他们取消了我们许多人一直在用的、立即可用的样式功能，却换成了这些该死的毫无用处的技能。
> 
> **Back\_on\_redd** • [1 points](https://reddit.com/r/ClaudeAI/comments/1onjxs9/comment/nn17yj8/) •
> 
> Remove process from Claude.md and create a reference ale and callable skill for it. It’s context management but also organization and delegation  
> 从 Claude.md 中移除流程，并为其创建可引用和调用的技能参考。这既是上下文管理，也涉及组织与委派。

> **luckexe** • [2 points](https://reddit.com/r/ClaudeAI/comments/1onjxs9/comment/nn0omyf/) •
> 
> Biggest issue so far is that claude does not use the skills even if I call them out by name. It’s just a bad design.  
> 目前最大的问题是，即使我按名称调用这些技能，Claude 也不会使用它们。这纯粹是糟糕的设计。

> **BingpotStudio** • [3 points](https://reddit.com/r/ClaudeAI/comments/1onjxs9/comment/nmye37y/) •
> 
> IMO skills are monstrous when used to define workflows for sub agents.  
> 在我看来，当技能被用来定义子代理的工作流程时，它们简直糟糕透顶。
> 
> I create “Director Skills” to do this, for example, my Spec Director:  
> 我创建了"导演技能"来实现这一点，例如我的 Spec Director：
> 
> 1. gathers context, documentation and scripts and questions the user first.  
> 	首先收集背景信息、文档资料和脚本，并向用户提问
> 2. passes brief on to Project Spec agent - builds an initial technical document that lays out requirements, dependencies, schemas, api contracts etc etc  
> 	将简报传递给项目规范代理 - 创建初步技术文档，列出需求、依赖项、架构、API 合约等内容
> 3. passes product spec onto Feature Agent - builds product spec into features and groups them into dependencies to determine order of operations and parallel work streams. Also determines acceptance criteria per feature.  
> 	将产品规范传递给功能代理 - 将产品规范拆解为具体功能，按依赖关系分组以确定执行顺序和并行工作流程。同时为每个功能制定验收标准
> 4. passes brief, project spec and feature spec onto review agent - reviews if specs meet the brief and confers with codex for a second opinion. Writes a full damning report  
> 	将项目概要、项目规范和功能规范交给审查代理——审查规范是否符合概要，并与代码专家协商获取第二意见。撰写一份全面的批评报告
> 5. human intervention - send feedback back into the process or proceed.  
> 	人工介入——将反馈送回流程或继续推进。
> 
> Got a whole host of directors I’m building out. Particularly keen to get cracking on agents specifically designed to find dead code and out of date documentation.  
> 我正在构建一整套指导器，特别热衷于开发专门用于发现死代码和过时文档的代理。
> 
> Built similar processes for unit tests and next I’m building an orchestrator skill that is the master of all directors - ensures they proceed in order and maintains a registry of files between them.  
> 已为单元测试构建了类似流程，接下来我正在构建一个协调器技能，作为所有指导器的主控——确保它们按顺序执行，并维护它们之间的文件注册表。
> 
> I’ve also built smaller systems for creating registries that match documentation to scripts and parameters to documentation and examples. These agents are then questioned when main clause or any other agent wants to know something. Saves them valuable tokens not scanning docs and scripts.  
> 我还构建了一些小型系统，用于创建将文档与脚本匹配的注册表，以及将参数与文档和示例关联的注册表。当主代理或其他任何代理需要查询信息时，就会询问这些代理。这样能节省宝贵的使用额度，避免反复扫描文档和脚本。
> 
> To be honest, I’ve completely derailed my project building agents instead.  
> 说实话，我完全偏离了原计划，现在整天都在构建各种代理。
> 
> Just wish I could work out how on earth to get the bloody permissions to work so that I don’t have to constantly accept them.  
> 就是搞不明白怎么才能让那些该死的权限设置正常工作，这样我就不用一直手动授权了。
> 
> > **SpartanG01** • [1 points](https://reddit.com/r/ClaudeAI/comments/1onjxs9/comment/nn0rvaa/) •
> > 
> > I'm confused about what this means. Do you have multiple independent agents configured in claude code or are you using some sort of orchestration serice?  
> > 没太明白这是什么意思。你是在 Claude 代码里配置了多个独立代理，还是用了某种编排服务？
> > 
> > > **BingpotStudio** • [1 points](https://reddit.com/r/ClaudeAI/comments/1onjxs9/comment/nn0tlkw/) •
> > > 
> > > You can setup what’s called sub agents. They are super powerful because they get their own context window and thus your main session doesn’t hit its 200k token limit as fast nor does it pollute its context.  
> > > 你可以设置所谓的子代理。它们非常强大，因为拥有独立的上下文窗口，这样你的主会话就不会那么快达到 20 万标记的限制，也不会污染其上下文。
> > > 
> > > So for example one subagent of mine fetches information from my documentation and can be queried like you would query google. That stops my main agent in the session running through 4 pieces of documentation to find the answer to 1 thing.  
> > > 例如，我的一个子代理能够从我的文档中获取信息，并能像使用谷歌搜索一样进行查询。这样一来，我的主代理在会话中就不必翻阅四份文档来寻找一个问题的答案了。
> > > 
> > > Subagents are autonomous, so you need to set them up to do so one thing very well. They don’t share context, which means they don’t know what’s happened in your current session and what they do won’t be shared either. This means you need explicit instruction on what information you’ll pass to them and what you want back.
> > > 
> > > Often the best use is to write MD files, pass them to the subagent and have them write MD files and pass them back. This is acting as its own context window that’s permanent and can be shared across sub agents and session.
> > > 
> > > They can also run in parallel. Got 5 sections of code to write that are all independent? Spin up 5 agents. But those agents won’t tell you what they’re doing, they don’t have a conversation with you, so that’s why you want them to document what they do.
> > > 
> > > I’ve probably confused you so I suggest you do some research on it.

> **TheTideEbbs** • [1 points](https://reddit.com/r/ClaudeAI/comments/1onjxs9/comment/nmyp2jt/) •
> 
> What's an example to use/create a skill for someone who is writing a story?
> 
> > **chasing\_next** • [1 points](https://reddit.com/r/ClaudeAI/comments/1onjxs9/comment/nmyucp0/) •
> > 
> > skills are best for repeat tasks to bring consistency & avoid reprompting.
> > 
> > is there anything you do over and over?
> > 
> > ex:  
> > \- if you were writing multiple short stories & wanted AI to edit them with specific guidance, tone, or things to look for.  
> > \- if you wanted to use AI to create consistent image prompts for the story for another AI to generate from.  
> > \- if ai was helping draft the content you could give it writing instructions (tone, style, context on process)
> > 
> > > **TheTideEbbs** • [2 points](https://reddit.com/r/ClaudeAI/comments/1onjxs9/comment/nn0l2be/) •
> > > 
> > > Huh, those are good points. I usually have to paste the instructions for each chapter to make sure it follows them but creating a skill around it sounds cool

> **Back\_on\_redd** • [1 points](https://reddit.com/r/ClaudeAI/comments/1onjxs9/comment/nn181j2/) •
> 
> Am I the only one that had Claude create my skills for me from previous process docs/refs I had in Claude.md?