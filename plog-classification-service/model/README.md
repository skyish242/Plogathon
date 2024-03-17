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

However, CLIP was unable to produce desirable results for multi-class classification of object material types, which is likely due to its lack of generalisation to such images during its pre-training. Initial testing on the dataset resulted in the highest accuracy of 66.21% and precision of 66.71% when performing as a zero-shot classifier. Testing revealed that the `ViT-L/14` model performed the best, with the following results when tested against a 10% stratified sample of the dataset:
```
    Model: ViT-L/14
    Model parameters: 427,616,513
    Input resolution: 224
    Context length: 77
    Vocab size: 49408

    Accuracy: 0.6621287128712872
    Precision: 0.6671066030427073
    Recall: 0.6464374130645891
    F1 Score: 0.6345731510632313
    Matthews Correlation Coefficient (MCC): 0.5628138868486012
    Cohen's Kappa: 0.557143634710465
    Hamming Loss: 0.3378712871287129

    Confusion Matrix:
    [[683  81  16   2 141]
    [ 56 334  65   0   2]
    [ 27  13 246  12   0]
    [ 72   2  73 173   2]
    [ 34  82 134   5 169]]

    Classification Report:
                precision    recall  f1-score   support

            0       0.78      0.74      0.76       923
            1       0.65      0.73      0.69       457
            2       0.46      0.83      0.59       298
            3       0.90      0.54      0.67       322
            4       0.54      0.40      0.46       424

        accuracy                           0.66      2424
    macro avg       0.67      0.65      0.63      2424
    weighted avg       0.69      0.66      0.66      2424
```

### Model Fine-Tuning and Performance
---
To optimise CLIP for OMT classification, transfer learning was applied by training and attaching a classification head on top of CLIP, which acts as the Base Neural Network (BNN). This enables the new classification head to leverage on the learnings of CLIP as the BNN, allowing for faster training and better model performance.

Initial testing of CLIP's nine models as zero-shot classifiers (without prior training) on the dataset revealed that the `ViT-L/14` model performed the best on both a 1% and 10% stratified sample of the dataset. Stratified samples of the dataset were used to speed up initial testing and fine-tuning of the model. A classification head was trained on the OMT dataset and attached onto this variant of CLIP to enable optimal OMT classification. 

Prompt engineering on the text captions provided to the base CLIP model were also performed, revealing optimal performance using text prompts (ontologies) following the convention "photo of an object made of `material`". The text prompts provided for each of the five material type classes are provided below, with a special exception to the `Others` class.
```
Paper: photo of an object made of paper

Plastic: photo of an object made of plastic

Glass: photo of an object made of glass

Metal: photo of an object made of metal

Others: photo of an object made of anything other than paper, plastic, glass, or metal
```


After optimisations, the final OMT model was able to produce the following results:
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