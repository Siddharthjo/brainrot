# Brainrot Roadmap

**Status: Phase 1 — Studio Foundation (Brand page designed, build starts next session)**

**This roadmap was rewritten June 26, 2026 per Decision #18 (Strategic Pivot to Brainrot Studio V1). The original M0–M8 backend-first roadmap is preserved below as the reference design for Phases 8–12 — it is not discarded, just resequenced to come after the Studio's core workflow is proven.**

---

## Vision

Brainrot Studio is an internal AI Media Operating System built for a single operator (Sid) to manage multiple YouTube Shorts and Instagram Reel brands from one place.

The immediate objective: a complete end-to-end content creation and publishing platform, inspired by FacelessReels' *workflow* (not its feature list), with every page, option, and configuration designed by us. Brainrot is not a SaaS in V1 — it's an internal operating system to run multiple AI content brands.

**Mission test for every decision (unchanged from Decision #13):**
> Brainrot transforms information into high-retention, story-driven short-form videos through modular AI decision layers.

---

## Development Philosophy

FacelessReels is a workflow benchmark, not a feature checklist. For every page:
1. Study the equivalent workflow.
2. Understand its purpose.
3. Design Brainrot's improved version.
4. Decide features, backend requirements, and external providers.
5. Build in Lovable.
6. Connect backend.
7. Test with real data.
8. Freeze. Move to the next page.

**No page is over-designed before being built.** "Frozen" means *frozen enough to build V1* — sufficient to move to the next step, not a perfect final design.

**Core Rule (binding):** every working session must produce a tangible artifact — a working Studio page, a backend endpoint, a successful integration, a rendered or published video, a merged commit. Not just a new plan or document.

---

## M0 — Architecture & Technology Validation (Current, ongoing in background)

Still active in parallel: the renderer benchmark (Creatomate/Shotstack/JSON2Video, see `docs/milestones/M0/`), voice provider, LLM strategy. These feed into Phase 5 (Rendering) and Phase 3 (Creative Configuration) once reached. Not blocking Phase 1.

---

## Phase 1 — Studio Foundation

**Goal:** Build the application shell.

**Pages:** Authentication · Dashboard · Navigation · Global Layout · Settings · Theme · Brand Management

**Outcome:** A usable Brainrot Studio capable of managing multiple brands.

**Status:** Brand Management page designed (`docs/studio/pages/01-brand-page.md`) — frozen enough for V1. Build in Lovable starts next session.

---

## Phase 2 — Brand Configuration

**Goal:** Configure how every content brand behaves.

**Pages:** Create Brand · Brand Profile · Niche · Audience · Platform Selection · Brand Defaults · Brand Templates

**Outcome:** A complete brand configuration workflow.

---

## Phase 3 — Creative Configuration

**Goal:** Design every creative option Brainrot supports, as configurable engines (not fixed presets).

**Pages:** Hook Engine · Story Engine · Visual Engine · Voice Engine · Caption Engine · Audio Engine · Effects Engine · Prompt Configuration

For each: available modes, presets (stored as rows in a presets table — extension point for future AI auto-selection), advanced options, providers, defaults.

**Outcome:** Every creative decision is configurable, and every engine has a hook for future intelligence to plug into without a redesign.

---

## Phase 4 — Content Generation Pipeline

**Goal:** Turn brand configuration into actual content.

**Pages:** Topic Selection · Story Generation · Script Review · Creative Brief · Scene Blueprint · Asset Selection · Preview

**Extension point:** Generation output is stored in the same schema shape Decisions #14–#17 defined for the future Creative Director / Story Visualization Engine, even though V1 populates it with simple prompt-based defaults, not real AI ranking.

**Outcome:** A complete content creation workflow, V1 simple — Phase 9–10 makes it intelligent.

---

## Phase 5 — Rendering Pipeline

**Goal:** Generate production-ready videos.

**Pages:** Renderer Configuration · Render Queue · Rendering Status · History · Failed Jobs

**Feeds from:** M0's renderer benchmark (Decision #19, pending) and the Scene Blueprint → renderer translation layer already scoped in `docs/milestones/M0/M0-creatomate-implementation.md`.

**Outcome:** Videos generate automatically.

---

## Phase 6 — Publishing System

**Goal:** Publish content automatically.

**Pages:** Connected Accounts · Account Manager · Publish Queue · Scheduler · Calendar · Upload History

**Outcome:** Videos publish automatically to YouTube Shorts and Instagram Reels.

---

## Phase 7 — Operations

**Goal:** Manage the entire media operation day to day.

**Pages:** Dashboard · Daily Overview · Active Jobs · Notifications · Queue Monitor · Brand Health

**Outcome:** Brainrot Studio becomes the daily operating tool.

---

## ✅ V1 Complete When

Phases 1–7 done means: **Brand → Configure → Generate → Render → Publish** works end to end, for real, publishing real videos to real accounts. This is the milestone — not feature parity with FacelessReels, not every advanced option built.

**Stop expanding V1 features at this point.** Shift to Phase 8.

---

## Phase 8 — Research Engine *(Reference: original M3, Decision #13 Layer 2)*

Source plugins (Reddit, RSS, News, X, Manual), story discovery, deduplication, scoring. Plugs into the Research page's existing extension point (sources-as-typed-rows).

---

## Phase 9 — Intelligence Engine *(Reference: original M4, Decision #13 Layer 3)*

Hook optimization, script generation, viral scoring. Plugs into Story Generation's existing schema.

---

## Phase 10 — Creative Director *(Reference: original M4, Decision #15)*

Separate layer producing the Creative Brief (tone, pacing, retention strategy) — Decision #15's reasoning for keeping this independent from script generation still applies.

---

## Phase 11 — Learning System *(Reference: original M7, Decision #13 Layer 8)*

Analytics feeding back into Research and Intelligence. Winning hooks, winning styles, performance-driven recommendations.

---

## Phase 12 — Autonomous Optimization *(Reference: original M8 CEO AI + Mode B)*

Mode B (autonomous, Decision #16) becomes viable once Mode A has built trust in the pipeline. Conversational control layer (CEO AI) — last, as originally scoped.

---

## Architecture Reference (Unchanged, Decisions #13–#17)

The 8-layer architecture, Scene Blueprint, and Creative Brief schemas frozen in `docs/03-architecture.md` remain the design target for Phases 8–12. Nothing about *what* gets built there has changed — only *when*.

---

## V0 Origin (Historical)

Original M0–M8 milestone structure (Sources → Research → Intelligence → Creative Director → Story Visualization → Render → Publishing → Analytics → CEO AI, backend-first) is preserved in `/DECISIONS.md` Decisions #13–#17 and `docs/03-architecture.md`. Superseded in ordering by Decision #18, not in substance.

---

Last Updated: June 26, 2026
Status: Phase 1 in progress (Brand page designed, build pending)
