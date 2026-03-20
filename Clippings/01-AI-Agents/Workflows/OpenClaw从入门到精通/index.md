# OpenClaw 从入门到精通指南

- 原文链接: https://my.feishu.cn/docx/P6zsdsgYco6i4XxLeIccvlpvnQe
- 抓取方式: client_vars API
- 抓取时间: 2026-03-14T02:10:38.892Z
- 抓取页数: 2

> 我们整理这个文档的本意是帮助那些想试试 OpenClaw 的朋友，当然 OpenClaw 本身更新也非常快速，我们也尽量让本文档保持最新，如发现和最新有出入也欢迎联系我们修改，请轻喷。另外我们的文档大部分都是基于实际体验测试来手动编写的，可放心使用。整理不易，感谢支持🙏

# 关于作者

一个头发茂密的 AI 博主，欢迎关注苍何，一起玩 OpenClaw，回复：OpenClaw，加入交流群

![扫码_搜索联合传播样式-标准色版.bmp](images/%E6%89%AB%E7%A0%81_%E6%90%9C%E7%B4%A2%E8%81%94%E5%90%88%E4%BC%A0%E6%92%AD%E6%A0%B7%E5%BC%8F-%E6%A0%87%E5%87%86%E8%89%B2%E7%89%88-VWcwb7d2.bmp)

# 第一部分：OpenClaw 理论知识

> 理论部分，不想看的可以直接跳过到其他部分哈。

## 第一章：OpenClaw 是什么？

- OpenClaw 是一个开源的个人 AI Agent（智能体）框架，由奥地利开发者 Peter Steinberger 于 2025 年底发布，2026 年 1 月在技术圈爆红。它标志着 AI 从"对话工具"向"自主执行者"的范式转变。它不是一个 App，而是一个"住在电脑里的 AI 管家"。

地址是：https://openclaw.ai/

![image.png](images/image-Ac3ObrFA.png)

- 创始人：OpenClaw 的创始人 Peter Steinberger 是奥地利知名连续创业者：

1. 职业经历：曾创立 PSPDFKit 公司，开发出全球领先的 iOS PDF 处理框架，客户包括苹果、Adobe 等科技巨头

1. 退休与回归：2021 年以约 1.19 亿美元出售 PSPDFKit 股份后宣布退休，四年后因"创作欲望"重返技术领域

1. 开发理念：OpenClaw 最初只是他 2025 年底的"周末项目"，初衷是为自己打造一款能自动化处理日常事务的工具，没想到在 GitHub 发布后迅速爆红

Steinberger 的技术背景（深耕底层系统开发）解释了 OpenClaw 为何在架构设计上如此注重本地优先和系统级操作能力。

- 命名变迁史：三天两次改名的传奇（Clawbot→Moltbot→OpenClaw）

同步块

爆红数据：发布后 24 小时内 GitHub 斩获 9,000 Star，一周内突破 60,000 Star：

![微信图片_2026-02-03_145505_470.png](images/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_2026-02-03_145505_470-Peb2bQ5d.png)

第二阶段：Moltbot（2026年1月27日-1月29日）

改名原因：Anthropic 法务团队于 1 月 27 日发出"友好建议函"，指出 Clawd/Clawdbot 与 Claude 商标过于相似，存在侵权风险。

改名风波：更名过程堪称"数字抢劫案"：

1. Steinberger 在凌晨 5 点的 Discord 会议中决定改名

1. twitter 账号 @clawdbot 在10秒内被加密货币抢注机器人占领，立即发布虚假的 $CLAWD 代币钱包地址

1. Steinberger 误操作将个人 GitHub 账号而非组织账号重命名，导致原用户名 @steipete 被机器人抢走

1. 假币市值一度飙至 1600 万美元后暴跌 90%，Steinberger 不得不多次发推辟谣："永不发币"

新名寓意：Moltbot 取自 Molt（蜕皮），象征龙虾蜕壳成长，寓意项目的进化与蜕变

![0d35bcf3fbec7d3d7c9a0146d66374d6.png](images/0d35bcf3fbec7d3d7c9a0146d66374d6-AnDfbra4.png)

第三阶段：OpenClaw（2026年1月30日至今）

最终定名：团队吸取前两次教训，在改名前完成了：

1. 全球商标检索（确保无冲突）

1. 域名购买与社交账号保护

1. 社区投票确认

命名含义：

Open：强调开源、开放、透明的理念

Claw：保留龙虾爪元素，致敬项目起源，象征"抓取"和处理数字任务的能力

- 为什么它火了？

OpenClaw 在 2026 年 1 月的爆发并非偶然：

1. 时机精准：正值 AI 从"对话"向"Agent"转型的临界点，市场渴望能真正"干活"的 AI

1. 硬件联动：项目推动了 Mac mini（尤其是 M4 版本）的热销，因为用户需要一台 24 小时开机的低功耗设备作为宿主

1. 名人背书：AI 大神 Andrej Karpathy（前 Tesla AI 负责人、OpenAI 创始成员）发推称赞这是"最接近科幻'起飞'的场景"

1. 社交实验：基于 OpenClaw 构建的 Moltbook（AI Agent 专属社交网络，只有 AI 能发帖，人类只能围观）引发全网热议

## 第二章：核心特性与差异化优势

> 实用方便：
>
> 我认为这是最重要的一点，也是它为什么会爆火的根本原因。它让普通人第一次真实的看到了未来世界的雏形。虽然现在它还相当不完善，但却是实实在在的能让普通人也看到未来世界的样子。
>
> 传统 AI：被动响应，数据上云。 采用“一问一答”模式，每一步都需要用户确认。由于文件必须上传至第三方云端，处理复杂任务时既繁琐又存在隐私泄露风险。
>
> OpenClaw：本地指令，自主闭环。 真正做到"一句话搞定一整件事"。任务调度、文件处理、工具执行均在本地完成，原始文件本地驻留不上传。相比传统AI需将完整文件提交至云端处理，OpenClaw仅需向模型传输必要的指令和上下文，显著降低数据暴露范围。配合本地大模型（如Ollama）可实现完全离线运行，满足高隐私场景需求。

> 24×7小时驻留性：
>
>   - 传统AI：按需启动，用完即走。每次使用需打开特定App或网页，对话结束后进入"休眠"状态，无持续监听能力，无法执行定时或触发式任务。
>   - OpenClaw：常驻后台，随时待命。作为系统守护进程持续运行，通过Gateway架构实时接收来自各平台的指令，可执行定时任务（如"每天早上8点检查邮件"）和事件驱动操作（如"文件夹有新文件时自动处理"）。

> 高扩展性：
>
>   - 传统AI：封闭生态，受限于厂商。仅能使用官方提供的插件或功能，用户无法自定义能力边界，新功能需等待厂商更新。
>   - OpenClaw：模块化Skill，社区驱动。通过以Markdown为接口定义的Skill包扩展功能，Skill包含描述文件（SKILL.md）及可选的执行脚本、二进制工具等，支持从ClawHub市场一键安装，或自行开发私有Skill。

> 跨平台矩阵：
>
>   - 传统AI：封闭App，割裂体验。必须在特定网页或App内使用（如打开ChatGPT网页），无法融入用户已有的工作流程和通讯工具。
>   - OpenClaw：与平台无关，无缝嵌入。通过Gateway架构接入用户日常使用的通讯平台（Discord/Telegram/飞书/企业微信等），在不改变用户习惯的情况下提供服务。

## 第三章：系统架构与核心组件

- “大脑”：模型层：

你可以自定义你的”大脑“，OpenClaw 并不固定使用某一个 AI。你可以给它接入 Claude、chatGPT或者国产的 DeepSeek等任何支持OpenAI API协议的大模型。

- “手脚”：执行器：

这是OpenClaw区别于普通聊天机器人的核心组件。它能直接管理你电脑里的文件系统、终端和浏览器。当"大脑"规划好任务步骤后，执行器就像手一样去实际操作——翻找硬盘、点击网页、运行命令，完成具体动作。

- “外联部”：接入适配器 ：

它决定了你通过什么渠道跟你的AI交流。无论你是用Discord这种通讯平台，还是用飞书这种办公软件，OpenClaw都能听懂。它既负责把你的指令传进去，还可以把干完活的结果送出来。

- “档案室”：持久化记忆：

它拥有长效记忆。即使重启电脑，它依然会记得你。它还会把你的操作偏好、常用文件路径、甚至之前的对话重点都存在本地的“档案袋”里。

## 第四章：应用场景与潜力分析

### 4.1、应用场景

并不是所有事情都适合交给OpenClaw去做，任何需要不断做决策，不断进行调整的事情都不适合交给它来完成。反之，我们就可以推出它适合帮我们来做什么，那就是规则明确、可机械执行、步骤标准化的任务。

比如：文件整理，定时发送消息/邮件，监控文件夹/网页的变化并总结通知，简历/文档的初次筛选。

### 4.2、潜力分析

1. 从“助理”到“数字分身”：随着它对你本地文件和操作习惯的记忆加深，它会越来越像你。未来，它可能在你开会时，自动帮你过滤不重要的邮件，并模仿你的口吻回复那些“收到请回复”的消息。

1. 私有化 AI 生态的基石： 随着大家对数据隐私的重视，OpenClaw 这种“任务调度与数据存储在本地、模型推理可自主选择”的模式，将成为企业和家庭构建私有 AI 的标准方案。

1. Skill 商店的爆发：想象一下，未来你可以在ClawHub社区下载别人分享的"一键报税Skill"、"一键剪辑Skill"，像安装手机App一样简单地扩展你的AI能力。

## 第五章：现存挑战与局限性

- 配置门槛较高：

根据个人能力不同，第一次配置可能就需要花费数小时，期间还会遇到各种问题。

- 持有成本与 Token 消耗：

实现 24×7 全天候响应需租用云服务器或保持本地设备常开，这是一笔开销。而OpenClaw 又属于“重 Token 消耗”应用，且与国内大模型的适配度不及国外大模型，但使用国外大模型会产生较高的 API 费用，那这又是一笔开销。

- 权限安全隐患：（千万千万不要在自己的主电脑上部署！！！）

因为OpenClaw 拥有极高的文件管理与命令执行权限。在“自主闭环”的同时，若指令存在歧义或模型误解（如误删、误操作），可能导致不可逆的数据损失或财产风险。

> OpenClaw 绝非 AI Agent 的终极形态，而是 Agent 的一个很好的过渡形态。目前 OpenClaw 依旧有不少问题，比如耗费大量 token，记忆问题等。
>
> 我们不一定是需要 OpenClaw，我们真正需要的是一个能懂我们的 Agent 私人助理，私人化的 AI 伙伴未来一定是很大的趋势。

---

# 第二部分：小白一键部署篇

> OpenClaw 你可以部署在自己的电脑上，也可以部署在各个大厂提供的平台。对小白特别友好，无需配置模型，无需购买服务器，甚至无需复杂的配置，只需要动动手点点就好了。不过置换的是，你需要购买平台对应的会员之类的。

## 1、扣子 OpenClaw

打开：https://www.coze.cn/

注册登录后，按照箭头选择一键部署：

![O1W4b7rDtol2WzxiW8Pczqg5nEh.png](images/O1W4b7rDtol2WzxiW8Pczqg5nEh-O1W4b7rD.png)

3 分钟快速部署：

![Uk3Ub6l0AorK2HxOgxBcRZXhn1d.png](images/Uk3Ub6l0AorK2HxOgxBcRZXhn1d-Uk3Ub6l0.png)

当前「OpenClaw 部署」仅面向个人高阶版、个人旗舰版、企业标准版以及企业旗舰版用户开放限时体验。

![image.png](images/image-Y7J5bcLS.png)

最低可以购买高阶版，99 一个月，然后就可以体验了。

![image.png](images/image-SMrBbdxL.png)

选择模型和版本后，就能一键部署了，部署好了之后：

![KytjbsZSwoOcDKxoPLEcUm4RnCh.png](images/KytjbsZSwoOcDKxoPLEcUm4RnCh-KytjbsZS.png)

如果需要配置飞书渠道，可以参考如下配置：

点击配置，去创建：

![Re0NbvoqAo2urNxPSNVcqWRlnEf.png](images/Re0NbvoqAo2urNxPSNVcqWRlnEf-Re0Nbvoq.png)

做个授权，等待个几秒钟，机器人就创建成功了，可以按照这个视频来做配置：

[附件: file_v3_00vm_51c25bd1-d34c-420f-92ea-63edd9c8b9bg_84545734-c842-4ba7-81d5-88f325d23a41.mp4](files/file_v3_00vm_51c25bd1-d34c-420f-92ea-63edd9c8b9bg_84545734-c-BJ7WbrP3.mp4)

在飞书里面就可以使用扣子的小龙虾了。

![URhcbrfgWoJPyHxxumpc1hhInGc.png](images/URhcbrfgWoJPyHxxumpc1hhInGc-URhcbrfg.png)

可以用来做啥呢？可做的还蛮多的，比如可以做数字人。

我只用丢一张照片，然后丢一张任意照片，就能让 OpenClaw 克隆该形象：

![Dw6nbwR5XoaEHsx9QdHcDu1Knhd.png](images/Dw6nbwR5XoaEHsx9QdHcDu1Knhd-Dw6nbwR5.png)

然后传任意一个语音文件丢给 OpenClaw，就能克隆这个声音。

![FRuGbMkddoH0hvxSsOPc53WsnNf.png](images/FRuGbMkddoH0hvxSsOPc53WsnNf-FRuGbMkd.png)

然后用刚才克隆的形象和声音组合，让 OpenClaw 搜集今天的 AI 新闻，给我们来做个数字人播报：

[附件: 扣子openclaw-1.mp4](files/%E6%89%A3%E5%AD%90openclaw-1-EAHybSQQ.mp4)

橘子一岁的照片配合这个磁性的声音，好魔幻，好魔幻，哈哈哈哈。

不恶搞自己的博主不是好博主，豁出去了，把我的🐶照片克隆一下：

![OytxbUHoDoTVWixFM4yczei4n8g.png](images/OytxbUHoDoTVWixFM4yczei4n8g-OytxbUHo.png)

我的声音就不克隆了，不够性感，还是继续用这个美女的声音。

> 保命神明，仅用作交流学习，大家请谨慎使用，注意安全。

[附件: 扣子openclaw-2.mp4](files/%E6%89%A3%E5%AD%90openclaw-2-YCaVbTsw.mp4)

还是不够刺激？抖音上看到有些梗，有些有趣的爆款视频，也想复刻？

那就配合之前给大家分享的抖音视频下载 Skills，自动下载视频，提取视频中的音频，利用数字人技能自动克隆音色及形象。

比如，我想在抖音上刷到这个懂王的视频。

![AkORbW8seorKI6xlZwQc0IPWnte.png](images/AkORbW8seorKI6xlZwQc0IPWnte-AkORbW8s.png)

我直接丢给抖音链接给我的扣子 OpenClaw，让他先帮我无水印下载该视频：

![A0Ikbcc5KoS4ZBxpE9BcJjv1nIc.png](images/A0Ikbcc5KoS4ZBxpE9BcJjv1nIc-A0Ikbcc5.png)

然后让小龙虾提取音频：

![WOZWbkHNwo55DzxCXThcEbF4nvd.png](images/WOZWbkHNwo55DzxCXThcEbF4nvd-WOZWbkHN.png)

然后克隆声音：

![KbsbbaD4hoRH01xNRq9ca7ienZe.png](images/KbsbbaD4hoRH01xNRq9ca7ienZe-KbsbbaD4.png)

但当我想要克隆懂王形象的时候，不让克隆了。

![TsPMbiiLhoocm8xCUqCcqHCTn8t.png](images/TsPMbiiLhoocm8xCUqCcqHCTn8t-TsPMbiiL.png)

ok，那就用自己的形象，懂王的声音，来生成一段数字人视频不😂

[附件: 扣子openclaw-3.mp4](files/%E6%89%A3%E5%AD%90openclaw-3-PAv9bqDw.mp4)

扣子他们还搞了个 Agent 交流平台，目前已经有 13634 多个 Agent 了。

![KcElb0NqQodk6Lxa2vWcIHvknMb.png](images/KcElb0NqQodk6Lxa2vWcIHvknMb-KcElb0Nq.png)

我们也可以把自己的小龙虾注册上去，然后发帖子和别的小龙虾一起互动玩起来。

注册也很简单，你可以像我一样给这个提示词：

```java
你去这里 https://instreet.coze.site/skill.md 注册一个InStreet 账号，然后发帖推广一下苍何这个 AI 博主，并夸下他
```

![PYTzbCJtzo91Lmxw61jcOk6FnQc.png](images/PYTzbCJtzo91Lmxw61jcOk6FnQc-PYTzbCJt.png)

我的虾就立马发了贴夸我的帖子，并且有别的虾来评论了：

![VSYqb9dRNo3DqHxNvLNcJoE1nxb.png](images/VSYqb9dRNo3DqHxNvLNcJoE1nxb-VSYqb9dR.png)

大家都可以吧自己的小龙虾注册上去玩玩。

然后是需要安装数字人 Skills，我用的是国内比较出名的飞影数字人，在 clawhub 中搜索下 flyworks-avatar-video：

![VhLtbTcmEoZQPKx52EVc1FQanng.png](images/VhLtbTcmEoZQPKx52EVc1FQanng-VhLtbTcm.png)

然后下载这个技能压缩包在电脑：

![SS5abZXAPo9jUVxtfbgcWQbunNf.png](images/SS5abZXAPo9jUVxtfbgcWQbunNf-SS5abZXA.png)

然后在飞书 bot 中把这个安装包发给扣子小龙虾，让他自己安装下：

![BmvEbQewQotHAkxLfTTcchAXnHg.png](images/BmvEbQewQotHAkxLfTTcchAXnHg-BmvEbQew.png)

> PS：所有的外部技能安装都可以用这种方法。

需要配置一个 API，你可以打开下面的链接：

```java
https://hifly.cc/p/NJb1xnB5OZhYFbHp
```

注册后，点击个人中心获得 API：

![T12Rbyzg9oam4KxEBpWcp6ylnmb.png](images/T12Rbyzg9oam4KxEBpWcp6ylnmb-T12Rbyzg.png)

你可以看到上面消耗的额度什么的，你用这链接注册理论上是有 1000 积分可以体验。

不过要想生成视频，就需要买个什么小龙虾套餐，要 249 一个月，填个邀请码「sc8OpCT1Zfs」能多获得 5000 积分，加起来差不多可以生成 88 分钟的视频。如果是体验够玩了我觉得。

![BhHeb8F5Qob7eDxV2mpcaSg2neg.png](images/BhHeb8F5Qob7eDxV2mpcaSg2neg-BhHeb8F5.png)

然后把你的 key 丢给 openclaw，让他配置下，接下来，你就可以克隆，然后生成数字人玩了。

说到扣子，很多人还停留在过去仅仅能做智能体的时代，现在的扣子让人感觉不一样了。

前端时间推出了技能商店，给创作者能直接通过技能赚钱，我也发了好几个技能上去：

![LLAUbkFrAoHvICxCSQdcpboTnOv.png](images/LLAUbkFrAoHvICxCSQdcpboTnOv-LLAUbkFr.png)

当然，我的技能目前还都是免费的，大家可以在扣子上直接免费使用。

除此，扣子还推出了扣子编程，能用自然语言做应用，给很多不懂代码但是想用 AI 做应用的小白一个很好的入口。

除了做应用，还可以用嘴做工作流，做 Agent，做技能等。

![K5fMb7u29oHhqDx6o2IclRuUnZb.png](images/K5fMb7u29oHhqDx6o2IclRuUnZb-K5fMb7u2.png)

其实他这个扣子小龙虾也是通过扣子编程的方式搭建的一个应用：

![Uo4Zb1AwOoeB6RxnrFvcAAVFnIe.png](images/Uo4Zb1AwOoeB6RxnrFvcAAVFnIe-Uo4Zb1Aw.png)

你是可以直接在这里改小龙虾的各种配置，以及安装技能，看使用情况等，都是非常方便的：

![KEpbbH7skon1kdxyUz8cAHqFnt6.png](images/KEpbbH7skon1kdxyUz8cAHqFnt6-KEpbbH7s.png)

我也专门写了一篇公众号文章，感兴趣的也可以去看看。

https://mp.weixin.qq.com/s/WlRQmZuI5DsMOWvos4JD8Q

## 2、Kimi OpenClaw

打开 Kimi 官网：https://www.kimi.com/

点击 Kimi Claw，简称 kimi 版小龙虾。

![I8WQb1oX4oEDk9xFyPncQmqrnXc.png](images/I8WQb1oX4oEDk9xFyPncQmqrnXc-I8WQb1oX.png)

当你用你粗壮的大拇指点击创建时，等待个 1 分多钟就部署好了。

![OSTubfctPooXd8xlGo5c71q1nOd.png](images/OSTubfctPooXd8xlGo5c71q1nOd-OSTubfct.png)

然后就可以在浏览器里面直接召唤出小龙虾。

![YImHbZmhKo8t2gx1awAcBMmMnxd.png](images/YImHbZmhKo8t2gx1awAcBMmMnxd-YImHbZmh.png)

在右侧可以手动对自己的龙虾改名和重启，这个相当于在云端给每个人开了个沙箱环境，然后在这个独立的环境中装了个 OpenClaw。

> 不过这个一键部署仅支持 Allegretto 及以上计划，大概 200，我之前买了所以就能直接创建。

这里自动配置的 Kimi K2.5 Thinking 模型会自动关联 Kimi Code 会员权益额度。

在使用记录这里也能看到具体的使用：

![MuNBbvLnSoXwMmxx9mEcW9ginjf.png](images/MuNBbvLnSoXwMmxx9mEcW9ginjf-MuNBbvLn.png)

如果已经有自己的 OpenClaw，也可以通过安装 Kimi 插件的方式实现在 Kimi 里和 OpenClaw 聊天。

说实话，这个配置插件的方式只是多了一种渠道罢了，我这里就没把自己的龙虾关联过来，而是重新新建了一个。

毕竟新建一个干干净净的环境，想装啥 skill 就装啥，不用担心和自己本地的龙虾配置冲突，用起来反而更省心。

并且在飞书上做了集成，也就是我现在飞书上直接召唤 KimiClaw，整个配置过程，花了 3 分钟不到。

![HOYlbFXnOo7PvdxPfPvcgH6zndd.png](images/HOYlbFXnOo7PvdxPfPvcgH6zndd-HOYlbFXn.png)

然后把小龙虾拉进群聊，大家一起吹水。

![Ws36bm84HoqLTbxL8vIcRIqDnRe.png](images/Ws36bm84HoqLTbxL8vIcRIqDnRe-Ws36bm84.png)

整个过程丝滑到有些怀疑人生，对小白来说简直太友好。

> 飞书如何快速接入，教程我放在文章后面吧，感兴趣的可以移步。

当在飞书里对话时，它会先给你个回复表情，代表已收到，还挺有用的，不然每次等待回复的过程以为挂了导致会重复发送。

![HE7VbNOHeoZiwxxNxjWcXCi0n3c.png](images/HE7VbNOHeoZiwxxNxjWcXCi0n3c-HE7VbNOH.png)

ClawHub 是专门为小龙虾提供的 skill 仓库，这里有非常多好用的 skill。

> 地址：https://clawhub.ai/

![WBq3bFq70oQJpIxFzrpcHzQ7nUe.png](images/WBq3bFq70oQJpIxFzrpcHzQ7nUe-WBq3bFq7.png)

在 KimiClaw 里，从 ClawHub 获取技能很简单，只需要跟他说需要的需求，就能快速安装好。

比如我的小红书封面图技能，下达指令后，快速安装，然后就可以直接使用这个技能生成小红书精美封面图片了。

![UKBvbThgLoDIyKxfjd7cPfrXnAe.png](images/UKBvbThgLoDIyKxfjd7cPfrXnAe-UKBvbThg.png)

除了这种方式，对于一些没有上到 ClawHub 的技能，也可以直接把 GitHub 项目地址丢给他，也能一键安装。

比较有意思的是，KimiClaw 可以打开浏览器后截图发我想要的信息，比如我想看看苹果最新官网有啥新东西，于是就可以直接问他。

![EpIhbapN9o4knhxAxtBcs6ldnnh.png](images/EpIhbapN9o4knhxAxtBcs6ldnnh-EpIhbapN.png)

基于此，我还发现一个比较好玩的玩法，就是你不用去装什么 API，你可以通过这种方式来监控你关注账号的最新动态。

![BA87bTk6FoF1VPx33ELc6Z08n2b.png](images/BA87bTk6FoF1VPx33ELc6Z08n2b-BA87bTk6.png)

他能够去查看最新的动态通过浏览器访问截图然后分析的方式，想想我们人不也是这样？打开，查看，这是绝对安全的方式，也不需要配置 API：

![I8Jeb4qKMojhxoxGRCLcqemjnkg.png](images/I8Jeb4qKMojhxoxGRCLcqemjnkg-I8Jeb4qK.png)

你可以一个定时任务，比如设置每 2 分钟就去截图一次，看看有没有更新。

![AJpMb9uMXocxfJx9hTRcB5ibnFd.png](images/AJpMb9uMXocxfJx9hTRcB5ibnFd-AJpMb9uM.png)

拿这个来监控奥特曼，据说这家伙，2 月份从 19 号之后又要搞事，频发产品。

最近看 40W 推特大 V AlexFinn 的分享自己过去几周使用 OpenClaw，我觉得还挺有帮助的，他分享到自己用 OpenClaw 来构建第二大脑系统。

![GgHFb1Srwo9PCUx6qNqcJPdKnOe.png](images/GgHFb1Srwo9PCUx6qNqcJPdKnOe-GgHFb1Sr.png)

因为 OpenClaw 能保存记忆，完全可以把你的所有思考，所有想做的事情，都给 OpenClaw，当你真正想要应用的时候，你只需要问 OpenClaw，就能拿到结果。

比如当我在飞书中下达这个指令，它会帮我自动开发好这套系统。

```java
我想构建一个第二大脑系统,可以查看我们所有的笔记、对话和记忆。请用Next.js构建出来，请直接给我应用。
```

![K9QTbPfZfos40fxF5YpcrgZvnjh.png](images/K9QTbPfZfos40fxF5YpcrgZvnjh-K9QTbPfZ.png)

接下来，我只需要把我的所思所遇所想通通丢给 KimiClaw：

```java
今天看到一句话，帮我记下： 挣钱，靠手脚，拼的是眼力和体力，勤奋最重要。 赚钱，靠资本，拼的是脑力和心力，认知最重要。
```

![ScQhbcvWHoo603xhQ9HcpYPynpf.png](images/ScQhbcvWHoo603xhQ9HcpYPynpf-ScQhbcvW.png)

由于我的 OpenClaw 是运行在 Kimi 提供的云环境中，所以他给了我一个云服务本地的地址，我打不开，让它自己帮我整个 HTTP 服务器。

![TjAkb2pUgo5qpwxl4DHc3QvUnUf.png](images/TjAkb2pUgo5qpwxl4DHc3QvUnUf-TjAkb2pU.png)

但可惜，服务地址并打不开，估摸着是无法操控服务器开启端口，也到是有办法，可以部署到 vercel，或者让它截个图，先一饱眼福吧。

![VorUbcmZtoz6plxcxvlc58DGnHd.png](images/VorUbcmZtoz6plxcxvlc58DGnHd-VorUbcmZ.png)

打开看看这个由 K 2.5 生成的页面，我是一眼就认出来了，哈哈。

![ZtbjbJypGooMLVx7tMMcq7PZn2b.jpg](images/ZtbjbJypGooMLVx7tMMcq7PZn2b-ZtbjbJyp.jpg)

稍微观察下就能发现，它把我和它的任务记录也都记录出来了👍。

以后有什么，直接丢给它，做第二大脑太舒服了。

下面介绍下接入飞书机器人步骤，非常简单，直接在 KimiClaw 里面提问说怎么接入飞书，它会一步步教你。

第一步，创建飞书机器人

访问飞书开放平台：https://open.feishu.cn/app，点击创建应用：

![OjMUbaNqRoBLDjxCAvjc6OULnMc.png](images/OjMUbaNqRoBLDjxCAvjc6OULnMc-OjMUbaNq.png)

填写应用名称和描述后就直接创建：

![NqenbMkKuo8qjLxQX0Pccn5SnnX.png](images/NqenbMkKuo8qjLxQX0Pccn5SnnX-NqenbMkK.png)

点击添加应用能力，添加机器人。

![F8AcbHf7noaX24xowtucahdmnHd.png](images/F8AcbHf7noaX24xowtucahdmnHd-F8AcbHf7.png)

第二步，配置权限

需要至少开通以下的权限：

![BQM9bb7RYojz1sxpWEfctScNn8f.png](images/BQM9bb7RYojz1sxpWEfctScNn8f-BQM9bb7R.png)

可以在权限管理-开通权限这里选择需要的权限手动开通：

![RPpPbmMvJoBNWHxZSGTcSaKznhg.png](images/RPpPbmMvJoBNWHxZSGTcSaKznhg-RPpPbmMv.png)

也可以直接导入以下权限配置即可：

```java
{
  "scopes": {
    "tenant": [
      "aily:file:read",
      "aily:file:write",
      "application:application.app_message_stats.overview:readonly",
      "application:application:self_manage",
      "application:bot.menu:write",
      "contact:user.employee_id:readonly",
      "corehr:file:download",
      "event:ip_list",
      "im:chat.access_event.bot_p2p_chat:read",
      "im:chat.members:bot_access",
      "im:message",
      "im:message.group_at_msg:readonly",
      "im:message.p2p_msg:readonly",
      "im:message:readonly",
      "im:message:send_as_bot",
      "im:message.reactions:read",
      "im:resource"
    ],
    "user": ["aily:file:read", "aily:file:write", "im:chat.access_event.bot_p2p_chat:read"]
  }
}
```

![KxQSb5P4ooNzMux2p5pcc46wnIb.png](images/KxQSb5P4ooNzMux2p5pcc46wnIb-KxQSb5P4.png)

第三步，找到 App ID 和 App Secret

在凭证与基础信息中找到 App ID 和 App Secret，这个在飞书配置的时候会需要。

![HnWVbBLsHo7SIUxIu2GcpzPtnye.png](images/HnWVbBLsHo7SIUxIu2GcpzPtnye-HnWVbBLs.png)

然后把 App ID 和 App Secret 发给 KimiClaw

第四步，事件与回调

在 KimiClaw 重启后，在飞书配置页点「事件与回调」，使用 长连接 接收事件，点击【保存】。保存后添加事件：im.message.receive_v1

![Ck8obfE9Zo4Vvoxgr1WcXZpxnUe.png](images/Ck8obfE9Zo4Vvoxgr1WcXZpxnUe-Ck8obfE9.png)

待重启后，接下来就可以直接在飞书中使用了。

在飞书中的 bot 和 web 里的 bot 是同一个，消息也是通的。

## 3、飞书openclaw

> 2026 年 3 月 31 日 24:00 时（北京时间）前免费部署、每日免费 100 万 Tokens 额度！每日限量 10 万名，

![image.png](images/image-NHm3bVkE.png)

主打一分钟极限部署，有手就行。如果部署的早的话，每天都有免费额度，如果找不到额度了，可能已经活动结束了，早不熟早优势。

可以电脑上点击链接：https://miaoda.feishu.cn/

点击创建：

![image.png](images/image-DRc2bbhB.png)

进行一键配置就好了，当然你也可以直接手机打开飞书，搜索「妙搭」，然后手机上点几下就配置好了。

![微信图片_2026-03-11_104757_649.jpg](images/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_2026-03-11_104757_649-MXwkb1Vd.jpg)

不到一分钟，就安装配置好，并且丝滑的链接上了飞书。

![Y3Nbb3Uv4oGUqNxpAoZcnHcLngb.jpg](images/Y3Nbb3Uv4oGUqNxpAoZcnHcLngb-Y3Nbb3Uv.jpg)

在飞书秒搭也能看到刚才创建好的 OpenClaw，同时也能删除和管理 OpenClaw。

![CaEwbDeLvoCsV2xa2VRcxqI1nm3.png](images/CaEwbDeLvoCsV2xa2VRcxqI1nm3-CaEwbDeL.png)

比如当你的 OpenClaw 坏了，或者想定制一些什么功能，你就能直接在秒搭上修改了，比如我让我的小龙虾每次完成任务后都来个”已完成，苍何大大🩷”

![OmZ6ba4tcoiYatxjtCCcgxZhnmh.png](images/OmZ6ba4tcoiYatxjtCCcgxZhnmh-OmZ6ba4t.png)

我打开飞书开放平台，也看到了刚才自动创建的这个飞书机器人，可以说，体验丝滑到极致了。

![FvltbbCw7orPdkx10IPcnqWVnlc.png](images/FvltbbCw7orPdkx10IPcnqWVnlc-FvltbbCw.png)

和别的小龙虾不一样的是，在对话页面多了「快捷指令」和「设置」按钮，当点击快捷指令，会有 2 个功能：

> /new：新建一个会话 /stop：阻断当前对话

![Td1Obi2CeoBPwqxZnx9cXZcMnrg.png](images/Td1Obi2CeoBPwqxZnx9cXZcMnrg-Td1Obi2C.png)

讲真，这 2 功能还挺方便的，经常聊多了会出现上下文污染，有 /new 就可以重新开始一个对话。

出现龙虾瞎搞或者和预期不符时，也可以快速的用 /stop 命令制止他。

当你点击设置的时候，实际上就会崩到飞书秒搭小龙虾的设置界面了。

![A4cRblKbEoXPABxCkk0c8x21n8d.png](images/A4cRblKbEoXPABxCkk0c8x21n8d-A4cRblKb.png)

核心二，就是当小龙虾出问题，你得找得到地方排查问题，修复问题，或者配置，你可以在秒搭上找到你🦞，点击管理：

![CZa1bt8FMo8JTKxxZ6xcf4PDnFd.png](images/CZa1bt8FMo8JTKxxZ6xcf4PDnFd-CZa1bt8F.png)

可以自定义你的小龙虾，也可以添加技能什么的：

![UNHGbKgXGooqRCxYIurcod4On8N.png](images/UNHGbKgXGooqRCxYIurcod4On8N-UNHGbKgX.png)

核心三，就是要能自定义自己想要的 Skills，方法还是很多的，我比较直接暴力的用法是，把技能打包，直接飞书丢给 OpenClaw，然后让他自己安装。

![T63Ibr08lolBdcx6XWncOgivnnd.png](images/T63Ibr08lolBdcx6XWncOgivnnd-T63Ibr08.png)

比如我安装好了我自定义的生图技能，就能让 OpenClaw自由调用了：

![MM5gbWVFMofa6NxCe4ZcVOdTnWd.png](images/MM5gbWVFMofa6NxCe4ZcVOdTnWd-MM5gbWVF.png)

可以干啥呢？

比如可以一句话创建飞书多维表格：

[附件: 飞书秒搭 openclaw-7.mp4](files/%E9%A3%9E%E4%B9%A6%E7%A7%92%E6%90%AD-openclaw-7-WNcZbTdN.mp4)

当然了，生成飞书的待办也是一句话需求，比如我把公司发票和会议纪要丢给他，OpenClaw 直接帮生成待办，并用文档发给我。

[附件: 飞书秒搭 openclaw-8.mp4](files/%E9%A3%9E%E4%B9%A6%E7%A7%92%E6%90%AD-openclaw-8-OWoebPS9.mp4)

然后基于待办生成飞书的日程，AI 时代的办公就是这么朴实无华。

[附件: 飞书秒搭 openclaw-9.mp4](files/%E9%A3%9E%E4%B9%A6%E7%A7%92%E6%90%AD-openclaw-9-AIknbH2W.mp4)

如果这还只是小打小闹，那基于这些元能力，配合上自定义加装的技能，可玩性就非常大了。

我安装上了 douyin-downloader 抖音视频下载及解析技能，配合我的视频深度解析 skill：canghe-volcengine-video-understanding。

就能直接将爆款抖音视频链接生成公众号文章，并保存在飞书文档中，配图会截取视频部分图片及生图，真正做到一键操作。

[附件: 飞书秒搭 openclaw-4.mp4](files/%E9%A3%9E%E4%B9%A6%E7%A7%92%E6%90%AD-openclaw-4-Q1nxbvow.mp4)

抖音视频链接直接可以通过技能下载：

![OSp2by9GDoHH8ex493EcNHpCnCR.png](images/OSp2by9GDoHH8ex493EcNHpCnCR-OSp2by9G.png)

解析视频，截取视频图片，生成公众号文章，放到飞书文档，一波流操作：

![OgUPb4HuMo82fsxYVjDcDlUDnad.png](images/OgUPb4HuMo82fsxYVjDcDlUDnad-OgUPb4Hu.png)

非常的丝滑，给个任务给 OpenClaw，这家伙就什么都帮我干好了。

原文详细地址：https://mp.weixin.qq.com/s/QKO0jbqol9LVbuhH9DQx-g

飞书官方教程：

## 4、腾讯OpenClaw——WorkBuddy

官网地址：https://www.codebuddy.cn/work/

这是腾讯 CodeBuddy 团队开发的一款桌面端 Agent，也可以用飞书、企业微信直接连接。

简单来说 WorkBuddy 是 AI 原生桌面 Agent，能自主完成很多的办公类自动化操作。像什么数据分析，做 PPT，文件管理，通通都可以完成。

![IvqUb2kiRo70k2xm9HTcWCAInVd.png](images/IvqUb2kiRo70k2xm9HTcWCAInVd-IvqUb2ki.png)

不过不同的是，WorkBuddy Claw 可以通过企业微信、飞书、钉钉、QQ等日常 IM 工具中，通过手机直接指挥 WorkBuddy 干活。

![EzOmbSMdBolx4Exqi6AcoPGAnRg.png](images/EzOmbSMdBolx4Exqi6AcoPGAnRg-EzOmbSMd.png)

打开 WorkBuddy，点击右上角个人按钮，选择「claw 设置」：

![Vy5wbSzTNocMUTx8XyOcaKZ0nQe.png](images/Vy5wbSzTNocMUTx8XyOcaKZ0nQe-Vy5wbSzT.png)

选择飞书集成：

![EbFxbd0dcoD17LxQ5VacvcJxnRg.png](images/EbFxbd0dcoD17LxQ5VacvcJxnRg-EbFxbd0d.png)

可以看到需要这 2 个参数，下面就是需要去飞书开放后台搞到这 2 参数。

![OHOTbyVOboPOVtxYNCucPBKbnCe.png](images/OHOTbyVOboPOVtxYNCucPBKbnCe-OHOTbyVO.png)

打开飞书开放后台，选择企业自建应用，创建企业自建应用：

![Rb3vbcbaBoDLCcxbOzvcTMzOnIh.png](images/Rb3vbcbaBoDLCcxbOzvcTMzOnIh-Rb3vbcba.png)

飞书开放后台地址如下：

```java
https://open.feishu.cn/app?lang=zh-CN
```

添加应用能力，选择添加一个机器人：

![QSDwbP8kaoDNYAxcCLNcUWXPn5e.png](images/QSDwbP8kaoDNYAxcCLNcUWXPn5e-QSDwbP8k.png)

然后批量导入应用权限：

![AKKebzZGZoGoQ8xrVsaciU0unFh.png](images/AKKebzZGZoGoQ8xrVsaciU0unFh-AKKebzZG.png)
