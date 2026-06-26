.PHONY: help setup dev test lint format clean docker-up docker-down db-init db-migrate

help:
	@echo "Brainrot Development Commands"
	@echo ""
	@echo "Setup:"
	@echo "  make setup              - Install dependencies and initialize"
	@echo ""
	@echo "Development:"
	@echo "  make dev                - Run backend, frontend, workers locally"
	@echo "  make backend            - Run backend only"
	@echo "  make frontend           - Run frontend only"
	@echo "  make workers            - Run workers only"
	@echo ""
	@echo "Database:"
	@echo "  make db-init            - Initialize database"
	@echo "  make db-migrate         - Run migrations"
	@echo "  make db-reset           - Reset database (careful!)"
	@echo ""
	@echo "Testing:"
	@echo "  make test               - Run all tests"
	@echo "  make test-unit          - Run unit tests only"
	@echo "  make test-integration   - Run integration tests only"
	@echo "  make test-coverage      - Run tests with coverage"
	@echo ""
	@echo "Code Quality:"
	@echo "  make lint               - Run linters (black, flake8)"
	@echo "  make format             - Format code (black, isort)"
	@echo ""
	@echo "Docker:"
	@echo "  make docker-up          - Start Docker services"
	@echo "  make docker-down        - Stop Docker services"
	@echo "  make docker-logs        - View Docker logs"
	@echo ""
	@echo "Cleanup:"
	@echo "  make clean              - Clean cache and temporary files"

# Setup
setup:
	@echo "Setting up Brainrot..."
	python -m pip install --upgrade pip
	cd backend && pip install -r requirements.txt
	cd frontend && npm install
	cd workers && pip install -r requirements.txt
	@echo "Setup complete!"

# Development
dev:
	@echo "Starting Brainrot development environment..."
	docker-compose up -d
	@sleep 2
	@echo "Starting backend..."
	(cd backend && python -m uvicorn app.main:app --reload) &
	@echo "Starting workers..."
	(cd workers && celery -A celery_app worker --loglevel=info) &
	@echo "Starting frontend..."
	(cd frontend && npm run dev) &
	@echo "All services started!"

backend:
	cd backend && python -m uvicorn app.main:app --reload

frontend:
	cd frontend && npm run dev

workers:
	cd workers && celery -A celery_app worker --loglevel=info

# Database
db-init:
	docker-compose up -d postgres
	@sleep 2
	cd backend && alembic upgrade head
	@echo "Database initialized!"

db-migrate:
	cd backend && alembic upgrade head

db-reset:
	@echo "Resetting database (careful!)..."
	docker-compose down -v
	make db-init

# Testing
test:
	cd backend && pytest tests/ -v

test-unit:
	cd backend && pytest tests/unit/ -v

test-integration:
	cd backend && pytest tests/integration/ -v

test-coverage:
	cd backend && pytest tests/ --cov=app --cov-report=html
	@echo "Coverage report generated in htmlcov/index.html"

# Code Quality
lint:
	cd backend && black --check .
	cd backend && flake8 app/
	cd frontend && npm run lint

format:
	cd backend && black .
	cd backend && isort .
	cd frontend && npm run format

# Docker
docker-up:
	docker-compose up -d
	@echo "Docker services started!"
	@echo "  PostgreSQL:   localhost:5432"
	@echo "  PgAdmin:      localhost:5050"
	@echo "  Redis:        localhost:6379"
	@echo "  Flower:       localhost:5555"

docker-down:
	docker-compose down

docker-logs:
	docker-compose logs -f

# Cleanup
clean:
	find . -type d -name __pycache__ -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete
	find . -type f -name ".DS_Store" -delete
	rm -rf .pytest_cache/
	rm -rf .coverage
	rm -rf htmlcov/
	cd frontend && rm -rf node_modules/.cache
	@echo "Cleanup complete!"
