# TESTING_GUIDELINES.md

## Purpose
This document defines testing standards and procedures for validating task completion. All tasks must pass testing before marking as [COMPLETED].

---

## Testing Hierarchy

### Level 1: Build Verification (MANDATORY)
**Must pass before any other testing:**

```bash
# TypeScript compilation
pnpm build

# Expected: 0 errors
# If errors exist: STOP - Fix before proceeding
```

### Level 2: Code Quality (MANDATORY)
**Must pass before marking complete:**

```bash
# Linting
pnpm lint

# Expected: 0 errors, 0 warnings
# If issues exist: Fix all before proceeding
```

### Level 3: Automated Tests (if applicable)
**Run if project has test suite:**

```bash
# Unit tests
pnpm test

# Integration tests (if configured)
pnpm test:integration

# E2E tests (if configured)
pnpm test:e2e
```

### Level 4: Manual Testing (MANDATORY)
**Always required - test actual functionality**

---

## Build Testing Protocol

### What to Check
- ✅ No TypeScript errors
- ✅ No missing dependencies
- ✅ No circular dependencies
- ✅ No dead code elimination issues
- ✅ Bundle size reasonable (check if significant increase)

### Common Build Errors

**Type Errors:**
```typescript
// ❌ BAD
const user: any = getUser();

// ✅ GOOD
const user: User = getUser();
```

**Missing Imports:**
```typescript
// ❌ BAD
// Using component without import

// ✅ GOOD
import { Button } from '@/components/ui/button';
```

**Module Resolution:**
```typescript
// ❌ BAD
import { helper } from '../../lib/helper';

// ✅ GOOD (if path alias configured)
import { helper } from '@/lib/helper';
```

---

## Linting Protocol

### What to Check
- ✅ No ESLint errors
- ✅ No ESLint warnings
- ✅ Code follows project style guide
- ✅ No unused variables/imports
- ✅ Consistent formatting

### Auto-Fix When Possible
```bash
# Fix automatically fixable issues
pnpm lint --fix
```

### Common Lint Issues

**Unused Variables:**
```typescript
// ❌ BAD
const [count, setCount] = useState(0);
// setCount never used

// ✅ GOOD
const [count] = useState(0);
```

**Missing Dependencies:**
```typescript
// ❌ BAD
useEffect(() => {
  fetchData(userId);
}, []); // Missing userId dependency

// ✅ GOOD
useEffect(() => {
  fetchData(userId);
}, [userId]);
```

**Console Statements:**
```typescript
// ❌ BAD (in production code)
console.log('Debug info');

// ✅ GOOD
// Remove debug statements or use proper logger
```

---

## Automated Testing Protocol

### Unit Testing

**What to Test:**
- Individual functions in isolation
- Component rendering
- Hook behavior
- Utility functions
- State management

**Example Test Structure:**
```typescript
describe('useNavigation hook', () => {
  it('should initialize with default state', () => {
    // Test implementation
  });

  it('should update state on navigation', () => {
    // Test implementation
  });

  it('should persist state across re-renders', () => {
    // Test implementation
  });
});
```

**Coverage Expectations:**
- Critical paths: 100% coverage
- Business logic: 90%+ coverage
- UI components: 80%+ coverage
- Overall project: 70%+ coverage

### Integration Testing

**What to Test:**
- API interactions
- Database operations
- Multiple components working together
- Data flow through application

**Example Scenarios:**
- User authentication flow
- CRUD operations with real database
- Form submission with validation
- Navigation between pages

### E2E Testing

**What to Test:**
- Complete user workflows
- Cross-browser compatibility
- Real user scenarios
- Performance under load

**Example Workflows:**
- Sign up → Verify email → Login → Use feature
- Create item → Edit item → Delete item
- Search → Filter → Sort → Select result

---

## Manual Testing Protocol

### Pre-Testing Checklist
- [ ] Build passed successfully
- [ ] Lint passed with 0 errors/warnings
- [ ] Dev server running without errors
- [ ] Browser console clear of errors
- [ ] Network tab shows no failed requests

### Core Testing Areas

#### 1. Acceptance Criteria Validation
**Check EVERY criterion from task:**

```markdown
Example from TASK-042:
- [✓] Users can upload images (JPEG, PNG, WebP) up to 5MB
      → Test: Upload 4.5MB image ✓
      → Test: Upload 6MB image (should reject) ✓
      
- [✓] Images are automatically resized to 400x400px
      → Test: Upload 2000x1500 image, verify resize ✓
      
- [✓] Old avatars are deleted when new one uploaded
      → Test: Check storage, verify old file gone ✓
```

#### 2. Happy Path Testing
**Test normal, expected usage:**

1. Navigate to feature
2. Use feature as intended
3. Verify expected outcome
4. Check for visual/functional issues

**Example - User Profile:**
```
1. Navigate to profile page
2. Click "Edit Profile" button
3. Update name and bio
4. Click "Save Changes"
5. Verify changes persist after refresh
6. Check that UI updates immediately
```

#### 3. Edge Case Testing
**Test unusual but valid scenarios:**

- Empty states (no data)
- Maximum values (character limits)
- Minimum values (required minimums)
- Special characters in inputs
- Multiple rapid actions
- Concurrent actions

**Example - Avatar Upload:**
- Upload with no file selected
- Upload extremely small image (10x10px)
- Upload image with transparent background
- Cancel upload mid-progress
- Upload while previous upload in progress

#### 4. Error State Testing
**Test invalid scenarios:**

- Invalid inputs
- Network failures
- Permission denials
- Server errors
- Timeouts

**Example - Avatar Upload:**
- Upload .exe file (invalid type)
- Upload 50MB image (too large)
- Upload during offline mode
- Upload with insufficient permissions
- Upload when storage full

#### 5. User Experience Testing
**Verify usability:**

- [ ] Loading states show for async operations
- [ ] Error messages are clear and helpful
- [ ] Success feedback is visible
- [ ] Focus management is logical
- [ ] Keyboard navigation works
- [ ] Screen reader compatibility
- [ ] Mobile responsiveness
- [ ] Touch targets are adequate (min 44x44px)

#### 6. Performance Testing
**Check speed and efficiency:**

- [ ] Page loads in <3 seconds
- [ ] Interactions feel immediate (<100ms)
- [ ] No unnecessary re-renders
- [ ] Smooth animations (60fps)
- [ ] No memory leaks (check DevTools)
- [ ] Reasonable bundle size impact

#### 7. Browser Testing
**Test in multiple browsers:**

Minimum required:
- [ ] Chrome/Edge (Chromium)
- [ ] Firefox
- [ ] Safari (if on Mac)

For production:
- [ ] Mobile Chrome (Android)
- [ ] Mobile Safari (iOS)

#### 8. Responsive Testing
**Test at different screen sizes:**

- [ ] Desktop (1920x1080)
- [ ] Laptop (1366x768)
- [ ] Tablet (768x1024)
- [ ] Mobile (375x667)
- [ ] Mobile landscape

#### 9. Accessibility Testing

**Keyboard Navigation:**
- [ ] Tab through all interactive elements
- [ ] Enter/Space activates buttons/links
- [ ] Escape closes modals/dropdowns
- [ ] Arrow keys work in lists/menus

**Screen Reader:**
- [ ] All images have alt text
- [ ] Form inputs have labels
- [ ] Error messages are announced
- [ ] Loading states are announced
- [ ] Focus changes are announced

**Visual:**
- [ ] Color contrast meets WCAG AA (4.5:1)
- [ ] Text is readable at 200% zoom
- [ ] No information conveyed by color alone
- [ ] Focus indicators are visible

#### 10. Data Integrity Testing

**Database Changes:**
- [ ] Correct data saved to database
- [ ] No orphaned records
- [ ] Relationships maintained
- [ ] Constraints enforced

**State Management:**
- [ ] State updates correctly
- [ ] State persists when expected
- [ ] No stale state issues
- [ ] State synchronizes across components

---

## Testing Checklist by Task Type

### Bug Fix Tasks
- [ ] Original bug no longer occurs
- [ ] Fix doesn't introduce new bugs
- [ ] Root cause addressed (not just symptom)
- [ ] Similar bugs in codebase also fixed
- [ ] Regression tests added (if applicable)

### New Feature Tasks
- [ ] Feature works as specified
- [ ] All acceptance criteria met
- [ ] Edge cases handled
- [ ] Error states handled
- [ ] Performance acceptable
- [ ] Accessibility compliant
- [ ] Mobile responsive

### Refactoring Tasks
- [ ] Functionality unchanged
- [ ] Performance same or better
- [ ] Code quality improved
- [ ] No new bugs introduced
- [ ] All tests still pass
- [ ] Documentation updated

### Database Tasks
- [ ] Migrations run successfully
- [ ] Data integrity maintained
- [ ] Rollback tested
- [ ] Backup created and verified
- [ ] Performance acceptable
- [ ] Queries optimized

---

## Test Documentation

### Required in CONTEXT.md

When updating CONTEXT.md, include:

```markdown
**Testing Performed:**

**Build & Lint:**
- pnpm build: ✓ (0 errors)
- pnpm lint: ✓ (0 errors, 0 warnings)

**Automated Tests:**
- Unit tests: ✓ (23/23 passed)
- Integration tests: ✓ (5/5 passed)
- E2E tests: N/A

**Manual Testing:**
- Happy path: ✓ All acceptance criteria met
- Edge cases: ✓ Tested 8 scenarios, all handled
- Error states: ✓ Tested 5 error conditions, proper handling
- Browser testing: ✓ Chrome, Firefox, Safari
- Mobile testing: ✓ iOS Safari, Android Chrome
- Accessibility: ✓ Keyboard nav, screen reader tested
- Performance: ✓ Page load <2s, interactions <100ms

**Issues Found & Fixed:**
- Issue 1: Description and resolution
- Issue 2: Description and resolution
- Or: "None"

**Known Limitations:**
- Limitation 1: Description and workaround
- Or: "None"
```

---

## Dev Server Management

### Before Testing
```bash
# Start fresh dev server
pnpm dev

# Watch for:
# - No compilation errors
# - No runtime errors in console
# - Clean terminal output
```

### During Testing
- Monitor browser console for errors
- Check network tab for failed requests
- Watch for memory leaks in DevTools
- Verify hot reload works correctly

### After Testing
```bash
# ALWAYS kill dev server when done
# Press Ctrl+C in terminal
# Verify process is stopped

# Or force kill if needed:
# pkill -f "next dev"
# pkill -f "vite"
```

---

## Common Testing Mistakes

### ❌ Don't Do This

**Skipping Build/Lint:**
```
"It works in dev, so it's fine"
→ May have TypeScript errors that break production build
```

**Only Testing Happy Path:**
```
"Feature works when I use it normally"
→ Breaks with edge cases or errors
```

**Testing Once:**
```
"I tested it after implementing"
→ Later changes may have broken it
```

**Ignoring Console Errors:**
```
"App works despite console errors"
→ Errors indicate real problems
```

**Not Testing Mobile:**
```
"Looks good on my desktop"
→ 60% of users may be on mobile
```

### ✅ Do This

**Complete Test Suite:**
```
1. Build + lint (must pass)
2. Automated tests (if available)
3. Manual testing (comprehensive)
4. Cross-browser testing
5. Mobile testing
6. Accessibility testing
```

**Test Multiple Times:**
```
- After implementation
- After fixing bugs
- Before marking [REVIEW]
- After any changes
```

**Document Everything:**
```
Record all testing in CONTEXT.md:
- What was tested
- How it was tested
- Results (pass/fail)
- Issues found
- Issues fixed
```

---

## Testing Workflow

### Standard Testing Sequence

```bash
# 1. Build verification
pnpm build
# Must show: ✓ Compiled successfully

# 2. Lint verification  
pnpm lint
# Must show: 0 errors, 0 warnings

# 3. Automated tests (if configured)
pnpm test
# Must show: All tests passed

# 4. Start dev server
pnpm dev
# Must start without errors

# 5. Manual testing
# Follow manual testing protocol above

# 6. Kill dev server
# Ctrl+C

# 7. Final verification
pnpm build && pnpm lint
# Both must pass

# 8. Ready for [REVIEW] → [COMPLETED]
```

---

## When Tests Fail

### Debugging Process

1. **Read Error Messages Carefully**
   - Don't skip or ignore errors
   - Understand what failed and why

2. **Isolate the Problem**
   - What changed?
   - When did it break?
   - What's the minimal reproduction?

3. **Follow Bug Fix Protocol**
   - Read PLANNING_MODE.md
   - Find root cause
   - Don't quick patch

4. **Fix and Re-Test**
   - Implement proper fix
   - Test again (full suite)
   - Verify fix doesn't break other things

5. **Document**
   - Update CONTEXT.md with issue found
   - Explain what was wrong
   - Explain how it was fixed

---

## Quick Reference

**Mandatory Before [COMPLETED]:**
```bash
✓ pnpm build (0 errors)
✓ pnpm lint (0 errors, 0 warnings)
✓ All acceptance criteria verified
✓ Manual testing complete
✓ Dev server killed
✓ CONTEXT.md updated with test results
```

**Common Test Commands:**
```bash
pnpm build              # TypeScript compilation
pnpm lint               # ESLint check
pnpm lint --fix         # Auto-fix lint issues
pnpm test               # Run test suite
pnpm test:watch         # Watch mode for tests
pnpm dev                # Start dev server
pnpm type-check         # Type checking only
```

**Testing Priority:**
```
1. Does it build? (CRITICAL)
2. Does it lint? (CRITICAL)
3. Does it meet criteria? (CRITICAL)
4. Does it handle errors? (HIGH)
5. Is it accessible? (HIGH)
6. Is it performant? (MEDIUM)
```

**Remember:** If you wouldn't ship it to production, don't mark it [COMPLETED].