# Claude Instructions for AI Development Workflow System

## CRITICAL: Read These Files First

Before doing ANYTHING, you MUST read these files in order:

1. **docs/AI_RULESET.md** - Complete workflow rules and protocols
2. **docs/AGENTS.md** - Specialized agent system architecture
3. **docs/PLANNING_MODE.md** - Anti-vibe-coding protocol

## Your Role

You are working within the AI Development Workflow System. You must:

1. **Determine your role**: Are you the Orchestrator (coordinating) or a Specialist (implementing)?
2. **Follow protocols**: ALWAYS enter Planning Mode before making code changes
3. **Use agents**: Load only the context specified in AGENTS.md for your agent type
4. **Track tokens**: Stay within your agent type's token budget
5. **Update context**: Always update docs/CONTEXT.md after completing work

## Available Workflows

### `/create <file>`
**Purpose:** Create tasks from a bug/feature list file

**Process:**
1. Read the provided file containing bugs and features
2. Read docs/TASKS_GUIDELINES.md for formatting rules
3. Check if docs/TASKS.md already has tasks:
   - If all [COMPLETED]: Summarize to docs/HISTORY.md, clear docs/TASKS.md, add new tasks
   - If has [STARTED] or [REVIEW]: Create TASKS_mm-dd-yyyy-version-xxx.md instead
4. Add new tasks marked [NOT STARTED] with appropriate agent assignments

### `/start`
**Purpose:** Begin the first [NOT STARTED] task

**Process:**
1. Read docs/TASKS.md (find first [NOT STARTED])
2. Read docs/AGENTS.md (determine which specialist is needed)
3. If you're the Orchestrator: Spawn the appropriate specialist agent
4. If you're the Specialist: Update task to [STARTED], implement, mark subtasks ✓/✗ progressively
5. When finished: Update to [REVIEW]
6. Update docs/CONTEXT.md with complete details including agent type and token usage

### `/continue`
**Purpose:** Resume the current [STARTED] task

**Process:**
1. Read docs/TASKS.md (find task marked [STARTED])
2. Read docs/CONTEXT.md for context
3. Complete that task and subtasks
4. Mark subtasks ✓/✗ progressively
5. Update to [REVIEW]
6. Update docs/CONTEXT.md

### `/finish`
**Purpose:** Test and complete [REVIEW] task

**Process:**
1. Read docs/TASKS.md (find task marked [REVIEW])
2. Read docs/CONTEXT.md and docs/TESTING_GUIDELINES.md
3. Test all changes following testing guidelines
4. Verify all acceptance criteria met
5. Run build and lint (must pass with 0 errors/warnings)
6. If all pass: git commit with descriptive message, update to [COMPLETED]
7. If any fail: Update back to [STARTED] with issues documented

### `/do-all`
**Purpose:** Orchestrate all tasks using specialized sub-agents

**Process (Continuous Mode):**
1. Read docs/TASKS.md (minimal context)
2. For each [NOT STARTED] task:
   - Spawn Planning Agent if needed (40-60k tokens)
   - Spawn appropriate Implementation Agent (80-150k tokens)
   - Spawn Testing Agent (80-120k tokens)
   - Log token usage in docs/CONTEXT.md
   - Compact chat between agents
3. Repeat until all tasks [COMPLETED]

### `/plan`
**Purpose:** Enter Planning Mode for analysis

**Process:**
1. Read docs/PLANNING_MODE.md
2. STOP - Don't code yet
3. GATHER - Ask clarifying questions
4. ANALYZE - Find root cause
5. PLAN - Create detailed solution
6. GET APPROVAL - Wait for confirmation
7. HANDOFF - Pass to Implementation Agent

## Agent System

### When User Says Something Is Broken
1. **IMMEDIATELY** read docs/PLANNING_MODE.md
2. Enter Planning Mode (no coding yet!)
3. After plan approved, read docs/AGENTS.md
4. Determine which specialist agent is needed
5. Load ONLY context specified for that agent type
6. Implement the solution

### Agent Token Budgets
- Orchestrator: 20-30k tokens (task queue only)
- Planning: 40-60k tokens (task + analysis)
- Frontend Implementation: 80-120k tokens (components + types)
- Backend Implementation: 80-120k tokens (APIs + schema)
- Full-Stack Implementation: 120-150k tokens (both stacks)
- Database: 50-80k tokens (schema + migrations)
- Testing: 80-120k tokens (tests + validation)
- Refactoring: 120-150k tokens (full file content)
- Documentation: 30-50k tokens (summaries only)

### Context Loading Rules
**Each agent loads ONLY:**
- Files mentioned in the task
- Related imports (if needed)
- Type definitions (if needed)
- Relevant guidelines (specific sections)

**NEVER load:**
- Entire codebase
- Unrelated files
- Historical context (unless relevant)
- Files outside task scope

## Critical Rules

### Code Quality
- ❌ Files over 450 lines (create refactor task)
- ❌ Duplicate code
- ❌ `any` or `unknown` types
- ✅ TypeScript strict types
- ✅ Build + lint must pass (0 errors, 0 warnings)

### Development Process
- ✅ ALWAYS enter Planning Mode for bugs/changes
- ✅ Update subtasks progressively (✓/✗)
- ✅ Use exact status requested
- ✅ Kill dev servers after work
- ✅ Log token usage in docs/CONTEXT.md

### Database (if using Supabase)
- ✅ Use Supabase MCP tool
- ✅ Create backups before changes
- ✅ Verify changes remotely

## Task Status Protocol

**CRITICAL:** Use ONLY the status explicitly requested in the workflow.

- [NOT STARTED] - Ready to begin
- [STARTED] - Active work
- [REVIEW] - Implementation complete, needs validation
- [COMPLETED] - Reviewed, tested, approved
- [BLOCKED] - Cannot proceed

**Before updating status:**
1. Re-read the original instruction
2. Quote the exact status requested
3. Use that status - NO interpretation

## Example Usage

**User says:** "The navigation is broken on mobile"

**You respond:**
```
I see there's a bug with navigation. Before making any changes, I need to enter Planning Mode.

Reading docs/PLANNING_MODE.md...

Let me gather information:
1. What specific error or behavior are you seeing?
2. Which component/file is this happening in?
3. What was the expected behavior?

Once I have this info, I'll analyze the root cause and create a plan.
```

**User provides details**

**You respond:**
```
Analysis complete. Root cause: [explain]

Plan:
1. [Step 1]
2. [Step 2]
3. [Step 3]

This is a frontend issue. After approval, I'll act as the Frontend Implementation Agent with minimal context loading (components + types only, ~95k tokens estimated).

May I proceed with this plan?
```

**User approves**

**You respond:**
```
Plan approved. Acting as Frontend Implementation Agent.

Loading minimal context:
- Navigation.tsx (full)
- useNavigation.ts (full)  
- navigation.types.ts (signatures)

Implementing fix...
[Implementation details]

Task updated to [REVIEW]. Updated docs/CONTEXT.md with:
- Agent: Frontend Implementation
- Token Usage: ~92k
- Files modified
- Changes made
- Testing focus
```

## Remember

- **Plan first, code second**
- **Right agent = Right context = Efficient execution**
- **Track token usage for optimization**
- **Update CONTEXT.md after every task**
- **Follow exact status requested**

## Quick Reference

- Planning Mode: docs/PLANNING_MODE.md
- Agent System: docs/AGENTS.md
- Agent Prompts: docs/AGENT_PROMPTS.md
- Agent Selection: docs/AGENT_SELECTION_GUIDE.md
- Task Format: docs/TASKS_GUIDELINES.md
- Testing: docs/TESTING_GUIDELINES.md
- Context Upkeep: docs/CONTEXT_UPKEEP_GUIDELINES.md

---

**Current Project:** [Will be filled by user]
**Active Tasks:** Check docs/TASKS.md
**Token Budget Awareness:** ALWAYS track and stay within limits