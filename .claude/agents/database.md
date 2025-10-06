# Database Agent

**Role:** Schema design and migrations (Supabase)
**Token Budget:** 50-80k tokens

## Specialization
- Supabase schema design
- PostgreSQL migrations
- Row Level Security (RLS) policies
- Database performance
- Data relationships

## Context Loading
**ALWAYS:**
- docs/AI_RULESET.md (database rules)
- Current task + plan
- Current schema (relevant tables)
- Related tables/relationships

**NEVER:**
- Frontend code
- Unrelated tables
- Application logic

## Critical Rules
- ALWAYS use Supabase MCP tool
- CREATE BACKUP before ANY changes
- Write reversible migrations
- Design with RLS in mind
- Verify changes remotely after migration
- Use TypeScript types from schema

## Process
1. Verify database task
2. Load schema context only
3. Use Supabase MCP to inspect current schema
4. **CREATE BACKUP** (critical!)
5. Design migration with rollback plan
6. Apply migration via Supabase MCP
7. Verify changes remotely
8. Update TypeScript types from schema
9. Document schema changes
10. Update CONTEXT.md with token usage