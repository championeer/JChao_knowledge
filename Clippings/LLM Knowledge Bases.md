---
title: "Thread by @karpathy"
source: "https://x.com/karpathy/status/2039805659525644595"
author:
  - "[[@karpathy]]"
published: 2026-04-03
created: 2026-04-03
description: "LLM Knowledge Bases Something I'm finding very useful recently: using LLMs to build personal knowledge bases for various topics of research"
tags:
  - "clippings"
---
**Andrej Karpathy** @karpathy [2026-04-02](https://x.com/karpathy/status/2039805659525644595)

LLM Knowledge Bases

Something I'm finding very useful recently: using LLMs to build personal knowledge bases for various topics of research interest. In this way, a large fraction of my recent token throughput is going less into manipulating code, and more into manipulating knowledge (stored as markdown and images). The latest LLMs are quite good at it. So:

Data ingest:

I index source documents (articles, papers, repos, datasets, images, etc.) into a raw/ directory, then I use an LLM to incrementally "compile" a wiki, which is just a collection of .md files in a directory structure. The wiki includes summaries of all the data in raw/, backlinks, and then it categorizes data into concepts, writes articles for them, and links them all. To convert web articles into .md files I like to use the Obsidian Web Clipper extension, and then I also use a hotkey to download all the related images to local so that my LLM can easily reference them.

IDE:

I use Obsidian as the IDE "frontend" where I can view the raw data, the the compiled wiki, and the derived visualizations. Important to note that the LLM writes and maintains all of the data of the wiki, I rarely touch it directly. I've played with a few Obsidian plugins to render and view data in other ways (e.g. Marp for slides).

Q&A:

Where things get interesting is that once your wiki is big enough (e.g. mine on some recent research is ~100 articles and ~400K words), you can ask your LLM agent all kinds of complex questions against the wiki, and it will go off, research the answers, etc. I thought I had to reach for fancy RAG, but the LLM has been pretty good about auto-maintaining index files and brief summaries of all the documents and it reads all the important related data fairly easily at this ~small scale.

Output:

Instead of getting answers in text/terminal, I like to have it render markdown files for me, or slide shows (Marp format), or matplotlib images, all of which I then view again in Obsidian. You can imagine many other visual output formats depending on the query. Often, I end up "filing" the outputs back into the wiki to enhance it for further queries. So my own explorations and queries always "add up" in the knowledge base.

Linting:

I've run some LLM "health checks" over the wiki to e.g. find inconsistent data, impute missing data (with web searchers), find interesting connections for new article candidates, etc., to incrementally clean up the wiki and enhance its overall data integrity. The LLMs are quite good at suggesting further questions to ask and look into.

Extra tools:

I find myself developing additional tools to process the data, e.g. I vibe coded a small and naive search engine over the wiki, which I both use directly (in a web ui), but more often I want to hand it off to an LLM via CLI as a tool for larger queries.

Further explorations:

As the repo grows, the natural desire is to also think about synthetic data generation + finetuning to have your LLM "know" the data in its weights instead of just context windows.

TLDR: raw data from a given number of sources is collected, then compiled by an LLM into a .md wiki, then operated on by various CLIs by the LLM to do Q&A and to incrementally enhance the wiki, and all of it viewable in Obsidian. You rarely ever write or edit the wiki manually, it's the domain of the LLM. I think there is room here for an incredible new product instead of a hacky collection of scripts.

---

**Andrej Karpathy** @karpathy [2026-04-02](https://x.com/karpathy/status/2039808711452246261)

Oh and in the natural extrapolation, you could imagine that every question to a frontier grade LLM spawns a team of LLMs to automate the whole thing: iteratively construct an entire ephemeral wiki, lint it, loop a few times, then write a full report. Way beyond a \`.decode()\`.

---

**Robert Scoble** @Scobleizer [2026-04-02](https://x.com/Scobleizer/status/2039806272867029069)

I did even more.

Ingested everything on X about AI and had it build this: https://alignednews.com/ai

Has a feed for your AI to hit too.

Includes papers, models, news, events, and much more.

Updated three times a day. Reads EVERYONE in AI on X and 8,300 AI companies too.

---

**Lex Fridman** @lexfridman [2026-04-02](https://x.com/lexfridman/status/2039841897066414291)

Same, I have a similar setup. A mix of Obsidian, Cursor (for md), and vibe-coded web terminals as front-end.

Since I do a podcast, the number/diversity of research interests is very large. But the knowledge-base approach has been working great.

For answers, I often have it

---

**OpenFX** @openfx\_

OpenFX provides institutional-grade liquidity across 40+ trading pairs - with 98% of transactions settling in under 60 minutes.

Built for remittance companies, PSPs, and institutions that move money across borders.

---

**kepano** @kepano [2026-04-02](https://x.com/kepano/status/2039841147494031637)

I like this approach because it mitigates the contamination risks of agent-generated content in your primary vault... the agents need a playground too!

> 2026-04-02
> 
> I like @karpathy's Obsidian setup as a way to mitigate contamination risks. Keep your personal vault clean and create a messy vault for your agents.
> 
> I prefer my personal Obsidian vault to be high signal:noise, and for all the content to have known origins.
> 
> Keeping a separation x.com/karpathy/statu…

---

**Michael Guo** @Michaelzsguo [2026-04-02](https://x.com/Michaelzsguo/status/2039823654410694783)

Doing something very similar. Instead of indexing raw documents, we start with structured Q&A, na "grill me" or "ask my anything" style skill with prompts designed to surface what experts actually know. The LLM distills the conversation into structured markdown. You query it,

![Image](https://pbs.twimg.com/media/HE7nn7DaIAACpaX?format=jpg&name=large)

---

**Carlos E. Perez** @IntuitMachine [2026-04-02](https://x.com/IntuitMachine/status/2039814639173702136)

Exactly! No greater alpha than using LLMs to refine one's conceptual models!

> 2026-04-02
> 
> I've finally resolved how Quaternion Process Theory of Cognition is connected with Alexander's Nature of Order.

---

**Goss Gowtham 𝕏** @Goss\_Gowtham [2026-04-02](https://x.com/Goss_Gowtham/status/2039830480829456596)

Can you make a video of how you work with md files, agentic IDEs?

Your earlier explanations of using LLMs were really helpful.

---

**Andrej Karpathy** @karpathy [2026-04-02](https://x.com/karpathy/status/2039832291464417746)

I was just thinking the same thing