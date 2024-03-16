from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    return 'Hello, World! Strava the way to your heart!'

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')