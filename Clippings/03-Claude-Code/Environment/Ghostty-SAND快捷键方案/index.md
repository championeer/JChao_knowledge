---
title: "My Ghostty setup for Claude Code with SAND Keybindings我的 Claude Code Ghostty 设置搭配 SAND 快捷键方案"
source: "https://x.com/dani_avila7/status/2023151176758268349"
author:
  - "[[Unknown]]"
published: 2026-02-16
created: 2026-02-18
description: "#TruthSeeker #INTJ #AIxEverything事上磨练，道在行中"
tags:
  - "clippings"
---
After months using Claude Code daily I realized I was barely using VSCode or Cursor, just the terminal and git panel, everything else Claude Code handled.用了几个月每日使用 Claude Code，我才发现自己几乎不怎么用 VSCode 或 Cursor 了，只剩下终端和 git 面板在用，其他所有功能 Claude Code 都能搞定。

The problem is VSCode’s terminal is fragile, long Claude Code sessions crash it, even on an M4. It’s not hardware, it’s a terminal not built for AI-scale output... I needed a real terminal问题是 VSCode 的终端太脆弱了，运行 Claude Code 时间一长就会崩溃，即便是在 M4 芯片上也一样。这不是硬件问题，而是终端设计根本承受不住 AI 级别的输出量……我需要一个真正的终端。

![图像](https://pbs.twimg.com/media/HBOlLlKbsAAGdbZ?format=png&name=large)

Ghostty came up, community matters and it’s built by [@mitchellh](https://x.com/@mitchellh), co-founder of HashiCorp, someone with a serious track record. Ghostty felt future-proof.Ghostty 登场，社区至关重要，它由 HashiCorp 联合创始人@mitchellh 打造，此人拥有卓越的履历。Ghostty 给人一种面向未来的感觉。

![图像](https://pbs.twimg.com/media/HBOk1hWXcAEtktr?format=jpg&name=large)

This is the first of three articles about my workflow with Ghostty and Claude Code I start with my "SAND" keybindings that make panel management second nature这是关于我在 Ghostty 与 Claude Code 工作流程的三篇文章中的第一篇。首先介绍我的"SAND"快捷键设置，它让面板管理变得像呼吸一样自然

1. My Ghostty setup for Claude Code with SAND Keybindings我的 Claude Code Ghostty 设置搭配 SAND 快捷键方案
2. Monitoring Claude Code changes with Lazygit使用 Lazygit 监控 Claude 代码变更
3. Parallel agents with Git worktrees and Claude Code并行代理与 Git 工作树和 Claude Code

## Getting Started with GhosttyGhostty 入门指南

Download Ghostty from [ghostty.org](https://ghostty.org/) (macOS and Linux). Once installed, you need a configuration file at ~/.config/ghostty/config.从 ghostty.org 下载 Ghostty (适用于 macOS 和 Linux)。安装后，需在 ~/.config/ghostty/config 处准备配置文件。

The easiest way to set it up? Open Claude Code and tell it:最简单的设置方法？打开 Claude 代码并告诉它：

> Configure Ghostty with this config: [https://gist.github.com/davila7/5b07f55a6e65a06c121da9702d10c2e2](https://gist.github.com/davila7/5b07f55a6e65a06c121da9702d10c2e2)使用此配置设置 Ghostty：https://gist.github.com/davila7/5b07f55a6e65a06c121da9702d10c2e2

Claude will read the gist, create the config file, and you're done. If you prefer to do it manually:Claude 会理解要点，自动创建配置文件，这样就完成了。如果您希望手动操作：

```bash
mkdir -p ~/.config/ghostty
curl -o ~/.config/ghostty/config https://gist.githubusercontent.com/davila7/5b07f55a6e65a06c121da9702d10c2e2/raw/config
```

# How I Manage Panels in Ghostty在 Ghostty 中如何管理面板

Using Ghostty with Claude Code works best with split panels you might have Claude on one side, git changes on another, maybe a file browser on a third If you can’t split, navigate, and close panels without thinking you end up fumbling with shortcuts instead of coding.使用 Ghostty 搭配 Claude Code 时，分屏操作体验最佳：可将 Claude 界面置于一侧，另一侧显示 git 变更记录，第三屏还能打开文件浏览器。若无法凭直觉完成分屏、导航及关闭面板操作，就容易因手忙脚乱切换快捷键而中断编码流程。

I kept forgetting Ghostty’s keybindings so I organized them into a mnemonic SAND Four letters, four actions every panel operation falls into one of these categories我总是记不住 Ghostty 的快捷键，所以把它们整理成了一个记忆口诀 SAND：四个字母，四个操作，每个面板操作都属于其中一类

## S - Split: Create new panelsS - 分割：创建新面板

Split your terminal into multiple panels. 将你的终端分成多个面板。

- Cmd+D splits right (vertical) Cmd+D 向右分屏（垂直）
- Cmd+Shift+D splits down (horizontal)Cmd+Shift+D 向下拆分（水平方向）

<video preload="none" tabindex="-1" playsinline="" aria-label="嵌入式视频" poster="https://pbs.twimg.com/amplify_video_thumb/2023144301946085376/img/ej99O1DSAwK3p4MN.jpg" style="width: 100%; height: 100%; position: absolute; background-color: black; top: 0%; left: 0%; transform: rotate(0deg) scale(1.005);" eagle-collectable="true"><source type="video/mp4" src="blob:https://x.com/0cbf23a7-4700-4a5f-b243-7a45c2ed1a82"></video>

![](https://pbs.twimg.com/amplify_video_thumb/2023144301946085376/img/ej99O1DSAwK3p4MN.jpg?name=large)

## A - Across: Move between tabsA - 横向切换：在标签页间移动

Navigate across tabs. 跨选项卡导航。

- Cmd+T opens a new tab Cmd+T 打开新标签页
- Cmd+Shift+Left/Right moves between themCmd+Shift+左键/右键在它们之间移动

<video preload="none" tabindex="-1" playsinline="" aria-label="嵌入式视频" poster="https://pbs.twimg.com/amplify_video_thumb/2023144669643939840/img/fBmkSo3y5xCkmOvD.jpg" style="width: 100%; height: 100%; position: absolute; background-color: black; top: 0%; left: 0%; transform: rotate(0deg) scale(1.005);" eagle-collectable="true"><source type="video/mp4" src="blob:https://x.com/b2ee101e-91ba-4a85-bc41-9d8e7949b08b"></video>

![](https://pbs.twimg.com/amplify_video_thumb/2023144669643939840/img/fBmkSo3y5xCkmOvD.jpg?name=large)

## N - Navigate: Jump between split panelsN - 导航：在分割面板间快速切换

Move focus between your splits. 在分割窗口间切换焦点。

- Cmd+Alt+Arrows jumps in any direction Cmd+Alt+方向键可以向任意方向跳跃
- Cmd+Shift+E equalizes all splitsCmd+Shift+E 会平均分配所有分屏
- Cmd+Shift+F zooms into one panel (press again to restore)Cmd+Shift+F 可放大单个面板（再次按下可恢复）

<video preload="none" tabindex="-1" playsinline="" aria-label="嵌入式视频" poster="https://pbs.twimg.com/amplify_video_thumb/2023144970392322048/img/nHFTG0DBmnxioM6q.jpg" style="width: 100%; height: 100%; position: absolute; background-color: black; top: 0%; left: 0%; transform: rotate(0deg) scale(1.005);" eagle-collectable="true"><source type="video/mp4" src="blob:https://x.com/042881bc-2b96-4b8a-a5bb-2db87aafc815"></video>

![](https://pbs.twimg.com/amplify_video_thumb/2023144970392322048/img/nHFTG0DBmnxioM6q.jpg?name=large)

## D - Destroy: Close panels and tabsD - 销毁：关闭所有面板和标签页

Close what you don't need. 关掉你不需要的。

- Cmd+W closes the current panel or tabCmd+W 关闭当前面板或标签页

<video preload="none" tabindex="-1" playsinline="" aria-label="嵌入式视频" poster="https://pbs.twimg.com/amplify_video_thumb/2023145201729163264/img/vx3PYwrn3cKmXctc.jpg" style="width: 100%; height: 100%; position: absolute; background-color: black; top: 0%; left: 0%; transform: rotate(0deg) scale(1.005);" eagle-collectable="true"><source type="video/mp4" src="blob:https://x.com/80c9837c-ed8a-45fb-a0f0-c1aaa9a3b5ba"></video>

![](https://pbs.twimg.com/amplify_video_thumb/2023145201729163264/img/vx3PYwrn3cKmXctc.jpg?name=large)

## My Workflow Layout我的工作流布局

This is what my daily setup looks like, and it scales from 1 to 3 Claude Code instances running in parallel... remember use SAND!这是我日常的工作台配置，它能够同时运行 1 到 3 个 Claude Code 实例…切记使用 SAND 工具哦！

**Start simple:** one Claude Code panel on the left, **S** (Cmd+D) to split right, and run [lazygit](https://github.com/jesseduffield/lazygit) there to monitor every commit and diff Claude makes in real time. 从简开始：左侧一个 Claude 代码面板，按 S 键（Cmd+D）向右分屏，运行 lazygit 实时监控 Claude 的每次提交与代码差异。

![图像](https://pbs.twimg.com/media/HBOowOKaYAAnxMd?format=jpg&name=large)

Then **S** again (Cmd+Shift+D) to split the right panel down and open [yazi](https://github.com/sxyazi/yazi) as a file browser:再次按 S（Cmd+Shift+D）键，拆分右侧面板并在下方打开 yazi 作为文件浏览器：

![图像](https://pbs.twimg.com/media/HBOpMvyXQAA-Qtz?format=jpg&name=large)

But when you're working on multiple tasks, you can split the left side into 2 or 3 Claude Code instances, each running on a different Git worktree:不过，当你在处理多项任务时，可以将左侧分成 2 或 3 个 Claude Code 实例，每个实例运行在不同的 Git 工作树上：

![图像](https://pbs.twimg.com/media/HBOpcAiXMAAP-yn?format=jpg&name=large)

If some Claude Code panels get too big because you need more context you can press Cmd+Shift+E to equalize all windows and bring them back to a balanced layout如果某些 Claude 代码面板因为需要更多上下文而变得过大，您可以按 Cmd+Shift+E 来均衡所有窗口，使它们恢复平衡布局

That’s the power of combining Ghostty with worktrees you go from a single agent to a multi-agent setup without leaving your terminal这就是结合 Ghostty 与工作树的威力：无需离开终端，你就能从单一代理模式瞬间扩展为多代理配置

## Tip: 提示：

stick a post-it with the letters SAND somewhere you can see it every time you see it, practice the commands after a week you’ll have Ghostty fully under control from the keyboard 在你经常能看到的地方贴一张便条，写上“SAND”字母，每次看到都练习一下命令，一周后你将完全能够用键盘掌控 Ghostty

![图像](https://pbs.twimg.com/media/HBOr3XvbQAAMr4R?format=jpg&name=large)

# Next Articles后续文章

This was the first article ehe next two will show how I work with Ghostty and Claude Code这是我写的第一篇文章，接下来两篇将会展示我如何使用 Ghostty 和 Claude Code

One article will cover **Lazygit,** watch Claude Code’s commits, diffs, and branch changes in real time一篇文章将介绍 Lazygit，实时查看 Claude Code 的提交记录、差异对比和分支变更

The other will cover git **worktrees and parallel agents,** run multiple Claude Code instances on different tasks and use **yazi** to browse project files另一个视频将讲解 Git 工作树与并行代理，在不同任务上运行多个 Claude Code 实例，并使用 yazi 浏览项目文件

Follow me to catch the next articles! 👇关注我，不错过后续精彩内容！👇