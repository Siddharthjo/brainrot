# brain/

**The AI intelligence layer of Brainrot — kept separate from backend.**

The backend handles HTTP, auth, and persistence. This folder holds everything that thinks, decides, generates, or talks to an LLM. Keeping it separate means the backend can stay thin, and AI logic can evolve (new agents, new prompts, new providers) without touching API/DB code.

## Subfolders

- **`agents/`** — One module per AI agent: Research, Trend, Opportunity, Script, Editor, Production, Publisher, Analytics, Learning. Each agent has a single responsibility (see `docs/08-ai-agents.md`).
- **`prompts/`** — Versioned prompt templates, organized by agent. Never hardcode prompts inline in agent code.
- **`providers/`** — Abstraction layer for external AI/model/video/voice providers (OpenAI, Claude, Gemini, ElevenLabs, AutoShorts, etc.). Backend and agents call providers through this interface, never the vendor SDK directly. See Decision #6 in `/DECISIONS.md`.
- **`tools/`** — Tool definitions the CEO AI (M8) and agents can call (`CreateChannel`, `GenerateIdeas`, `PauseUploads`, etc.). Each tool is a function with a strict input/output schema.
- **`orchestrator/`** — Coordinates multi-agent workflows (e.g. Research → Rank → Script → Approve → Produce). This is the "newsroom manager" that sequences agent calls.

## Rules

- No agent calls a vendor SDK directly — always through `providers/`.
- No prompt lives inline in Python — always in `prompts/`.
- Every tool in `tools/` must have a done/error contract documented in `docs/08-ai-agents.md`.

**Status:** Empty until M4 (Intelligence Engine). Folder exists now so the separation is established from day one.
