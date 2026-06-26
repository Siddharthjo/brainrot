# Brainrot — Database Schema

**Status:** To be designed during M1 (Planning & Architecture)

---

## Will Contain

Full schema for core entities, each cross-referenced with its Pydantic model in `schemas/`:

- `Channel` — niche, platform accounts, brand voice, schedule
- `Story` — raw research item (source, topic, score, status) — Layer 2 output
- `Script` — generated narration content (hook, body, version history, approval status) — Layer 3 output
- `CreativeBrief` — tone, pacing, visual mood, retention strategy — Layer 4 output (Decision #17)
- `SceneBlueprint` — per-scene purpose, asset_type, asset_prompt, transitions, captions — Layer 5 output, Brainrot's canonical IP (Decision #17)
- `Video` — render output (file ref in R2, duration, status) — Layer 6 output
- `Analytics` — per-video performance (views, retention, CTR, upload time) — Layer 8
- `Decision` (system) — logged scoring decisions for the learning loop

See `docs/03-architecture.md` for what each layer does and why these two schemas (`CreativeBrief`, `SceneBlueprint`) are the system's canonical internal language.

## Convention

Every table here has a matching schema file in `/schemas/`. Schema changes require updating both in the same PR — see CONTRIBUTING.md.

---

Last Updated: June 26, 2026
