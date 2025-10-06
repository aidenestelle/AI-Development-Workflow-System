#!/bin/bash

# AI Workflow System Installer
# Installs structured AI development workflow for Claude Code

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Emoji support
CHECK="✓"
CROSS="✗"
ARROW="→"
INFO="ℹ"

echo ""
echo "${BLUE}╔════════════════════════════════════════════╗${NC}"
echo "${BLUE}║    AI Workflow System Installer v1.0      ║${NC}"
echo "${BLUE}╚════════════════════════════════════════════╝${NC}"
echo ""

# Function to print colored messages
print_success() {
    echo -e "${GREEN}${CHECK}${NC} $1"
}

print_error() {
    echo -e "${RED}${CROSS}${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}${INFO}${NC} $1"
}

print_info() {
    echo -e "${BLUE}${ARROW}${NC} $1"
}

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check prerequisites
print_info "Checking prerequisites..."

if ! command_exists git; then
    print_error "Git is not installed. Please install Git first."
    exit 1
fi
print_success "Git found"

# Check if we're in a git repository
if [ ! -d .git ]; then
    print_warning "Not in a Git repository. Initializing..."
    git init
    print_success "Git repository initialized"
fi

# Detect package manager
print_info "Detecting package manager..."
PACKAGE_MANAGER=""

if [ -f "package.json" ]; then
    if [ -f "pnpm-lock.yaml" ]; then
        PACKAGE_MANAGER="pnpm"
    elif [ -f "yarn.lock" ]; then
        PACKAGE_MANAGER="yarn"
    elif [ -f "package-lock.json" ]; then
        PACKAGE_MANAGER="npm"
    else
        PACKAGE_MANAGER="npm"
    fi
    print_success "Detected package manager: $PACKAGE_MANAGER"
else
    print_warning "No package.json found. Skipping package manager detection."
fi

# Create docs directory if it doesn't exist
print_info "Setting up documentation directory..."
if [ ! -d "docs" ]; then
    mkdir -p docs
    print_success "Created docs/ directory"
else
    print_warning "docs/ directory already exists"
fi

# Get the directory where the script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Determine source directory based on installation method
if [ -d "$SCRIPT_DIR/../docs" ]; then
    # Running from repository structure (e.g., scripts/install.sh)
    REPO_ROOT="$(dirname "$SCRIPT_DIR")"
    SOURCE_DIR="$REPO_ROOT/docs"
elif [ -d "$(dirname "$SCRIPT_DIR")/docs" ]; then
    # Running from cloned .ai-workflow directory
    SOURCE_DIR="$(dirname "$SCRIPT_DIR")/docs"
else
    print_error "Could not find source documentation files."
    print_error "Expected docs/ directory in repository root."
    exit 1
fi

print_info "Using source directory: $SOURCE_DIR"

# Copy documentation files
print_info "Installing workflow documentation..."

files=(
    "AI_RULESET.md"
    "AGENTS.md"
    "AGENT_PROMPTS.md"
    "PLANNING_MODE.md"
    "CONTEXT_UPKEEP_GUIDELINES.md"
    "TASKS_GUIDELINES.md"
    "TESTING_GUIDELINES.md"
)

for file in "${files[@]}"; do
    if [ -f "$SOURCE_DIR/$file" ]; then
        if [ -f "docs/$file" ]; then
            print_warning "docs/$file already exists - skipping"
        else
            cp "$SOURCE_DIR/$file" "docs/$file"
            print_success "Installed docs/$file"
        fi
    else
        print_error "Source file $SOURCE_DIR/$file not found"
    fi
done

# Initialize working files if they don't exist
print_info "Initializing working files..."

working_files=(
    "TASKS.md"
    "CONTEXT.md"
    "HISTORY.md"
)

for file in "${working_files[@]}"; do
    if [ -f "docs/$file" ]; then
        print_warning "docs/$file already exists - skipping"
    else
        touch "docs/$file"
        
        # Add basic headers to files
        case $file in
            "TASKS.md")
                echo "# Task Queue" > "docs/$file"
                echo "" >> "docs/$file"
                echo "**Project:** $(basename "$PWD")" >> "docs/$file"
                echo "**Current Cycle:** $(date +%Y-%m-%d)" >> "docs/$file"
                echo "" >> "docs/$file"
                echo "---" >> "docs/$file"
                echo "" >> "docs/$file"
                echo "<!-- Tasks will be added here -->" >> "docs/$file"
                ;;
            "CONTEXT.md")
                echo "# Development Context" > "docs/$file"
                echo "" >> "docs/$file"
                echo "**Current Cycle:** $(date +%Y-%m-%d)" >> "docs/$file"
                echo "**Last Updated:** $(date +%Y-%m-%d)" >> "docs/$file"
                echo "" >> "docs/$file"
                echo "---" >> "docs/$file"
                echo "" >> "docs/$file"
                echo "<!-- Context entries will be added here -->" >> "docs/$file"
                ;;
            "HISTORY.md")
                echo "# Project History" > "docs/$file"
                echo "" >> "docs/$file"
                echo "**Project:** $(basename "$PWD")" >> "docs/$file"
                echo "**Started:** $(date +%Y-%m-%d)" >> "docs/$file"
                echo "" >> "docs/$file"
                echo "---" >> "docs/$file"
                echo "" >> "docs/$file"
                echo "<!-- Completed cycle summaries will be appended here -->" >> "docs/$file"
                ;;
        esac
        
        print_success "Created docs/$file"
    fi
done

# Copy .clauderc if it doesn't exist
print_info "Installing Claude Code configuration..."
if [ -f "$REPO_ROOT/.clauderc" ]; then
    if [ -f ".clauderc" ]; then
        print_warning ".clauderc already exists - skipping"
        print_info "You may want to merge configurations manually"
    else
        cp "$REPO_ROOT/.clauderc" ".clauderc"
        print_success "Installed .clauderc"
    fi
else
    print_warning ".clauderc not found in source - skipping"
fi

# Add docs/ to .gitignore for working files (optional)
print_info "Updating .gitignore..."
if [ ! -f ".gitignore" ]; then
    touch .gitignore
    print_success "Created .gitignore"
fi

# Check if docs pattern already in gitignore
if ! grep -q "docs/TASKS.md" .gitignore; then
    echo "" >> .gitignore
    echo "# AI Workflow working files (generated content)" >> .gitignore
    echo "# Note: Keep the templates, ignore the working files" >> .gitignore
    echo "# docs/TASKS.md" >> .gitignore
    echo "# docs/CONTEXT.md" >> .gitignore
    print_success "Added working files to .gitignore (commented out by default)"
    print_warning "Uncomment lines in .gitignore if you don't want to commit working files"
else
    print_warning ".gitignore already has docs patterns"
fi

# Create a quick reference file
print_info "Creating quick reference..."
cat > "docs/QUICK_REFERENCE.md" << 'EOF'
# AI Workflow Quick Reference

## Available Commands

### `/create <file>`
Create tasks from a bug/feature list file
```bash
claude "/create tasks_list.md"
```

### `/start`
Begin the first [NOT STARTED] task
```bash
claude "/start"
```

### `/continue`
Resume the current [STARTED] task
```bash
claude "/continue"
```

### `/finish`
Test and complete the [REVIEW] task
```bash
claude "/finish"
```

### `/do-all`
Automated workflow - process all tasks using sub-agents
```bash
claude "/do-all"
```

### `/plan`
Enter Planning Mode for analysis
```bash
claude "/plan"
```

## File Structure

- `AI_RULESET.md` - Main workflow rules
- `PLANNING_MODE.md` - Anti-vibe-coding protocol  
- `CONTEXT_UPKEEP_GUIDELINES.md` - Documentation standards
- `TASKS_GUIDELINES.md` - Task formatting rules
- `TESTING_GUIDELINES.md` - Testing standards
- `TASKS.md` - Active task list (working file)
- `CONTEXT.md` - Current cycle context (working file)
- `HISTORY.md` - Completed work archive (working file)

## Task Status Flow

```
[NOT STARTED] → [STARTED] → [REVIEW] → [COMPLETED]
                     ↓
                [BLOCKED]
```

## Quick Checklist

**Before Starting Work:**
- [ ] Read AI_RULESET.md
- [ ] Enter Planning Mode if fixing bug
- [ ] Understand task requirements

**While Working:**
- [ ] Mark subtasks progressively (✓/✗)
- [ ] Follow 450-line file limit
- [ ] No `any` or `unknown` types
- [ ] Kill dev servers when done

**Before Finishing:**
- [ ] Run `pnpm build` (0 errors)
- [ ] Run `pnpm lint` (0 errors, 0 warnings)
- [ ] Test all acceptance criteria
- [ ] Update CONTEXT.md

## Getting Help

Read the detailed guidelines:
- Planning issues → `PLANNING_MODE.md`
- Task format → `TASKS_GUIDELINES.md`
- Testing help → `TESTING_GUIDELINES.md`
- Context format → `CONTEXT_UPKEEP_GUIDELINES.md`
EOF

print_success "Created docs/QUICK_REFERENCE.md"

# Summary
echo ""
echo "${GREEN}═══════════════════════════════════════${NC}"
echo "${GREEN}  Installation Complete! ${CHECK}${NC}"
echo "${GREEN}═══════════════════════════════════════${NC}"
echo ""

print_info "Installed files:"
echo "  ${BLUE}docs/${NC}"
echo "    • AI_RULESET.md"
echo "    • AGENTS.md"
echo "    • AGENT_PROMPTS.md"
echo "    • PLANNING_MODE.md"
echo "    • CONTEXT_UPKEEP_GUIDELINES.md"
echo "    • TASKS_GUIDELINES.md"
echo "    • TESTING_GUIDELINES.md"
echo "    • TASKS.md (working file)"
echo "    • CONTEXT.md (working file)"
echo "    • HISTORY.md (working file)"
echo "    • QUICK_REFERENCE.md"
if [ -f ".clauderc" ]; then
echo "  .clauderc"
fi

echo ""
print_info "Next steps:"
echo "  1. Review docs/QUICK_REFERENCE.md for command overview"
echo "  2. Read docs/AI_RULESET.md for complete workflow"
echo "  3. Create your first task with: ${YELLOW}claude \"/create tasks.md\"${NC}"
echo "  4. Start working with: ${YELLOW}claude \"/start\"${NC}"

if [ -n "$PACKAGE_MANAGER" ]; then
    echo ""
    print_warning "Remember to run these before marking tasks complete:"
    echo "  ${YELLOW}$PACKAGE_MANAGER build${NC}"
    echo "  ${YELLOW}$PACKAGE_MANAGER lint${NC}"
fi

echo ""
print_success "Happy coding! Remember: Plan first, code second. 🎯"
echo ""

# Optional: Clean up the installation directory
read -p "$(echo -e ${YELLOW}Do you want to remove the .ai-workflow directory? [y/N]:${NC} )" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    if [ -d ".ai-workflow" ]; then
        rm -rf .ai-workflow
        print_success "Removed .ai-workflow directory"
    fi
fi

echo ""
print_info "Installation complete. You can now use Claude Code with structured workflows!"
echo ""