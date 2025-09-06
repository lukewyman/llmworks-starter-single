# docs/templates/work_order_template.md
ROLE: Senior Python dev (uv, FastAPI optional later), Pydantic v2, pytest, ruff, black, mypy.

GOAL:
Implement ONLY Spec §<ref>.

SCOPE (files allowed to change):
- <paths>

DO NOT CHANGE:
- app/contracts/* (unless explicitly stated)
- Public signatures

INTERFACES (frozen):
<code stubs or copied models>

ACCEPTANCE TESTS:
- tests/unit/<file>::<test_name>
- ...

DoD:
- Unified diff touching ONLY files in Scope
- ruff/black/mypy clean; pytest green; coverage ≥85% on touched
- No new deps unless listed
- Concise docstrings

Before coding: restate requirements with Spec refs. Write tests first, then minimal code. Ask if ambiguity remains.
