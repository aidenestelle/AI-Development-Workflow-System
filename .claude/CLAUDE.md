# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

---

## Repository Overview

**AI Development Workflow System v2.0.0** - A structured workflow system for AI-assisted development that prevents "vibe coding" through specialized agents, planning-first protocols, and token-efficient context loading.

**Purpose:** This is the workflow system itself. When integrated into user projects, it provides 6 slash commands and 9 specialized agents for systematic development.

---

## Quick Orientation

### What You're Working With
- **Type:** Workflow system/framework (not a traditional codebase)
- **Primary Files:** Documentation and command definitions in `.claude/` and `docs/`
- **No Build Process:** This is a documentation-based system
- **No Tests:** System behavior is defined by markdown protocols
- **No Dependencies:** Pure Claude Code slash command system

### First Steps for New Claude Instances
1. Read `docs/AI_RULESET.md` for core protocols
2. Read `docs/AGENTS.md` for agent architecture
3. Read `docs/PLANNING_MODE.md` for anti-vibe-coding protocol
4. Check `docs/TASKS.md` for current work queue

---

## Repository Structure

```
AI-Development-Workflow-System/
├── .claude/
│   ├── CLAUDE.md              # This file
│   ├── commands/              # Slash command definitions
│   │   ├── create.md          # /create - Task creation
│   │   ├── start.md           # /start - Begin tasks
│   │   ├── continue.md        # /continue - Resume work
│   │   ├── finish.md          # /finish - Validation
│   │   ├── do-all.md          # /do-all - Full automation
│   │   └── plan.md            # /plan - Planning mode
│   └── agents/                # Agent prompt templates
│
├── docs/
│   ├── AI_RULESET.md          # Core workflow rules (READ FIRST)
│   ├── AGENTS.md              # Agent system architecture
│   ├── AGENT_SELECTION_GUIDE.md   # Visual agent selection flowchart
│   ├── AGENT_PROMPTS.md       # Complete agent templates
│   ├── PLANNING_MODE.md       # Anti-vibe-coding protocol
│   ├── TASKS_GUIDELINES.md    # Task formatting rules
│   ├── TESTING_GUIDELINES.md  # Quality validation standards
│   ├── CONTEXT_UPKEEP_GUIDELINES.md  # Context maintenance
│   ├── TASKS.md               # Active task queue
│   ├── CONTEXT.md             # Current session context
│   └── HISTORY.md             # Completed work archive
│
├── guide/
│   ├── CONTRIBUTING.md        # Contribution guidelines
│   └── CHANGELOG.md           # Version history
│
└── README.md                  # User-facing documentation
```

---

## System Architecture

### Core Concept: Specialized Agent System

The system uses **9 specialized agents** that load minimal, task-specific context:

| Agent | Token Budget | Purpose |
|-------|--------------|---------|
| **Orchestrator** | 20-30k | Task delegation and coordination |
| **Planning** | 40-60k | Problem analysis and solution design |
| **Frontend** | 80-120k | React/UI implementation |
| **Backend** | 80-120k | API/business logic |
| **Full-Stack** | 120-150k | End-to-end features |
| **Database** | 50-80k | Schema and migrations |
| **Testing** | 80-120k | Quality validation |
| **Refactoring** | 120-150k | Code quality improvements |
| **Documentation** | 30-50k | Context maintenance |

**Key Innovation:** Each agent loads ONLY the context needed for their specific role, achieving 50-80% token reduction vs. loading entire codebases.

### Workflow Philosophy

**Planning-First Protocol:**
1. **STOP** - No immediate coding
2. **GATHER** - Ask clarifying questions
3. **ANALYZE** - Find root cause
4. **PLAN** - Design solution
5. **APPROVE** - Get confirmation
6. **EXECUTE** - Implement with right agent

**Anti-Vibe-Coding:** No rushed implementations. Every change requires analysis and planning.

---

## Available Slash Commands

### `/create <file>`
**Creates tasks from a bug/feature list file**

```bash
# Usage
/create tasks_list.md
```

**Process:**
1. Reads provided file containing bugs/features
2. Reads `docs/TASKS_GUIDELINES.md` for formatting
3. Checks `docs/TASKS.md` status:
   - All [COMPLETED] → Archive to HISTORY.md, add new tasks
   - Has [STARTED]/[REVIEW] → Create dated backup file
4. Adds tasks marked [NOT STARTED] with agent assignments

---

### `/start`
**Begins the first [NOT STARTED] task**

```bash
# Usage
/start
```

**Process:**
1. Reads `docs/TASKS.md` (finds first [NOT STARTED])
2. Reads `docs/AGENTS.md` (determines specialist needed)
3. As Orchestrator: Spawns appropriate specialist agent
4. As Specialist: Updates to [STARTED], implements, marks subtasks progressively
5. When finished: Updates to [REVIEW]
6. Updates `docs/CONTEXT.md` with details

**Example:**
- Task requires UI changes → Spawns Frontend Agent (loads only UI files, ~95k tokens)
- Task requires API changes → Spawns Backend Agent (loads only API files, ~88k tokens)

---

### `/continue`
**Resumes current [STARTED] task**

```bash
# Usage
/continue
```

**Process:**
1. Reads `docs/TASKS.md` (finds [STARTED] task)
2. Reads `docs/CONTEXT.md` for session context
3. Completes task and subtasks
4. Marks subtasks ✓/✗ progressively
5. Updates to [REVIEW]
6. Updates `docs/CONTEXT.md`

---

### `/finish`
**Tests and completes [REVIEW] task**

```bash
# Usage
/finish
```

**Process:**
1. Reads `docs/TASKS.md` (finds [REVIEW] task)
2. Reads `docs/CONTEXT.md` and `docs/TESTING_GUIDELINES.md`
3. Tests all changes following guidelines
4. Verifies acceptance criteria
5. Runs build and lint (must pass with 0 errors/warnings)
6. If pass: Git commit + update to [COMPLETED]
7. If fail: Update to [STARTED] with issues documented

---

### `/do-all`
**Orchestrates all tasks using specialized sub-agents**

```bash
# Usage
/do-all
```

**Process (Continuous Mode):**
1. Reads `docs/TASKS.md` (minimal context)
2. For each [NOT STARTED] task:
   - Spawns Planning Agent if needed (40-60k tokens)
   - Spawns Implementation Agent (80-150k tokens)
   - Spawns Testing Agent (80-120k tokens)
   - Logs token usage in `docs/CONTEXT.md`
   - Compacts chat between agents
3. Repeats until all tasks [COMPLETED]

**Use Case:** Full automation of entire task queue with optimal token efficiency.

---

### `/plan`
**Enters Planning Mode for deep analysis**

```bash
# Usage
/plan
```

**Process:**
1. Reads `docs/PLANNING_MODE.md`
2. **STOP** - Don't code yet
3. **GATHER** - Ask clarifying questions
4. **ANALYZE** - Find root cause
5. **PLAN** - Create detailed solution
6. **GET APPROVAL** - Wait for confirmation
7. **HANDOFF** - Pass to Implementation Agent

**Triggers Automatically When:**
- User reports bug/error
- User requests feature
- User describes unexpected behavior
- User asks to modify code

---

## Critical Rules & Protocols

### Code Quality Standards
- ❌ Files over 450 lines (create refactor task)
- ❌ Duplicate code
- ❌ `any` or `unknown` types
- ✅ TypeScript strict types
- ✅ Build + lint must pass (0 errors, 0 warnings)

### Task Status Protocol

**CRITICAL:** Use ONLY the exact status requested by the workflow.

**Status Values:**
- `[NOT STARTED]` - Ready to begin
- `[STARTED]` - Active work
- `[REVIEW]` - Implementation complete, needs validation
- `[COMPLETED]` - Reviewed, tested, approved
- `[BLOCKED]` - Cannot proceed

**Before Updating Status:**
1. Re-read original instruction word-for-word
2. Quote exact status requested
3. Use ONLY that status - no interpretation

❌ **Wrong:** "Technical work done, marking COMPLETED"
✅ **Right:** "User said 'mark as [REVIEW]', using [REVIEW]"

### Development Process
- ✅ ALWAYS enter Planning Mode for bugs/changes
- ✅ Update subtasks progressively (✓/✗)
- ✅ Use exact status requested
- ✅ Kill dev servers after work
- ✅ Log token usage in `docs/CONTEXT.md`

### Agent Selection
**Determine Your Role:**
- **Orchestrator** → Coordinate and delegate (don't implement)
- **Specialist** → Load minimal context and implement

**Mental Check:** "Am I coordinating tasks or implementing tasks?"

---

## Common Workflows

### Workflow 1: Bug Report Handling

**User says:** "The navigation is broken on mobile"

**Your response:**
```
I see there's a bug with navigation. Before making any changes,
I need to enter Planning Mode.

Reading docs/PLANNING_MODE.md...

Let me gather information:
1. What specific error or behavior are you seeing?
2. Which component/file is this happening in?
3. What was the expected behavior?

Once I have this info, I'll analyze the root cause and create a plan.
```

**After user provides details:**
```
Analysis complete. Root cause: [explain]

Plan:
1. [Step 1]
2. [Step 2]
3. [Step 3]

This is a frontend issue. After approval, I'll act as the
Frontend Implementation Agent with minimal context loading
(components + types only, ~95k tokens estimated).

May I proceed with this plan?
```

**After approval:**
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

---

### Workflow 2: Task Queue Processing

**User says:** "/start"

**Your response as Orchestrator:**
```
Reading docs/TASKS.md...

Found: TASK-001: Add user avatar upload [NOT STARTED]
Required Agent: Full-Stack Implementation

Spawning Full-Stack Implementation Agent...
[Agent spawns and works]

Task completed. Updated to [REVIEW].
Token usage: 142k (Full-Stack Agent)
Updated docs/CONTEXT.md
```

---

### Workflow 3: Continuous Automation

**User says:** "/do-all"

**Your response as Orchestrator:**
```
Reading docs/TASKS.md...
Found 5 tasks: [NOT STARTED]

Task 1: Bug fix (Planning → Frontend → Testing)
- Planning Agent: 48k tokens
- Frontend Agent: 95k tokens
- Testing Agent: 105k tokens
- Total: 248k tokens
[COMPLETED]

Task 2: Feature addition (Planning → Full-Stack → Testing)
- Planning Agent: 52k tokens
- Full-Stack Agent: 142k tokens
- Testing Agent: 118k tokens
- Total: 312k tokens
[COMPLETED]

... [continues for all tasks]

All 5 tasks completed.
Total token usage: 1.2M (vs ~4.5M without agent system)
Savings: 73%
```

---

## Context Loading Rules

### Each Agent Loads ONLY:
- Files mentioned in the task
- Related imports (if needed)
- Type definitions (if needed)
- Relevant guidelines (specific sections)

### NEVER Load:
- Entire codebase
- Unrelated files
- Historical context (unless relevant)
- Files outside task scope

### Example Context Loads

**Frontend Agent Task: "Fix button styling in LoginForm"**
```
✓ LoginForm.tsx (full file)
✓ Button.tsx (full file)
✓ styles/theme.ts (relevant sections)
✓ components/types.ts (Button types only)
✗ API routes
✗ Database schema
✗ Other components
✗ Historical context

Estimated tokens: ~95k (vs 850k loading everything)
Savings: 89%
```

---

## Agent Selection Guide

**Quick Decision Tree:**

1. **Is this the initial task assignment?**
   - YES → You are **Orchestrator** (read TASKS.md, delegate)
   - NO → Continue to step 2

2. **Are you implementing code?**
   - YES → You are **Specialist** (load minimal context)
   - NO → You are **Orchestrator**

3. **What type of work?**
   - Problem analysis → **Planning Agent**
   - UI/components → **Frontend Agent**
   - APIs/logic → **Backend Agent**
   - Both UI + APIs → **Full-Stack Agent**
   - Schema/migrations → **Database Agent**
   - Quality validation → **Testing Agent**
   - Code cleanup → **Refactoring Agent**
   - Documentation → **Documentation Agent**

---

## Token Budget Examples

### Traditional Approach (No Agent System)
```
Task: Add user profile page
Context loaded: Entire codebase
Token usage: ~950k
Time: 2 hours
Quality: Mixed
```

### With Agent System
```
Task: Add user profile page

Planning Agent:
- Loads: Task description, related requirements
- Tokens: 48k
- Output: Implementation plan

Full-Stack Agent:
- Loads: Profile components, user API, types
- Tokens: 142k
- Output: Implementation

Testing Agent:
- Loads: Profile tests, test guidelines
- Tokens: 105k
- Output: Validation

Total: 295k tokens (69% savings)
Time: 1.5 hours
Quality: High (planned, tested, documented)
```

---

## Documentation Maintenance

### Three Critical Files

**1. docs/TASKS.md** - Active task queue
- Updated by: All agents
- Format: Defined in TASKS_GUIDELINES.md
- Status tracking: Progressive subtask updates

**2. docs/CONTEXT.md** - Current session context
- Updated by: All specialist agents after task completion
- Format: Defined in CONTEXT_UPKEEP_GUIDELINES.md
- Contents: Files modified, changes made, token usage

**3. docs/HISTORY.md** - Completed work archive
- Updated by: Orchestrator when archiving completed tasks
- Format: Timestamped summaries
- Purpose: Historical reference

---

## Key Differences from Traditional Development

| Traditional AI Coding | This Workflow System |
|------------------------|----------------------|
| Load entire codebase | Load task-specific context only |
| Immediate coding | Planning-first protocol |
| Unclear roles | Specialized agent roles |
| Chaotic workflows | Structured command system |
| Lost context | Documented context tracking |
| Token waste | 50-80% token reduction |
| Vibe coding | Root cause analysis |
| Mixed quality | Quality standards enforced |

---

## When Working in This Repository

### If User Reports Issue with Workflow System
1. Enter Planning Mode (read PLANNING_MODE.md)
2. Ask clarifying questions about the issue
3. Analyze which component is affected:
   - Command definitions (.claude/commands/)
   - Agent templates (.claude/agents/)
   - Documentation (docs/)
4. Create plan for fix
5. Get approval
6. Implement as Documentation Agent

### If User Wants to Add/Modify Feature
1. Enter Planning Mode
2. Understand the feature request
3. Determine affected files
4. Plan changes to:
   - Command workflows
   - Agent definitions
   - Documentation
5. Get approval
6. Implement systematically

### If User Asks About Usage
1. Read relevant documentation files
2. Provide clear, concise answers
3. Reference specific sections from docs/
4. Offer examples from README.md

---

## Remember

- **Plan first, code second** - No vibe coding
- **Right agent = Right context** - Token efficiency
- **Track token usage** - Continuous optimization
- **Update CONTEXT.md** - After every task
- **Follow exact status** - No interpretation
- **Progressive subtasks** - Mark ✓/✗ as you go

---

## Quick Reference Links

- **Core Rules:** docs/AI_RULESET.md
- **Agent System:** docs/AGENTS.md
- **Agent Prompts:** docs/AGENT_PROMPTS.md
- **Agent Selection:** docs/AGENT_SELECTION_GUIDE.md
- **Planning Mode:** docs/PLANNING_MODE.md
- **Task Format:** docs/TASKS_GUIDELINES.md
- **Testing:** docs/TESTING_GUIDELINES.md
- **Context Upkeep:** docs/CONTEXT_UPKEEP_GUIDELINES.md

---

**Current Repository Purpose:** Workflow system for AI-assisted development
**Your Role:** Determined by context (Orchestrator or Specialist)
**Active Work:** Check docs/TASKS.md
**Token Budget:** Stay within your agent type's limits
