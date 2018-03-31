#!/usr/bin/python3

import argparse
import json
import re
import sqlite3

from daemonize import Daemonize
import paho.mqtt.client as mqtt

MQTT_TOPIC_BASE = 'brewing/hydrometer/'

hydro_json_re = re.compile(MQTT_TOPIC_BASE + '(.*)/json')


class Database:
    def __init__(self, path):
        self.path = path
        self.setup()

    def setup(self):
        conn = sqlite3.connect(self.path)
        with conn:
            conn.execute('''
                CREATE TABLE IF NOT EXISTS devices(
                    id INTEGER PRIMARY KEY,
                    name TEXT UNIQUE,
                    cur_session INTEGER DEFAULT 0
                )
            ''')

            conn.execute('''
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

        conn.close()

    def insert_log(self, device, data):
        conn = sqlite3.connect(self.path)
        with conn:
            conn.execute('''
                INSERT OR IGNORE INTO devices( name ) VALUES( :device )
            ''', {'device': device})

            conn.execute('''
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

        conn.close()


def on_message(client, userdata, msg):
    print(msg.topic + ' ' + str(msg.payload))

    match = hydro_json_re.match(msg.topic)
    if match:
        device = match.group(1)
        payload = json.loads(msg.payload.decode())
        userdata.insert_log(device, payload)


def logger(args):
    db = Database(args.db)

    client = mqtt.Client(userdata=db)
    client.on_message = on_message

    client.connect(args.host, args.port, 60)
    client.subscribe(MQTT_TOPIC_BASE + '+/json', 2)

    client.loop_forever()


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--daemon', action='store_true',
                        help='run as a daemon')
    parser.add_argument('--pidfile', default=None,
                        help='pid file')
    parser.add_argument('--db', default='data.db',
                        help='database file')
    parser.add_argument('--host', default='localhost',
                        help='hostname or IP address of the remote broker')
    parser.add_argument('--port', type=int, default=1883,
                        help='network port of the remote broker')
    args = parser.parse_args()

    if(args.daemon):
        # Start as a daemon
        daemon = Daemonize(app='mqtt-logger', pid=args.pidfile,
                           action=lambda: logger(args))
        daemon.start()
    else:
        logger(args)


if __name__ == "__main__":
        main()
