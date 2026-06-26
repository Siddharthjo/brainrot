# Brainrot — System Architecture v1.0

**Status:** 🔒 FROZEN — June 26, 2026

**Mission statement (test every future decision against this):**

> Brainrot transforms information into high-retention, story-driven short-form videos through modular AI decision layers.

Nothing platform-specific (YouTube, Instagram), provider-specific (Creatomate, GPT), or source-specific (Reddit, RSS) appears in that sentence on purpose. Those are implementation details, swappable behind the layers below. If a proposed change can't be justified against this sentence, it doesn't belong in v1.0 — it goes to `BACKLOG.md`.

---

## What "Frozen" Means

The 8 layers below do not get redesigned as features get added. Future engineering discussions answer **"how does this fit the existing architecture?"** — not "should this layer exist?" Changes to the architecture itself require a new numbered entry in `/DECISIONS.md`, not silent drift.

This is an architecture freeze, not an implementation milestone. No code has been written against this yet — see `docs/milestones/M0/` for current implementation status.

---

## The 8 Layers

```
Layer 1 — Sources
        ↓
Layer 2 — Research Engine
        ↓
Layer 3 — Intelligence Engine
        ↓
Layer 4 — Creative Director
        ↓
Layer 5 — Story Visualization Engine
        ↓
Layer 6 — Render Engine
        ↓
Layer 7 — Publishing Engine
        ↓
Layer 8 — Analytics Engine
        ↓
   (feeds back into Layer 2 & 3)
```

---

### Layer 1 — Sources

Brainrot never cares where information comes from. Sources are plugins, nothing more.

```
Reddit | RSS | News | Research Papers | X | Blogs | Manual Input | Future Sources
```

A Reddit story is not a production format — it's a content source. The same downstream pipeline (Research → Intelligence → Creative Director → Visualization → Render) handles a Reddit thread, a Hacker News post, a psychology study, or a startup-failure case study identically. Only the source plugin differs.

**Lives in:** `brain/agents/research/sources/`

---

### Layer 2 — Research Engine *(Moat #1)*

**Responsibilities:** discover topics, deduplicate, rank stories, detect trends, verify information where appropriate, score opportunities.

**Output:** `Candidate Story`

**Lives in:** `brain/agents/research/`, M3

---

### Layer 3 — Intelligence Engine *(Moat #2)*

**Responsibilities:** rewrite, improve hooks, optimize for retention, choose storytelling structure, build the narration script.

**Output:** `Narration Script`

**Lives in:** `brain/agents/intelligence/`, M4

---

### Layer 4 — Creative Director

**Decision:** separate layer from Intelligence, not merged. One extra LLM call per video is an acceptable cost because this layer is directly responsible for the quality of the final video, and it needs to evolve independently of script generation — a future change to retention strategy or tone modeling shouldn't require touching how scripts are written.

**Responsibilities:** decide emotional tone, story arc, pacing, visual mood, ending style, retention strategy.

**Output:** `Creative Brief` (see schema below)

**Lives in:** `brain/agents/creative_director/`, M4

---

### Layer 5 — Story Visualization Engine

*(Renamed from "Visual Engine" → "Production Engine" → "Story Visualization Engine" over the course of M0 discussion. Final name, locked.)*

Not "Visual Engine" because the job isn't creating visuals — it's translating a story into visual language. Not "Production Engine" because production implies rendering, and this layer explicitly does not render.

**Responsibilities:** take the Narration Script + Creative Brief, split into scenes, determine emotional intensity per scene, determine pacing, determine visual purpose, choose asset type per scene, generate the scene-by-scene blueprint.

**It does not generate video. It produces a blueprint.**

**Output:** `Scene Blueprint` (see schema below) — **this is Brainrot's canonical internal language and its core IP.**

**Production format:** Narrative Visual Storytelling (locked — see Decision below). Narration-driven, scene-based, dynamic captions, fast pacing, frequent visual changes. Asset type (AI illustration, stock footage, motion graphic, light animation) is chosen **per scene, per genre** — not fixed globally. A psychology video might use AI body illustration; a mystery story might use dark AI artwork; a business story might use motion graphics. Same engine, different asset choices — this is config/data, not a different production pipeline.

**Lives in:** `brain/agents/story_visualization/`, M5 (formerly "Production Engine" in earlier roadmap drafts)

---

### Layer 6 — Render Engine

The renderer doesn't think. It executes the Scene Blueprint.

Today: Creatomate, Shotstack (under evaluation, M0-T01).
Tomorrow: whatever the best provider is.

This is the layer most exposed to vendor churn (see Decision #6 — provider abstraction). If a new AI/render provider appears in 2028 and everyone switches, **only this layer changes.** Every layer above it is untouched, because they all speak Scene Blueprint, not any specific renderer's API.

**Lives in:** `brain/providers/video/`, M5

---

### Layer 7 — Publishing Engine

Platform adapters. YouTube, Instagram now; TikTok, X, Facebook later — each is an adapter behind the same internal publish interface, not a special case.

**Lives in:** `brain/agents/publishing/`, M6

---

### Layer 8 — Analytics Engine

Collects CTR, retention, views, shares, saves, RPM (where available), growth. Feeds everything back into Layer 2 (Research) and Layer 3 (Intelligence) — this is the learning loop.

**Lives in:** `brain/agents/analytics/`, M7

---

## Human Approval — Configurable Checkpoint, Not a Fixed Point

Brainrot supports two operating modes. The checkpoint is configurable per-channel, not hardcoded to one stage:

**Mode A — Creator** (default for V1):
```
Research → Script → Creative Direction → Scene Blueprint → WAIT → Approve → Render
```
You see the full storyboard (Scene Blueprint) before any rendering credits are spent.

**Mode B — Autonomous** (future, large-scale automation once trust is established):
```
Research → Everything → Render → Publish
```
No approval step.

The architecture doesn't bake in a single approval point — it has a checkpoint flag that can sit anywhere in the pipeline, defaulting to "after Layer 5, before Layer 6" in Mode A.

---

## Canonical Schemas

Two schemas are the system's internal language. Every layer communicates through these — not raw provider JSON, not ad-hoc prompts between layers.

### Creative Brief (Layer 4 output → Layer 5 input)

```yaml
tone: mysterious
emotion: curiosity
energy: high
visual_language: dark
hook_style: shocking
ending: cliffhanger
target_duration: 35s
audience: 18-30
```

### Scene Blueprint (Layer 5 output → Layer 6 input)

```yaml
video:
  title:
creative:
  mood:
  pacing:
  audience:
scene_1:
  purpose:        # e.g. shock, explain, emotional beat, reveal
  narration:
  emotion:
  duration:
  asset_type:     # ai_illustration | stock_footage | motion_graphic | animation
  asset_prompt:
  camera:
  transition:
  caption_style:
  sound_effects:
scene_2:
  ...
```

Both schemas get formal Pydantic definitions in `schemas/creative_brief.py` and `schemas/scene_blueprint.py` during M1 — this document defines the *shape and intent*, M1 defines the *implementation*. Every downstream consumer (renderer, analytics, future A/B testing) reads from these schemas, not from a provider's native format.

---

## Why This Architecture Survives Provider Churn

Layers 1, 6, and 7 are the only layers that touch third-party vendors directly (sources, renderer, publishing platforms). Layers 2–5 and 8 are pure Brainrot logic, speaking only in Brainrot's own schemas. A renderer disappearing (see the Sora shutdown, April 2026 — `docs/research/M0-video-providers.md`) or a new source appearing only ever touches one layer. This is Decision #6 (provider abstraction) applied consistently across the entire pipeline, not just the video renderer.

---

## Related

- `docs/08-ai-agents.md` — Agent-specific detail per layer
- `docs/10-video-pipeline.md` — Render Engine detail (pending M0-T01 finalization)
- `docs/research/M0-video-providers.md`, `docs/research/technology-decision-matrix.md` — current M0 status, separate from this freeze
- `/DECISIONS.md` — Decisions #13–#16 cover this freeze in detail

---

Last Updated: June 26, 2026
Architecture Version: 1.0 (Frozen)
