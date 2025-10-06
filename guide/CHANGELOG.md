# Changelog

All notable changes to the AI Workflow System will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
### Changed
### Deprecated
### Removed
### Fixed
### Security

---

## [1.0.0] - 2025-01-XX

### Added
- **Core Workflow System**
  - AI_RULESET.md with complete workflow definitions
  - Planning Mode protocol (PLANNING_MODE.md)
  - Context maintenance guidelines (CONTEXT_UPKEEP_GUIDELINES.md)
  - Task formatting standards (TASKS_GUIDELINES.md)
  - Testing protocol (TESTING_GUIDELINES.md)

- **Specialized Agent System** 🆕
  - AGENTS.md - Complete agent architecture documentation
  - AGENT_PROMPTS.md - Ready-to-use agent spawn prompts
  - AGENT_SELECTION_GUIDE.md - Visual agent selection flowchart
  - 9 specialized agent types with token budgets (20k-150k)
  - Smart context loading per agent type
  - Token usage tracking and optimization
  - Agent orchestration patterns

- **Agent Types:**
  - Orchestrator Agent (20-30k tokens) - Task coordination
  - Planning Agent (40-60k tokens) - Problem analysis
  - Frontend Implementation Agent (80-120k tokens) - UI/UX
  - Backend Implementation Agent (80-120k tokens) - APIs/Logic
  - Full-Stack Implementation Agent (120-150k tokens) - End-to-end features
  - Database Agent (50-80k tokens) - Schema/migrations
  - Testing Agent (80-120k tokens) - Quality validation
  - Refactoring Agent (120-150k tokens) - Code quality
  - Documentation Agent (30-50k tokens) - Context maintenance

- **Workflows**
  - `/create` - Create tasks from bug/feature lists
  - `/start` - Begin first [NOT STARTED] task (with agent selection)
  - `/continue` - Resume [STARTED] task
  - `/finish` - Test and complete [REVIEW] task
  - `/do-all` - Orchestration mode with specialized sub-agents
  - `/plan` - Enter Planning Mode

- **Installation**
  - Automated installation script (install.sh)
  - .clauderc configuration for Claude Code with agent rules
  - Multi-platform support (Linux, macOS, Windows Git Bash)

- **Documentation**
  - Comprehensive README with agent system explanation
  - Quick reference guide
  - Contributing guidelines
  - Template files for TASKS.md, CONTEXT.md, HISTORY.md

- **Features**
  - Orchestration mode with specialized sub-agents
  - Token budget management per agent type
  - Smart context loading strategies
  - Progressive subtask marking (✓/✗)
  - Automatic history archival
  - 450-line file limit enforcement
  - Root cause bug fixing protocol
  - ADHD/Autistic-friendly UX standards
  - Token usage tracking in CONTEXT.md

### Technical Details
- Task status lifecycle: NOT STARTED → STARTED → REVIEW → COMPLETED
- Automatic context preservation between cycles
- Git integration with standardized commit messages
- Build and lint verification before completion
- Supabase MCP integration for database operations
- Agent-specific context loading (20k-150k tokens per agent)
- Orchestrator pattern for complex multi-agent workflows
- Token efficiency metrics and monitoring

---

## Version History Guidelines

### Version Number Format
- **Major (X.0.0):** Breaking changes, major new features
- **Minor (0.X.0):** New features, backward compatible
- **Patch (0.0.X):** Bug fixes, minor improvements

### Change Categories

**Added**
- New features
- New documentation
- New workflows

**Changed**
- Changes to existing functionality
- Updates to documentation
- Workflow modifications

**Deprecated**
- Features that will be removed in future versions

**Removed**
- Deleted features
- Deleted files

**Fixed**
- Bug fixes
- Documentation corrections
- Installation issues

**Security**
- Security vulnerability fixes
- Security improvements

### Example Entry Format

```markdown
## [1.1.0] - 2025-02-15

### Added
- New `/refactor` command for automated code splitting (#42)
- Support for multiple project types (Next.js, Vite, CRA) (#45)
- TypeScript strict mode compliance checking (#48)

### Changed
- Improved Planning Mode with decision tree flowchart (#44)
- Updated TESTING_GUIDELINES.md with E2E examples (#46)
- install.sh now detects existing configuration files (#47)

### Fixed
- install.sh fails on Windows Git Bash (#43)
- .clauderc JSON validation error (#49)
- TASKS.md formatting inconsistency (#50)

### Documentation
- Added video tutorial for new users
- Expanded troubleshooting section in README
- Created templates for common project types
```

---

## Migration Guides

### From 0.x to 1.0

No migration needed - this is the initial release.

---