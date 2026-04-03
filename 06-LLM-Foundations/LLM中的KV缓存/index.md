---
title: "KV Caching in LLMs, Clearly ExplainedLLM 中的 KV 缓存，详尽解释"
source: "https://x.com/_avichawla/status/2034902650534187503"
author:
  - "[[Unknown]]"
published: 2026-03-11
created: 2026-03-21
description:
tags:
  - "clippings"
---
You must have seen it every time you use ChatGPT or Claude that the first token takes noticeably longer to appear. Then the rest stream out almost instantly.你每次使用 ChatGPT 或 Claude 时肯定都注意到了，第一个令牌出现的时间明显更长，而其余令牌几乎瞬间就全部显示出来。

Behind the scenes, it's a deliberate engineering decision called KV caching, and the purpose is to make LLM inference faster.在幕后，这是一个称为 KV 缓存的有意工程决策，其目的是加快 LLM 推理速度。

Before we get into the technical details, here's a side-by-side comparison of LLM inference with and without KV caching:在深入技术细节之前，这里我们来对比一下启用和禁用 KV 缓存的 LLM 推理：

<video preload="none" tabindex="-1" playsinline="" aria-label="嵌入式视频" poster="https://pbs.twimg.com/amplify_video_thumb/2034896425310724097/img/y4A-fhJoCZIj_63a.jpg" style="width: 100%; height: 100%; position: absolute; background-color: black; top: 0%; left: 0%; transform: rotate(0deg) scale(1.005);"><source type="video/mp4" src="blob:https://x.com/014bd895-e8e9-488a-9f67-3706693bec9d"></video>

0:31

Now let's understand how it works, from first principles.现在让我们从基本原理开始了解它是如何运作的。

## Part 1: How LLMs generate tokens第一部分：LLM 如何生成代币

The transformer processes all input tokens and produces a hidden state for each one. Those hidden states get projected into vocabulary space, producing logits (one score per word in the vocabulary).转换器处理所有输入词元，并为每个词元生成一个隐藏状态。这些隐藏状态被投影到词汇空间，生成 logits（词汇表中的每个词对应一个分数）。

<video preload="auto" tabindex="-1" playsinline="" aria-label="嵌入式视频" poster="https://pbs.twimg.com/tweet_video_thumb/HD1nzZmboAE8879.jpg" src="https://video.twimg.com/tweet_video/HD1nzZmboAE8879.mp4" type="video/mp4" style="width: 100%; height: 100%; position: absolute; background-color: black; top: 0%; left: 0%; transform: rotate(0deg) scale(1.005);"></video>

GIF

But only the logits from the last token matter. You sample from them, get the next token, append it to the input, and repeat.但只有最后一个标记的 logits 才重要。你从中采样，获取下一个标记，将其添加到输入中，然后重复此过程。

<video preload="auto" tabindex="-1" playsinline="" aria-label="嵌入式视频" poster="https://pbs.twimg.com/tweet_video_thumb/HD1n36gbAAASEmH.jpg" src="https://video.twimg.com/tweet_video/HD1n36gbAAASEmH.mp4" type="video/mp4" style="width: 100%; height: 100%; position: absolute; background-color: black; top: 0%; left: 0%; transform: rotate(0deg) scale(1.005);"></video>

GIF

This is the key insight: to generate the next token, you only need the hidden state of the most recent token. Every other hidden state is an intermediate byproduct.关键在于：要生成下一个代币，你只需要最新代币的隐藏状态。其他所有隐藏状态都是中间副产品。

## Part 2: What Attention actually computes第二部分：注意力机制究竟计算了什么

Inside each transformer layer, every token gets three vectors: a query (Q), a key (K), and a value (V). Attention multiplies queries against keys for scores, then uses those scores to weight the values.在每个 Transformer 层中，每个词元都会获得三个向量：查询向量（Q）、键向量（K）和值向量（V）。注意力机制将查询向量与键向量相乘得到分数，然后使用这些分数来加权值向量。

<video preload="auto" tabindex="-1" playsinline="" aria-label="嵌入式视频" poster="https://pbs.twimg.com/tweet_video_thumb/HD1n9AMboAEkHaT.jpg" src="https://video.twimg.com/tweet_video/HD1n9AMboAEkHaT.mp4" type="video/mp4" style="width: 100%; height: 100%; position: absolute; background-color: black; top: 0%; left: 0%; transform: rotate(0deg) scale(1.005);"></video>

GIF

Now focus on just the last token.现在只需关注最后一个标记。

<video preload="auto" tabindex="-1" playsinline="" aria-label="嵌入式视频" poster="https://pbs.twimg.com/tweet_video_thumb/HD1oErLa0AAp8FL.jpg" src="https://video.twimg.com/tweet_video/HD1oErLa0AAp8FL.mp4" type="video/mp4" style="width: 100%; height: 100%; position: absolute; background-color: black; top: 0%; left: 0%; transform: rotate(0deg) scale(1.005);"></video>

GIF

The last row of QK^T uses:QK^T 的最后一行使用了：

- The query vector of the last token最后一个词元的查询向量
- All key vectors in the sequence序列中的所有关键向量

The final attention output for that row uses:该行的最终注意力输出使用：

- The same query vector相同的查询向量
- All key and value vectors所有键值向量

So to compute the only hidden state we need, every attention layer requires Q from the latest token, and K and V from everything.因此，为了计算我们唯一需要的隐藏状态，每个注意力层都需要从最新的标记中获取 Q，以及从所有标记中获取 K 和 V。

## Part 3: The redundancy involved第三部分：涉及的冗余

Generating token 50 requires K and V vectors for tokens 1 through 50. Generating token 51 requires K and V vectors for tokens 1 through 51.生成第 50 个标记需要第 1 到 50 个标记的 K 和 V 向量。生成第 51 个标记需要第 1 到 51 个标记的 K 和 V 向量。

The K and V vectors for tokens 1 through 49 were already computed. They haven't changed. Same inputs, same outputs. Yet the model recomputes them from scratch every step.前 49 个标记的 K 向量和 V 向量已经计算完毕，它们没有改变。输入相同，输出也相同。然而，模型每一步都从头开始重新计算它们。

![图像](https://pbs.twimg.com/media/HD1oJrAboAUOeNI?format=png&name=large)

That's O(n) redundant work per step. Over an entire generation, O(n²) wasted compute.每一步都存在 O(n) 的冗余工作。整整一代下来，浪费了 O(n²) 的计算资源。

## Part 4: The fix第四部分：修复方案

Instead of recomputing all K and V vectors at every step, store them. For each new token:与其在每一步都重新计算所有 K 和 V 向量，不如将它们存储起来。对于每个新标记：

1. Compute Q, K, and V for only the newest token.仅针对最新代币计算 Q、K 和 V。
2. Append the new K and V to the cache.将新的 K 和 V 添加到缓存中。
3. Retrieve all previous K and V vectors from the cache.从缓存中检索所有先前的 K 和 V 向量。
4. Run attention using the new Q against the full cached K and V.使用新的 Q 对完整的缓存 K 和 V 运行注意力。

<video preload="auto" tabindex="-1" playsinline="" aria-label="嵌入式视频" poster="https://pbs.twimg.com/tweet_video_thumb/HD1oNGXaUAAtPkt.jpg" src="https://video.twimg.com/tweet_video/HD1oNGXaUAAtPkt.mp4" type="video/mp4" style="width: 100%; height: 100%; position: absolute; background-color: black; top: 0%; left: 0%; transform: rotate(0deg) scale(1.005);"></video>

GIF

That's KV caching. One new K and one new V per layer per step. Everything else comes from memory.这就是键值缓存。每层每步生成一个新的键值和一个新的值。其他所有数据都来自内存。

The attention computation still scales with sequence length (you're attending over all keys and values). But the expensive projections to produce K and V happen only once per token, not once per step.注意力计算的开销仍然会随着序列长度而增加（因为你需要关注所有键和值）。但是，生成键和值的昂贵投影操作每个词元只执行一次，而不是每个步骤执行一次。

## Part 5: Time-to-First-Token第五部分：首次令牌到达时间

Now you can see why the first token is slow.现在你应该明白为什么第一个令牌速度慢了吧。

When you send a prompt, the model processes the entire input in one forward pass, computing and caching K and V vectors for every token. This is the prefill phase, and it's the most compute-intensive part of the request.当你发送请求时，模型会在一次前向传递中处理所有输入，计算并缓存每个词元的 K 向量和 V 向量。这是预填充阶段，也是请求过程中计算量最大的部分。

Once the cache is warm, each subsequent token needs only a single forward pass with one token.缓存预热完成后，后续每个令牌只需要使用一个令牌进行一次前向传递。

![图像](https://pbs.twimg.com/media/HD1qUHAboAIrstz?format=jpg&name=large)

That initial delay is called time-to-first-token (TTFT). Longer prompts mean longer prefills, which mean longer waits. Optimizing TTFT (chunked prefill, speculative decoding, prompt caching) is its own deep topic, but the dynamic is always the same: building the cache is expensive, reading from it is cheap.这种初始延迟称为首令牌获取时间 (TTFT)。提示符越长，预填充时间越长，等待时间也就越长。优化 TTFT（分块预填充、推测性解码、提示符缓存）本身就是一个很深入的研究课题，但其动态始终不变：构建缓存成本高昂，而从缓存中读取数据成本低廉。

## Part 6: The Tradeoff第六部分：权衡取舍

KV caching trades compute for memory. Every layer stores K and V vectors for every token. For Qwen 2.5 72B (80 layers, 32K context, hidden dim 8192), the KV cache for a single request can consume several gigabytes of GPU memory. At hundreds of concurrent requests, it often exceeds the model weights themselves.键值缓存以计算资源换取内存。每一层都会存储每个词元的键向量和向量。对于 Qwen 2.5 72B 模型（80 层，32K 上下文，隐藏维度 8192），单次请求的键值缓存可能消耗数 GB 的 GPU 内存。在数百个并发请求的情况下，其占用的内存通常会超过模型权重本身。

This is why grouped-query attention (GQA) and multi-query attention (MQA) exist: share key/value heads across query heads, cut memory, and minimal quality loss.这就是分组查询注意力（GQA）和多查询注意力（MQA）存在的原因：在查询头之间共享键/值头，减少内存，并将质量损失降到最低。

It's also why doubling context length is hard. Double the window, double the KV cache per request, fewer concurrent users.这也是为什么将上下文长度翻倍很困难的原因。窗口长度翻倍，每次请求的键值缓存也翻倍，并发用户数就会减少。

There is another idea called Paged attention, which solves this, and I talked about it here recently:还有一种叫做分页注意力机制（Paged attention）的思想可以解决这个问题，我最近在这里讨论过它：

> 3月11日

## tl;dr

KV caching eliminates redundant computation during autoregressive generation. Previous tokens always produce the same K and V vectors, so you compute them once and store them. Each new token only needs its own Q, K, and V. Then, attention runs against the full cache.键值缓存消除了自回归生成过程中的冗余计算。之前的标记总是生成相同的键向量和向量，因此只需计算一次并存储即可。每个新标记只需要自己的键值、键向量和向量。然后，注意力机制会针对整个缓存运行。

5x speedup in practice. The cost is GPU memory, which becomes the binding constraint at scale. Every LLM serving stack (vLLM, TGI, TensorRT-LLM) builds on this idea.实际应用中速度提升了 5 倍。代价是 GPU 内存占用，这在规模化应用中会成为瓶颈。所有 LLM 服务栈（vLLM、TGI、TensorRT-LLM）都基于这一理念。

<video preload="auto" tabindex="-1" playsinline="" aria-label="嵌入式视频" poster="https://pbs.twimg.com/tweet_video_thumb/HD1oaiiboAAJwwE.jpg" src="https://video.twimg.com/tweet_video/HD1oaiiboAAJwwE.mp4" type="video/mp4" style="width: 100%; height: 100%; position: absolute; background-color: black; top: 0%; left: 0%; transform: rotate(0deg) scale(1.005);"></video>

GIF

That's a wrap!拍摄结束！

If you enjoyed this tutorial:如果您喜欢这篇教程：

Find me → [@\_avichawla](https://x.com/@_avichawla)找到我 → [@\_avichawla](https://x.com/@_avichawla)

Every day, I share tutorials and insights on DS, ML, LLMs, and RAGs.我每天都会分享关于数据科学、机器学习、LLM 和 RAG 的教程和见解。