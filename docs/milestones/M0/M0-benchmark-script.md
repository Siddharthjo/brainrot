# M0 Benchmark Script — Scene Blueprint

**Topic:** "An AI just beat the test designed to catch AI" (StoryVault/OverfittingAI-style, AI News genre)

**Duration target:** 52 seconds
**Genre:** AI News (Curiosity-driven)
**Why this topic:** Stresses every asset type Narrative Visual Storytelling needs to support — stock footage, AI illustration, motion graphics, and text-only scenes — in one script, so the benchmark exercises the full range, not just one easy case.

**This is the fixed input. Identical across Creatomate, Shotstack, and JSON2Video. Do not adapt the narrative to flatter any provider — if a field can't be expressed, log it as a limitation in the benchmark doc.**

---

```yaml
video:
  title: "An AI Just Beat the Test Designed to Catch AI"
  target_duration: 52s
  aspect_ratio: 9:16

creative:
  mood: curious, slightly unsettling
  pacing: fast — new visual every 2-4s
  audience: 18-34, tech-curious

scene_1:
  purpose: hook
  narration: "There's a test built specifically to catch AI-written text. An AI just scored 98% on it."
  emotion: shock
  duration: 3.5s
  asset_type: motion_graphic
  asset_prompt: "Bold animated text, large red percentage counter ticking up to 98%, dark background"
  camera: static, fast zoom-in on the number
  transition: hard cut in
  caption_style: large, center, bold, yellow highlight on "98%"
  sound_effects: sharp whoosh on number tick-up

scene_2:
  purpose: context
  narration: "Researchers built this detector after teachers and editors started flagging everything as AI — even stuff humans wrote."
  emotion: mild tension
  duration: 7s
  asset_type: stock_footage
  asset_prompt: "Person reviewing documents at a desk, laptop, red flags/highlighted text overlay implied"
  camera: slow pan
  transition: crossfade
  caption_style: standard, bottom-third, white with dark outline
  sound_effects: none

scene_3:
  purpose: explain
  narration: "The detector looks for patterns: repeated sentence structure, predictable word choices, an unnaturally even rhythm."
  emotion: curiosity
  duration: 8s
  asset_type: motion_graphic
  asset_prompt: "Animated waveform/rhythm graphic morphing between 'choppy human' and 'smooth AI' patterns, labeled"
  camera: static
  transition: slide left
  caption_style: standard, bottom-third
  sound_effects: subtle tick per pattern highlighted

scene_4:
  purpose: rising_tension
  narration: "So a research lab fed the detector their newest model's writing, expecting it to get caught immediately."
  emotion: anticipation
  duration: 6s
  asset_type: ai_illustration
  asset_prompt: "Stylized illustration of a glowing AI model 'submitting' text into a scanner-like detector machine"
  camera: slow push-in
  transition: crossfade
  caption_style: standard, bottom-third
  sound_effects: low hum building

scene_5:
  purpose: reveal
  narration: "It didn't just pass. It scored 98% — almost indistinguishable from a human writer, on the test made to catch it."
  emotion: shock, payoff
  duration: 7s
  asset_type: motion_graphic
  asset_prompt: "Same percentage counter from scene 1 returns, now with a green checkmark, 'HUMAN' label flickering uncertainly"
  camera: static
  transition: hard cut
  caption_style: large, center, bold
  sound_effects: dramatic stinger

scene_6:
  purpose: implication
  narration: "If a detector built specifically for this can't reliably tell the difference anymore, what does that mean for every classroom, newsroom, and hiring process using one?"
  emotion: unsettled curiosity
  duration: 9s
  asset_type: stock_footage
  asset_prompt: "Wide shot: empty classroom or newsroom, slightly cold lighting"
  camera: slow pull-back
  transition: crossfade
  caption_style: standard, bottom-third
  sound_effects: ambient low tone

scene_7:
  purpose: emotional_beat
  narration: "This isn't a story about one model being clever. It's a story about a line that just got a lot blurrier."
  emotion: reflective
  duration: 6s
  asset_type: ai_illustration
  asset_prompt: "Abstract illustration: two overlapping silhouettes, one human one digital, blending at the edges"
  camera: static, slow zoom
  transition: crossfade
  caption_style: standard, center
  sound_effects: none

scene_8:
  purpose: cta
  narration: "Follow for the stories actually worth knowing about — before everyone else is talking about them."
  emotion: confident
  duration: 5.5s
  asset_type: motion_graphic
  asset_prompt: "Channel logo placeholder, animated follow button/arrow, brand color accent"
  camera: static
  transition: hard cut
  caption_style: large, center, bold
  sound_effects: upbeat short sting

audio:
  voiceover: single male or female VO, consistent across all 8 scenes (provider TTS or pre-generated — note which in benchmark results)
  background_music: low-key tension-building track, ducked under VO, swells slightly at scene_5 and scene_8
  total_word_count: ~120 words (paced for 52s at natural speaking speed)
```

---

## What This Script Deliberately Stresses

- **Hook in first 3.5s** (scene_1) — tests how fast each provider can get a render-ready opening beat
- **All 3 asset types in active use:** `stock_footage` (2, 6), `ai_illustration` (4, 7), `motion_graphic` (1, 3, 5, 8) — tests per-scene asset flexibility, not just one easy type
- **A repeated visual motif** (the 98% counter returns in scene_5) — tests whether a provider can reuse/reference an earlier asset cleanly or requires regenerating it
- **Mixed caption styles** (large/center vs. standard/bottom-third) — tests per-scene caption flexibility, not a single global caption template
- **Sound effects layered under background music** — tests audio-layering capability, not just "music + voice"
- **A clean CTA scene** — every Brainrot video needs one; tests whether branding/logo placement is easy to template

---

Last Updated: June 26, 2026
