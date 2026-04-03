---
title: "践行一人公司，用 4 文件 4 命令管理 Claude Code 全程开发"
source: "https://x.com/binaryhb/status/2026573761659666802/?s=12&rw_tt_thread=True"
author:
  - "[[Unknown]]"
published: 2026-02-25
created: 2026-03-27
description:
tags:
  - "clippings"
---
> 每天和 Claude Code 结对开发。踩了很多坑之后，我总结出一套极简但有效的工作流。核心就是 4 个 markdown 文件 + 4 个自定义命令。

先说一个小变化：我的个人公众号从「产品内观」更名为「一人造物」了。以前「产品内观」更多是记录一些产品思考的碎碎念，但现在我已经在践行一人公司，想在这里记录所有实践经历——一个人做产品、和 AI 协同演化的完整过程。名字变了，内容也会更聚焦。

## 问题：上下文管理才是核心挑战

Claude Code 的 context window 是有限的。你和它聊着聊着，上下文就爆了。

但大多数人不会主动开新会话——因为开新会话意味着上下文全部丢失。即便 Claude Code 会自动 compact 压缩上下文，压缩后的效果也很差，关键信息经常被丢掉。

结果就是：你昨天讨论了两小时的架构决策、改了三个页面的交互逻辑、临时决定砍掉一个功能——要么被压缩掉了，要么开了新会话全忘了。你花 15 分钟重新解释上下文，或者它按旧的理解去写代码，你花 30 分钟 debug 才发现是它用了过时的规格。

本质上，这是一个**上下文管理**的问题。

## 核心思路：文档就是记忆

既然 Claude Code 每次启动会自动读取项目根目录的 CLAUDE.md，那就把这个机制用到极致：

> **CLAUDE.md 是索引和规则，docs/ 是详细文档。文档和代码永远保持同步。**

这样不管是隔天、隔周、还是换一台电脑，只要 Claude Code 打开项目，读完文档就能无缝继续。

**关于文档存储**：社区里很多人用 Obsidian 管理项目文档，但我觉得不如直接用 iCloud 的文档同步。我的项目文档都存在 iCloud 的「文稿」或「桌面」文件夹下，多台设备自动同步，不需要额外工具。文档就在项目里，Claude Code 直接读取，没有中间环节。

## 4 个文件：项目内的文档结构

项目目录结构：

- **CLAUDE.md** — 索引 + 规则（80-120行）
- **docs/product-spec.md** — 产品规格：页面、交互、数据模型
- **docs/design-tokens.md** — 设计规范：色值、字体、间距
- **docs/plan.md** — 开发计划：进度、待办、遗留问题

这 4 个文件各司其职：

- **CLAUDE.md** — 项目概述、技术栈、开发规则、文档索引。很少改。
- **product-spec.md** — 页面结构、交互流程、数据模型、功能边界。需求变更时改。
- **design-tokens.md** — 色值、字体、间距、圆角等视觉参数。调设计时改。
- **plan.md** — 上次做了什么、下次做什么、遗留问题。每次收工都改。

如果项目有内容素材（比如我的项目有故事脚本），可以加一个 docs/content/ 目录，按需扩展。

**CLAUDE.md：越短越好**

CLAUDE.md 越长，Claude Code 对每条规则的注意力就越分散。社区的普遍经验是控制在 80-120 行以内，只放"每次对话都必须知道"的东西。

我的 CLAUDE.md 包含五个模块：

**1\. 项目概述（5-10行）** — 一句话说清这是什么、给谁用、当前阶段。

**2\. 技术栈（10-15行）** — 语言、框架、构建工具、硬性限制。

**3\. 开发规则（15-20行）** — 这是最重要的部分。我的两条核心规则：

- 任何代码改动如果与 docs/ 下的文档不一致，必须同步更新文档
- 产品决策变更必须写入对应文档，不能只存在于对话中

**4\. 常用命令（5-10行）** — 构建、运行、测试的命令。

**5\. 文档索引（5-10行）** — 指向 docs/ 下各文件。

一个关键的写法原则：写"产品规格详见 docs/product-spec.md"，**不要**写 [@docs/product-spec](https://x.com/@docs/product-spec).md。后者会每次自动把整个文件嵌入上下文，浪费 token。前者让 Claude Code 需要时自己去读。

**关于上下文占用**：CLAUDE.md 每次会话自动加载，始终占上下文。docs/ 下的文件只有 Claude Code 主动去读的时候才进入上下文。所以 CLAUDE.md 要短，docs/ 可以详细。

plan.md：跨会话的记忆传递器

这是整个工作流里最关键的文件。它记录：

- 上次做完了什么
- 下次要做什么
- 遇到的问题和决策变更

每次收工前更新 plan.md，下次开工 Claude Code 读一遍就知道从哪继续。

## 4 个命令：用户级的通用工作流

我在 ~/.claude/commands/ 下放了 4 个命令，所有项目通用：

**/start-working — 开工/开始工作 — 开工**

> 开工流程： 1. 读取 docs/plan.md，总结上次进度、本次待办、遗留问题 2. 快速检查：代码当前状态与 docs/ 文档是否一致，有无漂移 3. 等我确认后再开始开发，不要写任何代码

**/end-working — 收工**

> 收工流程： 1. 检查本次所有改动和决策： · 代码改动是否与 docs/ 文档一致？不一致则更新文档 · 口头决策是否已写入对应文档？ 2. 更新 docs/plan.md：标记完成任务，列出下次待办，记录遗留问题 3. git add -A && git commit 4. git push 执行前先让我确认 commit message。

**/plan — 先出方案再动手**

> 针对我接下来描述的需求： 1. 读取相关的 docs/ 文档获取上下文 2. 输出实现方案：要改哪些文件、怎么改、有什么风险 3. 等我确认方案后，先把方案追加到 docs/plan.md，再开始写代码

**/init-project — 初始化新项目**

> 基于 ~/.claude/CLAUDE-TEMPLATE.md 模板初始化新项目： 填写项目信息、确定技术栈、整理文档到 docs/、生成 plan.md。

## 每次工作循环

1. **/start-working** → 读 plan.md，确认要做什么
2. 开发（复杂功能先 /plan xxx）
3. 会话变长 → **/compact** 压缩上下文
4. 短暂离开 → **claude --continue** 接回来
5. **/end-working** → 同步文档 → 更新 plan.md → commit → push**/end-working** → 同步文档 → 更新 plan.md → 提交 → 推送

## 新项目启动流程

1. 在任何地方讨论产品 idea，产出一份 rough 文档
2. 新建项目文件夹
3. /init-project + 产品文档
4. Claude Code 填充 CLAUDE.md + 创建 docs/
5. 检查确认，开工

## 本地基础设施一览

~/.claude/ 目录下只有这些东西：

- **CLAUDE-TEMPLATE.md** — 新项目模板（见附录）
- **commands/init-project.md** — 初始化新项目
- **commands/start-working.md** — 开工**命令/start-working.md** — 开工
- **commands/end-working.md** — 收工**命令/end-working.md** — 收工
- **commands/plan.md** — 先出方案再动手

对一人公司践行者来说，复杂度是敌人。这套工作流的全部哲学就是：**用最少的文件，保证文档和代码永远同步，让每次新会话都能无缝继续。**

我是段少，一人造物主理人，正在用这套工作流开发 [Yonya（勇芽）](https://yonya.calisai.cn/)——一个基于 CBT 的儿童怕黑干预产品。如果你也在用 Claude Code 做独立开发，欢迎交流。

## 附录：CLAUDE-TEMPLATE.md中文：CLAUDE-TEMPLATE.md

以下是我用来初始化新项目的模板，放在 ~/.claude/CLAUDE-TEMPLATE.md。/init-project 命令会基于这个模板生成项目的 CLAUDE.md。

模板包含以下几个部分：

**项目概述** — 一句话说清：这是什么、给谁用、当前阶段。

**技术栈** — 根据项目实际情况填写：

- 语言：Swift / TypeScript / Python ...
- 框架：SwiftUI / React / ...
- 构建：Xcode / Vite / ...
- 其他：无额外UI库 / Tailwind / ...

**开发规则**（总数控制在10条以内）：

- 任何代码改动如果与 docs/ 下的文档不一致，必须同步更新对应文档
- 产品决策变更（功能取舍、交互调整、设计修改）必须写入对应文档，不能只存在于对话中
- 不确定的产品问题先问我，不要自行决定

**常用命令** — 根据项目技术栈填写构建、运行、测试命令。

**文档索引**：

- 产品规格 → docs/product-spec.md产品规格→ docs/product-spec.md
- 设计规范 → docs/design-tokens.md（如有）
- 内容素材 → docs/content/（如有）
- 开发计划 → docs/plan.md

**模板使用说明**：

1. 在其他地方（[Claude.ai](https://claude.ai/) 对话、Notion 等）讨论产品 rough idea，产出一份产品文档
2. 新建项目文件夹，执行 /init-project，Claude Code 会基于此模板：填写项目概述、根据项目性质确定技术栈和对应命令、把产品文档整理到 docs/ 下、生成初始 docs/plan.md
3. 检查生成的 CLAUDE.md 总行数（80-120行，绝不超过150行）
4. 通用命令（start-working、end-working、plan）已在 ~/.claude/commands/ 用户级目录，无需重复创建

**关键原则**：

- CLAUDE.md 只放索引和规则，详细内容放 docs/
- 文档索引用"详见 docs/xxx.md"写法，不要用 [@docs/xxx](https://x.com/@docs/xxx).md（避免每次自动嵌入上下文）
- docs/ 下按需创建文件，不要预先创建空文档
- 技术栈、常用命令部分必须根据实际项目修改，不能照搬模板占位符