import json
import re

from app import app, db, mqtt
from app.models import Device, Log

hydro_json_topic = 'brewing/hydrometer/+/json'
hydro_json_re = re.compile(hydro_json_topic.replace('+', '(.*)'))


@mqtt.on_connect()
def handle_connect(client, userdata, flags, rc):
    mqtt.subscribe(hydro_json_topic)


@mqtt.on_message()
def handle_mqtt_message(client, userdata, message):
    app.logger.info(message.topic + ' ' + message.payload.decode())

    match = hydro_json_re.match(message.topic)
    if match:
        name = match.group(1)
        data = json.loads(message.payload.decode())

        dev = Device.query.filter_by(name=name).first()
        if not dev:
            dev = Device(name=name)
            db.session.add(dev)
            db.session.commit()

        log = Log(
            device=dev.id,
            session=dev.cur_session,
            bat_v=data['bat_v'],
            temp_f=data['temp_f'],
            light_vis=data['light_vis'],
            light_ir=data['light_ir'],
            light_uv=data['light_uv'],
            accel_x=data['accel_x'],
            accel_y=data['accel_y'],
            accel_z=data['accel_z'],
            tilt=data['tilt'],
            wifi_conn_fail=data['wifi_conn_fail'],
            mqtt_conn_fail=data['mqtt_conn_fail'],
            last_run_time=data['last_run_time']
        )
        db.session.add(log)
        db.session.commit()
