from common import *
from model_functions import *
from PIL import Image
from sklearn.model_selection import train_test_split
import clip
import torch
import torch.nn as nn
from torch.utils.data import DataLoader
import numpy as np

# Load dataset
df_dataset = load_from_pickle(dataset_file)

# 80-20 Train-Test split
x_train, x_test, y_train, y_test = train_test_split(df_dataset['File'], df_dataset['Material Class'], test_size=0.2, stratify=df_dataset['Material Class'], random_state=1234)

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

# Select computation device
device = "cuda" if torch.cuda.is_available() else "cpu"

# Load model (ensure jit=False for training)
model, preprocess = clip.load(optimal_model, device=device, download_root=MODEL_FOLDER, jit=False)

# Define a custom dataset
class image_title_dataset():
    def __init__(self, list_image_path,list_txt):
        # Initialize image paths and corresponding texts
        self.image_path = list_image_path
        # Tokenize text using CLIP's tokenizer
        self.title  = clip.tokenize(list_txt)

    def __len__(self):
        return len(self.title)

    def __getitem__(self, idx):
        # Preprocess image using CLIP's preprocessing function
        image = preprocess(Image.open(self.image_path[idx]))
        # image = preprocess(Image.open(self.image_path[idx])).unsqueeze(0).to(device)
        
        title = self.title[idx]
        return image, title

# Create custom OMT dataset
dataset = image_title_dataset(list(x_train), list(y_train.map(material_class_prompt_mapping)))

# Define dataloader to efficient load dataset in batches during training
train_dataloader = DataLoader(dataset, batch_size=1000, shuffle=True) 

# Function to convert model's parameters to FP32 format
def convert_models_to_fp32(model): 
    for p in model.parameters(): 
        p.data = p.data.float() 
        p.grad.data = p.grad.data.float() 

if device == "cpu":
  model.float()
  
# Prepare the optimizer
optimizer = torch.optim.Adam(model.parameters(), lr=5e-5,betas=(0.9,0.98),eps=1e-6,weight_decay=0.2) # the lr is smaller, more safe for fine tuning to new dataset

# Specify the loss function
loss_img = nn.CrossEntropyLoss()
loss_txt = nn.CrossEntropyLoss()

# Train the model
num_epochs = 30
for epoch in range(num_epochs):
    for batch in train_dataloader:
        optimizer.zero_grad()

        # In each iteration, we load a batch of images and their corresponding captions.
        images, texts = batch 
        
        # The data is passed through our model, generating predictions.
        images = images.to(device)
        texts = texts.to(device)

        # Forward pass
        logits_per_image, logits_per_text = model(images, texts)
        
        # These predictions are compared with the ground truth to calculate the loss.
        # Compute loss
        ground_truth = torch.arange(len(images),dtype=torch.long,device=device)
        total_loss = (loss_img(logits_per_image,ground_truth) + loss_txt(logits_per_text,ground_truth))/2
        
        # This loss is then back-propagated through the network to update the model’s parameters.
        # Backward pass
        total_loss.backward()
        if device == "cpu":
            optimizer.step()
        else: 
            convert_models_to_fp32(model)
            optimizer.step()
            clip.model.convert_weights(model)

# Export model
torch.save({
        'epoch': epoch,
        'model_state_dict': model.state_dict(),
        'optimizer_state_dict': optimizer.state_dict(),
        'loss': total_loss,
        }, model_file)