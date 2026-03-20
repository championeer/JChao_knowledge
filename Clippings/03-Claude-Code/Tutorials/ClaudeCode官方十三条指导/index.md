---
title: "这可能最最权威的 Claude code 教程， Claude code 作者发布 13 条指导"
source: "https://mp.weixin.qq.com/s/lRRohVefaLU8ITyfaokZyA"
author:
  - "[[Tony]]"
published:
created: 2026-01-03
description:
tags:
  - "clippings"
---
原创 Tony *2026年1月3日 08:15*

  
Claude Code 是 Anthropic 公司（Claude AI 的开发公司）官方推出的终端 AI 编码工具。它由 Anthropic 的工程团队开发和维护，包括创始工程师 Boris Cherny（原型发起人）、Sid Bidasaria 等多人，以及产品经理 Cat Wu 等参与。  

  

这可能最最权威的 Claude code 教程， Claude code 作者发布 13 条指导：

  
  

  

![图片](https://mmbiz.qpic.cn/sz_mmbiz_jpg/Svgu4ziciaxa5XnKRiaBULgwwmrOPweT9XjlofXLJueHUcH0Sw0EButqK4Nrg2aaj1M6t8ia1gyGZgicbicrDvmgZakA/640?wx_fmt=jpeg&watermark=1&tp=webp&wxfrom=5&wx_lazy=1#imgIndex=0)

“我是 Boris，我创建了 Claude Code。很多人问我如何使用 Claude Code，所以我想稍微展示一下我的设置。

  

我的设置可能出人意料地普通！Claude Code 开箱即用效果很好，所以我个人并没有太多定制。它没有唯一正确的用法：我们有意将其构建成你可以随意使用、定制和修改的方式。Claude Code 团队的每个人都以非常不同的方式使用它。  

  

1

  

我在终端中同时运行 5 个 Claude。我将我的标签页编号为 1-5，并使用系统通知来知道何时需要为 Claude 输入内容。

![图片](https://mmbiz.qpic.cn/sz_mmbiz_jpg/Svgu4ziciaxa5EnCKVe8hjiaGVDEicgjv1NsnN1Bdc8rPDzMO7FwKUtMyfOcukbic0XGDoEn3Q1RT5GFYJASk84LOjA/640?wx_fmt=jpeg&watermark=1&tp=webp&wxfrom=5&wx_lazy=1#imgIndex=1)

这几乎是榨干 200 刀 max，很多人傻傻的只开一个窗口，在那里傻等。

  

更牛逼是他们又在网页版又同时开 10 个 Claude 任务。👇

  

2

  

在 claude.ai/code 上并行运行 5-10 个 Claude，与我本地的 Claude 一起使用。当我在终端中编码时，我经常会将本地会话交给 web（使用 &），或者手动在 Chrome 中启动会话，有时我还会 --teleport 来回切换。我每天早上和全天都会从手机（通过 Claude iOS 应用）启动几个会话，然后稍后检查它们。

![图片](https://mmbiz.qpic.cn/sz_mmbiz_jpg/Svgu4ziciaxa5EnCKVe8hjiaGVDEicgjv1Nspiac1IE1zciaFSJwreENKPvGqs6EjMkMz5l223Vno7s5DnxZDnNXIm7w/640?wx_fmt=jpeg&watermark=1&tp=webp&wxfrom=5&wx_lazy=1#imgIndex=2)

  

3

  

在所有事情上都使用带有思考功能的 Opus 4.5。它是我用过的最好的编码模型，尽管它比 Sonnet 更大、更慢，但由于你需要较少地引导它，而且它在工具使用方面更出色，最终它几乎总是比使用较小的模型更快。

  

4

  

我们的团队为 Claude Code 仓库共享一个单一的 CLAUDE.md。我们将其签入 git，整个团队每周贡献多次。每当我们看到 Claude 做错什么，我们就会将其添加到 CLAUDE.md 中，这样 Claude 就知道下次不要再做了。  
  
其他团队维护他们自己的 CLAUDE.md。它是每个团队的责任来保持他们的更新。

  

![图片](https://mp.weixin.qq.com/s/www.w3.org/2000/svg'%20xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Ctitle%3E%3C/title%3E%3Cg%20stroke='none'%20stroke-width='1'%20fill='none'%20fill-rule='evenodd'%20fill-opacity='0'%3E%3Cg%20transform='translate(-249.000000,%20-126.000000)'%20fill='%23FFFFFF'%3E%3Crect%20x='249'%20y='126'%20width='1'%20height='1'%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3C/svg%3E)

  

5

  

在代码审查期间，我经常在同事的 PR 上标记 @.claude 以向 CLAUDE.md 添加一些内容，作为 PR 的一部分。我们使用 Claude Code Github action (/install-github-action) 来实现这一点。

  

这是 @danshipper 的 Compounding Engineering 的我们的版本

![图片](https://mp.weixin.qq.com/s/www.w3.org/2000/svg'%20xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Ctitle%3E%3C/title%3E%3Cg%20stroke='none'%20stroke-width='1'%20fill='none'%20fill-rule='evenodd'%20fill-opacity='0'%3E%3Cg%20transform='translate(-249.000000,%20-126.000000)'%20fill='%23FFFFFF'%3E%3Crect%20x='249'%20y='126'%20width='1'%20height='1'%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3C/svg%3E)

  

  

6

  

大多数会话以计划模式启动（按 shift+tab 两次）。如果我的目标是写一个拉取请求，我会使用计划模式，与 Claude 来回调整，直到我喜欢它的计划。从那里，我切换到自动接受编辑模式，Claude 通常能一击即中。一个好的计划真的很重要！

![图片](https://mp.weixin.qq.com/s/www.w3.org/2000/svg'%20xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Ctitle%3E%3C/title%3E%3Cg%20stroke='none'%20stroke-width='1'%20fill='none'%20fill-rule='evenodd'%20fill-opacity='0'%3E%3Cg%20transform='translate(-249.000000,%20-126.000000)'%20fill='%23FFFFFF'%3E%3Crect%20x='249'%20y='126'%20width='1'%20height='1'%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3C/svg%3E)

  

7

  

我为每天重复执行多次的每个“内循环”工作流程使用斜杠命令。这让我免于重复提示，并让 Claude 也能使用这些工作流程。命令被签入 git 并存放在.claude/commands/ 中。  
  
例如，Claude 和我每天使用 /commit-push-pr 斜杠命令数十次。该命令使用内联 bash 预计算 git 状态和其他几项信息，以使命令快速运行并避免与模型的来回交互。

![图片](https://mp.weixin.qq.com/s/www.w3.org/2000/svg'%20xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Ctitle%3E%3C/title%3E%3Cg%20stroke='none'%20stroke-width='1'%20fill='none'%20fill-rule='evenodd'%20fill-opacity='0'%3E%3Cg%20transform='translate(-249.000000,%20-126.000000)'%20fill='%23FFFFFF'%3E%3Crect%20x='249'%20y='126'%20width='1'%20height='1'%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3C/svg%3E)

  

8

  

我定期使用几个子代理：code-simplifier 在 Claude 完成工作后简化代码，verify-app 包含详细的指令，用于端到端测试 Claude Code，等等。类似于斜杠命令，我将子代理视为自动化我为大多数 PR 所做的最常见工作流程。

https://code.claude.com/docs/en/sub-agents

![图片](https://mp.weixin.qq.com/s/www.w3.org/2000/svg'%20xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Ctitle%3E%3C/title%3E%3Cg%20stroke='none'%20stroke-width='1'%20fill='none'%20fill-rule='evenodd'%20fill-opacity='0'%3E%3Cg%20transform='translate(-249.000000,%20-126.000000)'%20fill='%23FFFFFF'%3E%3Crect%20x='249'%20y='126'%20width='1'%20height='1'%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3C/svg%3E)

  

9

  

我们使用一个 PostToolUse 钩子来格式化 Claude 的代码。Claude 通常开箱即用地生成格式良好的代码，而这个钩子处理最后 10% 的工作，以避免稍后在 CI 中出现格式错误。

![图片](https://mp.weixin.qq.com/s/www.w3.org/2000/svg'%20xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Ctitle%3E%3C/title%3E%3Cg%20stroke='none'%20stroke-width='1'%20fill='none'%20fill-rule='evenodd'%20fill-opacity='0'%3E%3Cg%20transform='translate(-249.000000,%20-126.000000)'%20fill='%23FFFFFF'%3E%3Crect%20x='249'%20y='126'%20width='1'%20height='1'%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3C/svg%3E)

  

  

10

  

我不使用

\--dangerously-skip-permissions。相反，我使用 /permissions 来预先允许我环境中已知安全的常见 bash 命令，以避免不必要的权限提示。这些命令中的大多数都被签入.claude/settings.json 并与团队共享。

![图片](https://mp.weixin.qq.com/s/www.w3.org/2000/svg'%20xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Ctitle%3E%3C/title%3E%3Cg%20stroke='none'%20stroke-width='1'%20fill='none'%20fill-rule='evenodd'%20fill-opacity='0'%3E%3Cg%20transform='translate(-249.000000,%20-126.000000)'%20fill='%23FFFFFF'%3E%3Crect%20x='249'%20y='126'%20width='1'%20height='1'%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3C/svg%3E)

11

  

Claude Code 会为我使用所有工具。它经常搜索并发布到 Slack（通过 MCP 服务器），运行 BigQuery 查询来回答分析问题（使用 bq CLI），从 Sentry 获取错误日志，等等。Slack MCP 配置已签入我们的.mcp.json 中，并与团队共享。

  

![图片](https://mp.weixin.qq.com/s/www.w3.org/2000/svg'%20xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Ctitle%3E%3C/title%3E%3Cg%20stroke='none'%20stroke-width='1'%20fill='none'%20fill-rule='evenodd'%20fill-opacity='0'%3E%3Cg%20transform='translate(-249.000000,%20-126.000000)'%20fill='%23FFFFFF'%3E%3Crect%20x='249'%20y='126'%20width='1'%20height='1'%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3C/svg%3E)

  

12

  

对于非常长时间运行的任务，我会选择 (a) 在完成后提示 Claude 使用后台代理验证其工作，(b) 使用代理停止钩子更确定性地执行此操作，或者 (c) 使用 ralph-wiggum 插件（最初由 @GeoffreyHuntley 构想）。我还会使用 --permission-mode=dontAsk 或 --dangerously-skip-permissions 在沙箱中，以避免会话期间的权限提示，从而让 Claude 能够不受阻挡地进行操作。

  

https://github.com/anthropics/claude-plugins-official/tree/main/plugins/ralph-wiggum

  

  

13

  

最后一条建议：要从 Claude Code 中获得出色结果，最重要的事情可能是——给 Claude 一个验证其工作的途径。如果 Claude 拥有这种反馈循环，它将使最终结果的质量提升 2-3 倍。  
  
Claude 使用 Claude Chrome 扩展程序测试我提交到 claude.ai/code 的每一个更改。它打开浏览器，测试 UI，并迭代直到代码运行正常且用户体验感觉良好。  
  
验证在每个领域看起来都不一样。它可能像运行一个 bash 命令那么简单，或者运行测试套件，或者在浏览器或手机模拟器中测试应用。确保投资让这个过程坚如磐石。  
  
code.claude.com/docs/en/chrome

  

继续滑动看下一个

Tony出海

向上滑动看下一个