# Start Task Command

**Usage:** `/start`

**Purpose:** Begin the first [NOT STARTED] task with appropriate specialized agent

## Process

### Step 1: Orchestrator Mode (You)
1. Read `docs/TASKS.md` (minimal - just find first [NOT STARTED] task)
2. Read `docs/AGENTS.md` (determine which specialist is needed)
3. Read `docs/PLANNING_MODE.md` (if bug/change, planning needed)

### Step 2: Determine Agent Type
Based on the task, identify which specialist agent is needed:
- **Frontend Agent** - UI/UX, React components, styling
- **Backend Agent** - APIs, business logic, server-side
- **Full-Stack Agent** - Features spanning both stacks
- **Database Agent** - Schema changes, migrations
- **Refactoring Agent** - Files >450 lines, code quality
- **Planning Agent** - Bug fixes, unclear requirements

### Step 3: Spawn Planning Agent (if needed)
If task involves bugs or changes:
1. Use Planning Agent (40-60k token budget)
2. Enter Planning Mode protocol
3. Get plan approval
4. Then proceed to implementation

### Step 4: Spawn Implementation Agent
1. Load ONLY context specified in `docs/AGENTS.md` for that agent type
2. Update task status to [STARTED]
3. Implement ONLY that task and its subtasks
4. Mark each subtask ✓/✗ progressively as you work
5. Stay within token budget for agent type

### Step 5: Complete and Document
1. When finished, update task to [REVIEW]
2. Update `docs/CONTEXT.md` with:
   - Task ID and title
   - Agent type used
   - Token usage (approximate)
   - Files modified (complete list with paths)
   - Changes made (detailed description)
   - New functionality
   - Testing focus
   - Dependencies added
   - Expected behavior
   - Context efficiency (what was loaded, what excluded)

## Token Budgets by Agent
- Frontend Implementation: 80-120k
- Backend Implementation: 80-120k
- Full-Stack Implementation: 120-150k
- Database: 50-80k
- Refactoring: 120-150k
- Planning: 40-60k

## Example

**User:** `/start`

**Response:**
```
Reading docs/TASKS.md...

Next task: TASK-001 - Fix mobile navigation [NOT STARTED]

Reading docs/AGENTS.md...
This is a bug fix requiring Planning Mode first.

Spawning Planning Agent (40-60k token budget)...
Reading docs/PLANNING_MODE.md...

[Planning Agent Analysis]
Root cause: Navigation state lost due to stale closure in hook
Plan: Refactor useNavigation to useReducer pattern

Awaiting approval to proceed...
```

**After approval:**
```
Plan approved.

Spawning Frontend Implementation Agent (80-120k token budget)...

Context Loading:
✓ Navigation.tsx (287 lines)
✓ useNavigation.ts (156 lines)
✓ navigation.types.ts (45 lines)
✗ Unrelated components (excluded)

Total context: ~95k tokens

Implementing...
[Implementation details]

✓ Refactored to useReducer
✓ Added state persistence
✓ All files <450 lines

Task status: [STARTED] → [REVIEW]
Updated docs/CONTEXT.md
Token usage logged: 92k tokens
```

## Required Files
- docs/TASKS.md
- docs/AGENTS.md
- docs/PLANNING_MODE.md (if bug/change)
- docs/AI_RULESET.md (code standards)
- docs/CONTEXT.md