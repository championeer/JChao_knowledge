---
title: "OpenClaw飞书官方插件使用完整指南（公开版）"
source: "https://x.com/AI_Jasonyu/status/2029946646843510914"
author:
  - "[[Unknown]]"
published: 2026-03-06
created: 2026-03-07
description:
tags:
  - "clippings"
---
先说下飞书官方插件与 OpenClaw 社区原有插件有何区别？ 飞书官方插件，能以用户身份读写消息、文档等，体验更丝滑；以下为粗略的对比（由AI整理，供参考）

![图像](https://pbs.twimg.com/media/HCvQo-naUAMoGJ1?format=jpg&name=large)

# 让你的飞书长出龙虾钳 🦞

你或许早就把小龙虾接到了飞书上，他能帮你写东西、查资料、出方案——但它也经常会说，"我没有飞书文档/消息/日历权限，请把内容发给我"，你不得不反复复制粘贴。

今天，飞书 OpenClaw 官方插件正式上线！【2026.3.6】

在获得你的授权后，OpenClaw 可以直接以**你的**身份看文档找资料、核对日历看档期、理解群聊上下文。

**你说一句话，它就能伸出“钳子”，直接在飞书里帮你把活儿干了。**

**❓****一句话能做什么？**

![图像](https://pbs.twimg.com/media/HCvQht6aUAEO3fE?format=jpg&name=large)

**👁****完整能力一览**

![图像](https://pbs.twimg.com/media/HCtRmwjbQAARSoq?format=jpg&name=large)

此外，有了插件，你的 OpenClaw 还能在飞书上和你更好的互动，支持流式输出卡片回复（[需手动开启](https://bytedance.larkoffice.com/docx/MFK7dDFLFoVlOGxWCv5cTXKmnMh?contentTheme=DARK&last_doc_message_id=7613984628180896971&preview_comment_id=7613377996409375688&sourceType=feed&theme=light#share-Hwmbdv69ZoPYNpxN0RMc5E8YnPg)）、识别合并转发消息、发表情等，欢迎体验！

该插件由于有用户身份授权，**暂不适合作为群机器人供多人使用**，请仔细评估后安装。

# 一、前置准备

安装 openclaw [https://openclaw.ai/](https://openclaw.ai/)安装 openclaw [https://openclaw.ai/](https://openclaw.ai/)

**如果你还没有OpenClaw，可以参照快速上手指南：**[30 分钟把 OpenClaw 在飞书上配到可用](https://larkcommunity.feishu.cn/wiki/LDmXwEVhJitBa5kU0mjc16VKneb?from=from_copylink)

**openclaw 版本限制：**

- Linux/MacOS：openclaw **2026.2.26 及以上；**Linux/MacOS：openclaw **2026.2.26 及以上；**
- Windows：openclaw **2026.3.2 及以上** **（windows 一些版本仍然存在兼容问题，建议先不使用）**

可通过openclaw -v命令查看；如果低于该版本可能出现异常 执行这个命令升级：**npm install -g openclaw**其它升级方式可参考：[https://docs.openclaw.ai/install/development-channels#switching-channels](https://docs.openclaw.ai/install/development-channels#switching-channels)

2. **插件最新版本号：2026.3.6 ｜**[更新日志](https://bytedance.larkoffice.com/docx/MFK7dDFLFoVlOGxWCv5cTXKmnMh?preview_comment_id=7614018304513723588&last_doc_message_id=7614018124266179787&scene=feed&theme=light&contentTheme=DARK&sub_scene=tab&sourceType=feed#Nf1gdFH4xo325pxZnuicAcaznFj)

# 二、安装步骤

## 1、创建飞书机器人、导入权限

> 后续我们将提供一键创建机器人的能力，敬请期待

注意：导入完整的权限列表 对后续功能的使用体验非常重要（不用经常授权）！！

- **先创建应用**

1、登录[飞书开放平台](https://open.feishu.cn/app?lang=zh-CN)，单击“创建企业自建应用”按钮。

![图像](https://pbs.twimg.com/media/HCtSr2ia0AAAs0g?format=jpg&name=large)

2、输入应用名、描述及图标，单击“创建”按钮，完成操作。

![图像](https://pbs.twimg.com/media/HCtS0x9awAAKcIo?format=jpg&name=large)

- **开启机器人能力**

**3、**添加机器人能力

1. 在左侧目录选择“应用能力 - 添加应用能力”。
2. 选择“按能力添加”页签，单击“机器人”能力卡片的“添加”按钮。

![图像](https://pbs.twimg.com/media/HCtTE-NaUAA1RUg?format=jpg&name=large)

- **导入所需权限**

4、在左侧目录选择“开发配置 > 权限管理”，单击“批量导入/导出权限”按钮。

![图像](https://pbs.twimg.com/media/HCtTODoacAA-MYU?format=jpg&name=large)

5、在“导入”页签中，将如下权限替换原有示例，单击“下一步，确认新增权限”按钮。

```json
{
  "scopes": {
    "tenant": [
      "contact:contact.base:readonly",
      "docx:document:readonly",
      "im:chat:read",
      "im:chat:update",
      "im:message.group_at_msg:readonly",
      "im:message.p2p_msg:readonly",
      "im:message.pins:read",
      "im:message.pins:write_only",
      "im:message.reactions:read",
      "im:message.reactions:write_only",
      "im:message:readonly",
      "im:message:recall",
      "im:message:send_as_bot",
      "im:message:send_multi_users",
      "im:message:send_sys_msg",
      "im:message:update",
      "im:resource",
      "application:application:self_manage",
      "cardkit:card:write",
      "cardkit:card:read"
    ],
    "user": [
      "contact:user.employee_id:readonly",
      "offline_access",
      "base:app:copy",
      "base:field:create",
      "base:field:delete",
      "base:field:read",
      "base:field:update",
      "base:record:create",
      "base:record:delete",
      "base:record:retrieve",
      "base:record:update",
      "base:table:create",
      "base:table:delete",
      "base:table:read",
      "base:table:update",
      "base:view:read",
      "base:view:write_only",
      "base:app:create",
      "base:app:update",
      "base:app:read",
      "board:whiteboard:node:create",
      "board:whiteboard:node:read",
      "calendar:calendar:read",
      "calendar:calendar.event:create",
      "calendar:calendar.event:delete",
      "calendar:calendar.event:read",
      "calendar:calendar.event:reply",
      "calendar:calendar.event:update",
      "calendar:calendar.free_busy:read",
      "contact:contact.base:readonly",
      "contact:user.base:readonly",
      "contact:user:search",
      "docs:document.comment:create",
      "docs:document.comment:read",
      "docs:document.comment:update",
      "docs:document.media:download",
      "docs:document:copy",
      "docx:document:create",
      "docx:document:readonly",
      "docx:document:write_only",
      "drive:drive.metadata:readonly",
      "drive:file:download",
      "drive:file:upload",
      "im:chat.members:read",
      "im:chat:read",
      "im:message",
      "im:message.group_msg:get_as_user",
      "im:message.p2p_msg:get_as_user",
      "im:message:readonly",
      "search:docs:read",
      "search:message",
      "space:document:delete",
      "space:document:move",
      "space:document:retrieve",
      "task:comment:read",
      "task:comment:write",
      "task:task:read",
      "task:task:write",
      "task:task:writeonly",
      "task:tasklist:read",
      "task:tasklist:write",
      "wiki:node:copy",
      "wiki:node:create",
      "wiki:node:move",
      "wiki:node:read",
      "wiki:node:retrieve",
      "wiki:space:read",
      "wiki:space:retrieve",
      "wiki:space:write_only"
    ]
  }
}
```

6、在弹窗中确认权限无误后，单击“申请开通”按钮，完成操作。

相关权限的具体含义可查看[飞书API权限列表](https://open.larkoffice.com/document/server-docs/application-scope/scope-list)。

![图像](https://pbs.twimg.com/media/HCtTi5GaUAAiLYH?format=jpg&name=large)

- **发布应用并审核通过**

**7、**发布应用。

单击顶部的“创建版本”按钮。

![图像](https://pbs.twimg.com/media/HCtTq3hbIAAa3rF?format=jpg&name=large)

8、按需配置应用版本号、默认能力及更新说明等信息。[了解更多](https://open.larkoffice.com/document/best-practices/intro-to-custom-app-review)。

![图像](https://pbs.twimg.com/media/HCtTzKbaUAArZRK?format=jpg&name=large)

9、单击页面底部的“保存”按钮，创建版本。

![图像](https://pbs.twimg.com/media/HCtT3r1bEAAOvTh?format=jpg&name=large)

10、单击页面右上角的“确认发布”按钮，完成应用发布。

![图像](https://pbs.twimg.com/media/HCtT8q9aUAMPjfJ?format=jpg&name=large)

- 获取应用appid appsecret

11、在左侧目录选择“基础信息 > 凭证与基础信息”。

12、在“应用凭证”模块中，获取并记录App ID与App Secret信息。

![图像](https://pbs.twimg.com/media/HCtUIRQbQAANh0w?format=jpg&name=large)

## 2、安装飞书插件

> 如果历史上已安装了其他飞书插件，在这一步安装过程中将会**自动禁用**其他飞书插件，无需额外处理；如果你所在的平台有辅助开发 Agent ，可以试试让Agent辅助安装

依次在「终端」app 中执行以下命令：

Linux/MacOS：

```text
npm config set registry https://registry.npmjs.org
```

如果历史已关联飞书应用，可选是沿用历史飞书应用，还是创建或关联新应用。如果是创建或关联新应用，则填入第1步中创建新应用的 appid 和 appsecret

![图像](https://pbs.twimg.com/media/HCtVNajaUAAqM8I?format=jpg&name=large)

```text
openclaw gateway run
```

**验证是否成功：**

运行上述代码后，如果出现下面这段说明插件已经开始监听飞书的事件，启动成功

![图像](https://pbs.twimg.com/media/HCtVaYabIAAGStW?format=jpg&name=large)

运行 **openclaw plugins list**，ID为**feishu-openclaw-plugin**的Status为loaded，ID为**feishu**的Status为disabled则标明已成功启用飞书官方插件：

![图像](https://pbs.twimg.com/media/HCtVhMYaIAALfER?format=jpg&name=large)

## 3、订阅机器人长链接 接收事件 和卡片回调

> 注意：需要配置卡片回调，便于小龙虾可以感知到你点击了卡片按钮操作

- 进入[飞书开放平台](https://open.feishu.cn/app?lang=zh-CN)，配置事件订阅方式

1、配置方式为长连接

![图像](https://pbs.twimg.com/media/HCtV2_WacAAUyaH?format=jpg&name=large)

2、添加事件 接收消息、消息被reaction、消息被取消reaction

![图像](https://pbs.twimg.com/media/HCtV9ORaEAAFMQS?format=jpg&name=large)

![图像](https://pbs.twimg.com/media/HCtWBtKaUAI1h5D?format=jpg&name=large)

- **点击回调配置**

**3、**配置方式为长连接

![图像](https://pbs.twimg.com/media/HCtWK1IasAAhS3L?format=jpg&name=large)

4、添加回调

![图像](https://pbs.twimg.com/media/HCtWRC_aUAAgMHq?format=jpg&name=large)

- 发布版本并审核通过

![图像](https://pbs.twimg.com/media/HCtWXMPbIAABlJd?format=jpg&name=large)

## 4、完成机器人的配对并开始使用

> 如果希望快速完成给龙虾的权限授权，便于丝滑调用各种飞书工具，可以随时告诉AI：“我想授予所有用户权限”，来完成权限的授予。

1. 在飞书中向机器人发送任意消息，系统会生成一个配对码（字母+数字组合）；如果历史已安装过飞书插件，可能没有该配对过程。
2. 配对码有效期为 5 分钟，超时需重新触发
3. 在服务器终端执行以下命令完成绑定：openclaw pairing approve feishu <配对码> --notify
4. 按照下图完成授权，便于后续 openclaw 可以通过你的身份完成消息、文档、多维表格、日历等任务。 如果不想在此刻授权，也可以直接开始对话，后续在对话框中输入 /feishu auth 来完成批量授权

![图像](https://pbs.twimg.com/media/HCtWoS6aUAEjRfi?format=jpg&name=large)

5\. 确认是否安装成功，可在与AI 的对话中发送：/feishu start；如果返回了版本号信息，则代表安装成功。

6\. 为了让龙虾能学会这些新技能并正确使用，请和龙虾说“学习一下我安装的新飞书插件，列出有哪些能力”

# 三、使用注意事项

## 1、如何更新插件

运行下面代码：

```text
feishu-plugin-onboard update
```

Q：如果发现找不到该指令，则可以先安装一下以下脚本

**Linux/MacOS**

Coze的环境不要这一步

```text
npm config set registry https://registry.npmjs.org
```

接下来运行：

> curl -o /tmp/feishu-openclaw-plugin-onboard-cli.tgz [https://sf3-cn.feishucdn.com/obj/open-platform-opendoc/195a94cb3d9a45d862d417313ff62c9c\_gfW8JbxtTd.tgz](https://sf3-cn.feishucdn.com/obj/open-platform-opendoc/195a94cb3d9a45d862d417313ff62c9c_gfW8JbxtTd.tgz)curl -o /tmp/feishu-openclaw-plugin-onboard-cli.tgz [https://sf3-cn.feishucdn.com/obj/open-platform-opendoc/195a94cb3d9a45d862d417313ff62c9c\_gfW8JbxtTd.tgz](https://sf3-cn.feishucdn.com/obj/open-platform-opendoc/195a94cb3d9a45d862d417313ff62c9c_gfW8JbxtTd.tgz)

接下来运行：

> npm install /tmp/feishu-openclaw-plugin-onboard-cli.tgz -g

提示：👆如果执行这一行命令行出错，可在命令行前 增加sudo 重新执行

最后运行：

> rm /tmp/feishu-openclaw-plugin-onboard-cli.tgz删除 /tmp/feishu-openclaw-plugin-onboard-cli.tgz

**Windows cmd、**

Coze的环境跳过这一步

> npm config set registry [https://registry.npmjs.org](https://registry.npmjs.org/)npm 配置设置注册表 [https://registry.npmjs.org](https://registry.npmjs.org/)

接下来运行：

> curl -o "%TEMP%\\feishu.tgz" [https://sf3-cn.feishucdn.com/obj/open-platform-opendoc/195a94cb3d9a45d862d417313ff62c9c\_gfW8JbxtTd.tgz](https://sf3-cn.feishucdn.com/obj/open-platform-opendoc/195a94cb3d9a45d862d417313ff62c9c_gfW8JbxtTd.tgz)curl -o "%TEMP%\\feishu.tgz" [https://sf3-cn.feishucdn.com/obj/open-platform-opendoc/195a94cb3d9a45d862d417313ff62c9c\_gfW8JbxtTd.tgz](https://sf3-cn.feishucdn.com/obj/open-platform-opendoc/195a94cb3d9a45d862d417313ff62c9c_gfW8JbxtTd.tgz)

接下来运行：

> npm install -g "%TEMP%\\feishu.tgz"

接下来运行：

> del "%TEMP%\\feishu.tgz"

## 2、遇到使用问题怎么办

1. 可在与AI 的对话中发送 **/feishu start**：确认是否安装成功； **/feishu doctor**：可检查配置是否正常； 如果希望批量完成用户授权，**/feishu auth** 可批量完成用户授权； 插件中也内置了常见问题的解决方案，遇到问题 都可以先问问小龙虾了！
2. 如果不行，则运行指令：

```text
feishu-plugin-onboard doctor
```

可以查看问题，自主修复：

![图像](https://pbs.twimg.com/media/HCvPc_qaYAA2k50?format=jpg&name=large)

**运行 fix尝试自动修复：**

```text
feishu-plugin-onboard doctor --fix
```

![图像](https://pbs.twimg.com/media/HCvPsdyacAA0PbG?format=jpg&name=large)

如果仍然无法修复，可在反馈群里反馈信息

运行 info 查看版本信息，反馈问题时带上辅助排查

> feishu-plugin-onboard infofeishu-plugin-onboard 信息

\--all查看详细配置信息

> feishu-plugin-onboard info --allfeishu-plugin-onboard 信息 --全部

# 四、常见问题

由于 X 的文章有媒体数量限制，且编辑太长遇到问题，所以，想要查看完整的问题，以及过程中反馈问题，大家可以去看官方的文档。

此文档为飞书刚发布的官方文档，在此重新整理排版分享给大家。如果要查看原文档，链接在此：

[https://bytedance.larkoffice.com/docx/MFK7dDFLFoVlOGxWCv5cTXKmnMh](https://bytedance.larkoffice.com/docx/MFK7dDFLFoVlOGxWCv5cTXKmnMh)