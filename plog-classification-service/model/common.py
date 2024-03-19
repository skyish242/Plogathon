# Functions and variables shared by all programs in the folder
import pandas as pd
import os, re, json, pickle

""" Variables """
# Folders
PARENT_DATASET_FOLDER = './dataset'
DATASET_FOLDER = f'{PARENT_DATASET_FOLDER}/waste_dataset'
EXPORT_FOLDER = './export'
MODEL_FOLDER = './clip'

# Files
recyclability_dataset_file = f'{PARENT_DATASET_FOLDER}/cgs_data.txt'
recyclability_file = f'{EXPORT_FOLDER}/df_recyclability.pkl'
dataset_file = f'{EXPORT_FOLDER}/df_dataset.pkl'
material_items_file = f'{EXPORT_FOLDER}/dict_material_items.pkl'
model_file = f'{EXPORT_FOLDER}/omt_model.keras'

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