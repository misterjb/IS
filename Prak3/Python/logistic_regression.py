#!/usr/bin/python
# -*- coding: utf-8 -*-

"""
ISP 3: Logistische Regression mit Stochastic Gradient Descent (SGD)
"""

from __future__ import absolute_import
from __future__ import division
from __future__ import print_function

import numpy as np

# DONE Sigmoid Funktion
def sigmoid(x):
  return 1 / (1 + np.exp(-x))
  
# DONE Hypothese h(x)
def h_x(w,X):
  return sigmoid(np.dot(X, np.transpose(w)))
  
# DONE Cost Funktion
def cost(w, X, y):  
    w = np.matrix(w)
    X = np.matrix(X)
    y = np.matrix(y)
    first = np.multiply(-y, np.log(sigmoid(X * w.T)))
    second = np.multiply((1 - y), np.log(1 - sigmoid(X * w.T)))
    return np.sum(first - second) / (len(X))

class LogisticRegression(object):
    """Logistic Regression Model

    Diese Klasse trainiert ein logistisches Regressionsmodell mittels SGD
    """

    def __init__(self, random_seed=1):
        self.random_seed = random_seed


    def fit(self, X, y, alpha=0.001, iterations=1000):
        """Training des Modells anhand gegebener Trainingsdaten

        Args:
          X: Matrix der Trainingsdaten in der Form [n_samples, n_features]
          y: Vektor der Zielvariablen in der Form [n_samples]
          alpha: Lernrate des Gradientenverfahrens
          iterations: Anzahl der Iterationen von SGD über die Daten X

        Returns:
          self: Modell mit trainierten Gewichten
        """
        # Erweitern der Dimension von X falls X nur ein Feature beinhaltet
        # [n_samples] -> [n_samples, 1]
        if len(np.shape(X)) < 2:
            X = np.reshape(X, (np.shape(X)[0], 1))

        # m Samples mit n Attributen (exclusive Bias)
        m, n = np.shape(X)

        # DONE X um Bias-Term ergänzen
        # damit sollte X die Form [n_samples, n_features + 1] bekommen
        X = np.hstack((np.ones((np.shape(X))),X))
        # DONE Initialisierung der Gewichte (inklusive Bias-Term)
        # self.weights in der Form [n_features + 1]
        X = (np.linalg.inv(np.transpose(X).dot(X)).
                     dot(np.transpose(X)))
        self.weights = X.dot(y)

        # Array zum Speichern des Errors für jeden SGD-Schritt
        self.cost = []

        # append attribute x_0 to training samples
        x_0 = np.ones((m,1))
        X = np.concatenate([x_0, X], axis=1)

        # without numpy
        # x_0 = [[1.0] for _ in range(len(X))]
        # X = [foo + bar for foo, bar in zip(x_0, X)]

        # SGD Schleife über Iterationen
        for _ in range(iterations):
            # Schleife über Datensätze
            for i in range(m):

                # DONE Update der Gewichte
                for j in range(n+1):
                    temp = y[i] - h_x(self.weights, X[i])
                    self.weights[j] = self.weights[j] + alpha * temp * X[i][j]

            # Berechne SSE des SGD-Schritts mit den aktuallisierten Gewichten
            self.cost = self.cost + [cost_fn(self.weights, X, y)]

        return self

    def predict(self, X):
        """Vorhersage der Zielvariable

        Args:
          X: Matrix der Attribute pro Datensatz in der Form [n_samples, n_features]
        Returns:
          Array der vorhergesagten Zielvariablen in der Form [n_samples]
        """
        # DONE Berechnen der Zielvariablen über die Hypothese
        # folgende Zeile löschen
        X = np.hstack((np.ones((np.shape(X))), X))
        return h_x(self.weights, X)
