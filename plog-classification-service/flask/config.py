# Configurations
FLASK_HOST = "0.0.0.0"                                              # Flask host
FLASK_PORT = "80"                                                   # Flask port
FLASK_THREADED = True                                               # Flask threaded option
FLASK_DEBUG = True                                                  # Flask debug option

# Folders
DATA_FOLDER = './data'
UPLOAD_FOLDER = './uploads'

# Files
class_name_file = f'{DATA_FOLDER}/class_names.pkl'
model_file = f'{DATA_FOLDER}/omt_model.keras'