# _wiki/ — Wiki 概念页层

> 本目录是知识库三层架构中的 **Wiki / 编译层**，存放 LLM 维护的**常青综合概念页**。
> 参考：Karpathy《LLM Wiki》gist。

## 定位

`_wiki/*.md` 与其他目录的区别：

| 目录 | 粒度 | 生命周期 | 写入方 |
|---|---|---|---|
| `01-…/` ~ `30-…/` | 单篇文章 | 归档后不可变 | 人工 via `/file-article` |
| `_derived/` | 一次性查询报告 | 时间戳快照 | `/kb-query` |
| `_index/MASTER_INDEX.md` | 全库目录索引 | 随归档更新 | `/file-article` |
| `_index/CONCEPT_MAP.md` | 概念节点注册表 | 随 wiki 页更新 | 本目录变化时同步 |
| **`_wiki/*.md`** | **跨文章综合概念** | **常青、持续演进** | **`/kb-query --promote` 创建/更新** |

一个概念页 = 一个主题的"定论与开放问题"清单，读完就知道知识库在这个主题上的全貌。

## 生命周期

```
draft ──(审校通过)──▶ active ──(180 天未更新 + 无新证据)──▶ stale
                        │
                        └──(新文章补充/问题澄清)──▶ active (更新 last_updated)
```

- **draft**：新创建但未经审校
- **active**：现役，代表知识库当前定论
- **stale**：过期但保留作为历史快照

## 文件约定

- 文件名：`<英文 slug>.md`（kebab-case，如 `agent-memory.md`）
- 结构：见 [TEMPLATE.md](TEMPLATE.md)
- 必需 frontmatter：`title` / `slug` / `type: concept-page` / `status` / `aliases` / `source_count` / `last_updated` / `related_wikis`
- 注册：建成后在 `_index/CONCEPT_MAP.md` 对应节点标记"Wiki 页：[slug] ✅"

## 操作方式

- **新建或更新**：`/kb-query --promote <slug> "<查询/主题>"`
- **查看健康度**：`/kb-lint` → "Wiki 层概览"段
- **被动关联**：`/file-article` 归档新文章时会提示可能关联的 wiki 页（不自动改写）
- **手工编辑**：仅限小幅修订、status 变更；重大内容改写走 `--promote`

## 不要做

- ❌ 不在此目录放原始文章（那属于分类目录）
- ❌ 不直接手写全新概念页（走 `--promote` 以保留生成记录）
- ❌ 不绕过 CONCEPT_MAP 注册（孤儿页会被 lint 标出）
- ❌ 不在此目录放子目录（扁平结构，用 frontmatter `related_wikis` 表达关联）
