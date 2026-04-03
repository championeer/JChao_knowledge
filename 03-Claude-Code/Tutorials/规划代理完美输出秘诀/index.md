---
title: "I stole Anthropic's internal cheat code for getting perfect Claude outputs on the first try"
source: "https://x.com/itsolelehmann/status/2037481298978099461"
author:
  - "[[Ole Lehmann]]"
published: 2026-03-27
created: 2026-03-27
description: "#TruthSeeker #INTJ #AI #ChinaData #Founder"
tags:
  - "clippings"
---
Anthropic's engineers just revealed the exact method they use to get perfect output from Claude. I adapted it into a free skill. After reading this, you'll almost never have to edit Claude's output again.

The problem: Every time you have to edit Claude's output, you're wasting time fixing a decision **Claude guessed wrong.**

Anthropic's own engineers had the same issue and came up with a deceptively simple fix: **just stop editing the output.**

Instead, **control the input** by creating a **"planner agent."**

I dug into [their research](https://www.anthropic.com/engineering/harness-design-long-running-apps) and adapted the method for all outputs (not just code).

It gets Claude to expand your prompt into a full spec (the way Anthropic's planner does), then interview you on the exact decisions it would otherwise guess at, before it starts building.

2 minutes of planning and interviewing upfront saves you the entire back-and-forth editing cycle on the back end.

**Which gives you hours back every week to focus on stuff that actually moves the needle.**

Let me explain how it works, and why it makes the outputs 10x better:

P.S. If you want a new AI workflow like this in your inbox every week (so you spend less time editing Claude and more time on the work that actually grows your business), join 35k readers here: [aisolo.beehiiv.com/subscribe](https://aisolo.beehiiv.com/subscribe)

## Why Claude falls short (even when you're doing everything right)

Most of you aren't typing lazy one-line prompts.

You've probably got skills set up, you paste in context, you give Claude a real brief.

And the output comes back pretty good. Maybe 70% of the way there.

But to create anything, Claude needs answers to a bunch of questions you never explicitly answered.

- Who exactly is this for? What's the main objection?
- What's the emotional arc? What's the one result you can promise?

Your prompt covered some of those. Your context files covered a few more.

Claude guessed the rest, silently, and it guessed toward the middle.

It's like telling a chef "I want pasta, here's some ingredients I bought, I like Italian food."

Decent brief.

But the chef still has to guess: red sauce or cream? How spicy? Light and fresh or rich and heavy?

The meal comes back fine, but you keep sending it back: "less cream, more garlic, actually make it spicier."

**That's the editing cycle.** The output was 70% there because 70% of the decisions were right.

The other 30% were assumptions, and those assumptions are exactly where the output falls flat.

Anthropic's own engineers hit the exact same wall.

Last week they quietly published an internal engineering document about how their team gets better results from Claude.

Their fix was dead simple: stop fixing the output. Control the input instead.

## The fix: a planner step before Claude builds anything

Before Claude builds anything, a separate agent expands the short prompt into a full plan: scope, dependencies, audience, design language, the works.

**One engineer gave Claude a single sentence:** "Create a 2D retro game maker with features including a level editor, sprite editor, entity behaviors, and a playable test mode."

The planner turned that into a **16-feature spec across 10 build phases.** All from one sentence.

1. The version without the planner produced a game with broken physics that couldn't be played.
2. The version with it produced a polished app with working gameplay.

Their key finding:

**Controlling the input produces better results than fixing the output.**

And this lesson applies to anything you build with AI, not just code.

So I took their concept and added the part that actually matters for anything you're creating:

Instead of guessing at a better plan, Claude finds the specific gaps and asks you directly.

## I built a skill that does the planning for you

The skill is called **the-interviewer.**

You tell Claude to build something and it triggers automatically (basically in every session), doing 3 things before any production begins:

1. **Expands your prompt into a full spec.** The Anthropic method. Claude reads your context files and builds the most ambitious version outline of your request: every section defined with its strategic purpose. Then it shows you the whole thing before moving on.
2. **Interviews you on the gaps.** The part Anthropic's planner skips. Instead of guessing at whatever it couldn't resolve from context, it asks you directly. For each question, it proposes a recommended answer so you're tweaking rather than generating from scratch. It keeps going until every gap is filled.
3. **Builds a brief and creates.** Assembles everything into a creative brief and writes from that.

The whole thing takes only a few minutes.

## How to set it up

1. Download the skill from GitHub [here](https://github.com/olelehmann100kMRR/interview-skill).
2. Paste the file into Claude (Cowork or Claude Code) and say "add this as a skill."
3. Tell Claude to create something. The skill triggers automatically, runs the interview, builds the brief, and cooks.

It works for landing pages, newsletters, email sequences, presentations, course outlines, proposals, anything you're asking Claude to build from a prompt.

## Go try it

Drop it in and tell Claude to create something you're actually working on this week.

2 minutes of answering questions saves potentially endless editing.

**That's hours back every week you can spend on the work that actually grows your business.**

P.S. I'm hosting an in-depth Claude Cowork workshop soon, where I'll teach you how to leverage it to get the output of a $500k/year marketing team.

180 people joined last time.

You can pre-register to reserve a spot here (no payment needed): [https://tally.so/r/LZbxKl](https://tally.so/r/LZbxKl)