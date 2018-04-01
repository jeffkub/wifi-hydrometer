from datetime import datetime
from app import db


class Device(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(64), index=True, unique=True)
    cur_session = db.Column(db.Integer, default=0)

    logs = db.relationship('Log', backref='dev', lazy='dynamic')

    def __repr__(self):
        return '<Device {}>'.format(self.name)


class Log(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    device = db.Column(db.Integer, db.ForeignKey('device.id'))
    session = db.Column(db.Integer)
    bat_v = db.Column(db.REAL)
    temp_f = db.Column(db.REAL)
    light_vis = db.Column(db.REAL)
    light_ir = db.Column(db.REAL)
    light_uv = db.Column(db.REAL)
    accel_x = db.Column(db.REAL)
    accel_y = db.Column(db.REAL)
    accel_z = db.Column(db.REAL)
    tilt = db.Column(db.REAL)
    wifi_conn_fail = db.Column(db.Integer)
    mqtt_conn_fail = db.Column(db.Integer)
    last_run_time = db.Column(db.REAL)
    timestamp = db.Column(db.DateTime, index=True, default=datetime.utcnow)

    def __repr__(self):
        return '<Log {}>'.format(self.id)
