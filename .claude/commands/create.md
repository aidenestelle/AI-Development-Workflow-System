# Create Tasks Command

**Usage:** `/create <file>`

**Purpose:** Create tasks from a bug/feature list file

## Process

1. Read the file provided by the user (e.g., `tasks_list.md`)
2. Read `docs/TASKS_GUIDELINES.md` for formatting rules
3. Read `docs/CONTEXT_UPKEEP_GUIDELINES.md` for context management

4. **Check existing tasks in `docs/TASKS.md`:**
   
   **IF all tasks are [COMPLETED]:**
   - Summarize both `docs/TASKS.md` and `docs/CONTEXT.md`
   - Append summary to bottom of `docs/HISTORY.md`
   - Delete all tasks from `docs/TASKS.md`
   - Add new tasks marked [NOT STARTED]
   
   **IF tasks are [STARTED] or [REVIEW]:**
   - Create `TASKS_mm-dd-yyyy-version-xxx.md` with new tasks
   - Inform user: "⚠️ Unfinished tasks exist in TASKS.md. Created separate file."
   - Do NOT modify existing `docs/TASKS.md`

5. **Structure new tasks:**
   - Follow `TASKS_GUIDELINES.md` formatting exactly
   - Assign specialized agent to each task/subtask (Frontend, Backend, Database, etc.)
   - All tasks marked [NOT STARTED]
   - Include acceptance criteria
   - Include subtasks
   - Estimate complexity

## Example

**User:** `/create bugs-jan-2025.md`

**Response:**
```
Reading bugs-jan-2025.md...
Reading docs/TASKS_GUIDELINES.md...
Checking docs/TASKS.md...

All existing tasks are [COMPLETED]. Archiving to HISTORY.md...

Created 5 new tasks in docs/TASKS.md:
- TASK-001: Fix mobile navigation [Frontend Agent]
- TASK-002: API timeout on large requests [Backend Agent]
- TASK-003: Add user avatar upload [Full-Stack Agent]
- TASK-004: Database migration for posts [Database Agent]
- TASK-005: Refactor UserProfile.tsx (>450 lines) [Refactoring Agent]

All tasks marked [NOT STARTED] and ready to work on.
```

## Required Files
- Input file (user provides)
- docs/TASKS_GUIDELINES.md
- docs/CONTEXT_UPKEEP_GUIDELINES.md
- docs/TASKS.md
- docs/CONTEXT.md
- docs/HISTORY.md