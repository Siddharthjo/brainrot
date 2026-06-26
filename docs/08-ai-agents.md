# Brainrot — AI Agent Architecture

**Status:** To be written during M4 (Intelligence Engine), drafted in M1

---

## Will Contain

Per-agent specification, each living in `brain/agents/`:

| Agent | Responsibility | Milestone |
|---|---|---|
| Research Agent | Finds information from sources | M3 |
| Trend Agent | Finds emerging opportunities | M4 |
| Opportunity/Ranking Agent | Scores & ranks ideas | M4 |
| Script Agent | Writes scripts | M4 |
| Editor/Reviewer Agent | Improves scripts | M4 |
| Production Agent | Coordinates video creation | M5 |
| Publisher Agent | Uploads & schedules | M6 |
| Analytics Agent | Measures performance | M7 |
| Learning Agent | Feeds performance back into ranking | M7 |
| CEO AI | Conversational control over all of the above | M8 |

Each agent doc will define: inputs, outputs, prompt location (`brain/prompts/`), provider used (`brain/providers/`), and done/error contract.

---

Last Updated: June 26, 2026
