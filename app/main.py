from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    return "🚀 Hello from Flask running with Gunicorn and Docker!"
