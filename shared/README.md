# Shared

**Shared utilities and constants used across Brainrot**

## Purpose

Code that's used by both backend and workers:

- **Models**: Database models (if shared)
- **Schemas**: Shared validation schemas
- **Constants**: App-wide constants
- **Utilities**: Helper functions
- **Enums**: Status enums, provider types, etc

## Structure

```
shared/
├── models/              # SQLAlchemy models (imported by backend)
├── schemas/             # Pydantic schemas (imported by backend & workers)
├── constants.py         # App constants
├── enums.py            # Status, provider types, etc
├── utils/
│   ├── logging.py      # Logging utilities
│   ├── errors.py       # Custom exceptions
│   └── helpers.py      # Generic helpers
└── README.md           # This file
```

## Key Principle

If backend and workers both need it, it lives here. This prevents circular imports and keeps code DRY.

## Examples

- Database models (used by backend and workers)
- Pydantic schemas (used by backend API and workers)
- Enums for status values
- Helper functions for common operations
