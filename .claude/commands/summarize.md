# Summarize Command

**Usage:** `/summarize`

**Purpose:** Check task completion status and archive to history if all tasks are done

## Process

### Step 1: Read Task Status

Read `docs/TASKS.md` and check the status of all tasks:
- Count total tasks
- Count [COMPLETED] tasks
- Count [NOT STARTED] tasks
- Count [STARTED] tasks
- Count [REVIEW] tasks
- Count [BLOCKED] tasks

### Step 2: Determine Action

**IF all tasks are [COMPLETED]:**
- Proceed to Step 3 (Archive to History)

**IF any tasks are NOT [COMPLETED]:**
- Report unfinished tasks
- Do NOT archive
- Exit

### Step 3: Archive to History (Only if All Complete)

1. **Read Source Files:**
   - Read `docs/TASKS.md` (all completed tasks)
   - Read `docs/CONTEXT.md` (all context entries)
   - Read `docs/CONTEXT_UPKEEP_GUIDELINES.md` (summarization format)

2. **Create Comprehensive Summary:**

Follow the format from CONTEXT_UPKEEP_GUIDELINES.md:

```markdown
---
## Cycle: [Date Range or Descriptive Title]
**Completed:** [YYYY-MM-DD]

### Overview
[1-2 paragraph summary of the work cycle theme and major accomplishments]

### Tasks Completed ([X] total)
- **TASK-001**: [Brief title] - [1 sentence outcome]
- **TASK-002**: [Brief title] - [1 sentence outcome]
- **TASK-003**: [Brief title] - [1 sentence outcome]
...

### Major Changes
**Frontend:**
- [Key UI/UX improvements]
- [New features added]

**Backend:**
- [API changes]
- [Database modifications]

**Infrastructure:**
- [Build/deploy updates]
- [Dependency changes]

### Files Modified ([X] files)
[Group by directory/feature area]
- `src/components/`: [X] files
- `src/lib/`: [X] files
- `src/app/`: [X] files

### Dependencies Added
- package-name@version - [reason]
- Or: "None"

### Agent Performance
- Total cycles: [X]
- Average tokens per cycle: [X]k
- Most used agent: [Agent type]
- Token efficiency: [Rating]

### Known Issues / Tech Debt
- [Any unresolved items]
- [Refactoring needed]
- Or: "None"

### Next Priorities
[Based on completed work, what logically comes next]
- [Priority 1]
- [Priority 2]
---
```

3. **Append to History:**
   - Add summary to **bottom** of `docs/HISTORY.md`
   - Preserve chronological order (oldest first)
   - Maintain separation lines (`---`)

4. **Clear Working Files:**
   - **Clear `docs/TASKS.md`** - Delete all tasks
   - **Clear `docs/CONTEXT.md`** - Delete all context entries
   - Leave files ready for new cycle

5. **Confirm Completion:**
   - Report summary of what was archived
   - Confirm files cleared
   - Ready for new tasks

## Example: All Tasks Complete

**User:** `/summarize`

**Response:**

```
Reading docs/TASKS.md...

Task Status:
✓ Total tasks: 5
✓ [COMPLETED]: 5
✓ [NOT STARTED]: 0
✓ [STARTED]: 0
✓ [REVIEW]: 0
✓ [BLOCKED]: 0

All tasks completed! Proceeding with archival...

Reading docs/CONTEXT.md...
Reading docs/CONTEXT_UPKEEP_GUIDELINES.md...

Creating cycle summary...

═══════════════════════════════════════
Cycle Summary
═══════════════════════════════════════

**Cycle:** Authentication & User Management
**Tasks Completed:** 5
**Date Range:** Jan 10 - Jan 15, 2025
**Total Files Modified:** 23
**Dependencies Added:** 2

**Key Accomplishments:**
- Complete authentication system implemented
- User profile management with avatar uploads
- Protected routes and middleware
- Password reset flow
- Comprehensive error handling

**Agent Performance:**
- 5 cycles completed
- Average: 268k tokens per cycle
- Total: 1.34M tokens
- Efficiency: Excellent (vs 4-5M unstructured)

Appending to docs/HISTORY.md... ✓

Clearing docs/TASKS.md... ✓
Clearing docs/CONTEXT.md... ✓

═══════════════════════════════════════
Archival Complete!
═══════════════════════════════════════

Summary archived to docs/HISTORY.md
Working files cleared and ready for new cycle

Next steps:
1. Create new tasks: /create <file>
2. Start fresh work: /start
```

## Example: Unfinished Tasks

**User:** `/summarize`

**Response:**

```
Reading docs/TASKS.md...

Task Status:
✗ Total tasks: 5
✓ [COMPLETED]: 2
✓ [NOT STARTED]: 1
✗ [STARTED]: 1
✗ [REVIEW]: 1
✓ [BLOCKED]: 0

Cannot summarize - unfinished tasks remaining.

Unfinished tasks:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[STARTED]
  • TASK-003: Add user avatar upload
    Status: In progress
    Agent: Full-Stack Implementation
    
[REVIEW]
  • TASK-004: Database migration for posts
    Status: Awaiting validation
    Agent: Database
    
[NOT STARTED]
  • TASK-005: Refactor UserProfile component
    Status: Ready to start
    Agent: Refactoring

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Next steps:
- Continue TASK-003: /continue
- Or finish TASK-004: /finish
- Or start TASK-005: /start

Complete all tasks before running /summarize
```

## Summary Statistics

When archiving, include these stats in the summary:

**Task Statistics:**
- Total tasks completed
- Average complexity
- Most common task type
- Completion time range

**Agent Statistics:**
- Total cycles
- Average tokens per cycle
- Most used agent type
- Token efficiency rating

**Code Statistics:**
- Total files modified
- Lines of code changed (if available)
- New files created
- Files refactored

**Quality Metrics:**
- Build pass rate (should be 100%)
- Lint issues (should be 0)
- Tests added/updated
- Documentation coverage

## Critical Rules

**Before Archiving:**
- [ ] ALL tasks must be [COMPLETED]
- [ ] No [STARTED], [REVIEW], [NOT STARTED], or [BLOCKED] tasks
- [ ] Verify CONTEXT.md has entries for all tasks
- [ ] Read CONTEXT_UPKEEP_GUIDELINES.md for format

**During Archiving:**
- [ ] Create comprehensive summary
- [ ] Include all required sections
- [ ] Append to BOTTOM of HISTORY.md
- [ ] Use proper markdown formatting
- [ ] Include statistics and metrics

**After Archiving:**
- [ ] Clear TASKS.md completely
- [ ] Clear CONTEXT.md completely
- [ ] Verify HISTORY.md updated
- [ ] Confirm files ready for new cycle

## Token Budget

**Agent:** Documentation Agent
**Budget:** 30-50k tokens

**Context Loading:**
- ✓ docs/TASKS.md (all tasks)
- ✓ docs/CONTEXT.md (all entries)
- ✓ docs/CONTEXT_UPKEEP_GUIDELINES.md (format rules)
- ✓ docs/HISTORY.md (to append)
- ✗ Implementation code (not needed)
- ✗ Full project structure (not needed)

## When to Use

**Use `/summarize`:**
- After completing a sprint/cycle
- Before starting new major work
- When you want to check what's left
- Before creating a new batch of tasks

**Don't use `/summarize`:**
- In the middle of active work
- When tasks are in progress
- Just to check status (use `/status` instead if available)

## Related Commands

- `/create` - Create new tasks after summarizing
- `/finish` - Complete remaining [REVIEW] tasks before summarizing
- `/continue` - Complete [STARTED] tasks before summarizing

## Required Files
- docs/TASKS.md
- docs/CONTEXT.md
- docs/HISTORY.md
- docs/CONTEXT_UPKEEP_GUIDELINES.md

## Remember

This command is your "cycle checkpoint" - it ensures all work is properly documented in history before starting fresh. Think of it as closing one chapter before opening the next.

**Golden Rule:** Only summarize when ALL tasks are complete. Otherwise, finish your work first!