# CONTEXT_UPKEEP_GUIDELINES.md

## Purpose
This document defines how to maintain `docs/CONTEXT.md` and `docs/HISTORY.md` to ensure efficient AI context management and project continuity.

---

## CONTEXT.md Maintenance

### When to Update
Update `docs/CONTEXT.md` after:
- Completing any task (status changes to [REVIEW])
- Making any code changes
- Adding/modifying features
- Fixing bugs
- Refactoring code

### Required Format
```markdown
## Task Completed: [TASK-ID] Task Title
**Files Modified:**
- exact/path/to/file1.ts
- exact/path/to/file2.tsx
- exact/path/to/file3.css

**Changes Made:**
[Detailed description of implementation]
- What was changed
- How it was changed
- Why this approach was chosen

**New Functionality:**
[User-facing features or behaviors added]
- What users can now do
- New UI elements or interactions
- Changed workflows

**Testing Focus:**
[Critical areas requiring validation]
- Key user flows to test
- Edge cases to verify
- Integration points to check

**Dependencies Added:**
[New packages or imports]
- package-name@version (reason for adding)
- Or: "None"

**Expected Behavior:**
[How the system should now work]
- Normal operation description
- Expected outcomes
- User experience changes
```

### Writing Guidelines

**Be Specific:**
- ❌ "Updated the component"
- ✅ "Added error boundary to UserProfile component with fallback UI and error logging"

**Be Comprehensive:**
- List ALL modified files with full paths
- Describe EVERY significant change
- Explain WHY decisions were made

**Be Actionable:**
- Testing focus should guide validation
- Expected behavior should be verifiable
- New functionality should be demonstrable

---

## HISTORY.md Maintenance

### When to Update
Update `docs/HISTORY.md` when:
- All tasks in `docs/TASKS.md` are [COMPLETED]
- Creating new task file (e.g., `TASKS_mm-dd-yyyy-version-xxx.md`)
- Archiving completed work cycle

### Summarization Process

**Step 1: Gather Information**
Read and analyze:
- All completed tasks from `docs/TASKS.md`
- All context entries from `docs/CONTEXT.md`

**Step 2: Create Summary**
Write a concise summary following this format:

```markdown
---
## Cycle: [Date Range or Version]
**Completed:** [YYYY-MM-DD]

### Overview
[1-2 paragraph summary of work cycle theme and major accomplishments]

### Tasks Completed ([X] total)
- **[TASK-ID]**: [Brief title] - [1 sentence outcome]
- **[TASK-ID]**: [Brief title] - [1 sentence outcome]
- [Continue for all tasks...]

### Major Changes
**Frontend:**
- [Key UI/UX improvements]
- [New features added]

**Backend:**
- [API changes]
- [Database modifications]

**Infrastructure:**
- [Build/deploy updates]
- [Dependency changes]

### Files Modified ([X] files)
[Group by directory/feature area]
- `src/components/`: [X] files
- `src/lib/`: [X] files
- `src/app/`: [X] files

### Dependencies Added
- package-name@version - [reason]
- Or: "None"

### Known Issues / Tech Debt
- [Any unresolved items]
- [Refactoring needed]
- Or: "None"

### Next Priorities
[Based on completed work, what logically comes next]
- [Priority 1]
- [Priority 2]
---
```

**Step 3: Append to HISTORY.md**
- Add summary to **bottom** of file
- Preserve chronological order (oldest first)
- Maintain separation lines (`---`)

**Step 4: Clean Up**
After appending to HISTORY.md:
- Delete all tasks from `docs/TASKS.md`
- Clear `docs/CONTEXT.md` (ready for new cycle)

---

## Summarization Best Practices

### Keep It Scannable
- Use bullet points for lists
- Bold important terms
- Group related items
- Use consistent formatting

### Balance Detail and Brevity
- **Too Brief:** "Fixed bugs" ❌
- **Too Verbose:** "Modified the UserProfile.tsx file by adding a new useState hook to track the loading state and implemented a useEffect that fetches..." ❌
- **Just Right:** "Added loading states and error handling to UserProfile component" ✅

### Focus on Impact
Prioritize information about:
1. User-facing changes
2. Breaking changes
3. Performance improvements
4. Architecture decisions
5. Technical debt introduced

### Maintain Continuity
Each summary should:
- Reference related previous work
- Note dependencies on other tasks
- Highlight blockers resolved
- Identify new blockers created

---

## Context Quality Checklist

Before marking any task as complete, verify CONTEXT.md entry has:

- [ ] Task ID and title
- [ ] Complete list of modified files (with paths)
- [ ] Detailed description of changes
- [ ] User-facing functionality described
- [ ] Testing guidance provided
- [ ] Dependencies explicitly listed (or "None")
- [ ] Expected behavior clearly stated
- [ ] WHY decisions were made (not just WHAT)

---

## History Quality Checklist

Before creating a new HISTORY.md entry, verify:

- [ ] All tasks from cycle are summarized
- [ ] Overview paragraph captures cycle theme
- [ ] Major changes grouped logically
- [ ] File counts are accurate
- [ ] Dependencies listed with reasons
- [ ] Known issues documented
- [ ] Next priorities suggested
- [ ] Formatting is consistent with previous entries

---

## Anti-Patterns to Avoid

**In CONTEXT.md:**
- ❌ Vague descriptions: "Updated things"
- ❌ Missing file paths: "Changed the component"
- ❌ No reasoning: "Added code"
- ❌ Incomplete lists: "Modified some files"

**In HISTORY.md:**
- ❌ Copying entire CONTEXT.md entries
- ❌ Missing task counts or file counts
- ❌ No grouping or organization
- ❌ Forgetting to note tech debt

---

## Example: Good vs Bad

### CONTEXT.md Entry

**❌ BAD:**
```markdown
## Task Completed: TASK-001
Fixed the bug
Changed some files
```

**✅ GOOD:**
```markdown
## Task Completed: TASK-001 Fix Navigation State Bug
**Files Modified:**
- src/components/Navigation.tsx
- src/lib/hooks/useNavigation.ts
- src/app/layout.tsx

**Changes Made:**
Root cause was stale closure in navigation hook. Refactored to use useReducer pattern for state management, ensuring all navigation state updates are atomic and properly tracked. Added memoization to prevent unnecessary re-renders.

**New Functionality:**
Navigation state now persists across page transitions. Back button works correctly in all scenarios. Added breadcrumb navigation for better UX.

**Testing Focus:**
- Test all navigation flows (home → profile → settings → back)
- Verify browser back/forward buttons work
- Check navigation persistence after page refresh

**Dependencies Added:**
None

**Expected Behavior:**
Users can navigate through app using UI controls or browser buttons without losing state or encountering broken links. Breadcrumbs show current location and allow quick navigation to parent pages.
```

### HISTORY.md Entry

**❌ BAD:**
```markdown
## Cycle 1
Fixed stuff and added features
```

**✅ GOOD:**
```markdown
---
## Cycle: Authentication & User Management
**Completed:** 2025-01-15

### Overview
Implemented complete user authentication system using Supabase, including sign-up, login, password reset, and protected routes. Enhanced user profile management with avatar uploads and preferences. Improved overall UX with loading states and error handling.

### Tasks Completed (5 total)
- **TASK-001**: Supabase Auth Setup - Integrated email/password authentication with session management
- **TASK-002**: User Profile Page - Created editable profile with avatar upload to Supabase Storage
- **TASK-003**: Protected Routes - Added middleware to secure authenticated-only pages
- **TASK-004**: Password Reset Flow - Implemented email-based password recovery
- **TASK-005**: Auth Error Handling - Added comprehensive error messages and loading states

### Major Changes
**Frontend:**
- New auth pages: login, signup, password reset
- User profile management interface
- Protected route wrapper components
- Toast notifications for auth events

**Backend:**
- Supabase Auth integration
- Row Level Security policies for user data
- Avatar storage bucket configuration
- Session management middleware

**Infrastructure:**
- Added @supabase/ssr for server-side auth
- Configured storage bucket for avatars
- Set up auth email templates

### Files Modified (12 files)
- `src/app/auth/`: 4 files (login, signup, reset, callback)
- `src/components/auth/`: 3 files (forms, buttons, providers)
- `src/lib/supabase/`: 2 files (client, server)
- `src/middleware.ts`: 1 file
- `src/app/profile/`: 2 files

### Dependencies Added
- @supabase/ssr@0.1.0 - Server-side auth support
- @supabase/supabase-js@2.39.0 - Supabase client

### Known Issues / Tech Debt
- Need to add OAuth providers (Google, GitHub)
- Profile page exceeds 450 lines - refactor planned
- Email templates need design polish

### Next Priorities
- Add social auth providers
- Refactor profile page into smaller components
- Implement user settings page
- Add account deletion flow
---
```

---

## Quick Reference

**After completing a task:**
1. Update CONTEXT.md with detailed entry
2. Mark task status appropriately

**When all tasks complete:**
1. Read all CONTEXT.md entries
2. Summarize into cohesive narrative
3. Append to bottom of HISTORY.md
4. Clear TASKS.md and CONTEXT.md

**Golden Rule:**
> Write CONTEXT.md for the next developer.  
> Write HISTORY.md for the project manager.

Both should be clear, complete, and actionable.