# Finish Task Command

**Usage:** `/finish`

**Purpose:** Test and complete the [REVIEW] task using Testing Agent

## Process

### Step 1: Load Testing Context
1. Read `docs/TASKS.md` (find task marked [REVIEW])
2. Read `docs/CONTEXT.md` (what was changed)
3. Read `docs/TESTING_GUIDELINES.md` (testing protocol)

**Token Budget:** 80-120k (Testing Agent)

**Context Loading:**
- ✓ Task with acceptance criteria
- ✓ Files changed (from CONTEXT.md)
- ✓ Testing guidelines
- ✗ Unrelated code
- ✗ Full project structure

### Step 2: Build Verification (MANDATORY)
```bash
pnpm build
# or npm run build
# or yarn build
```

**Expected:** 0 errors
**If errors:** STOP, update task to [STARTED], document issues

### Step 3: Lint Verification (MANDATORY)
```bash
pnpm lint
# or npm run lint
# or yarn lint
```

**Expected:** 0 errors, 0 warnings
**If issues:** STOP, update task to [STARTED], document issues

### Step 4: Automated Tests (if applicable)
```bash
pnpm test
```

**Expected:** All tests pass
**If failures:** Document and investigate

### Step 5: Manual Testing (MANDATORY)
Test EVERY acceptance criterion from the task:
- ✓ Happy path
- ✓ Edge cases
- ✓ Error states
- ✓ Browser compatibility (if UI)
- ✓ Mobile responsiveness (if UI)
- ✓ Accessibility (if UI)

### Step 6: Document Results
Update `docs/CONTEXT.md` with test results:

```markdown
**Testing Performed:**

**Build & Lint:**
- pnpm build: ✓ (0 errors)
- pnpm lint: ✓ (0 errors, 0 warnings)

**Automated Tests:**
- Unit tests: ✓ (23/23 passed)
- Integration tests: ✓ (5/5 passed)

**Manual Testing:**
- Acceptance Criterion 1: ✓ Verified
- Acceptance Criterion 2: ✓ Verified
- Acceptance Criterion 3: ✓ Verified
- Edge case testing: ✓ 5 scenarios tested
- Error handling: ✓ All error states handled

**Browser Testing:**
- Chrome: ✓
- Firefox: ✓
- Safari: ✓

**Mobile Testing:**
- iOS Safari: ✓
- Android Chrome: ✓

**Issues Found:** None

**Token Usage:** 95k (budget: 80-120k) ✓
```

### Step 7: Git Commit
```bash
git add .
git commit -m "feat: descriptive message about what was implemented

- Detail 1
- Detail 2
- Fixes #issue-number (if applicable)"

git push
```

### Step 8: Update Task Status
- If ALL tests pass: Update task to [COMPLETED]
- If ANY test fails: Update task to [STARTED], document failures

## Example

**User:** `/finish`

**Response:**
```
Reading docs/TASKS.md...
Task in [REVIEW]: TASK-001 - Fix mobile navigation

Reading docs/CONTEXT.md...
Files changed:
- Navigation.tsx
- useNavigation.ts

Reading docs/TESTING_GUIDELINES.md...

Testing Agent (80-120k token budget)
Context loaded: ~88k tokens

Running build verification...
$ pnpm build
✓ Compiled successfully (0 errors)

Running lint verification...
$ pnpm lint
✓ No errors, no warnings

Testing acceptance criteria:
✓ Browser back/forward buttons work correctly
✓ Navigation state persists after refresh
✓ No console errors
✓ Mobile navigation works smoothly

Testing edge cases:
✓ Rapid navigation changes
✓ Deep linking
✓ Navigation with query params

Browser testing:
✓ Chrome
✓ Firefox
✓ Safari

All tests passed!

Creating git commit...
$ git commit -m "fix: resolve navigation state persistence bug

- Refactored useNavigation hook to useReducer pattern
- Added state persistence layer
- Fixed stale closure issue
- Tested across all browsers"

✓ Committed and pushed

Task status: [REVIEW] → [COMPLETED]
Updated docs/CONTEXT.md with test results
Token usage: 88k tokens
```

## Critical Rules
- Build MUST pass (0 errors)
- Lint MUST pass (0 errors, 0 warnings)
- ALL acceptance criteria MUST be met
- If ANY fail: Status returns to [STARTED]
- Document EVERYTHING in CONTEXT.md

## Required Files
- docs/TASKS.md
- docs/CONTEXT.md
- docs/TESTING_GUIDELINES.md