---
title: "我用 Openclaw 克隆了杨幂的声音，然后……"
source: "https://x.com/zstmfhy/status/2034783304072012241"
author:
  - "[[Unknown]]"
published: 2026-03-20
created: 2026-03-20
description:
tags:
  - "clippings"
---
## 🎯 为什么要做这个？

说实话，这个想法纯属偶然。

那天我在刷杨幂的采访视频，她那个标志性的声线——略带沙哑、慵懒中透着一丝俏皮，突然让我想到：如果能让小龙虾用这个声音说话，会是什么效果？

想象一下：

- 你写的内容，用杨幂的声音读出来
- 发到朋友群里，他们会是什么反应？
- 做一个AI虚拟主播，声音是杨幂的
- 甚至……给暗恋的人发语音条？（嘘！）

于是我动手了。

整个过程大概花了我1个小时，中间踩了不少坑。但最终效果出来的时候，我真的惊了——**那声音，简直就是杨幂本人！**

今天就把整个过程分享给你们。

## 📋 你需要准备什么？

## 硬件设备

- 一台电脑（Mac/Windows/Linux都可以）
- 手机也可以，但操作会比较麻烦

## 软件环境

- **Openclaw**（如果你还没装，看我之前的教程）
- Python 3.x
- ffmpeg（用于音频处理）
- curl（一般系统自带）

## 最重要的：Noiz API Key

这是整个教程的核心！

**Noiz** 是一个AI语音克隆平台，效果是我测试过最好的——比 ElevenLabs 还要自然，而且支持中文。

**获取步骤：**

1. 打开浏览器，访问：[https://developers.noiz.ai/api-keys](https://developers.noiz.ai/api-keys)打开浏览器，访问： [https://developers.noiz.ai/api-keys](https://developers.noiz.ai/api-keys)
2. 注册账号（邮箱注册，很快）
3. 进入 Dashboard，点击 "Create API Key"进入仪表板，点击“创建 API 密钥”
4. 复制你的 API Key（**只显示一次，一定要保存好！**）

## 🚀 第一步：给你的小龙虾装上语音技能

Openclaw 的强大之处在于它的 Skill 系统。我们首先需要安装语音相关的 Skill。

![图像](https://pbs.twimg.com/media/HDyM300aAAAej5X?format=jpg&name=large)

## 1\. 安装 TTS 核心技能

打开终端，执行：

> **\[bash\]** cd ~/.openclaw/workspace/skills git clone [https://github.com/NoizAI/skills](https://github.com/NoizAI/skills) mv skills/skills/\* skills/ rm -rf skills**\[bash\]** cd ~/.openclaw/workspace/skills git 克隆 [https://github.com/NoizAI/skills](https://github.com/NoizAI/skills) MV 技能/技能/\*技能/ rm -rf 技能

**等等！如果你是第一次安装 Skill**，你可能需要先创建目录：

> **\[bash\]** mkdir -p ~/.openclaw/workspace/skills cd ~/.openclaw/workspace/skills git clone [https://github.com/NoizAI/skills](https://github.com/NoizAI/skills) mv skills/skills/\* skills/ rm -rf skills**\[bash\]** mkdir -p ~/.openclaw/workspace/skills cd ~/.openclaw/workspace/skills git 克隆 [https://github.com/NoizAI/skills](https://github.com/NoizAI/skills) MV 技能/技能/\*技能/ rm -rf 技能

## 2\. 安装音频处理工具

> **\[bash\]** # 安装 Python 依赖 pip install noisereduce soundfile requests # 检查 ffmpeg 是否已安装 ffmpeg -version**\[bash\]** # 安装 Python 依赖 pip install noisereduce soundfile requests # 检查 ffmpeg 是否已安装 ffmpeg 版本

如果没有 ffmpeg，Mac 用户用 brew install ffmpeg，Ubuntu 用户用 apt install ffmpeg。

## 3\. 配置 Noiz API Key3.配置 Noiz API 密钥

> **\[bash\]** python3 ~/.openclaw/workspace/skills/tts/scripts/tts.py config --set-api-key YOUR\_NOIZ\_API\_KEY

把 YOUR\_NOIZ\_API\_KEY 替换成你刚才获取的 API Key。

**提示：** 你也可以把它写入环境变量，这样更安全：

> **\[bash\]** echo 'export NOIZ\_API\_KEY="YOUR\_NOIZ\_API\_KEY"' >> ~/.bashrc source ~/.bashrc**\[bash\]** echo '导出 NOIZ\_API\_KEY="YOUR\_NOIZ\_API\_KEY"' >> ~/.bashrc 执行 ~/.bashrc

![图像](https://pbs.twimg.com/media/HDyM6rqasAAdhAh?format=jpg&name=large)

## 🎤 第二步：获取杨幂的声音样本

这是最关键的一步！声音样本的质量直接影响克隆效果。

## 我踩过的坑分享：

| ❌ 错误做法 | ✅ 正确做法 | |------------|------------| | 用手机录电视声音 | 找高清原始音频 | | 选背景音乐片段 | 选纯人声片段 | | 只有5秒钟 | 至少15-30秒 | | 声音很小、有杂音 | 清晰、音量适中 |

![图像](https://pbs.twimg.com/media/HDyM9e_bwAA9ewW?format=jpg&name=large)

## 方法一：从B站下载（推荐）

这是我找到的最好方法：

## 1\. 找一个杨幂的采访/演讲视频

去 B 站搜索"杨幂 采访"，找一个：

- **时长**：至少1分钟
- **声音**：清晰、无背景音乐
- **内容**：自然对话（不要念台词那种）

## 2\. 获取视频音频

用这个 Python 脚本（我写好的）：

> **\[python\]** import requests import subprocess # 替换成你选择的视频 BV 号 bvid = "BV1He4y1V7wC" # 示例，请换成实际的 headers = { "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36", "Referer": f"[https://www.bilibili.com/video/](https://www.bilibili.com/video/){bvid}", } # 获取视频信息 info\_url = f"[https://api.bilibili.com/x/web-interface/view?bvid=](https://api.bilibili.com/x/web-interface/view?bvid=){bvid}" data = requests.get(info\_url, headers=headers).json() aid = data\["data"\]\["aid"\] cid = data\["data"\]\["cid"\] # 获取音频 URL play\_url = f"[https://api.bilibili.com/x/player/playurl?avid=](https://api.bilibili.com/x/player/playurl?avid=){aid}&cid={cid}&qn=64&fnval=16" play\_data = requests.get(play\_url, headers=headers).json() audio\_url = play\_data\["data"\]\["dash"\]\["audio"\]\[0\]\["baseUrl"\] print(f"音频 URL: {audio\_url}") # 下载并转换为 WAV（截取前20秒） [subprocess.run](https://subprocess.run/)(\[ "ffmpeg", "-headers", "Referer: [https://www.bilibili.com/](https://www.bilibili.com/)", "-i", audio\_url, "-t", "20", "-acodec", "pcm\_s16le", "-ar", "16000", "-ac", "1", "yangmi\_ref.wav" \]) print("✅ 参考音频已保存为 yangmi\_ref.wav")**\[Python\]** 导入请求 导入子流程 #替换成你选择的视频 BV 号 bvid = "BV1He4y1V7wC" # 示例，请换成实际的 标题 = { "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36", "引用页": f" [https://www.bilibili.com/video/](https://www.bilibili.com/video/) {bvid}", } # 获取视频信息 info\_url = f" [https://api.bilibili.com/x/web-interface/view?bvid=](https://api.bilibili.com/x/web-interface/view?bvid=) {bvid}" data = requests.get(info\_url, headers=headers).json() aid = data\["data"\]\["aid"\] cid = data\["data"\]\["cid"\] # 获取音频 URL play\_url = f" [https://api.bilibili.com/x/player/playurl?avid=](https://api.bilibili.com/x/player/playurl?avid=) {aid}&cid={cid}&qn=64&fnval=16" play\_data = requests.get(play\_url, headers=headers).json() audio\_url = play\_data\["data"\]\["dash"\]\["audio"\]\[0\]\["baseUrl"\] print(f"音频 URL: {audio\_url}") # 下载并转换为 WAV（截取前 20 秒） [子进程运行](https://subprocess.run/) (\[ “ffmpeg”，“-headers”，“引用者： [https://www.bilibili.com/](https://www.bilibili.com/) “， “-i”，音频网址， “-t”，“20”， "-acodec", "pcm\_s16le", “-ar”“16000” “-ac”，“1”， "yangmi\_ref.wav" \]) print(" ✅ 参考音频已保存为 yangmi\_ref.wav")

保存为 download\_yangmi.py，然后运行：

> **\[bash\]** python3 download\_yangmi.py**\[bash\]** python3 下载\_yangmi.py

## 方法二：自己录制（备选）

如果你懒得写代码，可以用笨办法：

1. 找一个杨幂采访视频
2. 用手机录音功能，录20秒左右
3. 用微信文件传输助手传到电脑
4. 用在线工具转成 WAV 格式

## 🔑 第三步：测试声音克隆

激动人心的时刻到了！

> **\[bash\]** python3 ~/.openclaw/workspace/skills/tts/scripts/tts.py \\ -t "你好，我是杨幂。很高兴认识你们！" \\ --ref-audio yangmi\_ref.wav \\ -o test\_yangmi.wav \\ --backend noiz**\[bash\]** python3 ~/.openclaw/workspace/skills/tts/scripts/tts.py \\ -t "你好，我是杨幂。很高兴认识你们！" \\ --ref-audio yangmi\_ref.wav \\ -o test\_yangmi.wav \\ --后端噪音

## 等待几秒钟，然后播放音频：

> **\[bash\]** # Mac 用户 afplay test\_yangmi.wav # Linux 用户 aplay test\_yangmi.wav # Windows 用户 start test\_yangmi.wav

**那一刻，我鸡皮疙瘩都起来了！**

真的就是杨幂的声音！虽然只有一句话，但那个声线、那个语气，一模一样！

![图像](https://pbs.twimg.com/media/HDyNAIlbAAA78XB?format=jpg&name=large)

## 🎨 第四步：优化音质（进阶技巧）

如果你觉得效果还不够好，试试这些技巧：

## 1\. 降噪处理

参考音频如果有背景噪音，会影响克隆效果。用这个脚本降噪：

> **\[python\]** import numpy as np import soundfile as sf import noisereduce as nr # 读取音频 data, rate = [sf.read](https://sf.read/)('yangmi\_ref.wav') # 如果是立体声，转单声道 if len(data.shape) > 1: data = np.mean(data, axis=1) # 取前0.3秒作为噪声样本 noise\_sample = data\[:int(rate \* 0.3)\] # 降噪 reduced = nr.reduce\_noise( y=data, sr=rate, y\_noise=noise\_sample, prop\_decrease=0.8 ) # 保存 sf.write('yangmi\_ref\_clean.wav', reduced, rate) print("✅ 降噪完成，保存为 yangmi\_ref\_clean.wav")**\[Python\]** 导入 numpy 库并将其命名为 np 导入声音文件为 sf import noisereduce as nr #读取音频 数据，速率 = [sf.read](https://sf.read/) （'yangmi\_ref.wav'） # 如果是最新，转单声道 如果 len(data.shape) > 1: data = np.mean(data, axis=1) # 取前0.3秒作为噪声样本 noise\_sample = data\[:int(rate \* 0.3)\] # 餐厅 reduced = nr.reduce\_noise( y=数据， sr=速率， y\_noise=noise\_sample， prop\_decrease=0.8 ) # 保存 sf.write('yangmi\_ref\_clean.wav', reduced, rate) print(" ✅ 完成，保存为 yangmi\_ref\_clean.wav")

## 2\. 调整语气

你可以用 characteristic-voice 技能来添加情感：

> **\[bash\]** bash ~/.openclaw/workspace/skills/characteristic-voice/scripts/speak.sh \\ --preset gentle \\ -t "大家好，我是杨幂，今天很开心能和大家聊天！" \\ --ref-audio yangmi\_ref\_clean.wav \\ -o yangmi\_gentle.wav**\[bash\]** bash ~/.openclaw/workspace/skills/characteristic-voice/scripts/speak.sh \\ --预设轻柔模式\\ -t "大家好，我是杨幂，今天很开心能和大家聊天！" \\ --ref-audio yangmi\_ref\_clean.wav \\ -o yangmi\_gentle.wav

可用的预设：

- gentle - 温柔
- morning - 清晨元气
- happy - 开心
- sad - 忧伤

## 📱 第五步：发到飞书（装X时刻）

现在最精彩的部分来了——把生成的语音发到飞书！

## 1\. 创建飞书应用

1. 访问：[https://open.feishu.cn/](https://open.feishu.cn/)访问： [https://open.feishu.cn/](https://open.feishu.cn/)
2. 登录后，点击"创建企业自建应用"
3. 填写应用信息（随便填）
4. 创建成功后，记下两个东西：**App ID**：类似 cli\_a90b8f7db9b89bd3 **App Secret**：点击"查看"获取

## 2\. 配置权限

在应用管理页面，申请以下权限：

权限名称 权限值 获取用户基本信息 contact:user.base:readonly 发送消息 im:message 读取消息 im:message:group\_at\_msg

## 3\. 配置到 Openclaw

> **\[bash\]** cat > ~/.openclaw/.env << 'EOF' FEISHU\_APP\_ID=你的AppID FEISHU\_APP\_SECRET=你的AppSecret EOF**\[bash\]** cat > ~/.openclaw/.env << 'EOF' FEISHU\_APP\_ID=您的 AppID FEISHU\_APP\_SECRET=您的 AppSecret EOF

## 4\. 发送语音条！

> **\[bash\]** # 先转成 MP3 格式 ffmpeg -i test\_yangmi.wav -acodec libmp3lame -ar 16000 -ac 1 -b:a 32k test\_yangmi.mp3 # 发送到飞书（需要对方的 open\_id） python3 ~/.openclaw/workspace/skills/feishu-voice-sender/feishu\_voice\_sender.py \\ test\_yangmi.mp3 ou\_xxxxxxxxx --user**\[bash\]** #先转成 MP3 格式 ffmpeg -i test\_yangmi.wav -acodec libmp3lame -ar 16000 -ac 1 -b:a 32k test\_yangmi.mp3 # 发送飞书（需要对方的 open\_id） python3 ~/.openclaw/workspace/skills/feishu-voice-sender/feishu\_voice\_sender.py \\ test\_yangmi.mp3 ou\_xxxxxxxxx --user

**open\_id 怎么获取？**

用这个脚本：

> **\[python\]** import requests APP\_ID = "你的AppID" APP\_SECRET = "你的AppSecret" # 获取 access\_token token\_url = "[https://open.feishu.cn/open-apis/auth/v3/tenant\_access\_token/internal](https://open.feishu.cn/open-apis/auth/v3/tenant_access_token/internal)" token\_data = { "app\_id": APP\_ID, "app\_secret": APP\_SECRET } token\_resp = [requests.post](https://requests.post/)(token\_url, json=token\_data).json() access\_token = token\_resp\["tenant\_access\_token"\] # 获取用户信息（用手机号） user\_url = "[https://open.feishu.cn/open-apis/contact/v3/users](https://open.feishu.cn/open-apis/contact/v3/users)" headers = {"Authorization": f"Bearer {access\_token}"} params = {"mobiles": "13800138000"} # 替换成实际手机号 user\_resp = requests.get(user\_url, headers=headers, params=params).json() print(user\_resp)**\[Python\]** 导入请求 APP\_ID = "你的应用程序 ID" APP\_SECRET = "你的应用程序秘密" # 获取 access\_token token\_url = " [https://open.feishu.cn/open-apis/auth/v3/tenant\_access\_token/internal](https://open.feishu.cn/open-apis/auth/v3/tenant_access_token/internal) “ token\_data = { "app\_id": APP\_ID, "app\_secret": APP\_SECRET } token\_resp = [requests.post](https://requests.post/) (token\_url, json=token\_data).json() access\_token = token\_resp\["tenant\_access\_token"\] # 获取用户信息（用手机号） user\_url = " [https://open.feishu.cn/open-apis/contact/v3/users](https://open.feishu.cn/open-apis/contact/v3/users) “ headers = {"Authorization": f"Bearer {access\_token}"} params = {"mobiles": "13800138000"} # 替换成实际手机号 user\_resp = requests.get(user\_url, headers=headers, params=params).json() print(user\_resp)

## 坑1：API Key 配置失败

**问题**：一直提示 "Invalid API Key"

**解决**：检查环境变量，确保 NOIZ\_API\_KEY 已正确设置。可以用这个命令测试：

> **\[bash\]** echo [$NOIZ](https://x.com/search?q=%24NOIZ&src=cashtag_click)\_API\_KEY**\[bash\]** 回声 [$NOIZ](https://x.com/search?q=%24NOIZ&src=cashtag_click) \_API\_KEY

如果什么都没输出，说明没设置成功。

## 坑2：音频格式不对

**问题**：提示 "Unsupported audio format"**问题** ：提示"Unsupported audio format"

**解决**：Noiz 需要特定格式的 WAV 文件：

- 采样率：16000 Hz
- 位深：16 bit
- 声道：单声道

用这个命令转换：

> **\[bash\]** ffmpeg -i input.mp3 -acodec pcm\_s16le -ar 16000 -ac 1 output.wav

## 坑3：飞书发送失败

**问题**：提示 "Permission denied"**问题** ：提示"Permission denied"

**解决**：

1. 检查权限是否已申请
2. 检查权限是否已审核通过
3. 重新获取 access\_token

![图像](https://pbs.twimg.com/media/HDyNFnbbUAArEaY?format=jpg&name=large)

## 🚀 更多的可能

掌握了这个技能，你可以：

1. **做虚拟主播**：用杨幂的声音直播
2. **做播客**：克隆名人声音做节目
3. **做配音**：给短视频配音
4. **做恶搞**：（但记得注明是AI合成，不要用于欺诈）
5. **做商业用途**：很多公司需要AI语音服务

## ⚠️ 温馨提示

1. **版权问题**：不要用于商业用途，除非你获得了授权
2. **道德问题**：不要用来冒充他人进行诈骗
3. **技术问题**：AI克隆不是100%完美，有时候会有瑕疵

## 🎉 结语

写到这里，我突然想到一个问题：

**如果有一天，AI 可以克隆任何人的声音、样貌、甚至思维方式……我们该如何分辨真假？**

这个问题没有标准答案。但我相信，技术本身是中性的，重要的是我们如何使用它。

好了，不扯远了。

如果你跟着这个教程成功克隆了杨幂的声音，或者遇到了什么问题，欢迎在 X 上 @我 交流！

**我是AI奶爸，一个在 AI 世界里探险的独立开发者。**

**下期再见！****🧡**