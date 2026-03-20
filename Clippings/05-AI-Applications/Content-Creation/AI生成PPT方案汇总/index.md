---
title: "AI生成豪华PPT的几种方案和使用途径"
source: "https://x.com/Gorden_Sun/status/2032141698562998332"
author:
  - "[[Unknown]]"
published: 2026-03-13
created: 2026-03-13
description: "#TruthSeeker #INTJ #AIxEverything事上磨练，道在行中"
tags:
  - "clippings"
---
先看我用AI生成的PPT效果，3张图分别截取自3个技术方案，后面会放出每个方案的完整PPT。

**1、使用Nano Banana Pro生成**

![图像](https://pbs.twimg.com/media/HDObKOSasAAnEwS?format=jpg&name=large)

**2、使用Claude Cowork编辑已有的PPT模板生成**

![图像](https://pbs.twimg.com/media/HDObNp6bMAA7Kxy?format=jpg&name=large)

**3、通过生成SVG网页的方式生成PPT**

![图像](https://pbs.twimg.com/media/HDObQFXbIAAEdiL?format=jpg&name=large)

**看完本文你能获得：**

1、AI生成PPT当前有哪几种技术方案，在哪能使用（包括开源方案和商业产品），以及每种方案的优缺点。

2、如何生成豪华大厂风格的PPT（高信息密度，看起来高大上），包括如何写提示词、如何提供风格参考。

## 一、AI生成PPT的几种方案和优缺点

目前AI生成PPT，主要有以下3种方案：

**1、使用Nano Banana Pro或Nano Banana 2生成PPT图片**

这是我最看好的生成PPT的方向。优点是上限极高，可以生成带有配图和极其复杂的PPT，形式丰富、信息密度大；缺点是有时候会写错汉字，且生成的是图片想编辑比较麻烦。目前的缺点，等下一个Banana Pro版本，应该就可以解决，以后都是用图片的形式生成PPT，修改PPT也直接让Banana修改图片即可。

通过Banana生成PPT的产品包括：

1）NotebookLM

谷歌官方的产品，Gemini Pro用户基本随便用，优点是生成的PPT风格非常统一，且NotebookLM本身功能极其强大；缺点是生成的PPT风格都是极简风格，没办法生成信息密集、各种复杂图形的PPT，图片分辨率只有2K经常写错汉字，而且还有水印。

官网：[notebooklm.google.com](https://notebooklm.google.com/)官网： [notebooklm.google.com](https://notebooklm.google.com/)

2）其他使用Banana API做的PPT产品

例如Youmind等，优点是图片分辨率可以4K，汉字的准确度更高，提示词写的好的话可以生成高信息密度的PPT；缺点是普遍比较贵，因为Banana官方API非常贵，1张4K图至少1块人民币。

3）我自己用Banana API做的PPT产品

为什么单独说，是因为我在提示词和PPT模板上下了不少功夫（下文会详细介绍），能生成非常唬人的大厂风格PPT，信息密度极高。还有个优点是便宜，因为我用的中转站API，成本比较低，但成本低需要面临的缺点就是不稳定，如果谷歌限额就会导致不可用。

我的产品地址：[https://ppt.ai2vip.com/](https://ppt.ai2vip.com/)

4.9元可以生成包含10页的完整PPT，且可以至多重试10次。业余做的也没打算做成大生意，如果你想体验，可以在文末加我微信进群，会送一些体验码。

4）把Banana生成的PPT变为可编辑的PPT

技术方案是OCR+inPaint，有一个比较完善的开源项目“Banana Slides”，包含了生成完整PPT和处理为可编辑格式的全流程。改为可编辑还存在不完美的地方。

项目Github地址：[https://github.com/Anionex/banana-slides](https://github.com/Anionex/banana-slides)项目 GitHub 地址： [https://github.com/Anionex/banana-slides](https://github.com/Anionex/banana-slides)

另外，还有个付费产品，把图片变成可编辑的PPT文件，效果目前最好，有10次免费体验次数。

网址：[https://codia.ai/noteslide](https://codia.ai/noteslide)网址： [https://codia.ai/noteslide](https://codia.ai/noteslide)

**2、Agent直接编辑PPT文件**

原理是通过调用Python来直接编辑PPT文件，实现的效果好与不好，全看Agent和LLM模型的本事。比较稳妥且出彩的方法是提供一个PPT模板文件，里面准备好你想用的各种复杂模板，让Agent把需要变成PPT的内容，按照PPT模板的布局，替换掉原来模板里的文字。

这个方案的优点是成本低，Claude Code、Claude Cowork、Codex、AntiGravity、甚至小龙虾（OpenClaw）都能完成，而且是直接操作PPT文件，后续你可以直接编辑。缺点是靠已有PPT模板效果还不错，但如果让Agent完全从头创建，只能做出极简风格的PPT，对于模型也有比较高的要求，Claude Opus 4.6不错，GPT-5.4还行，Gemini 3.1 Pro效果就不太好。我是使用的Claude Cowork，非常省心，效果也很好，可能是目前最佳的生成PPT的方式。

可以安装这个编辑PPT的Skill：[https://github.com/anthropics/skills/tree/main/skills/pptx](https://github.com/anthropics/skills/tree/main/skills/pptx)可以安装这个编辑 PPT 的 Skill： [https://github.com/anthropics/skills/tree/main/skills/pptx](https://github.com/anthropics/skills/tree/main/skills/pptx)

然后给Agent下达指令的方式就很简单了，先把要做成PPT的内容，放在一个本地文件里，例如我把内容放到了“OpenClaw\_详细介绍”这个Word文档里，再在文件夹里在放一个PPT模板文件。然后输入提示词（如下图）：

打开Word文档：OpenClaw\_详细介绍，根据里面的内容，来修改“PPT模板”这个PPT文件，PPT内已有的Slide是供你选用的模板，你可以挑选合适的模板来给不同的内容使用，注意不要重复使用相同的模板。最终生成的PPT页数直接添加在这个文件的后面即可。

![图像](https://pbs.twimg.com/media/HDObUzybQAU1zkW?format=jpg&name=large)

**3、通过生成SVG网页的方式生成PPT**

这种方案是用LLM写网页，结合SVG画图和动画，来实现PPT的效果。优点是AI可以同时生成流畅的网页动画，看起来很炫酷；缺点是生成的PPT偏向简洁风格不能生成高信息密度的华丽PPT，而且网页导出为PPT文件，会丢失动画效果，一些图形也会错位。如果只是做内容演示，不要求PPT格式，这个方案比较不错。

使用这个方案的商业产品包括老牌的Gemma和张月光（妙鸭相机创始人）的创业产品Dokie，效果都不错。

Dokie官网：[dokie.ai](https://dokie.ai/)Dokie 官网： [dokie.ai](https://dokie.ai/)

开源方案一：一个Skill，Claude Code、Codex、小龙虾（OpenClaw）都可以用，但是生成的是Html网页形式，默认不转换为PPT。Github：[https://github.com/zarazhangrui/frontend-slides](https://github.com/zarazhangrui/frontend-slides)

开源方案二：蚂蚁开源infoGraph，用于生成信息图，也可以用作PPT场景。Github：[https://github.com/antvis/Infographic](https://github.com/antvis/Infographic)

## 二、AI生成PPT的几种方案的真实效果展示

生成的完整PPT和提示词文档，全部放在了云盘，关注公众号“AI加速派”（本公众号），发送“**PPT**”获取下载链接。下面是每种方案生成的PPT部分截图，点击查看大图。

**使用我的Banana PPT产品生成**

![图像](https://pbs.twimg.com/media/HDOcGGobQAQa6d6?format=jpg&name=large)

![图像](https://pbs.twimg.com/media/HDOcGGsaIAAXbIO?format=jpg&name=large)

![图像](https://pbs.twimg.com/media/HDOcGGvbQAM_wTN?format=jpg&name=large)

![图像](https://pbs.twimg.com/media/HDOcGGsacAAcxx7?format=jpg&name=large)

**使用NotebookLM生成**

![图像](https://pbs.twimg.com/media/HDOdAb-awAAB1F9?format=jpg&name=large)

![图像](https://pbs.twimg.com/media/HDOdAb2bQAI8ClP?format=jpg&name=large)

![图像](https://pbs.twimg.com/media/HDOdAb9bcAA3r1i?format=jpg&name=large)

![图像](https://pbs.twimg.com/media/HDOdAb_bQAAtxle?format=jpg&name=large)

**Claude Cowork编辑PPT生成**

![图像](https://pbs.twimg.com/media/HDOc41VbQAI3fY_?format=jpg&name=large)

![图像](https://pbs.twimg.com/media/HDOc412bQAQPaej?format=jpg&name=large)

![图像](https://pbs.twimg.com/media/HDOc416akAAPO4k?format=jpg&name=large)

![图像](https://pbs.twimg.com/media/HDOc415bQAUAyNI?format=jpg&name=large)

**Dokie生成**

![图像](https://pbs.twimg.com/media/HDOdKdObQAUpybL?format=jpg&name=large)

![图像](https://pbs.twimg.com/media/HDOdKdXbQAcjPam?format=jpg&name=large)

![图像](https://pbs.twimg.com/media/HDOdKdXaQAA8XnT?format=jpg&name=large)

![图像](https://pbs.twimg.com/media/HDOdKdWbMAAAEWW?format=jpg&name=large)

## 三、生成豪华风格PPT的提示词思路

这是生成图片、视频的通用思路，你要想生成好的PPT，首先需要知道你这里的“好”的标准是什么，这里的好，要么来自你自己经验的积累、要么来自网上其他人的经验、要么来自AI的创造。

在使用Banana生成PPT时，我使用的是其他人的经验+AI优化，具体操作是：

我从网上的PPT模板网站，下载了顶级的、豪华的PPT模板，然后让Gemini分析这些PPT模板，给我写了能生成类似效果的提示词，最后我把PPT模板用作图片参考，使用Gemini优化的提示词+要生成的内容组合成最终的提示词，从而能生成豪华效果的PPT。

参考图我同时使用了8张，大概是这样：

![图像](https://pbs.twimg.com/media/HDOdR2FbQAUd_o5?format=jpg&name=large)

提示词是Gemini写的，每次选用一种形式，内容大概是这样：

![图像](https://pbs.twimg.com/media/HDOdVQlbQAMHELM?format=jpg&name=large)

以上，我是Gorden，如果你想体验Banana生成PPT、或者有其他问题，可以加我微信咨询。

![图像](https://pbs.twimg.com/media/HDOdYmCaUAAhID5?format=jpg&name=large)