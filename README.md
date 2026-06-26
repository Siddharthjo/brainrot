# Brainrot

**AI Content Operating System**

> Research. Create. Publish. Learn. Scale.

An intelligent platform that automatically discovers content opportunities, generates ideas, produces videos, publishes them at scale, and learns from every upload.

Instead of hiring researchers, writers, editors, and producers—the system performs these roles while you remain the creative director.

---

## 🎯 Vision

Build an AI-powered media company that operates like a newsroom, where every team member is an AI agent and you decide strategy.

The system's job: Find the best ideas.
Your job: Approve and refine.

---

## ✨ Features (V1)

- **Automatic Research** — Continuously gather content from RSS, news, Reddit, GitHub, X, and web search
- **Intelligent Ranking** — Score ideas by viral potential, novelty, audience fit, and competition
- **Script Generation** — AI writes and reviews scripts in your brand voice
- **Video Production** — Automatic voiceovers, visuals, captions, and music
- **Smart Publishing** — Upload to YouTube and Instagram on schedule
- **Performance Analytics** — Track views, retention, engagement, and learn what works
- **Learning Engine** — System improves its decisions with every published video

---

## 🏗️ Architecture Overview

```
Internet
   ↓
Research Engine (RSS, Reddit, News, Web)
   ↓
Knowledge Base (12,000+ stories, categorized)
   ↓
Intelligence Engine (Scoring, Ranking, Filtering)
   ↓
Script Generation (LLM)
   ↓
Production Engine (Voice, Video, Captions)
   ↓
Publishing Engine (YouTube, Instagram)
   ↓
Analytics Engine (Performance Tracking)
   ↓
Learning Engine (Feedback Loops)
```

Every component is replaceable. Every decision is logged. Every video teaches the system something new.

---

## 🗺️ Roadmap

| Phase | Name | Duration | Status |
|-------|------|----------|--------|
| M0 | Technology Validation | 3–5 days | ✅ Starting |
| M1 | Planning & Architecture | 1 week | ⏳ Next |
| M2 | Foundation | 2 weeks | ⏳ Next |
| M3 | Research Engine | 2 weeks | ⏳ Next |
| M4 | Intelligence Engine | 3 weeks | ⏳ Next |
| M5 | Production Engine | 4 weeks | ⏳ Next |
| M6 | Publishing Engine | 1.5 weeks | ⏳ Next |
| M7 | Analytics & Learning | 1 week | ⏳ Next |
| M8 | CEO AI | 1 week | ⏳ Next |

**Estimated Launch:** Early September 2026

---

## 📊 Version 1 Success Criteria

✅ One YouTube Shorts channel fully automated
✅ One Instagram account fully automated
✅ Automatic research & story discovery
✅ Intelligent idea ranking & filtering
✅ Script generation & human approval
✅ Automatic video production
✅ Automatic publishing with scheduling
✅ Performance tracking & analytics
✅ Learning loops from published videos

---

## 🛠️ Tech Stack

| Layer | Technology |
|-------|------------|
| **Backend** | FastAPI + Python |
| **Frontend** | React + Lovable |
| **Database** | PostgreSQL + SQLAlchemy |
| **Jobs** | Celery + Redis |
| **Storage** | Cloudflare R2 |
| **AI Models** | OpenAI GPT-5.5, Claude, Gemini |
| **Voice** | ElevenLabs (replaceable) |
| **Video** | AutoShorts/StoryShort (replaceable) |
| **Publishing** | YouTube API, Meta Graph API |

---

## 📁 Repository Structure

```
brainrot/
├── backend/              # FastAPI application (API, auth, DB access)
├── frontend/             # React dashboard (Lovable)
├── brain/                # AI intelligence layer — agents, prompts, providers, tools
├── workers/               # Celery background tasks
├── config/               # Config-as-data: models, providers, channels, prompts, defaults
├── schemas/               # Shared data models (Channel, Video, Script, Story, Analytics)
├── shared/                # Shared utilities (non-AI)
├── infrastructure/        # Docker, deployment configs
├── storage/               # Local dev scratch space (gitignored — never production data)
├── branding/               # Brainrot + channel brand assets (logos, icons, UI — not media)
├── scripts/                # Automation & setup scripts
├── tests/                  # Test suite
├── experiments/             # Throwaway tests for new prompts/providers/models
├── docs/                    # Documentation & decisions
├── .github/                 # GitHub workflows & templates
├── docker-compose.yml       # Local development
├── Makefile                 # Common commands
├── .env.example              # Environment template
└── README.md                 # This file
```

Every folder has its own `README.md` explaining its purpose and rules.

---

## 🚀 Quick Start

### Prerequisites
- Python 3.11+
- Node.js 18+
- PostgreSQL 15+
- Redis 7+

### Setup

```bash
# Clone repository
git clone https://github.com/yourusername/brainrot.git
cd brainrot

# Copy environment
cp .env.example .env

# Install dependencies
make install

# Start development environment
make dev
```

See [docs/SETUP.md](./docs/SETUP.md) for detailed instructions.

---

## 📚 Documentation

- **[Roadmap](./docs/00-roadmap.md)** — Milestone breakdown
- **[Architecture](./docs/architecture/)** — System design
- **[API Design](./docs/api/)** — Endpoint specifications
- **[Database Schema](./docs/database.md)** — Data model
- **[Decisions](./DECISIONS.md)** — Why we chose each technology
- **[Milestones](./docs/milestones/)** — Progress tracking
- **[Journal](./docs/journal.md)** — Development log

---

## 👥 Team

- **Sid** — Founder & Product Owner
- **ChatGPT User** — CTO / System Architect
- **Claude** — Lead Software Engineer

---

## 🤝 Contributing

This project follows a structured approach for all contributors (human and AI).

See [CONTRIBUTING.md](./CONTRIBUTING.md) for the operating manual.

---

## 📋 Project Status

- **Current Milestone:** M0 — Technology Validation
- **Status:** In Progress
- **Last Updated:** June 26, 2026

See [PROJECT_STATUS.md](./PROJECT_STATUS.md) for detailed progress.

---

## 📜 License

[MIT License](./LICENSE)

---

## 🔗 Quick Links

- [Milestones](./docs/milestones/)
- [Decisions Log](./DECISIONS.md)
- [Backlog](./BACKLOG.md)
- [Changelog](./CHANGELOG.md)
- [Contributing Guide](./CONTRIBUTING.md)

---

**Brainrot v1.0 — Building the AI media company**

*Last updated: June 26, 2026*
