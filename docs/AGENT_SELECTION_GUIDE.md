# AGENT_SELECTION_GUIDE.md

## Purpose
Quick visual guide for determining which specialized agent to use for any given task.

---

## Agent Selection Flowchart

```
START: New Task Identified
    ↓
[Q1] Does task require implementation?
    ├─ NO → Is it documentation? 
    │         ├─ YES → Documentation Agent
    │         └─ NO → Orchestrator (coordinate)
    │
    └─ YES → [Q2] Is there a bug or unclear requirements?
              ├─ YES → Planning Agent FIRST (then continue below after plan approved)
              │
              └─ NO (plan exists) → [Q3] What domain?
                                     │
                                     ├─ Frontend Only
                                     │   ├─ File >450 lines? → Refactoring Agent first
                                     │   └─ File <450 lines? → Frontend Implementation Agent
                                     │
                                     ├─ Backend Only
                                     │   ├─ Database changes? → Database Agent + Backend Agent
                                     │   ├─ File >450 lines? → Refactoring Agent first
                                     │   └─ API/Logic only? → Backend Implementation Agent
                                     │
                                     ├─ Both Frontend + Backend
                                     │   └─ Full-Stack Implementation Agent
                                     │
                                     └─ Testing/Validation
                                         └─ Testing Agent

After Implementation → Testing Agent → [COMPLETED]
```

---

## Decision Matrix

| Task Type | Planning Agent? | Primary Agent | Secondary Agent(s) | Token Budget |
|-----------|----------------|---------------|-------------------|--------------|
| **UI Bug** | ✓ Yes | Frontend Impl | Testing | ~240k total |
| **API Bug** | ✓ Yes | Backend Impl | Testing | ~240k total |
| **New UI Feature** | ✓ Yes | Frontend Impl | Testing | ~240k total |
| **New API** | ✓ Yes | Backend Impl | Testing | ~240k total |
| **Full Feature** | ✓ Yes | Full-Stack Impl | Testing | ~340k total |
| **DB Schema** | ✓ Yes | Database | Backend, Testing | ~280k total |
| **File Too Large** | Maybe | Refactoring | Testing | ~240k total |
| **Need Docs** | No | Documentation | None | ~40k total |
| **Unclear Task** | ✓ Yes | Planning Only | TBD after plan | ~50k total |

---

## Quick Agent Selector

### By Problem Description

**"The navigation is broken"**
→ Planning Agent → Frontend Implementation Agent → Testing Agent

**"API endpoint returning 500 error"**
→ Planning Agent → Backend Implementation Agent → Testing Agent

**"Need to add user authentication"**
→ Planning Agent → Full-Stack Implementation Agent → Testing Agent

**"Database needs new table for posts"**
→ Planning Agent → Database Agent → Backend Implementation Agent → Testing Agent

**"UserProfile.tsx is 600 lines"**
→ Refactoring Agent → Testing Agent

**"Need to document recent changes"**
→ Documentation Agent

**"Add dark mode to the app"**
→ Planning Agent → Frontend Implementation Agent → Testing Agent

**"Build is failing with type errors"**
→ Planning Agent → (Frontend or Backend based on analysis) → Testing Agent

---

## By File Type

| File Extension | Primary Agent | When to Use |
|----------------|---------------|-------------|
| `.tsx`, `.jsx` | Frontend Impl | React components |
| `.ts` (client) | Frontend Impl | Client utilities, hooks |
| `.ts` (server) | Backend Impl | API routes, server logic |
| `.sql` | Database Agent | Migrations, schema |
| `.test.ts` | Testing Agent | Test files |
| `.css`, `.scss` | Frontend Impl | Styling files |
| `.md` | Documentation Agent | Documentation |

---

## By Specialization Needed

### Frontend Specialist Needed When:
- Modifying React components
- Changing UI/UX
- Adding client-side state management
- Working with Tailwind/Shadcn
- Implementing accessibility features
- Adding interactions/animations

**Token Budget:** 80-120k

### Backend Specialist Needed When:
- Creating/modifying API endpoints
- Implementing business logic
- Working with server-side validation
- Implementing authentication
- Server-side data processing

**Token Budget:** 80-120k

### Full-Stack Specialist Needed When:
- Feature spans frontend and backend
- Need to implement complete user flow
- Integrating frontend with new API
- End-to-end feature implementation
- Type sharing across stack critical

**Token Budget:** 120-150k

### Database Specialist Needed When:
- Creating/modifying schema
- Writing migrations
- Implementing RLS policies
- Optimizing queries
- Data modeling

**Token Budget:** 50-80k

### Testing Specialist Needed When:
- Validating implementation
- Running build/lint checks
- Verifying acceptance criteria
- Manual testing required
- Quality assurance

**Token Budget:** 80-120k

### Refactoring Specialist Needed When:
- File exceeds 450 lines
- Duplicate code exists
- Code quality issues
- Performance optimization needed
- Splitting large modules

**Token Budget:** 120-150k

### Documentation Specialist Needed When:
- Updating CONTEXT.md
- Archiving to HISTORY.md
- Writing code comments
- Updating README
- Creating API docs

**Token Budget:** 30-50k

---

## Orchestration Patterns

### Pattern 1: Simple Bug Fix
```
Orchestrator (25k)
  └─→ Planning Agent (45k)
      └─→ Frontend/Backend Impl (95k)
          └─→ Testing Agent (85k)

Total: ~250k across 4 agents
Time: ~15-30 minutes
```

### Pattern 2: New Feature
```
Orchestrator (25k)
  └─→ Planning Agent (55k)
      └─→ Full-Stack Impl (140k)
          ├─→ [File too large detected]
          ├─→ Refactoring Agent (130k)
          └─→ Testing Agent (110k)

Total: ~460k across 5 agents
Time: ~30-60 minutes
```

### Pattern 3: Database Migration
```
Orchestrator (25k)
  └─→ Planning Agent (50k)
      └─→ Database Agent (65k)
          └─→ Backend Impl (90k)
              └─→ Frontend Impl (85k)
                  └─→ Testing Agent (100k)

Total: ~415k across 6 agents
Time: ~30-45 minutes
```

### Pattern 4: Refactoring Only
```
Orchestrator (25k)
  └─→ Refactoring Agent (130k)
      └─→ Testing Agent (100k)

Total: ~255k across 3 agents
Time: ~20-30 minutes
```

---

## Context Loading Rules by Agent

### Orchestrator
**Always Load:**
- docs/TASKS.md (current tasks only)
- docs/AI_RULESET.md (orchestration rules)
- docs/AGENTS.md (agent selection)

**Never Load:**
- Implementation code
- Full project structure
- Historical context

**Budget:** 20-30k

### Planning Agent
**Always Load:**
- docs/PLANNING_MODE.md
- Current task description
- Error messages (if bug)

**Load If Relevant:**
- Related code files (signatures only)
- Type definitions

**Never Load:**
- Entire codebase
- Unrelated files
- Full implementation details

**Budget:** 40-60k

### Implementation Agents
**Always Load:**
- docs/AI_RULESET.md (code standards)
- Current task + approved plan
- Files to modify (full content)
- Related type definitions

**Load If Needed:**
- Imported components/utilities
- Schema (if database related)

**Never Load:**
- Unrelated codebase
- Historical context
- Completed tasks

**Budget:** 80-150k (varies by agent type)

### Testing Agent
**Always Load:**
- docs/TESTING_GUIDELINES.md
- Task with acceptance criteria
- Files changed (from CONTEXT.md)
- docs/CONTEXT.md (implementation details)

**Never Load:**
- Unrelated code
- Historical tests
- Full project structure

**Budget:** 80-120k

---

## Token Optimization Strategies

### Strategy 1: Progressive Loading
```
Start: Load file structure only
If needed: Load function signatures
Only if critical: Load full implementation
```

### Strategy 2: Scope Limiting
```
Task says: "Fix Login.tsx"
Load:
  ✓ Login.tsx (full)
  ✓ Auth types (signatures)
  ✓ useAuth hook (if imported)
Don't load:
  ✗ Other components
  ✗ Entire codebase
```

### Strategy 3: Layer Isolation
```
Frontend Agent needs:
  ✓ UI layer
  ✓ Hook layer
  ✓ Type layer (signatures)
  ✗ API layer (not needed)
  ✗ Database layer (not needed)
```

### Strategy 4: Differential Context
```
Previous state: Known
Changes needed: Specific
Load: Only the diff, not everything
```

---

## Common Mistakes to Avoid

❌ **Mistake:** Using generic agent for specialized task
✅ **Solution:** Always choose specialist (Frontend, Backend, etc.)

❌ **Mistake:** Loading entire codebase for small change
✅ **Solution:** Load only files mentioned in task

❌ **Mistake:** Skipping Planning Agent for bugs
✅ **Solution:** Always use Planning Agent for bugs/unclear tasks

❌ **Mistake:** Using one agent for full-stack task
✅ **Solution:** Use Full-Stack Implementation Agent or chain specialists

❌ **Mistake:** Forgetting to compact chat between agents
✅ **Solution:** Compact after each agent completes

❌ **Mistake:** Exceeding token budget without realizing
✅ **Solution:** Monitor and log token usage in CONTEXT.md

---

## Quick Reference Commands

### Determine Agent Needed
```bash
# Orchestrator determines next agent
claude "Read docs/TASKS.md and docs/AGENTS.md. What specialist agent is needed for TASK-XXX?"
```

### Spawn Specific Agent
```bash
# Copy prompt from AGENT_PROMPTS.md, customize, and paste
# Example for Frontend Agent:
claude "[Paste customized Frontend Implementation Agent prompt]"
```

### Check Token Usage
```bash
# After agent completes, log in CONTEXT.md:
# "Agent: Frontend Implementation"
# "Token Usage: ~95k (budget: 80-120k) ✓"
```

---

## Agent Performance Monitoring

### Track These Metrics

**Per Agent:**
- Actual token usage vs budget
- Task completion success rate
- Time to complete
- Context relevance (was everything loaded necessary?)

**Per Cycle:**
- Total token usage
- Number of agents spawned
- Rework needed (did agent do it right first time?)
- Handoff quality (did next agent have what they needed?)

### When to Optimize

**If agent consistently over budget:**
1. Review context loading strategy
2. Identify unnecessary files
3. Implement more aggressive pruning
4. Consider splitting agent further

**If agent consistently under budget:**
1. Check if critical context missing
2. Verify agent has appropriate specialization
3. Consider if agent needs more context

**If many agents needed per task:**
1. Review task breakdown
2. Consider using more general agent (Full-Stack)
3. Improve planning phase

---

## Remember

✅ **Right Agent** = Right context = Efficient execution
✅ **Planning First** = Better plans = Fewer iterations  
✅ **Minimal Context** = Faster processing = Lower costs
✅ **Specialist Over Generalist** = Better results = Higher quality
✅ **Monitor & Optimize** = Track usage = Continuous improvement

**The goal:** Smart agent selection + minimal necessary context = maximum efficiency