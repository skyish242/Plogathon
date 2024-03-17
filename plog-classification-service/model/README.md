## Overview
This section contains source code used for the multi-class classification of images into the following material classes:
- Paper
- Plastic
- Glass
- Metal
- Others

These classes were intentionally chosen to align with materials identified to be recyclable by the National Environmental Agency of Singapore, as documented [here](https://www.nea.gov.sg/docs/default-source/our-services/waste-management/list-of-items-that-are-recyclable-and-not.pdf). 

After classification by the Object Material Type Classification (OMT) model, a subsequent binary classification on the object's recyclability is performed. Instructions on how to prepare the object for recycling are also provided, where appropriate.

### Dataset
---
The OMT model is trained on a combination of both the (1) [Garbage Classification](https://www.kaggle.com/datasets/mostafaabla/garbage-classification) and (2) [Recycle Classification](https://www.kaggle.com/datasets/jinfree/recycle-classification-dataset) datasets available on Kaggle. These datasets were combined together to fit into the five classes of materials available for classification by the OMT model.

The (1) Garbage Classification dataset consists of 12 initial classes that were re-arranged to fit into the five material classes:
- Paper
    - Cardboard
- Plastic
- Glass
    - Brown Glass
    - Green Glass
    - White Glass
- Metal
- Others
    - Battery
    - Biological
    - Clothes
    - Shoes
    - Trash

The (2) Recycle Classification dataset consists of 4 initial classes that were re-arranged to fit into the five material classes:
- Paper
- Plastic
- Glass
- Metal
    - can

Both datasets consist of random yet realistic transformations on images of objects, including rotation and distortions, which exposes the model to different aspects of training data, reducing the chances of overfitting. 

After preprocessing and combining both datasets, the final dataset consists of the following distribution of images:
```
Paper      4571
Plastic    2975
Metal      4242
Glass      3215
Others     9232
```

The combined dataset is available for download [here](https://gla-my.sharepoint.com/:u:/g/personal/2837303a_student_gla_ac_uk/Ed0pU32-uYNKuzjscVhZlPUBdGtgnoB8dJU5axo5vC_xiw?e=SqkfpJ) (password: `plogathon-2024`).

### Model Overview
---
The OMT model is built on top of OpenAI's [CLIP](https://openai.com/research/clip) model using transfer learning for the multi-class classification of images of objects as `Paper`, `Plastic`, `Metal`, `Glass` and `Others`. CLIP is a multi-modal neural network trained on 400 million image-text (text caption) pairs from the Internet, making it suitable for multiple use-cases including image classification, generation and ranking. CLIP boasts on-par or better performance without prior training as a generalised zero-shot classifier, when compared against other traditionally trained supervised models.

![CLIP Performance](docs/clip-performance.png)
*Source: OpenAI CLIP [(Radford et. al., 2021)](https://arxiv.org/pdf/2103.00020.pdf)*

However, CLIP was unable to produce desirable results for multi-class classification of object material types, which is likely due to its lack of generalisation to such images during its pre-training. Initial testing on the dataset resulted in the highest accuracy of *72.01%* and precision of *73.49%* when performing as a zero-shot classifier. 

### Model Fine-Tuning and Performance
---
To further optimise CLIP for OMT classification, transfer learning was applied by training and attaching a classification head on top of CLIP, which acts as the Base Neural Network (BNN). This enables the new classification head to leverage on the learnings of CLIP as the BNN, allowing for faster training and better model performance.

![OMT Model](docs/OMT-Model.png)
*Adapted from OpenAI's CLIP [(Radford et. al., 2021)](https://arxiv.org/pdf/2103.00020.pdf)*

Initial testing of CLIP's nine models as zero-shot classifiers (without prior training) on the dataset revealed that the `ViT-L/14` model performed the best on both a 1% and 10% stratified sample of the dataset. Stratified samples of the dataset were used to speed up initial testing and fine-tuning of the model. The `ViT-L/14` model's performance, when tested against a 10% stratified sample of the dataset, is provided illustrated below:
```
Model: ViT-L/14
Model parameters: 427,616,513
Input resolution: 224
Context length: 77
Vocab size: 49408

Accuracy: 0.720164609053498
Precision: 0.734947393591583
Recall: 0.7138424998330328
F1 Score: 0.703695785990944
Matthews Correlation Coefficient (MCC): 0.640289920044027
Cohen's Kappa: 0.6349013455887227
Hamming Loss: 0.27983539094650206

Confusion Matrix:
 [[70  9  0  0 14]
 [ 4 35  6  0  1]
 [ 2  2 26  0  0]
 [ 5  0  8 19  0]
 [ 1  5 11  0 25]]

Classification Report:
               precision    recall  f1-score   support

           0       0.85      0.75      0.80        93
           1       0.69      0.76      0.72        46
           2       0.51      0.87      0.64        30
           3       1.00      0.59      0.75        32
           4       0.62      0.60      0.61        42

    accuracy                           0.72       243
   macro avg       0.73      0.71      0.70       243
weighted avg       0.76      0.72      0.73       243
```

Prompt engineering on the text captions provided to the base CLIP model were also performed, revealing optimal performance using text prompts (ontologies) following the convention `a photo of an object made of <material>`. 

For instance, the following ontologies were tested:
- `<material>` (44.03% Accuracy, 49.70% Precision)
- `object made of <material>` (52.26% Accuracy, 57.56% Precision)
- `a picture of an object made of <material>` (68.31% Accuracy, 70.44% Precision)
- `a photo of an object made of <material>`  (**Optimal**: 72.01% Accuracy, 73.49% Precision)

Expressing appropriate class descriptions to CLIP is essential to fine-tuning its performance, as it enables us to leverage on the richness of its pre-training procedures. The optimised text prompts for each of the five material type classes are provided below, with a special exception for the `Others` class.
```
Paper: a photo of an object made of paper

Plastic: a photo of an object made of plastic

Glass: a photo of an object made of glass

Metal: a photo of an object made of metal

Others: a photo of an object made of anything other than paper, plastic, glass, or metal
```

Subsequently, a classification head was trained on the OMT dataset and attached onto CLIP to enable optimal OMT classification. After optimisations, the final OMT model was able to produce the following results:
```
FINAL MODEL RESULTS
```

### Directory Structure
---
```
clip/ (contains base CLIP model)

dataset/ (contains dataset used for model training and testing)

docs/ (documentation images)

export/ (contains exported models)

common.py (shared utility functions and variables used by the other programs)

eda_datasets.ipynb (code for dataset preparation for OMT classification)

eda_recyclability.ipynb (code for dataset preparations for recyclability classification)

zero_shot_performance.ipynb (code for evaluating the initial zero-shot performance of the CLIP model, without prior training for OMT classification)

OMT_model.ipynb (code for training and testing the fine-tuned OMT model)
```

### Program Usage
---
The final fine-tuned OMT model is available in the `/export` folder. However, you can train or test the model by following the instructions below.

1. Create a Python `virtualenv` on your local environment:
    ```
    python3 -m venv .venv
    ```
2. Install the necessary project dependencies, including [PyTorch](https://pytorch.org/) (according to your machine's configuration):
    ```
    pip3 install -r requirements.txt
    ```
3. Run the interactive Python notebook to train/test the OMT model, ensuring that you've linked the notebook to the correct Python `virtualenv`.