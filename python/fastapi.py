from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()


# @app.get("/")
async def read_root():
    return {"Hello": "World"}


# @app.get("/items/{item_id}")
async def read_item(item_id: int, q: str = None):
    return {"item_id": item_id, "q": q}


class Item(BaseModel):
    name: str
    description: str = None
    price: float
    tax: float = None


# @app.post("/items/")
async def create_item(item: Item):
    return item


app.add_api_route("/", read_root)
app.add_api_route("/item/{item_id}", read_item)
app.add_api_route("/items/", create_item, methods=['POST'])

# gunicorn test:app -w 4 -k uvicorn.workers.UvicornWorker
