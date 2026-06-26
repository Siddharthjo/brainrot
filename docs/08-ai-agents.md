# Brainrot — AI Agent Architecture

**Status:** Architecture v1.0 frozen (Decision #13). Full agent specs (prompts, I/O contracts) written per-agent as each milestone starts.

---

## Per-Layer Agent Map

| Layer | Agent | Responsibility | Output | Milestone |
|---|---|---|---|---|
| 1 | Source plugins | Pull raw content (Reddit, RSS, News, X, etc.) | Raw items | M3 |
| 2 | Research Agent | Discover, dedupe, rank, score opportunities | `Candidate Story` | M3 |
| 3 | Intelligence Agent (Script) | Rewrite, hook optimization, narration structure | `Narration Script` | M4 |
| 4 | Creative Director Agent | Tone, pacing, visual mood, ending style, retention strategy | `Creative Brief` | M4 |
| 5 | Story Visualization Agent | Scene split, asset-type selection per scene | `Scene Blueprint` | M5 |
| 6 | Render executor | Calls render provider with the Scene Blueprint | Video file | M5 |
| 7 | Publisher Agent | Uploads & schedules per platform | Published post | M6 |
| 8 | Analytics Agent | Collects performance metrics | Performance record | M7 |
| — | Learning Agent | Feeds Layer 8 data back into Layers 2 & 3 | Updated scoring weights | M7 |
| — | CEO AI | Conversational control over all of the above | Tool calls | M8 |

Each agent doc (written at its milestone) will define: inputs, outputs (per the canonical schemas in `docs/03-architecture.md`), prompt location (`brain/prompts/`), provider used (`brain/providers/`), and done/error contract.

## Why Creative Director Is Separate From the Script Agent

See Decision #15. Tone/pacing/retention-strategy logic needs to evolve independently of script-writing logic — merging them would couple two things that should be improvable on their own timelines.

## Canonical Schemas (cross-agent contract)

Every agent above Layer 6 communicates via `Creative Brief` and `Scene Blueprint`, not raw provider JSON or ad-hoc prompts. Full shape in `docs/03-architecture.md`; Pydantic implementation lands in `schemas/` during M1 (Decision #17).

---

Last Updated: June 26, 2026
