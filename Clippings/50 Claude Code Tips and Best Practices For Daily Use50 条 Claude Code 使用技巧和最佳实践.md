---
title: "50 Claude Code Tips and Best Practices For Daily Use50 条 Claude Code 使用技巧和最佳实践"
source: "https://x.com/CodevolutionWeb/status/2034683638382506063"
author:
  - "[[Unknown]]"
published: 2026-03-20
created: 2026-03-20
description:
tags:
  - "clippings"
---
You've been using [Claude Code](https://www.builder.io/blog/claude-code) long enough to know it works, and now you're hunting for every edge you can find. I put together 50 Claude Code best practices and tips that help whether you're one week in or several months deep, sourced from Anthropic's official docs, Boris Cherny (the person who built it), community experience, and a year of my own daily usage.你一直在使用[克劳德·科德](https://www.builder.io/blog/claude-code)用了足够长的时间，你就知道它有效，现在你正竭尽所能地寻找各种提升空间。我整理了 50 条 Claude Code 的最佳实践和技巧，无论你是刚开始使用一周还是已经用了几个月，都能从中受益。这些内容来源于 Anthropic 的官方文档、Boris Cherny（Claude Code 的创始人）的经验、社区的实践以及我一年来的日常使用经验。

## 1\. Set up the cc alias1. 设置抄送别名

This is how I start every Claude Code session. Add this to your **~/.zshrc** (or **~/.bashrc**):这是我启动每次 Claude Code 会话的方式。请将此添加到您的 **~/.zshrc** （或 **~/.bashrc** ）文件中：

```bash
alias cc='claude --dangerously-skip-permissions'
```

Run **source ~/.zshrc** to load it. Now you type **cc** instead of **claude**, and you skip every permission prompt. The flag name is intentionally scary. Only use it after you fully understand what Claude Code can and will do to your codebase. I covered this and more aliases in [customizing Claude Code](https://www.builder.io/blog/claude-code-settings).运行 **\`source ~/.zshrc\`** 来加载它。现在，你只需输入 **\`cc\`** 而不是 **\`claude\`** ，即可跳过所有权限提示。这个标志名称故意让人望而生畏。只有在你完全了解 Claude Code 会对你的代码库做什么之后，才可以使用它。我在\[此处插入链接\]中详细介绍了这一点以及更多别名。 [自定义 Claude Code](https://www.builder.io/blog/claude-code-settings) 。

## 2\. Prefix ! to run bash commands inline2. 在 bash 命令前加 ! 可直接运行 bash 命令

Type **!git status** or **!npm test** and the command runs immediately. The command and its output land in context, so Claude can see the result and act on it. It's faster than asking Claude to run a command.输入 **\`!git status\`** 或 **\`!npm test\`** ，命令会立即运行。命令及其输出会显示在上下文中，因此 Claude 可以看到结果并进行相应的操作。这比让 Claude 运行命令要快得多。

## 3\. Hit Esc to stop Claude. Hit Esc+Esc to rewind anything.3. 按 Esc 键停止克劳德。按 Esc+Esc 键倒退任何内容。

Esc stops Claude mid-action without losing context. You can redirect immediately.按下 Esc 键可以停止 Claude 的操作，而不会丢失上下文。您可以立即进行其他操作。

Esc+Esc (or **/rewind**) opens a scrollable menu of every checkpoint Claude has created. You can restore the code, the conversation, or both. "Undo that" works too. Four restore options: code and conversation, conversation only, code only, or summarize from a checkpoint forward.Esc+Esc（或 **/rewind** ）会打开一个可滚动的菜单，其中列出了 Claude 创建的所有检查点。您可以恢复代码、对话或两者都恢复。“撤销”功能也有效。恢复选项有四种：代码和对话、仅对话、仅代码，或从某个检查点开始进行摘要恢复。

This means you can try the approach you're only 40% sure about. If it works, great. If not, rewind. Zero damage done. One caveat: checkpoints only track file edits. Changes from bash commands (migrations, database operations) aren't captured.这意味着你可以尝试一种你只有 40% 把握的方法。如果成功，那就太好了。如果失败，可以撤销操作。不会造成任何损失。但需要注意的是：检查点只会跟踪文件编辑。bash 命令（例如迁移、数据库操作）造成的更改不会被记录。

To pick up where you left off, **claude --continue** resumes your most recent conversation and **claude --resume** opens a session picker.要继续上次的对话， **claude --continue** 会继续您最近的对话，而 **claude --resume** 会打开一个会话选择器。

## 4\. Give Claude a way to check its own work4. 给克劳德一种方法来检查它自己的工作

Give Claude a feedback loop so it catches its own mistakes. Include test commands, linter checks, or expected outputs in your prompt.给 Claude 一个反馈循环，让它能够发现自身的错误。在提示符中包含测试命令、代码检查或预期输出。

```markdown
Refactor the auth middleware to use JWT instead of session tokens.
Run the existing test suite after making changes.
Fix any failures before calling it done.
```

Claude runs the tests, sees failures, and fixes them without you stepping in. Boris Cherny [says this alone gives a 2-3x quality improvement](https://x.com/bcherny/status/2007179861115511237). For UI changes, set up the [Playwright MCP server](https://www.builder.io/blog/claude-code-playwright-mcp-server) so Claude can open a browser, interact with the page, and verify the UI works as expected. That feedback loop catches issues that unit tests miss.克劳德会运行测试，发现错误并自行修复，无需你干预。——鲍里斯·切尔尼[仅此一项就能带来 2-3 倍的质量提升。](https://x.com/bcherny/status/2007179861115511237) 对于用户界面更改，请进行设置。 [剧作家 MCP 服务器](https://www.builder.io/blog/claude-code-playwright-mcp-server)这样，克劳德就可以打开浏览器，与页面交互，并验证用户界面是否按预期工作。这种反馈循环可以发现单元测试遗漏的问题。

## 5\. Install a code intelligence plugin for your language5. 为您的语言安装代码智能插件

LSP plugins give Claude automatic diagnostics after every file edit. Type errors, unused imports, missing return types. Claude sees and fixes issues before you even notice them. This is the single highest-impact plugin you can install.LSP 插件能让 Claude 在每次文件编辑后自动进行诊断，例如类型错误、未使用的导入语句和缺失的返回类型。Claude 甚至在你注意到问题之前就能发现并修复它们。这是你能安装的最具影响力的插件。

Pick yours and run the install command:选择你的版本并运行安装命令：

```bash
/plugin install typescript-lsp@claude-plugins-official
/plugin install pyright-lsp@claude-plugins-official
/plugin install rust-analyzer-lsp@claude-plugins-official
/plugin install gopls-lsp@claude-plugins-official
```

Plugins for C#, Java, Kotlin, Swift, PHP, Lua, and C/C++ are also available. Run /plugin and go to the Discover tab to browse the full list. You'll need the corresponding language server binary installed on your system (the plugin will tell you if it's missing).插件支持 C#、Java、Kotlin、Swift、PHP、Lua 和 C/C++。运行 \`/plugin\` 命令并转到“发现”选项卡即可浏览完整列表。您需要在系统上安装相应的语言服务器二进制文件（插件会提示是否缺少该文件）。

## 6\. Use the gh CLI and teach Claude any CLI tool6. 使用 gh 命令行界面，并教 Claude 使用任何命令行工具。

The [gh CLI](https://cli.github.com/) handles PRs, issues, and comments without a separate MCP server. CLI tools are more context-efficient than MCP servers because they don't load tool schemas into your context window. Same applies to jq, curl, and other standard CLI tools.这 [gh CLI](https://cli.github.com/) 它无需单独的 MCP 服务器即可处理 PR、问题和评论。CLI 工具比 MCP 服务器更高效，因为它们不会将工具模式加载到上下文窗口中。jq、curl 和其他标准 CLI 工具也同样如此。

For tools Claude doesn't know yet: "Use 'sentry-cli --help' to learn about it, then use it to find the most recent error in production." Claude reads the help output, figures out the syntax, and runs the commands. Even niche internal CLIs work.对于克劳德还不熟悉的工具，他会说：“用‘sentry-cli --help’了解一下，然后用它查找生产环境中最近的错误。”克劳德阅读帮助输出，弄懂语法，然后运行命令。即使是一些小众的内部命令行工具也能用。

## 7\. Add "ultrathink" for complex reasoning7. 添加“超强思维”以进行复杂推理

It's a keyword that sets effort to high and triggers adaptive reasoning on Opus 4.6. Claude dynamically allocates thinking based on the problem. Use it for architecture decisions, tricky debugging, multi-step reasoning, or anything where you want Claude to think before acting.这是一个关键字，它会将工作量设置为高，并在 Opus 4.6 中触发自适应推理。Claude 会根据问题动态分配思考资源。您可以将其用于架构决策、棘手的调试、多步骤推理，或者任何您希望 Claude 在行动前进行思考的场景。

You can also set effort permanently with **/effort**. For less complex tasks, lower effort levels keep things fast and cheap. Match the effort to the problem. There's no point burning thinking tokens on a variable rename.你也可以使用 **\`/effort\`** 永久设置任务难度 。对于不太复杂的任务，较低的难度可以保证速度快、成本低。根据问题的具体情况来调整难度。没必要把思考点数浪费在变量重命名上。

## 8\. Leverage skills for on-demand knowledge8. 利用技能获取按需知识

Skills are markdown files that extend Claude's knowledge on demand. Unlike [CLAUDE.md](http://claude.md/) which loads every session, skills load only when relevant to the current task. This keeps your context lean.技能是 Markdown 文件，可以根据需要扩展 Claude 的知识。 [CLAUDE.md](http://claude.md/) 每个会话都会加载技能，但技能仅在与当前任务相关时才会加载。这样可以保持上下文简洁。

Create skills in **.claude/skills/** or install plugins that bundle pre-built skills (run **/plugin** to browse what's available). Use skills for specialized domain knowledge (API conventions, deployment procedures, coding patterns) that Claude needs sometimes but not always.在 **.claude/skills/ 目录**下创建技能 ， 或者安装包含预置技能的插件（运行 **/plugin 命令**浏览可用技能）。使用技能来学习 Claude 有时需要但并非总是需要的特定领域知识（例如 API 规范、部署流程、编码模式）。

## 9\. Control Claude Code from your phone9. 通过手机控制 Claude Code

Run **claude remote-control** to start a session, then connect to it from [claude.ai/code](https://claude.ai/code) or the Claude app on iOS/Android. The session runs locally on your machine. The phone or browser is just a window into it. You can send messages, approve tool calls, and monitor progress from anywhere.运行 **claude remote-control** 来启动会话，然后从该会话连接到它。 [claude.ai/code](https://claude.ai/code) 或者使用 iOS/Android 上的 Claude 应用。会话在您的本地计算机上运行。手机或浏览器只是一个窗口。您可以随时随地发送消息、批准工具调用并监控进度。

If you're using the **cc** alias from tip #1, Claude already has full permissions and won't need approval for each action. That makes remote control even smoother: kick off a task, walk away, and check in from your phone only when Claude finishes or hits something unexpected.如果您使用技巧 1 中提到的 **cc** 别名，Claude 已经拥有全部权限，无需每次操作都获得批准。这使得远程控制更加流畅：启动任务后，您可以离开，只需在 Claude 完成任务或遇到意外情况时通过手机查看即可。

## 10\. Extend your context window to 1M tokens10. 将上下文窗口扩展到 100 万个令牌

Both Sonnet 4.6 and Opus 4.6 support 1M token context windows. On Max, Team, and Enterprise plans, Opus is automatically upgraded to 1M context. You can also switch models mid-session with **/model opus\[1m\]** or **/model sonnet\[1m\]**.Sonnet 4.6 和 Opus 4.6 都支持 100 万个令牌的上下文窗口。在 Max、Team 和 Enterprise 套餐中，Opus 会自动升级到 100 万上下文。您也可以在会话期间使用 **/model opus\[1m\]** 或 **/model sonnet\[1m\] 命令**切换模型 。

If you're concerned about quality at larger context sizes, start at 500k and work up gradually. Higher context means more room before compaction kicks in, but response quality can vary depending on the task. Use **CLAUDE\_CODE\_AUTO\_COMPACT\_WINDOW** to control when compaction triggers, and **CLAUDE\_AUTOCOMPACT\_PCT\_OVERRIDE** to set the percentage threshold. Find the sweet spot for your workflow.如果您担心较大上下文大小下的质量，请从 500k 开始逐步增加。更大的上下文意味着在压缩生效前有更大的空间，但响应质量可能会因任务而异。使用 **CLAUDE\_CODE\_AUTO\_COMPACT\_WINDOW** 控制压缩触发时间，并使用 **CLAUDE\_AUTOCOMPACT\_PCT\_OVERRIDE** 设置百分比阈值。找到适合您工作流程的最佳平衡点。

## 11\. Use Plan Mode when you're not sure how to approach something11. 当你不确定如何处理某件事时，请使用计划模式。

Use [Plan Mode](https://www.builder.io/blog/claude-code-plan-mode) for multi-file changes, unfamiliar code, and architectural decisions. The overhead is real (a few extra minutes upfront), but it prevents Claude from spending 20 minutes confidently solving the wrong problem entirely.使用[计划模式](https://www.builder.io/blog/claude-code-plan-mode)对于多文件更改、不熟悉的代码和架构决策，这确实会带来额外的开销（前期需要多花几分钟），但它可以防止克劳德白白浪费 20 分钟，自信满满地解决一个完全错误的问题。

Skip it for small, clear-scope tasks. If you can describe the diff in one sentence, just do it directly. You can switch into Plan Mode anytime with **Shift+Tab** to cycle between Normal, Auto-Accept, and Plan permission modes without leaving the conversation.对于范围明确、规模较小的任务，可以跳过此步骤。如果可以用一句话描述区别，直接操作即可。您可以随时使用 **Shift+Tab** 切换到计划模式 ，在普通、自动接受和计划权限模式之间切换，而无需离开对话。

## 12\. Run /clear between unrelated tasks12. 在执行不相关任务之间运行 /clear 命令

A clean session with a sharp prompt beats a messy three-hour session. Different task? **/clear** first.一次条理清晰、提示明确的会议胜过一场混乱的三小时会议。任务不同？ **/** 先明确任务。

I know it feels like throwing away progress, but you'll get better results starting fresh. Sessions degrade because accumulated context from earlier work drowns out your current instructions. The five seconds it takes to **/clear** and write a focused starting prompt saves you from 30 minutes of diminishing returns.我知道这感觉像是放弃了之前的努力，但重新开始你会取得更好的结果。会话质量下降是因为之前积累的背景信息会掩盖你当前的指令。花五秒钟**清除日志**并写下一个重点明确的起始提示，就能让你避免浪费 30 分钟时间在效率递减的工作上。

## 13\. Stop interpreting bugs for Claude. Paste the raw data.13. 不要再替克劳德解释错误信息了。直接粘贴原始数据。

Describing a bug in words is slow. You watch Claude guess, correct it, and repeat.用语言描述一个漏洞很慢。你看着克劳德猜测、纠正，然后重复。

Paste the error log, CI output, or Slack thread directly and say "fix." Claude reads logs from distributed systems and traces where things break. Your interpretation adds abstraction that often loses the detail Claude needs to pinpoint the root cause. Give Claude the raw data and get out of the way.直接粘贴错误日志、CI 输出或 Slack 对话，然后说“修复”。Claude 会读取分布式系统的日志，并追踪故障所在。你的解读会增加抽象层，而这往往会丢失 Claude 定位根本原因所需的细节。把原始数据交给 Claude，别碍事。

This works for CI too. "Go fix the failing CI tests" with a paste of the CI output is one of the most reliable patterns. You can also paste a PR URL or number and ask Claude to check the failing checks and fix them. With the gh CLI from tip #6 installed, Claude handles the rest.这同样适用于持续集成 (CI)。“去修复失败的 CI 测试”并粘贴 CI 输出是最可靠的方法之一。你也可以粘贴 PR URL 或编号，让 Claude 检查并修复失败的测试。安装好技巧 #6 中的 gh CLI 后，Claude 会自动处理剩下的工作。

You can also pipe output directly from the terminal:您还可以直接从终端通过管道传输输出：

```bash
cat error.log | claude "explain this error and suggest a fix"
npm test 2>&1 | claude "fix the failing tests"
```

## 14\. Use /btw for quick side questions14. 使用 /btw 进行快速的补充提问

**/btw** pops up an overlay for a quick question without entering your conversation history. I use it for clarifications about the current session: "Why did you choose this approach?" or "What's the tradeoff with the other option?" The answer shows in a dismissible overlay, your main context stays lean, and Claude keeps working.**/btw** 会弹出一个窗口，方便用户快速提问，而无需查看对话记录。我用它来澄清当前会话的一些问题，例如：“你为什么选择这种方法？”或者“另一种方法的优缺点是什么？”答案会以可关闭的窗口形式显示，这样一来，你的主要上下文信息保持简洁，而 Claude 也能继续工作。

## 15\. Use --worktree for isolated parallel branches15. 使用 --worktree 参数可创建隔离的并行分支

**claude --worktree feature-auth** creates an isolated working copy with a new branch. Claude handles the git worktree setup and cleanup for you.**\`claude --worktree feature-auth\` 命令**会创建一个带有新分支的独立工作副本。Claude 会自动处理 Git 工作树的设置和清理工作。

The Claude Code team calls this [one of the biggest productivity unlocks](https://x.com/bcherny/status/2017742743125299476). Spin up 3-5 worktrees, each running its own Claude session in parallel. I usually run 2-3. Each worktree gets its own session, its own branch, and its own file system state.Claude Code 团队称之为[提高生产力的最大途径之一](https://x.com/bcherny/status/2017742743125299476)启动 3-5 个工作树，每个工作树并行运行各自的 Claude 会话。我通常运行 2-3 个。每个工作树都有自己的会话、分支和文件系统状态。

The ceiling on local worktrees is your machine. Multiple dev servers, builds, and Claude sessions all competing for CPU. [Builder.io](https://www.builder.io/) moves each agent to its own cloud container with a browser preview, so your machine stays free for the work that needs your brain.本地工作树的上限就是你的机器。多个开发服务器、构建和 Claude 会话都在争用 CPU。 [Builder.io](https://www.builder.io/) 将每个代理移至其自身的云容器中，并提供浏览器预览，这样您的机器就可以自由地用于需要您动脑筋的工作。

## 16\. Stash your prompt with Ctrl+S16. 使用 Ctrl+S 保存提示符

You're halfway through writing a long prompt and realize you need a quick answer first. **Ctrl+S** stashes your draft. Type your quick question, submit it, and your stashed prompt restores automatically.你写到一半，突然意识到需要先快速回答一个问题。 **按 Ctrl+S** 即可保存草稿。输入你的简短问题，提交后，保存的草稿会自动恢复。

## 17\. Background long-running tasks with Ctrl+B17. 使用 Ctrl+B 启动后台长时间运行的任务

When Claude kicks off a long bash command (a test suite, a build, a migration), press **Ctrl+B** to send it to the background. Claude continues working while the process runs, and you can keep chatting. The result appears when the process finishes.当 Claude 启动一个耗时的 bash 命令（例如测试套件、构建或迁移）时，按下 **Ctrl+B** 即可将其发送到后台运行。Claude 会在进程运行期间继续工作，您也可以继续聊天。进程完成后，结果将显示出来。

## 18\. Add a live status line18. 添加实时状态栏

The status line is a shell script that runs after every Claude turn. It displays live information at the bottom of your terminal: current directory, git branch, context usage color-coded by how full the window is.状态栏是一个 shell 脚本，会在 Claude 每次行动后运行。它会在终端底部显示实时信息：当前目录、git 分支、上下文使用情况（根据窗口填充程度进行颜色编码）。

The fastest way to set one up is **/statusline** inside Claude Code. It'll ask what you want to display and generate the script for you. I covered the full setup with a copy-paste script in [customizing Claude Code](https://www.builder.io/blog/claude-code-settings).最快的设置方法是在 Claude Code 中使用 **\`/statusline\` 命令** 。它会询问你想显示什么内容，并为你生成脚本。我已在文档中提供了完整的设置步骤，并附有复制粘贴的脚本。 [自定义 Claude Code](https://www.builder.io/blog/claude-code-settings) 。

## 19\. Use subagents to keep your main context clean19. 使用子代理来保持主上下文的整洁

"Use subagents to figure out how the payment flow handles failed transactions." This spawns a separate Claude instance with its own context window. It reads all the files, reasons about the codebase, and reports back a concise summary.“使用子代理来确定支付流程如何处理失败的交易。” 这会生成一个独立的 Claude 实例，并拥有自己的上下文窗口。它会读取所有文件，分析代码库，并返回一个简洁的摘要。

Your main session stays clean with plenty of room to build something. A deep investigation can consume half your context window before you write any code. Subagents keep that cost out of your main session. Built-in types include Explore (Haiku, fast file search) and Plan (read-only analysis). For the full picture, see our guide on [subagents and agent teams](https://www.builder.io/blog/claude-code-agents).您的主会话保持简洁，并留有充足的空间进行构建。深入调查可能会占用您一半的上下文窗口，而您甚至无需编写任何代码。子代理可以避免这部分开销占用您的主会话。内置类型包括 Explore（Haiku，快速文件搜索）和 Plan（只读分析）。如需了解完整信息，请参阅我们的指南。 [次级代理人和代理人团队](https://www.builder.io/blog/claude-code-agents) 。

## 20\. Agent teams for multi-session coordination20. 用于多会话协调的代理团队

Experimental but powerful. Enable it first by adding **CLAUDE\_CODE\_EXPERIMENTAL\_AGENT\_TEAMS** to your settings or environment. Then tell Claude to create a team: "Create an agent team with 3 teammates to refactor these modules in parallel." A team lead distributes work to teammates, each with their own context window and a shared task list. Teammates can message each other directly to coordinate.实验性功能，但功能强大。首先，请在设置或环境中添加 **CLAUDE\_CODE\_EXPERIMENTAL\_AGENT\_TEAMS** 以启用此功能 。然后，告诉 Claude 创建一个团队：“创建一个包含 3 名成员的代理团队，以并行重构这些模块。” 团队负责人会将工作分配给团队成员，每位成员都有自己的上下文窗口和一个共享的任务列表。团队成员可以直接互相发送消息进行协调。

Start with 3-5 teammates and 5-6 tasks per teammate. Avoid assigning tasks that modify the same files. Two teammates editing the same file leads to overwrites. Start with research and review tasks (PR reviews, bug investigations) before attempting parallel implementation.开始时安排 3-5 名团队成员，每人 5-6 个任务。避免分配修改同一文件的任务。两名团队成员同时编辑同一个文件会导致文件覆盖。在尝试并行实现之前，先进行研究和审查任务（例如 PR 审查、缺陷调查）。

## 21\. Guide compaction with instructions21. 指导压实并附上说明

When context compacts (automatically or via **/compact**), tell Claude what to preserve: "/compact focus on the API changes and the list of modified files." You can also add standing instructions to your [CLAUDE.md](http://claude.md/): "When compacting, preserve the full list of modified files and current test status."当上下文压缩（自动或通过 **/compact 命令** ）时，告诉 Claude 要保留哪些内容：“/compact 重点关注 API 更改和已修改文件列表。” 您还可以将长期有效的指令添加到您的配置文件中。 [CLAUDE.md](http://claude.md/) “压缩时，请保留已修改文件的完整列表和当前测试状态。”

## 22\. Use /loop for recurring checks22. 使用 /loop 进行重复检查

**/loop 5m check if the deploy succeeded and report back** schedules a recurring prompt that fires in the background while your session stays open. The interval is optional (defaults to 10 minutes) and supports **s**, **m**, **h**, and **d** units. You can also loop over other commands: **/loop 20m /review-pr 1234**. Tasks are session-scoped and expire after 3 days, so a forgotten loop won't run forever. Use **/loop** for monitoring deploys, watching CI pipelines, or polling an external service while you focus on something else.**\`/loop 5m\` 命令用于检查部署是否成功并返回**结果，它会在会话保持打开状态期间在后台循环执行提示。间隔时间是可选的（默认为 10 分钟），支持**秒 (s)** 、 **分 (m)** 、 **小时 (h)** 和**天 (d)** 单位。您还可以循环执行其他命令： **\`/loop 20m /review-pr 1234\`** 。任务作用于会话，并在 3 天后过期，因此即使忘记执行循环，也不会一直运行。您可以使用 **\`/loop\` 命令**来监控部署、观察 CI 流水线或轮询外部服务，同时专注于其他任务。

## 23\. Use voice dictation for richer prompts23. 使用语音输入提供更丰富的提示

Run **/voice** to enable push-to-talk, then hold **Space** to dictate. Your speech transcribes live into the prompt, and you can mix voice and typing in the same message. Spoken prompts naturally include more context than typed ones because you explain the background, mention constraints, and describe what you want without cutting corners to save keystrokes. Requires a [Claude.ai](http://claude.ai/) account (not API key). You can rebind the push-to-talk key to a modifier combo like **meta+k** in **~/.claude/keybindings.json** to skip the hold-detection warmup.运行 **/voice** 启用按键说话功能，然后按住**空格键**进行语音输入。您的语音会实时转录到提示信息中，您可以在同一条消息中混合使用语音和文字输入。语音提示自然比文字提示包含更多上下文信息，因为您可以解释背景、提及限制条件并描述您的需求，而不会为了节省击键次数而偷工减料。需要 [Claude.ai](http://claude.ai/) 账户（非 API 密钥）。您可以在 **~/.claude/keybindings.json 文件**中将一键通键重新绑定到类似 **meta+k 的**组合键 ，以跳过按住检测的预热阶段。

## 24\. After 2 corrections on the same thing, start fresh24. 同一问题修改两次后，重新开始。

When you and Claude are going down a rabbit hole of corrections and the issue still isn't fixed, the context is now full of failed approaches that are actively hurting the next attempt. **/clear** and write a better starting prompt that incorporates what you learned. A clean session with a sharper prompt almost always outperforms a long session weighed down by accumulated dead ends.当你和克劳德陷入各种错误尝试却仍然无法解决问题时，上下文中已经充斥着大量失败的尝试，这些尝试反而会阻碍下一次的尝试。/clear 并编写一个更好的初始提示，将你学到的东西融入其中。一个干净的 **、** 提示更清晰的会话几乎总是比一个冗长且充满死胡同的会话效果更好。

## 25\. Tell Claude exactly which files to look at25. 告诉克劳德具体要查看哪些文件

Use **@** to reference files directly: [@src/auth](https://x.com/@src/auth)**/middleware.ts** has the session handling. The **@** prefix resolves to the file path automatically, so Claude knows exactly where to look.使用 **@** 符号可以直接引用文件： [@src/auth](https://x.com/@src/auth) **/middleware.ts** 文件包含会话处理代码。 **@** 前缀会自动解析为文件路径，因此 Claude 可以准确地找到文件。

Claude can grep and search your codebase on its own, but it still has to narrow down candidates and identify the right file. Every search step costs tokens and context. Pointing Claude at the right files from the start skips that entire process.Claude 可以自行使用 grep 命令搜索代码库，但它仍然需要缩小搜索范围并找到正确的文件。每次搜索都会消耗令牌和上下文信息。如果一开始就让 Claude 指向正确的文件，就可以跳过整个搜索过程。

## 26\. Explore unfamiliar code with vague prompts26. 利用模糊的提示探索不熟悉的代码

"What would you improve in this file?" is a great exploration prompt. Not every prompt needs to be specific. When you want fresh eyes on existing code, a vague question gives Claude room to surface things you wouldn't have thought to ask about.“你觉得这个文件应该如何改进？”是一个很好的探索性提问。并非每个问题都需要具体明确。当你想让别人以全新的视角审视现有代码时，一个模糊的问题反而能让 Claude 发现你意想不到的问题。

I use this when onboarding onto an unfamiliar repo. Claude points out patterns, inconsistencies, and improvement opportunities that I'd miss on a first read.我会在接触一个不熟悉的代码库时使用它。Claude 会指出我在第一次阅读时可能会忽略的模式、不一致之处和改进机会。

## 27\. Edit plans with Ctrl+G27. 使用 Ctrl+G 编辑计划

When Claude presents a plan, **Ctrl+G** opens it in your text editor for direct editing. Add constraints, remove steps, redirect the approach before Claude writes a single line of code. Useful when the plan is mostly right but you want to tweak a few steps without re-explaining the whole thing.当克劳德提交方案时， **按下 Ctrl+G** 即可在文本编辑器中打开方案进行直接编辑。在克劳德编写任何代码之前，您可以添加约束条件、删除步骤或调整方案。当方案基本正确，但您想调整几个步骤而无需重新解释整个方案时，此功能非常有用。

## 28\. Run /init, then cut the result in half28. 运行 /init 操作，然后将结果减半。

[CLAUDE.md](http://claude.md/) is a markdown file at the root of your project that gives Claude persistent instructions: build commands, coding standards, architectural decisions, repo conventions. Claude reads it at the start of every session. **/init** generates a starter version based on your project structure. It picks up build commands, test scripts, and directory layout.[CLAUDE.md](http://claude.md/) \`/init\` 是一个位于项目根目录的 Markdown 文件，它为 Claude 提供持久的指令：构建命令、编码规范、架构决策和代码仓库约定。Claude 会在每次会话开始时读取它。\` **/init\`** 会根据你的项目结构生成一个初始版本。它会获取构建命令、测试脚本和目录布局。

The output tends to be bloated. If you can't explain why a line is there, delete it. Trim the noise and add what's missing. For more on structuring these files, see [how to write a great CLAUDE.md file](https://www.builder.io/blog/claude-md-guide).输出结果往往比较冗长。如果您无法解释某行存在的意义，请将其删除。去除冗余信息，并添加缺失的内容。有关如何组织这些文件的更多信息，请参阅…… [如何编写一个优秀的 CLAUDE.md 文件](https://www.builder.io/blog/claude-md-guide) 。

## 29\. The litmus test for every CLAUDE.md line29. 各项的试金石 CLAUDE.md 线

For every line in your [CLAUDE.md](http://claude.md/), ask: would Claude make a mistake without this? If Claude already does something correctly on its own, the instruction is noise. Every unnecessary line dilutes the ones that matter. There's roughly a 150-200 instruction budget before compliance drops off, and the system prompt already uses about 50 of those.在你的每一行中 [CLAUDE.md](http://claude.md/) 问：如果没有这条指令，Claude 会出错吗？如果 Claude 本身就能正确执行某些操作，那么这条指令就是干扰。每一条不必要的指令都会削弱真正重要的指令。系统指令的执行量大约在 150 到 200 条之间，超过这个数量，指令执行率就会下降，而系统提示符已经占用了其中大约 50 条。

## 30\. After Claude makes a mistake, say "Update your CLAUDE.md so this doesn't happen again"30. 当克劳德犯错后，说“更新你的……” CLAUDE.md 为了避免再次发生这种情况。

When Claude makes a mistake, say "update the [CLAUDE.md](http://claude.md/) file so this doesn't happen again." Claude writes its own rule. Next session, it follows it automatically.当克劳德犯错时，说“更新……” [CLAUDE.md](http://claude.md/) 文件可以防止这种情况再次发生。”克劳德会编写自己的规则。下次会话时，它会自动遵循该规则。

Over time your [CLAUDE.md](http://claude.md/) becomes a living document shaped by real mistakes. To keep it from growing indefinitely, use [@imports](https://x.com/@imports) (tip #32) to reference a separate file like [@docs/solutions](https://x.com/@docs/solutions)**.md** for patterns and fixes. Your [CLAUDE.md](http://claude.md/) stays lean, and Claude reads the details on demand.随着时间的推移，你的 [CLAUDE.md](http://claude.md/) 它会变成一份由真实错误塑造而成的鲜活文件。为了防止它无限增长，请使用 [@imports](https://x.com/@imports) （提示 #32）引用单独的文件，例如 [@docs/solutions](https://x.com/@docs/solutions) **.md** 文件包含模式和修复方法。您的 [CLAUDE.md](http://claude.md/) 保持精简，克劳德按需阅读细节。

## 31\. Use .claude/rules/ for rules that only apply sometimes31. 对于仅有时适用的规则，请使用 .claude/rules/ 文件。

Place markdown files in **.claude/rules/** to organize instructions by topic. By default, every rule file loads at the start of each session. To make a rule load only when Claude works on specific files, add **paths** frontmatter:将 Markdown 文件放在 **.claude/rules/ 目录**下 ，以便按主题组织指令。默认情况下，每个规则文件都会在每次会话开始时加载。要使规则仅在 Claude 处理特定文件时加载，请添加**路径** frontmatter：

```yaml
---
paths:
  - "**/*.ts"
---
# TypeScript conventions
Prefer interfaces over types.
```

This keeps your main [CLAUDE.md](http://claude.md/) lean. TypeScript rules load when Claude reads .ts files, Go rules when it reads .go files. Claude never wades through conventions for languages it isn't touching.这样可以保持你的主要功能。 [CLAUDE.md](http://claude.md/) 简洁高效。Claude 读取 .ts 文件时加载 TypeScript 规则，读取 .go 文件时加载 Go 规则。Claude 从不费力去理解它未涉及的语言的约定。

## 32\. Use @imports to keep CLAUDE.md lean32. 使用 @imports 来保持 CLAUDE.md 的简洁性。

Reference docs with [@docs/git-instructions](https://x.com/@docs/git-instructions).md. You can also reference [@README](https://x.com/@README).md, [@package](https://x.com/@package).json, or even @~/.claude/my-project-instructions.md.参考文档 [@docs/git-instructions](https://x.com/@docs/git-instructions) .md。您也可以引用 [@README](https://x.com/@README) .md， [@包裹](https://x.com/@package) .json，或者甚至是 @~/.claude/my-project-instructions.md。

Claude reads the file when it needs it. Think of [@imports](https://x.com/@imports) as "here's more context if you need it" without bloating the file Claude reads every session.Claude 会在需要时读取文件。想想看 [@imports](https://x.com/@imports) 就像“如果你需要更多上下文，这里还有”一样，而不会使 Claude 每次会话读取的文件变得臃肿。

## 33\. Allowlist safe commands with /permissions33. 使用 /permissions 将安全命令添加到允许列表

Stop clicking "approve" on **npm run lint** for the hundredth time. **/permissions** lets you allowlist trusted commands so you stay in flow. You'll still get prompted for anything not on the list.别再第一百次点击 **\`npm run lint\`** 的“批准”按钮了 。\` **/permissions\` 参数**允许你把受信任的命令添加到允许列表中，这样你的工作流程就会更顺畅。对于列表中没有的命令，系统仍然会提示你。

## 34\. Use /sandbox when you want Claude to work freely34. 当你想让克劳德自由工作时，请使用 /sandbox 参数。

Run **/sandbox** to enable OS-level isolation. Writes are restricted to your project directory, and network requests are limited to domains you approve. It uses Seatbelt on macOS and bubblewrap on Linux, so restrictions apply to every subprocess Claude spawns. In auto-allow mode, sandboxed commands run without permission prompts, which gives you near-full autonomy with guardrails.运行 **\`/sandbox\`** 启用操作系统级别的隔离。写入操作仅限于您的项目目录，网络请求也仅限于您授权的域名。它在 macOS 上使用 Seatbelt，在 Linux 上使用 bubblewrap，因此限制适用于 Claude 生成的每个子进程。在自动允许模式下，沙盒内的命令无需权限提示即可运行，这在提供安全保障的同时，也赋予您近乎完全的自主权。

For unsupervised work (overnight migrations, experimental refactors), run Claude in a Docker container. Containers give you full isolation, easy rollback, and the confidence to let Claude run for hours.对于无人值守的工作（例如夜间迁移、实验性重构），请在 Docker 容器中运行 Claude。容器可提供完全隔离、轻松回滚，并让您放心让 Claude 运行数小时。

## 35\. Create custom subagents for recurring tasks35. 为重复性任务创建自定义子代理

Different from using subagents on the fly (#19), custom subagents are pre-configured agents saved in **.claude/agents/**. For example, a security-reviewer agent with Opus and read-only tools, or a quick-search agent with Haiku for speed.与动态使用子代理（#19）不同，自定义子代理是预先配置好的代理，保存在 **.claude/agents/ 目录**中 。例如，一个带有 Opus 和只读工具的安全审查代理，或者一个使用 Haiku 以提高速度的快速搜索代理。

Use **/agents** to browse and create them. You can set **isolation: worktree** for agents that need their own file system.使用 **/agents** 命令浏览和创建代理。您可以为需要独立文件系统的代理设置 **isolation: worktree** 。

## 36\. Pick the right MCP servers for your stack36. 为您的堆栈选择合适的 MCP 服务器

The MCP servers worth starting with: **Playwright** for browser testing and UI verification, **PostgreSQL/MySQL** for direct schema queries, **Slack** for reading bug reports and thread context, and **Figma** for design-to-code workflows.值得开始使用的 MCP 服务器有： **Playwright** （用于浏览器测试和 UI 验证）、 **PostgreSQL/MySQL（** 用于直接模式查询）、 **Slack（** 用于阅读错误报告和讨论上下文）以及 **Figma** （用于设计到代码的工作流程）。

Claude Code supports dynamic tool loading, so servers only load their definitions when Claude needs them. For a comprehensive list of what's available, see our guide on [the best MCP servers in 2026](https://www.builder.io/blog/best-mcp-servers-2026).Claude Code 支持动态工具加载，因此服务器仅在 Claude 需要时才加载其定义。有关可用工具的完整列表，请参阅我们的指南。 [2026 年最佳 MCP 服务器](https://www.builder.io/blog/best-mcp-servers-2026) 。

## 37\. Set your output style37. 设置输出样式

Run **/config** and select your preferred style. The built-in options are Explanatory (detailed, step-by-step), Concise (brief, action-focused), and Technical (precise, jargon-friendly).运行 **/config** 并选择您喜欢的样式。内置选项包括：解释型（详细、分步说明）、简洁型（简明、注重操作）和技术型（精确、通俗易懂）。

You can also create custom output styles as files in **~/.claude/output-styles/**.您还可以将自定义输出样式创建为 **~/.claude/output-styles/** 中的文件 。

## 38\. Use CLAUDE.md for suggestions, hooks for requirements38. 使用 CLAUDE.md 建议、需求钩子

[CLAUDE.md](http://claude.md/) is advisory. Claude follows it about 80% of the time. Hooks are deterministic, 100%. If something must happen every time without exception (formatting, linting, security checks), make it a hook. If it's guidance Claude should consider, [CLAUDE.md](http://claude.md/) is fine.[CLAUDE.md](http://claude.md/) 这只是建议。克劳德大约 80% 的时间会遵循它。钩子函数是确定性的，100% 确定。如果某件事必须每次都发生（格式化、代码检查、安全检查），那就把它做成钩子函数。如果只是给克劳德一些建议，他应该考虑一下。 [CLAUDE.md](http://claude.md/) 没问题。

## 39\. Auto-format with a PostToolUse hook39. 使用 PostToolUse 钩子自动格式化

Every time Claude edits a file, your formatter should run automatically. Add a PostToolUse hook in .claude/settings.json that runs Prettier (or your formatter) on any file after Claude edits or writes it:每次 Claude 编辑文件时，您的格式化程序都应该自动运行。在 .claude/settings.json 中添加一个 PostToolUse 钩子，以便在 Claude 编辑或写入文件后，对任何文件运行 Prettier（或您的格式化程序）：

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Edit|Write",
        "hooks": [
          {
            "type": "command",
            "command": "npx prettier --write \\\\"$CLAUDE_FILE_PATH\\\\" 2>/dev/null || true"
          }
        ]
      }
    ]
  }
}
```

The **|| true** prevents hook failures from blocking Claude. You can chain other tools too. Add **npx eslint --fix** as a second hook entry.\` **|| true\`** 可以防止钩子失败阻塞 Claude。你也可以链式调用其他工具。添加 **\`npx eslint --fix\`** 作为第二个钩子条目。

If you have an editor open to the same files, consider turning off format-on-save while Claude is working. Some developers have reported that editor saves can invalidate the prompt cache, forcing Claude to re-read files. Let the hook handle formatting instead.如果您同时打开了其他编辑器并编辑相同的文件，请考虑在 Claude 运行时关闭保存时格式化功能。一些开发者反映，编辑器保存操作可能会使提示缓存失效，导致 Claude 需要重新读取文件。建议让钩子程序来处理格式化操作。

## 40\. Block destructive commands with PreToolUse hooks40. 使用 PreToolUse 钩子阻止破坏性命令

Block **rm -rf**, **drop table**, and **truncate** patterns with a PreToolUse hook on Bash. Claude won't even try. The hook fires before Claude executes the tool, so destructive commands get caught before they cause damage.使用 Bash 的 PreToolUse 钩子可以阻止 **rm -rf** 、 **drop table** 和 **truncate** patterns 命令。Claude 甚至都不会尝试执行这些命令。该钩子会在 Claude 执行工具之前触发，因此破坏性命令会在造成损害之前被拦截。

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Bash",
        "type": "command",
        "command": "if echo \\\\"$TOOL_INPUT\\\\" | grep -qE 'rm -rf|drop table|truncate'; then echo 'BLOCKED: destructive command' >&2; exit 2; fi"
      }
    ]
  }
}
```

Add this to **.claude/settings.json** in your project. You can set it up interactively with **/hooks**, or just tell Claude: "Add a PreToolUse hook that blocks rm -rf, drop table, and truncate commands."将此添加到项目中的 **.claude/settings.json** 文件中。您可以使用 **/hooks** 进行交互式设置 ，或者直接告诉 Claude：“添加一个 PreToolUse 钩子，阻止 rm -rf、drop table 和 truncate 命令。”

## 41\. Preserve important context across compaction with hooks41. 用钩子在压实过程中保留重要的上下文信息

When context compacts during long sessions, Claude can lose track of what you're working on. A Notification hook with a **compact** matcher automatically re-injects your key context every time compaction fires.在长时间会话期间，如果上下文被压缩，Claude 可能会丢失您正在处理的内容。带有**压缩**匹配器的通知钩子会在每次触发压缩时自动重新注入您的关键上下文。

Tell Claude: "Set up a Notification hook that after compaction reminds you of the current task, modified files, and any constraints." Claude will create the hook in your settings. Good candidates for re-injection: the current task description, the list of files you've modified, and any hard constraints ("don't modify migration files").告诉 Claude：“设置一个通知钩子，在压缩完成后提醒你当前任务、已修改的文件以及任何限制条件。” Claude 会在你的设置中创建这个钩子。适合重新注入的信息包括：当前任务描述、已修改的文件列表以及任何硬性限制条件（例如“不要修改迁移文件”）。

This is most valuable during multi-hour sessions where you're deep in a feature and can't afford Claude losing the thread.在长达数小时的开发过程中，当你深入研究某个功能，而又不能让 Claude 偏离主题时，这一点尤为重要。

## 42\. Always manually review auth, payments, and data mutations42. 始终手动审核授权、支付和数据变更

Claude is good at code. These decisions need a human. Auth flows, payment logic, data mutations, destructive database operations. Review these regardless of how good the rest looks. A wrong auth scope, a misconfigured payment webhook, or a migration that drops a column silently can cost you users, money, or trust. No amount of automated testing catches every one of these.克劳德擅长编写代码。但这些决策需要人来做。身份验证流程、支付逻辑、数据变更、破坏性数据库操作，无论其他部分看起来多么完美，都必须仔细审查。错误的身份验证范围、配置错误的支付 Webhook，或者在迁移过程中悄无声息地删除列，都可能导致用户流失、资金损失或信任危机。再多的自动化测试也无法发现所有这些问题。

## 43\. Use /branch to try a different approach without losing your current one43. 使用 /branch 命令尝试不同的方法，而不会丢失当前的方法。

**/branch** (or **/fork**) creates a copy of your conversation at the current point. Try the risky refactor in the branch. If it works, keep it. If it doesn't, your original conversation is untouched. This is different from rewind (#3) because both paths stay alive.**/branch** （或 **/fork** ）会在当前位置创建一个对话副本。尝试在分支中进行风险较高的重构。如果成功，则保留该分支。如果失败，则原始对话保持不变。这与回溯（#3）不同，因为两条路径都会保持连接。

## 44\. Let Claude interview you when you can't fully spec a feature44. 当你无法完整地描述某个功能时，让克劳德来面试你。

You know what you want to build, but you feel like you don't have all the details Claude needs to build it well. Let Claude ask the questions.你知道自己想建造什么，但感觉自己没有掌握克劳德建造所需的所有细节。那就让克劳德来问问题吧。

```markdown
I want to build [brief description]. Interview me in detail
using the AskUserQuestion tool. Ask about technical implementation,
edge cases, concerns, and tradeoffs. Don't ask obvious questions.
Keep interviewing until we've covered everything,
then write a complete spec to SPEC.md.
```

Once the spec is done, start a fresh session to execute with clean context and a complete spec.规范完成后，启动一个新的会话，以在干净的上下文和完整的规范下执行。

## 45\. Have one Claude write, another Claude review45. 让一个克劳德写一篇评论，另一个克劳德写一篇评论

First Claude implements the feature, second Claude [reviews from fresh context like a staff engineer](https://x.com/bcherny/status/2017742745365057733). The reviewer has no knowledge of the implementation shortcuts and will challenge every one of them.首先，Claude 实现了该功能；其次，Claude [来自新语境的评论，例如工程师的评论。](https://x.com/bcherny/status/2017742745365057733) 审阅者对实现上的捷径一无所知，会对每一条捷径都提出质疑。

Same idea works for TDD. Session A writes tests, Session B writes the code to pass them.同样的思路也适用于测试驱动开发（TDD）。A 组编写测试用例，B 组编写代码来实现这些测试用例。

## 46\. Review PRs conversationally46. 以对话的方式审阅 PR。

Don't ask Claude for a one-shot PR review (although you can if you want). Open the PR in a session and have a conversation about it. "Walk me through the riskiest change in this PR." "What would break if this runs concurrently?" "Is the error handling consistent with the rest of the codebase?"不要直接找 Claude 审查 PR（当然，如果你想的话也可以）。在会话中打开 PR，然后和他讨论。“请你解释一下这个 PR 中最危险的改动是什么。”“如果并发运行，会出什么问题？”“错误处理是否与代码库的其他部分保持一致？”

Conversational reviews catch more issues because you can drill into the areas that matter. One-shot reviews tend to flag style nits and often miss the architectural problems.对话式评审能发现更多问题，因为它可以深入探讨关键领域。而一次性评审往往只关注风格上的小瑕疵，常常忽略架构上的问题。

## 47\. Name and color-code your sessions47. 为您的课程命名并用颜色编码

**/rename auth-refactor** puts a label on the prompt bar so you know which session is which. **/color red** or **/color blue** sets the prompt bar color. Available colors: red, blue, green, yellow, purple, orange, pink, cyan. When you're running 2-3 parallel sessions, naming and coloring them takes five seconds and saves you from typing into the wrong terminal.**\`/rename auth-refactor\` 命令**会在提示栏上添加一个标签，方便您区分不同的会话。\` **/color red\`** 或 **\`/color blue\` 命令**可以设置提示栏的颜色。可用颜色包括：红色、蓝色、绿色、黄色、紫色、橙色、粉色和青色。当您同时运行 2-3 个会话时，命名和设置颜色只需五秒钟，就能避免您误操作到错误的终端。

## 48\. Play a sound when Claude finishes48. 当克劳德说完时播放声音

Add a Stop hook that plays a system sound when Claude completes a response. Kick off a task, switch to something else, and hear a ping when it's done.添加一个停止钩子，当 Claude 完成响应时播放系统提示音。启动一个任务，切换到其他任务，并在任务完成后听到提示音。

```json
{
  "hooks": {
    "Stop": [
      {
        "matcher": "*",
        "hooks": [
          {
            "type": "command",
            "command": "/usr/bin/afplay /System/Library/Sounds/Glass.aiff"
          }
        ]
      }
    ]
  }
}
```

## 49\. Fan-out with claude -p for batch operations49. 使用 claude -p 进行批量操作的扇出

Loop through a list of files with non-interactive mode. --allowedTools scopes what Claude can do per file. Run them in parallel with & for maximum throughput.以非交互模式遍历文件列表。\`--allowedTools\` 参数用于限定 Claude 对每个文件可以执行的操作。使用 \`&\` 参数并行运行这些操作可获得最大吞吐量。

```bash
for file in $(cat files-to-migrate.txt); do
  claude -p "Migrate $file from class components to hooks" \\\\
    --allowedTools "Edit,Bash(git commit *)" &
done
wait
```

This is great for converting file formats, updating imports across a codebase, and running repetitive migrations where each file is independent of the others.这对于转换文件格式、更新代码库中的导入以及运行重复性迁移（其中每个文件都与其他文件独立）非常有用。

## 50\. Customize the spinner verbs (the fun one)50. 自定义转盘动词（有趣的部分）

While Claude thinks, the terminal shows a spinner with verbs like "Flibbertigibbeting..." and "Flummoxing...". You can replace them with whatever you want. Tell Claude:克劳德思考的时候，终端上会出现一个旋转的动词列表，比如“胡言乱语……”和“犯傻……”。你可以把它们替换成任何你想要的动词。告诉克劳德：

> Replace my spinner verbs in user settings with these: Hallucinating responsibly, Pretending to think, Confidently guessing, Blaming the context window请将用户设置中的旋转动词替换为以下动词：负责任地产生幻觉、假装思考、自信地猜测、责怪上下文窗口

You don't have to provide a list either. Just tell Claude what vibe you're going for: "Replace my spinner verbs with Harry Potter spells." Claude generates the list. It's a small thing that makes the wait more enjoyable.你也不用提供列表。只要告诉克劳德你想要的效果：“把我的旋转动词换成哈利·波特的咒语。”克劳德就会生成列表。这虽是件小事，却能让等待的过程更有趣。

## Wrapping up总结

You don't need all 50. Pick the one that solves the thing that annoyed you most in your last session, and try it tomorrow. One tip that sticks is worth more than fifty you bookmarked.你不需要全部50条技巧。选一条能解决你上次遇到的最恼人问题的，明天试试。一条真正有效的技巧胜过你收藏的50条。

I write about Claude Code regularly. Check out my [other Claude Code guides](https://www.builder.io/blog/authors/vishwas-gopinath).我经常写关于克劳德·科德的文章。欢迎查看我的文章。 [其他克劳德·科德指南](https://www.builder.io/blog/authors/vishwas-gopinath) 。