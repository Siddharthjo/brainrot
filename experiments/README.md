# experiments/

**Anything untested or unproven goes here. Nothing here touches production code.**

Use this folder when trying:
- A new prompt variant before promoting it to `brain/prompts/`
- A new video/voice provider before it's evaluated for `brain/providers/`
- A new AI model for a task before swapping the default in `config/models/`
- A throwaway script to test an idea

## Rule

Code here is disposable. If an experiment works and you want to keep it, it gets **moved and cleaned up** into the real module (`brain/`, `backend/`, `workers/`) — it doesn't stay here and get imported from here.

Subfolder per experiment, named by date or topic:
```
experiments/
├── 2026-07-hook-prompt-v2/
├── kling-vs-autoshorts/
└── claude-vs-gpt-script-review/
```

**Status:** Empty. Use freely, but per the project rule — experiments don't bypass the milestone/backlog discipline. A *result* worth adopting goes through the normal milestone process; this folder is just where you go find out if it's worth adopting.
