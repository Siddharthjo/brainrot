# Brainrot — Tech Stack

**Status:** Locked for Foundation layer. Provider choices pending M0.

---

## Locked (see /DECISIONS.md for reasoning)

| Layer | Choice | Decision # |
|---|---|---|
| Backend | FastAPI | #2 |
| Database | PostgreSQL + SQLAlchemy | #3 |
| Frontend | React + Lovable | #4 |
| Job Queue | Celery + Redis | #5 |
| Auth | JWT + FastAPI Users | #7 |
| Storage (production assets) | Cloudflare R2 | #8 |
| Logging | Structured JSON | #10 |

## Pending M0 Validation

| Layer | Candidates | Status |
|---|---|---|
| Video Renderer | AutoShorts, StoryShort, Creatomate, Shotstack | Testing |
| Voice Provider | ElevenLabs, Google TTS, Cartesia | Testing |
| LLM (research/script) | GPT-5.5, Claude, Gemini | Testing |

See `docs/milestones/M0/` for testing protocol and results.

---

Last Updated: June 26, 2026
