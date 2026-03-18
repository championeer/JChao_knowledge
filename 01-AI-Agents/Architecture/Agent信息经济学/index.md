---
title: "Agent 的信息经济学：少即是多的理论基础"
source: "https://x.com/xxx111god/status/2030069748894158880"
author:
  - "[[Unknown]]"
published: 2026-03-07
created: 2026-03-07
description:
tags:
  - "clippings"
---
你的 CLAUDE.md 有 26000 行。装了 12 个插件。memory、skills、sub-agents 全上了。

但跑出来的东西还不如隔壁只用裸 CLI 的人。

不是段子。[@systematicls](https://x.com/@systematicls) 那篇 7000+ 赞的长帖开头就挑明了：

"Your enthusiasm is likely doing more harm than good."（你的热情可能弊大于利。）

我自己折腾 OpenClaw 这段时间也有同感。agent 表现最好的时候，往往是给它最少、最精准 context 的时候。给多了反而更蠢。

为什么？

最近看到 CMU 和 NYU 的一篇论文，聊的是训练数据选择，跟 agent 工程没直接关系。但里面定义的一个概念，可能帮我们理解这背后的道理。

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

## 经典信息论的一个盲区

Shannon 熵、Kolmogorov 复杂度这些经典工具，都假设观察者有无限算力。在这个框架里：

- 确定性变换不能增加信息
- 信息量跟数据顺序没关系
- 似然建模就是在匹配分布

数学上没毛病。但拿来理解真实的 AI 系统就有点拧巴：

- AlphaZero 只从游戏规则出发（零人类数据），学出了超人策略。确定性过程"创造"了有用信息？
- LLM 在正序英文上学得比反序好得多。顺序明明影响了学习效果。
- 模型从康威生命游戏的几行规则里学出了"滑翔机"，比生成数据的程序还复杂。

论文管这些叫"表面悖论"（seeming paradoxes）。不是经典理论有错，是它不是为这个问题设计的。Shannon 从来不声称要度量"对有限算力的观察者来说什么信息有用"。

其实这方向也不新。Kolmogorov 复杂度的 resource-bounded 变体、Koppel 的 sophistication、logical depth，前人都探索过"给算力加约束之后信息怎么看"。这篇论文的贡献是：给了一个面向 ML 训练的形式化定义，加上可操作的估算方法。

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

## Epiplexity：你能学到多少有用结构

论文造了个新词：Epiplexity（epi- 认识论的 + plexity 复杂度）。

简单说就是：算力有限的观察者，能从数据中提取多少结构性信息。

跟它对应的是 time-bounded entropy，就是对你来说学不到任何模式的纯噪音。比如伪随机数生成器的输出：程序很短（Kolmogorov 复杂度低），有 seed（Shannon 熵也不高），但如果你没有那个 seed，你就是一个 polynomial-time 的观察者，这串数对你来说跟真随机没区别。纯噪音，学不到东西。

怎么直觉理解 epiplexity？论文给了个 heuristic：大概等于 loss 曲线下方、最终 loss 之上的面积。 面积大 = 模型在训练中学到了很多结构 = 内部攒了很多可复用的 circuit。

![图像](https://pbs.twimg.com/media/HCxBbYGaUAES7mG?format=jpg&name=large)

注意这只是一种近似估算（prequential coding），不是 epiplexity 本身的定义。更严格的方式用 teacher-student KL 散度来量化。

论文在 Chess 实验里发现 epiplexity 跟 OOD 泛化正相关。但只是一个 domain 的相关性，论文自己也说了：epiplexity 度量信息量，不保证对某个具体下游任务有用。

还有一点：epiplexity 不是数据集的固有属性，它取决于观察者。同一份数据，不同架构不同算力的模型看到的"可学结构"不一样。所以论文里聊"文本比图像 epiplexity 更高"之类的，是在特定模型+tokenization+算力条件下的推断，不是跨架构的普适结论。

（论文目前是 arXiv preprint，还没过 peer review。框架很有意思，但经验验证还在早期。）

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

## 跳一步：把 Agent 也看成"算力有限的观察者"

接下来我要做一个类比。是类比，不是严格推导，但我觉得有启发性。

你的 agent 不是全知全能的。它有 context window 上限，有 attention 机制的偏好（开头和结尾的信息利用效率高于中间），有 compaction 导致的信息丢失。从功能上看，它确实是一个"在有限资源下从输入中提取结构"的系统。

但得说清楚：论文的"计算受限"指的是 polynomial-time Turing machine 级别的约束，agent 的限制来自 attention 架构。这两种"有限性"在技术上不是一回事。论文没有、也没打算分析 prompt engineering。

尽管如此，底层逻辑是相通的：处理能力有限时，输入里"可提取的结构性信息密度"比"信息总量"重要。

用这个视角重新看 [@systematicls](https://x.com/@systematicls) 的六步方法论，每一步都在做同一件事：

极简启动，少塞无关依赖 = context 里噪音少 = 有用信息占比高

研究与实现分离，调研产出的一堆备选方案不进实现 session = 不让低相关度信息稀释有用的东西

CLAUDE.md 当路由目录，条件加载规则，不全量注入 = 只在需要的时候给相关信息

流程固化为 Skill，把成功经验变成高密度配方。有意思的是，这对应了论文的"表面悖论 1"：确定性变换（把经验写成文本）为下一个算力有限的观察者（实现 session）"创造"了可提取的结构

任务契约，明确结束条件 = 减少 agent 在不确定中的发散

一契约一会话，不让跨任务的 context 互相污染

本质都是同一件事：控制什么信息在什么时候进入 context，让"有用结构"最大化、"占位噪音"最小化。

这是来自实战的 N=1 经验，但不等于实验验证。不过当多个独立从业者都得出类似结论时，背后可能有底层机制。Epiplexity 框架提供了一个理论方向来理解这个机制。

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

## 几个有意思的交叉点

Skill 系统 × "确定性变换创造信息"

经典信息论说确定性变换不增加信息。但对算力有限的观察者，确定性变换可以增加 epiplexity。

Skill 就是一种确定性变换。你把成功经验编码成 skill.md，agent 读了之后面对同样的问题能提取更多结构。Skill 没增加问题本身的信息量，但增加了 agent 能从中学到的有用东西。

所以"让 agent 先调研，再把方案固化为 skill"这个 pattern 有效。你用计算（research session）为后续的算力有限观察者（implementation session）创造了结构性信息。

Context 排列 × 顺序影响学习

Shannon 熵跟顺序无关。但 epiplexity 跟顺序有关，特定排列能让模型学到更多结构。

Agent context 也有类似现象。"Lost in the middle"效应（Liu et al., 2024）说的就是 LLM 对 context 开头和结尾的利用效率高于中间。把关键指令埋在中间 vs 放在开头，效果差很多。论文给了这个现象一个理论方向的解释。

多 Agent 对抗审查

[@systematicls](https://x.com/@systematicls) 提了个具体玩法：用 sycophancy 反向做对冲。Bug Finder 被激励找问题（高召回），Adversary 被激励反驳（高精度），Referee 综合判断。

思路不错，但 [@0xbrianxyz](https://x.com/@0xbrianxyz) 给了个很好的 caveat：如果所有 agent 用同一个 base model，它们共享偏见，加人头不能消除共同盲区。这就是"伪一致性"问题。

在 epiplexity 框架下也能理解：相同的计算限制（同一个 base model 的 training bias）= 相同的信息提取盲点。解法方向是用不同 base model 做不同角色，等于用不同的"计算限制"来扩大覆盖面。

不过说实话，多 agent debate 这个方向还很早期。Du et al. (2023) 的论文有一些正面结果，但远不是定论。

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

## 实战：拿自己的 Agent 开刀

写到这儿我突然想，我自己的 Agent bootstrap 有没有这个问题？

一查，还真有，而且不轻。

我的 OpenClaw 配置里有 6 个 bootstrap 文件，每条消息都注入，一共 ~10,773 tokens。用 epiplexity 框架逐个审计：

HEARTBEAT.md（2,584 tokens），378 行的定时检查清单，包括异常检测命令、内存监控脚本、安全审计流程、房租账单提醒... 只在定时检查时需要，但你问我天气，context 里也有 townhouse 账单检查流程。典型的 time-bounded entropy：对 heartbeat session 有极高 epiplexity，对其他 95% 对话等于纯噪音。

AGENTS.md 和 MEMORY.md 重复。"exec 输出用户看不到"这条规则在两个文件里各写一遍。Process Enforcement 写了两次。核心文件修改三问写了两次。同一条规则出现两次，模型不会"更遵守"它，只是浪费了 ~730 tokens 的 slot。

排列问题。定义 Agent 身份和风格的 SOUL.md 放在注入顺序倒数第二。影响所有输出的基调设定，放在 lost-in-the-middle 效应最严重的位置。而 AGENTS.md 开头 30 行是"修改本文件的门禁"，meta-info 占据了 primacy effect 最强的位置，99% 对话不需要。

TOOLS.md 开头，380 tokens 是 OpenClaw 默认模板（"What Goes Here"、示例摄像头配置），从未被替换。占据文件最高注意力位置，0% 对话需要。

改法很直接，就是文章前面说的那些原则：

1. **条件加载**，HEARTBEAT.md 移出 always-on，只在定时检查触发时读取
2. **去重**，每条规则只在一个 canonical 位置保留
3. **路由化**，AGENTS.md 从百科全书变成路由表（"写代码 → read code-checklist.md"）
4. **排列优化**，SOUL → USER → AGENTS → MEMORY → TOOLS（身份先行 = primacy）**排列优化** ，SOUL → USER → AGENTS → MEMORY → TOOLS（身份先行= primacy）

结果：10,773 → 2,652 tokens always-on，-75%。信息零丢失，全部移到按需加载的 refs/ 目录。

![图像](https://pbs.twimg.com/media/HCxBiBQXMAAXDQ_?format=jpg&name=large)

本质就是论文说的"确定性变换增加 epiplexity"。不改内容，只改组织方式，同样的信息对有限观察者变得更有用。

这大概是 practice what you preach 的最佳反面教材 😂━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

## 几个必须说的 Caveat

类比不是等式。 Epiplexity 论文讲的是训练数据选择。映射到 agent context 管理是我的解读，论文作者没这么说过。

Shannon 没有"失败"。 它度量的是通信效率，不是"对有限观察者的语义有用性"。说 Shannon 无能为力有点 strawman。准确说：它不是为这个问题设计的。

测量不简单。 论文的估算方法需要从头训练模型。对 prompt context 没有直接的量化方法。能做的是用框架指导直觉。

前人工作很多。 V-information（Xu et al., 2020）跟 epiplexity 的 bounded-observer 动机很接近。Logical depth、sophistication、resource-bounded Kolmogorov complexity 都是这个方向的先驱。Epiplexity 的新意在于给了 ML 实践者可操作的估算工具。

N=1 经验不是通用原则。 [@systematicls](https://x.com/@systematicls) 的方法论在他的工作流下管用，但比如需要长期项目理解的复杂调试，频繁切 session 可能反而丢关键 context。

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

## 一个值得验证的假设

三篇材料可以看作同一个底层问题的不同切面：

- **实战**（[@systematicls](https://x.com/@systematicls)），Agent 怎么用：context 质量 > 数量
- **工程**（[@0xbrianxyz](https://x.com/@0xbrianxyz)），Agent 怎么设计：输入边界 + 约束 + 验收
- **理论**（Epiplexity），为什么可能是这样：算力有限的观察者从结构中学习

假设：对算力有限的信息处理系统，不管是训练中的模型还是接收 prompt 的 agent，输入里的结构性信息密度比总量更重要。

这个假设需要验证：

- 不同 context 组合对 agent 完成任务的效果影响能量化吗？
- "context epiplexity" 和 agent 完成率有相关性吗？
- 信息呈现顺序对 in-context learning 的效果能建模吗？

验证了这些，才能把"从业者直觉 + 理论框架"升级为"可操作的工程原则"。

在那之前，至少这个框架给了一个比"context is everything"更精确的思考工具：不是所有 context 都一样有用。对你的 agent 来说，什么是结构性信息，什么是占位噪音？

想清楚这个问题，可能比追任何新插件都值钱。

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

参考：

- [@systematicls](https://x.com/@systematicls): "How To Be A World-Class Agentic Engineer" (2026-03-03)[@systematicls](https://x.com/@systematicls) 《如何成为世界一流的智能工程师》（2026 年 3 月 3 日）
- [@0xbrianxyz](https://x.com/@0xbrianxyz): 深度解读 (2026-03-04)
- Finzi, Qiu, Jiang, Izmailov, Kolter, Wilson: "From Entropy to Epiplexity" arXiv:2601.03220 (2026-01-06)Finzi、Qiu、Jiang、Izmailov、Kolter、Wilson：“从熵到 Epiplexity” arXiv:2601.03220 (2026-01-06)
- Xu et al.: "A Theory of Usable Information Under Computational Constraints" arXiv:2002.10689 (2020)Xu 等人：“计算约束下的可用信息理论” arXiv:2002.10689 (2020)
- Du et al.: "Improving Factuality and Reasoning through Multiagent Debate" (2023)Du 等人：“通过多智能体辩论提高事实性和推理能力”（2023）
- Liu et al.: "Lost in the Middle: How Language Models Use Long Contexts" (2024)Liu 等人：《迷失在中间：语言模型如何使用长上下文》（2024 年）

⚠️ 把 epiplexity 框架映射到 agent context 管理是我的类比性解读，不代表原论文观点。