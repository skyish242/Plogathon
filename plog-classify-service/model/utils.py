# Functions used by the OMT model
import matplotlib.pyplot as plt
import numpy as np
import tensorflow as tf
from common import *
from sklearn.metrics import confusion_matrix, accuracy_score, precision_score, recall_score, f1_score, classification_report, matthews_corrcoef, cohen_kappa_score, hamming_loss
from sklearn.model_selection import train_test_split
from tensorflow import keras

""" Functions """
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

# Function to return the performance for a multi-class classifier
def multi_class_metrics(list_y, list_pred):
    # Obtain metrics
    results = {
        "accuracy": accuracy_score(list_y, list_pred),
        "precision": precision_score(list_y, list_pred, average='macro'),
        "recall": recall_score(list_y, list_pred, average='macro'),
        "f1": f1_score(list_y, list_pred, average='macro'),
        "mcc": matthews_corrcoef(list_y, list_pred),
        "kappa": cohen_kappa_score(list_y, list_pred),
        "hamming_loss_val": hamming_loss(list_y, list_pred),
        "cm": confusion_matrix(list_y, list_pred),
        "class_report": classification_report(list_y, list_pred),
    }
    return results