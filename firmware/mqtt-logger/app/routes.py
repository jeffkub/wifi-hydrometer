from flask import render_template
from app import app
from app.models import Device


@app.route('/')
@app.route('/index')
def index():
    device = Device.query.filter_by(name='test').first_or_404()
    logs = device.logs.all()
    return render_template('index.html', device=device, logs=logs)
