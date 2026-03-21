---
title: "Recursive Language Models - what finally gave me the 'aha' moment递归语言模型——最终让我恍然大悟的契机"
source: "https://x.com/neural_avb/status/2035040781074145412"
author:
  - "[[Unknown]]"
published: 2026-02-13
created: 2026-03-21
description:
tags:
  - "clippings"
---
I have spent a decent chunk of last month implementing RLMs from scratch, and producing a 50 minute tutorial video on it. Throughout the process, I responded to 100+ questions on Youtube and X about RLMs. This article is a summary of what I learned answering those questions, and the specific nuances about RLMs that made me go **"aha"** when I was working on this project.上个月我花了不少时间从零开始实现 RLM，并制作了一个 50 分钟的教程视频。在此过程中，我在 YouTube 和其他平台上回答了 100 多个关于 RLM 的问题。本文总结了我在回答这些问题时学到的知识，以及在项目开发过程中让我**恍然大悟**的 RLM 具体细节。

At the end of the article, I will also add a little FAQ on the common questions I got, and try my best to answer them clearly.文章末尾，我还会添加一些常见问题的解答，并尽力给出清晰的答案。

> 2月13日
> 
> My RLM finally went recursive! Looking at these logs is way too addictive please send help. Notes: > Sent it 10 long wikipedia articles about deep learning (~2M context). > Asked it to find BLEU scores from Attention paper & explain MHA from these articles > RLM我的 RLM 终于开始递归运行了！看这些日志太上瘾了，求救！ 笔记： > 我发送了 10 篇关于深度学习的维基百科长篇文章（约 200 万字）。 > 要求它从注意力论文中查找 BLEU 分数，并解释这些文章中的 MHA > RLM

## 1\. Of all the complicated experiments I ran1. 在我进行的所有复杂实验中

... the most enlightening was this stupid experiment where I asked an RLM to: ……最令人受益匪浅的是我做的这个愚蠢的实验，我让一个 RLM 执行以下操作：

> **"Generate 50 names of fruits and count the number of R in each, return as a dictionary"生成 50 个水果名称，并统计每个名称中字母 R 的个数，以字典形式返回。**

And a more advanced variation of the problem (let's called it Problem 2):还有一个更高级的问题变体（我们称之为问题 2）：

> **"Generate a dictionary of different categories: fruits, countries, animals. For each category, generate 50 names of that and count the number of R in each, return as a nested dictionary"生成一个包含不同类别的词典：水果、国家、动物。 对于每个类别，生成 50 个名称，并统计每个名称中 R 的数量，以嵌套字典的形式返回。**

For problem 1, the expected output is something like:对于问题 1，预期输出类似于：

{"strawberry": 3, "berry": 2, ... "grape": 1} {"草莓": 3, "浆果": 2, ... "葡萄": 1}

And for problem 2 it is something like:至于问题 2，它大致是这样的：

{ "fruits": {"strawberry": 3, "berry": 2, ... "grape": 1}, "countries": {"united states of america": 1, "russia": 1, ... "france": 1} "animals": {"kangaroo": 1, "tiger": 1", ... "deer": 1}, }{ "水果": {"草莓": 3, "浆果": 2, ... "葡萄": 1}, "国家": {"美国": 1, "俄罗斯": 1, ... "法国": 1} "动物": {"袋鼠": 1, "老虎": 1, ... "鹿": 1}, }

It's a silly problem, but the way an RLM can solve this problem, vs other architectures like ReAct or CodeAct, etc is fundamentally different. 这是一个很愚蠢的问题，但 RLM 解决这个问题的方式与其他架构（如 ReAct 或 CodeAct 等）有着根本的不同。

# 2\. Agentic Landscape2. 能动性格局

## 2.1 Direct Generation2.1 直接发电

The first method is just direct generation. The LLM "thinks" about the user's request and auto-regressively generates a dictionary.第一种方法就是直接生成。LLM 会“思考”用户的请求，并自回归地生成字典。

No harness, no scaffold, just a direct next-word prediction.无需任何辅助，无需任何脚手架，只需直接预测下一个词即可。

**Problem with this approach:这种方法的缺点：**

1. LLM has no way to verify if its correctLLM 没有办法验证其正确性
2. LLM is likely gonna be wrong because fundamentally letter counting is not a "next word prediction" problem.LLM 很可能是错的，因为从根本上讲，字母计数并不是一个“下一个单词预测”的问题。
3. Chances of hallucination or errors are high, even if the underlying LLM is intelligent.即使底层 LLM 是智能的，出现幻觉或错误的可能性也很高。

> This method will really test the LLM's skills just on Problem 1. It is likely just straight up fail on Problem 2.仅第 1 题，这种方法就能真正考验 LLM 的技能。 第二题很可能直接就做不成。

## 2.2 Retrieval Augmented Generation (RAG)2.2 检索增强生成（RAG）

RAGs only work on retrieval tasks. Basically, given a query, we will perform a semantic search over a corpus of documents, get a list of highly similar documents, and use this as context to generate an answer to the user's query. RAG 仅适用于检索任务。基本上，给定一个查询，我们会对文档语料库执行语义搜索，得到一个高度相似的文档列表，并以此作为上下文来生成用户查询的答案。

The best case scenario for our "dictionary of fruit name r counting problem" is: if you somehow had a database of fruit names and replaced semantic search with some kind of a specific "r" search - but honestly this is no niche that RAG is not a good fit for this problem.对于我们的“水果名称 r 计数问题”来说，最好的情况是：如果你有一个水果名称数据库，并将语义搜索替换为某种特定的“r”搜索——但说实话，这并不是 RAG 不适合解决的一个小众问题。

**Problem with this approach:这种方法的缺点：**

> RAGs are famous but they are simply not built for general tasks like these.RAG（红绿灯）虽然很出名，但它们并不适合这类一般性任务。

## 2.3 ReAct (Reasoning and Acting)2.3 ReAct（推理与行动）

This is what we call tool calling these days. The LLM has access to a list of "functions" that they can call. Each function has a predefined "schema", that is a list of input and their datatypes.这就是我们现在所说的工具调用。LLM 可以访问一个“函数”列表并调用它们。每个函数都有一个预定义的“模式”，即输入及其数据类型的列表。

For example, you could give a simple tool to the LLM that is just:例如，您可以给 LLM 提供一个简单的工具，该工具的功能如下：

```text
def count_alphabets_in_word(word: string, alphabet: string) -> int
```

Using the above idea, the ReAct agent will be able to do the following:利用上述思路，ReAct 代理将能够执行以下操作：

- Generate a list of fruit names生成水果名称列表
- Use the tool to pass each fruit name and receive the output integer使用该工具输入每种水果的名称，即可获得输出整数。
- From it's output memory reconstruct the dictionary of which fruit got what count and then return.从其输出内存中重建记录每种水果计数的字典，然后返回。

The stack trace of such a transaction would look like this:此类事务的堆栈跟踪信息如下所示：

```text
[[user]]
Generate a dictionary with 50 fruits and the number of 'r' in each

[[assistant]]
<think> 50 fruit names are: 
strawberry, berry, grape, ..... (etc) 
</think>

[[assistant]]
count_alphabets_in_word("strawberry", "r")

[[tool out]]
3

[[assistant]]
count_alphabets_in_word("berry", "r")

[[tool out]]
2

.
.
.

[[assistant]]
<think> I now have everything I need in my message history, 
let's construct that dictionary </think>

{
    "strawberry": 3, 
    "berry": 2,
      ....
}
```

You see what the problems are right?你明白问题所在了吧？

> You have to define a function \`count\_alphabet\_in\_r\` before hand for this specific use-case.对于这种特定用例， 您需要预先定义一个函数 \` count\_alphabet\_in\_r\` 。

> If you don't define a function, the agent just falls back to the old way (i.e. straight generation).如果你不定义一个函数，智能体就会退而求其次，采用旧方法（即直接生成）。

> This guarantees that the LLM has some hint about WHAT the output is, but the LLM still has to generate the tokens one at a time from it's message history. We haven't eliminated stochastic generation with this, we have just given the LLM better context.这确保了 LLM 能够获得一些关于输出内容的线索，但它仍然需要根据其消息历史记录逐个生成令牌。我们并没有完全消除随机生成，只是为 LLM 提供了更好的上下文信息。

> **The problem compounds when you extend it to the multi-category setting of Problem 2.** LLM has to repeat a long trace of function calls and remember what happened at each turn and generate the answers token by token.当问题扩展到问题 2 的多类别设置时，问题就变得更加复杂了。 LLM 必须重复执行一长串函数调用，记住每一轮发生了什么，并逐个生成答案。

As an engineer, ReAct is great if you developing narrow applications, where you want the agent to have access to specific tools (web search, document search, calculator, terminal access, file edit, diff applier etc), but you will rarely develop a general agent and optimize for niche skills like these.作为一名工程师，如果你开发的是功能狭窄的应用场景，并且你希望代理能够访问特定的工具（例如网页搜索、文档搜索、计算器、终端访问、文件编辑、差异比较器等），那么 ReAct 就非常适合你。但是，你很少会开发通用代理并针对这些小众技能进行优化。

For general agents, only those universal tools are good. You are not gonna write tools like \`count\_alphabet\_in\_r\`.对于通用智能体来说，只有那些通用的工具才好用。你不会去编写像 \` count\_alphabet\_in\_r\` 这样的工具 。

## 2.4 CodeAct2.4 法典

CodeAct allows the LLM to write a piece of code to externally interact with a system. CodeAct 允许 LLM 编写一段代码，以便与外部系统进行交互。

![图像](https://pbs.twimg.com/media/HD2ublvaAAAEQi5?format=jpg&name=large)

Meaning you don't need to write exact tools anymore. You can just give the LLM the ability to write any python code and execute it in a sandboxed terminal environment, read the results and generate the output.这意味着你不再需要编写精确的工具。你只需赋予 LLM 编写任何 Python 代码并在沙盒终端环境中执行该代码、读取结果并生成输出的功能即可。

In other words, the tool call is to write a python functon and execute it!换句话说，该工具调用的目的是编写一个 Python 函数并执行它！

It will go something like this:大概是这样的：

```text
[[user]]
Generate a dictionary with 50 fruits and the number of 'r' in each

[[assistant]]
<think> Okay let's write some python code for this. </think>

[[assistant]]
python -c '
fruit_names = [
     'strawberry', 'berry' 'grape', ....
]

# Count in a dict
count_r = {
    k: sum(1 for c in fruit if c == 'r')
    for k, fruit in fruit_names
}  

print("Number of fruits: ", len(fruit_names))
print("Counts are: " , count_r)
'

[[tool out]]
Terminal Output:
Number of fruits: 50
Counts are: {"strawberry": 3, "berry": 2 ....}

[[assistant]]
<think> Okay, I have read the terminal output, let me return write it down again to return the output </think>

{
    "strawberry": 3, 
    "berry": 2,
      ....
}
```

So how CodeAct works is like:CodeAct 的工作原理如下：

1. CodeAct reads the full user message (just like other methods we discussed before)CodeAct 会读取完整的用户消息（就像我们之前讨论的其他方法一样）。
2. LLM thinks, writes, and run code or arbitrary terminal commands!LLM 能够思考、编写和运行代码或任意终端命令！
3. LLM loads the the output of the code into it's context windowLLM 将代码的输出加载到其上下文窗口中。
4. Generate result given what it read根据读取的内容生成结果

> **Once again problem compounds when you extend it to the multi-category setting of Problem 2.** The main reason for that is main agent has to do all the work by itself.当你把问题扩展到问题 2 的多类别设置时，问题又会变得更加复杂。 主要原因是总代理必须独自完成所有工作。

Vanilla CodeAct does not split up work into multiple subagents. Let's see how this can be done with subagents.原始的 CodeAct 并不将工作拆分成多个子代理。让我们看看如何使用子代理来实现这一点。

## 2.5 CodeAct + Subagents2.5 法典 + 分包商

Now we are talking about some serious power.现在我们谈论的是真正的强大力量。

> Subagent architectures are rather simple. There is a main agent and they can launch smaller agents to perform sub-tasks. 子代理架构相当简单。它由一个主代理和若干个子代理组成，主代理可以启动这些子代理来执行子任务。

> Each subagent are also CodeAct agents that does whatever tasks they are given, and returns output back to the subagents.每个子代理也是 CodeAct 代理，它们执行被赋予的任何任务，并将输出返回给子代理。

> The main agent's work is to consolidate the final output of the subagents and move forward with the next phase of the plan (which could be as simple as generate the final output).主代理的工作是整合子代理的最终输出，并推进计划的下一阶段（这可能很简单，就像生成最终输出一样）。

> Crucially, subagents DO NOT share any internal states with the main agent. Whatever inner steps the subagent does to fulfill the task (the message trace, or the tool-calling trace) is hidden from the main agent.至关重要的是，子代理不与主代理共享任何内部状态。子代理为完成任务而执行的任何内部步骤（消息跟踪或工具调用跟踪）对主代理都是隐藏的。

The benefit of the Subagent architecture is that the main agent does not suffer from context-rot since it does not need to worry about everything ever.子代理架构的优点在于，主代理不会遭受上下文腐烂的影响，因为它不需要担心所有事情。

We already know the subagent architecture will easily solve Problem 1 with num\_subagent = 0 (vanilla CodeAct), so let's actually see how it will work on Problem 2.我们已经知道子代理架构可以轻松解决 num\_subagent = 0 的问题 1（原始 CodeAct），所以让我们实际看看它在问题 2 上的表现如何。

```text
[[user]]
Generate a dictionary of different categories: 
fruits, countries, animals. 

For each category, generate 50 names.
And count the number of R in each, return as a nested dictionary

[[assistant]]
<think> Okay let's call some subagents and divide tasks among them </think>

[[assistant]]
call_subagent("Return a dictionary of 50 fruit names and number of r in them")

[[subagent]]
{"strawberry": 3, "berry": 2 ....}

[[assistant]]
call_subagent("Return a dictionary of 50 countries names and number of r in them")

[[subagent]]
{"france": 1, "russia": 1 ....}

[[assistant]]
call_subagent("Return a dictionary of 50 animals names and number of r in them")

 [[subagent]]
{"kangaroo": 1, "deer": 1 ....}

[[assistant]]
<think> Okay, I have responses from all subagents, now let me write the final JSON in a good good way </think>

{
    "fruits": { 
         "strawberry": 3, 
          "berry": 2,
          ....
    },
    "countries": {
         "france": 1, 
         "russia": 1 
         ....
    }
    "animals": {
         "kangaroo": 1, 
         "deer": 1 
         ....
    }
}
```

We made a lot of cool progress, CodeAct + Subagent can write arbitrary code to arbitrary things, it still:我们取得了许多很棒的进展，CodeAct + Subagent 可以向任意对象编写任意代码，但它仍然：

1. READS the entire user prompt into its context window将整个用户提示信息读取到上下文窗口中
2. READS the entire subagent output into its context window 将整个子代理的输出读取到其上下文窗口中
3. Autoregressively WRITES the final output (after processing information returned by past tool calls and subagents)自回归地写入最终输出（在处理了过去工具调用和子代理返回的信息之后）

We will see how an RLM will solve this, but first let's define what an RLM is.我们将看到 RLM 如何解决这个问题，但首先让我们定义一下什么是 RLM。

# 3\. Recursive Language Models3. 递归语言模型

RLMs are a scaffold that calls LLMs a certain way to make them achieve tasks. A scaffold is an external system that prompts the LLMs in specific ways to make it do things, manage it's context, and step by step achieve a larger more complex task.RLM（响应式学习模型）是一种框架，它以特定的方式调用 LLM（学习型学习模型），从而引导 LLM 完成任务。框架是一种外部系统，它以特定的方式提示 LLM 执行操作、管理其上下文，并逐步完成更大、更复杂的任务。

These are 4 points that explains what RLMs do:以下四点解释了 RLM 的作用：

1. A language model interacts with arbitrarily long prompts through an external programmable environment or an **REPL.** Printed outputs are truncated at the scaffold layer.语言模型通过外部可编程环境或 **REPL 与任意长度的提示进行交互。** 打印输出在脚手架层被截断。
2. The LLM can write code to **programmatically** **explore**, and create new **transformations** of the prompt法学硕士可以编写代码以**进行编程** **探索**并创造提示的新**变化**
3. It can **recursively invoke sub-agents** to complete smaller subtasks. The subagent responses do not get automatically loaded into the parent agent's context, it **gets returned as symbols or variables inside the parent's REPL**它可以**递归调用子代理**来完成更小的子任务。子代理的响应不会自动加载到父代理的上下文中，而是**作为符号或变量返回到父代理的 REPL 中。**
4. RLM agents can return responses in two ways - (a) **auto-regressively generated answers** like normal LLMs, and (b) **construct answers into a python variable** and return the variable instead.RLM 代理可以通过两种方式返回响应 - (a) 像普通 LLM 一样**自回归生成答案** ，以及 (b) **将答案构造到 python 变量中**并返回该变量。

Okay, I want you to re-read all the points above after you read this sentence. We are gonna look at Problem 1 first (and then Problem 2), and as we work through Problem 1, we will understand the strange mechanics of RLMs at play.好的，读完这句话后，请你重新阅读以上所有要点。我们先来看问题 1（然后再看问题 2），在解决问题 1 的过程中，我们会逐渐理解 RLM 模型中那些奇特的机制。

This will be satisfying to read.读到这篇文章会很有意思。

## 3.1 The REPL3.1 REPL

Okay, what is an REPL? REPL is a Read-Eval-Print-Loop. Think of it like a Jupyter notebook.好的，什么是 REPL？REPL 是读取-求值-打印循环（Read-Eval-Print Loop）的缩写。你可以把它想象成 Jupyter notebook。

- You can have access to a python variable called context where the user's query is kept.你可以访问一个名为 context 的 Python 变量，其中保存着用户的查询。
- You can write python commands to look at this context. For example, whenever the LLM issues a print statement, the live python kernel prints out the expression and it can view it.你可以编写 Python 命令来查看此上下文。例如，每当 LLM 发出打印语句时，实时 Python 内核都会打印出表达式，你可以查看它。
- The LLM can iteratively read outputs and write new code based on it.LLM 可以迭代地读取输出并根据输出编写新代码。
- REPL can also run in an isolated sandbox, so the LLM cannot impact the user's actual files. This is a security decision more than anything.REPL 也可以在隔离的沙箱中运行，因此 LLM 不会影响用户的实际文件。这主要是出于安全考虑。

Here is an example of how an RLM run will "start"以下是 RLM 运行“启动”方式的示例

Before any LLM gets called, we will start a python sandbox environment. A common thing to do this days (how DSPy does it and how I coded it in my repo) is to run a pyodide instance inside Deno.js.在调用任何 LLM 之前，我们会启动一个 Python 沙箱环境。现在常见的做法（DSPy 就是这么做的，我的代码仓库里也是这么写的）是在 Deno.js 中运行一个 pyodide 实例。

The Deno runtime manages the pyodide REPL's lifecycle. It instantiates the runtime by first declaring a special variable called "context" that contains the user's prompt.Deno 运行时管理 pyodide REPL 的生命周期。它首先声明一个名为“context”的特殊变量来实例化运行时，该变量包含用户的提示符。

What we pass into the LLM is NOT the content of the context, but just the fact that it has access to an REPL and there is a variable called context present in it.我们传递给 LLM 的不是上下文的内容，而是它可以访问 REPL 并且其中存在一个名为 context 的变量这一事实。

```text
[[system]]
You have access to a REPL python environment. 
Your task is stored in a variable called \`context\`. 
You can issue print statements.
Print displays truncated sections of the variable. 
Find out what the task is about.
Explore the context
When ready to answer, submit your result using: FINAL(answer)

[[assistant]]
"""
print(context)
"""

[[REPL output]]
Generate a dictionary containing 50 names of fruits and count the number of r in each
```

> In our case the user's prompt is simple and short. But remember user's prompt can be arbitrarily long. At the end of the article I will attach an example where the user's prompt is the COMPLETE TRANSCRIPTS of 300 Lex Fridman podcasts - containing over 10M tokens. **In other words, this context can be an arbitrarily long string.**在本例中，用户提示信息简单明了。但请记住，用户提示信息可以任意长。 在文章末尾，我将附上一个示例，其中用户的提示是 300 个 Lex Fridman 播客的完整文字稿 - 包含超过 1000 万个标记。 **换句话说，这个上下文可以是任意长的字符串。**

The Deno environment also hijacks the print statement available to the LLM. Instead of printing the whole string it tries to print, we forcefully TRUNCATE the string at the REPL layer.Deno 环境还会劫持 LLM 可用的 print 语句。它不会打印整个字符串，而是在 REPL 层强制截断该字符串。

Meaning even if the LLM accidentally printed something more than (say 500 words) we are gonna show it as:也就是说，即使 LLM 意外打印的内容超过（比如 500 字），我们也会将其显示为：

\`\`\`

.............. \[OUTPUT TRUNCATED TO 500 words\].............. \[输出内容已截断至500字\]

\`\`\`

> Even if the LLM tries, we won't let it overload itself with sensory information.即使 LLM 尝试这样做，我们也不会让它被过多的感官信息淹没。

Let's talk about that part about **FINAL(answer)** in the next part.我们下一部分再讨论 **FINAL(answer)** 的相关内容。

## 3.2 Programmatic Exploration3.2 程序化探索

The LLM's prompt contains instructions to explore the prompt space and think about how it can wrangle the data to do it's task.LLM 的提示包含探索提示空间并思考如何处理数据以完成其任务的说明。

It is like how data scientists working on a fresh CSV dump of a housing prices dataset will print out random things into a jupyter notebook to understand what they are dealing with.这就像数据科学家处理最新的房价数据集 CSV 转储文件时，会在 Jupyter Notebook 中打印一些随机内容来了解 ​​他们正在处理什么一样。

While exploring, the LLM can also create new variables inside the python runtime that contains important transformations of the data!在探索过程中，LLM 还可以在 Python 运行时中创建新变量，其中包含对数据的重要转换！

> Remember, python variables persist across different REPL execution calls. I keep coming back to the Jupyter Notebook example coz it is absolutely essential that you make this connection. Each time the LLM writes a block of code and executes is equivalent to us humans writing a block of code and executing a cell!记住，Python 变量在不同的 REPL 执行调用之间是持久的。我反复提到 Jupyter Notebook 的例子，是因为理解这一点至关重要。LLM 每次编写并执行一段代码，都相当于我们人类编写一段代码并执行一个单元格！

Example explorations or transformations of context can be:对语境的探索或转换示例包括：

- the LLM extracts an underlying CSV structure and puts the data into a pandas dataframe to process easier laterLLM 提取底层 CSV 结构，并将数据放入 pandas 数据框中，以便后续更轻松地进行处理。
- the LLM extracts specific sections from a markdown file and create a dictionary of subchapter\_title -> subchapter textsLLM 从 markdown 文件中提取特定章节，并创建一个子章节标题到子章节文本的字典。
- the LLM issues regexes or find statements to search for keywords within the context (basic keyword search)LLM 会发出正则表达式或查找语句，以在上下文中搜索关键字（基本关键字搜索）。

The exploration stage is all about distilling the complete prompt into smaller useful variables.探索阶段的全部意义就在于将完整的提示信息提炼成更小的有用变量。

For our Problem 1 though, the task is straightforward, so the LLM's exploratory task is rather easy.不过，对于我们的问题 1 来说，任务很简单，所以 LLM 的探索性任务也相当容易。

```text
.... (everything that happened before)

[[REPL output]]
Generate a dictionary containing 50 names of fruits and count the number of r in each

[[assistant]]
<think>okay I need to generate 50 fruit names</think>

"""
FRUIT_NAMES = ['grape', 'strawberry', 'berry', ....]
print(len(FRUIT_NAMES)) # let's check if it is 50

[[REPL]]
52

[[assistant]]
<think> Okay I added 2 extra by mistake. 
Let me pick first 50 and check again.
 I will also construct the output dict and return
</think>

"""
FRUIT_NAMES_50 = FRUIT_NAMES[:50]

assert len(FRUIT_NAMES_50) == 50

fruit_r_count = {
      {
              fruit: sum([
                       r' in f for f in fruit.lower()
              ])
      }
      for fruit in FRUIT_NAMES_50
}

FINAL(fruit_r_count)
"""
```

As you can see:如你看到的：

1. the LLM can auto-adjust depending on what the REPL output is. In it's second try it already has access to the original 52-count FRUIT\_NAMES variable, so it was able to reuse that variable to slice it into a FRUIT\_NAMES\_50 variable!LLM 可以根据 REPL 的输出自动调整。在第二次尝试中，它已经可以访问原始的包含 52 个水果名称的 FRUIT\_NAMES 变量，因此能够重用该变量并将其切片成一个包含 50 个水果名称的 FRUIT\_NAMES 变量！
2. If the assert statement fails, the code after that returns the dictionary will simply not execute, the LLM will receive an REPL error and get the chanec to fix the code!如果断言语句失败，则返回字典之后的代码将不会执行，LLM 将收到 REPL 错误，并有机会修复代码！
3. The LLM does not need to READ the dictionary \`fruit\_r\_count\` at all! It can just straight away pass it back to the user. The FINAL(.) just returns the result of an expression straight from the REPL back to the output of the scaffold.LLM 完全不需要读取字典 \`fruit\_r\_count\`！它可以直接将其返回给用户。\`FINAL(.)\` 只是将表达式的结果直接从 REPL 返回到 scaffold 的输出。

> **This is the first time that we have discussed a path where an agent is able to return an output to the user without** (a) reading the whole dictionary into the context (b) generating the dictionary token-by-token (c) not use file systems at all (in theory CodeAct could have written the dictionary in a file system and asked the user to read from there)**这是我们首次讨论代理无需任何操作即可向用户返回输出的路径。** （a）将整本词典的内容结合上下文来理解。 （b）逐个词元生成字典。 （c）完全不使用文件系统 （理论上，CodeAct 可以将字典写入文件系统，然后让用户从那里读取）

For this reason RLM outputs are NOT BOUND by the context length of the LLM. They can return arbitrarily long outputs - as large as the python variable can hold.因此，RLM 的输出长度不受 LLM 上下文长度的限制。它们可以返回任意长度的输出——只要 Python 变量能够容纳即可。

## 3.3 Recursive Subagents3.3 递归子代理

**We have talked about some cool parts of RLMs already, and we haven't even gotten to the Recursive parts.我们已经讨论过 RLM 的一些很棒的部分，甚至还没有谈到递归部分。**

- RLMs recieve a special function called \`llm\_query\`RLM 接收一个名为 \`llm\_query\` 的特殊函数
- llm\_query recieves a single string.llm\_query 接收一个字符串。
- llm\_query invokes a brand new REPL environment, completely fresh and sets context = whatever the parent RLM had passed into llm\_queryllm\_query 会调用一个全新的 REPL 环境，该环境完全是空的，并且上下文设置为父 RLM 传递给 llm\_query 的任何内容。
- This child RLM must solve the problem and send it back using FINAL这个子 RLM 必须解决问题并使用 FINAL 将其发送回去。

To understand all this, let's take **Problem 2** from above.为了理解这一切，让我们来看上面的**问题 2** 。

```text
[[system]]
.... # everything we talked before, and also:
You are given a new function called llm_query
llm_query invokes new subagents to perform tasks
Your subagents are quite strong and can handle long tasks well!
To call subagents just run llm_query(sub_context)

[[assistant]]
print(context)

[[REPL]]
Generate a dictionary of different categories: 
fruits, countries, animals. 

For each category, generate 50 names.
And count the number of R in each, return as a nested dictionary

[[assistant]]]
<think> Cool I will just launch subagents to capture the R counting for each category and do the job </think>
"""
FRUIT_DICT = llm_query("generate a dictionary of 50 fruits and the number of times r occured")

COUNTRY_DICT = llm_query("generate a dictionary of 50 countries and the number of times r occured")

ANIMAL_DICT = llm_query("generate a dictionary of 50 animals and the number of times r occured")

for dictionary in [FRUIT_DICT, COUNTRY_DICT, ANIMAL_DICT]:
        assert isinstance(dictionary, dict) and len(dictionary) == 50

answer = {
    "fruits": FRUIT_DICT,
    "countries": COUNTRY_DICT,
    "animals": ANIMAL_DICT
}
FINAL(answer)
"""
```

> In practical RLM implementations, we will be able to parallelize these calls. Multiple subagents working in parallel on orthogonal tasks is not just super cool, but it actually gets a ton of shit done really really fast.在实际的 RLM 实现中，我们将能够并行化这些调用。多个子智能体并行处理正交任务不仅非常酷，而且实际上可以非常非常快地完成大量工作。

**DID YOU SEE WHAT JUST HAPPENED?你看到刚才发生了什么吗？**

- The LLM assigned 3 subagents the task of managing fruits, countries, and animalsLLM 指派了 3 个子代理人分别负责管理水果、国家和动物。
- The subagents (as we saw previously) will return the answers calling FINAL(.) in their own local REPL子代理（如前所述）将通过在其本地 REPL 中调用 FINAL(.) 来返回答案。
- That output lands directly in the FRUIT\_DICT dictionary of the main agent (and ANIMAL\_DICT or COUNTRY\_DICT for that matter)该输出直接进入主代理的 FRUIT\_DICT 字典（以及 ANIMAL\_DICT 或 COUNTRY\_DICT 字典）。
- Even if the LLM prints it out to verify, because of rule 1 it will be truncated!即使 LLM 将其打印出来进行验证，由于规则 1，它也会被截断！
- The LLM can compose the final answer by schema checking the values and returning to the user!LLM 可以通过检查模式值来生成最终答案并返回给用户！

The main agent did not even need to:主要代理人甚至不需要：

1. Load the entire subagent output into context将整个子代理输出加载到上下文中
2. Generate the final output token by token逐个生成最终输出令牌

> It composed an answer by forming the key symbols through recursive calls and delivering the final output as a composition.它通过递归调用形成关键符号，并将最终输出作为合成图像来生成答案。

## 3.4 The RLM's Action Space3.4 RLM 的行动空间

RLMs can choose two ways to return it's FINAL output.RLM 可以选择两种方式返回其最终输出。

- One, it can compose answers into python variables and return it (like the example above)第一，它可以将答案组合成 Python 变量并返回（如上面的示例所示）。
- Or it can generate a response on it's own autoregressively, just like a normal LLM或者，它也可以像普通的线性线性模型一样，通过自回归的方式自行生成响应。

```text
....

[[assistant]]
print(context)

[[repl]]
Capital of France?

[[assistant]]
FINAL('Capital of France is Paris')
```

Note how the final answer in this above case is autoregressively generated.注意上述案例中的最终答案是如何自回归生成的。

This two mode of generating answers opens a HUGE opportunity for RLMs to be super crazy:这两种生成答案的模式为 RLM 提供了巨大的发挥空间，使其能够变得非常疯狂：

- They can programmatically explore using regexes, find operations using regular python他们可以通过编程方式使用正则表达式进行探索，并使用常规 Python 代码查找操作。
- They can create small variables to save work (they are inside a REPL so old work is never lost)它们可以创建小型变量来节省工作量（它们位于 REPL 环境中，因此旧工作永远不会丢失）。
- They can recursively call agents to summarize.它们可以递归地调用代理来进行总结。
- Subagents can be parallel, or sequential. The LLM intelligently decides this子代理可以是并行的，也可以是串行的。LLM 会智能地决定这一点。
- They can also use external tools but you have to expose them through your sandbox layer (Deno for example)他们也可以使用外部工具，但你必须通过沙盒层（例如 Deno）来暴露它们。

> 2月16日
> 
> New RLM trajectory that blew my mind! I will use this one as the main example in the YT tutorial. I passed in a CSV containing transcripts of 320 episodes of the Lex Fridman podcast and asked it to find what his first 10 ML guests had to say about AGI. The context had新的 RLM 轨迹让我大开眼界！我将在 YouTube 教程中以此作为主要示例。 我传入了一个 CSV 文件，其中包含 Lex Fridman 播客 320 集的文字稿，并要求它找出他的前 10 位机器学习嘉宾对通用人工智能 (AGI) 的看法。 背景是

# Why does this work so well?为什么这种方法如此有效？

- **Focused attention:** Instead of attending to all token pairs in a huge input, RLM allows the model to targets specific sections to load into the context. (For example, specific episodes of the Lex Fridman podcast instead of the whole thing!) **专注力：** RLM 并非处理庞大输入中的所有词元对，而是允许模型针对特定部分加载到上下文中。（例如，加载 Lex Fridman 播客的特定剧集，而不是整个播客！）

> **RLM loads context BY choice, not forcefully like ReAct or CodeAct does.RLM 是按需加载上下文，而不是像 ReAct 或 CodeAct 那样强制加载。**

> **By combining information from multiple different sections of the prompt.通过整合提示中多个不同部分的信息。**

- **Multi-step reasoning:** Many tasks are naturally recursive (multi-hop QA, codebase search, multi-document summarization). RLMs natively match the multi-task structure. **多步骤推理：** 许多任务本质上都是递归的（例如多跳问答、代码库搜索、多文档摘要）。递归逻辑模型（RLM）天然地匹配了多任务结构。

> **RLMs can just iteratively refine it's plan through simply printing various slices of the context and loading it into context. RLM 可以通过简单地打印上下文的各个部分并将其加载到上下文中来迭代地完善其计划。**

- **Robustness to noise:** When 99% of the input is irrelevant, recursive search avoids “attention dilution.” A smart model will intelligently load parts of the prompts that is likely to give it the most information.**抗噪性：** 当 99% 的输入无关时，递归搜索可以避免“注意力分散”。智能模型会智能地加载提示信息中最有可能提供最多信息的部分。

> **Cherry picking what context to load is a sign of intelligence精心挑选要加载的上下文是智慧的体现。**

- **Results are composable variable**: Sub-agent answers are not loaded directly into the LLM's context, they are returned within the python REPL, and the agent can choose to either peek into the results, or directly use the results.**结果是一个可组合的变量** ：子智能体的答案不会直接加载到 LLM 的上下文中，而是在 Python REPL 中返回，智能体可以选择查看结果，或者直接使用结果。

> **They can compose results directly out of subagent responses without fully reading them他们可以直接根据子代理的响应生成结果，而无需完全阅读这些响应。**

- **Arbitrarily long outputs:** Remember RLMs do not need to auto-regressively generate answers, they can instead construct answers inside a python variable - this means the model can, in theory, return infinitely long outputs.**任意长度的输出：** 请记住，RLM 不需要自回归地生成答案，它们可以改为在 Python 变量中构建答案——这意味着该模型理论上可以返回无限长的输出。

> **This works only if the output can be constructed programatically. Summarization tasks are still autoregressive for the most part.只有当输出可以通过编程方式构建时，这种方法才有效。 摘要任务在很大程度上仍然是自回归的。**

- **Cost savings:** Because the model decides what to read and when to recurse, you often pay for what you need, not for scanning everything. The RLM paper shows results how cheap these experiments can be to run compared to other methods.**成本节省：** 由于模型会决定读取哪些数据以及何时递归读取，因此您通常只需为所需数据付费，而无需为扫描所有内容付费。RLM 论文的结果显示，与其他方法相比，这些实验的运行成本非常低。

> **Low cost on prompt input tokens! And depending on the problem, low cost on completion tokens too提示输入令牌价格低廉！ 而且根据问题的不同，完成代币的成本也很低。**

- **Subagents still hit KV Caches**: Subagents perform tasks one step at a time, so their system prompt and past messages do not change. You are hitting KV Caches 90% of the time, so your cost is low.**子代理仍然会访问键值缓存** ：子代理一次执行一个步骤的任务，因此它们的系统提示和历史消息不会改变。您有 90% 的时间都在访问键值缓存，因此您的成本很低。

> **Subagents follow a simple user->assistant->user->assistant message template. Immediate KV cache benefits子代理遵循简单的用户->助手->用户->助手消息模板。立即获得 KV 缓存收益**

- **Separation of Concerns** : Root LM acts as a "planner/orchestrator" (strategic thinking) Sub LMs are workers that do low-level work. You can pick different models to do these different tasks as well!**关注点分离** ：根 LM 扮演“规划者/协调者”（战略思考）的角色，子 LM 则负责执行底层工作。您也可以选择不同的模型来完成这些不同的任务！

> **You can customize which model does what. Infact you can extend RLMs to pick what type of model should work on a subproblem您可以自定义每个模型的功能。 事实上，你可以扩展 RLM，以选择哪种类型的模型适用于子问题。**

- **Parallelization**: Don't forget multiple subagents can be called parallely too! **并行化** ：别忘了也可以并行调用多个子代理！

> **RLM chains can be long, so doing things asynchronously goes a long way in saving time.RLM 链可能很长，因此异步执行操作可以大大节省时间。**

- **Coding Intelligence**: Good coding models are naturally good at being RLM drivers.**编码智能** ：优秀的编码模型自然而然地擅长作为 RLM 驱动因素。

> **People are already training models on RLM harnesses, so I imagine this will only get better! 人们已经在使用 RLM 框架训练模型了，所以我相信情况只会越来越好！**

# Thanks for reading!感谢阅读！

- Study the paper on Arxiv:请阅读 arxiv 上的论文：

[https://arxiv.org/abs/2512.24601](https://arxiv.org/abs/2512.24601)

- Watch my 50 minute youtube tutorial where I explain it visually:观看我时长 50 分钟的 YouTube 教程，其中我用图像的方式进行了讲解：

[https://youtu.be/nxaVvvrezbY](https://youtu.be/nxaVvvrezbY)

- Check out my Github repo for a minimal implementation + opentui log viewer.请查看我的 Github 仓库，其中包含一个最小实现 + opentui 日志查看器。

[https://github.com/avbiswas/fast-rlm](https://github.com/avbiswas/fast-rlm)

- Study the RLM paper on Paper Breakdown (AI assisted paper reading) if you are reading from a computer:如果您使用电脑阅读，请研读 RLM 关于论文分解（人工智能辅助论文阅读）的论文：

[https://paperbreakdown.com/abs/2512.24601](https://paperbreakdown.com/abs/2512.24601)

Like and RT to share with others!点赞并转发分享给其他人！