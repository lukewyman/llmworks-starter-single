# llmworks-starter-single

# llmworks-starter (Single Service)

This repo is a **starter template** for building microservices with a
contract-first, closed-loop workflow. It demonstrates the four core layers
we follow in every service:

```
app/
├ adapters/ # I/O boundaries: DB, S3, HTTP clients, etc.
├ contracts/ # Pydantic models: request/response, errors, events
├ services/ # Business logic: pure functions/classes
└ main.py # FastAPI entrypoint + routers (thin controllers)
tests/ # Unit & API tests
```


### Layer responsibilities

- **Contracts**  
  Define the schema of inputs/outputs and errors. These are the frozen
  interfaces that drive implementation and tests.

- **Services**  
  Pure business logic. Testable without frameworks. Implements the use-cases
  described by the contracts.

- **Adapters**  
  Integration code at the boundary of the system (databases, queues, APIs).
  Services call adapters, but never the other way around.

- **Routers (FastAPI)**  
  Thin controllers. Parse/validate with contracts, call services, return
  results. No business logic here.

### Example flow

```
GET /hello?name=world
→ HelloQuery (contract)
→ make_greeting() (service)
→ HelloOut (contract)
→ FastAPI returns JSON
```


### Guardrails

- **Contracts come first**: no code is written without a Pydantic model.  
- **Tests come first**: unit tests validate services before routers/adapters.  
- **Routers stay thin**: all real logic lives in services.  
- **Adapters are boundaries**: never bleed external concerns into services.  

---

This repo also includes:

- `.pre-commit-config.yaml` with lint/type hooks  
- GitHub Actions CI (`.github/workflows/ci.yml`)  
- A starter `Makefile` with `make preflight`  

Together, these form the **closed loop**:
spec → contracts → tests → services → API → CI.

