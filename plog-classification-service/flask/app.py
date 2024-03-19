from flask import Flask, Response, request, render_template, jsonify
from flask_cors import CORS
from utils import *

app = Flask(__name__)
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
CORS(app)

@app.route('/')
def index():
  return render_template("index.html")

@app.route('/upload', methods=['POST'])
def upload():
    # Initialise response
    response = {
      'status': False,
      'OMT': None,
      'Recyclability': None,
      'message': "Erroneous response"
    }
    
    # Ensure file is provided
    if('image' not in request.files):
        response['message'] = "No image provided"
        return jsonify(response)
    else:
      file = request.files['image']
      if file:
        # Save file
        file_ext = re.match(r'.+(\..+)', file.filename).group(1)
        filename = get_hash(file.filename) + file_ext
        file_path = os.path.join(app.config['UPLOAD_FOLDER'], filename)
        file.save(file_path)
        
        # Get OMT classification
        material_class = predict_class(file_path, model, class_names, (224, 224))
        
        # Update response
        response['status'] = True
        response['OMT'] = material_class
        response['message'] = material_class
        
        return jsonify(response)

if __name__ == '__main__':
  # Load the trained model
  model = keras.models.load_model(model_file)

  # Load class names
  class_names = load_from_pickle(class_name_file)
  
  # Start Flask app
  app.run(host=FLASK_HOST, port=FLASK_PORT, threaded=FLASK_THREADED, debug=FLASK_DEBUG,)