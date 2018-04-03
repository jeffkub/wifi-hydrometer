from flask import Flask
from config import Config
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate
from flask_mqtt import Mqtt


app = Flask(__name__)
app.config.from_object(Config)
db = SQLAlchemy(app)
migrate = Migrate(app, db)
mqtt = Mqtt(app)


from app import routes, models


@mqtt.on_connect()
def handle_connect(client, userdata, flags, rc):
    mqtt.subscribe('brewing/hydrometer/+/json')


@mqtt.on_message()
def handle_mqtt_message(client, userdata, message):
    print(message.topic + ' ' + message.payload.decode())
