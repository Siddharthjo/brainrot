# Tests

**Automated tests for Brainrot**

## Purpose

Comprehensive testing across:

- **Unit Tests**: Individual functions and components
- **Integration Tests**: API endpoints, database operations
- **End-to-End Tests**: Full workflows

## Structure

```
tests/
├── unit/                # Unit tests
│   ├── test_research.py
│   ├── test_ranking.py
│   └── test_script_gen.py
├── integration/         # Integration tests
│   ├── test_api.py
│   ├── test_publishing.py
│   └── test_database.py
├── e2e/                # End-to-end tests
│   └── test_workflow.py
├── conftest.py         # Pytest configuration
└── fixtures/           # Test data
```

## Running Tests

```bash
pytest                  # All tests
pytest tests/unit/      # Unit tests only
pytest -v              # Verbose output
pytest --cov           # Coverage report
```

## Coverage Target

Aim for >80% code coverage on critical paths.
