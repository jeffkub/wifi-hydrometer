#!/usr/bin/python3

import json
import re
import sqlite3

import paho.mqtt.client as mqtt

DB_FILE = 'data.db'

MQTT_SERVER = 'mqttpi.rawr.lan'
MQTT_PORT = 1883
MQTT_TOPIC_BASE = 'brewing/hydrometer/'

hydro_json_re = re.compile(MQTT_TOPIC_BASE + '(.*)/json')


def init_db():
    conn = sqlite3.connect(DB_FILE)

    c = conn.cursor()
    c.execute('''
        CREATE TABLE IF NOT EXISTS devices(
            id INTEGER PRIMARY KEY,
            name TEXT UNIQUE,
            cur_session INTEGER DEFAULT 0
        )
    ''')

    c.execute('''
        CREATE TABLE IF NOT EXISTS log(
            id INTEGER PRIMARY KEY,
            device INTEGER,
            session INTEGER,
            bat_v REAL,
            temp_f REAL,
            light_vis REAL,
            light_ir REAL,
            light_uv REAL,
            accel_x REAL,
            accel_y REAL,
            accel_z REAL,
            tilt REAL,
            wifi_conn_fail INTEGER,
            mqtt_conn_fail INTEGER,
            last_run_time REAL,
            timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
            FOREIGN KEY(device) REFERENCES devices(id)
        )
    ''')

    conn.commit()
    conn.close()


def log_data(device, data):
    conn = sqlite3.connect(DB_FILE)

    c = conn.cursor()

    c.execute('''
        INSERT OR IGNORE INTO devices( name ) VALUES( :device )
    ''', {'device': device})

    c.execute('''
        INSERT INTO log(
            device, session,
            bat_v, temp_f,
            light_vis, light_ir, light_uv,
            accel_x, accel_y, accel_z, tilt,
            wifi_conn_fail, mqtt_conn_fail, last_run_time )
        SELECT
            id, cur_session,
            :bat_v, :temp_f,
            :light_vis, :light_ir, :light_uv,
            :accel_x, :accel_y, :accel_z, :tilt,
            :wifi_conn_fail, :mqtt_conn_fail, :last_run_time
        FROM devices WHERE name=:device
    ''', {'device': device, **data})

    conn.commit()
    conn.close()


def on_message(client, userdata, msg):
    print(msg.topic + ' ' + str(msg.payload))

    match = hydro_json_re.match(msg.topic)
    if match:
        device = match.group(1)
        payload = json.loads(msg.payload.decode())
        log_data(device, payload)


def main():
    init_db()

    client = mqtt.Client()
    client.on_message = on_message

    client.connect(MQTT_SERVER, MQTT_PORT, 60)
    client.subscribe(MQTT_TOPIC_BASE + '+/json', 2)

    client.loop_forever()


if __name__ == "__main__":
    main()
