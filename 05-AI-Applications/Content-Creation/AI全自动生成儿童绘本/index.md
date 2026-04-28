---
title: "我用 CREAO × GPT-Image-2 做了一本全自动生成的女儿绘本"
source: "https://x.com/zstmfhy/status/2047263960005845109"
author:
  - "[[@zstmfhy]]"
published: 2026-04-23
created: 2026-04-23
description: "「爸爸，能给我讲一个我是主角的故事吗？」上周六晚上，女儿拉着我的衣角这么问。那一刻我意识到——市面上所有的绘本都不是为她写的。先看 2 分钟视频。这是我在 CREAO 上搭的 Agent：输入一个书名，自动产出一份完整绘本 PDF。1:4614 页。全家出镜。画风统一。0 次手工..."
tags:
  - "clippings"
---
![Image](https://pbs.twimg.com/media/HGlXm3YbMAAmXBJ?format=jpg&name=large)

> 「爸爸，能给我讲一个**我是主角**的故事吗？」上周六晚上，女儿拉着我的衣角这么问。那一刻我意识到——市面上所有的绘本都不是为她写的。

先看 2 分钟视频。这是我在 CREAO 上搭的 Agent：**输入一个书名，自动产出一份完整绘本 PDF。**

<video preload="none" tabindex="-1" playsinline="" aria-label="Embedded video" poster="https://pbs.twimg.com/amplify_video_thumb/2047248768589070336/img/LM1dAQanhppPdu2B.jpg" style="width: 100%; height: 100%; position: absolute; background-color: black; top: 0%; left: 0%; transform: rotate(0deg) scale(1.005);"><source type="video/mp4" src="blob:https://x.com/6e77c9ba-6b10-4110-bdb3-7ee57afb5116"></video>

1:46

14 页。全家出镜。画风统一。0 次手工干预。

下面讲我是怎么做到的。

## 1\. 我要的不是一本绘本，是每天一本

角色一致性？那是 2024 年的问题。

到 2026 年，GPT-Image-2、Nano Banana Pro、Flux Kontext 都已经把这件事做成了标配。**想画一本画风统一、主角不崩的绘本，今天技术上不再是门槛。**

真正让我卡住的，是下面这个场景：

> 第一本绘本我花了一整天做出来，女儿很喜欢。三天后，她问我：「爸爸，能再讲一个新故事吗？」我又得把那一整天重来一遍。

**AI 绘本的真问题从来不是「能不能做出一本」，而是「能不能源源不断地做下去」。**

做一次作品是魔法，做一条生产线是工程。

市面上所有的画图工具都在帮你完成"一次作品"——

我要的是一条**永久在线的生产线**：输入一个书名，自动产出一本新绘本。

这篇文章要讲的所有东西，都建立在这个视角上。

## 2\. 准备工作：把全家做成「角色卡」

要让生产线跑起来，第一步是给它准备"原材料"——**一次性**做好的人物档案。

我用 GPT-Image-2 做了 5 张角色卡：爸爸、妈妈、女儿、爷爷、奶奶。做完之后一劳永逸，未来所有绘本都用这 5 张。

![Image](https://pbs.twimg.com/media/HGlOLESb0AAeKAb?format=jpg&name=large)

做角色卡时我踩过几个坑，分享三条关键 tip：

- **背景完全一致**：所有角色卡都用浅米色纯背景。只要背景变了，模型就会拿背景当"参考语境"，下一次画出来的风格就飘了
- **特征描述具象化**：不要说"可爱小女孩"。要说"圆脸颊、粉腮红、两撮红头绳、黄色小花 T 恤"。越具体，一致性越高
- **人物占幅比例固定**：每张角色卡里人物大小都占画幅 60% 左右。这样拼参考图时视觉权重均衡

## 3\. 把「一次性操作」固化成「一个按钮」

有了角色卡，我可以手动一页一页喂给 GPT-Image-2。12 页插图的话，就是 12 段 prompt、12 次调参、12 张下载、自己拼 PDF。

做完一本，下一本**从头再来**。

我要的是把这整个流程**固化成一个按钮**——下一次做新绘本，只要一句话：**输入书名，直接拿 PDF**。

翻译成工程语言，就是一条四节点的流水线：

用户输入 → 剧情大纲 → 角色拼图 → 逐页插图 → PDF 合成

关键是：这条流水线**必须被保存下来、随时可以再跑一次**。

这才是 CREAO 真正能干、而大多数 AI 工具干不了的事——

**把一次性的 AI 操作，沉淀成一个可以反复 Run 的 Agent。**

## 4\. 在 CREAO 上搭「儿童绘本一键生成器」（核心教程）

先看整体架构：

┌─────────────────────────────┐ │ 👤 用户输入 │ │ 书名 / 主题 / 页数 │ └──────────────┬──────────────┘ ▼ ┌────────────────────────────────────────┐ │ 🧠 CREAO Agent · 儿童绘本一键生成器 │ │ │ │ ① 剧情大纲生成 ─ Claude Sonnet 4.6 │ │ ▼ │ │ ② 角色模板拼图 ─ Python（拼 5 张卡） │◀── 📎 角色卡 │ ▼ │ │ ③ 逐页插图生成 ─ GPT-Image-2 │ │ ▼ │ │ ④ PDF 合成 ─ Python HTML→PDF │ └─────────────────┼──────────────────────┘ ▼ 📘 成品 PDF · 14 页 · 13.1MB

![Image](https://pbs.twimg.com/media/HGlPrZpaIAAsIRJ?format=png&name=large)

节点 ① · 剧情大纲生成（LLM 节点）

选 CREAO 内置的 Claude Sonnet 4.6。Prompt 大致是这样：

你是一位儿童绘本编剧。 根据书名《{book\_title}》和主题「{theme}」， 创作一个 {page\_count} 页的故事大纲。 要求： - 每页剧情不超过 30 字 - 主角是 3-4 岁的小女孩「汤圆」 - 必须体现主题，结尾温馨治愈 - 每页只能出现 2-4 个角色，不要出现路人 - 场景尽量多样化（家里/户外/白天/夜晚） 输出 JSON 数组，每项包含：page / scene / characters / mood

节点 ② · 角色模板拼图（Python 代码节点）

**这一步是全流程的灵魂。** 把 5 张角色卡拼成一张大参考图，后续所有插图都引用它。

from PIL import Image import os names = \["爸爸", "妈妈", "女儿", "爷爷", "奶奶"\] imgs = \[[Image.open](https://image.open/)(f"/path/to/{name}照片.png") for name in names\] total\_w = sum(i.width for i in imgs) + 10 \* (len(imgs) - 1) max\_h = max(i.height for i in imgs) canvas = [Image.new](https://image.new/)("RGB", (total\_w, max\_h), "white") x = 0 for img in imgs: canvas.paste(img, (x, 0)) x += img.width + 10 [canvas.save](https://canvas.save/)("/tmp/all\_chars\_ref.png")

为什么重要：**拼好一次，12 页插图都复用它。** 成本降 92%、角色一致性拉满。

节点 ③ · 逐页插图生成（图像模型节点）

这是整条流水线的产出节点。每页 prompt 骨架固定，只换场景描述：

flat 2D cartoon illustration, clean bold outlines, chibi style, bright soft pastel colors, simple clean background, round chubby faces with rosy cheeks, Chinese children picture book style, smooth flat coloring. EXACTLY {n} characters only: {characters\_from\_outline} Scene: {page\_scene} NO other people. NO text in image.

**参考图**那一栏挂上节点 ② 拼好的 all\_chars\_ref.png。

这就是模型能在 12 页里画出「同一个汤圆」的秘密——它每次都在看这张拼图。

节点 ④ · PDF 合成（Python 代码节点）

最后一步最朴素：12 张图 + 封面 + 结尾页，拼 HTML，转 PDF。

html = f"<html><body>{''.join(pages\_html)}</body></html>" filename = f"《{book\_title}》\_绘本\_{int(time.time())}.pdf" HTML(string=html).write\_pdf(f"/tmp/{filename}")

## 5\. 点一下 Run，8 分钟拿到第一本

暂时无法在飞书文档外展示此内容

Agent 第一次运行的成品：

![Image](https://pbs.twimg.com/media/HGlRXv1boAAa28h?format=png&name=large)

[pdf/汤圆学会了分享\_绘本\_1776479424.pdf at main · zstmfhy/pdf](https://github.com/zstmfhy/pdf/blob/main/%E6%B1%A4%E5%9C%86%E5%AD%A6%E4%BC%9A%E4%BA%86%E5%88%86%E4%BA%AB_%E7%BB%98%E6%9C%AC_1776479424.pdf)

女儿翻开 PDF 的那一刻——她指着第 3 页说：「**这是爷爷**！」

那一刻这件事就值了。

## 6\. 真正的红利：Agent 被「存」了下来

这是我想重点讲的部分。**前面所有的搭建工作，CREAO 帮我做了两件关键的事：**

🔒 自动保存，终生复用

Agent 搭完自动进我的工作空间。下一次我想做新绘本，**不是"再搭一次"，而是"点一下 Run"**。

- 第二本绘本《汤圆去探索大自然》 → 输入 3 个字，等 8 分钟
- 第三本绘本《汤圆和小豆的一天》 → 输入 3 个字，等 8 分钟
- ……
- 第一百本 → 还是 3 个字，8 分钟

**这才是"永久生产线"的真正含义**——魔法的成本是一次性的，快乐是永续的。

📦 一键克隆，分享给任何人

CREAO 的 Agent 可以**分享链接**。意思是——

我这个「儿童绘本一键生成器」，你扫码/点链接就能**一键拷贝到你的工作空间**，换上你家人的角色卡，5 分钟后你也有一台"女儿绘本机"。

你也可以把它继续改：

- 🎨 换成自己家人的角色卡
- ✏️ 改剧情 prompt，讲你想讲的故事（睡前 / 科普 / 成长）
- 🖌️ 换插图风格：水彩 / 剪纸 / 宫崎骏
- 📚 扩展为系列合集，一个角色库 + N 个主题批量产出

**全部改 prompt 就行，不用写一行代码。**

## 7\. 女儿未来每天一本新绘本

写到这里我才想起，最开始的问题是：

> 「爸爸，能给我讲一个我是主角的故事吗？」

这个问题，现在不需要再单独回答——

她只要说一个主题，我输入一句话，**周天晚上睡前就有一本新书**。

这是 AI 让普通人生活里，最温柔的一次改变。

而让这件事\*\*从「能做一次」变成「能一直做」\*\*的，不是某个画图模型，是 CREAO。

## 动手试试

🔗 **CREAO 官网** · [https://agent.creao.ai/signup?ref=sySGgpYfjx](https://agent.creao.ai/signup?ref=sySGgpYfjx)

🚀 **免费注册** · [https://agent.creao.ai/signup](https://agent.creao.ai/signup)

📖 **文档中心** · [https://docs.creao.ai](https://docs.creao.ai/)

🧩 **集成生态** · [https://creao.ai/integrations](https://creao.ai/integrations)

💬 **Discord 社区** · [https://discord.gg/creao-ai](https://discord.gg/creao-ai)

🐦 **官方账号** · [@CreaoAI](https://x.com/@CreaoAI)

说到这里，其实我想说一下

**我只是拿 CREAO 搭了一个「绘本机」。**但他的功能远不止此

同样的思路——**把任何一件重复做 N 次的事，固化成一个按钮**——能装下的场景远不止这个：

\- 📰 **每日情报简报**：自动抓你关注领域的新论文/博客/X 热帖，生成摘要推到微信

\- 📊 **周报自动化**：每周五把你这周的日历 + 邮件 + Git 提交，汇总成一份周报草稿

\- 🎬 **短视频工厂**：一段文字 → 分镜 → TTS 配音 → 自动合成一条 60 秒成片

\- 📚 **英语学习流水线**：上传英文 PDF → 章节摘要 + 生词卡 + 一键导入 Anki

\- 🍱 **家庭小助手**：拍一张冰箱内部 → 今晚食谱 + 缺什么的购物清单

这些不是"未来能做"，是 CREAO 上**现在就有人在做**的。

所以真正要想的不是 **"CREAO 能做什么"**——

**而是你生活里，有哪件每周都要重做一遍的事，值得被做成一个按钮。**

搭建它一次，然后把钥匙留给未来的自己。