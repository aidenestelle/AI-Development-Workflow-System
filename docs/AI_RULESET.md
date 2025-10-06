# AI RULESET

## 🚨 CRITICAL: PLANNING MODE FIRST
**Before ANY code changes, ALWAYS:**
1. Read `PLANNING_MODE.md`
2. Read `AGENTS.md` to determine which specialized agent should handle this
3. Enter planning mode when:
   - User reports bug/error
   - User requests new feature
   - User describes unexpected behavior
   - User asks to modify code

**NO VIBE CODING. PLAN FIRST, CODE SECOND.**

**Agent Selection:** Determine if you are the Orchestrator (coordinating) or a Specialist (implementing). If you're the Orchestrator, read AGENTS.md and spawn the appropriate specialist agent with minimal, task-specific context.

---

## 📋 TASK WORKFLOWS

### CREATE TASKS (`/create`)
**Arguments:** `$FILE_TO_READ` (e.g., `tasks_9-20_001.md`)

1. **Read Required Files:**
   - `$FILE_TO_READ` (contains bugs/features)
   - `docs/TASKS_GUIDELINES.md`
   - `docs/CONTEXT_UPKEEP_GUIDELINES.md`

2. **Check Existing Tasks:**
   
   **IF `docs/TASKS.md` has tasks AND all are [COMPLETED]:**
   - Summarize `docs/TASKS.md` + `docs/CONTEXT.md`
   - Append summary to bottom of `docs/HISTORY.md`
   - Delete all tasks from `docs/TASKS.md`
   - Add new tasks marked [NOT STARTED]
   
   **IF `docs/TASKS.md` has [STARTED] or [REVIEW] tasks:**
   - Create `TASKS_mm-dd-yyyy-version-xxx.md` with new tasks
   - Notify user: "⚠️ Unfinished tasks exist in TASKS.md. Created separate file."
   - Do NOT modify existing `docs/TASKS.md`

3. **Structure Tasks:**
   - Follow `TASKS_GUIDELINES.md` formatting
   - Assign specialized agent to each task/subtask
   - All new tasks marked [NOT STARTED]

---

### START TASK (`/start`)

**Orchestrator Mode:**
1. **Read:** `docs/TASKS.md` (minimal - just find first [NOT STARTED])
2. **Read:** `docs/AGENTS.md` (determine specialist needed)
3. **Spawn Specialist Agent:**
   - Load ONLY task-specific context (see AGENTS.md)
   - Provide clear objectives
   - Set token budget appropriate for task
   - Monitor completion

**Specialist Agent Mode:**
1. **Verify Role:** Confirm you're the correct specialist for this task
2. **Load Context:** Only what AGENTS.md specifies for your role
3. **Update Status:** Task to [STARTED] in docs/TASKS.md
4. **Implement:** ONLY that main task + all its subtasks
5. **Mark Progress:** Update subtasks ✓/✗ as you work (don't wait until end)
6. **When Finished:** Update task to [REVIEW]

7. **Update `docs/CONTEXT.md`:**
```markdown
## Task Completed: [TASK-ID] Title
**Agent:** [Your agent type]
**Token Usage:** [Approximate tokens used]
**Files Modified:**
- path/to/file1.ts
- path/to/file2.tsx

**Changes Made:**
[Detailed implementation description]

**New Functionality:**
[Features/behaviors added]

**Testing Focus:**
[Key validation areas]

**Dependencies Added:**
[New packages/imports, or "None"]

**Expected Behavior:**
[How changes should work]

**Context Efficiency:**
[What context was loaded, what was excluded]
```

---

### CONTINUE TASK (`/continue`)

1. **Read:** `docs/TASKS.md`
2. **Find:** First task marked [STARTED]
3. **Read:** `docs/CONTEXT.md` for task context
4. **Complete:** That main task + all subtasks
5. **Update Subtasks:** Mark each ✓/✗ progressively
6. **When Finished:** Update to [REVIEW]
7. **Update:** `docs/CONTEXT.md` (same format as `/start`)

---

### FINISH TASK (`/finish`)

1. **Read:**
   - `docs/TASKS.md` (find task marked [REVIEW])
   - `docs/CONTEXT.md`
   - `docs/TESTING_GUIDELINES.md`

2. **Test Changes:**
   - Follow testing guidelines
   - Verify acceptance criteria
   - Run type-check and lint

3. **When Tests Pass (0 errors/warnings):**
```bash
git add .
git commit -m "type: descriptive message"
git push
```

4. **Update:** Task status [REVIEW] → [COMPLETED] in `docs/TASKS.md`

---

### DO ALL TASKS (`/do-all` or `--CONTINUOUS` tag)

**Orchestration Mode - Delegate to Specialized Sub-Agents:**

**Loop until no tasks remain:**

1. **Orchestrator Reads Queue:**
   - Load ONLY docs/TASKS.md (minimal context)
   - Identify next [NOT STARTED] task
   - Read docs/AGENTS.md to determine specialist needed

2. **Spawn Planning Agent (if needed):**
   - If task involves bug/change, spawn Planning Agent first
   - Planning Agent: Load task + PLANNING_MODE.md only
   - Wait for plan approval
   - Compact chat after planning

3. **Spawn Implementation Agent:**
   - Choose specialist: Frontend/Backend/Full-Stack/Database/etc.
   - Load ONLY context specified in AGENTS.md for that agent type
   - Agent executes `/start` workflow with minimal context
   - Monitor token usage (should stay within agent's budget)
   - Wait for completion signal
   - Review agent's work
   - Compact chat after completion

4. **Spawn Validation Agent:**
   - Testing Agent loads TESTING_GUIDELINES.md + changed files only
   - Agent executes `/finish` workflow
   - Validate token-efficient test execution
   - Wait for completion signal
   - Review validation results
   - Compact chat after completion

5. **Orchestrator Responsibilities:**
   - Monitor task queue in `docs/TASKS.md`
   - Spawn appropriate specialist agents (not generalists)
   - Ensure each agent loads minimal necessary context
   - Track token usage per agent (log in CONTEXT.md)
   - Verify chat compaction between cycles
   - Maintain high-level oversight only (don't do specialist work)

6. **Repeat** for next task

**Sub-Agent Protocol:**
- Each sub-agent receives ONLY context specified in AGENTS.md
- Implementation Agent focuses solely on `/start` workflow
- Validation Agent focuses solely on `/finish` workflow
- Orchestrator maintains strategic overview only
- Token budgets enforced per AGENTS.md specifications

**Continue until:** All tasks in `docs/TASKS.md` are [COMPLETED]

**Token Efficiency Metrics:**
Track in CONTEXT.md for each cycle:
```markdown
**Agent Performance:**
- Orchestrator: [X]k tokens (expected: 20-30k)
- Planning Agent: [X]k tokens (expected: 40-60k)
- [Specialist] Agent: [X]k tokens (expected: varies)
- Testing Agent: [X]k tokens (expected: 80-120k)
Total cycle: [X]k tokens
```

**Orchestrator Mental Model:**
```
Orchestrator (YOU - Minimal Context)
├─→ Check Queue → Spawn Planning Agent → Plan Approved → Compact
│   └─→ Context: PLANNING_MODE.md + task only
├─→ Spawn Specialist Implementation Agent → Complete → Compact
│   └─→ Context: Per AGENTS.md (task-specific files only)
├─→ Spawn Testing Agent → Validate → Complete → Compact
│   └─→ Context: TESTING_GUIDELINES.md + changed files
└─→ Check queue → Repeat if tasks remain
```

---

## 🎯 TASK STATUS PROTOCOL

### Strict Status Rules
1. **NEVER assume status** beyond what's requested
2. **Status Meanings:**
   - [NOT STARTED] - Task awaiting work
   - [STARTED] - Active implementation
   - [REVIEW] - Implementation complete, needs validation
   - [COMPLETED] - Reviewed, tested, approved
   - [BLOCKED] - Waiting on dependency

3. **Update Subtasks Progressively:**
   - ✓ Mark completed subtasks immediately
   - ✗ Mark failed/skipped subtasks
   - DO NOT wait until end to mark all

### Required Verification
Before updating ANY task status:
1. Re-read original task instruction word-for-word
2. Quote exact status requested
3. Use ONLY that status - no interpretation

**Mental Check:** "What EXACT status did the user request?"

❌ **Wrong:** "Technical work done, marking COMPLETED"  
✅ **Right:** "User said 'mark as [REVIEW]', using [REVIEW]"

---

## 🐛 BUG FIXING PROTOCOL

**NEVER QUICK PATCH. ALWAYS:**

1. **Find Root Cause**
   - Debug thoroughly
   - Understand underlying issue
   - Document findings

2. **Scan for Similar Bugs**
   - Search codebase for identical patterns
   - Check related components/files

3. **Plan Comprehensive Fix**
   - Design solution addressing root cause
   - Consider side effects
   - Prevent future occurrences

4. **Implement Robust Solution**
   - Fix all instances
   - Add safeguards
   - Update tests

---

## 🖥️ DEV SERVER MANAGEMENT

**ALWAYS kill servers after finishing work:**
```bash
# Kill any running dev servers
# Do not leave processes running
```

---

## ✅ POST-IMPLEMENTATION REQUIREMENTS

After implementing ANY feature or fix:
```bash
pnpm build    # Must pass with 0 errors
pnpm lint     # Must show 0 errors/warnings
```

**If errors found:** Apply BUG FIXING PROTOCOL

---

## 📝 GIT COMMIT STANDARDS

**Format:** `type: description`

**Types:**
- `feat` - New feature
- `fix` - Bug fix (root cause addressed)
- `refactor` - Code restructuring
- `docs` - Documentation
- `style` - Formatting/styling
- `test` - Testing updates
- `chore` - Maintenance

**Examples:**
```bash
git commit -m "feat: add user authentication with Supabase"
git commit -m "fix: resolve root cause of navigation state bug"
git commit -m "refactor: split UserProfile into smaller components"
```

---

## 🗄️ SUPABASE & BACKUP REQUIREMENTS

**BEFORE any database changes:**

1. Use Supabase MCP tool to check remote structure
2. **CREATE BACKUP:** Export current schema/data
3. Verify changes don't already exist
4. Confirm schema alignment
5. Implement changes
6. Verify remotely with MCP tool

---

## 🎯 PERFORMANCE & UX STANDARDS

### Code Quality Rules

**450-LINE LIMIT:**
- **MAX 450 lines per file**
- Break into smaller components if exceeded

**IF working on file >450 lines:**
1. **STOP current task immediately**
2. **Update TASKS.md:** Add urgent refactor task (follow TASK_GUIDELINES)
3. **Mark current task [BLOCKED]** with dependency noted
4. **Create HIGH priority refactor task**
5. **Complete refactor first**, then resume original work

**Other Requirements:**
- **ZERO duplicate code** - Create reusable functions/components
- **No `any` or `unknown` types** - Use proper TypeScript types
- **Database operations <100ms**

### UX Requirements (ADHD/Autistic Friendly)
- Clear, consistent navigation
- Minimal cognitive load
- Predictable interaction patterns
- Visual clarity and hierarchy
- Proper focus management

### Technical Requirements
- **UI: SHADCN ONLY** - No other UI libraries
- **SEO optimized** - Meta tags, semantic HTML, performance
- **Accessible design** - WCAG compliant patterns

---

## 📦 DEPENDENCY MANAGEMENT

**NEW PACKAGES:** Only when **ABSOLUTELY NECESSARY** and **WITH USER PERMISSION**

**Before adding any dependency:**
1. Check if functionality exists with current stack
2. Ask user permission with justification:
   ```
   "Need to add [package-name] for [specific functionality].
   
   Justification: [why current stack insufficient]
   Alternative considered: [what was tried first]
   
   Permission to proceed?"
   ```
3. Use `pnpm add [package]` only after approval

---

## 🔔 NOTIFICATIONS

**When tasks complete or need attention:**
```bash
powershell.exe -c "[System.Media.SystemSounds]::Beep.Play()"
```

---

## 🚫 CRITICAL RULES SUMMARY

**NEVER:**
- ❌ Files over 450 lines
- ❌ Duplicate code/functions
- ❌ Non-Shadcn UI components
- ❌ Add dependencies without permission
- ❌ DB changes without backup
- ❌ Poor ADHD/Autistic UX patterns
- ❌ Quick patch bugs (find root cause)
- ❌ Bypass Supabase MCP for DB work
- ❌ Use `any` or `unknown` types
- ❌ Skip planning mode
- ❌ Assume task status beyond request

**ALWAYS:**
- ✅ Read PLANNING_MODE.md first
- ✅ Kill dev servers after work
- ✅ Run build + lint before finish
- ✅ Create backups before DB changes
- ✅ Use Supabase MCP for DB operations
- ✅ Mark subtasks progressively
- ✅ Follow exact status requested

---

## 🔄 CONTINUOUS MODE

**When `--CONTINUOUS` tag is present:**

**Orchestrator Pattern - Delegate to Sub-Agents:**

The orchestrating agent (you) manages the workflow by spawning specialized sub-agents for each phase. **Critical: Each agent loads ONLY the context specified in AGENTS.md to stay within token budgets.**

**Execution Loop:**
```
1. Orchestrator reads docs/TASKS.md (20-30k tokens max)
2. Consults docs/AGENTS.md for specialist selection
3. Spawns Planning Agent (if needed)
   → Delegates planning with minimal context (40-60k tokens)
   → Waits for completion
   → Reviews plan
   → Compacts chat
4. Spawns Implementation Sub-Agent (specialist type)
   → Delegates /start command
   → Loads ONLY context per AGENTS.md
   → Token budget: 80-150k depending on specialist
   → Waits for completion
   → Reviews work
   → Logs token usage
   → Compacts chat
5. Spawns Validation Sub-Agent
   → Delegates /finish command
   → Loads testing guidelines + changed files only
   → Token budget: 80-120k
   → Waits for validation completion
   → Reviews results
   → Logs token usage
   → Compacts chat
6. Orchestrator checks queue
7. Repeat until all tasks [COMPLETED]
```

**Orchestrator Responsibilities:**
- Monitor `docs/TASKS.md` task queue (minimal context load)
- Read `docs/AGENTS.md` for agent selection rules
- Spawn appropriate specialized agents (not generic agents)
- Enforce token budgets per agent type
- Ensure agents load only specified context
- Verify chat compaction occurs between cycles
- Track token usage metrics in CONTEXT.md
- Maintain high-level project continuity

**Sub-Agent Context Rules:**
Each sub-agent receives ONLY:
- Their specific command (`/start` OR `/finish`)
- Context defined in AGENTS.md for their role
- Task-specific files (not entire codebase)
- Relevant guidelines (AI_RULESET.md sections)

**Agent Type Selection:**
- Bug fixes → Planning Agent + Frontend/Backend Agent
- New features → Planning Agent + appropriate Specialist(s)
- Refactoring → Refactoring Agent
- Database → Database Agent
- Testing → Testing Agent
- Documentation → Documentation Agent

**Token Budget Enforcement:**
```markdown
Orchestrator: 20-30k tokens (task queue only)
Planning: 40-60k tokens (task + related code)
Frontend Impl: 80-120k tokens (components + types)
Backend Impl: 80-120k tokens (APIs + schema)
Full-Stack: 120-150k tokens (both stacks)
Database: 50-80k tokens (schema + migrations)
Testing: 80-120k tokens (tests + criteria)
Refactoring: 120-150k tokens (file(s) to refactor)
Documentation: 30-50k tokens (summaries only)
```

**Context Efficiency Tracking:**
Log in CONTEXT.md after each cycle:
```markdown
**Cycle [N] Token Usage:**
- Orchestrator: [X]k (budget: 20-30k) ✓/✗
- Planning: [X]k (budget: 40-60k) ✓/✗
- [Specialist]: [X]k (budget: [Y]k) ✓/✗
- Testing: [X]k (budget: 80-120k) ✓/✗
Total: [X]k
Efficiency: [Good/Needs Optimization]
```

**Stop when:** All tasks in `docs/TASKS.md` are [COMPLETED]

**Remember:** Smart orchestration means minimal context per agent, clean handoffs, and respecting token budgets. Quality over quantity.