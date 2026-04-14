# AGENTS.md — 知识库 Schema

本文件描述知识库的结构和约定，供 LLM Agent 首次进入时阅读。

## 三层架构

本知识库参考 Karpathy 的 LLM Wiki 模型组织，分为三层：

| 层 | 含义 | 对应目录/文件 | 读写权限 |
|---|---|---|---|
| **Schema**（人写） | 结构与规则 | `AGENTS.md`、`CLASSIFICATION.md`、`CLAUDE.md` | 人工维护 |
| **Raw sources**（不可变） | 原始资料 | `01-…/` 到 `30-…/` 分类目录下的 `index.md` + `metadata.json` | 归档后只读 |
| **Wiki / 编译层**（LLM 维护） | 索引、时间线、概念页、合成报告 | `_index/MASTER_INDEX.md`、`_index/CONCEPT_MAP.md`（概念页注册表）、`_index/log.md`、`_wiki/*.md`（常青概念页）、`_derived/*.md`（查询快照）、自动生成的 `README.md` | LLM 持续追加/更新 |

`Clippings/` 是 Raw sources 的暂存区，归档后文件被删除。`kb-index-gen.sh` 的 `DOMAINS` 列表天然跳过 `_index/`、`_wiki/` 和 `_derived/`。

## 目录结构

```
50-Knowledge/
  AGENTS.md              ← 本文件：LLM 入口 schema
  CLAUDE.md              ← 工作流规则
  CLASSIFICATION.md      ← 分类体系与归类决策树（15 分类 4 大域）
  README.md              ← 自动生成索引（kb-index-gen.sh 输出，勿手动编辑）
  kb-index-gen.sh        ← 索引生成器（Python 脚本，勿修改）
  _index/                ← 索引与时间线（LLM 维护）
    MASTER_INDEX.md      ← 全文章一行摘要索引（LLM 优先读这个）
    CONCEPT_MAP.md       ← 概念节点注册表 + 跨文章关系图 + Wiki 页登记
    log.md               ← 追加式事件时间线（ingest/query/lint/promote 自动写入）
  _wiki/                 ← 常青概念页（Wiki 编译层，扁平结构）
    README.md            ← Wiki 层说明与生命周期
    TEMPLATE.md          ← 概念页标准模板
    <slug>.md            ← 如 agent-memory.md，由 /kb-query --promote 维护
  _derived/              ← kb-query 合成报告沉淀池（按需创建）
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

1. **首次进入**: 读本文件 → 读 `_index/MASTER_INDEX.md` 了解全貌 → 视需要读 `_index/log.md` 最近条目了解近期活动
2. **查找主题**: 先查 `_wiki/` 是否有对应概念页（有则读它）→ 否则查 MASTER_INDEX.md 定位相关文章再读 index.md
3. **归档新文章**: 读 CLASSIFICATION.md 决策树 → 分类 → 建目录 + index.md + metadata.json → 更新 MASTER_INDEX.md → 运行 `kb-index-gen.sh`
4. **事件追加**: 每次 ingest / query / lint / promote 执行结束后，向 `_index/log.md` 追加一行，使用标准 prefix（`[INGEST]` / `[QUERY]` / `[LINT]` / `[PROMOTE]`）
5. **Wiki 层**: `_wiki/*.md` 是常青概念页，由 `/kb-query --promote <slug>` 创建/更新；不手写全新页，小修订可直接编辑但要刷新 `last_updated`
6. **编辑限制**: 不修改已归档文章的 index.md 和 metadata.json；不修改 `_index/log.md` 的历史条目（仅追加）
7. **语言**: 所有输出用中文
