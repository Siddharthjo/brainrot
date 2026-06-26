# Scripts

**Utility scripts for development and maintenance**

## Purpose

Automation scripts that help with:

- **Setup**: Initial environment setup
- **Development**: Database reset, seed data
- **Testing**: Test runners, coverage reports
- **Maintenance**: Cleanup, migrations

## Examples

```
scripts/
├── setup.sh              # Initial project setup
├── seed_db.py           # Populate test data
├── run_tests.sh         # Run all tests
├── reset_db.sh          # Drop and recreate database
├── format_code.sh       # Code formatting
└── check_lint.sh        # Linting checks
```

## Usage

```bash
./scripts/setup.sh        # One-time setup
./scripts/reset_db.sh     # For development
./scripts/run_tests.sh    # Before committing
```
