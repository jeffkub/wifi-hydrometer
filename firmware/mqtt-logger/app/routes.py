from flask import render_template
from app import app
from app.models import Device


@app.route('/')
@app.route('/index')
def index():
    devices = Device.query.all()
    return render_template('index.html', devices=devices)


@app.route('/device/<name>')
def device(name):
    device = Device.query.filter_by(name=name).first_or_404()
    logs = device.logs.all()
    return render_template('device.html', device=device, logs=logs)
