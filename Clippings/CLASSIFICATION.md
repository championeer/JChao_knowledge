# 知识库分类规则

## 1. 分类体系概览

知识库共 15 个分类，按领域分为四大域，编号段之间留有间隔以便扩展。

### 01-09: AI 与技术

| 编号 | 分类名 | 一句话定位 |
|------|--------|-----------|
| 01 | AI-Agents | 构建、配置、运营 AI Agent |
| 02 | AI-Skills-and-Plugins | 扩展 Agent 能力的技能、插件与平台对接 |
| 03 | Claude-Code | Claude Code 开发工具本身的使用与环境 |
| 04 | AI-Infrastructure | API 中转、部署、Token 优化等后端设施 |
| 05 | AI-Applications | 以应用场景驱动的 AI 实践（写作、研究、金融） |
| 06 | LLM-Foundations | 大模型理论与研究，非实操 how-to |
| 07 | Software-Engineering | 通用软件工程（不限于 AI） |

### 10-19: 人文与思维

| 编号 | 分类名 | 一句话定位 |
|------|--------|-----------|
| 10 | Thinking-Models | 思维模型、方法论、决策框架 |
| 11 | Philosophy | 哲学 |
| 12 | Psychology | 心理学 |
| 13 | History | 历史 |

### 20-29: 商业与经济

| 编号 | 分类名 | 一句话定位 |
|------|--------|-----------|
| 20 | Investment | 投资（价值投资、财报分析、宏观数据、专栏评论） |
| 21 | Business | 商业实务（公司运营、合规、商业模式） |
| 22 | Political-Economy | 政治经济学 |

### 30-39: 科学与健康

| 编号 | 分类名 | 一句话定位 |
|------|--------|-----------|
| 30 | Medicine-and-Health | 医学与健康 |

---

## 2. 各分类收录范围

### 01-AI-Agents

**收：** 构建、配置、运营 AI Agent 的一切内容。

| 子分类 | 范围 |
|--------|------|
| Architecture | Agent 架构设计、System Prompt 工程、人格构建、文件系统设计 |
| Memory | 记忆系统搭建、维护、备份、优化 |
| Multi-Agent | 多 Agent 协作、Agent 团队配置 |
| Training | Agent 训练方法（强化学习、对话训练、研究循环） |
| Workflows | Agent 工作流、定时任务、使用指南、真实用例 |

**不收：** 给 Agent 装技能/插件的内容（→ 02）、Agent 调用的 API 基础设施（→ 04）、用 Agent 做具体应用的实操（→ 05）。

### 02-AI-Skills-and-Plugins

**收：** 扩展 Agent 能力边界的技能、插件、平台集成。

| 子分类 | 范围 |
|--------|------|
| Skills | Skill 开发、配置、管理（Claude Skills、OpenClaw Skills） |
| Plugins | 插件开发与使用指南 |
| Integrations | 平台对接（微信、Telegram、飞书、语音、文档识别） |

**不收：** Agent 内部架构（→ 01）、纯应用场景（→ 05）。

**区分要点：** 如果文章重点是"怎么给 Agent 加一个新能力"，放 02；如果重点是"用 Agent 完成某个业务目标"，放 05。

### 03-Claude-Code

**收：** Claude Code 这个开发工具本身。

| 子分类 | 范围 |
|--------|------|
| Tutorials | Claude Code 使用教程、最佳实践、入门指南 |
| Environment | 终端环境配置（Ghostty、Yazi 等搭配工具） |
| Scraping | 用 Claude Code 做网页抓取的方案 |

**不收：** API 中转与部署（→ 04）、Claude 的技能/插件系统（→ 02）。

### 04-AI-Infrastructure

**收：** AI 应用的后端基础设施——用户看不到但必不可少的部分。

| 子分类 | 范围 |
|--------|------|
| API-Proxy | API 中转站搭建、自建代理、防封策略 |
| Optimization | Token 优化、API 聚合工具、成本控制 |

**不收：** 前端工具使用（→ 03）、具体应用实操（→ 05）。

**区分要点：** 03 是"用什么工具写代码"，04 是"怎么让 API 跑起来、省下来"。

### 05-AI-Applications

**收：** 以使用场景为导向的 AI 实践，重点在"用 AI 干成了什么事"。

| 子分类 | 范围 |
|--------|------|
| Content-Creation | AI 写作、PPT 生成、自动采编发公众号、NotebookLM |
| Research | AI 辅助学术研究、自动研究流程 |
| Finance-Tools | AI 金融工具、彭博终端替代、金融 Skills 集合 |

**不收：** 通用 Agent 搭建（→ 01）、底层设施（→ 04）。

### 06-LLM-Foundations

**收：** 大语言模型的理论、研究、架构层面内容。侧重"理解 LLM 如何工作"，而非"怎么用 LLM"。

示例：百万步 LLM 任务的零错误方案、AI 原生时代的个人系统框架。

**不收：** 操作指南、工具教程（→ 01-05）。

### 07-Software-Engineering

**收：** 通用软件工程：编程语言、系统设计、DevOps、数据库、算法——与 AI 无关的技术内容。

**不收：** AI 相关的工程实践（→ 01-06）。

### 10-Thinking-Models

**收：** 思维模型、决策框架、方法论、认知工具。

示例：产品发现模型、第一性原理、决策矩阵。

### 11-Philosophy

**收：** 哲学思想、哲学家、伦理学、存在主义等。

### 12-Psychology

**收：** 心理学理论、认知科学、行为学。

### 13-History

**收：** 历史事件、历史分析、史学方法。

### 20-Investment

**收：** 投资相关的一切。

| 子分类 | 范围 |
|--------|------|
| Fundamentals | 投资基础——选股规则、筛选方法、Checklist、价值投资课 |
| Analysis | 财报分析技术——延长公式、利润透视、增速分析、年报阅读 |
| Macro | 宏观数据解读、关税分析、经济形势判断 |
| Commentary | 专栏文章、随笔、信息处理方法论（告别 FOMO、深度阅读） |

### 21-Business

**收：** 商业实务——公司运营、合规、税务、商业模式。

示例：特拉华州公司年审指南。

### 22-Political-Economy

**收：** 政治经济学——制度分析、政策影响、国际政经关系。

### 30-Medicine-and-Health

**收：** 医学知识、健康管理、疾病防治。

---

## 3. 文档入库规范

### 目录结构

每篇文档是一个独立目录，放在 `分类/子分类/` 下：

```
01-AI-Agents/
  Architecture/
    万字提示词造数字灵魂/       ← 文章目录（中文短名）
      index.md                  ← 正文（必需）
      metadata.json             ← 元数据（必需）
      media/                    ← 图片等附件（可选）
```

无子分类的分类直接在分类目录下建文章目录：

```
06-LLM-Foundations/
  百万步LLM任务零错误/
    index.md
    metadata.json
```

### 目录命名

- 使用中文短名，4-15 个字，概括文章核心内容
- 不需要与原标题完全一致，但要准确传达主题
- 示例：原标题"一万字提示词给你的AI造一个数字灵魂" → 目录名 `万字提示词造数字灵魂`

### metadata.json

```json
{
  "title": "文章的完整原标题",
  "type": "article",
  "source": "原文链接（如有）",
  "author": "作者（如有）",
  "clipped_date": "收录日期，格式 YYYY-MM-DD（如有）",
  "tags": ["标签1", "标签2"],
  "original_filename": "原始文件名.md"
}
```

| 字段 | 说明 |
|------|------|
| `title` | 文章的完整原标题，用于索引展示 |
| `type` | `article`（文章）、`book`（书籍）或 `note`（笔记） |
| `source` | 原文 URL，无则留空字符串 |
| `author` | 作者名，无则留空字符串 |
| `clipped_date` | 收录日期 `YYYY-MM-DD`，无则留空字符串 |
| `tags` | 标签数组，可为空数组 |
| `original_filename` | 入库前的原始文件名 |

书籍类型额外字段：

| 字段 | 说明 |
|------|------|
| `status` | `reading`（在读）、`completed`（已读完）或留空（待读） |

---

## 4. 归类决策流程

收到一篇新文档时，按以下顺序判断：

```
1. 是关于构建/配置/运营 AI Agent 的？
   → 01-AI-Agents（选对应子分类）

2. 是关于给 Agent 加技能、插件、接平台的？
   → 02-AI-Skills-and-Plugins

3. 是关于 Claude Code 工具本身的？
   → 03-Claude-Code

4. 是关于 API 中转、部署、Token 优化的？
   → 04-AI-Infrastructure

5. 是以应用场景为主的 AI 实操（写作/研究/金融）？
   → 05-AI-Applications

6. 是 LLM 理论/研究/架构？
   → 06-LLM-Foundations

7. 是通用软件工程（非 AI）？
   → 07-Software-Engineering

8. 是思维模型/方法论/决策框架？
   → 10-Thinking-Models

9. 是哲学？→ 11-Philosophy
10. 是心理学？→ 12-Psychology
11. 是历史？→ 13-History

12. 是投资相关？→ 20-Investment（选对应子分类）
13. 是商业实务？→ 21-Business
14. 是政治经济学？→ 22-Political-Economy
15. 是医学/健康？→ 30-Medicine-and-Health
```

**易混淆场景速查：**

| 场景 | 归类 |
|------|------|
| "怎么给 Agent 设计记忆系统" | 01-AI-Agents/Memory |
| "怎么给 Agent 装一个微信技能" | 02-AI-Skills-and-Plugins/Integrations |
| "Claude Code 入门教程" | 03-Claude-Code/Tutorials |
| "自建 API 中转站" | 04-AI-Infrastructure/API-Proxy |
| "用 AI 自动发公众号" | 05-AI-Applications/Content-Creation |
| "LLM 如何处理百万步任务" | 06-LLM-Foundations |
| "四种产品发现模型" | 10-Thinking-Models |
| "年报怎么读" | 20-Investment/Analysis |
| "关税对市场的影响" | 20-Investment/Macro |

---

## 5. 编号规则

- **01-09：** AI 与技术域。当前已用 01-07，剩余 08-09 备用。
- **10-19：** 人文与思维域。当前已用 10-13，剩余 14-19 备用。
- **20-29：** 商业与经济域。当前已用 20-22，剩余 23-29 备用。
- **30-39：** 科学与健康域。当前已用 30，剩余 31-39 备用。

新增分类时：

1. 确定所属域
2. 在该域的编号段内取下一个可用编号
3. 在 `update-index.sh` 的 `DOMAINS` 列表中添加对应条目
4. 在知识库根目录创建分类文件夹

如需新增域（例如 40-49），直接使用下一个十位段。
