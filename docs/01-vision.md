# Brainrot — Vision

**Status:** Architecture v1.0 frozen June 26, 2026. See `docs/03-architecture.md`.

---

## Mission

> Brainrot transforms information into high-retention, story-driven short-form videos through modular AI decision layers.

This sentence is the test for every future engineering decision. Notice what's absent: Reddit, YouTube, Instagram, stock footage, AI images, Creatomate, GPT. Those are implementation details — swappable behind the architecture, never the point of it.

## What We're Building

Not a video generator. An **AI media operating system** — a small media company where every team member (researcher, writer, creative director, producer, publisher, analyst) is an AI agent, and the founder is the final creative authority.

## The Core Insight

Everyone is competing on "who can generate a better video." Almost nobody is competing on "who decides which story to tell, and how." That decision layer — Research, Intelligence, Creative Direction — is Brainrot's moat. Rendering is a commodity we buy, not build (Decision #6).

## Format vs. Genre — the distinction that shaped the architecture

Production **format** (how a video is made) and content **genre** (what it's about) are different axes. Brainrot locked one format — Narrative Visual Storytelling — that serves many genres (Reddit stories, psychology, history, business, mystery, AI news) through the same pipeline, with only the per-scene asset choice varying. See Decision #14.

## What Success Looks Like (V1)

One YouTube Shorts channel + one Instagram account, fully automated end to end through all 8 architecture layers: research → rank → script → creative direction → scene blueprint → approve (Mode A) → render → publish → measure → learn.

See `docs/00-roadmap.md` for the full V1 success criteria.

## What Success Looks Like (V2+)

Multiple channels, multiple niches, additional production formats (Gameplay, AI Cinematic, Character Dialogue — deferred, not rejected, see `BACKLOG.md`), Mode B (autonomous) once Mode A has built trust in the pipeline, and a CEO AI that runs the whole operation conversationally.

## Non-Negotiable Principles

1. Automation replaces repetition, not judgment. If it needs judgment, the founder does it.
2. Every external provider (video, voice, AI model, source) must be replaceable — Decision #6.
3. Quality compounds, spam doesn't. Mode A (human approval) is the V1 default — Decision #16.
4. The architecture is frozen — Decision #13. Changes require a new decision entry, not drift.
5. Nothing gets added to the repo without belonging to a milestone — see CONTRIBUTING.md.

---

Last Updated: June 26, 2026
