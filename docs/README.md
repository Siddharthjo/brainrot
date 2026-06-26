# Documentation

**All documentation for Brainrot lives here.**

This is the source of truth. If it's not documented, it doesn't exist.

---

## Quick Navigation

### Core Documentation (numbered sequence)

- **[00-roadmap.md](./00-roadmap.md)** — Master roadmap: Brainrot Studio V1 (Phases 1–7), then intelligence layer (Phases 8–12). See Decision #18 for why. The `milestones/M0–M8/` folders below are now reference material for Phases 8–12, not the active sequence.
- **[01-vision.md](./01-vision.md)** — Product vision and goals
- **[02-prd.md](./02-prd.md)** — Product Requirements Document
- **[03-architecture.md](./03-architecture.md)** — System architecture
- **[04-tech-stack.md](./04-tech-stack.md)** — Technology choices
- **[05-database.md](./05-database.md)** — Database schema
- **[06-api.md](./06-api.md)** — API design and endpoints
- **[07-dashboard.md](./07-dashboard.md)** — Frontend/dashboard design
- **[08-ai-agents.md](./08-ai-agents.md)** — AI agent architecture
- **[09-workflows.md](./09-workflows.md)** — End-to-end workflows
- **[10-video-pipeline.md](./10-video-pipeline.md)** — Production pipeline detail
- **[11-decision-log.md](./11-decision-log.md)** — Pointer → canonical [`/DECISIONS.md`](../DECISIONS.md)
- **[12-backlog.md](./12-backlog.md)** — Pointer → canonical [`/BACKLOG.md`](../BACKLOG.md)
- **[13-changelog.md](./13-changelog.md)** — Pointer → canonical [`/CHANGELOG.md`](../CHANGELOG.md)

Most of 01–10 are currently stubs marked "to be written" at their milestone (M1 mostly). They exist now so every doc has a home from day one — see CONTRIBUTING.md's documentation-first rule.

### Brainrot Studio (Active — Phases 1-7)

- **[studio/](./studio/)** — Page-by-page specs for Brainrot Studio, the current focus. See `studio/README.md` for the per-page workflow and `studio/pages/` for individual page specs (e.g., `01-brand-page.md`).

### Milestones (Reference for Phases 8-12)

Each milestone has its own folder in `milestones/M0/` through `milestones/M8/`. Only the current milestone has a full task breakdown; future milestones are intentionally locked/blocked until their turn (see roadmap discipline in `BACKLOG.md`).

Inside each milestone folder: `README.md` (goal, tasks, decisions, demo).

### Reference Folders

- **[architecture/](./architecture/)** — Deep dives into each system component (filled during M1+)
- **[api/](./api/)** — Per-module API documentation (filled during M1+)
- **[channels/](./channels/)** — Per-channel config notes (filled during M2+)
- **[research/](./research/)** — Provider comparisons & findings (active now, M0)
- **[decisions/](./decisions/)** — Long-form decision writeups that back entries in `/DECISIONS.md`
- **[journal.md](./journal.md)** — Daily development log

---

## Documentation Rules

1. **Write for humans** — Assume the reader hasn't seen this project
2. **Update with code** — Docs and code change together
3. **Use Markdown** — All documentation is Markdown
4. **Link everything** — Cross-reference between docs
5. **Be specific** — "Add auth" is vague; "JWT authentication with 24-hour expiration" is clear
6. **One canonical home per fact** — Decisions live in `/DECISIONS.md`, not copied elsewhere. Backlog lives in `/BACKLOG.md`. Don't duplicate.

---

## Adding New Documentation

When you add a new feature or make a decision:

1. Update the relevant milestone doc
2. Update `/DECISIONS.md` if it's architectural
3. Update the relevant numbered doc (01–10) if it affects system design
4. Update `docs/api/` if it adds endpoints
5. Add a note to `journal.md`

---

## Current File Structure

```
docs/
├── 00-roadmap.md              # Master roadmap (live)
├── 01-vision.md                # Vision (stub → M1)
├── 02-prd.md                   # PRD (stub → M1)
├── 03-architecture.md          # Architecture (stub → M1)
├── 04-tech-stack.md            # Tech stack (live, partially locked)
├── 05-database.md              # DB schema (stub → M1)
├── 06-api.md                   # API design (stub → M1)
├── 07-dashboard.md             # Dashboard design (stub → M1/M2)
├── 08-ai-agents.md             # Agent architecture (stub → M1/M4)
├── 09-workflows.md             # Workflows (stub, fills in per milestone)
├── 10-video-pipeline.md        # Video pipeline (stub → M0/M5)
├── 11-decision-log.md          # Pointer → /DECISIONS.md
├── 12-backlog.md               # Pointer → /BACKLOG.md
├── 13-changelog.md             # Pointer → /CHANGELOG.md
│
├── architecture/                # Component deep-dives (empty → M1+)
├── api/                         # Per-endpoint docs (empty → M1+)
├── channels/                    # Per-channel config notes (empty → M2+)
├── research/                    # Provider/tech findings (active now)
├── decisions/                   # Long-form decision writeups
│
├── milestones/
│   ├── M0/  ... M8/             # One folder per milestone
│
├── journal.md                   # Daily dev log
└── README.md                    # This file
```

---

Last Updated: June 26, 2026
