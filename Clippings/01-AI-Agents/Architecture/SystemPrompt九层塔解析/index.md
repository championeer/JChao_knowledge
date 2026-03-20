---
title: "OpenClaw System Prompt 的\"九层塔\"：一个 AI Agent 的完整人格是怎么组装出来的？"
source: "https://x.com/servasyy_ai/status/2029471443579445538"
author:
  - "[[Unknown]]"
published: 2026-03-05
created: 2026-03-05
description:
tags:
  - "clippings"
---
> 你有没有想过，当你 @ 一个 AI Agent 时，它是怎么"知道"自己是谁、能做什么、该怎么回答的？

![图像](https://pbs.twimg.com/media/HCogVhkawAAS5HV?format=jpg&name=large)

如果你以为 AI Agent 的"人格"是一个简单的文本文件，那就太天真了。

实际上，OpenClaw 的每个 Agent 在回答你之前，都会先"吃下"一个 **几十KB 的超级说明书**——这就是传说中的龙虾 **System Prompt**。

这个说明书不是一次性写好的，而是由 **9 层架构** 精心编排、实时组装而成的。就像搭积木一样，每一层都有自己的职责，最终拼出一个"有身份、有能力、有记忆"的 AI 助手。

今天我们就来拆解 **System Prompt 的这座"九层塔"**，看看 OpenClaw 是怎么把一个"裸奔"的大模型，变成一个懂你、帮你、记得你的智能伙伴的。

![图像](https://pbs.twimg.com/media/HCofaq_akAATHav?format=jpg&name=large)

## 为什么需要 9 层？一层不够吗？

![图像](https://pbs.twimg.com/media/HCogC4yaIAA_KuE?format=png&name=large)

**先说结论：一层根本不够**

如果只用一个文件定义 Agent，你会遇到这些问题：

- **框架升级了，所有 Agent 都要手动改配置**（累死）
- **工具定义散落各处，LLM 不知道自己能干啥**（懵逼）
- **每个 Agent 都要重复写"你是谁、能做什么"**（浪费）
- **运行时信息（当前时间、模型、环境）没法动态注入**（过时）

所以 OpenClaw 的设计哲学是：**把"变"和"不变"分离**。

- **框架层（Layer 1-6）**：所有 Agent 共享，框架自动生成，保证一致性
- **用户层（Layer 7-8）**：每个 Agent 独立配置，支持个性化
- **运行时层（Layer 9）**：每次请求动态注入，保证上下文准确

这样一来，框架升级不会破坏用户配置，用户配置也不会影响框架稳定性。

## Layer 1-6：框架自动生成的"底座"

![图像](https://pbs.twimg.com/media/HCogGnbawAQg_7c?format=jpg&name=large)

这 6 层是 OpenClaw 的"操作系统"，所有 Agent 共享，用户无法修改。

Layer 1：框架核心层（8KB）

**比喻：** 就像一本操作手册的"使用说明"部分。

**包含内容：**

- **上下文头**：告诉 LLM 当前时间、Agent 身份、运行环境
- **工具调用风格**：定义工具调用的格式（XML 风格）
- **安全规则**：禁止操作清单（rm -rf、格式化等）

**为什么这样设计？**

- 保证所有 Agent 的基础行为一致
- 框架升级时所有 Agent 自动获得新能力
- 降低配置错误的风险

Layer 2：工具定义层（12KB）

**比喻：** 就像一把瑞士军刀的工具清单。

**包含内容：**

- **内置工具**：read、write、edit、exec**内置工具** ：read、write、edit、exec
- **OpenClaw 扩展工具**：message、browser、canvas、cron、memory\_search**OpenClaw 扩展工具** ：message、browser、canvas、cron、memory\_search
- **渠道特定工具**：discord\*、telegram、slack\_

**为什么用 JSON Schema？**

- LLM 能更准确地理解工具用法
- 框架可以在调用前验证参数
- 自动生成文档和类型定义

Layer 3：技能注册表（5KB）

**比喻：** 就像一家餐厅的"特色菜谱"。

**包含内容：**

- 自动扫描 ~/development/openclaw/skills/ 目录自动扫描~/development/openclaw/skills/ 目录
- 每个 Skill 的 name、description、location

**为什么自动扫描？**

- 添加新 Skill 只需放入目录，无需修改配置
- 所有 Agent 自动获得新 Skill
- 降低配置错误风险

Layer 4：模型别名层（2KB）

**比喻：** 就像"快捷键"。

**包含内容：**

- 给复杂的模型路径起简短别名
- 例如：glm-5 → zhipu/glm-5

**为什么需要别名？**

- 简化模型调用
- 支持多 Provider 切换
- 便于 A/B 测试和模型迁移

Layer 5：协议规范层（3KB）

**比喻：** 就像"交通规则"。

**包含内容：**

- **Silent Replies**：无需回复时返回 NO\_REPLY
- **Heartbeats**：定期执行健康检查
- **Reply Tags**：支持原生引用回复
- **Chunked Write Protocol**：大文件分块写入

**为什么需要协议？**

- 保证所有 Agent 行为一致
- 支持自动化监控和健康检查
- 简化多 Agent 协作

Layer 6：运行时信息层（2KB）

**比喻：** 就像"仪表盘"。

**包含内容：**

- **时间信息**：当前时间戳、时区
- **Agent 信息**：Agent ID、当前模型、默认模型
- **环境信息**：主机名、操作系统、Node 版本、Shell 类型
- **渠道信息**：当前渠道、渠道能力

**为什么每次都注入？**

- LLM 知道当前时间（避免时间错乱）
- LLM 知道当前模型（避免能力误判）
- LLM 知道当前环境（避免路径错误）

## Layer 7-8：用户可控的"个性化层"

![图像](https://pbs.twimg.com/media/HCogOiPbQAAEyQA?format=jpg&name=large)

这 2 层是用户可以编辑和编程的部分，决定了每个 Agent 的"个性"。

Layer 7：工作区文件层（10-15KB）★ 静态可控

**比喻：** 就像"你的工作笔记"。

**核心文件：**

- **IDENTITY.md**：TELOS 框架身份定义
- **SOUL.md**：性格内核和行为准则
- **USER.md**：用户信息和偏好
- **AGENTS.md**：协作规范和 @ 规则
- **HEARTBEAT.md**：定期检查任务清单
- **TOOLS.md**：环境特定工具清单
- **MEMORY.md**：MemOS 导出的记忆

**为什么只有这一层是静态可编辑的？**

- 把"变"和"不变"分离
- 框架层保证一致性，用户层允许个性化
- 配置文件可以版本管理、备份、共享

Layer 8：Bootstrap Hook 系统（2KB）★ 动态可控

**比喻：** 就像"可编程的注射器"。

**四种 Hook 机制：**

1. **agent:bootstrap Hook**：完全控制 bootstrapFiles 数组**agent:bootstrap Hook** ：完全控制 bootstrapFiles 数组
2. **bootstrap-extra-files Hook**：追加额外文件
3. **before\_prompt\_build Hook**：修改最终 prompt**before\_prompt\_build Hook** ：修改最终 prompt
4. **bootstrapMaxChars 配置**：控制字符预算

**为什么需要 Hook 系统？**

- 可以根据上下文动态调整注入内容
- 可以执行 shell 命令并注入输出
- 可以读取外部文件并注入
- 支持条件判断（if/else）

**实战建议：**

- **添加项目文档** → 用 bootstrap-extra-files
- **动态加载文件** → 用 agent:bootstrap Hook
- **注入实时上下文** → 用 before\_prompt\_build Hook

## Layer 9：入站上下文层（3KB）

![图像](https://pbs.twimg.com/media/HCogYhtawAMWUI8?format=jpg&name=large)

**比喻：** 就像"实时路况信息"。

**包含内容：**

- **消息元信息**：message\_id、sender\_id、was\_mentioned**消息元信息** ：message\_id、sender\_id、was\_mentioned
- **发送者信息**：label、name、tag
- **对话历史**：最近 N 条消息的摘要
- **引用上下文**：用户引用的消息
- **线程上下文**：线程启动消息

**为什么每次都注入？**

- LLM 知道当前是谁在说话
- LLM 知道对话历史
- LLM 知道是否被 @

## 完整组装流程：从"裸奔"到"上岗"

![图像](https://pbs.twimg.com/media/HCogccSawAExDkq?format=jpg&name=large)

当你 @ 一个 Agent 时，OpenClaw 会按以下流程组装 System Prompt

**STEP 1：加载框架核心**

- 读取 OpenClaw 核心框架代码
- 生成 Context Header
- 注入 Tool Call Style
- 添加 Safety Rules

**STEP 2：扫描并加载 Tools**

- 扫描 src/tools/ 目录
- 读取每个工具的 TypeScript 定义
- 生成 JSON Schema
- 按类别分组

**STEP 3：扫描并加载 Skills**

- 扫描 ~/development/openclaw/skills/ 目录扫描~/development/openclaw/skills/ 目录
- 读取每个 skill 的 SKILL.md
- 提取 name / description / location
- 生成 Available Skills 表格

**STEP 4：加载 Model Aliases**

- 读取 ~/.openclaw/agents/{agent}/agent/models.json读取~/.openclaw/agents/{agent}/agent/models.json
- 解析 model mappings
- 生成 Model Aliases 列表

**STEP 5：注入协议规范**

- Silent Replies 规范
- Heartbeats 协议
- Chunked Write Protocol
- Reply Tags 规范

**STEP 6：注入运行时信息**

- 获取当前时间戳
- 获取 Agent/Host/OS/Node 信息
- 获取 Model/Default Model 信息
- 获取 Channel/Capabilities 信息

**STEP 7：加载 Workspace Files（用户可编辑）★**

- 读取 IDENTITY.md
- 读取 SOUL.md
- 读取 USER.md
- 读取 AGENTS.md
- 读取 HEARTBEAT.md
- 读取 TOOLS.md
- 读取 MEMORY.md

**STEP 8：执行 Bootstrap Hook System（用户可编程）★**

- 触发 agent:bootstrap Hook
- 触发 bootstrap-extra-files Hook
- 应用 bootstrapMaxChars 预算控制
- 触发 before\_prompt\_build Hook

**STEP 9：注入 Inbound Context**

- 解析 Message Metadata
- 解析 Sender Info
- 解析 Chat History
- 解析其他上下文

**FINAL：组装完成**

- 总大小：~43KB
- 用户可控部分：~14-17KB（Layer 7 + 8）
- 框架生成部分：~26-29KB（Layer 1-6, 9）

## 用户可控的 3 种方式

![图像](https://pbs.twimg.com/media/HCogjS7awAEAqhA?format=jpg&name=large)

OpenClaw 提供了 **3 种用户可控机制**

1\. Layer 7（Workspace Files）- 静态配置文件

**适用场景：** 定义 Agent 身份、工作规范、记忆

**优点：** 简单直观，易于版本管理

**缺点：** 无法动态调整

2\. Layer 8（Bootstrap Hook System）- 动态注入脚本

**适用场景：** 根据上下文动态注入内容、执行命令、读取外部文件

**优点：** 灵活强大，支持条件判断和命令执行

**缺点：** 需要学习 Hook 系统，脚本错误可能导致异常

3\. 间接控制 Layer 9（Inbound Context）- 通过发送消息影响上下文

**适用场景：** 通过对话历史、引用消息影响 LLM 行为

**优点：** 无需配置，自然交互

**缺点：** 无法精确控制

## 优化建议：如何让 Agent 更"轻盈"？

![图像](https://pbs.twimg.com/media/HCogpNzaEAA1qHd?format=jpg&name=large)

如果你的 System Prompt 过大（>50KB），可以考虑：

用户可控部分优化（Layer 7 + 8）

**Layer 7（静态文件）优化：**

- ✅ 保留核心 TELOS 框架，删除冗余描述
- ✅ 使用 checklist 代替长段落
- ✅ 依赖 MemOS 自动导出，不要手动添加内容
- ❌ 不要重复描述 OpenClaw 框架已经知道的事情
- ❌ 不要把 Skills 的详细说明复制到 Workspace Files

**Layer 8（Hook 系统）优化：**

- ✅ 优先使用 bootstrap-extra-files（简单场景）
- ✅ 需要条件判断时使用 agent:bootstrap（复杂场景）
- ✅ 需要实时上下文时使用 before\_prompt\_build（动态场景）
- ❌ 不要在 Hook 中执行耗时操作
- ❌ 不要在 Hook 中注入过多内容

提示词裁剪策略

![图像](https://pbs.twimg.com/media/HCohJ87bEAAPg1a?format=png&name=large)

## 总结：为什么 OpenClaw 的架构值得学习？

![图像](https://pbs.twimg.com/media/HCogvc_awAEXQdZ?format=jpg&name=large)

OpenClaw 的 9 层架构不是为了炫技，而是为了解决真实问题

1. **框架稳定性 vs 用户自由度**：把"变"和"不变"分离，框架升级不会破坏用户配置
2. **一致性 vs 个性化**：框架层保证所有 Agent 基础行为一致，用户层允许个性化
3. **静态配置 vs 动态注入**：静态文件易于管理，动态 Hook 提供灵活性
4. **Token 消耗 vs 上下文准确性**：运行时信息每次注入，保证上下文准确

**最重要的是：** OpenClaw 的 System Prompt 提供了 **2 个用户可控层**（Layer 7 + 8），让你可以在不破坏框架的前提下，打造一个"懂你、帮你、记得你"的 AI 助手。

如果你正在构建自己的 AI Agent 系统，OpenClaw 的提示词 9 层架构值得参考。

**想了解更多？**

- OpenClaw 官方文档：[https://docs.openclaw.ai](https://docs.openclaw.ai/)OpenClaw 官方文档： [https://docs.openclaw.ai](https://docs.openclaw.ai/)
- GitHub 仓库：[https://github.com/openclaw/openclaw](https://github.com/openclaw/openclaw)GitHub 仓库： [https://github.com/openclaw/openclaw](https://github.com/openclaw/openclaw)
- Discord 社区：[https://discord.com/invite/clawd](https://discord.com/invite/clawd)Discord 社区： [https://discord.com/invite/clawd](https://discord.com/invite/clawd)

**下一篇**OpenClaw Agent System Prompt 架构详解（9层版本）**👇**