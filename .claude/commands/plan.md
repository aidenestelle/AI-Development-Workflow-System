# Plan Command

**Usage:** `/plan`

**Purpose:** Enter Planning Mode for analysis before implementation

**Token Budget:** 40-60k

## When to Use

Use `/plan` when:
- User reports a bug
- User describes unexpected behavior
- Requirements are unclear
- Scope is ambiguous
- Root cause unknown
- Multiple solutions possible

## The Planning Mode Protocol

### Step 1: STOP
**DO NOT code yet. NO implementation.**

Read `docs/PLANNING_MODE.md` for complete methodology.

### Step 2: GATHER Information

Ask clarifying questions:
- "What's the exact error message?"
- "What were you doing when this happened?"
- "What file(s) are affected?"
- "What was the expected vs actual behavior?"
- "Can you show me the relevant code?"
- "When did this start happening?"

**Context Loading (40-60k budget):**
- ✓ Task description or bug report
- ✓ Error messages/stack traces
- ✓ Relevant code files (signatures first, full only if needed)
- ✓ Related type definitions
- ✗ Entire codebase
- ✗ Unrelated files

### Step 3: ANALYZE

Find the **root cause**, not just symptoms:

1. **Read the code carefully**
   - Understand current implementation
   - Identify the issue location
   - Trace the data flow

2. **Identify root cause**
   - Why is this happening?
   - What's the underlying issue?
   - Is this a symptom of a bigger problem?

3. **Consider side effects**
   - What else might be affected?
   - Are there similar issues elsewhere?
   - Will the fix break anything?

4. **Think about edge cases**
   - What unusual scenarios exist?
   - How should errors be handled?
   - What are boundary conditions?

### Step 4: CREATE A PLAN

Present a detailed implementation plan:

```markdown
## Root Cause Analysis
[Explain what's actually wrong and why]

## Proposed Solution
[Describe the fix/implementation approach]

## Implementation Steps
1. [First specific action]
2. [Second specific action]
3. [Third specific action]
...

## Why This Approach
[Explain reasoning and alternatives considered]

## Files to Modify
- path/to/file1.ts - [what changes]
- path/to/file2.tsx - [what changes]

## Potential Risks
- [Risk 1 and mitigation]
- [Risk 2 and mitigation]

## Testing Strategy
- [How to verify the fix]
- [Edge cases to test]

## Estimated Complexity
[SIMPLE / MODERATE / COMPLEX]

## Recommended Agent
[Frontend / Backend / Full-Stack / Database / Refactoring]

## Token Budget Estimate
[Estimated tokens for implementation]
```

### Step 5: GET APPROVAL

Wait for user confirmation:
- "Does this plan make sense?"
- "May I proceed with this approach?"
- "Any concerns or changes needed?"

**DO NOT implement until approved.**

### Step 6: HANDOFF

After approval, pass to appropriate Implementation Agent:
- State which agent should handle it
- Summarize the approved plan
- Specify context to load
- Confirm token budget

## Example

**User:** "The navigation is broken - state gets lost on page refresh"

**Your response (Planning Mode):**

```
Entering Planning Mode (40-60k token budget)...
Reading docs/PLANNING_MODE.md...

STEP 1: STOP ✓
No coding yet. Analyzing first.

STEP 2: GATHER

Let me understand the issue better:

1. What specific navigation state is being lost?
   - Route history?
   - Navigation menu state?
   - Breadcrumbs?

2. Does this happen:
   - Only on page refresh?
   - On browser back/forward?
   - On direct URL navigation?

3. Can you share:
   - The navigation component code?
   - Any console errors?
   - Browser being used?

Context loaded so far: ~25k tokens
- Task description
- Navigation.tsx (signatures)
- Awaiting more info before loading full code
```

**User provides details**

**You continue:**

```
STEP 3: ANALYZE

Context now loaded: ~48k tokens
- Navigation.tsx (full - 287 lines)
- useNavigation.ts (full - 156 lines)
- router config (partial)

Root Cause Found:
The useNavigation hook uses useState with a callback that 
captures the initial route. When the page refreshes, the 
closure captures stale state, causing the loss.

Similar Issues:
- Checked other hooks: useRouter, useBreadcrumbs
- No similar patterns found
- This is isolated to useNavigation

STEP 4: CREATE PLAN

═══════════════════════════════════════
ROOT CAUSE ANALYSIS
═══════════════════════════════════════
The useNavigation hook has a stale closure problem. 
The useState callback captures the route on mount, 
but doesn't update when the route changes, leading 
to state loss on refresh.

═══════════════════════════════════════
PROPOSED SOLUTION
═══════════════════════════════════════
Refactor useNavigation from useState to useReducer.
This eliminates closures and ensures state updates
are based on current values, not captured snapshots.

═══════════════════════════════════════
IMPLEMENTATION STEPS
═══════════════════════════════════════
1. Create reducer function for navigation actions
2. Replace useState with useReducer in useNavigation
3. Add state persistence to sessionStorage
4. Implement restoration logic on mount
5. Update Navigation.tsx to use new hook API
6. Add memoization to prevent re-renders
7. Test all navigation scenarios

═══════════════════════════════════════
WHY THIS APPROACH
═══════════════════════════════════════
- useReducer eliminates closure issues
- sessionStorage provides persistence
- Memoization optimizes performance
- Minimal breaking changes to API

Alternatives considered:
- useRef: Would work but less elegant
- Context: Overkill for this use case
- Library: Adds dependency unnecessarily

═══════════════════════════════════════
FILES TO MODIFY
═══════════════════════════════════════
- src/lib/hooks/useNavigation.ts
  - Replace useState with useReducer
  - Add persistence layer
  - Add memoization

- src/components/Navigation.tsx
  - Update hook usage (minimal changes)
  - Add error boundary

═══════════════════════════════════════
POTENTIAL RISKS
═══════════════════════════════════════
- API changes may affect other components
  Mitigation: Keep API mostly the same
  
- sessionStorage has 5-10MB limit
  Mitigation: Only store essential state

- Performance impact from persistence
  Mitigation: Debounce writes

═══════════════════════════════════════
TESTING STRATEGY
═══════════════════════════════════════
- Manual: Test all navigation flows
- Manual: Verify browser back/forward
- Manual: Test refresh on various pages
- Manual: Test with sessionStorage full
- Unit: Test reducer logic
- Unit: Test persistence layer

═══════════════════════════════════════
ESTIMATES
═══════════════════════════════════════
Complexity: MODERATE
Agent: Frontend Implementation
Token Budget: ~95k (80-120k range)
Time: 2-3 hours

═══════════════════════════════════════
STEP 5: APPROVAL REQUESTED
═══════════════════════════════════════

This plan addresses the root cause (stale closures),
provides a robust solution (useReducer + persistence),
and minimizes breaking changes.

May I proceed with this implementation?
```

**User approves**

**You respond:**

```
STEP 6: HANDOFF

Plan approved! ✓

Passing to Frontend Implementation Agent:
- Token budget: 80-120k
- Files to load: useNavigation.ts, Navigation.tsx, types
- Context: This plan + files mentioned above
- No backend changes needed

Frontend Implementation Agent will now execute this plan.
```

## Anti-Patterns to Avoid

❌ **Vibe Coding**
"Let me just try changing this..."

✅ **Planning Mode**
"Let me analyze the root cause first..."

❌ **Shotgun Debugging**
"I'll change multiple things and see what works"

✅ **Targeted Fix**
"The issue is X, so I'll change Y specifically"

❌ **Assumption Coding**
"I think this is the problem..."

✅ **Verified Analysis**
"I've confirmed the issue is..."

❌ **Quick Patch**
"I'll add a try-catch to hide the error"

✅ **Root Cause Fix**
"I'll fix the underlying state management issue"

## Success Criteria

A good plan has:
- ✓ Clear root cause identified
- ✓ Specific implementation steps
- ✓ Reasoning explained
- ✓ Risks noted with mitigations
- ✓ Testing strategy defined
- ✓ Agent and budget specified
- ✓ Files to modify listed

## Required Files
- docs/PLANNING_MODE.md
- docs/AGENTS.md (for agent selection)
- Relevant code files (minimal loading)

## Remember

**The Golden Rule:**
> Think first, code second. When in doubt, ask.

Five minutes of planning saves hours of debugging.