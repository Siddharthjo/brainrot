---
name: Task
about: A specific task within a milestone
title: "[TASK] "
labels: task
assignees: ''

---

## Task Information

**Task ID**: M#-T##
**Milestone**: M#
**Related Docs**: `/docs/milestones/M#/README.md`

## Objective

Clear statement of what this task is trying to accomplish.

## Requirements

- [ ] Requirement 1
- [ ] Requirement 2
- [ ] Requirement 3

## Files Involved

- `backend/app/services/...`
- `frontend/src/components/...`
- `docs/milestones/M#/...`

## Done Criteria

- [ ] Code implemented
- [ ] Tests written (>80% coverage)
- [ ] Documentation updated
- [ ] Related docs linked
- [ ] Code reviewed
- [ ] Commit message formatted correctly
- [ ] Branch merged to develop

## Technical Notes

Any specific architectural decisions or constraints to keep in mind:

- Must use provider abstraction layer
- Keep modules independent
- Update decision log if making design choices
- Follow CONTRIBUTING.md guidelines

## Example

If applicable, provide an example of the expected behavior.

## Testing Instructions

How to test this task:

```bash
pytest tests/test_...
```

## Blockers

Any dependencies or blockers:

- [ ] Depends on M#-T##
- [ ] Blocked by [issue/PR]

## Related Issues / PRs

Link any related work.
