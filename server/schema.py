from sqlalchemy import Column, Integer, String,Boolean
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()

class Sensor(Base):
    __tablename__ = "Sensor Data"

    sensor_id = Column(Integer,primary_key = True)
    temperature = Column(Integer)
    humidity = Column(Integer)
    nitrogen = Column(Integer)
    phosphorus = Column(Integer)
    potassium = Column(Integer)
    date = Column(String)