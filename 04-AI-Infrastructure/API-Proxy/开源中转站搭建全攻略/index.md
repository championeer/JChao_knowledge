---
title: "Post by @sukie234 on X"
source: "https://x.com/sukie234/status/2052064204132155676"
author:
  - "[[@sukie234]]"
published: 2026-05-07
created: 2026-05-07
description: "运营中转站这段时间是真没赚到钱，只能说勉强cover了我自己用ai的消费。 所以目前打算把开中转站的一切全部开源，包含如何建站+营销，门槛最低，让这个行业更卷一点。 首先整个系统由3个部分组成： • 第CN2 回国专线服务器：放在海外但回国速度极快的 VPS，作为运行核心。 •"
tags:
  - "clippings"
---
运营中转站这段时间是真没赚到钱，只能说勉强cover了我自己用ai的消费。

所以目前打算把开中转站的一切全部开源，包含如何建站+营销，门槛最低，让这个行业更卷一点。

首先整个系统由3个部分组成：

• 第CN2 回国专线服务器：放在海外但回国速度极快的 VPS，作为运行核心。

• sub2api：核心程序，负责把网页账号转成 API 接口。

• Cloudflare：把流量再绕一道，提升国内访问速度，同时隐藏真实服务器 IP。

你需要准备：

• 一台 CN2 GIA 或 CN2 GT 线路的海外 VPS（推荐配置：2 核 CPU、2GB 内存、20GB 硬盘以上）。

普通海外 VPS 在国内晚高峰几乎不可用，而 CN2 GIA 通过专线绕开了拥堵的公网节点，国内访问延迟一般在 150ms 以内。如果你买了不是 CN2 的服务器，国内用户体验会非常糟糕。

• 一个域名（建议在 Cloudflare 或 Namecheap 上购买，便宜的 .top 或 .xyz 也行，几块钱一年）。

• 一个 Cloudflare 账号（免费）。

• 号池：初期可以用 claude code pro 账户+ 注册大量gpt账户，货比三家去找到别的号商卡商，等后期你就可以搞claude code max kiro 反代 aws bedrock（去跟sales聊，基本能搞到7.2折），但是初期只需要保障claude code pro账号稳定即可，因为你需要养号，后期转max。

完整请求路径如下：

国内用户的客户端 → 解析到 Cloudflare 的 IP → Cloudflare 边缘节点 → CN2 专线回源到你的服务器 → 宝塔面板的 Nginx 反向代理 → sub2api 程序 → 你的号池 → ChatGPT 或 Claude 网页 → 数据原路返回。

购买并初始化CN2服务商

CN2 GIA 线路的常见服务商有 BandwagonHost（搬瓦工）、RackNerd、CloudCone、Lisahost。新手推荐搬瓦工的 CN2 GIA-E 套餐，稳定但价格略贵。预算紧的可以看 Lisahost 的香港 CN2 套餐。

如果你懂命令行搭建Nginx，手动部署SSL证书，那你就自己搞，如果你不懂可以使用中国程序员流行的宝塔面板，一键搭建Nginx、一键部署SSL证书、可视化配置反向代理，全程鼠标点击操作，新手也能轻松上手。

安装完Linux + Nginx + MySQL + PHP，就可以开始设置防火墙，够买域名，添加DNS解析。

最后去命令行输入ping.api.你购买的域名，返回服务器ip就行了。

搭建sub2api:

sub2api 是一个开源项目，可以把 ChatGPT 网页版、Claude 网页版的 cookie 或者 session 转换成 OpenAI 兼容的 API 接口。

打开sub2api的官方教程，安装流程安装docker，拉取并启动sub2api的容器。

你需要把号池数据放到 /www/sub2api/data 目录下，sub2api 容器会读取这个目录。具体格式参考 sub2api 项目文档。

设置Nginx反向代理

添加完之后目标url是127.0.0.1:8080因为 sub2api 容器监听的就是这个地址。Nginx 收到外部请求后，转给本机的 8080 端口，sub2api 处理完返回给 Nginx，Nginx 再发回给用户。

后面你去问claude code 如何优化Nginx的配置，AI API 调用是流式响应（SSE），需要长连接 + 不缓存才能正常工作。默认 Nginx 配置在这种场景下会出问题，按照claude的提示优化，proxy\_buffering 必须关闭，如果不关闭这个，AI 的回答会"卡一阵 → 一次性吐出"，而不是逐字流式输出。客户端会感觉非常慢甚至超时。

申请HTTPS证书：

OpenAI 兼容客户端基本只信任 HTTPS。HTTP 明文会暴露 API Key 给中间网络。

申请好Let's Encrypt证书之后，回到 SSL 主界面，把"强制 HTTPS"开关打开。

优化Cloudflare配置

测试HTTPS-开启cloudflare代理-Cloudflare SSL 模式必须设为 Full (strict)

AI API 是动态接口，Cloudflare 的某些"优化"会破坏流式响应。

Cloudflare → 你的域名 → 速度 → 优化。

全部关掉以下选项：

• Auto Minify（自动压缩 HTML/CSS/JS）：关闭。

• Rocket Loader：关闭。

• Mirage：关闭。

• Polish：关闭。

设置缓存规则：

Cloudflare → 缓存 → 配置。

Caching Level 选 Bypass，或者保持 Standard 但是后面用页面规则覆盖。

更彻底的做法：Cloudflare → 规则 → 页面规则 → 创建页面规则。

URL 模式：http://api.example.com\*

设置：Cache Level = Bypass

设置防火墙规

Cloudflare → 安全性 → WAF → 自定义规则 → 创建规则。

规则一：限制单个 IP 频率

字段：IP source address，操作：Rate limiting，每 10 秒最多 30 次请求，超出后挑战或屏蔽 1 小时。

规则二：屏蔽明显恶意爬虫

字段：User Agent，运算符：包含，值：python-requests

启用 Cloudflare Argo Smart Routing，每月 5 美元，能在 Cloudflare 内部用最优路径路由你的流量。对国内用户访问海外服务器有 30% 到 50% 的速度提升。预算够推荐开。

测试上线

用 curl 测试 API，或者打开 CherryStudio 或 ChatBox，填写你的api地址和key做测试

使用Prometheus/Grafana，或者直接用宝塔面板做监控，可以看到 CPU、内存、流量实时数据。如果 sub2api 容器经常吃满 CPU，考虑升级服务器配置。

---

常见问题

问题 1：客户端报 502 Bad Gateway

原因：sub2api 容器没运行。解决：docker ps 检查容器状态，docker logs 看错误原因，docker restart sub2api 尝试重启。

问题 2：流式响应卡住，憋很久才一次性输出

原因：Nginx 配置 proxy\_buffering 没关。解决：检查第五章的 Nginx 配置是否正确保存。

---

如何营销的part

> **sukie @sukie234** · 2026-05-06
> 
> 写完技术部分来写一下如何推广营销：
> 
> 营销这部分算是我的专长，首先我们需要一句话写清楚我们这个产品的优势：
> 
> 国内直连、高稳定、多模型 AI API 中转，支持 GPT-4o/Claude Opus 满血，企业级技术支持。
> 
> 另外确定目标用户：
> 
> 1\. 个人开发者： x.com/sukie234/statu…

---

## Comments

> **流明 @byZh** · [2026-05-06](https://x.com/byZh/status/2052071936260530644)
> 
> 还有个关键的点是，中转站的用户管理，计费，套餐设计等
> 
> > **sukie @sukie234** · [2026-05-06](https://x.com/sukie234/status/2052073113123229813)
> > 
> > vibe coding一下就行了 我没写因为这部分自己设计就行

> **Nonviolence @NoViolentDiscus** · [2026-05-06](https://x.com/NoViolentDiscus/status/2052079448665518207)
> 
> 请问搭建起来需要多少时间和多少启动资金？
> 
> > **sukie @sukie234** · [2026-05-06](https://x.com/sukie234/status/2052080972263256546)
> > 
> > 一周之内
> > 
> > 启动资金：
> > 
> > 购买服务器域名 20刀
> > 
> > pro 账号5个 100刀/月 可以10-25人同时在线
> > 
> > 每超过10人再加2个号
> > 
> > codex 闲鱼号池 5-10rmb一个号 搞100个 500-1000人民币
> > 
> > 启动总成本 $190-200

> **Somke @olikeleo** · [2026-05-06](https://x.com/olikeleo/status/2052070554778181654)
> 
> 想低价用gpt5.5的pro模式，有没有好的直接调用的
> 
> > **sukie @sukie234** · [2026-05-06](https://x.com/sukie234/status/2052071249682059344)
> > 
> > 你在闲鱼上找号商 多问几家

> **海草 @SoonCrush** · [2026-05-06](https://x.com/SoonCrush/status/2052069915448999982)
> 
> 赚钱的核心是用户，不是其他乱七八糟的😂
> 
> > **sukie @sukie234** · [2026-05-06](https://x.com/sukie234/status/2052070533341045233)
> > 
> > 看这条如何获客
> > 
> > > **sukie @sukie234** · 2026-05-06
> > > 
> > > 写完技术部分来写一下如何推广营销：
> > > 
> > > 营销这部分算是我的专长，首先我们需要一句话写清楚我们这个产品的优势：
> > > 
> > > 国内直连、高稳定、多模型 AI API 中转，支持 GPT-4o/Claude Opus 满血，企业级技术支持。
> > > 
> > > 另外确定目标用户：
> > > 
> > > 1\. 个人开发者： x.com/sukie234/statu…

> **BJC.ETH @SmokeyDougie** · [2026-05-06](https://x.com/SmokeyDougie/status/2052085120266571815)
> 
> 啥时候搞了中转！