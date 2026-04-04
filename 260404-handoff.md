# 交接文档 — 知识库 LLM 编译层 + jchao_kms 插件 + 定时任务

生成时间: 2026-04-04
工作目录: `/Users/qianli/0-WORKSPACE/50-Knowledge`

---

## 1. 当前任务目标

基于 Karpathy 的 "LLM Knowledge Base" 方法论，为 50-Knowledge 知识库建立完整的 LLM 原生工作流：编译层、自动化入库、查询回馈、健康检查，以及定时触发机制。

## 2. 当前进展

### 已完成

**Phase 1: 编译层（全部完成）**
- `AGENTS.md` — LLM 入口 schema，定义目录结构、metadata schema、子分类速查、工作协议
- `_index/MASTER_INDEX.md` — 138 篇文章的一行摘要索引（4 个并行 subagent 生成）
- `_index/CONCEPT_MAP.md` — 15 个概念节点 + 7 个知识间隙

**Phase 2: Clippings 归档（全部完成）**
- 45 篇文章从 Clippings/ 归档到正确分类（4 批并行 subagent 处理）
- 1 对重复文章去重（Building CLIs for agents）
- 知识库从 93 → 138 篇
- README.md 已通过 `kb-index-gen.sh` 更新

**Phase 3: jchao_kms 插件（全部完成）**
- 插件位置：`/Users/qianli/0-WORKSPACE/60-Tools/JChao_Skills/plugins/jchao_kms/`
- 符号链接：`/Users/qianli/.claude/plugins/jchao_kms/`
- 三个 Skills：
  - `file-article` — 自动归档 Clippings（单篇/批量，全自动，含英文翻译）
  - `kb-query` — 知识库查询+研究+回馈循环（结果存 `_derived/`）
  - `kb-lint` — 健康检查（元数据/索引/分类/重复/概念覆盖/积压，含评分）
- 三个 Skill 均已添加 `KB_ROOT` 绝对路径常量，不依赖当前工作目录

**Phase 4: 定时触发（进行中 → 被阻塞）**
- 决定使用 Claude Code `/schedule`（远程 Agent 定时触发）
- 计划频率：file-article 每天 9:00，kb-lint 每周一 10:00
- **阻塞点**：GitHub 仓库 `championeer/JChao_knowledge` 未连接到 Claude Code 远程服务

## 3. 关键上下文

### 用户偏好
- 始终用中文回复
- 自建 Skills 放 `/Users/qianli/0-WORKSPACE/60-Tools/JChao_Skills/skills`（或 plugins 目录下），软链到工作目录
- file-article 设计选择：仅处理 Clippings/，全自动无确认，单篇+批量两种模式
- 英文文章自动翻译为中文，存为 `index-zh.md`

### 关键文件路径
- 知识库根：`/Users/qianli/0-WORKSPACE/50-Knowledge/`
- 分类规则：`CLASSIFICATION.md`（15 分类 4 大域，含完整决策树）
- LLM 入口：`AGENTS.md`
- 主索引：`_index/MASTER_INDEX.md`（138 条）
- 概念图：`_index/CONCEPT_MAP.md`（15 节点）
- README 生成器：`kb-index-gen.sh`（Python 脚本，只扫描 DOMAINS 列表目录）
- 插件目录：`/Users/qianli/0-WORKSPACE/60-Tools/JChao_Skills/plugins/jchao_kms/`
- 任务追踪：`tasks/todo.md`

### 架构决策
- `_index/` 目录不在 `kb-index-gen.sh` 的 DOMAINS 列表中，不会被误扫描
- `_derived/` 目录（kb-query 输出）同理不会被 kb-index-gen.sh 扫描
- metadata.json 的 author 字段需去除 `[[]]` 标记
- MASTER_INDEX 条目格式：`- [中文短名](相对路径) — 一句话摘要 \`#标签\``

## 4. 关键发现

- Karpathy 方法的核心不是 RAG，而是 LLM 自动维护的索引 + 摘要，小规模（~100 篇 / ~400K words）下足够用
- 回馈循环（查询结果归档回 wiki）是知识库持续增值的关键
- 批量归档时并行 subagent 效果好：4 个 subagent 各处理一组分类，互不干扰
- 远程 Agent 方案需要 GitHub 仓库连接，且本地 Clippings 需要先 push 才能被远程处理

## 5. 未完成事项

1. **[阻塞] 连接 GitHub 仓库** — 用户需运行 `/web-setup` 或访问 https://claude.ai/code/onboarding?magic=github-app-setup 连接 `championeer/JChao_knowledge`
2. **创建两个 schedule trigger**：
   - `file-article`: 每天 9:00 Asia/Shanghai (= 1:00 UTC), cron: `0 1 * * *`
   - `kb-lint`: 每周一 10:00 Asia/Shanghai (= 2:00 UTC), cron: `0 2 * * 1`
3. **远程 Agent prompt 需要自包含** — 远程 Agent 没有本地 SKILL.md，prompt 中需包含完整的归档/检查逻辑

## 6. 建议接手路径

1. 先确认用户是否已连接 GitHub（问用户或检查）
2. 如已连接，用 `ToolSearch select:RemoteTrigger` 加载工具
3. 创建 file-article trigger：
   - model: `claude-sonnet-4-6`
   - environment_id: `env_01YMenuj3dLRuSaSMuRVNhyE`
   - cron: `0 1 * * *`
   - repo: `https://github.com/championeer/JChao_knowledge`
   - prompt: 自包含的归档指令（参考 `jchao_kms/skills/file-article/SKILL.md` 内容）
4. 创建 kb-lint trigger：
   - cron: `0 2 * * 1`
   - prompt: 自包含的健康检查指令（参考 `jchao_kms/skills/kb-lint/SKILL.md` 内容）
5. 创建后用 `action: "run"` 手动触发一次验证

## 7. 风险与注意事项

- **远程 Agent 无法访问本地文件** — 只能操作 git clone 的仓库副本，本地未 push 的 Clippings 不会被处理
- **auto-backup 机制** — 用户有 auto-backup commit（从 git log 可见），Clippings 应该会被自动 push，但需确认
- **远程 Agent 的 SKILL.md 不可用** — prompt 必须自包含所有逻辑，不能引用 `jchao_kms/skills/` 下的文件
- **翻译功能在远程 Agent 中** — 需确认远程 Agent 是否支持 subagent 调用（haiku 模型翻译）

## 下一位 Agent 的第一步建议

询问用户是否已完成 GitHub 连接。如已连接，直接创建两个 RemoteTrigger。prompt 内容从对应 SKILL.md 中提取并改写为自包含格式。
