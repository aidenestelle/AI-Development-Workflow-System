# Contributing to AI Workflow System

Thank you for your interest in improving the AI Workflow System! This document provides guidelines for contributing.

## Getting Started

1. **Fork the repository** on GitHub
2. **Clone your fork** locally
3. **Create a branch** for your changes
4. **Make your changes** following the guidelines below
5. **Test thoroughly**
6. **Submit a pull request**

## Development Setup

```bash
# Clone your fork
git clone https://github.com/aidenestelle/AI-Development-Workflow-System.git
cd ai-workflow-system

# Create a test project to validate changes
mkdir test-project
cd test-project
../scripts/install.sh

# Make changes to the workflow system
# Test with Claude Code in the test-project
```

## What We're Looking For

### High Priority
- Bug fixes in workflow logic
- Improvements to AI instruction clarity
- Better examples in documentation
- Additional agent types for specialized tasks
- Testing guideline improvements
- Installation script enhancements

### Medium Priority
- Additional language support for non-English projects
- Integration with other AI tools
- Performance optimizations
- Better error messages and debugging

### Low Priority
- Cosmetic changes to documentation
- Alternative installation methods
- Additional examples

## Contribution Guidelines

### 1. Documentation Changes

**When modifying workflow documentation:**
- Follow Planning Mode protocol (yes, even for docs!)
- Test changes with actual AI workflow execution
- Ensure clarity and lack of ambiguity
- Include examples where helpful
- Maintain consistent formatting

**Files that require extra care:**
- `AI_RULESET.md` - Core workflow logic, test extensively
- `PLANNING_MODE.md` - Anti-vibe-coding protocol, must be clear
- `.clauderc` - Configuration affects all users

### 2. Installation Script Changes

**When modifying `install.sh`:**
- Test on multiple platforms (Linux, macOS, Windows Git Bash)
- Handle errors gracefully
- Provide clear user feedback
- Don't overwrite existing files without warning
- Update README.md if installation steps change

### 3. Adding New Features

**Before adding major features:**
1. Open an issue to discuss the feature
2. Get feedback from maintainers
3. Ensure it aligns with workflow philosophy
4. Plan implementation thoroughly

**Feature requirements:**
- Must enhance AI workflow effectiveness
- Must not add unnecessary complexity
- Must be well-documented
- Must include examples
- Must be tested in real scenarios

### 4. Code Style

**Markdown files:**
- Use ATX-style headers (`#` not `===`)
- Consistent indentation (2 or 4 spaces)
- Code blocks with language specification
- One blank line between sections
- Emoji usage: ✅ ❌ ⚠️ ℹ️ 🎯 (sparingly, meaningfully)

**Shell scripts:**
- Use `#!/bin/bash` shebang
- Set `set -e` for error handling
- Comment complex logic
- Use meaningful variable names
- Test on multiple shells

**Configuration files (JSON):**
- Validate JSON syntax
- Include comments explaining purpose
- Use consistent indentation
- Test with Claude Code

## Testing Your Changes

### Documentation Changes
1. Install into a test project using your modified version
2. Run through workflows with Claude Code
3. Verify AI follows instructions correctly
4. Test edge cases and error scenarios
5. Ask someone else to review for clarity

### Installation Script Changes
```bash
# Test on clean environment
mkdir test-install
cd test-install
git init
# Run your modified installer
bash /path/to/ai-workflow-system/scripts/install.sh

# Verify:
# - All files copied correctly
# - No errors during installation
# - Working files initialized properly
# - .clauderc copied successfully
```

### Workflow Logic Changes
1. Create test tasks with various complexity levels
2. Run through `/start`, `/continue`, `/finish` workflows
3. Test orchestration mode (`/do-all`)
4. Verify context and history maintenance
5. Test error handling and edge cases

## Pull Request Process

### Before Submitting

**Checklist:**
- [ ] Changes are tested in real AI workflow scenarios
- [ ] Documentation is updated if needed
- [ ] Examples are included for new features
- [ ] No breaking changes (or clearly documented if unavoidable)
- [ ] Installation script tested (if modified)
- [ ] README.md updated (if installation changes)
- [ ] CHANGELOG.md updated with your changes

### PR Description Template

```markdown
## Description
Brief description of changes

## Motivation
Why is this change needed? What problem does it solve?

## Changes Made
- Change 1
- Change 2
- Change 3

## Testing Performed
- Test scenario 1: Result
- Test scenario 2: Result
- Test scenario 3: Result

## Breaking Changes
- None
OR
- Breaking change 1: Migration path
- Breaking change 2: Migration path

## Screenshots (if applicable)
[Include screenshots of new features or changed behavior]

## Checklist
- [ ] Tested with Claude Code
- [ ] Documentation updated
- [ ] Examples included
- [ ] No breaking changes (or documented)
- [ ] CHANGELOG.md updated
```

### Review Process

1. **Maintainer reviews** your PR
2. **Feedback provided** - address comments
3. **Approval** once ready
4. **Merge** by maintainer

**Expected response time:** 3-7 days for initial review

## Reporting Issues

### Bug Reports

**Use this template:**

```markdown
## Bug Description
Clear description of the bug

## Expected Behavior
What should happen

## Actual Behavior
What actually happens

## Steps to Reproduce
1. Step 1
2. Step 2
3. Step 3

## Environment
- OS: [e.g., macOS 14.0, Ubuntu 22.04]
- Shell: [e.g., bash 5.1, zsh 5.9]
- Claude Code Version: [if applicable]
- Workflow System Version: [commit hash or release]

## Additional Context
Any other relevant information

## Screenshots/Logs
[If applicable]
```

### Feature Requests

**Use this template:**

```markdown
## Feature Description
Clear description of the proposed feature

## Problem It Solves
What pain point does this address?

## Proposed Solution
How should this work?

## Alternative Solutions
Other approaches considered

## Additional Context
Any other relevant information

## Willing to Implement
[ ] Yes, I can implement this
[ ] No, requesting implementation
[ ] Maybe, with guidance
```

## Community Guidelines

### Be Respectful
- Treat everyone with respect
- Provide constructive feedback
- Assume good intentions
- Help newcomers

### Be Professional
- Keep discussions on-topic
- Avoid inflammatory language
- Focus on technical merit
- Acknowledge differing viewpoints

### Be Collaborative
- Share knowledge freely
- Give credit where due
- Help review others' PRs
- Improve documentation

## Questions?

- **Bug reports:** [GitHub Issues](https://github.com/aidenestelle/AI-Development-Workflow-System/issues)

## Recognition

Contributors will be:
- Listed in CONTRIBUTORS.md
- Mentioned in release notes
- Credited in documentation they improve

Thank you for contributing to better AI-assisted development workflows! 🎯

---

**Remember:** Even when contributing, follow Planning Mode. Think first, code second.