# storage/

**Local working storage for development. Never committed.**

Production assets (final videos, audio, images) live in Cloudflare R2 (see Decision #8). This folder is purely for local dev convenience and is fully gitignored.

## Subfolders

- **`temp/`** — Scratch space for in-progress renders, downloads, intermediate files. Safe to delete anytime.
- **`cache/`** — Cached API responses (research results, LLM calls) to avoid redundant calls during local development.
- **`generated/`** — Local copies of generated scripts/videos/thumbnails before upload to R2, for inspection during dev.
- **`logs/`** — Local application logs (structured JSON, see Decision #10) when not shipping to a log aggregator.

## Rule

Nothing in `storage/` is backed up, versioned, or production-critical. If it matters, it goes to R2 or Postgres — not here.

**Status:** Empty by design. All subfolders gitignored except their `.gitkeep`.
