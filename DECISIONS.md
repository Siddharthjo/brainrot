# Decisions Log

Every important architectural and technology decision is recorded here.

When in doubt about why something was chosen, check this document first.

---

## Decision #1

**Topic**: Architecture Pattern

**Chosen**: Layered architecture with service layer abstraction

**Reason**:
- Separates concerns (API, business logic, data)
- Makes testing easier (can mock services)
- Allows provider swapping (critical requirement)

**Date**: June 26, 2026

**Status**: Active

---

## Decision #2

**Topic**: Backend Framework

**Chosen**: FastAPI (not Django or others)

**Reason**:
- Async support (critical for long-running tasks)
- Excellent OpenAPI documentation
- Python ecosystem for AI integrations
- Lower overhead than Django

**Alternatives Considered**:
- Django (too heavyweight)
- Flask (too minimal)
- Node.js (Python ecosystem needed)

**Date**: June 26, 2026

**Status**: Active

---

## Decision #3

**Topic**: Database

**Chosen**: PostgreSQL (not MongoDB or Firebase)

**Reason**:
- Relational data structure (channels, videos, scripts)
- JSON support for flexible fields
- Excellent for analytics queries
- Mature, production-ready

**Alternatives Considered**:
- MongoDB (schema-less but harder to query)
- Firebase (not suitable for relational data)
- SQLite (not suitable for multi-worker setup)

**Date**: June 26, 2026

**Status**: Active

---

## Decision #4

**Topic**: Frontend Framework

**Chosen**: React with Lovable (not Vue or Svelte)

**Reason**:
- Lovable enables rapid UI development
- React component ecosystem is largest
- Can export to standalone React later if needed
- Excellent for dashboards

**Alternatives Considered**:
- Vue (smaller ecosystem)
- Svelte (less mature)
- Next.js (too opinionated for this use)

**Date**: June 26, 2026

**Status**: Active

---

## Decision #5

**Topic**: Job Queue

**Chosen**: Celery + Redis (not others)

**Reason**:
- Industry standard for Python async tasks
- Redis is lightweight and fast
- Works well with FastAPI
- Good monitoring tools (Flower)

**Alternatives Considered**:
- RQ (smaller feature set)
- APScheduler (not suitable for distributed jobs)
- AWS Lambda (cost at scale)

**Date**: June 26, 2026

**Status**: Active

---

## Decision #6

**Topic**: Provider Abstraction

**Chosen**: Every external service has an abstraction layer

**Reason**:
- Video APIs change (StoryShort, AutoShorts, Creatomate)
- LLM providers improve (OpenAI → Claude → future)
- Keeps codebase vendor-independent

**Example**:
```python
# Never this:
response = openai.ChatCompletion.create(...)

# Always this:
response = ai_provider.generate_script(...)
# ai_provider can be OpenAI, Claude, Gemini, local model
```

**Date**: June 26, 2026

**Status**: Active (Non-negotiable)

---

## Decision #7

**Topic**: Authentication

**Chosen**: JWT + FastAPI Users (not OAuth only)

**Reason**:
- Simple for single-user/small team
- Can add OAuth later without changing core
- FastAPI Users handles all boilerplate

**Date**: June 26, 2026

**Status**: Active

---

## Decision #8

**Topic**: Storage

**Chosen**: Cloudflare R2 (not AWS S3 or others)

**Reason**:
- Lower cost than S3
- S3-compatible (easy migration if needed)
- Good performance
- Includes bandwidth

**Alternatives Considered**:
- AWS S3 (more expensive)
- Google Cloud Storage (also expensive)
- Backblaze B2 (R2 has better ergonomics)

**Date**: June 26, 2026

**Status**: Active (can change to S3 if needed)

---

## Decision #9

**Topic**: API Versioning

**Chosen**: URL path versioning (`/api/v1/`, `/api/v2/`)

**Reason**:
- Easy to maintain multiple versions
- Clear in documentation
- Prevents breaking changes

**Date**: June 26, 2026

**Status**: Active

---

## Decision #10

**Topic**: Logging

**Chosen**: Structured logging (JSON format)

**Reason**:
- Machine-readable
- Works well with monitoring tools
- Searchable
- Context from external integrations

**Date**: June 26, 2026

**Status**: Active

---

## Decision #11

**Topic**: Testing Strategy

**Chosen**: Unit + Integration tests (not E2E automation for now)

**Reason**:
- Unit tests catch logic errors early
- Integration tests catch API issues
- E2E takes too long to run
- Can add E2E later if needed

**Target**: >80% coverage on critical paths

**Date**: June 26, 2026

**Status**: Active

---

## Decision #12

**Topic**: Repository Structure — Round 2 (post-initial-scaffold review)

**Chosen**: Add `brain/`, `config/`, `storage/`, `schemas/`, `experiments/`; retire `assets/` in favor of `branding/`

**Reason**:
- **`brain/`** — AI agent logic (Research, Script, Production, Publisher, CEO AI, etc.) needs a home separate from `backend/`. Backend stays thin (HTTP/auth/DB); `brain/` holds everything that calls an LLM or makes a decision.
- **`config/`** — Channel settings, model selection, scoring weights are data that changes per-channel/environment, not code. Keeping it as YAML/JSON in `config/` instead of hardcoded in Python prevents `if channel == "x"` branching logic from spreading through the codebase.
- **`storage/`** — Local dev needs scratch space for temp files, cached API responses, and local log inspection — separate from production storage (R2, see Decision #8) and fully gitignored.
- **`schemas/`** — Core entities (Channel, Video, Script, Story, Analytics) were at risk of being redefined slightly differently in the API layer, the worker, and the agent that produces them. One schema file per entity, imported everywhere, prevents drift.
- **`branding/` (replaces `assets/`)** — `assets/` implied Brainrot stores media (stock footage, generated video). It doesn't — see Decision #6 (provider abstraction) and the system principle that Brainrot owns the brain, not the renderer. `branding/` makes that explicit: logos, icons, UI assets only.
- **`experiments/`** — Untested prompts/providers/models need a place to live that's explicitly not production code, so trying something new doesn't risk the working pipeline.

**Consequence**: Established the rule that nothing is added to the repository without belonging to a milestone — backlogged ideas go to `/BACKLOG.md`, not into ad-hoc folders or code.

**Date**: June 26, 2026

**Status**: Active

---

## Decision #13

**Topic**: Architecture v1.0 — Freeze

**Chosen**: Lock the 8-layer architecture (Sources → Research Engine → Intelligence Engine → Creative Director → Story Visualization Engine → Render Engine → Publishing Engine → Analytics Engine) as Brainrot's stable foundation.

**Reasoning**:
- Reached through extended M0 discussion that started as "which video format" and converged on a stronger insight: format and genre are different axes, and the real architecture is source-agnostic, format-agnostic at the content layer, and only vendor-specific at the edges (sources, renderer, publishing platforms).
- Every layer maps to one of Brainrot's two moats (Research, Intelligence) or is a thin, replaceable executor (Render, Publishing) — no layer is both important AND vendor-locked.
- Mission statement adopted to test all future decisions: "Brainrot transforms information into high-retention, story-driven short-form videos through modular AI decision layers." Deliberately excludes any platform, provider, or source name.

**Consequence**: From this point forward, "should this layer exist" is not an open question. Changes to the architecture itself require a new decision entry here, not silent drift as features get added. Full detail in `docs/03-architecture.md`.

**Date**: June 26, 2026

**Status**: Active (Frozen v1.0)

---

## Decision #14

**Topic**: Production Format — Narrative Visual Storytelling (renamed from "Documentary")

**Chosen**: One production format for V1, defined as scene-based narration with frequent visual changes, dynamic captions, and per-scene asset selection — not locked to stock footage, AI images, or any single asset source.

**Reasoning**:
- Started as "Documentary" after a multi-tier Production Format Engineering Report (see `docs/research/`) comparing Documentary, Gameplay, AI Cinematic, Motion Graphics, Slideshow, and AI Avatar across automation difficulty, cost, licensing, and long-term viability. Documentary won on every dimension that matters: fits all 4 launch channels, no borrowed IP, no gameplay-footage licensing questions, best aligned with YouTube's monetization requirement for original commentary/editing.
- Renamed because "Documentary" carries an unwanted mental model (BBC-style slow B-roll, logos, charts, news-anchor pacing) that would have biased implementation toward exactly the slow, corporate-feeling content this format isn't meant to produce.
- Reddit Stories, Psychology, History, Business, Mystery, AI News are **genres** (content strategy, M3/M4 concern), not separate production formats. One pipeline serves all of them; only the per-scene asset type changes.
- Considered and explicitly deferred to `BACKLOG.md`: Gameplay background, AI-generated cinematic (Veo/Kling/Runway), Image slideshow, AI Avatar/character-voice formats. Not rejected — postponed until the core platform is proven with V1.

**Date**: June 26, 2026

**Status**: Active

---

## Decision #15

**Topic**: Creative Director — Separate Layer (not merged into Intelligence Engine)

**Chosen**: Creative Director is its own layer/agent between Intelligence Engine and Story Visualization Engine, producing a distinct `Creative Brief` output.

**Reasoning**:
- Merging into Intelligence Engine saves one LLM call per video, but couples script-writing logic to tone/pacing/retention-strategy logic. These need to evolve independently — a future change to retention strategy shouldn't require touching how scripts get written, and vice versa.
- The extra cost is acceptable because this layer is directly responsible for final video quality (tone, pacing, visual mood, ending style) — it's not overhead, it's where a meaningful share of Brainrot's output quality comes from.

**Date**: June 26, 2026

**Status**: Active

---

## Decision #16

**Topic**: Human Approval — Configurable Checkpoint, Not a Fixed Stage

**Chosen**: Two operating modes, switchable per channel:
- **Mode A (Creator, default for V1):** approval happens after the Scene Blueprint (Story Visualization output), before any render credits are spent.
- **Mode B (Autonomous, future):** no approval step — Research through Publish runs end to end.

**Reasoning**: Approving a script in the abstract doesn't reveal whether pacing/visuals will actually work; approving the full Scene Blueprint shows what the video will actually look like before spending money on rendering. The checkpoint is implemented as a configurable flag in the pipeline, not hardcoded to one stage, so Mode B doesn't require architectural changes later — only flipping the flag once trust in the pipeline is established.

**Date**: June 26, 2026

**Status**: Active

---

## Decision #17

**Topic**: Canonical Internal Schemas — Creative Brief & Scene Blueprint

**Chosen**: Two schemas are the system's internal language. Every layer communicates through these — never raw provider JSON, never ad-hoc prompts passed directly between layers.
- **Creative Brief** (Creative Director output → Story Visualization input): tone, emotion, energy, visual_language, hook_style, ending, target_duration, audience.
- **Scene Blueprint** (Story Visualization output → Render Engine input): per-scene purpose, narration, emotion, duration, asset_type, asset_prompt, camera, transition, caption_style, sound_effects.

**Reasoning**: The Scene Blueprint in particular is Brainrot's core IP — it's the structured representation of "how this story should be told visually," independent of which renderer executes it. Every downstream consumer (renderer, analytics, future A/B testing) reads from this schema, which is what makes the Render Engine swappable without touching anything above it.

**Consequence**: `schemas/creative_brief.py` and `schemas/scene_blueprint.py` become two of the first files written in M1 — the shape is defined now (see `docs/03-architecture.md`), the Pydantic implementation follows during schema design.

**Date**: June 26, 2026

**Status**: Active

---

## Decision #18

**Topic**: Strategic Pivot — Brainrot Studio V1 (Vertical Slice, Studio-First)

**Chosen**: V1 is no longer "build the 8-layer intelligence architecture, then add a UI." V1 is **Brainrot Studio** — an internal AI Media Operating System for a single operator, explicitly benchmarked against FacelessReels' workflow (not its feature list), built as a complete vertical slice:

```
Brand → Configure → Generate → Render → Publish
```

Studio Phases 1–7 (Foundation, Brand Management, Creative Configuration, Content Pipeline, Rendering, Publishing, Analytics) ship first. The intelligence layer frozen in Decisions #13–#17 (Research Engine, Intelligence Engine, Creative Director, Story Visualization Engine, Learning Loop) is **not discarded** — it becomes Phases 8–12, built *after* the Studio reliably publishes real content, not before.

**Reasoning**:
- A working, demoable product within weeks is worth more right now than a theoretically superior architecture with nothing to click on. The original plan's biggest risk was "all planning, no shipped artifact" — this was observed repeatedly across the same session (the Development Philosophy document, multiple roadmap rewrites) before this decision was made.
- FacelessReels already proves the underlying workflow (brand setup → configure → generate → publish) is commercially viable. Re-deriving and shipping that loop first, with Brainrot's own UX and configuration depth, is lower-risk than building the harder, unproven intelligence layer first with no way to validate it end-to-end.
- **Explicit counter-argument, recorded for the record:** this defers Brainrot's actual differentiation (research/ranking/learning — the thing competitors can't easily copy) to last, not first. V1 risks being a nicer-looking FacelessReels clone if Phases 8–12 are delayed indefinitely. This risk was raised directly and is accepted knowingly, not overlooked — see the Core Rule below as the safeguard against indefinite delay.
- **Resolution adopted to mitigate that risk (per CTO's "Option C" framing):** every Studio page is designed with extension points — presets stored as rows in a database table rather than hardcoded dropdown values, sources stored as typed rows rather than hardcoded form sections, generation output stored in the same schema shape a future Creative Director would eventually populate. This means Phases 8–12 plug into existing pages later without a UI redesign, even though V1 only ever populates these structures with simple defaults.

**Consequence**:
- `docs/00-roadmap.md` is rewritten. The original M0–M8 structure is preserved as the **reference design for Phases 8–12**, not deleted — Decisions #13–#17 (8-layer architecture, Scene Blueprint, Creative Brief, Creative Director separation, Mode A/B checkpoint) remain valid and will be implemented when Phase 8 starts.
- New development workflow per page (see CONTRIBUTING.md): study the equivalent workflow → understand its purpose → design Brainrot's improved version → decide features/backend/providers → build in Lovable → connect backend → test → freeze → next page. No page is over-designed before being built.
- **New Core Rule, binding from this point forward: every working session must produce a tangible artifact** (a working Studio page, a backend endpoint, a successful integration, a rendered or published video, a merged commit) — not just a new plan, framework, or document. If a session produces only a better plan, that plan's necessity should be questioned before producing it.
- FacelessReels is explicitly a **workflow benchmark, not a feature checklist** — Brainrot does not copy borrowed-IP features (character art styles) or fixed niche presets; it generalizes each page into a configurable engine (Visual Engine, Voice Engine, Caption Engine, Hook Engine) that any brand can configure differently.

**Date**: June 26, 2026

**Status**: Active — supersedes the phase ordering (not the architecture) of Decisions #13–#17

---



These will be decided during Technology Validation:

- **Video Renderer**: Creatomate vs Shotstack vs JSON2Video (desk research narrowed; hands-on test pending — see `docs/research/M0-video-providers.md`)
- **Voice Provider**: ElevenLabs vs Google TTS vs Cartesia vs PlayHT
- **LLM Strategy**: which model serves which layer (Research, Intelligence, Creative Director, Script Review, CEO AI) — see `docs/research/technology-decision-matrix.md`
- **Deployment Platform**: TBD

---

## Decision Template

When making a new decision:

```
Decision #[N]

Topic: [What is this about?]

Chosen: [What did we choose?]

Reason:
- [Why this is good]
- [Why this is better than alternatives]

Alternatives Considered:
- [Alternative 1] (why not)
- [Alternative 2] (why not)

Date: [Date]

Status: [Active / Deprecated / Review]
```

---

Last Updated: June 26, 2026
