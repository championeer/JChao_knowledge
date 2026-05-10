---
title: "AI全自动视频工作流揭秘：Codex + Remotion零基础保姆级教程"
source: "https://x.com/0xMulight/status/2052950904601751604"
author:
  - "[[@0xMulight]]"
published: 2026-05-09
created: 2026-05-10
description: "想让 AI帮你全自动生成并渲染视频吗？结合 Codex AI编程助手与Remotion React视频框架，你可以搭建一套完整的自动化工作流：让 AI自动读取本地素材、编写视频组件代码，并一键渲染成最终的 MP4文件。这份保姆级教程将带你从零跑通全流程。一 它是如何工作的？Rem..."
tags:
  - "clippings"
---
![Image](https://pbs.twimg.com/media/HHuAYjJbIAE7xh3?format=jpg&name=large)

想让 AI帮你全自动生成并渲染视频吗？结合 Codex AI编程助手与Remotion React视频框架，你可以搭建一套完整的自动化工作流：让 AI自动读取本地素材、编写视频组件代码，并一键渲染成最终的 MP4文件。

这份保姆级教程将带你从零跑通全流程。

## 一 它是如何工作的？

Remotion 的核心魔法在于“用 React 写视频”。你可以把视频完全理解为一个前端代码项目： 画面生成：每一帧都是由 React 组件生成的。 动画控制：所有动画通过当前帧数 useCurrentFrame 来驱动。 素材管理：图片、音频、视频等素材统一放在 public 目录中。 最终输出：使用 Remotion CLI命令行工具渲染成 MP4。

在这个过程中，Codex 扮演的是你的全能执行者。它可以帮你：扫描本地素材目录，创建 Remotion项目，编写 React视频组件，安装所需依赖，执行渲染命令，抽帧检查成片，根据你的反馈继续修改代码。

![Image](https://pbs.twimg.com/media/HHzttIpaIAAzhrR?format=jpg&name=large)

## 二 推荐的目录结构

为了让 AI 更准确地读取和操作，建议每个视频项目都使用独立且清晰的目录结构：

E:\\YourVideoProject

assets\\ 原始素材 待处理的图文音视频

references\\ 参考文件 参考视频、对标图片、脚本等

renders\\ 输出目录 最终渲染的 MP4 存放地

remotion-project\\ Remotion 源码项目 AI 生成的代码放这里

![Image](https://pbs.twimg.com/media/HHzwbjHasAAEPct?format=png&name=large)

## 三 第一次给 Codex 的核心提示词

准备好目录后，你可以直接复制下面这段模板发给 Codex，只需替换里面的内容：

```text
请用 Codex + Remotion 帮我制作一个视频。
```

## 四 目录设置：

项目目录：填写你的 Remotion项目路径

素材目录：填写原始素材路径

参考文件：填写参考视频/图片/脚本路径，没有就写“无”

输出目录：填写最终视频输出路径

## 五 视频要求：

1. 时长与规格：如 15 秒 | 尺寸，如 1920x1080 | 帧率，如 30fps
2. 镜头数量：填写大概的镜头数
3. 视觉风格：如：科技感强、简洁高级、快节奏
4. 内容结构：简述每个镜头大概做什么，如：开场建立氛围，中段展示核心，结尾强化品牌
5. 文案与音频：填写标题、字幕要求 | 说明是否需要背景音乐或保留参考音频
6. 输出文件名：如 output-v1.mp4

## 六 你的执行步骤：

1. 先扫描素材和参考文件。
2. 创建独立的 Remotion项目，编写package.json和 src代码。
3. 安装所需依赖。
4. 渲染出 MP4 文件。
5. 渲染完成后，进行抽帧检查，确认画面是否正常。
6. 绝不要覆盖已有的旧视频文件。

如果后续需求已经很明确，可以把上述提示词精简，只保留核心的路径和规格要求即可。

## 七 核心 API 与配置速查

虽然 AI 会帮你写代码，但了解一些核心机制可以让你更好地指挥它。

常用核心 API：

useCurrentFrame：获取当前帧数，是控制所有动画的基础

useVideoConfig：获取当前视频的 fps、宽高和总帧数。

interpolate：将帧数映射为动画值 如透明度、位移、缩放等 。

spring：制作非常丝滑、自然的弹性物理动画。

时长计算逻辑： 代码中的 durationInFrames = 时长秒 × fps。 例如：15 秒、30fps 的视频，总帧数就是 450。

## 八 高阶技巧：让 AI 进行抽帧质检

这是全自动化流程中最关键的一环！渲染完成后，不要只看命令行有没有报错，要让 Codex 看一眼画面。

你可以追加这样一个提示词： 请帮我对刚渲染的视频抽帧检查，生成一张 contact sheet，看画面是否正常、文字是否溢出、素材是否缺失。

Codex 会调用类似以下的 FFmpeg 命令来生成检查图： ffmpeg -y -i 输出视频.mp4 -vf fps=1/2,scale=320:-1,tile=4x2 -frames:v 1 抽帧检查图.jpg

## 九 如何高效给 AI 提供修改反馈？

如果看完第一版视频觉得需要调整，一定要明确区分改动项和保留项，避免 AI 改了这里，坏了那里：

请基于上一版继续修改，不要覆盖旧视频，输出为output-v2.mp4。

需要调整：

1. 整体节奏再快一点。
2. 背景的动态效果更丰富一些。
3. 主标题文字放大 1.5 倍。

保持不变：

1. 视频时长 15秒 和尺寸 1920x1080 不变。
2. 整体的蓝色科技风保持不变。

## 十 在自动化运行中，可能会遇到以下报错，你可以直接把对应的提示词喂给 Codex 解决：

1. **报错 npx remotion failed 应对方案：让 Codex 检查依赖库。**

提示词：“请在项目目录确保安装了 remotion、[@remotion/cli](https://x.com/@remotion/cli)、react、react-dom。”

**2\. 报错 spawn EPERM 通常是 Windows 权限限制 应对方案：**

提示词：“Remotion 运行时出现 spawn EPERM，请使用提升的权限重新运行 compositions 或 render。”

**3\. 图片无法解码 The source image cannot be decoded 应对方案：**

提示词：“请把 public 目录里的图片重新转码成标准的无压缩 PNG 或 JPG，然后再重新渲染。”

**4\. 为了确保工作流闭环，建议在每次 Codex 宣称完成任务后，让它做一个总结汇报：**

请告诉我：1. 输出的视频绝对路径。 2. 最终的视频规格。 3. 是否完成了抽帧检查并确认无异常。 4. 运行过程中有没有警告或需要注意的问题。

掌握了这套方法，你相当于拥有了一个不知疲倦的 24小时代码视频剪辑师。

试试看！！！

以下是我简单生成的内容，请观赏！

<video preload="none" tabindex="-1" playsinline="" aria-label="Embedded video" poster="https://pbs.twimg.com/amplify_video_thumb/2052775610116976640/img/8Kej9Nqon5trqD1B.jpg" style="width: 100%; height: 100%; position: absolute; background-color: black; top: 0%; left: 0%; transform: rotate(0deg) scale(1.005);"><source type="video/mp4" src="blob:https://x.com/ccb0b62d-95ab-4568-83a6-eb9e2e75a05f"></video>

![](https://pbs.twimg.com/amplify_video_thumb/2052775610116976640/img/8Kej9Nqon5trqD1B.jpg?name=large)

<video preload="none" tabindex="-1" playsinline="" aria-label="Embedded video" poster="https://pbs.twimg.com/amplify_video_thumb/2052780412058083328/img/-62f7cp8c9SPxsRr.jpg" style="width: 100%; height: 100%; position: absolute; background-color: black; top: 0%; left: 0%; transform: rotate(0deg) scale(1.005);"><source type="video/mp4" src="blob:https://x.com/681bf32b-63fe-44ea-9aab-44c23894b576"></video>

![](https://pbs.twimg.com/amplify_video_thumb/2052780412058083328/img/-62f7cp8c9SPxsRr.jpg?name=large)