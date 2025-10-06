## File Structure

Your project should have:
```
your-project/
├── docs/
│   ├── AI_RULESET.md           # Main workflow rules
│   ├── AGENTS.md               # Specialized agent system
│   ├── AGENT_PROMPTS.md        # Ready-to-use agent prompts
│   ├── PLANNING_MODE.md        # Anti-vibe-coding protocol
│   ├── CONTEXT_UPKEEP_GUIDELINES.md  # Documentation standards
│   ├── TASKS_GUIDELINES.md     # Task formatting rules
│   ├── TESTING_GUIDELINES.md   # Testing standards
│   ├── TASKS.md                # Active task list
│   ├── CONTEXT.md              # Current cycle context
│   └── HISTORY.md              # Completed work archive
├── .ai-workflow/               # This repo (optional, can delete after setup)
└── [your source code]
```# AI Development Workflow System

A comprehensive, structured workflow system for AI-assisted development with Claude Code. Designed for ADHD/Autistic-friendly UX, preventing "vibe coding", and maintaining high code quality.

## Features

- 🎯 **Planning-First Protocol** - No vibe coding, structured problem-solving
- 🤖 **Specialized Agent System** - Context-aware agents with token budget management
- 📋 **Task Management System** - Organized workflows with clear status tracking
- 🔄 **Orchestration Mode** - Sub-agent delegation for complex projects
- 🐛 **Root Cause Bug Fixing** - No quick patches, comprehensive solutions
- 📚 **Context Maintenance** - Automatic documentation and history tracking
- 💾 **Token Efficiency** - Smart context loading per agent type (20k-150k budgets)
- ♿ **Accessibility First** - ADHD/Autistic-friendly design patterns

## Quick Start

### Installation

#### Option 1: Automated Installation (Recommended)

```bash
# Navigate to your project
cd your-project

# Clone and run installer
git clone https://github.com/aidenestelle/AI-Development-Workflow-System.git .ai-workflow
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
git clone https://github.com/aidenestelle/AI-Development-Workflow-System.git .ai-workflow

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
git submodule add https://github.com/aidenestelle/AI-Development-Workflow-System.git .ai-workflow

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

- Issues: [GitHub Issues](https://github.com/aidenestelle/AI-Development-Workflow-System.git/issues)
---

**Remember:** Slow down to speed up. Planning prevents problems. 🎯