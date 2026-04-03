---
title: "How to Use NotebookLM to Create Your Entire Course Curriculum From Scratch如何使用 NotebookLM 从零开始创建整个课程体系"
source: "https://x.com/ihtesham2005/status/2035035410758619428"
author:
  - "[[Unknown]]"
published: 2026-03-21
created: 2026-03-22
description:
tags:
  - "clippings"
---
Professors at NYU, Stanford, and Case Western stopped building courses by hand.纽约大学、斯坦福大学和凯斯西储大学的教授们不再手工设计课程了。

They're using NotebookLM to do it in hours and one just called it the biggest shift in academic research in 20 years.他们使用 NotebookLM 在几个小时内就完成了这项工作，有人称之为 20 年来学术研究领域最大的变革。

Here's the exact workflow they shared publicly:以下是他们公开分享的完整工作流程：

## Step 1 - The source upload strategy that changes everything. 第一步——改变一切的源上传策略。

![图像](https://pbs.twimg.com/media/HD3lDYEbQAEah38?format=png&name=large)

Most people upload one or two documents.大多数人只上传一到两个文件。

Professors building full courses upload their entire reading list at once.教授们在开设完整课程时，会一次性上传所有阅读清单。

Up to 50 sources per notebook on the free tier.免费版每台笔记本最多支持 50 个来源。

500,000 words per source.每个来源 50 万字。

PDFs, Google Docs, URLs, YouTube lectures, audio files, images with OCR.PDF 文件、Google 文档、URL、YouTube 讲座、音频文件、带有 OCR 功能的图像。

One notebook = one course unit.一本笔记本等于一个课程单元。

The workflow Stanford faculty documented publicly:斯坦福大学教职工公开记录的工作流程：

→ Upload all assigned readings for a unit → Upload the course syllabus → Upload previous years' exam questions → Upload any relevant primary sources→ 上传本单元所有指定的阅读材料 → 上传课程大纲 → 上传往年考题 → 上传任何相关的原始资料

NotebookLM now has a 1-million token context window.NotebookLM 现在拥有 100 万个 token 的上下文窗口。

It holds the entire unit in its head simultaneously and reasons across all of it at once.它能同时将整个单元的信息纳入考量，并同时对所有单元进行推理。

No AI on the market does this grounded in YOUR specific sources.目前市面上没有任何一款人工智能能够根据您提供的具体信息来源做到这一点。

## Step 2 - The curriculum mapping prompt.步骤 2 - 课程规划提示。

Once sources are uploaded, this is the first prompt professors run:资源上传完毕后，教授们首先会运行以下提示：

```text
"Based on all uploaded materials, create a complete curriculum map for this unit. Identify the 5 core concepts students must understand. For each concept, list: the source that introduces it, the source that deepens it, and the source that challenges or complicates it. Then suggest a logical teaching sequence."
```

What comes back is a structured roadmap of the entire unit with every claim cited back to the exact uploaded source.返回的是整个单元的结构化路线图，其中每一项声明都引用了确切的上传来源。

NYU's Assistant Dean used a version of this to identify course equivalencies across an entire revised curriculum for student advising.纽约大学助理院长使用类似方法来确定整个修订课程体系中的课程等效性，以便为学生提供咨询。

What used to require weeks of manual cross-referencing across departments happened in one session.过去需要数周时间才能完成的跨部门手动交叉核对工作，现在一次会议就能完成。

## Step 3 - Generating the lesson plan stack.步骤 3 - 生成课程计划堆栈。

After the curriculum map, professors run this:课程规划完成后，教授们会进行以下操作：

```text
"Using the uploaded syllabus and course materials, create a detailed day-by-day lesson plan for [topic]. Each class session should include: a learning objective, the key concepts to cover, one real-world example or analogy, a discussion question, and an estimated time breakdown for a 60-minute class."
```

NotebookLM generates the full plan grounded strictly in the materials uploaded.NotebookLM 会根据上传的材料生成完整的计划。

No hallucinated citations. No invented examples.没有虚构的引文，也没有捏造的例子。

Everything it produces traces back to a source you can click and verify inline.它生成的所有内容都可以追溯到您可以点击并在线验证的来源。

Arizona State University faculty documented using exactly this approach to organize scholarly articles and identify themes across disciplines work that previously took entire research semesters.亚利桑那州立大学的教职员工记录了他们如何运用这种方法来组织学术文章并识别跨学科的主题，而这项工作以前需要整个研究学期才能完成。

## Step 4 - The student-facing materials workflow.步骤 4 - 面向学生的材料工作流程。

This is where NotebookLM saves professors the most time per week.这就是 NotebookLM 每周为教授们节省时间最多的地方。

After building the lesson plan, they generate the entire student-facing package from the same notebook:制定好课程计划后，他们就可以从同一个笔记本生成所有面向学生的学习资料包：

→ Study guides with main ideas, critical arguments, and supporting evidence - one click in Studio→ 学习指南包含主要观点、关键论点和佐证材料——只需在 Studio 中点击一下即可获取。

→ Reading comprehension questions based on exact course materials→ 基于课程材料的阅读理解题

→ Flashcards for key concepts and terminology - auto-generated, cited to source→ 关键概念和术语的记忆卡片 - 自动生成，并注明出处

→ Practice quizzes - multiple choice or short answer, with an answer key that cites back to the reading→ 练习测验——选择题或简答题，附有答案，答案内容与阅读材料相对应

Northeastern University lecturers documented having students create their OWN custom study aids from course readings using this exact workflow.东北大学的讲师们记录了学生们如何运用这种工作流程，根据课程阅读材料创建自己的个性化学习辅助资料。

Students stop asking "what do I need to know?"学生们不再问“我需要知道什么？”

The notebook tells them in their own preferred format from the exact materials the professor assigned.笔记本以他们喜欢的格式，根据教授指定的材料记录下来。

## Step 5 - The Audio Overview for student prep.第五步 - 学生准备音频概览。

This is the feature that went viral among students once professors started sharing it.教授们开始分享这个功能后，它便在学生中迅速传播开来。

Before every class, professors generate an Audio Overview of that week's readings.每节课之前，教授们都会制作当周阅读材料的音频概述。

Students get a 10-15 minute podcast-style summary two AI hosts explaining the material, making connections, using analogies — before they've read a single page.学生们在阅读任何一页内容之前，就能获得一段 10-15 分钟的播客式摘要，两位人工智能主持人会解释材料、建立联系、运用类比。

Case Western Reserve University faculty documented using this specifically to help students approach dense readings they'd otherwise avoid entirely.凯斯西储大学的教职员工记录了他们专门使用这种方法来帮助学生应对他们原本会完全回避的晦涩难懂的阅读材料。

The result: students show up to class having already encountered the key ideas.结果：学生们上课时已经接触到了关键概念。

Class time shifts from "let me explain what the reading said" to actual discussion, application, and debate.课堂时间从“让我解释阅读材料的内容”转变为实际的讨论、应用和辩论。

That's the pedagogical shift professors are calling transformational.这就是教授们所说的具有变革意义的教学转变。

Not the tool itself. What the tool makes possible in the room.不是工具本身，而是工具在房间里所能实现的事情。

## Step 6 - The Deep Research upgrade for literature reviews.步骤 6 - 文献综述的深度研究升级。

This is the feature that changed things for research faculty specifically.这项功能尤其改变了研究人员的工作方式。

Deep Research available on NotebookLM lets the tool autonomously search the web, build a bibliography, and compile a fully cited research report.NotebookLM 上的深度研究功能可以让该工具自主搜索网络、构建参考书目并编制一份完整的引用研究报告。

One Pitt researcher documented cutting literature review prep time by 70% using it.匹兹堡大学的一位研究人员记录了使用该方法将文献综述准备时间缩短了 70%。

The workflow:工作流程：

→ Upload your existing sources and research question→ 上传您现有的资料来源和研究问题

→ Run Deep Research→ 深入研究

→ NotebookLM plans its own web searches, identifies gaps in your current sources, pulls new papers, and synthesizes everything into a cited report→ NotebookLM 会自动规划网络搜索，识别您现有资源中的不足，获取新论文，并将所有内容综合成一份引文报告。

Walter Isaacson used NotebookLM to analyze Marie Curie's journals for his book.沃尔特·艾萨克森使用 NotebookLM 分析了玛丽·居里的日记，并以此撰写了他的书。

Primary historical research documents not just student notes.原始历史研究文献，而不仅仅是学生笔记。

When a Pulitzer Prize-winning biographer is using your research workflow, that's a signal worth paying attention to.当一位普利策奖得主传记作家都在使用你的研究工作流程时，这是一个值得关注的信号。

## Step 7 - Google Classroom integration for sharing with students.步骤 7 - 集成 Google Classroom 与学生分享。

This is the 2026 update that closed the loop for faculty.这是 2026 年的更新，它为教职工们完成了整个流程。

You can now create a NotebookLM notebook directly from Google Classroom.现在您可以直接从 Google Classroom 创建 NotebookLM 笔记本。

One click pulls in all the resources already assigned to students.只需点击一下，即可调出所有已分配给学生的资源。

No manual re-uploading. No rebuilding the curriculum in a new tool.无需手动重新上传。无需在新工具中重建课程。

Assign notebooks to students as "View Only" - they get the full AI-assisted experience grounded in exactly the materials you assigned.将笔记本以“只读”形式分配给学生——他们将获得基于您分配的材料的完整人工智能辅助体验。

Students can query the notebook, generate their own study guides, run their own audio overviews, create flashcards all from the same sources the professor built the course on.学生可以查询笔记本，生成自己的学习指南，运行自己的音频概述，创建记忆卡，所有这些都基于教授构建课程时所使用的相同资源。

The professor sets the knowledge base once.教授只需设定一次知识体系。

The students interact with it in whatever format helps them learn best.学生们以最适合他们学习的方式与它互动。

That's personalized education at scale without any extra work from the professor after the initial setup.这就是大规模个性化教育，教授在初始设置后无需额外付出任何努力。

**The full professor workflow - save this.完整的教授工作流程——保存下来。**

Here's the complete stack documented by faculty across NYU, Stanford, Case Western, Arizona State, and Northeastern:以下是纽约大学、斯坦福大学、凯斯西储大学、亚利桑那州立大学和东北大学的教职员工记录的完整堆栈：

Step 1 → Upload entire reading list + syllabus + past exams into one notebook per unit第一步 → 将每个单元的全部阅读清单、教学大纲和往年试题上传到同一个笔记本中

Step 2 → Run curriculum mapping prompt get the full teaching sequence with citations步骤 2 → 运行课程规划提示，获取包含引用的完整教学序列

Step 3 → Generate day-by-day lesson plans for every class session步骤 3 → 为每一节课制定每日课程计划

Step 4 → Generate student-facing package study guides, flashcards, quizzes in one click步骤 4 → 一键生成面向学生的学习指南、记忆卡和测验题包

Step 5 → Create Audio Overviews for student pre-reading before every class第五步 → 为学生每节课前的预习创建音频概述

Step 6 → Use Deep Research to run literature reviews and identify source gaps步骤 6 → 利用深度研究进行文献综述，并找出信息来源的不足之处

Step 7 → Share notebooks via Google Classroom students interact with the same source base步骤 7 → 通过 Google Classroom 分享笔记本，学生可以访问相同的资源库。

What used to take a full summer now takes a week.以前需要整个夏天才能完成的事情，现在只需要一周时间。

What used to take a week now takes an afternoon.以前需要一周才能完成的事情，现在只需要一个下午就能搞定。

The professors who figure this out first aren't working less.最先弄明白这一点的教授们并没有减少工作量。

They're working on the parts that actually require a human in the room.他们正在研究那些需要真人在场才能完成的部分。

The university system has been running on the same curriculum-building process for decades.几十年来，大学系统一直沿用同样的课程建设流程。

Upload readings. Write lectures. Build assessments. Repeat every semester from scratch.上传阅读材料。编写讲义。设计评估题。每个学期都要从头开始重复这些操作。

NotebookLM didn't change what professors teach.NotebookLM 并没有改变教授们的教学内容。

It changed how long the invisible work takes.它改变了这项隐形工作所需的时间。

The literature review that took 3 months.历时3个月的文献综述。

The lesson plan stack that took 2 weeks.花了两个星期才完成的课程计划。

The study materials that took a weekend.花了我一个周末的时间学习资料。

All of it is still the professor's intellectual work.所有这些仍然是这位教授的学术成果。

NotebookLM just removed the part where you manually cross-reference 50 PDFs at 11pm.NotebookLM 刚刚移除了晚上 11 点手动交叉引用 50 个 PDF 文件的功能。

The institutions moving fastest on this aren't replacing faculty.在这方面行动最快的机构并没有更换教职员工。

They're giving them their time back.他们把时间还给了他们。

That's the real shift.这才是真正的转变。

And it's already happening.而且这已经开始发生了。