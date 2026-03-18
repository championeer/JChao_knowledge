---
title: "又被封号了？自建中转两个月0封，10分钟搞定"
source: "https://x.com/xaapi_ai/status/2033011825764389239"
author:
  - "[[Unknown]]"
published: 2026-03-15
created: 2026-03-15
description: "#TruthSeeker #INTJ #AIxEverything事上磨练，道在行中"
tags:
  - "clippings"
---
看到X上好多人魔怔了，又是模型参水，又是卖数据的。又是盗刷的。

自己中转小站开了半年多了，从最早的 CRS 到现在的 Sub2API，用了半年多了。

> 其实本来就是朋友之间拼车 Claude 用的，龙虾火了之后顺手转成了中转站。今天把完整部署流程写出来，全程免费开源。

项目地址先放这：[https://github.com/Wei-Shaw/sub2api](https://github.com/Wei-Shaw/sub2api)

⚠️ **血泪经验，先看再动手**

1. Claude Code Max 订阅转 API → 有封号风险，概率不低。【最近我的号确实两个月未封】
2. 反重力中转 Claude、Gemini → 基本秒封号，别试了，省点钱。【这个我赚了波钱，也一下子封了20多个号】
3. OpenAI 中转 Key → 用 GPT-5.4 目前比较稳定，其他模型自己斟酌。

**一、准备工作（5分钟）**

开始之前就准备三样东西：

一台 Linux 服务器，2核4G起步就够用。线路推荐 DMIT 带 CN2 GIA 的（[https://dmit.io），国内访问延迟低、速度快。我之前试过](https://dmit.xn--io\),-ow3c326pnid87nmlr1waz5fz46sjhlxzaf15d.xn--9iqp1h5wr9v4bkee/) AWS，太卡了，不推荐。不会选服务器的评论区告诉我预算和地区，我帮你推荐。

一个域名（可选但强烈建议有）。加了域名 + SSL 证书，稳定性更好，封号概率也能再降一档。

你的 Claude / OpenAI / Gemini 订阅账号。

就这些，其他的都不用你操心。

**二、CC 一键部署（最爽的部分）**

这里是整个教程的精髓——让 Claude 自己部署 Claude 的中转服务，很合理对吧？

打开 Claude Code，把下面这些信息告诉它：

— Sub2API 的 GitHub 地址：[https://github.com/Wei-Shaw/sub2api](https://github.com/Wei-Shaw/sub2api)— 你服务器的 IP 地址 — 你的 pem 密钥文件

然后就让 CC 干活。它会自动连接服务器、拉取镜像、安装依赖、配置数据库和 Redis，全程大概10分钟。

如果你有域名，顺便告诉 CC，它还会帮你把 Nginx 或 Caddy 配好，HTTPS 证书也一并搞定，一整套全自动。

不想用 CC 也行，终端一键脚本也能搞定：

curl -sSL [https://raw.githubusercontent.com/Wei-Shaw/sub2api/main/deploy/install.sh](https://raw.githubusercontent.com/Wei-Shaw/sub2api/main/deploy/install.sh) | sudo bashcurl -sSL [https://raw.githubusercontent.com/Wei-Shaw/sub2api/main/deploy/install.sh](https://raw.githubusercontent.com/Wei-Shaw/sub2api/main/deploy/install.sh) | sudo bash

装完浏览器访问你的域名或者 服务器IP:8080，直接进入 Web 面板。

![图像](https://pbs.twimg.com/media/HDaz-8sa4AEQ1yd?format=jpg&name=large)

**三、后台三步配置**

部署完成后打开面板，界面很清爽，核心就三个操作：

**第一步：添加上游账号**

进入「账号管理」，点添加。支持三种方式：

Claude → OAuth 授权，按提示走一遍就行，最简单。

OpenAI →OAuth 授权 ，一样简单

添加成功后状态显示「正常」就OK了。

![图像](https://pbs.twimg.com/media/HDa0Vu3aMAAx00a?format=jpg&name=large)

**第二步：生成 API Key**

进入「API Key 管理」，点创建。可以精细控制：

额度限制 → 用多少停多少，不怕超支。

速率限制 → 防滥用，起步建议设低点，别一上来就开高并发。

过期时间 → 到期自动失效。

生成后把 Key 复制出来就行。

![图像](https://pbs.twimg.com/media/HDa0hFWaAAA-qmf?format=jpg&name=large)

**第三步：配置使用**

拿到 Key 之后，Claude Code、Opencode 或者任何支持自定义 API 地址的工具都能用。

1. api key 界面有配置到CLI 和 Opencode 文档，复制粘贴就行
2. 如果要配置到龙虾，直接告诉CC 让他给你配置。

配好之后正常使用就行，跟直连体验没区别。

**四、写在最后 (记得给自己账号充值，才能用)**

整个流程就是：买服务器 → CC一键部署 → 加订阅账号 → 生成Key → 开玩。前后十来分钟的事，省下的是每个月大几百刀的共享Key费用。

> 懒得建的可以用我的。想要自己建不会的 私聊我，免费帮忙。

项目完全开源免费，MIT 协议，放心用。

> Sub2API 项目地址：[https://github.com/Wei-Shaw/sub2api](https://github.com/Wei-Shaw/sub2api)Sub2API 项目地址： [https://github.com/Wei-Shaw/sub2api](https://github.com/Wei-Shaw/sub2api)

> CRS（前身项目）：[https://github.com/Wei-Shaw/claude-relay-service](https://github.com/Wei-Shaw/claude-relay-service)CRS（前身项目）： [https://github.com/Wei-Shaw/claude-relay-service](https://github.com/Wei-Shaw/claude-relay-service)

> 在线 Demo 体验：[https://v2.pincc.ai](https://v2.pincc.ai/)在线演示体验： [https://v2.pincc.ai](https://v2.pincc.ai/)

如果这篇教程帮到你了，转发一下让更多被封号的兄弟看到。

你现在用哪个中转方案最稳？评论区聊聊，我来对比测评。有问题也直接评论，我尽量帮答。

[#Claude](https://x.com/search?q=%23Claude&src=hashtag_click) [#ClaudeCode](https://x.com/search?q=%23ClaudeCode&src=hashtag_click) [#Sub2API](https://x.com/search?q=%23Sub2API&src=hashtag_click) [#AI](https://x.com/search?q=%23AI&src=hashtag_click) [#开源](https://x.com/search?q=%23%E5%BC%80%E6%BA%90&src=hashtag_click) [#自建中转](https://x.com/search?q=%23%E8%87%AA%E5%BB%BA%E4%B8%AD%E8%BD%AC&src=hashtag_click)#Claude #ClaudeCode #Sub2API #AI #开源#自建中转