# Functions and variables shared by all programs in the folder
import pickle, os, hashlib, re
import tensorflow as tf
from config import *
from tensorflow import keras

# Material-Class mapping
material_class_mapping = {0: 'Others', 1: 'Paper', 2: 'Plastic', 3: 'Glass', 4: 'Metal'}
inverse_material_class_mapping = {v: k for k, v in material_class_mapping.items()}

""" Functions """
# Function to serialise an object into a pickle file
def save_to_pickle(file_path, save_data):
    with open(file_path, 'wb') as file:
        pickle.dump(save_data, file)

# Function to deserialise a pickle file
def load_from_pickle(file_path):
    with open(file_path, 'rb') as file:
        loaded_data = pickle.load(file)
    return loaded_data

# Function to calculate the SHA256 hash of a file or string
def get_hash(object):
    # Calculate hash of string
    sha512 = hashlib.sha512()
    sha512.update(object.encode())
    return sha512.hexdigest()

# Function to preprocess an image before feeding it to the model
def preprocess_image(image_path, img_size):
    img = keras.preprocessing.image.load_img(image_path, target_size=img_size)
    img_array = keras.preprocessing.image.img_to_array(img)
    img_array = tf.expand_dims(img_array, 0)  # Create a batch

    # Preprocess the image (normalize pixel values)
    processed_img = keras.applications.mobilenet_v3.preprocess_input(img_array)
    return processed_img

# Function to predict the class of an image
def predict_class(image_path, model, class_names, img_size):
    processed_img = preprocess_image(image_path, img_size)
    predictions = model.predict(processed_img)
    predicted_class_index = tf.argmax(predictions[0]).numpy()
    return class_names[predicted_class_index]