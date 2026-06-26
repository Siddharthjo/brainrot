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



These will be decided during Technology Validation:

- **Video Renderer**: AutoShorts vs StoryShort vs Creatomate
- **Voice Provider**: ElevenLabs vs Google TTS vs Cartesia
- **LLM for Scripts**: GPT-5.5 vs Claude vs Gemini
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
