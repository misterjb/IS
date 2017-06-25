import keras
from keras.models import Sequential
from keras.datasets import mnist
import matplotlib.pyplot as plt

# Laden des Datensatzes und Aufteilung in 60.000 Trainings- und 10.000 Testdaten
(x_train, y_train), (x_test, y_test) = mnist.load_data()

# Plot eines ausgewählten Beispieles in den Trainingsdaten
example_idx = 100
plt.title("Label: {}".format(y_train[example_idx]))
plt.imshow(x_train[example_idx], cmap='gray')
plt.show()