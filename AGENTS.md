# AGENTS.md — 知识库 Schema

本文件描述知识库的结构和约定，供 LLM Agent 首次进入时阅读。

## 目录结构

```
50-Knowledge/
  AGENTS.md              ← 本文件：LLM 入口 schema
  CLAUDE.md              ← 工作流规则
  CLASSIFICATION.md      ← 分类体系与归类决策树（15 分类 4 大域）
  README.md              ← 自动生成索引（kb-index-gen.sh 输出，勿手动编辑）
  kb-index-gen.sh        ← 索引生成器（Python 脚本，勿修改）
  _index/                ← LLM 维护的编译层
    MASTER_INDEX.md      ← 全文章一行摘要索引（LLM 优先读这个）
    CONCEPT_MAP.md       ← 跨文章概念关系图
  01-AI-Agents/          ← 分类目录（按编号排列）
    Architecture/        ← 子分类目录
      万字提示词造数字灵魂/  ← 文章目录（中文短名 4-15 字）
        index.md         ← 正文（含 YAML frontmatter）
        metadata.json    ← 元数据
        media/           ← 图片附件（可选）
  Clippings/             ← 未归档文章暂存区
```

## 文章元数据 Schema (metadata.json)

```json
{
  "title": "string — 完整原标题",
  "type": "article | book | note",
  "source": "string — 原文 URL，无则空字符串",
  "author": "string — 作者名，无则空字符串",
  "clipped_date": "string — YYYY-MM-DD，无则空字符串",
  "tags": ["string"],
  "original_filename": "string — 入库前文件名"
}
```

## 子分类速查

| 分类 | 子分类 |
|------|--------|
| 01-AI-Agents | Architecture, Memory, Multi-Agent, Training, Workflows |
| 02-AI-Skills-and-Plugins | Skills, Plugins, Integrations |
| 03-Claude-Code | Tutorials, Environment, Scraping |
| 04-AI-Infrastructure | API-Proxy, Optimization |
| 05-AI-Applications | Content-Creation, Research, Finance-Tools |
| 20-Investment | Fundamentals, Analysis, Macro, Commentary |
| 06, 07, 10-13, 21, 22, 30 | 无子分类，文章目录直接在分类下 |

## LLM 工作协议

1. **首次进入**: 读本文件 → 读 `_index/MASTER_INDEX.md` 了解全貌
2. **查找主题**: 先查 MASTER_INDEX.md 定位相关文章，再读具体 index.md
3. **归档新文章**: 读 CLASSIFICATION.md 决策树 → 分类 → 建目录 + index.md + metadata.json → 更新 MASTER_INDEX.md → 运行 `kb-index-gen.sh`
4. **编辑限制**: 不修改已归档文章的 index.md 和 metadata.json
5. **语言**: 所有输出用中文
