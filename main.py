from typing import Union
from fastapi import FastAPI

app = FastAPI()

# Write a file
with open("/app/data.txt","w") as of:
    of.write("HELLO?\n")

@app.get("/")
def read_root():
    return {"Hello": "World 4"}


@app.get("/items/{item_id}")
def read_item(item_id: int, q: Union[str, None] = None):
    return {"item_id": item_id, "q": q}
