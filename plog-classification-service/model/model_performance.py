# Program used to evaluate performance of the OMT model
from utils import *

""" Model Performance """
# Load the trained model
model = keras.models.load_model(model_file)

# Load class names
class_names = load_from_pickle(class_name_file)

# Load dataset
df_dataset = load_from_pickle(dataset_file)

# 80-20 Train-Test split
x_train, x_test, y_train, y_test = train_test_split(df_dataset['File'], df_dataset['Material Class'], test_size=0.2, stratify=df_dataset['Material Class'], random_state=1234)
y_train = y_train.map(material_class_mapping)
y_test = y_test.map(material_class_mapping)

# Initialise predictions
list_train_pred = []
list_test_pred = []
for image_path in x_train:
    list_train_pred.append(predict_class(image_path, model, class_names, (224, 224)))
for image_path in x_test:
    list_test_pred.append(predict_class(image_path, model, class_names, (224, 224)))
    
# Get model's training performance
training_results = multi_class_metrics(list(y_train), list_train_pred)
accuracy = training_results['accuracy']
precision = training_results['precision']
recall = training_results['recall']
f1 = training_results['f1']
mcc = training_results['mcc']
kappa = training_results['kappa']
hamming_loss_val = training_results['hamming_loss_val']
cm = training_results['cm']
class_report = training_results['class_report']

# Print results
print("TRAINING DATASET")
print("Accuracy:", accuracy)
print("Precision:", precision)
print("Recall:", recall)
print("F1 Score:", f1)
print("Matthews Correlation Coefficient (MCC):", mcc)
print("Cohen's Kappa:", kappa)
print("Hamming Loss:", hamming_loss_val, end='\n\n')
print("Confusion Matrix:\n", cm, end="\n\n")
print("Classification Report:\n", class_report, end="\n\n\n")

# Get model's test performance
test_results = multi_class_metrics(list(y_test), list_test_pred)
accuracy = test_results['accuracy']
precision = test_results['precision']
recall = test_results['recall']
f1 = test_results['f1']
mcc = test_results['mcc']
kappa = test_results['kappa']
hamming_loss_val = test_results['hamming_loss_val']
cm = test_results['cm']
class_report = test_results['class_report']

# Print results
print("TEST DATASET")
print("Accuracy:", accuracy)
print("Precision:", precision)
print("Recall:", recall)
print("F1 Score:", f1)
print("Matthews Correlation Coefficient (MCC):", mcc)
print("Cohen's Kappa:", kappa)
print("Hamming Loss:", hamming_loss_val, end='\n\n')
print("Confusion Matrix:\n", cm, end="\n\n")
print("Classification Report:\n", class_report, end="\n\n\n")