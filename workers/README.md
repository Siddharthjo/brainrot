# Workers

**Celery background jobs for Brainrot Content OS**

## Purpose

Workers handle long-running, asynchronous tasks:

- **Research**: Fetch stories from multiple sources
- **Generation**: Create scripts, videos, thumbnails
- **Publishing**: Upload to YouTube and Instagram
- **Analytics**: Collect and process performance data
- **Learning**: Update ranking models based on results

## Structure

```
workers/
├── tasks/
│   ├── research_tasks.py    # Fetch stories, scrape data
│   ├── script_tasks.py      # Generate scripts via LLM
│   ├── video_tasks.py       # Call video API, process
│   ├── publish_tasks.py     # Upload to platforms
│   └── analytics_tasks.py   # Collect metrics
├── celery_app.py            # Celery configuration
├── config.py                # Worker settings
├── requirements.txt         # Dependencies
└── README.md               # This file
```

## Key Responsibilities

- ✅ **Never block the API** (all long tasks run here)
- ✅ **Idempotent operations** (can retry safely)
- ✅ **Logging everything** (for debugging)
- ✅ **Error handling** (graceful failures)
- ✅ **Status tracking** (backend can query progress)

## Running Workers

```bash
celery -A celery_app worker --loglevel=info
```

## Monitoring

Tasks are monitored via:
- Redis (queue)
- Celery Flower (dashboard)
- Backend database (status tracking)

## Architecture

- **Queue**: Redis
- **Framework**: Celery
- **Scheduling**: Celery Beat (for periodic tasks)
- **Monitoring**: Flower

## Key Principle

Workers are fire-and-forget. The backend queues a task and continues. Workers handle execution, retries, and status updates.
