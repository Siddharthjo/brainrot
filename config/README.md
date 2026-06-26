# config/

**All configuration as data, not code.**

If a value might change between environments, channels, or experiments, it belongs here as YAML/JSON — not hardcoded in Python.

## Subfolders

- **`models/`** — Which AI model is used for which task (research, scripting, review, image understanding) and fallback order.
- **`providers/`** — Provider-specific config (rate limits, API base URLs, default voice IDs) — secrets stay in `.env`, never here.
- **`channels/`** — Per-channel settings: niche, posting schedule, brand voice, target audience. One file per channel.
- **`prompts/`** — Prompt selection config (which prompt version is active per agent) — the prompts themselves live in `brain/prompts/`.
- **`defaults/`** — System-wide defaults (scoring weights, retry counts, timeouts) used when no channel-specific override exists.

## Rule

If you're tempted to write `if channel == "story_vault": ...` in code, that's a sign the value belongs in `config/channels/story_vault.yaml` instead.

**Status:** Empty until M2 (Foundation). Structure established now.
