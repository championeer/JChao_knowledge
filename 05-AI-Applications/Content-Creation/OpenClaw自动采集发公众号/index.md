---
title: "手把手教会你用小龙虾自动收集全网资讯整理发公众号"
source: "https://x.com/ezshine/status/2031224897004052789"
author:
  - "[[Unknown]]"
published: 2026-03-10
created: 2026-03-11
description: "#TruthSeeker #INTJ #AIxEverything事上磨练，道在行中"
tags:
  - "clippings"
---
其实这篇教程很早就写好了，我一直在等，等我跑出来真实的收益数据，我才好分享给大家。

![图像](https://pbs.twimg.com/media/HC-fR53bwAAe-fG?format=png&name=large)

从 2 月 20 日我开始给 OpenClaw 下达每日收集资讯并发布到微信公众号的任务，至今已经跑了半个月有余，一共 16 篇文章，一篇约 10w+，一篇 1.8w，剩下的大部分都在三四百个阅读。

![图像](https://pbs.twimg.com/media/HDBSp_maMAUgyXj?format=png&name=large)

但是好在成本几乎为 0，因为全是龙虾自己收集信息自己配图自己发文，一篇文章的 TOKEN 消耗成本大概是 1 块钱多点。任何生意都要看 ROI（投入产出比），ROI 能是正的，我觉得还可以做的。

下面手把手来教大家让自家小龙虾也构建起一套自动发公众号的功能

准备工作：

1. 微信公众号（无需认证）
2. 微信开发者平台 （[https://developers.weixin.qq.com/](https://developers.weixin.qq.com/)）
3. 文生图接口

> 这里我推荐用兔子 api， nanobanana 模型仅需 4 毛一张图，注册 [https://api.tu-zi.com/register?aff=Itmf](https://api.tu-zi.com/register?aff=Itmf)

**第一步：访问 微信开发者平台**

[https://developers.weixin.qq.com/](https://developers.weixin.qq.com/)

![图像](https://pbs.twimg.com/media/HBcNhpZa8AAccnV?format=jpg&name=large)

登录后找到你的公众号

![图像](https://pbs.twimg.com/media/HDBTP4baAAALZKe?format=jpg&name=large)

点击 **开发密钥** 下面 AppSecret 的重置按钮，找个记事本记录下你的公众号的 AppID 和 AppSecret

![图像](https://pbs.twimg.com/media/HDBTlU0aMAozpsQ?format=jpg&name=large)

最重要的，微信公众号这个自动发文的接口仅允许从特定的 IP 白名单发起请求。家用宽带通常没有固定的 IP，所以最好是有服务器，为了让大部分没有服务器的朋友也能用上，大家可以使用我搭建的服务，在 IP 白名单这里设置

> 155.94.132.10

设置好之后，这个网页就可以关掉了

**第二步：教你的龙虾****🦞****学会找资讯，整理生成文章**

- [https://tophub.today/c/news](https://tophub.today/c/news)
- [https://news.google.com/atom/search?q=AI+Internet+Developer&hl=zh-CN&gl=CN&ceid=CN:zh-Hans](https://news.google.com/atom/search?q=AI+Internet+Developer&hl=zh-CN&gl=CN&ceid=CN:zh-Hans)

我这里推荐大家用 Google News 的官方RSS API，免费，稳定，并且支持使用关键词进行特定领域的查询，直接把这个 Google News 的链接发给你的龙虾即可。

![图像](https://pbs.twimg.com/media/HDBUxVuaEAEZC63?format=jpg&name=large)

**第三步：教你的龙虾****🦞****给文章配图**

我用的是推友 [@tuzi\_ai](https://x.com/@tuzi_ai) 家的生图 API，一般一篇文章配两张图，封面一张。正文一张。也就是一篇文章在配图上的成本大概 8 毛钱左右。

![图像](https://pbs.twimg.com/media/HDBVGY8aMAAmOfJ?format=jpg&name=large)

注册并充值后获取到自己的 API KEY

![图像](https://pbs.twimg.com/media/HDBVrdmaQAATQVU?format=jpg&name=large)

然后把你的 key 和这个生图 API 如何调用的说明文档 [https://api.dashu.ai/tuziapi/skills.md](https://api.dashu.ai/tuziapi/skills.md)

一起发给你的龙虾

**第四步：教你的龙虾****🦞****调用公众号官方的发文接口**

为了方便不懂技术的朋友使用，可以直接让你的龙虾读下面这个链接

[https://api.dashu.ai/mpapi/skills.md](https://api.dashu.ai/mpapi/skills.md)

然后把你前面在微信开发者后台复制的 APP\_ID 和 APP\_SECRET 也发给你的龙虾。

然后，你就让你的小龙虾去执行任务把，也可以让它每天定时执行，我个人是每天定时执行两次，上午一次，下午六点再一次，这样的话，我一般晚上发文可以有两条供我选择。

![图像](https://pbs.twimg.com/media/HBcTCjAbgAEzFO6?format=jpg&name=large)

**下面是一些个人在写文章上的技巧：**

1. 让 AI 模仿你喜欢的，符合你赛道内容的脱口秀演员的风格口语化的撰写文章，因为脱口秀演员的文风通常比较犀利，也很通俗易懂，还带些幽默，往往能获得比较好的流量。
2. 生成图片时可以用 [@vista8](https://x.com/@vista8) 的 mondo 风格 skill 生图[https://x.com/vista8/status/2030586507493573039](https://x.com/vista8/status/2030586507493573039) ，图片很漂亮，但是我个人实测，封面图是一定要有，但是风格对于流量而言没那么重要。
3. 既然都是 AI 帮你写的了，你就标原创，没问题的，我篇篇都是标的原创。至于创作来源要不要说明是 内容由 AI 生成，你自己看，这个要自己担风险，我个人是不声明创作来源的。
4. 切记，“”平台推荐“”一定要打开，没有平台推荐的，这事我都不建议大家去做。
5. 公众号 500 粉才能开流量主（也就是靠广告赚米），不达标的自己去淘宝搜吧，大概是 50-70 左右就可以买到。

如果你连小龙虾都还没有，也不用慌，整个流程我在 Android 手机上部署小龙虾也全部跑通了，我老婆的微信公众号现在就是在一台 Android 手机上跑的小龙虾自动发的。

所以看完本教程 100% 可以搞定，但是如果真有看了文章还没能搞定的，进下面这个群里AT 我

ℹ️ X Growth 增长运营俱乐部 [https://x.com/i/chat/group\_join/g1996549145692352647/FexgGXksFF](https://x.com/i/chat/group_join/g1996549145692352647/FexgGXksFF)ℹ️ X Growth 增长运营俱乐部 [https://x.com/i/chat/group\_join/g1996549145692352647/FexgGXksFF](https://x.com/i/chat/group_join/g1996549145692352647/FexgGXksFF)