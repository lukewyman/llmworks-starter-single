install:
	uv pip install -e .[dev]

preflight:
	uv run pre-commit run -a
	uv run ruff check .
	uv run black --check .
	uv run mypy .
	uv run pytest -q --cov=llmworks_starter_single --cov-report=term-missing

test:
	uv run pytest -q
