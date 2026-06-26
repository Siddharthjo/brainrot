# Brainrot Roadmap

**Status: M0 — Technology Validation (In Progress)**

---

## 🔍 Milestone 0 — Technology Validation

**Goal:** Validate every external dependency before building.

**Duration:** 3–5 days

**What We Do:**
- Compare video generation providers (AutoShorts, StoryShort, Creatomate, Shotstack)
- Compare voice providers (ElevenLabs, Google TTS, Cartesia)
- Test OpenAI APIs
- Test YouTube API
- Test Instagram/Meta API
- Test Cloudflare R2 storage
- Estimate API costs at scale

**Deliverable:** Final list of technologies with no unknowns.

**Location:** `/docs/milestones/M0/`

---

## 📐 Milestone 1 — Planning & Architecture

**Goal:** Design the entire system before writing code.

**Duration:** 1 week

**What We Do:**
- Product Requirements Document (PRD)
- System architecture diagram
- Database schema (frozen)
- API design (all endpoints)
- Folder structure
- AI agent architecture
- Dashboard wireframes
- Coding standards
- Decision log

**Deliverable:** Complete blueprint for Claude.

**Status:** Blocked on M0

---

## 🏗️ Milestone 2 — Foundation

**Goal:** Build the core platform.

**Duration:** 2 weeks

**What We Do:**
- Backend (FastAPI)
- Database (PostgreSQL + SQLAlchemy)
- Authentication (JWT + FastAPI Users)
- Dashboard shell (Lovable)
- User/workspace management
- Channel CRUD
- Basic settings

**Deliverable:** Working app. You can log in and manage channels.

**Tasks:**
- M2-T01: Backend setup
- M2-T02: Database schema
- M2-T03: Authentication
- M2-T04: Channel CRUD
- M2-T05: Dashboard shell

**Status:** Blocked on M1

---

## 🌍 Milestone 3 — Research Engine

**Goal:** Automatically discover content opportunities.

**Duration:** 2 weeks

**What We Do:**
- RSS feed integration
- News sources
- Reddit integration
- GitHub releases
- Company blogs
- Web search
- Deduplication
- Story storage
- Source management

**Deliverable:** Dashboard showing today's researched stories.

**Tasks:**
- M3-T01: RSS connector
- M3-T02: Reddit connector
- M3-T03: News connector
- M3-T04: Deduplication logic
- M3-T05: Story storage

**Status:** Blocked on M2

---

## 🧠 Milestone 4 — Intelligence Engine & Creative Director

**Goal:** Turn raw information into a script + creative direction, ready to be visualized.

**Duration:** 3 weeks

**What We Do:**
- Viral scoring algorithm
- Topic clustering
- Hook generation (LLM)
- Script generation (LLM) — Intelligence Engine (Layer 3)
- AI review
- Creative Director agent — tone, pacing, visual mood, retention strategy (Layer 4, Decision #15)
- Human approval workflow (Mode A checkpoint, Decision #16)
- Prompt management

**Deliverable:** Queue of `Narration Script` + `Creative Brief` pairs, ready for the Story Visualization Engine.

**Tasks:**
- M4-T01: Scoring algorithm
- M4-T02: Hook generator
- M4-T03: Script generator (Intelligence Engine)
- M4-T04: Creative Director agent
- M4-T05: Approval workflow
- M4-T06: Learning loop setup

**Status:** Blocked on M3

---

## 🎬 Milestone 5 — Story Visualization Engine & Render Engine

*(Renamed from "Production Engine" — see Decision #14, #17. This milestone covers Layers 5 and 6 of the frozen architecture.)*

**Goal:** Convert a `Narration Script` + `Creative Brief` into a `Scene Blueprint`, then render it into a finished video (Narrative Visual Storytelling format — Decision #14).

**Duration:** 4 weeks (includes renderer evaluation)

**What We Do:**
- Story Visualization Agent: scene splitting, per-scene asset-type selection (Layer 5)
- Voice generation
- Visual generation/B-roll per scene (AI illustration, stock, motion graphic — chosen per scene/genre, not fixed globally)
- Caption generation
- Music selection
- `Scene Blueprint` schema implementation (`schemas/scene_blueprint.py`, Decision #17)
- Video rendering via provider API (Layer 6 — Render Engine, dumb executor)
- Thumbnail creation
- Preview & regeneration (Mode A approval point sits here — Decision #16)

**Deliverable:** Complete, platform-ready videos, produced from an approved Scene Blueprint.

**Tasks:**
- M5-T01: Voice provider integration
- M5-T02: Story Visualization Agent (scene planning + asset selection)
- M5-T03: Scene Blueprint schema implementation
- M5-T04: Video API integration (Render Engine)
- M5-T05: Thumbnail generation
- M5-T06: Renderer evaluation & testing

**Status:** Blocked on M4

**Note:** Renderer evaluation (M5-T06) is separate from implementation. Test all options, pick one.


---

## 📤 Milestone 6 — Publishing Engine

**Goal:** Publish content automatically.

**Duration:** 1.5 weeks

**What We Do:**
- YouTube upload (Official API)
- Instagram upload (Meta Graph API)
- Scheduling
- Retry handling
- Upload logs
- Status tracking

**Deliverable:** One-click approval → automatic publishing.

**Tasks:**
- M6-T01: YouTube integration
- M6-T02: Instagram integration
- M6-T03: Scheduling system
- M6-T04: Retry/failure handling
- M6-T05: Logging

**Status:** Blocked on M5

---

## 📊 Milestone 7 — Analytics & Learning

**Goal:** Learn from every published video.

**Duration:** 1 week

**What We Do:**
- View tracking
- Engagement metrics
- Retention analysis
- Topic performance
- Hook performance
- Upload-time analysis
- Recommendations
- Internal performance database

**Deliverable:** Dashboard showing what works & what to create next.

**Tasks:**
- M7-T01: Analytics data collection
- M7-T02: Performance dashboard
- M7-T03: Topic analysis
- M7-T04: Hook analysis
- M7-T05: Recommendations engine

**Status:** Blocked on M6

---

## 🤖 Milestone 8 — CEO AI

**Goal:** Control the entire platform through conversation.

**Duration:** 1 week

**What We Do:**
- AI chatbot interface
- Tool definitions (40+ operations)
- Create channels
- Change settings
- Generate content
- Pause/resume publishing
- Explain analytics
- Execute workflows

**Deliverable:** AI assistant managing Content OS via natural language.

**Tasks:**
- M8-T01: Tool definitions
- M8-T02: Chatbot prompt
- M8-T03: Tool execution layer
- M8-T04: Error handling
- M8-T05: Testing

**Status:** Blocked on M7

---

## ✅ Version 1 Success Criteria

Content OS v1 is complete when:

- ✅ One YouTube Shorts channel fully managed
- ✅ One Instagram account fully managed
- ✅ You define the niche
- ✅ System researches content automatically
- ✅ It ranks and suggests ideas
- ✅ It generates scripts for approval
- ✅ It produces videos automatically
- ✅ It uploads automatically
- ✅ It tracks performance

---

## 📈 Version 2 (Future)

Only after V1 proves successful:

- Multiple YouTube & Instagram accounts
- Multiple niches
- Shared content libraries
- Team collaboration
- A/B testing
- Multi-language content
- Additional platforms
- Monetization tracking

---

## Timeline Summary

| Milestone | Duration | Cumulative |
|-----------|----------|-----------|
| M0 | 3–5 days | 3–5 days |
| M1 | 1 week | 1.5–2 weeks |
| M2 | 2 weeks | 3.5–4 weeks |
| M3 | 2 weeks | 5.5–6 weeks |
| M4 | 3 weeks | 8.5–9 weeks |
| M5 | 4 weeks | 12.5–13 weeks |
| M6 | 1.5 weeks | 14–15 weeks |
| M7 | 1 week | 15–16 weeks |
| M8 | 1 week | 16–17 weeks |

**Estimated Completion:** Early September 2026
**Buffer Before MS:** 3–4 weeks

---

## Guiding Principle

Every milestone ends with something you can actually use.

- M2: You can manage channels
- M3: You can browse stories
- M4: You can generate scripts
- M5: You can generate videos
- M6: You can publish automatically
- M7: You can see performance
- M8: You can control it all via conversation

---

Last Updated: June 26, 2026
Status: M0 in progress
