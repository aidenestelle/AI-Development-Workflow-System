# Do All Tasks Command (Continuous Mode)

**Usage:** `/do-all`

**Purpose:** Automatically process all tasks using orchestration with specialized agents

**⚠️ Warning:** This command will run continuously until all tasks are [COMPLETED]. Use for automation.

## Process

### Orchestration Loop

```
REPEAT until no [NOT STARTED] or [STARTED] tasks remain:
  1. Load task queue (20-30k tokens)
  2. Spawn Planning Agent if needed (40-60k tokens)
  3. Spawn Implementation Agent (80-150k tokens)
  4. Compact chat
  5. Spawn Testing Agent (80-120k tokens)
  6. Compact chat
  7. Log token metrics
  8. Continue to next task
```

### Step-by-Step Execution

**For EACH task in docs/TASKS.md:**

#### Phase 1: Task Identification
```
Orchestrator (20-30k tokens):
- Read docs/TASKS.md
- Find next [NOT STARTED] task
- Identify task type
- Determine agents needed
```

#### Phase 2: Planning (if needed)
```
IF task is bug fix OR has unclear requirements:
  Spawn Planning Agent (40-60k tokens):
  - Read docs/PLANNING_MODE.md
  - Analyze problem
  - Create plan
  - Get approval (automated or user confirmation)
  - Log token usage
  
  Compact chat after planning
```

#### Phase 3: Implementation
```
Spawn appropriate Implementation Agent:

Frontend (80-120k tokens):
- Load component files only
- Implement changes
- Mark subtasks progressively
- Update to [REVIEW]

Backend (80-120k tokens):
- Load API/logic files only
- Implement changes
- Use Supabase MCP if database
- Update to [REVIEW]

Full-Stack (120-150k tokens):
- Load both frontend and backend
- Implement end-to-end
- Update to [REVIEW]

Database (50-80k tokens):
- Create backup first
- Run migrations
- Update to [REVIEW]

Refactoring (120-150k tokens):
- Load full file(s)
- Split into smaller files
- Update to [REVIEW]

Log token usage
Compact chat after implementation
```

#### Phase 4: Testing
```
Spawn Testing Agent (80-120k tokens):
- Read docs/TESTING_GUIDELINES.md
- Load changed files only
- Run build (must pass)
- Run lint (must pass)
- Test all acceptance criteria
- If pass: Update to [COMPLETED]
- If fail: Update to [STARTED], document issues

Log token usage
Compact chat after testing
```

#### Phase 5: Metrics & Continue
```
Update docs/CONTEXT.md with cycle metrics:
- Orchestrator tokens
- Planning tokens (if used)
- Implementation tokens
- Testing tokens
- Total cycle tokens
- Efficiency rating

Check docs/TASKS.md for next task
If tasks remain: REPEAT from Phase 1
If no tasks remain: COMPLETE
```

## Example Execution

**User:** `/do-all`

**Response:**
```
╔══════════════════════════════════════╗
║  CONTINUOUS MODE ACTIVATED           ║
║  Processing all tasks automatically  ║
╚══════════════════════════════════════╝

Reading docs/TASKS.md...
Found 3 tasks: 2 [NOT STARTED], 1 [STARTED]

════════════════════════════════════════
CYCLE 1: TASK-042 - Fix navigation bug
════════════════════════════════════════

Orchestrator (25k tokens):
- Task type: Bug fix
- Agent needed: Planning → Frontend

Phase 1: Planning
├─ Planning Agent (48k tokens)
├─ Root cause: Stale closure in hook
├─ Plan: Refactor to useReducer
└─ Plan approved ✓

Compacting chat...

Phase 2: Implementation
├─ Frontend Agent (95k tokens)
├─ Files: Navigation.tsx, useNavigation.ts
├─ Implementation complete
└─ Status: [REVIEW]

Compacting chat...

Phase 3: Testing
├─ Testing Agent (88k tokens)
├─ Build: ✓ Pass
├─ Lint: ✓ Pass
├─ All criteria: ✓ Pass
└─ Status: [COMPLETED]

Compacting chat...

Cycle 1 Metrics:
- Orchestrator: 25k
- Planning: 48k
- Frontend Impl: 95k
- Testing: 88k
- Total: 256k tokens
- Efficiency: Excellent

════════════════════════════════════════
CYCLE 2: TASK-043 - Add avatar upload
════════════════════════════════════════

Orchestrator (28k tokens):
- Task type: New feature
- Agent needed: Full-Stack

Phase 1: Implementation
├─ Full-Stack Agent (142k tokens)
├─ Files: Frontend + Backend
├─ Implementation complete
└─ Status: [REVIEW]

Compacting chat...

Phase 2: Testing
├─ Testing Agent (105k tokens)
├─ Build: ✓ Pass
├─ Lint: ✓ Pass
├─ All criteria: ✓ Pass
└─ Status: [COMPLETED]

Compacting chat...

Cycle 2 Metrics:
- Orchestrator: 28k
- Full-Stack Impl: 142k
- Testing: 105k
- Total: 275k tokens
- Efficiency: Good

════════════════════════════════════════
CYCLE 3: TASK-044 - Database migration
════════════════════════════════════════

[Similar pattern continues...]

════════════════════════════════════════
ALL TASKS COMPLETED
════════════════════════════════════════

Summary:
- Tasks completed: 3
- Total cycles: 3
- Total tokens: ~785k
- Average per cycle: ~262k
- Efficiency: Excellent

All tasks in docs/TASKS.md are now [COMPLETED].

Archiving to docs/HISTORY.md...
✓ Cycle archived

Ready for new tasks!
```

## Token Budget Tracking

After EACH cycle, log in docs/CONTEXT.md:

```markdown
## Cycle [N] Token Usage

**Task:** TASK-XXX - [Title]

**Agent Performance:**
- Orchestrator: [X]k tokens (budget: 20-30k) ✓/✗
- Planning: [X]k tokens (budget: 40-60k) ✓/✗
- [Specialist]: [X]k tokens (budget: [Y]k) ✓/✗
- Testing: [X]k tokens (budget: 80-120k) ✓/✗

**Total:** [X]k tokens
**Efficiency:** [Excellent/Good/Needs Optimization]

**Notes:** [Any observations about token usage]
```

## Safety Features

**Automatic Stops:**
- If build fails 3 times in a row → STOP, notify user
- If same task fails testing 3 times → STOP, mark [BLOCKED]
- If token usage exceeds 200% of budget → STOP, review context loading
- After 10 cycles → STOP, suggest break and review

**User Override:**
- User can type "STOP" at any time to halt continuous mode
- User can type "PAUSE" to pause after current cycle

## When to Use

**Use `/do-all` when:**
- Multiple simple tasks in queue
- Clear task definitions
- You want automation
- You'll be away and want progress

**DON'T use `/do-all` when:**
- Tasks are unclear or complex
- Need human decision-making
- Want to review each step
- Learning the system

## Critical Rules

- ALWAYS compact chat between agents
- ALWAYS log token metrics per cycle
- NEVER exceed 5 cycles without user confirmation
- ALWAYS stop if any safety trigger hits
- Track cumulative token usage

## Required Files
- docs/TASKS.md
- docs/AGENTS.md
- docs/PLANNING_MODE.md
- docs/TESTING_GUIDELINES.md
- docs/CONTEXT.md
- docs/AI_RULESET.md