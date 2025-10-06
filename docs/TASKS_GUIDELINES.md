# TASKS_GUIDELINES.md

## Purpose
This document defines the exact format and structure for tasks in `TASKS.md` to ensure consistency and clarity for AI agents.

---

## Task Format Template

```markdown
## TASK-XXX: [Clear, Action-Oriented Title] [STATUS]
**Assigned Agent:** [Agent Type]
**Priority:** [HIGH | MEDIUM | LOW]
**Estimated Complexity:** [SIMPLE | MODERATE | COMPLEX]

**Description:**
[2-4 sentence description of what needs to be done and why]

**Context:**
[Any relevant background information, related tasks, or dependencies]

**Acceptance Criteria:**
- [ ] [Specific, measurable criterion 1]
- [ ] [Specific, measurable criterion 2]
- [ ] [Specific, measurable criterion 3]

**Subtasks:**
- [ ] [Concrete subtask 1]
- [ ] [Concrete subtask 2]
- [ ] [Concrete subtask 3]

**Files to Modify:**
- `path/to/file1.ts`
- `path/to/file2.tsx`
- Or: "TBD - determine during implementation"

**Dependencies:**
- TASK-XXX (if dependent on another task)
- Or: "None"

**Blocked By:**
- [Any blockers preventing start]
- Or: "None"

**Notes:**
[Any additional information, edge cases, or considerations]

---
```

---

## Task Status Values

Use ONLY these exact status values:

- **[NOT STARTED]** - Task is ready to begin
- **[STARTED]** - Task is actively being worked on
- **[REVIEW]** - Implementation complete, awaiting validation
- **[COMPLETED]** - Reviewed, tested, and approved
- **[BLOCKED]** - Cannot proceed due to dependency or issue
- **[CANCELLED]** - Task no longer needed

---

## Task ID Convention

**Format:** `TASK-XXX` where XXX is a zero-padded number

**Examples:**
- `TASK-001`
- `TASK-023`
- `TASK-105`

**Rules:**
- IDs are sequential within a cycle
- Never reuse IDs within the same project
- Start new cycles at TASK-001 or continue numbering

---

## Agent Types

Assign the most appropriate agent based on work domain:

### Frontend Specialists
- **UI/UX Agent** - Visual design, user interactions, accessibility
- **React Agent** - Component architecture, hooks, state management
- **Styling Agent** - CSS, Tailwind, responsive design, theming

### Backend Specialists
- **API Agent** - REST/GraphQL endpoints, request handling
- **Database Agent** - Schema design, queries, migrations, Supabase
- **Auth Agent** - Authentication, authorization, session management

### Full-Stack Specialists
- **Integration Agent** - Frontend-backend coordination, data flow
- **Performance Agent** - Optimization, caching, bundle size
- **Testing Agent** - Unit tests, integration tests, E2E tests

### Specialized Agents
- **DevOps Agent** - Build, deploy, CI/CD, environment config
- **SEO Agent** - Meta tags, sitemap, structured data, performance
- **Accessibility Agent** - WCAG compliance, screen readers, keyboard nav
- **Security Agent** - Vulnerability fixes, secure coding, penetration testing

**Assignment Guidelines:**
- For simple tasks: Assign one primary agent
- For complex tasks: Assign primary + support agents
- Example: "React Agent (primary), Styling Agent (support)"

---

## Priority Levels

**HIGH:**
- Critical bugs affecting production
- Blockers preventing other work
- Security vulnerabilities
- User-facing broken functionality

**MEDIUM:**
- Important features for upcoming release
- Performance improvements
- Non-critical bugs
- Technical debt with impact

**LOW:**
- Nice-to-have features
- Minor UI improvements
- Documentation updates
- Code cleanup

---

## Complexity Estimation

**SIMPLE:** (1-2 hours)
- Single file changes
- Minor bug fixes
- Configuration updates
- Simple UI tweaks

**MODERATE:** (3-8 hours)
- Multi-file changes
- New component creation
- API endpoint implementation
- Non-trivial bug fixes

**COMPLEX:** (1-3 days)
- Architecture changes
- Major feature implementation
- Database migrations
- Complex integrations

---

## Writing Effective Tasks

### Good Task Titles
✅ "Fix navigation state persistence bug"
✅ "Add user profile avatar upload with Supabase Storage"
✅ "Refactor UserProfile component under 450 lines"
✅ "Implement password reset email flow"

### Bad Task Titles
❌ "Fix bug"
❌ "Update code"
❌ "Make it better"
❌ "Do the thing we talked about"

### Good Descriptions
✅ "Navigation state is lost when users refresh the page or use browser back button. This breaks the user experience and causes confusion. Need to implement state persistence using sessionStorage or URL params."

### Bad Descriptions
❌ "Navigation is broken"
❌ "Fix the state thing"
❌ "Users are complaining"

### Good Acceptance Criteria
✅ "Browser back/forward buttons maintain correct navigation state"
✅ "Page refresh preserves current navigation position"
✅ "No console errors related to navigation"
✅ "Navigation works on mobile devices"

### Bad Acceptance Criteria
❌ "It works"
❌ "No bugs"
❌ "Users are happy"

### Good Subtasks
✅ "Analyze root cause of state loss in useNavigation hook"
✅ "Refactor state management to use useReducer pattern"
✅ "Add sessionStorage persistence layer"
✅ "Implement state restoration on page load"
✅ "Add unit tests for state persistence"
✅ "Test all navigation flows manually"

### Bad Subtasks
❌ "Fix the hook"
❌ "Test it"
❌ "Make it work"

---

## Subtask Status Marking

As work progresses, mark subtasks:

- **[ ]** - Not started
- **[✓]** or **[x]** - Completed successfully
- **[✗]** - Failed or skipped (explain in notes)
- **[→]** - In progress (optional)

**Example:**
```markdown
**Subtasks:**
- [✓] Analyze root cause of state loss
- [✓] Refactor to useReducer pattern
- [→] Add sessionStorage persistence
- [ ] Implement state restoration
- [ ] Add unit tests
- [ ] Manual testing
```

---

## Task Dependencies

**When to Note Dependencies:**
- Task requires another task to be completed first
- Task needs external resource/approval
- Task is blocked by technical limitation

**Format:**
```markdown
**Dependencies:**
- TASK-003 (needs auth system before user profile)
- External: Design team must provide mockups
- Technical: Waiting for Supabase feature release

**Blocked By:**
- TASK-012 must complete database migration first
```

---

## Files to Modify

**When Known:**
List specific file paths:
```markdown
**Files to Modify:**
- src/components/Navigation.tsx
- src/lib/hooks/useNavigation.ts
- src/app/layout.tsx
- src/types/navigation.ts
```

**When Unknown:**
```markdown
**Files to Modify:**
TBD - determine during implementation
```

**After Implementation:**
Update with actual files modified (can differ from estimate)

---

## Notes Section

Use for:
- Edge cases to consider
- Alternative approaches discussed
- Links to relevant documentation
- Security considerations
- Performance implications
- Breaking changes warnings

**Example:**
```markdown
**Notes:**
- Consider backward compatibility with existing user sessions
- Must not break mobile navigation (60% of users)
- Related discussion: https://github.com/org/repo/issues/123
- Performance: sessionStorage has 5-10MB limit
- Alternative considered: URL params (rejected due to UX)
```

---

## Complete Example

```markdown
## TASK-042: Implement User Avatar Upload with Supabase Storage [NOT STARTED]
**Assigned Agent:** Full-Stack Integration Agent
**Priority:** MEDIUM
**Estimated Complexity:** MODERATE

**Description:**
Users need ability to upload and change their profile avatar. Currently profiles show generic placeholder. Implement avatar upload using Supabase Storage with image optimization, validation, and proper error handling.

**Context:**
User profiles (TASK-038) are complete but missing avatar functionality. This is frequently requested feature. Supabase Storage bucket already configured in project.

**Acceptance Criteria:**
- [ ] Users can upload images (JPEG, PNG, WebP) up to 5MB
- [ ] Images are automatically resized to 400x400px
- [ ] Old avatars are deleted when new one uploaded
- [ ] Proper error messages for invalid files
- [ ] Loading states during upload
- [ ] Avatar displays immediately after successful upload
- [ ] Works on mobile devices

**Subtasks:**
- [ ] Create Supabase Storage bucket policy for avatars
- [ ] Implement file upload component with drag-and-drop
- [ ] Add image validation (type, size, dimensions)
- [ ] Implement server-side image processing
- [ ] Create avatar display component with fallback
- [ ] Add error handling and user feedback
- [ ] Implement delete old avatar logic
- [ ] Add loading states and progress indicator
- [ ] Write unit tests for upload logic
- [ ] Test on mobile devices

**Files to Modify:**
- src/app/profile/page.tsx
- src/components/profile/AvatarUpload.tsx (new)
- src/components/profile/AvatarDisplay.tsx (new)
- src/lib/supabase/storage.ts
- src/types/profile.ts

**Dependencies:**
- TASK-038 (User Profile Page must be complete)
- None other

**Blocked By:**
None

**Notes:**
- Supabase Storage bucket "avatars" already exists
- Use sharp library for server-side image processing
- Consider WebP format for better compression
- Implement progressive enhancement (works without JS)
- Security: Validate file types server-side, not just client
- Performance: Show optimistic UI update before upload completes
- Accessibility: Ensure screen reader announces upload success/failure

---
```

---

## Task Lifecycle Checklist

### When Creating Task:
- [ ] Unique TASK-ID assigned
- [ ] Clear, action-oriented title
- [ ] Detailed description (why + what)
- [ ] Specific acceptance criteria (3-7 items)
- [ ] Concrete subtasks (5-10 items)
- [ ] Appropriate agent assigned
- [ ] Priority level set
- [ ] Complexity estimated
- [ ] Dependencies noted
- [ ] Status set to [NOT STARTED]

### When Starting Task:
- [ ] Status updated to [STARTED]
- [ ] Agent has read task completely
- [ ] Planning Mode completed (if needed)
- [ ] Approach confirmed

### During Task:
- [ ] Subtasks marked progressively (✓/✗)
- [ ] Blockers noted if encountered
- [ ] Files list updated if changed

### When Completing Task:
- [ ] All subtasks marked
- [ ] All acceptance criteria met
- [ ] Status updated to [REVIEW]
- [ ] CONTEXT.md updated
- [ ] Build + lint passing

### After Review:
- [ ] Tests passed
- [ ] Code committed
- [ ] Status updated to [COMPLETED]

---

## Anti-Patterns to Avoid

❌ **Vague Tasks**
- "Fix the bug in the component"
- Use: "Fix navigation state persistence in useNavigation hook"

❌ **Missing Context**
- Task with no description or background
- Use: Explain why task matters and what problem it solves

❌ **Untestable Criteria**
- "Make it better"
- Use: "Reduce page load time to under 2 seconds"

❌ **Huge Monolithic Tasks**
- "Build entire user system"
- Use: Break into smaller tasks (auth, profile, settings, etc.)

❌ **Wrong Status Progression**
- Jumping from [NOT STARTED] to [COMPLETED]
- Use: Follow proper lifecycle: NOT STARTED → STARTED → REVIEW → COMPLETED

❌ **Neglecting Dependencies**
- Starting tasks that depend on incomplete work
- Use: Note dependencies, mark as [BLOCKED] if needed

---

## Quick Reference

**Minimum Required Fields:**
- Task ID + Title + Status
- Assigned Agent
- Description
- Acceptance Criteria (3+)
- Subtasks (3+)

**Recommended Fields:**
- Priority
- Complexity
- Files to Modify
- Dependencies
- Notes

**Status Flow:**
```
[NOT STARTED] → [STARTED] → [REVIEW] → [COMPLETED]
                     ↓
                [BLOCKED] → [STARTED] (when unblocked)
```

**Remember:** Good task definition = easier implementation = better results