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

### Technical Requirements
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