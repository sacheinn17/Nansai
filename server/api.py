from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from dataBase import Database
import uvicorn

app = FastAPI()

# app.add_middleware(
#     CORSMiddleware,
#     allow_origins=["http://localhost:8000"],
#     allow_credentials=True,
#     allow_methods=["*"],
#     allow_headers=["*"],
# )

db = Database()
@app.get("/")
async def success():
   return {"status": "success"}



@app.get("/sensor/{sensorID}/{temperature}/{humidity}/{nitrogen}/{phosphorus}/{potassium}/")
async def addEntry(sensorID:int,temperature:int,humidity:int,nitrogen:int,phosphorus:int,potassium:int):
   db.addEntry(sensorID,temperature,humidity,nitrogen,phosphorus,potassium)
   return {"status": "success"}

@app.get("/sensor/")
async def getSensorValues():
   a = db.getSensorValues()
   print(a)
   return a

if __name__ == "__main__":
   uvicorn.run(app,host = "0.0.0.0",port=8000)