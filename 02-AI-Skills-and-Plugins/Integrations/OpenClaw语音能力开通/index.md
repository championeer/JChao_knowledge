---
title: "如何让你的 openclaw 开口说话"
source: "https://x.com/discountifu/status/2032022304197063164"
author:
  - "[[Unknown]]"
published: 2026-03-12
created: 2026-03-12
description: "#TruthSeeker #INTJ #AIxEverything事上磨练，道在行中"
tags:
  - "clippings"
---
实际上 [@openclaw](https://x.com/@openclaw) 自带 tts 文字转语音功能，但是默认是关闭的需要手动开启

具体的文档教程在：

[https://docs.openclaw.ai/tts#config](https://docs.openclaw.ai/tts#config)

> 如果你完全不懂编程的话可以把文档丢给龙虾让他自己改，但是龙虾自己改自己经常会报错，假如你有一定的动手能力，我还是建议你按照如下教程一步步操作

第一步打开

[https://try.elevenlabs.io/q8uwxni7cel1](https://try.elevenlabs.io/q8uwxni7cel1)

注册 elevenlabs 的免费账户，每月赠送 **10,000 积分，**可以调用文本转语音的 API，对于普通用户而言足够使用了。

注册好账号之后打开

[https://elevenlabs.io/app/developers/api-keys](https://elevenlabs.io/app/developers/api-keys)

点击 【创建密钥】，注意密钥只会显示一次，请复制粘贴并妥善保管

![图像](https://pbs.twimg.com/media/HDMuRn8aUAATZGH?format=jpg&name=large)

打开你的 openclaw 设置文件，一般位于 \`~/.openclaw/openclaw.json\` ，找到

messages 设置段，填写如下设置

```json
"messages": {
    "tts": {
      "auto": "inbound",
      "provider": "elevenlabs",
      "elevenlabs": {
        "apiKey": "sk_123456"
      },
      "edge": {
        "enabled": true,
        "voice": "zh-CN-XiaomoNeural",
        "lang": "zh-CN",
        "outputFormat": "ogg-48khz-16bit-mono-opus",
        "rate": "+10%",
        "pitch": "-5%"
      }
    }
  }
```

保存后输入 openclaw gateway restart

之后你再用语音发送给龙虾，龙虾也会用语音回复你:

![图像](https://pbs.twimg.com/media/HDMwKu6aoAAnw8H?format=png&name=large)

让 openclaw 支持识别语音消息的教程参考我之前发布的：

【**如何用语音控制 Moltbot/Clawdbot】**

[https://x.com/discountifu/status/2016370040627724740](https://x.com/discountifu/status/2016370040627724740)