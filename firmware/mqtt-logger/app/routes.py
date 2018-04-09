import pygal

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

    chart = pygal.Line(width=1200, height=600, explicit_size=True)
    chart.x_labels = map(lambda d: d.strftime('%Y-%m-%d %H:%M:%S'), [log.timestamp for log in logs])
    chart.add('Bat [V]', [log.bat_v for log in logs])

    return render_template('device.html', device=device, logs=logs, chart=chart)
