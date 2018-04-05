#!/usr/bin/python3

import json

import paho.mqtt.client as mqtt

MQTT_SERVER = 'mqttpi.rawr.lan'
MQTT_PORT = 1883


def main():
    client = mqtt.Client()
    client.connect(MQTT_SERVER, MQTT_PORT, 60)

    data = {
        'bat_v': 4.2,
        'temp_f': 72.2,
        'light_vis': 10,
        'light_ir': 10,
        'light_uv': 10,
        'accel_x': 0.0,
        'accel_y': 0.0,
        'accel_z': 1.0,
        'tilt': 45.0,
        'wifi_conn_fail': 0,
        'mqtt_conn_fail': 0,
        'last_run_time': 8.3
    }

    data_str = json.dumps(data)

    client.publish('brewing/hydrometer/test/json', data_str)


if __name__ == "__main__":
    main()
