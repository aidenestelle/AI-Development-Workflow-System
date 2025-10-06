## File Structure

> **Structured AI workflows for Claude Code with specialized agents and token efficiency**

Stop "vibe coding" and start building with purpose. This system gives you 9 specialized AI agents, each optimized for specific tasks, with smart context loading that reduces token usage by 50-80%.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Version](https://img.shields.io/badge/version-2.0.0-blue.svg)](https://github.com/aidenestelle/AI-Development-Workflow-System/releases)

---

## Why Use This?

**Problem:** AI coding sessions are chaotic. You load entire codebases, waste tokens, make rushed changes, and lose context constantly.

**Solution:** Structured workflows with specialized agents that load only what's needed.

**Result:** 
- 🎯 **50-80% fewer tokens** - Smart context loading per agent
- 🧠 **Better code quality** - Planning before implementation
- 📊 **Clear workflows** - No more confusion about what to do next
- ♿ **ADHD-friendly** - Structured, predictable, organized

---

## Quick Start

### Installation (1 command)

```bash
cd your-project
git clone https://github.com/aidenestelle/AI-Development-Workflow-System.git .ai-workflow
```

Done! Claude Code automatically discovers everything.

### Your First Task

```bash
# In Claude Code:
/start
```

Claude will:
1. Read your task queue
2. Choose the right specialized agent
3. Load only necessary context
4. Complete the task efficiently

---

## The 9 Specialized Agents

Each agent has a defined role and token budget:

| Agent | Budget | What It Does |
|-------|--------|--------------|
| 🎯 **Orchestrator** | 20-30k | Chooses which agent to use |
| 🧠 **Planning** | 40-60k | Analyzes problems, creates plans |
| 🎨 **Frontend** | 80-120k | React, Tailwind, UI/UX |
| ⚙️ **Backend** | 80-120k | APIs, business logic |
| 🔗 **Full-Stack** | 120-150k | End-to-end features |
| 🗄️ **Database** | 50-80k | Schema, migrations (Supabase) |
| ✅ **Testing** | 80-120k | Quality validation |
| 🔧 **Refactoring** | 120-150k | Code cleanup, file splitting |
| 📝 **Documentation** | 30-50k | Context tracking |

**Each agent loads ONLY what it needs** - no more loading your entire codebase for a simple button fix.

---

## Available Commands

```bash
/create <file>    # Create tasks from a list
/start            # Begin next task (auto-selects agent)
/continue         # Resume in-progress work
/finish           # Test and validate
/do-all           # Automate all tasks
/plan             # Deep problem analysis
```

---

## How It Works

### Traditional Approach 😫
```
You: "Fix the navigation bug"
AI: *loads entire codebase* (800k tokens)
AI: *makes quick patch without analysis*
Result: Bug returns, new bugs created
```

### With This System ✅
```
You: /start
Orchestrator: Reading task... bug fix needed
Orchestrator: Spawning Planning Agent (40k tokens)
Planning: Root cause = stale closure in hook
Planning: Solution = refactor to useReducer
You: Approve
Orchestrator: Spawning Frontend Agent (95k tokens)
Frontend: *loads only Navigation files*
Frontend: Implemented, tested, documented
Result: Proper fix, no wasted tokens
```

**Token savings: 665k (83% reduction)**

---

## Key Features

### 🎯 Planning-First Protocol
No coding until the plan is approved:
1. **STOP** - Don't code yet
2. **GATHER** - Ask questions
3. **ANALYZE** - Find root cause
4. **PLAN** - Design solution
5. **APPROVE** - Get confirmation
6. **EXECUTE** - Implement properly

### 📏 Quality Standards
- Files must be <450 lines (auto-enforced)
- No `any` or `unknown` types
- Build + lint must pass
- Root cause fixes only (no patches)
- Progressive subtask tracking

### ♿ ADHD/Autistic-Friendly
- Clear visual hierarchy
- Consistent patterns
- Predictable workflows
- Minimal cognitive load
- Structured, not chaotic

---

## Example: Real Token Savings

**Task:** Add user avatar upload feature

### Without System:
```
Load: Entire codebase
Tokens: ~950k
Time: 2 hours (lots of back-and-forth)
Quality: Mixed (some issues)
```

### With System:
```
Planning Agent: 48k tokens (analyze requirements)
Full-Stack Agent: 142k tokens (implement)
Testing Agent: 105k tokens (validate)
───────────────────────────────
Total: 295k tokens (69% savings)
Time: 1.5 hours (focused work)
Quality: High (planned, tested, documented)
```

---

## What You Get

```
.ai-workflow/
├── .claude/
│   ├── commands/    # 6 workflow commands
│   └── agents/      # 9 specialized agents
└── docs/
    ├── AI_RULESET.md              # Main rules
    ├── AGENTS.md                  # Agent architecture
    ├── AGENT_SELECTION_GUIDE.md   # Visual flowchart
    ├── PLANNING_MODE.md           # Anti-vibe-coding
    ├── TASKS_GUIDELINES.md        # Task formatting
    ├── TESTING_GUIDELINES.md      # Testing standards
    ├── TASKS.md                   # Your active tasks
    ├── CONTEXT.md                 # Current work context
    └── HISTORY.md                 # Completed work
```

**8,000+ lines of comprehensive documentation**

---

## Perfect For

✅ Claude Code users  
✅ React/Next.js projects  
✅ Supabase backends  
✅ Developers who value quality  
✅ Teams using AI pair programming  
✅ Anyone tired of chaotic AI sessions  

---

## Real-World Benefits

**Token Efficiency:**
- Typical task: 250-300k tokens (vs 800k-1.2M unstructured)
- **Average savings: 68-79%**

**Code Quality:**
- Every file <450 lines
- Root cause fixes, not patches
- Build + lint verification required
- Comprehensive testing

**Developer Experience:**
- Clear next steps
- No context confusion
- Structured workflows
- ADHD-friendly patterns

---

## Quick Links

- 📖 [Complete Documentation](docs/)
- 🤖 [Agent System Guide](docs/AGENTS.md)
- 🎯 [Agent Selection Flowchart](docs/AGENT_SELECTION_GUIDE.md)
- 📋 [Task Guidelines](docs/TASKS_GUIDELINES.md)
- 🧪 [Testing Standards](docs/TESTING_GUIDELINES.md)

---

## Contributing

We welcome contributions! See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

**Ways to help:**
- Report bugs
- Suggest features
- Improve documentation
- Share your workflows

---

## License

MIT License - See [LICENSE](LICENSE) for details

---

## Support

- **Issues:** [GitHub Issues](https://github.com/aidenestelle/AI-Development-Workflow-System/issues)
- **Discussions:** [GitHub Discussions](https://github.com/aidenestelle/AI-Development-Workflow-System/discussions)

---

<div align="center">

**Ready to transform your AI development workflow?**

```bash
cd your-project
git clone https://github.com/aidenestelle/AI-Development-Workflow-System.git .ai-workflow
```

**Then open Claude Code and type `/start` 🚀**

</div>

## Quick Start

### Installation

#### Option 1: Automated Installation (Recommended)

```bash
# Navigate to your project
cd your-project

# Clone and run installer
git clone https://github.com/yourusername/ai-workflow-system .ai-workflow
cd .ai-workflow
chmod +x scripts/install.sh
./scripts/install.sh

# The installer will:
# ✓ Create docs/ directory
# ✓ Install all workflow documentation
# ✓ Initialize TASKS.md, CONTEXT.md, HISTORY.md
# ✓ Copy .clauderc configuration
# ✓ Update .gitignore
# ✓ Create quick reference guide
```

#### Option 2: Manual Installation

```bash
# Navigate to your project
cd your-project

# Clone the workflow system
git clone https://github.com/yourusername/ai-workflow-system .ai-workflow

# Create docs directory
mkdir -p docs

# Copy all documentation
cp .ai-workflow/docs/AI_RULESET.md docs/
cp .ai-workflow/docs/PLANNING_MODE.md docs/
cp .ai-workflow/docs/CONTEXT_UPKEEP_GUIDELINES.md docs/
cp .ai-workflow/docs/TASKS_GUIDELINES.md docs/
cp .ai-workflow/docs/TESTING_GUIDELINES.md docs/

# Initialize working files
touch docs/TASKS.md docs/CONTEXT.md docs/HISTORY.md

# Copy Claude Code configuration
cp .ai-workflow/.clauderc .

# Optional: Remove installation directory
rm -rf .ai-workflow
```

#### Option 3: Git Submodule (For Updates)

```bash
# Add as submodule
git submodule add https://github.com/yourusername/ai-workflow-system .ai-workflow

# Create symlinks (documentation can be updated by pulling submodule)
mkdir -p docs
ln -s ../.ai-workflow/docs/AI_RULESET.md docs/
ln -s ../.ai-workflow/docs/PLANNING_MODE.md docs/
ln -s ../.ai-workflow/docs/CONTEXT_UPKEEP_GUIDELINES.md docs/
ln -s ../.ai-workflow/docs/TASKS_GUIDELINES.md docs/
ln -s ../.ai-workflow/docs/TESTING_GUIDELINES.md docs/

# Initialize working files
touch docs/TASKS.md docs/CONTEXT.md docs/HISTORY.md

# Copy config
cp .ai-workflow/.clauderc .

# Update workflow system later
git submodule update --remote
```

### Usage

The system provides several workflows:

#### Create Tasks
```bash
# Create tasks from a bug/feature list file
claude "/create tasks_list.md"
```

#### Start Task
```bash
# Begin the first [NOT STARTED] task
claude "/start"
```

#### Continue Task
```bash
# Resume a [STARTED] task
claude "/continue"
```

#### Finish Task
```bash
# Test and complete a [REVIEW] task
claude "/finish"
```

#### Do All Tasks (Orchestration Mode)
```bash
# Automated workflow - processes all tasks using sub-agents
claude "/do-all"
# Or add --CONTINUOUS tag to your prompt
```

## Workflows Explained

### Specialized Agent System
The workflow uses context-aware specialized agents:
- **Orchestrator Agent** - Coordinates tasks, minimal context (20-30k tokens)
- **Planning Agent** - Analyzes problems, creates plans (40-60k tokens)
- **Implementation Agents** - Frontend, Backend, Full-Stack specialists (80-150k tokens)
- **Database Agent** - Schema and migrations (50-80k tokens)
- **Testing Agent** - Quality validation (80-120k tokens)
- **Refactoring Agent** - Code quality improvements (120-150k tokens)
- **Documentation Agent** - Context maintenance (30-50k tokens)

Each agent loads ONLY the context needed for their specific role, ensuring efficient token usage.

### Planning Mode (Automatic)
- Triggers automatically when bugs/errors reported
- Prevents rushed implementations
- Forces root cause analysis
- Requires plan approval before coding

### Task Lifecycle
```
[NOT STARTED] → [STARTED] → [REVIEW] → [COMPLETED]
                     ↓
                [BLOCKED] (if dependencies found)
```

### Orchestration Mode
When using `/do-all`:
1. Orchestrator reads task queue (minimal context)
2. Spawns Planning Agent if needed (analyzes problem)
3. Spawns specialized Implementation Agent (builds solution)
4. Compacts chat for clean context
5. Spawns Testing Agent (validates solution)
6. Compacts chat
7. Logs token usage in CONTEXT.md
8. Repeats until all tasks complete

**Token efficiency**: Each agent uses only what they need, typically 20-150k depending on role.

## File Structure

Your project should have:
```
your-project/
├── docs/
│   ├── AI_RULESET.md           # Main workflow rules
│   ├── PLANNING_MODE.md        # Anti-vibe-coding protocol
│   ├── CONTEXT_UPKEEP_GUIDELINES.md  # Documentation standards
│   ├── TASKS_GUIDELINES.md     # Task formatting rules
│   ├── TESTING_GUIDELINES.md   # Testing standards
│   ├── TASKS.md                # Active task list
│   ├── CONTEXT.md              # Current cycle context
│   └── HISTORY.md              # Completed work archive
├── .ai-workflow/               # This repo (optional, can delete after setup)
└── [your source code]
```

## Key Rules

### Code Quality
- ❌ Files over 450 lines
- ❌ Duplicate code
- ❌ `any` or `unknown` types
- ✅ SHADCN UI only (for UI projects)
- ✅ Root cause bug fixes

### Development Process
- ✅ Always enter Planning Mode for changes
- ✅ Update subtasks progressively (✓/✗)
- ✅ Use exact status requested by workflow
- ✅ Run `build` + `lint` before finishing
- ✅ Kill dev servers after work

### Database (if using Supabase)
- ✅ Use Supabase MCP tool
- ✅ Create backups before changes
- ✅ Verify remote structure

## Documentation

Each workflow automatically maintains:
- **TASKS.md** - Current task queue with status
- **CONTEXT.md** - Detailed changes and reasoning
- **HISTORY.md** - Archived completed work cycles

## Customization

### Modify Rules
Edit `docs/AI_RULESET.md` to customize:
- Workflow commands
- Status protocols
- Code standards
- Commit message formats

### Add Your Guidelines
Create additional files in `docs/`:
- `PROJECT_SPECIFIC_RULES.md`
- `ARCHITECTURE.md`
- `DEPLOYMENT.md`

Reference them in `AI_RULESET.md` for Claude to read.

## Examples

### Example Task Entry
```markdown
## TASK-001: Fix Navigation Bug [STARTED]
**Assigned Agent:** Frontend Specialist
**Priority:** HIGH

**Description:**
Navigation state not persisting across page transitions

**Acceptance Criteria:**
- [ ] Browser back button works correctly
- [ ] Navigation state persists after refresh
- [ ] No console errors

**Subtasks:**
- [✓] Identify root cause in useNavigation hook
- [ ] Refactor to useReducer pattern
- [ ] Add memoization
- [ ] Test all navigation flows
```

### Example Context Entry
```markdown
## Task Completed: TASK-001 Fix Navigation Bug
**Files Modified:**
- src/components/Navigation.tsx
- src/lib/hooks/useNavigation.ts

**Changes Made:**
Root cause was stale closure. Refactored to useReducer pattern.

**New Functionality:**
Navigation now persists across transitions and page refreshes.

**Testing Focus:**
- All navigation flows
- Browser back/forward buttons
- State persistence

**Dependencies Added:**
None

**Expected Behavior:**
Users can navigate using UI or browser buttons without losing state.
```

## Troubleshooting

### "Claude isn't following the workflow"
- Ensure `docs/AI_RULESET.md` exists
- Reference it in your prompt: "Follow AI_RULESET.md"
- Check that file paths are correct

### "Tasks not updating correctly"
- Verify `docs/TASKS.md` format matches `TASKS_GUIDELINES.md`
- Ensure status values are exact: `[NOT STARTED]`, `[STARTED]`, `[REVIEW]`, `[COMPLETED]`

### "Context getting lost"
- Use chat compaction between major workflows
- Reference `CONTEXT.md` in prompts when continuing work
- Check `CONTEXT_UPKEEP_GUIDELINES.md` for format

## Contributing

Contributions welcome! Please:
1. Follow the Planning Mode protocol
2. Update relevant documentation
3. Test workflows thoroughly
4. Submit PRs with clear descriptions

## License

[Choose your license - MIT, Apache 2.0, etc.]

## Support

- Issues: [GitHub Issues](https://github.com/yourusername/ai-workflow-system/issues)
- Discussions: [GitHub Discussions](https://github.com/yourusername/ai-workflow-system/discussions)

---

**Remember:** Slow down to speed up. Planning prevents problems. 🎯