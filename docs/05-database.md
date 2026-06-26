# Brainrot — Database Schema

**Status:** To be designed during M1 (Planning & Architecture)

---

## Will Contain

Full schema for core entities, each cross-referenced with its Pydantic model in `schemas/`:

- `Channel` — niche, platform accounts, brand voice, schedule
- `Story` — raw research item (source, topic, score, status)
- `Script` — generated content (hook, body, version history, approval status)
- `Video` — production output (file ref in R2, duration, status)
- `Analytics` — per-video performance (views, retention, CTR, upload time)
- `Decision` (system) — logged scoring decisions for the learning loop

## Convention

Every table here has a matching schema file in `/schemas/`. Schema changes require updating both in the same PR — see CONTRIBUTING.md.

---

Last Updated: June 26, 2026
