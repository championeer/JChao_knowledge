---
title: "为了让我爸使用 OpenClaw，我给它套上通话功能"
source: "https://x.com/lxfater/status/2029127930920780028"
author:
  - "[[Unknown]]"
published: 2026-03-04
created: 2026-03-04
description:
tags:
  - "clippings"
---
我爸和众多中国老年人一样，其实已经是豆包的忠实用户了。

但作为一个 AI 博主，我内心总是想让老父亲知道 OpenClaw 的牛逼之处，让他开开眼。在家里给他演示一通后，他得出了个结论，软件不错，能控制很多东西，相当于有手脚了，但是就是不好用。

“啥不好用，最近不知道有多火！！”

“我都老花眼了，还要打字，人家豆包说说话就行了。你不是程序员吗？干嘛不做一个。”

这话我一听就来气，所以这两天我就一直研究，如何给OpenClaw 套上通话功能。

现在先给大家看看实际的使用情况：

<video preload="none" tabindex="-1" playsinline="" aria-label="嵌入式视频" poster="https://pbs.twimg.com/amplify_video_thumb/2029124251853438980/img/dkv6K58OSBPDjlxD.jpg" style="width: 100%; height: 100%; position: absolute; background-color: black; top: 0%; left: 0%; transform: rotate(0deg) scale(1.005);" eagle-collectable="true"><source type="video/mp4" src="https://x.com/19d72414-df62-47e3-b05e-1d96be5d22e1"></video>

0:15

## 架构选择

你可能以为我要短期内 vibecoding OpenClaw的插件之类的，但在这个普通人30 分钟都能写一个项目的年代。我估计这个功能早就实现了。

问题是如何找到这些代码呢？

第一是靠搜索：先随便搜搜，openclaw+voice，就会发现很多项目。

第二是靠积累：由于对架构的理解，我很早就知道有不少做 voice AI agents

接下来就是翻翻代码库，看看有没有上 OpenClaw 了。经过一番搜索，我选择了star 比较多，比较眼熟的ten-framework。

![图像](https://pbs.twimg.com/media/HCjmUbVaQAA-2pd?format=jpg&name=large)

为什么这么选择呢？

首先他的文档比较完善，部署流程清晰了，我几乎不用写任何代码

还有个重要的原因，就是 OpenClaw 更新频繁，可能几天前的代码就变得老旧了，我还认识开发者，到时候督促他修修 bug。

## 基本服务购买

为了让整个项目运行起来，你需要注册 4 个免费的服务，其中除了 DeepSeek，其他都不需要付费。

**DeepSeek（国内替代推荐）**

国内直连，OpenAI 兼容接口，价格极低（约 OpenAI 的 1/50）。

**注册步骤**

1. 打开 [DeepSeek 开放平台](https://platform.deepseek.com/)

2\. 点击 **注册**，用手机号或邮箱注册

**充值**

1\. 登录后点击左侧 **费用**（Billing）

2\. 最低充值 **￥2**，充 ￥10 能用很久

**获取 API Key**

![图像](https://pbs.twimg.com/media/HCjmaEoawAY68GN?format=jpg&name=large)

1\. 点击左侧 **API Keys**（或直接访问 \[[platform.deepseek.com/api\_keys](https://platform.deepseek.com/api_keys)\]([https://platform.deepseek.com/api\_keys](https://platform.deepseek.com/api_keys))）

2\. 点击 **创建 API Key**

3\. 填写名称，点击创建

4\. **立即复制保存**——只显示一次

**Deepgram（语音识别 STT）**

![图像](https://pbs.twimg.com/media/HCjmk1na8AAfe-R?format=jpg&name=large)

用于将用户语音实时转为文字。

**注册步骤**

1. 打开 [Deepgram 控制台](https://console.deepgram.com/)

2\. 点击 **Sign Up**，支持 Google / GitHub 登录或邮箱注册

1. 首次登录会引导创建项目

**获取 API Key**

1\. 进入控制台，点击左侧 **API Keys**

2\. 点击 **Create a New API Key**

3\. 填写名称（如 \`openclaw\`），权限选 **Member** 或 **Admin**

4\. 点击 **Create Key**

5\. **立即复制保存**——页面关闭后无法再查看

**免费额度**

新账号赠送 **$200 免费额度**，不需要绑信用卡，个人测试用很久。

**ElevenLabs（语音合成 TTS）**

![图像](https://pbs.twimg.com/media/HCjmp0FawAQ72v0?format=jpg&name=large)

用于将 AI 回复文字转为语音播报。

**注册步骤**

1. 打开 [ElevenLabs](https://elevenlabs.io/)

2\. 点击右上角 **Sign Up**，支持 Google / GitHub 登录或邮箱注册

**获取 API Key**

1\. 登录后，点击左侧边栏最下面的 **Developers**

2\. 选择 **API Keys** 标签

3\. 点击 **Create an API Key**

1. 填写名称，权限建议全部打开（Access / Write）
2. 点击创建

6\. **立即复制保存**

**免费额度**

免费计划每月 **10,000 字符**的语音合成额度，包含 API 访问权限，测试够用。

**Agora（实时音视频 RTC）**

![图像](https://pbs.twimg.com/media/HCjmt5gawAEPg03?format=jpg&name=large)

用于浏览器与 AI 助手之间的实时音视频通信。

**注册步骤**

1. 打开 [Agora 控制台](https://console.agora.io/)
2. 点击注册，填写邮箱/手机号，完成验证

**创建项目**

1\. 登录后进入控制台，点击左侧 **项目管理**

2\. 点击 **创建项目**

1. 填写项目名称（如 openclaw-voice）

4\. 使用场景选 **互动直播** 或 **语音通话**

5\. 鉴权机制选 **安全模式（推荐）**

1. 点击提交

**获取 App ID 和 Certificate**

1\. 回到 **项目管理** 页面

2\. 找到刚创建的项目，点击 App ID 右侧的 **复制图标**

3\. 点击 **配置** → 找到 **主要证书**，点击复制

信令服务rtm开启

1. 打开项目详情
2. 在Signaling选择数据中心开启

**免费额度**

每月 **10,000 分钟**免费使用，个人测试完全够用。

## 项目配置

克隆项目

将项目整体克隆下来：[https://github.com/TEN-framework/ten-framework](https://github.com/TEN-framework/ten-framework)

配置

环境变量配置

参考ai\_agents/agents/examples/openclaw-example里面的 readme。

我们在ai\_agents/下创建 .env文件，内容具体如下：

```markdown
# --- 服务配置 ---
LOG_PATH=/tmp/ten_agent
LOG_STDOUT=true
GRAPH_DESIGNER_SERVER_PORT=49483
SERVER_PORT=8080
WORKERS_MAX=100
WORKER_QUIT_TIMEOUT_SECONDS=60

# --- 前端 ---
AGENT_SERVER_URL=http://localhost:8080
TEN_DEV_SERVER_URL=http://localhost:49483
NEXT_PUBLIC_EDIT_GRAPH_MODE=false

# --- Agora RTC/RTM ---
AGORA_APP_ID=<你的 Agora App ID>
AGORA_APP_CERTIFICATE=<你的 Agora App Certificate>

# --- LLM (DeepSeek) ---
OPENAI_API_BASE=https://api.deepseek.com
OPENAI_API_KEY=<你的 DeepSeek API Key>
OPENAI_MODEL=deepseek-chat
# OPENAI_PROXY_URL=

# --- STT (Deepgram) ---
DEEPGRAM_API_KEY=<你的 Deepgram API Key>

# --- TTS (ElevenLabs) ---
ELEVENLABS_TTS_KEY=<你的 ElevenLabs API Key>

# --- OpenClaw Gateway ---
OPENCLAW_GATEWAY_URL=ws://host.docker.internal:18789
OPENCLAW_GATEWAY_PASSWORD=<你的 Gateway 密码>
OPENCLAW_GATEWAY_ORIGIN=http://host.docker.internal:18789
OPENCLAW_GATEWAY_SCOPES=operator.write
OPENCLAW_GATEWAY_DEVICE_IDENTITY_PATH=/data/openclaw/device_identity.js
```

OpenClaw配置

首先将 OpenClaw 的网关改成密码模式，具体步骤

```markdown
openclaw config set gateway.auth.mode password                                             
openclaw config set gateway.auth.password lxfater
```

然后为了安全，需要配置Control UI Allowed Origins ，具体步骤如下图

![图像](https://pbs.twimg.com/media/HCjnCyKaEAAt5pH?format=jpg&name=large)

在 OpenClaw 的 Settings → Gateway → Control UI Allowed Origins 中添加：

http://host.docker.internal:18789

这个值必须与 .env 中的 OPENCLAW\_GATEWAY\_ORIGIN 完全一致（包括协议 http:// 不能写成

wss://，不能带路径）。如果不匹配，Gateway 会拒绝连接并返回 origin not allowed。

修改代码扩展功能

实际使用下来，为了方便中国人使用，需要对配置进行更改，具体如下

ai\_agents/agents/examples/openclaw-example/tenapp/property.json — 4 行改动

- STT 语言 en-US → zh，模型 nova-3 → nova-2
- LLM base\_url 从硬编码 [https://api.openai.com/v1](https://api.openai.com/v1) → ${env:OPENAI\_API\_BASE}
- LLM model 从硬编码 gpt-4o → ${env:OPENAI\_MODEL}

上面主要是让 ASR 能转录中文，还有去除硬编码的环境变量，方便配置国内的模型。

![图像](https://pbs.twimg.com/media/HCjph4XacAAXZ5q?format=jpg&name=large)

## 构建容器

mac arm 架构下部署注意事项：

由于这个项目不支持arm64 架构，你需要在 docker开启虚拟化，具体步骤如下

![图像](https://pbs.twimg.com/media/HCjpm0IaoAAbTmJ?format=jpg&name=large)

1. 打开 Docker Desktop
2. 点击右上角 齿轮图标（Settings）
3. 左侧选 General
4. 往下找到 Virtual Machine Options
5. VMM 选择 Apple Virtualization framework
6. 勾选 Use Rosetta for x86\_64/amd64 emulation on Apple Silicon
7. 点击 Apply & Restart

然后运行如下命令

```markdown
# 1. 构建镜像                                                                              
  cd <项目所在目录>/ten-framework/ai_agents
  # 强制build amd64 版本
  docker build --platform linux/amd64 -f agents/examples/openclaw-example/Dockerfile -t      
  openclaw-example-app .
```

## 运行项目

首先保持 OpenClaw 开启，想看到网关的日志的话，推荐使用

```markdown
openclaw gateway --force
```

然后运行容器

```markdown
# 要在cd <项目所在目录>/ten-framework/ai_agents目录下
 
 docker run --rm -it --env-file .env -p 8080:8080 -p 3000:3000 openclaw-example-app
```

登录到http://localhost:3000，会看到如下所示界面，我们复制这个命令运行，进行配对

![图像](https://pbs.twimg.com/media/HCjqAI9bEAAvN8o?format=jpg&name=large)

## 使用项目

1. 打开这个项目的第一件事情是选择麦克风
2. 然后我们还要选择配置；voice-assistant
3. 检查是否联通

具体如下图所示

![图像](https://pbs.twimg.com/media/HCjqEXEawAA5FhF?format=jpg&name=large)

现在开始就可以愉快对话了。

要求他创建在桌面创建一个文件，如下图所示，口喷就行：

![图像](https://pbs.twimg.com/media/HCjqHlgbUAAXmBo?format=jpg&name=large)

很快就创建好了

![图像](https://pbs.twimg.com/media/HCjqWbaawAAGY39?format=jpg&name=large)

## 结束

接入语音对话功能后，OpenClaw 开始有能力给不懂技术的普通人使用。

普通人估计都没有接触过开口就能干活，不废话的 AI

我给我爸的 OpenClaw 套上了个修复图片的 skill，他就乐呵呵地年轻时候的照片进行修复了。

普通人其实对 AI 产品只有两个要求：好用，能干活。

这篇文章希望对你有帮助！！ （本文为付费合作，保证教程步骤本人实验过，真实有效）

喜欢我的文章可以关注我的公众号

![图像](https://pbs.twimg.com/media/HCjqzTCaYAAai3u?format=jpg&name=large)