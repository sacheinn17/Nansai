from schema import Sensor,Base
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
import datetime
from fastapi import Response



dbPath = "Database\\"

engine = create_engine('sqlite:///'+dbPath+'/sensor.db',connect_args={"check_same_thread": False})
Session = sessionmaker(bind = engine)
session = Session()

sensor_query = session.query(Sensor)

class Database():
    def __init__(self):
        Base.metadata.create_all(engine)
        self.date = str(datetime.datetime.today().date())

        session.commit()
        
    def addEntry(self,sensorID,temperature,humidity,nitrogen,phosphorus,potassium):
        c = sensor_query.filter_by(sensor_id = sensorID).filter_by(date = self.date)
        if c.first() is not None:
            c.update({"temperature":temperature})
            c.update({"humidity":humidity})
            c.update({"nitrogen":nitrogen})
            c.update({"phosphorus":phosphorus})
            c.update({"potassium":potassium})
            c.update({"date":self.date})
        else:
            c = Sensor(sensor_id = sensorID,temperature = temperature,humidity = humidity,nitrogen = nitrogen,phosphorus = phosphorus,potassium = potassium,date = self.date) 
            session.add(c)
        session.commit()
    
    def getSensorValues(self):
        t = sensor_query
        retVal = []
        for i in t:
            retVal.append({"sensorID":str(i.sensor_id),"temperature":str(i.temperature),"humidity":str(i.humidity),"nitrogen":str(i.nitrogen),"phosphorus":str(i.phosphorus),"potassium":str(i.potassium)})

        return retVal