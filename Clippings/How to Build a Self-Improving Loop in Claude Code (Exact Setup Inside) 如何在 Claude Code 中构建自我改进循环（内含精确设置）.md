---
title: "How to Build a Self-Improving Loop in Claude Code (Exact Setup Inside) 如何在 Claude Code 中构建自我改进循环（内含精确设置）"
source: "https://x.com/0x_rody/status/2064728139314389073"
author:
  - "[[@0x_rody]]"
published: 2026-06-10
created: 2026-06-11
description: "Claude writes your code, hands it over, and 3 tests are failing.Claude 帮你写好了代码，交给你，结果 3 个测试没通过。You paste the errors back, it fixes one thing..."
tags:
  - "clippings"
---
![图像](https://pbs.twimg.com/media/HKdjNnhXwAAU9_7?format=jpg&name=large)

Claude writes your code, hands it over, and 3 tests are failing.Claude 帮你写好了代码，交给你，结果 3 个测试没通过。

You paste the errors back, it fixes one thing, breaks another, and you spend the evening as a messenger between Claude and your terminal.你把错误粘贴回去，它修好一个，又弄坏另一个，然后你整个晚上都成了 Claude 和终端之间的传话筒。

Most devs accept this as the workflow.大多数开发者都接受这个工作流程。

The fix is a loop where Claude checks its own work and retries until everything passes, without you in the middle.解决方案是一个循环，让 Claude 自行检查并重试，直到所有步骤通过，无需你介入其中。

**Here's the full setup you need** **👇**以下是您需要的完整设置👇

![图像](https://pbs.twimg.com/media/HKdiLPvXQAA_ZlA?format=jpg&name=large)

## How the loop works循环的工作原理

The default Claude Code flow is a straight line: you ask, Claude writes, Claude stops. Whether it works is your problem.默认的 Claude Code 流程是一条直线：你提问，Claude 编写，Claude 停止。是否有效是你的事。

The loop closes the line into a circle. Claude writes, runs the checks, sees what failed, fixes it, runs the checks again. It only stops in two cases: everything passes, or it hits the retry limit and reports exactly what's still broken.循环将线条闭合为圆圈。Claude 编写代码、运行检查、查看失败项、修复问题、再次运行检查。它只在两种情况下停止：所有检查通过，或达到重试限制并准确报告仍存在的问题。

You go from messenger to reviewer. The setup is 3 files.你从信使变成了审阅者。设置包含 3 个文件。

![图像](https://pbs.twimg.com/media/HKdiWsuXYAAptGY?format=jpg&name=large)

## File 1: the loop protocol in CLAUDE.mdFile 1: CLAUDE.md 中的循环协议

This tells Claude that "done" means "verified", not "written". Drop it in your project root:这告诉 Claude，“完成”意味着“已验证”，而非“已编写”。将其放入你的项目根目录：

```markdown
## Loop protocol

Every task runs as a loop, not a line:

1. Write the change.
2. Run the checks: tests, linter, type checker.
3. If anything fails, read the error, fix the cause, go back to step 2.
4. Repeat up to 5 times.

Stop conditions:
- All checks pass: report "done" with the passing output as proof.
- 5 attempts used: stop and report what still fails and what you tried.
- Same error appears twice in a row: stop. You're guessing, not fixing.

Never report "done" without check output from this session.
Never fix a test by weakening it. Fix the code, not the test.
```

The last line matters most. Without it, Claude eventually "passes" tests by deleting assertions. The loop should improve the code, not the scoreboard.最后一行最为关键。没有它，Claude 最终会通过删除断言来"通过"测试。循环应当改进代码，而非优化计分板。

## File 2: the Stop hook that closes the loop文件 2：用于关闭循环的 Stop 钩子

The protocol asks Claude to check itself. This hook makes it physical. Drop into **.claude/settings.json:**该协议要求 Claude 自我检查。这个钩子使其具象化。放入.claude/settings.json 中：

```json
{
  "hooks": {
    "Stop": [
      {
        "hooks": [
          { "type": "command", "command": "npm test --silent 2>&1 | tail -20" }
        ]
      }
    ],
    "PostToolUse": [
      {
        "matcher": "Write|Edit",
        "hooks": [
          { "type": "command", "command": "npx tsc --noEmit --pretty false 2>&1 | head -10" }
        ]
      }
    ]
  }
}
```

The PostToolUse hook feeds type errors back after every edit, so Claude self-corrects mid-task. PostToolUse 钩子会在每次编辑后反馈类型错误，因此 Claude 能在任务过程中自我修正。

The Stop hook runs the test suite when Claude tries to finish. Failing output goes straight back into the session, and the loop protocol forces another iteration instead of a fake "done".Stop 钩子在 Claude 尝试完成时运行测试套件。失败的输出直接返回会话，循环协议强制进行另一次迭代，而不是虚假的“完成”。

For Python, swap the commands for **pytest -q** and **pyright**. For Rust, **cargo test --quiet** and cargo check.对于 Python，交换 pytest -q 和 pyright 的命令。对于 Rust，则是 cargo test --quiet 和 cargo check。

## File 3: the fixer subagent文件 3：修复子代理

For stubborn failures, a separate agent with fresh eyes beats the 5th retry of a tired session. Drop into **.claude/agents/fixer.md:**对于顽固的错误，让一个全新的代理以全新视角来处理，胜过在疲惫的会话中第五次重试。将其放入 .claude/agents/fixer.md 中：

```yaml
---
name: fixer
description: Invoke when the same test keeps failing after 2 fix attempts. Diagnoses the root cause before touching code.
tools: Read, Edit, Grep, Glob, Bash
model: opus
---

You fix failing checks. You are not allowed to guess.

1. Run the failing check yourself. Read the full error.
2. Read every file in the failure path, end to end.
3. Write one sentence: what is the actual cause.
4. Fix that cause only. No drive-by refactoring.
5. Run the check again. Report before/after output.

Forbidden: deleting tests, loosening assertions, adding try/catch
to silence errors, marking tests as skipped.
```

The main session calls it with [@fixer](https://x.com/@fixer) when the loop stalls. A fresh context window without the baggage of failed attempts solves what retry #4 can't.主会话在循环停滞时通过 @fixer 调用它。一个没有失败尝试包袱的全新上下文窗口，解决了第四次重试无法解决的问题。

![图像](https://pbs.twimg.com/media/HKdi3_4WIAAYXJy?format=jpg&name=large)

## Common mistakes

**No retry limit.** Without "5 attempts max" Claude can burn an hour circling one error. The limit turns an infinite loop into a report.无重试限制。没有“最多尝试 5 次”的限制，Claude 可能会花一个小时围绕一个错误打转。这个限制将无限循环变成了一个报告。

**Tests too slow for the loop.** If the suite takes 90 seconds, each iteration crawls. Point the Stop hook at unit tests, leave integration for CI.

**Letting Claude edit tests during the loop.** The single biggest cheat path. The protocol forbids it, but check diffs for touched test files anyway.

**No "same error twice" rule.** Two identical failures in a row means Claude is guessing. That's the moment for [@fixer](https://x.com/@fixer) or for you, not for retry #3.

## The 5-minute setup

1 minute: copy the loop protocol into CLAUDE.md.

2 minutes: add the hooks to **.claude/settings.json.**

1 minute: create **.claude/agents/fixer.md.**

1 minute: give Claude a real task and watch the loop run: write, fail, fix, pass.

You stop being the messenger between Claude and your terminal. The model didn't get smarter. It just stopped being allowed to quit early.

Thanks for reading!

![图像](https://pbs.twimg.com/media/HKdi8FXXcAAFHqv?format=jpg&name=large)