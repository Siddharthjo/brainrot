# Backend

**FastAPI-based REST API for Brainrot Content OS**

## Purpose

The backend is the core business logic engine. It handles:

- **API Layer**: REST endpoints for all platform operations
- **Authentication**: User management, JWT tokens, permissions
- **Database Layer**: PostgreSQL models, queries, migrations
- **Business Logic**: Research, ranking, script generation, publishing
- **External Integrations**: AI models (OpenAI, Claude), video APIs, social platforms
- **Background Jobs**: Celery workers for long-running tasks

## Structure

```
backend/
├── app/
│   ├── main.py              # FastAPI app initialization
│   ├── config.py            # Configuration management
│   ├── dependencies.py      # Dependency injection
│   ├── core/                # Core utilities
│   │   ├── security.py      # JWT, auth logic
│   │   ├── config.py        # Settings
│   │   └── constants.py     # App constants
│   ├── api/                 # API routes
│   │   ├── v1/              # API v1 endpoints
│   │   │   ├── channels.py
│   │   │   ├── research.py
│   │   │   ├── scripts.py
│   │   │   ├── videos.py
│   │   │   ├── publishing.py
│   │   │   ├── analytics.py
│   │   │   └── auth.py
│   │   └── __init__.py
│   ├── models/              # SQLAlchemy models
│   │   ├── user.py
│   │   ├── channel.py
│   │   ├── story.py
│   │   ├── script.py
│   │   ├── video.py
│   │   └── analytics.py
│   ├── schemas/             # Pydantic schemas
│   │   ├── user.py
│   │   ├── channel.py
│   │   ├── story.py
│   │   ├── script.py
│   │   └── video.py
│   ├── services/            # Business logic
│   │   ├── research/        # Research engine
│   │   ├── intelligence/    # Ranking, scoring
│   │   ├── production/      # Video generation
│   │   ├── publishing/      # Upload logic
│   │   └── analytics/       # Performance tracking
│   ├── workers/             # Celery tasks
│   │   ├── research.py
│   │   ├── generation.py
│   │   └── publishing.py
│   ├── integrations/        # External services
│   │   ├── ai_providers/    # OpenAI, Claude, Gemini
│   │   ├── video_apis/      # StoryShort, AutoShorts, etc
│   │   ├── social/          # YouTube, Instagram APIs
│   │   └── storage/         # Cloudflare R2
│   └── database/            # Database setup
│       ├── __init__.py
│       ├── session.py       # DB session management
│       └── migrations/      # Alembic migrations
├── tests/                   # Backend tests
├── requirements.txt         # Python dependencies
├── .env.example             # Example environment variables
└── README.md               # This file
```

## Key Responsibilities

- ✅ **Do not place frontend code here**
- ✅ **Keep API routes thin** (logic lives in services/)
- ✅ **All external integrations are abstracted** (providers are swappable)
- ✅ **Background jobs run asynchronously** (via Celery)
- ✅ **Database models are immutable after deployment** (use migrations)

## Development

See `/docs/architecture/BACKEND.md` for detailed backend architecture.

## Testing

```bash
pytest tests/
```

## Dependencies

- FastAPI
- SQLAlchemy
- Pydantic
- Celery
- Redis
- PostgreSQL
- Python 3.11+
