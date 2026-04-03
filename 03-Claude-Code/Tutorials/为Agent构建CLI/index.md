---
title: "Building CLIs for agents为代理构建 CLI"
source: "https://x.com/ericzakariasson/status/2036762680401223946"
author:
  - "[[Unknown]]"
published: 2026-03-25
created: 2026-03-27
description: "#TruthSeeker #INTJ #AI #ChinaData #Founder"
tags:
  - "clippings"
---
If you've ever watched an agent try to use a CLI, you've seen it get stuck on an interactive prompt it can't answer, or parse a help page with no examples. Most CLIs were built assuming a human is at the keyboard. Here are some things I've found that make them work better for agents:如果你曾经观察过客服人员尝试使用命令行界面 (CLI)，你就会发现他们经常卡在无法回答的交互式提示上，或者解析没有示例的帮助页面。大多数 CLI 的设计都假定键盘是由人操作的。以下是我发现的一些可以提高客服人员使用 CLI 效率的方法：

**Make it non-interactive.** If your CLI drops into a prompt mid-execution, an agent is stuck. It can't press arrow keys or type "y" at the right moment. Every input should be passable as a flag. Keep interactive mode as a fallback when flags are missing, not the primary path.**使其非交互式。** 如果命令行界面 (CLI) 在执行过程中突然弹出提示符，代理程序就会卡住。它无法在正确的时间按下方向键或输入"y"。所有输入都应该可以作为标志传递。交互模式应作为标志缺失时的备用方案，而不是主要路径。

```bash
# this blocks an agent
$ mycli deploy
? Which environment? (use arrow keys)

# this works
$ mycli deploy --env staging
```

**Don't dump all your docs upfront.** An agent runs mycli, sees subcommands, picks one, runs mycli deploy --help, gets what it needs. No wasted context on commands it won't use. Let it discover things as it goes.**不要一开始就把所有文档都放上去。** 代理运行 mycli，识别子命令，选择一个，然后运行 ​​mycli deploy --help，获取所需信息。不会浪费上下文信息在它不会使用的命令上。让它在运行过程中自行发现所需内容。

**Make --help actually useful.** Every subcommand gets a --help, and every --help includes examples. The examples do most of the work. An agent pattern-matches off mycli deploy --env staging --tag v1.2.3 faster than it reads a description.**让 \`--help\` 真正发挥作用。** 每个子命令都应该有 \`--help\` 选项，并且每个 \`--help\` 选项都应该包含示例。示例已经完成了大部分工作。代理程序匹配 \`mycli deploy --env staging --tag v1.2.3\` 的模式比读取描述信息要快得多。

```text
$ mycli deploy --help
Options:
  --env     Target environment (staging, production)
  --tag     Image tag (default: latest)
  --force   Skip confirmation

Examples:
  mycli deploy --env staging
  mycli deploy --env production --tag v1.2.3
  mycli deploy --env staging --force
```

**Accept flags and stdin for everything.** Agents think in pipelines. They want to chain commands and pipe output between tools. Don't require positional args in weird orders or fall back to interactive prompts for missing values.**接受所有参数的标志和标准输入。** 智能体以管道方式思考，它们希望将命令串联起来，并在工具之间传递输出。不要要求以奇怪的顺序提供位置参数，也不要因为缺少值而回退到交互式提示。

```bash
cat config.json | mycli config import --stdin
mycli deploy --env staging --tag $(mycli build --output tag-only)
```

**Fail fast with actionable errors.** If a required flag is missing, don't hang. Error immediately and show the correct invocation. Agents are good at self-correcting when you give them something to work with.**快速失败并提供可操作的错误信息。** 如果缺少必需的标志，不要挂起程序。立即报错并显示正确的调用。只要提供一些信息，代理程序就能很好地进行自我纠正。

```bash
Error: No image tag specified.
  mycli deploy --env staging --tag <image-tag>
  Available tags: mycli build list --output tags
```

**Make commands idempotent.** Agents retry constantly. Network timeouts, context getting lost mid-task. Running the same deploy twice should return "already deployed, no-op", not create a duplicate.**使命令幂等。** 代理会不断重试。网络超时、任务执行过程中上下文丢失。重复执行相同的部署操作应该返回"已部署，无操作"，而不是创建重复项。

**Add --dry-run for destructive actions.** Agents should be able to preview what a deploy or deletion would do before committing. Let them validate the plan, then run it for real.**添加 \`--dry-run\` 参数以执行破坏性操作。** 代理程序应该能够在提交部署或删除操作之前预览其效果。让它们验证计划，然后再实际执行。

```bash
$ mycli deploy --env production --tag v1.2.3 --dry-run
Would deploy v1.2.3 to production
  - Stop 3 running instances
  - Pull image registry.io/app:v1.2.3
  - Start 3 new instances
No changes made.

$ mycli deploy --env production --tag v1.2.3
✓ Deployed v1.2.3 to production
```

**\--yes / --force to skip confirmations.** Humans get "are you sure?" and agents pass --yes to bypass it. Make the safe path the default but allow bypassing.**\`--yes\` 或 \`--force\` 参数用于跳过确认。** 人类用户会看到"您确定吗？"的提示，而智能体可以通过传递 \`--yes\` 参数来绕过此提示。将安全路径设为默认路径，但允许绕过此路径。

**Predictable command structure.** If an agent learns \`mycli service list\`, it should be able to guess \`mycli deploy list\` and \`mycli config list\`. Pick a pattern (resource + verb) and use it everywhere.**可预测的命令结构。** 如果代理学习了 \`mycli service list\` 命令，它应该能够推测出 \`mycli deploy list\` 和 \`mycli config list\` 命令。选择一个模式（资源 + 动词）并到处使用它。

**Return data on success.** Show the deploy ID and the URL. Emojis are cute, but not really needed.**成功后返回数据。** 显示部署 ID 和 URL。表情符号很可爱，但并非必需。

```bash
deployed v1.2.3 to staging
url: https://staging.myapp.com
deploy_id: dep_abc123
duration: 34s
```

If you're building CLIs that agents will use, these patterns save a lot of debugging time. Most of the work is just making explicit what humans figured out implicitly!如果你正在构建供代理使用的命令行界面 (CLI)，这些模式可以节省大量调试时间。大部分工作只是将人类隐式推断出的东西明确地表达出来！

I bet there are many more things that I've forgotten, let me know!我肯定还有很多事情我忘记了，请告诉我！