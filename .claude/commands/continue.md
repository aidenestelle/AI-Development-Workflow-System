# Continue Task Command

**Usage:** `/continue`

**Purpose:** Resume the current [STARTED] task

## Process

### Step 1: Find Current Task
1. Read `docs/TASKS.md` (find task marked [STARTED])
2. Read `docs/CONTEXT.md` (understand what's been done so far)
3. Read `docs/AGENTS.md` (confirm which specialist agent is needed)

### Step 2: Load Appropriate Agent Context
Based on the task type, load the right specialist agent with appropriate context:

**Frontend Task:**
- Token budget: 80-120k
- Load: Components, types, styles
- Exclude: Backend, database

**Backend Task:**
- Token budget: 80-120k
- Load: APIs, schema, middleware
- Exclude: Frontend components

**Full-Stack Task:**
- Token budget: 120-150k
- Load: Both frontend and backend files
- Exclude: Unrelated features

**Database Task:**
- Token budget: 50-80k
- Load: Schema, migrations
- Exclude: Application code

**Refactoring Task:**
- Token budget: 120-150k
- Load: Full file(s) being refactored
- Exclude: Unrelated files

### Step 3: Review Progress
Check which subtasks are already completed:
- Review ✓ marked subtasks
- Identify remaining ✗ or unmarked subtasks
- Understand current implementation state

### Step 4: Continue Implementation
1. Complete remaining subtasks
2. Mark each subtask ✓/✗ as you finish it
3. Follow the approved plan (if exists in CONTEXT.md)
4. Stay within token budget
5. Maintain all code quality standards:
   - Files <450 lines
   - No `any` or `unknown` types
   - Build and lint must pass
   - Follow ADHD/Autistic UX patterns (if frontend)

### Step 5: Complete and Document
1. When all subtasks done, update task to [REVIEW]
2. Update `docs/CONTEXT.md` with:
   - Continuation details
   - Additional changes made
   - Token usage
   - All subtasks status

## Example

**User:** `/continue`

**Response:**
```
Reading docs/TASKS.md...

Current task: TASK-042 - Add user avatar upload [STARTED]

Reading docs/CONTEXT.md...
Previous work:
- Agent: Full-Stack Implementation
- Created AvatarUpload component (frontend)
- Added upload API endpoint (backend)
- Remaining: Error handling, loading states, testing

Reading docs/AGENTS.md...
This is still a full-stack task.

Resuming as Full-Stack Implementation Agent (120-150k budget)...

Context loading:
✓ AvatarUpload.tsx (completed)
✓ UserProfile.tsx (in progress)
✓ uploadAvatar API (completed)
✓ Storage utilities (need updates)
✓ Type definitions

Estimated context: ~105k tokens

Subtasks status:
✓ Create AvatarUpload component
✓ Create upload API
✓ Add storage utilities
✗ Add comprehensive error handling (STARTING NOW)
✗ Add loading states
✗ Add tests

Continuing implementation...

[Implementation details]

✓ Added error handling for:
  - File type validation
  - File size limits
  - Upload failures
  - Network errors
  
✓ Added loading states:
  - Upload progress indicator
  - Spinner during processing
  - Success confirmation
  
✓ Added manual tests checklist

All subtasks complete!

Task status: [STARTED] → [REVIEW]

Updated docs/CONTEXT.md:
- Continuation by: Full-Stack Implementation Agent
- Additional token usage: ~48k
- Total cycle tokens: ~153k
- All subtasks: ✓ Complete
```

## When to Use Continue vs Start

**Use `/continue`:**
- Task is already [STARTED]
- You're resuming existing work
- Some subtasks are already ✓ complete

**Use `/start`:**
- Task is [NOT STARTED]
- Beginning fresh work
- No previous context

## Critical Rules

- ALWAYS read CONTEXT.md to understand previous work
- ALWAYS check which subtasks are done
- NEVER restart completed subtasks
- Stay within agent's token budget
- Mark progress progressively
- Update CONTEXT.md with continuation details

## Required Files
- docs/TASKS.md
- docs/CONTEXT.md (critical for understanding previous work)
- docs/AGENTS.md
- docs/AI_RULESET.md