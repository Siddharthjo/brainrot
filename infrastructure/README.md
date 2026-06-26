# Infrastructure

**Deployment, configuration, and infrastructure code**

## Purpose

Everything needed to run Brainrot in production:

- **Docker**: Container definitions
- **Kubernetes**: Orchestration (future)
- **CI/CD**: GitHub Actions workflows
- **Configuration**: Environment setup
- **Database**: Migration scripts, schema

## Structure

```
infrastructure/
├── docker/
│   ├── Dockerfile.backend   # Backend image
│   ├── Dockerfile.frontend  # Frontend image
│   ├── Dockerfile.worker    # Worker image
│   └── entrypoint.sh        # Container startup script
├── scripts/
│   ├── init_db.sh          # Initialize database
│   ├── migrate_db.sh       # Run migrations
│   └── setup.sh            # Local setup script
├── kubernetes/
│   ├── deployment.yaml
│   ├── service.yaml
│   └── configmap.yaml
├── ci_cd/
│   └── .github/workflows/  # GitHub Actions
├── nginx/
│   └── nginx.conf          # Reverse proxy config
└── README.md              # This file
```

## Key Responsibilities

- ✅ **Keep deployments reproducible**
- ✅ **Document environment setup**
- ✅ **Version all infrastructure code**
- ✅ **Use environment variables** (no hardcoded secrets)

## Deployment

See `/docs/architecture/DEPLOYMENT.md`
