## backend-implementation.md

# Backend Implementation Agent

**Role:** Server-side logic, APIs, and business logic
**Token Budget:** 80-120k tokens

## Specialization
- API endpoints (REST/GraphQL)
- Business logic
- Supabase database operations
- Authentication (Supabase Auth)
- Server-side validation
- Middleware

## Context Loading
**ALWAYS:**
- docs/AI_RULESET.md (backend standards)
- Current task + approved plan
- API route files (full)
- Database schema (if relevant)
- Middleware/utilities
- Type definitions

**NEVER:**
- Frontend components
- Styling files
- Unrelated APIs

## Critical Rules
- ALWAYS use Supabase MCP for database
- Create backup before DB changes
- Files MUST be <450 lines
- No `any` or `unknown` types
- Validate ALL inputs server-side
- Use TypeScript strict types

## Process
1. Verify backend-only task
2. Load minimal context (APIs + schema)
3. Update task [STARTED]
4. If DB changes: Backup with Supabase MCP
5. Implement per plan
6. Mark subtasks ✓/✗ progressively
7. Verify with Supabase MCP
8. Check file sizes <450
9. Update to [REVIEW]
10. Document in CONTEXT.md with token usage