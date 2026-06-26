# Contributing to Brainrot

**This guide is for both human contributors and AI assistants.**

---

## Before You Code

### 1. Read the Documentation

Before implementing anything:

- [ ] Read `/docs/01-vision.md` (understand the goal)
- [ ] Read `/docs/03-architecture.md` (understand the design)
- [ ] Read `/DECISIONS.md` (understand why things were chosen)
- [ ] Read the relevant milestone folder in `/docs/milestones/M#/`

**For AI Assistants**: Every task will reference which docs to read. Read them first.

### 2. Understand the Task

Every task has:
- **Objective**: What is this task trying to accomplish?
- **Requirements**: What must be true when done?
- **Files**: Which files are affected?
- **Done Criteria**: How do we know it's complete?

**For AI Assistants**: Ask clarifying questions if the task is ambiguous. Don't guess.

---

## Brainrot Studio Page Workflow (Decision #18 — binding from June 26, 2026)

V1 is built page by page, not module by module. Every Studio page follows the same process:

1. Study the equivalent FacelessReels (or relevant) workflow.
2. Understand its purpose — why does this page exist?
3. Design Brainrot's improved version.
4. Decide features, options, and workflow.
5. Decide required backend services and database tables.
6. Decide external providers/APIs needed.
7. Build the page in Lovable.
8. Connect backend.
9. Test with real data.
10. Freeze the page — "frozen" means *frozen enough to build V1*, not a perfect final design.
11. Move to the next page.

Page specs live in `docs/studio/pages/`, one file per page, using the 8-question format (see `docs/studio/README.md`).

**Mandatory extension-point rule:** every page must leave a hook for the future intelligence layer (Phases 8–12) without requiring a redesign. Concretely:
- Presets (visual style, voice, caption style, hook style) are rows in a `presets` table, never hardcoded dropdown values.
- Sources (Reddit, RSS, manual entry) are typed rows in a `sources` table, never separate hardcoded form sections.
- Generation output is saved in the schema shape the future Creative Director/Story Visualization Engine will eventually populate (Decisions #14–#17), even though V1 fills it with simple defaults.

### Core Rule — Every Session Produces an Artifact

Every working session on Brainrot must produce a tangible artifact: a working Studio page, a backend endpoint, a successful integration, a rendered or published video, or a merged commit. **Not just a new plan, framework, or document.** If a session is about to end with only a better plan, ask whether that plan was actually necessary before producing it. Planning ends where implementation begins.

---



Never violate these. If you want to change one, propose it in `/DECISIONS.md`.

### Core Principles

1. **Every external provider is replaceable**
   - Video APIs are abstracted (AutoShorts, StoryShort, Creatomate)
   - LLM providers are abstracted (OpenAI, Claude, Gemini)
   - Storage is abstracted (Cloudflare R2, S3)
   - **Consequence**: Never hardcode an API call directly. Always use a provider abstraction layer.

2. **The backend is the source of truth**
   - Frontend displays data, backend controls logic
   - Workers execute jobs, backend tracks status
   - **Consequence**: No business logic in frontend or workers. It lives in backend services.

3. **Modules stay independent**
   - Research engine doesn't know about video generation
   - Production engine doesn't know about publishing
   - **Consequence**: If you need something from another module, use an API call, not direct imports.

4. **Database models are immutable after deployment**
   - Use Alembic migrations for schema changes
   - Never modify models and deploy without a migration
   - **Consequence**: Test migrations locally first.

5. **All external calls are logged**
   - Every API call to YouTube, OpenAI, video renderers gets logged
   - Logs include input, output, timestamp, status
   - **Consequence**: If something breaks, we can trace exactly what happened.

---

## Code Organization

### Folder Structure

```
backend/
├── app/
│   ├── api/v1/          # REST endpoints
│   ├── models/          # SQLAlchemy models
│   ├── schemas/         # Pydantic schemas
│   ├── services/        # Business logic
│   └── integrations/    # External services
```

**Rule**: If it touches the database, it's a model. If it validates input, it's a schema. If it's logic, it's a service. If it talks to external APIs, it's an integration.

### Frontend Structure

```
frontend/
├── src/
│   ├── components/      # Reusable UI components
│   ├── pages/           # Page-level components
│   ├── services/        # API clients
│   └── hooks/           # Custom React hooks
```

**Rule**: Components are dumb (just display). Services call the API. Hooks manage state.

---

## Git Workflow

### Branches

```
main                    # Production-ready code
├── develop             # Integration branch
│   ├── feature/auth    # Feature branches
│   ├── feature/research
│   └── feature/video
```

**Rules**:
- Never commit directly to `main`
- Always branch from `develop`
- Use feature branches: `feature/milestone-task`
- Example: `feature/m2-authentication`

### Commit Messages

Format: `<type>: <short description>`

```
feat: Add YouTube upload endpoint
fix: Handle null video duration
docs: Update API design doc
refactor: Extract research service
chore: Update dependencies
test: Add tests for ranking algorithm
```

**For AI Assistants**: Commit after completing a logical unit of work, not after every function.

### Pull Requests

Every PR must have:
- [ ] Related issue/task reference (e.g., `Closes M2-T03`)
- [ ] Description of changes
- [ ] Testing instructions
- [ ] Related docs updated

---

## Coding Standards

### Python Backend

- **Style**: PEP 8 (use `black` for formatting)
- **Type Hints**: Required for all functions
- **Docstrings**: Google-style docstrings for classes and functions
- **Testing**: Unit tests for all business logic

```python
def score_idea(story: Story, channel: Channel) -> float:
    """Score an idea based on viral potential and audience fit.
    
    Args:
        story: The story to score
        channel: The target channel
        
    Returns:
        Score between 0 and 10
    """
    # Implementation
```

### React Frontend

- **Style**: Prettier + ESLint
- **Components**: Functional components with hooks
- **Props**: TypeScript props (or PropTypes)
- **Naming**: camelCase for functions/variables, PascalCase for components

```jsx
function VideoCard({ video, onApprove }) {
  return (
    <div className="card">
      {/* Component */}
    </div>
  );
}
```

### Documentation

- **Markdown**: Use Markdown for all docs
- **Clarity**: Write for someone who hasn't seen this project
- **Updates**: Update docs whenever code changes

---

## How AI Assistants Should Work on Brainrot

### Before Starting a Task

1. **Read the task specification**
   - What is the objective?
   - What files will you modify?
   - What are the done criteria?

2. **Read relevant documentation**
   - `/docs/03-architecture.md`
   - `/docs/05-database.md` (if touching DB)
   - `/docs/06-api.md` (if touching API)

3. **Check the decision log**
   - `/DECISIONS.md`
   - Why were certain choices made?

4. **Ask clarifying questions**
   - If the task is ambiguous, ask
   - If you're about to violate an architecture principle, ask

### While Coding

1. **Follow the architecture**
   - Provider abstraction layer for external services
   - Service layer for business logic
   - Models for database
   - Schemas for validation

2. **Write tests**
   - Unit tests for services
   - Integration tests for API endpoints
   - Include fixtures for test data

3. **Update documentation**
   - Update API docs if you add an endpoint
   - Update decision log if you make a design choice
   - Add comments only if the "why" isn't obvious

4. **Keep modules independent**
   - Don't create tight coupling between services
   - Use API contracts (schemas) for communication
   - Import from `services`, not other modules

### When Done

1. **Write a clear commit message**
   ```
   feat: Implement YouTube upload workflow
   
   - Add YouTube API integration
   - Handle video validation
   - Add retry logic for failed uploads
   - Add comprehensive logging
   ```

2. **Update relevant documentation**
   - API design doc (if new endpoints)
   - Architecture doc (if new service)
   - Milestone notes (progress tracking)

3. **Reference the task**
   - In commit: `Implements M5-T01`
   - In PR: `Closes M5-T01`

---

## Testing Requirements

### Unit Tests

```python
def test_score_idea_with_viral_content():
    # Setup
    story = create_test_story(trend_momentum=0.95)
    channel = create_test_channel()
    
    # Execute
    score = score_idea(story, channel)
    
    # Assert
    assert score > 8.0
```

### Integration Tests

```python
def test_youtube_upload_flow():
    # Setup
    video = create_test_video()
    channel = create_test_channel()
    
    # Execute
    result = upload_to_youtube(video, channel)
    
    # Assert
    assert result.status == "uploaded"
    assert result.youtube_id is not None
```

**Rule**: Run all tests before committing.

```bash
pytest                  # All tests
pytest tests/unit/      # Unit only
pytest --cov           # With coverage
```

---

## Documentation Updates

Every code change should update relevant docs:

| Change | Update |
|--------|--------|
| New API endpoint | `/docs/06-api.md` |
| New database model | `/docs/05-database.md` |
| New service | `/docs/03-architecture.md` |
| Design decision | `/DECISIONS.md` |
| Task completion | `/docs/milestones/M#/` |

---

## Debugging Issues

### When Something Breaks

1. **Check the logs**
   - Backend: `app/logs/`
   - Workers: `celery/logs/`

2. **Check the decision log**
   - Why was this designed this way?
   - Are we still following that principle?

3. **Check recent commits**
   - What changed?
   - Did it violate an architecture rule?

4. **Ask for help**
   - Reference the relevant docs
   - Include error logs
   - Describe what you tried

---

## Examples

### Example: Implementing a New Task

**Task**: `M3-T02: Build Reddit connector`

**Read First**:
- `/docs/03-architecture.md` (understand research engine design)
- `/docs/milestones/M3/README.md` (understand this milestone)
- `/DECISIONS.md` (understand why we chose this approach)

**Implement**:
```python
# backend/app/services/research/reddit_connector.py

from app.schemas import Story
from app.integrations import RedditProvider

class RedditConnector:
    """Fetches stories from subreddits."""
    
    def __init__(self, provider: RedditProvider):
        self.provider = provider
        
    def fetch_stories(self, subreddits: list[str]) -> list[Story]:
        """Fetch trending stories from Reddit."""
        # Implementation
```

**Test**:
```python
def test_reddit_connector_fetches_stories():
    connector = RedditConnector(mock_provider)
    stories = connector.fetch_stories(["r/Python", "r/MachineLearning"])
    assert len(stories) > 0
```

**Commit**:
```
feat: Implement Reddit connector for research engine

- Add RedditProvider integration
- Fetch stories from multiple subreddits
- Handle API rate limiting
- Add comprehensive logging
- Include tests for connector

Implements M3-T02
```

---

## Questions?

If something isn't clear:
1. Check the docs
2. Check the decision log
3. Ask for clarification before coding

**For AI Assistants**: If you're about to do something that seems to violate the architecture, stop and ask.

---

Last Updated: June 26, 2026
