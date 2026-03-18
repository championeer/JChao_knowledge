---
title: "Karpathy’s autoresearch QuickstartKarpathy 的自动研究快速入门"
source: "https://x.com/ellen_in_sf/status/2032526928352260441"
author:
  - "[[Unknown]]"
published: 2026-03-12
created: 2026-03-14
description: "#TruthSeeker #INTJ #AIxEverything事上磨练，道在行中"
tags:
  - "clippings"
---
Earlier this week Andrej [@karpathy](https://x.com/@karpathy) released **autoresearch**. So I tried something: **running AI research with a single command :** 本周早些时候，安德烈 [@karpathy](https://x.com/@karpathy) 发布**自动研究** 。 所以我尝试了一种方法： **用一条命令运行人工智能研究：**

```bash
make gen CONTEXT="explore attention-free LLM"
DATA=TinyStories 
GOALS="lowest val_bpb"
```

I will share how you can run [autoresearch](https://github.com/karpathy/autoresearch) in one command and track the experiment in a dashboard.我将分享如何运行[自动研究](https://github.com/karpathy/autoresearch) 只需一条命令即可在仪表盘上跟踪实验结果。

![图像](https://pbs.twimg.com/media/HDTsxoNaMAILws0?format=jpg&name=large)

autoresearch dashboard

**autoresearch** went viral on X, it's still trending in my page after 3 days.**自动研究**在 X 上爆红，三天过去了，它仍然在我页面上很火。

![图像](https://pbs.twimg.com/media/HDQT7lbbQAUEuk3?format=png&name=large)

X trending topics

## Why This Is Interesting为什么这很有趣

At a high level:从宏观层面来看：

1. You define a program.md describing how to train a model.您定义了一个 program.md 文件，用于描述如何训练模型。
2. The agent writes training code, runs experiments, evaluates results, and iterates.该智能体编写训练代码，运行实验，评估结果，并进行迭代。

Instead of manually running experiments, **the research loop becomes automated.****研究流程**不再需要手动运行实验， 而是实现自动化。

Below is a snippet of my agent running the experiment loop for about two hours.下面这段代码片段展示了我的代理运行实验循环约两小时的过程。

![图像](https://pbs.twimg.com/media/HDQYm5QbwAASB5p?format=jpg&name=large)

Agent iterating on experiments in Claude Code

Quoting Andrej Karpathy:引用安德烈·卡帕蒂的话：

> Frontier AI research used to be done by “meat computers”, humans coordinating through meetings. That era is fading. Research is moving toward autonomous swarms of AI agents running across compute clusters.过去，前沿人工智能研究是由“人肉计算机”完成的，也就是由人类通过会议进行协调。 那个时代正在远去。 研究正朝着在计算集群上运行的自主人工智能代理群体发展。

The implications are big.影响巨大。

**Last night I started an experiment and then went painting with friends for two hours. While I was away, the agent kept running experiments.昨晚我开始了一个实验，然后和朋友们一起画了两个小时的画。我不在的这段时间，经纪人一直在进行实验。**

It made me realize how much waiting time in ML research could disappear.这让我意识到机器学习研究中可以消除多少等待时间。

**Agents don’t replace researchers, but they can remove a lot of the waiting.代理人并不能取代研究人员，但他们可以减少很多等待时间。**

## The Problem问题

When looking at the [autoresearch](https://github.com/karpathy/autoresearch) repo, the idea is straightforward, but the setup still requires:当审视[自动研究](https://github.com/karpathy/autoresearch)仓库的概念很简单，但设置仍然需要：

- writing program.md编写程序.md
- structuring experiments结构化实验
- preparing training code准备培训代码
- tracking results跟踪结果

**So I had a simple thought: why not use an LLM to scaffold these docs?** You can clone the repo and try it yourself : [Github - autoresearch-gen](https://github.com/liviaellen/autoresearch-gen)**于是我突然想到：为什么不使用 LLM 来搭建这些文档呢？** 您可以克隆该仓库并自行尝试： [Github - 自动研究生成器](https://github.com/liviaellen/autoresearch-gen)

In summary, **autoresearch-gen**:总之， **自动研究生成** ：

- generates autoresearch boilerplate生成自动研究样板
- runs analysis on your experiments对你的实验进行分析
- generates Excalidraw diagrams showing how the system works生成 Excalidraw 图表，展示系统工作原理
- tracks experiment and code changes through agent commits通过代理提交跟踪实验和代码更改

![图像](https://pbs.twimg.com/media/HDQZNA_agAAjF2O?format=jpg&name=large)

autoresearch-gen diagram

To start, **you only need to tell the LLM what you want to do**, what data you want to use, and the goal of the experiment. 首先， **你只需要告诉 LLM 你想做什么** ，你想使用什么数据，以及实验的目标。

## Running Autoresearch in One Command一条命令即可运行自动研究

```bash
make gen EXP=experiments/attention-free \
CONTEXT="Exploring attention-free LLM architectures \
on M5 Max 48GB (RWKV / SSM / linear attention)" \ 
DATA="roneneldan/TinyStories" \
GOALS="Lowest val_bpb without softmax attention"
```

The LLM you choose will generate the structured autoresearch code.您选择的 LLM 将生成结构化的自动研究代码。

Most research visualizations require matplotlib in Jupyter notebooks. For newcomers this means switching tools and writing analysis code.大多数研究可视化都需要在 Jupyter Notebook 中使用 matplotlib 库。对于新手来说，这意味着需要切换工具并编写分析代码。

So I built a simple **Streamlit dashboard with Plotly** that generates experiment stats and provides basic experiment tracking by calling this command. 因此，我**使用 Plotly 构建了一个简单的 Streamlit 仪表板，** 通过调用此命令生成实验统计数据并提供基本的实验跟踪。

```bash
make dashboard
```

**Dashboard仪表板**

You can run the simple dashboard using the sample data included for testing in the github repository.您可以使用 GitHub 存储库中包含的用于测试的示例数据来运行简单的仪表板。

![图像](https://pbs.twimg.com/media/HDT4kzBaMAMu8wP?format=jpg&name=large)

autoresearch-gen dashboard

For one quick test I ran during lunch:我午休时做了一个简单的测试：

- 30 experiments30项实验
- 41% keep rate41%的保留率
- ~26% improvement on the TinyStories dataset 在 TinyStories 数据集上改进了约 26%

The goal was exploring attention-free LLM architectures and reducing val\_bpb.目标是探索无注意力机制的 LLM 架构并减少 val\_bpb。

Results will vary depending on the input and configuration, so feel free to experiment with different ideas.结果会因输入和配置的不同而有所差异，所以请随意尝试不同的想法。

![图像](https://pbs.twimg.com/media/HDTr9bDb0AA5AsK?format=jpg&name=large)

Example experiment result

The dashboard also allows you to analyze more analytics, understands how effective the experiments are, and generate an excalidraw architecture diagram to showcase the process using make diagram command, or by clicking regenerate diagram on the streamlit dashboard.仪表板还允许您分析更多分析数据，了解实验的有效性，并使用 “生成图表” 命令或单击 Streamlit 仪表板上的“重新生成图表”来生成 Excalidraw 架构图以展示该过程。

![图像](https://pbs.twimg.com/media/HDTw2HiaMAEwLlD?format=jpg&name=large)

Architecture Diagram and Experiment Result

The goal of this project is simple: **make AI research easier to start for people who are just getting into it.**这个项目的目标很简单： **让那些刚接触人工智能研究的人更容易入门。**

## Challenges挑战

While working on this project, I noticed another issue: after multiple iterations, the model can start forgetting parts of the context.在进行这个项目的过程中，我注意到另一个问题：经过多次迭代后，模型可能会开始忘记部分上下文信息。

Important variables or experiment details can get lost over time, which means we need a more robust way to store state and properly **harness the experiment loop**.随着时间的推移，重要的变量或实验细节可能会丢失，这意味着我们需要一种更强大的方法来存储状态并正确地**利用实验循环** 。

This also connects to something Andrej Karpathy mentioned recently, his autoresearch labs were wiped out during an OAuth outage. Situations like this show that long-running research agents need better **state management, recovery, and failover**.这也与 Andrej Karpathy 最近提到的一件事有关，他的自动研究实验室在 OAuth 服务中断期间被彻底摧毁了。 这种情况表明，长期运行的研究代理需要更好的**状态管理、恢复和故障转移** 。

> 3月12日
> 
> My autoresearch labs got wiped out in the oauth outage. Have to think through failovers. Intelligence brownouts will be interesting - the planet losing IQ points when frontier AI stutters.我的自动研究实验室在 OAuth 故障中全部瘫痪了。得好好想想备用方案。人工智能宕机想想就很有意思——当前沿人工智能出现故障时，整个星球的智商都会下降。

In other words, to fully harness autoresearch systems, we likely need a more **stateful and resilient setup**.换句话说，要充分利用自动研究系统，我们可能需要一个更有**状态、更具弹性的设置** 。

I’ll explore this more in a future article, my claude code has been running experiments for 18 hours. **Repository** [github.com/liviaellen/autoresearch-gen](https://github.com/liviaellen/autoresearch-gen) Code is open source :) feel free to fork and have fun 我将在以后的文章中对此进行更深入的探讨，我的 Claude 代码已经运行实验 18 小时了。 **存储库** [github.com/liviaellen/autoresearch-gen](https://github.com/liviaellen/autoresearch-gen) 代码是开源的 :) 欢迎随意 fork 并尽情使用

## About Author作者简介

**Hi I am Ellen** I’m a Growth Engineer at [@mem0ai](https://x.com/@mem0ai) , building the memory layer for AI agents ([mem0.ai](https://mem0.ai/))**大家好，我是 Ellen** ，我是一名增长工程师。 [@mem0ai](https://x.com/@mem0ai) 为人工智能代理构建记忆层（ [mem0.ai](https://mem0.ai/) ）

I like building products and sharing insights along the way.我喜欢打造产品，并在过程中分享见解。

Before this, I spent 6 years as an ML Engineer across the Middle East and Asia, and ran AR studio **filterqu**, building branded games and apps (5B impressions, 10M users).在此之前，我曾在中东和亚洲担任机器学习工程师 6 年，并运营 AR Studio **Filterqu** ，开发品牌游戏和应用程序（50 亿次展示，1000 万用户）。

I also write for[@TDataScience](https://x.com/@TDataScience)我也为……撰稿 [@TDataScience](https://x.com/@TDataScience)

In my free time I make art :)我空闲时间会创作艺术作品 :)

**If you want to connect or host an event, my DM is open.** **如果你想联系我或举办活动，欢迎私信我。**