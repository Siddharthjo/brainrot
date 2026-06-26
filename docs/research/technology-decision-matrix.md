# Technology Decision Matrix

**Purpose:** One table, the whole engineering foundation. Filled out progressively as each M0 task completes. By the end of M0, every row has a winner.

This is the at-a-glance view. Full reasoning for each row lives in `/DECISIONS.md` (locked decisions) or `docs/research/` (in-progress evaluations).

---

| Component | Options Considered | Winner | Why | Status |
|---|---|---|---|---|
| Backend | FastAPI / Django / Flask | **FastAPI** | Async support, AI-ecosystem fit, lighter than Django | ✅ Locked (Decision #2) |
| Database | PostgreSQL / MongoDB / Firebase | **PostgreSQL** | Relational data + analytics + JSON support | ✅ Locked (Decision #3) |
| Frontend | React+Lovable / Vue / Svelte | **React + Lovable** | Fast iteration, largest component ecosystem | ✅ Locked (Decision #4) |
| Job Queue | Celery / RQ / APScheduler | **Celery + Redis** | Mature ecosystem, distributed-job support | ✅ Locked (Decision #5) |
| Provider Abstraction | N/A | **Always abstract external providers** | Vendors change; code shouldn't | ✅ Locked (Decision #6, non-negotiable) |
| Auth | JWT+FastAPI Users / OAuth-only | **JWT + FastAPI Users** | Simple for solo use, OAuth addable later | ✅ Locked (Decision #7) |
| Storage (production assets) | Cloudflare R2 / AWS S3 / GCS | **Cloudflare R2** | Lower cost, S3-compatible | ✅ Locked (Decision #8) |
| API Versioning | URL path / header-based | **URL path (`/api/v1/`)** | Easiest to maintain, clearest in docs | ✅ Locked (Decision #9) |
| Logging | Structured JSON / plain text | **Structured JSON** | Machine-readable, searchable | ✅ Locked (Decision #10) |
| **Video Provider** | AutoShorts / StoryShort / Creatomate / Shotstack / BigMotion / InVideo / **JSON2Video (new)** | **TBD** | Desk research narrowed to Creatomate, Shotstack, JSON2Video for hands-on test; StoryShort on the bench for one targeted test; AutoShorts eliminated | 🔄 In Progress (M0-T01) — see `docs/research/M0-video-providers.md` |
| **Voice Provider** | ElevenLabs / OpenAI / Cartesia / PlayHT | **TBD** | Not yet researched | ⏳ Next (M0-T02) |
| **LLM Strategy** | Single model / multi-model by task | **TBD** — leaning multi-model (Research/Planning/CEO AI → GPT-5.5, Script Review → Claude) | Different models suit different tasks; CTO's proposed split makes sense but needs cost/quality validation | ⏳ Next (M0-T03) |
| **Research Sources** | RSS / Reddit / News API / GitHub / Google Trends / Company blogs | **TBD** | Need to confirm API access, rate limits, cost per source | ⏳ Next (M0-T04) |
| **Publishing APIs** | YouTube Data API / Meta Graph API | **TBD** (both required, no real alternative) | Need to confirm quotas, costs, restrictions before M6 design | ⏳ Next (M0-T05) |
| **Infrastructure (final check)** | PostgreSQL / Redis / Celery / Docker / Cloudflare R2 | **Locked individually above** | Final pass: confirm versions, local dev setup, hosting plan | ⏳ Next (M0-T06) |
| **Cost Model** | N/A | **TBD** | Per-video cost × volume scenarios (1/day, 2/day, 3/day) — blocked on Video + Voice + LLM rows above | ⏳ Next (M0-T07, last) |

---

## How This Gets Filled In

Each `TBD` row gets locked the same way the top 9 rows already are:

1. Research/test the options (`docs/research/M0-*.md`)
2. Make the call
3. Add a numbered entry to `/DECISIONS.md`
4. Update this table's row to ✅ Locked with the Decision # reference

No row gets skipped. M0 isn't "done" until every row in this table says ✅ Locked.

---

## Order of Operations (per CTO recommendation)

1. ✅ Video Provider (today — desk research done, hands-on testing next)
2. ⏳ Voice Provider
3. ⏳ LLM Strategy
4. ⏳ Research Sources
5. ⏳ Publishing APIs
6. ⏳ Infrastructure (final check)
7. ⏳ Cost Model (last — needs the above locked first)
8. 🔒 Freeze M0, move to M1

Video Provider goes first because it has the largest blast radius: it affects cost-per-video, time-to-MVP, and how much of the Story Visualization & Render Engine (M5) Brainrot has to build itself versus get for free.

---

Last Updated: June 26, 2026
