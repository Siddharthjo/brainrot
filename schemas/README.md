# schemas/

**Single source of truth for core data shapes.**

Pydantic models / JSON schemas for the entities that flow through the entire system: `Channel`, `Video`, `Script`, `Story` (research), `Analytics`. Defined once here, imported by `backend/`, `workers/`, and `brain/` — never redefined per-module.

## Why this exists

Without this, the same "Script" shape gets redefined slightly differently in the API layer, the worker that generates it, and the agent that writes it — and they drift. One schema, multiple consumers.

## Convention

One file per entity:
```
schemas/
├── channel.py
├── video.py
├── script.py
├── story.py
└── analytics.py
```

Each schema is documented in `docs/05-database.md` alongside its corresponding DB table.

**Status:** Empty until M1 (schema design) locks the data model.
