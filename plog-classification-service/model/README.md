## Overview
This section contains source code used for the multi-class classification of images into the following material classes:
- Paper
- Plastic
- Glass
- Metal
- Others

These classes were intentionally chosen to align with materials identified to be recyclable by the National Environmental Agency of Singapore, as documented [here](https://www.nea.gov.sg/docs/default-source/our-services/waste-management/list-of-items-that-are-recyclable-and-not.pdf). 

After classification by the Object Material Type Classification (OMT) model, a subsequent binary classification on the object's recyclability is performed. Instructions on how to prepare the object for recycling are also provided, where appropriate.

### Model Overview (TO EDIT)
---
The global model is built on top of Google's [mobilenet](https://tfhub.dev/google/tfjs-model/imagenet/mobilenet_v3_small_100_224/feature_vector/5/default/1) using transfer learning for the binary classification of food into `Fresh` (safe for consumption) or `Rotten` (unsafe for consumption). It is trained on the entire dataset of nine subsets of food items (explained more [here](#dataset)).

Transfer learning is used to optimise the `mobilenet` neural network for classification of food safety (whether it is rotten or fresh) through the attachment and training of a new classification head. 
![Transfer Learning](docs/transfer_learning.png)
Instead of building a model from scratch, transfer learning is used to build on top of the `mobilenet_v3_small` model which provides feature vectors of a neural network trained on the ImageNet dataset consisting of 1.4 million images and 1000 classes (ILSVRC-2012-CLS) and capable of recognising over 1000 image object types, allowing for faster training and better model performance.

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

Both datasets consist of random yet realistic transformations on object images, including rotation and distortions, which would help expose the model to different aspects of training data, reducing the chances of overfitting. 

After preprocessing and combining both datasets, the final dataset consists of the following distribution of images:
```
Others     9232
Paper      4571
Metal      4242
Glass      3215
Plastic    2975
```

The combined dataset is available for download [here](https://gla-my.sharepoint.com/:u:/g/personal/2837303a_student_gla_ac_uk/Ed0pU32-uYNKuzjscVhZlPUBdGtgnoB8dJU5axo5vC_xiw?e=SqkfpJ) (password: `plogathon-2024`).

### Model Performance and Tuning (TO EDIT)
---
After training and fine-tuning, the global model was able to correctly classify each subset of food item into the binary classes of `Fresh` and `Rotten` with the following metrics: <br>
```
| Metric       | Value   |
| ------------ | ------- |
| Accuracy     | 97.12%  |
| Miss         | 2.88%   |
| Precision    | 0.97    |
| Recall       | 0.97    |
| Specificity  | 0.97    |
| F1 Score     | 0.97    |
```

![Confusion Matrix](docs/global_model.png)

To view detailed specifics on the global model's performance on each subset of data, refer to the `output/global` folder.

Various model training configurations were tweaked and tried to obtain the optimal model, including changing the order of data subset used to train the model, data augmentation on dataset images, and experimentations using models trained on individual subsets of data.

In summary, the order of data subset used to train the model did not result in any significant change in the global model's performance. However, using a model trained on all training data of each subset of data yielded better performance compared to using a model that is only trained on subsets of data, even on test data of the subset that it is trained on. As such, the final global model prepared is trained on ALL training data of each subset of data.

### Directory Structure
---
```
dataset/ (contains images used for model training and testing)

docs/ (documentation images)

export/ (contains exported models)

eda_datasets.ipynb (code for dataset preparation for material type classification)

eda_recyclability.ipynb (code for dataset preparations for recyclability classification)
```

### Program Usage
---
The final fine-tuned OMT model is available in the `/export` folder. However, you may wish to train the model again or to test the model by following these instructions:

1. Create a Python virtualenv on your local environment:
    ```
    python3 -m venv .venv
    ```
2. Install [PyTorch](https://pytorch.org/) according to your machine's configuration.
3. Install the necessary project dependencies:
    ```
    pip3 install -r requirements.txt
    ```
4. Run the interactive Python notebook to train/test the OMT model. Ensure that you've linked the notebook to the correct Python virtualenv.