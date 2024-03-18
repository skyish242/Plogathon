# Functions used by the OMT model
from common import *
from PIL import Image
import clip
import torch
import torch.nn as nn
from tqdm import tqdm
from torch.utils.data import DataLoader
from sklearn.metrics import confusion_matrix, accuracy_score, precision_score, recall_score, f1_score, classification_report, matthews_corrcoef, cohen_kappa_score, hamming_loss
from sklearn.model_selection import train_test_split
import numpy as np

""" Global Variables """
# Select computation device
device = "cuda" if torch.cuda.is_available() else "cpu"

# Load CLIP model
model, preprocess = clip.load(optimal_model, device=device, download_root=MODEL_FOLDER)

# Initialise material classes
material_classes = [i.lower() for i in material_class_mapping.values()]
for idx, i in enumerate(material_classes):
    if(i == 'others'):
        material_classes[idx] = "anything other than paper, plastic, glass, or metal"

# Initialise material class text prompt mapping
material_class_prompt_mapping = {}
for idx, i in enumerate(material_classes):
    material_class_prompt_mapping[idx] = f"a photo of an object made of {i}"
inverse_material_class_prompt_mapping = {v: k for k, v in material_class_prompt_mapping.items()}

""" Classes """
# Define custom PyTorch Dataset to store OMT dataset
class OMT_Dataset():
    def __init__(self, list_image_path,list_txt):
        # Initialize image paths and corresponding texts
        self.image_path = list_image_path
        # Tokenize text using CLIP's tokenizer
        self.text_class = clip.tokenize(list_txt)

    def __len__(self):
        return len(self.text_class)

    def __getitem__(self, idx):
        # Preprocess image using CLIP's preprocessing function
        image = preprocess(Image.open(self.image_path[idx]))
        text_class = self.text_class[idx]
        return image, text_class

""" Functions """
# Function to extract features using CLIP as the BNN
def get_clip_features(x, y):
    # Create OMT dataset
    dataset = OMT_Dataset(list(x), list(y.map(material_class_prompt_mapping)))

    # Define dataloader to efficiently load dataset in batches
    omt_dataloader = DataLoader(dataset, batch_size=1000, shuffle=True) 
    
    # Initialise features
    list_features = []
    list_class = []
    
    # Disable gradient calculation as we're only perfoming inference
    with torch.no_grad():
        for image, text_class in tqdm(omt_dataloader):
            # Get image features
            image_features = model.encode_image(image.to(device))
            list_features.append(image_features)
            # Get class features
            class_features = model.encode_text(text_class)
            list_class.append(class_features)
    
    return torch.cat(list_features).cpu().numpy(), torch.cat(list_class).cpu().numpy()
    
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