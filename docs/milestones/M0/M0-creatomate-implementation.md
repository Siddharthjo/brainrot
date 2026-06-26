# M0-T01 — Creatomate Implementation

**Status:** Ready to run. I can't execute this myself (creatomate.com isn't on my network allowlist, and I don't have your API key) — you run this with your own free account.

**What this is:** The full benchmark Scene Blueprint (`M0-benchmark-script.md`) translated into Creatomate's actual JSON format, called "RenderScript." Verified against Creatomate's current documentation (not from memory) — this is real, current schema.

---

## Before You Run This

1. **Create a free Creatomate account** at creatomate.com — free tier includes 50 API credits, no card required.
2. **Get your API key** from your account dashboard.
3. **You need to supply 8 visual assets and 1 voiceover** — this implementation has placeholder URLs marked `REPLACE_ME` that you fill in:

| Scene | Asset Type | What to source | Suggested search/source |
|---|---|---|---|
| 1 | motion_graphic | Animated percentage counter graphic | Build in Creatomate's template editor directly, or source from a motion graphics pack |
| 2 | stock_footage | Person reviewing documents at desk | Pexels search: "reviewing documents office" |
| 3 | motion_graphic | Waveform/pattern animation | Build in template editor (simplest for this one) |
| 4 | ai_illustration | Glowing AI model submitting to scanner | Generate via Flux/Ideogram/DALL-E with the `asset_prompt` from the blueprint |
| 5 | motion_graphic | Same counter, green checkmark variant | Build in template editor |
| 6 | stock_footage | Empty classroom/newsroom, wide shot | Pexels search: "empty classroom" or "empty newsroom" |
| 7 | ai_illustration | Two overlapping silhouettes blending | Generate via Flux/Ideogram/DALL-E |
| 8 | motion_graphic | Logo + follow button animation | Build in template editor with your actual channel branding |

4. **Voiceover**: Either (a) connect an ElevenLabs API key in Creatomate's Project Settings and use the native `text-to-speech` element below (no separate TTS call needed — this is the correction noted in the benchmark doc), or (b) pre-generate one voiceover file per scene and supply URLs. The script below uses option (a) since it's the more interesting test — it tells us whether Creatomate can own both Render *and* Voice.

---

## The RenderScript (full 8-scene benchmark)

```json
{
  "output_format": "mp4",
  "width": 1080,
  "height": 1920,
  "elements": [
    {
      "type": "audio",
      "name": "background-music",
      "track": 4,
      "time": 0,
      "duration": null,
      "source": "REPLACE_ME_background_music_url.mp3",
      "loop": true,
      "volume": "25%",
      "audio_fade_out": 2
    },
    {
      "type": "composition",
      "name": "scene_1_hook",
      "track": 1,
      "time": 0,
      "duration": 3.5,
      "elements": [
        {
          "type": "text-to-speech",
          "name": "vo_1",
          "text": "There's a test built specifically to catch AI-written text. An AI just scored 98% on it.",
          "voice": "REPLACE_ME_elevenlabs_voice_id"
        },
        {
          "type": "image",
          "source": "REPLACE_ME_scene1_motion_graphic.png",
          "fit": "cover"
        },
        {
          "type": "text",
          "name": "caption_1",
          "transcript_source": "vo_1",
          "y": "50%",
          "width": "85%",
          "font_family": "Montserrat",
          "font_weight": "800",
          "font_size": "9 vmin",
          "fill_color": "#ffffff",
          "stroke_color": "#000000",
          "stroke_width": "1.2 vmin",
          "highlight_color": "#facc15"
        }
      ]
    },
    {
      "type": "composition",
      "name": "scene_2_context",
      "track": 1,
      "time": 3.5,
      "duration": 7,
      "animations": [{ "time": 0, "duration": 0.8, "transition": true, "type": "fade" }],
      "elements": [
        {
          "type": "text-to-speech",
          "name": "vo_2",
          "text": "Researchers built this detector after teachers and editors started flagging everything as AI, even stuff humans wrote.",
          "voice": "REPLACE_ME_elevenlabs_voice_id"
        },
        {
          "type": "video",
          "source": "REPLACE_ME_pexels_reviewing_documents.mp4",
          "fit": "cover"
        },
        {
          "type": "text",
          "name": "caption_2",
          "transcript_source": "vo_2",
          "y": "82%",
          "width": "90%",
          "font_family": "Montserrat",
          "font_weight": "600",
          "font_size": "5.5 vmin",
          "fill_color": "#ffffff",
          "stroke_color": "#000000",
          "stroke_width": "0.8 vmin"
        }
      ]
    },
    {
      "type": "composition",
      "name": "scene_3_explain",
      "track": 1,
      "time": 10.5,
      "duration": 8,
      "animations": [{ "time": 0, "duration": 0.6, "transition": true, "type": "slide", "direction": "left" }],
      "elements": [
        {
          "type": "text-to-speech",
          "name": "vo_3",
          "text": "The detector looks for patterns: repeated sentence structure, predictable word choices, an unnaturally even rhythm.",
          "voice": "REPLACE_ME_elevenlabs_voice_id"
        },
        {
          "type": "image",
          "source": "REPLACE_ME_scene3_waveform_graphic.png",
          "fit": "cover"
        },
        {
          "type": "text",
          "name": "caption_3",
          "transcript_source": "vo_3",
          "y": "82%",
          "width": "90%",
          "font_family": "Montserrat",
          "font_weight": "600",
          "font_size": "5.5 vmin",
          "fill_color": "#ffffff",
          "stroke_color": "#000000",
          "stroke_width": "0.8 vmin"
        }
      ]
    },
    {
      "type": "composition",
      "name": "scene_4_rising_tension",
      "track": 1,
      "time": 18.5,
      "duration": 6,
      "animations": [{ "time": 0, "duration": 0.8, "transition": true, "type": "fade" }],
      "elements": [
        {
          "type": "text-to-speech",
          "name": "vo_4",
          "text": "So a research lab fed the detector their newest model's writing, expecting it to get caught immediately.",
          "voice": "REPLACE_ME_elevenlabs_voice_id"
        },
        {
          "type": "image",
          "source": "REPLACE_ME_scene4_ai_illustration.png",
          "fit": "cover"
        },
        {
          "type": "text",
          "name": "caption_4",
          "transcript_source": "vo_4",
          "y": "82%",
          "width": "90%",
          "font_family": "Montserrat",
          "font_weight": "600",
          "font_size": "5.5 vmin",
          "fill_color": "#ffffff",
          "stroke_color": "#000000",
          "stroke_width": "0.8 vmin"
        }
      ]
    },
    {
      "type": "composition",
      "name": "scene_5_reveal",
      "track": 1,
      "time": 24.5,
      "duration": 7,
      "elements": [
        {
          "type": "text-to-speech",
          "name": "vo_5",
          "text": "It didn't just pass. It scored 98%, almost indistinguishable from a human writer, on the test made to catch it.",
          "voice": "REPLACE_ME_elevenlabs_voice_id"
        },
        {
          "type": "image",
          "source": "REPLACE_ME_scene5_counter_checkmark.png",
          "fit": "cover"
        },
        {
          "type": "text",
          "name": "caption_5",
          "transcript_source": "vo_5",
          "y": "50%",
          "width": "85%",
          "font_family": "Montserrat",
          "font_weight": "800",
          "font_size": "9 vmin",
          "fill_color": "#ffffff",
          "stroke_color": "#000000",
          "stroke_width": "1.2 vmin"
        }
      ]
    },
    {
      "type": "composition",
      "name": "scene_6_implication",
      "track": 1,
      "time": 31.5,
      "duration": 9,
      "animations": [{ "time": 0, "duration": 0.8, "transition": true, "type": "fade" }],
      "elements": [
        {
          "type": "text-to-speech",
          "name": "vo_6",
          "text": "If a detector built specifically for this can't reliably tell the difference anymore, what does that mean for every classroom, newsroom, and hiring process using one?",
          "voice": "REPLACE_ME_elevenlabs_voice_id"
        },
        {
          "type": "video",
          "source": "REPLACE_ME_pexels_empty_classroom.mp4",
          "fit": "cover"
        },
        {
          "type": "text",
          "name": "caption_6",
          "transcript_source": "vo_6",
          "y": "82%",
          "width": "90%",
          "font_family": "Montserrat",
          "font_weight": "600",
          "font_size": "5.5 vmin",
          "fill_color": "#ffffff",
          "stroke_color": "#000000",
          "stroke_width": "0.8 vmin"
        }
      ]
    },
    {
      "type": "composition",
      "name": "scene_7_emotional_beat",
      "track": 1,
      "time": 40.5,
      "duration": 6,
      "animations": [{ "time": 0, "duration": 0.8, "transition": true, "type": "fade" }],
      "elements": [
        {
          "type": "text-to-speech",
          "name": "vo_7",
          "text": "This isn't a story about one model being clever. It's a story about a line that just got a lot blurrier.",
          "voice": "REPLACE_ME_elevenlabs_voice_id"
        },
        {
          "type": "image",
          "source": "REPLACE_ME_scene7_silhouettes_illustration.png",
          "fit": "cover"
        },
        {
          "type": "text",
          "name": "caption_7",
          "transcript_source": "vo_7",
          "y": "50%",
          "width": "85%",
          "font_family": "Montserrat",
          "font_weight": "600",
          "font_size": "6 vmin",
          "fill_color": "#ffffff",
          "stroke_color": "#000000",
          "stroke_width": "0.8 vmin"
        }
      ]
    },
    {
      "type": "composition",
      "name": "scene_8_cta",
      "track": 1,
      "time": 46.5,
      "duration": 5.5,
      "elements": [
        {
          "type": "text-to-speech",
          "name": "vo_8",
          "text": "Follow for the stories actually worth knowing about, before everyone else is talking about them.",
          "voice": "REPLACE_ME_elevenlabs_voice_id"
        },
        {
          "type": "image",
          "source": "REPLACE_ME_scene8_logo_cta.png",
          "fit": "cover"
        },
        {
          "type": "text",
          "name": "caption_8",
          "transcript_source": "vo_8",
          "y": "50%",
          "width": "85%",
          "font_family": "Montserrat",
          "font_weight": "800",
          "font_size": "8 vmin",
          "fill_color": "#ffffff",
          "stroke_color": "#000000",
          "stroke_width": "1.2 vmin"
        }
      ]
    }
  ]
}
```

**Notes on what's real vs. assumed in this JSON:**
- `composition`, `text`, `image`, `video`, `audio` element types, `track`/`time`/`duration`, `animations` with `fade`/`slide` transitions, `loop`, `audio_fade_out`, `volume` — all confirmed against current Creatomate docs.
- `text-to-speech` element type and `transcript_source` (auto-caption from a named audio/TTS element) — confirmed real, from Creatomate's own JSON-to-Video practical examples (ElevenLabs integration, auto-synced subtitles).
- Exact property names for caption styling (`highlight_color`, `stroke_width` units, etc.) — these follow the documented pattern but **verify against the template editor's source view (F12) before relying on them** — small property-name mismatches are the most likely thing to need fixing on first run.

---

## How to Run This

```python
import requests

API_KEY = "YOUR_API_KEY_HERE"
RENDER_SCRIPT = { ... }  # paste the JSON above

response = requests.post(
    "https://api.creatomate.com/v2/renders",
    headers={
        "Authorization": f"Bearer {API_KEY}",
        "Content-Type": "application/json",
    },
    json=RENDER_SCRIPT,
)

print(response.status_code)
print(response.json())
# Response includes a render ID and (once complete) a URL to the finished MP4
```

Rendering is async — poll the render ID or check your Creatomate dashboard for the finished video URL.

---

## After You Run It

Score it against `M0-renderer-benchmark.md`'s rubric and fill in the Creatomate column of the comparison table. Specifically note:
1. Did the `text-to-speech` + `transcript_source` auto-captioning actually work as documented?
2. How much manual fixing did the placeholder JSON need before it rendered successfully?
3. Actual render time, start to finished MP4.
4. Actual cost in credits for this specific video.

---

Last Updated: June 26, 2026
