from flask import Flask, Response, request, render_template
from utils import *

app = Flask(__name__)
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

@app.route('/')
def index():
  return render_template("index.html")

@app.route('/upload', methods=['POST'])
def upload():
    if 'uploaded_img' not in request.files:
        return 'No file part'

    file = request.files['uploaded_img']

    if file.filename == '':
        return 'No selected file'

    if file:
        filename = file.filename
        file.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
        return 'File uploaded successfully'

if __name__ == '__main__':
  # Start Flask app
  app.run(host=FLASK_HOST, port=FLASK_PORT, threaded=FLASK_THREADED, debug=FLASK_DEBUG,)