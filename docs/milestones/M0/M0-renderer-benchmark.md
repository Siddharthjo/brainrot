# M0-T01 — Renderer Benchmark: Methodology & Scoring Rubric

**Status:** Ready to execute. Replaces the original generic "same test script across providers" plan with a weighted, objective benchmark.

**Rule:** Same input, three outputs. The benchmark script (`M0-benchmark-script.md`) does not get adapted to flatter any provider. If an API genuinely can't express something the Scene Blueprint asks for, that's a finding — log it as a limitation, don't quietly change the script to dodge it.

**Once scored, the decision is locked** (Decision #18). M0's goal is reducing uncertainty, not finding a theoretically perfect provider — this benchmark runs once.

---

## Scoring Rubric

| Criterion | Weight | What to look for |
|---|---|---|
| Ease of API integration | 20% | SDK quality, documentation clarity, auth flow, time-to-first-render |
| Template flexibility | 20% | Dynamic scenes, variables, animations, how cleanly it maps to Scene Blueprint's per-scene fields |
| Visual quality | 20% | Typography, transitions, overall polish of the rendered output |
| Render speed | 10% | Wall-clock time from API call to finished, downloadable video |
| Reliability | 10% | Failed renders, retries needed, consistency across repeated runs |
| Cost | 10% | Actual cost for this specific ~50s video, at this resolution |
| Scalability | 10% | Rate limits, queue behavior, concurrency support at 1-3 videos/day volume |

**Scoring:** 1–10 per criterion per provider. Weighted total out of 10. Highest weighted total wins — no override unless a criterion reveals a hard blocker (e.g., the API genuinely cannot render a required Scene Blueprint field at all), in which case that's disqualifying regardless of score.

---

## Workflow

1. ✅ Benchmark script written (`M0-benchmark-script.md`) — one Scene Blueprint, fixed.
2. Implement it in Creatomate (template + `modifications` API call).
3. Implement the *same* blueprint in Shotstack (JSON timeline).
4. Implement the *same* blueprint in JSON2Video (JSON payload).
5. Score each against the rubric above. Record in the comparison table below.
6. Lock Decision #18. Move to M0-T02 (Voice Provider). Don't revisit unless a later requirement genuinely forces it.

---

## Comparison Table (fill in after running the benchmark)

| Criterion | Weight | Creatomate | Shotstack | JSON2Video |
|---|---|---|---|---|
| API integration | 20% | | | |
| Template flexibility | 20% | | | |
| Visual quality | 20% | | | |
| Render speed | 10% | | | |
| Reliability | 10% | | | |
| Cost (this video) | 10% | | | |
| Scalability | 10% | | | |
| **Weighted Total** | 100% | | | |

**Hard blockers found (if any):**
-

**Winner:**

**Decision #18 logged in /DECISIONS.md:** ☐

---

## Implementation Notes Per Provider

These map the benchmark's Scene Blueprint fields to each provider's native API shape — written so implementation doesn't require re-deriving the mapping from scratch per provider.

### Creatomate
- Each `scene_N` → one `composition` element (containing its own visual + caption + audio) on a shared track, sequenced by explicit cumulative `time` values.
- `asset_type: stock_footage` → `Background-Video`-style modification pointing at a Pexels URL fetched beforehand (no native stock search inside Creatomate itself — fetch from Pexels API first, then pass the URL).
- `caption_style` → text element with per-scene `fill_color`/`font_family`/`font_size` properties.
- **Correction from earlier desk research:** Creatomate *does* have native TTS — connect an ElevenLabs API key in Project Settings, then a `text-to-speech` element generates the voiceover during render with **no separate API call needed**. It can also auto-transcribe that generated voiceover into synced captions by referencing the audio element by name. This means Creatomate could plausibly handle Render + Voice in one provider, which is relevant to M0-T02, not just M0-T01.

### Shotstack
- Each `scene_N` → one `clip` inside Shotstack's `timeline.tracks` JSON.
- `transition` → Shotstack's native `transition` field on the clip (in/out).
- `caption_style` → Shotstack's built-in auto-caption feature, or manual text clips on a separate track if precise per-scene styling is needed — test both, record which the benchmark actually used.
- Check whether the "Create API" (AI-generated captions/voice claimed in `M0-video-providers.md`) is real and usable here, or whether it requires a separate product tier.

### JSON2Video
- Each `scene_N` → one `scene` object in the JSON payload's `scenes` array.
- `asset_type: ai_illustration` — test whether JSON2Video's bundled image-gen (if any) can be invoked directly, or whether this also requires a pre-generated image URL like Creatomate.
- TTS is reportedly bundled in render credits (per `M0-video-providers.md`) — this is the one provider where voiceover *might* be generated natively rather than supplied as an external audio file. Confirm and note actual quality.

---

Last Updated: June 26, 2026
