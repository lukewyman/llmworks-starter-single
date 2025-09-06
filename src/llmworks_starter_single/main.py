from fastapi import FastAPI, Query

from llmworks_starter_single.contracts.hello import HealthOut, HelloOut, HelloQuery
from llmworks_starter_single.services.greeting import make_greeting

app = FastAPI()


@app.get("/healthz", response_model=HealthOut)
def healthz() -> HealthOut:
    return HealthOut(ok=True)


@app.get("/hello", response_model=HelloOut)
def hello(name: str = Query("world", min_length=1, max_length=100)) -> HelloOut:
    return make_greeting(HelloQuery(name=name))
