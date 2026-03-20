---
title: "用Claude Skills做PPT，真实演示"
source: "https://mp.weixin.qq.com/s?__biz=MzI1MTUxNzgxMA==&mid=2247499265&idx=1&sn=ec4352b48d8b0b292c78bbb4652c4716&scene=21&poc_token=HC5wHGmj8cwMwRmV7nIHQf04JO__B6R1J9NrIG06"
author:
  - "[[刘小排]]"
published:
created: 2025-11-18
description: "今天我要解决的一个真实问题： 本周末我要做两天一夜的线下课，要做PPT。正好用昨天提到的Claude Skll来帮助我"
tags:
  - "clippings"
---
![cover_image](https://mmbiz.qpic.cn/mmbiz_jpg/607DKnuWzlGpF5d51UM7WN3YMibk9ib2n9DN05icxOic6rUGe46fh3SQvRVKYLFxUq1PEXuImeU5hupwdJ4ibwHT3SQ/0?wx_fmt=jpeg)

原创 刘小排 [刘小排r](https://mp.weixin.qq.com/) *2025年10月20日 14:46*

大家好，我是小排。

今天我要解决的一个真实问题： 本周末我要做两天一夜的线下课，要做PPT。

面对的挑战

- 整整两天一夜啊！那就意味着，我需要做一个超越200页的PPT！
- 我已经有讲义的文字稿了，需要分段把讲义文字变成PPT设计。
- 每一页内容都需要自己打磨，无法靠gamma或者Manus等AI PPT工具一把梭。
- 每一页内容的风格要一致，审美要高级。
- PPT模板是给定的，必须要符合模板风格。

正好，现在有了Claude Skills，上述问题就简单了。还不知道什么是Claude Skill的同学，可以看上节课 [技术圈吹爆的Claude Skills，小白用起来比程序员还爽](https://mp.weixin.qq.com/s?__biz=MzI1MTUxNzgxMA==&mid=2247499243&idx=1&sn=f8750d2e3e47f51144cd695ac1337562&scene=21#wechat_redirect)

下面演示我的实际工作过程。

  

整体思路

1. 制定风格 ：在Claude里聊天，给出我的要求和PPT模板的风格，让Claude试出我满意的风格。
2. 解决粘贴到PPT模板问题 ：使用透明PNG。让Claude输出的卡片有“一键变成透明PNG”的功能，这样粘贴到PPT里，可以把背景透出来。
3. 解决稳定性问题 ：调试完成后，让Claude把刚才的所有要求封装为一个Skill。以后新开窗口，通知Claude用Skill来创建单页

  

制定风格

让我先选取了模板风格，纯粹文字和Claude对话

![图片](https://mmbiz.qpic.cn/mmbiz_png/607DKnuWzlGpF5d51UM7WN3YMibk9ib2n9ic77dMBzVtCtnOLVfdib8TumgiahzaJXmgjeRyaqHT8yZa7uaLibuqqPfw/640?wx_fmt=png&from=appmsg&watermark=1&tp=webp&wxfrom=5&wx_lazy=1#imgIndex=0)

刚出来的第一版，我不喜欢，如下图所示。

不过没关系，我可以继续和它聊天调整，直到满意为止。

![图片](https://mp.weixin.qq.com/www.w3.org/2000/svg'%20xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Ctitle%3E%3C/title%3E%3Cg%20stroke='none'%20stroke-width='1'%20fill='none'%20fill-rule='evenodd'%20fill-opacity='0'%3E%3Cg%20transform='translate(-249.000000,%20-126.000000)'%20fill='%23FFFFFF'%3E%3Crect%20x='249'%20y='126'%20width='1'%20height='1'%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3C/svg%3E)

反复打磨后，看到这样的效果，我感觉可以接受了

![图片](https://mp.weixin.qq.com/www.w3.org/2000/svg'%20xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Ctitle%3E%3C/title%3E%3Cg%20stroke='none'%20stroke-width='1'%20fill='none'%20fill-rule='evenodd'%20fill-opacity='0'%3E%3Cg%20transform='translate(-249.000000,%20-126.000000)'%20fill='%23FFFFFF'%3E%3Crect%20x='249'%20y='126'%20width='1'%20height='1'%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3C/svg%3E)

  

变成Skill

风格打磨完成后，告诉Claude：变成一个Skill。它会继续引导我们。

![图片](https://mp.weixin.qq.com/www.w3.org/2000/svg'%20xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Ctitle%3E%3C/title%3E%3Cg%20stroke='none'%20stroke-width='1'%20fill='none'%20fill-rule='evenodd'%20fill-opacity='0'%3E%3Cg%20transform='translate(-249.000000,%20-126.000000)'%20fill='%23FFFFFF'%3E%3Crect%20x='249'%20y='126'%20width='1'%20height='1'%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3C/svg%3E)

  

![图片](https://mp.weixin.qq.com/www.w3.org/2000/svg'%20xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Ctitle%3E%3C/title%3E%3Cg%20stroke='none'%20stroke-width='1'%20fill='none'%20fill-rule='evenodd'%20fill-opacity='0'%3E%3Cg%20transform='translate(-249.000000,%20-126.000000)'%20fill='%23FFFFFF'%3E%3Crect%20x='249'%20y='126'%20width='1'%20height='1'%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3C/svg%3E)

  

记得下载安装

  

![图片](https://mp.weixin.qq.com/www.w3.org/2000/svg'%20xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Ctitle%3E%3C/title%3E%3Cg%20stroke='none'%20stroke-width='1'%20fill='none'%20fill-rule='evenodd'%20fill-opacity='0'%3E%3Cg%20transform='translate(-249.000000,%20-126.000000)'%20fill='%23FFFFFF'%3E%3Crect%20x='249'%20y='126'%20width='1'%20height='1'%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3C/svg%3E)

  

![图片](https://mp.weixin.qq.com/www.w3.org/2000/svg'%20xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Ctitle%3E%3C/title%3E%3Cg%20stroke='none'%20stroke-width='1'%20fill='none'%20fill-rule='evenodd'%20fill-opacity='0'%3E%3Cg%20transform='translate(-249.000000,%20-126.000000)'%20fill='%23FFFFFF'%3E%3Crect%20x='249'%20y='126'%20width='1'%20height='1'%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3C/svg%3E)

  

不知道如何安装的同学，请继续复习上节课 [技术圈吹爆的Claude Skills，小白用起来比程序员还爽](https://mp.weixin.qq.com/s?__biz=MzI1MTUxNzgxMA==&mid=2247499243&idx=1&sn=f8750d2e3e47f51144cd695ac1337562&scene=21#wechat_redirect)

  

  

使用Skill

  

新开一个聊天窗口，告诉它，用Skill来设计。

  

![图片](https://mp.weixin.qq.com/www.w3.org/2000/svg'%20xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Ctitle%3E%3C/title%3E%3Cg%20stroke='none'%20stroke-width='1'%20fill='none'%20fill-rule='evenodd'%20fill-opacity='0'%3E%3Cg%20transform='translate(-249.000000,%20-126.000000)'%20fill='%23FFFFFF'%3E%3Crect%20x='249'%20y='126'%20width='1'%20height='1'%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3C/svg%3E)

  

它可以稳定发挥

![图片](https://mp.weixin.qq.com/www.w3.org/2000/svg'%20xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Ctitle%3E%3C/title%3E%3Cg%20stroke='none'%20stroke-width='1'%20fill='none'%20fill-rule='evenodd'%20fill-opacity='0'%3E%3Cg%20transform='translate(-249.000000,%20-126.000000)'%20fill='%23FFFFFF'%3E%3Crect%20x='249'%20y='126'%20width='1'%20height='1'%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3C/svg%3E) ![图片](https://mp.weixin.qq.com/www.w3.org/2000/svg'%20xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Ctitle%3E%3C/title%3E%3Cg%20stroke='none'%20stroke-width='1'%20fill='none'%20fill-rule='evenodd'%20fill-opacity='0'%3E%3Cg%20transform='translate(-249.000000,%20-126.000000)'%20fill='%23FFFFFF'%3E%3Crect%20x='249'%20y='126'%20width='1'%20height='1'%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3C/svg%3E)

  

怎么样？是不是既符合苹果的设计风格、又有我要求的主题颜色？

点击“复制透明PNG”

![图片](https://mp.weixin.qq.com/www.w3.org/2000/svg'%20xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Ctitle%3E%3C/title%3E%3Cg%20stroke='none'%20stroke-width='1'%20fill='none'%20fill-rule='evenodd'%20fill-opacity='0'%3E%3Cg%20transform='translate(-249.000000,%20-126.000000)'%20fill='%23FFFFFF'%3E%3Crect%20x='249'%20y='126'%20width='1'%20height='1'%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3C/svg%3E) ![图片](https://mp.weixin.qq.com/www.w3.org/2000/svg'%20xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Ctitle%3E%3C/title%3E%3Cg%20stroke='none'%20stroke-width='1'%20fill='none'%20fill-rule='evenodd'%20fill-opacity='0'%3E%3Cg%20transform='translate(-249.000000,%20-126.000000)'%20fill='%23FFFFFF'%3E%3Crect%20x='249'%20y='126'%20width='1'%20height='1'%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3C/svg%3E)

把透明PNG粘贴到模板里，感觉挺合适的！

![图片](https://mp.weixin.qq.com/www.w3.org/2000/svg'%20xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Ctitle%3E%3C/title%3E%3Cg%20stroke='none'%20stroke-width='1'%20fill='none'%20fill-rule='evenodd'%20fill-opacity='0'%3E%3Cg%20transform='translate(-249.000000,%20-126.000000)'%20fill='%23FFFFFF'%3E%3Crect%20x='249'%20y='126'%20width='1'%20height='1'%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3C/svg%3E) ![图片](https://mp.weixin.qq.com/www.w3.org/2000/svg'%20xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Ctitle%3E%3C/title%3E%3Cg%20stroke='none'%20stroke-width='1'%20fill='none'%20fill-rule='evenodd'%20fill-opacity='0'%3E%3Cg%20transform='translate(-249.000000,%20-126.000000)'%20fill='%23FFFFFF'%3E%3Crect%20x='249'%20y='126'%20width='1'%20height='1'%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3C/svg%3E)

  

期待你的反馈！

下课！

  

![](https://mmbiz.qlogo.cn/sz_mmbiz_jpg/DhduwiaBa7ldgxWkOrnJibVtD0cKVoJBHEziaHTYfvCJyTic0ibGKbQrW7nAJibUosia6upxFMrXRcQ6pE/0?wx_fmt=jpeg)

我也喜欢你哦 (⑉• •⑉)‥♡

 [喜欢作者](https://mp.weixin.qq.com/)

继续滑动看下一个

刘小排r

向上滑动看下一个

刘小排r