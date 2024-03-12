from typing import Union

from fastapi import FastAPI

app = FastAPI()

@app.get("/getdata")
def get_data(q: Union[str, None] = None):
    #get data from database and return JSON object
    return ""