#!/usr/bin/python
# -*- coding: utf-8 -*-

"""
ISP 3: Lineare Regression mit Stochastic Gradient Descent (SGD)
"""

from __future__ import absolute_import
from __future__ import division
from __future__ import print_function

import numpy as np

# DONE Hypothese h(x)
def h_x(w, X):
 return np.dot(X, w)
	
# DONE Sum of Squared Errors (SSE)
def sse(w, X, y):
    m, n = np.shape(X)
    result = 0
    for i in range(1, m):
        result += (h_x(w, X[i] - y[i])) ** 2
    result = result / 2
    return result

class LinearRegression(object):
    """Linear Regression Model

    Diese Klasse trainiert ein lineares Regressionsmodell mittels SGD
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

        # DONE: X um Bias-Term ergänzen
        # damit sollte X die Form [n_samples, n_features + 1] bekommen
        X = np.hstack((np.ones((np.shape(X))),X))
        # DONE: Initialisierung der Gewichte (inklusive Bias-Term)
        # self.weights in der Form [n_features + 1]
        self.weights = np.matmul((np.linalg.inv(np.transpose(X).dot(X)).
                     dot(np.transpose(X))),y)

        # Array zum Speichern des Errors für jeden SGD-Schritt
        self.cost = []
        # SGD Schleife über Iterationen
        for _ in range(iterations):
            # Schleife über Datensätze
            for i in range(m):

                # DONE: Update der Gewichte
                for j in range(n+1):
                    temp = y[i] - h_x(self.weights, X[i])
                    self.weights[j] = self.weights[j] + alpha * temp * X[i][j]

                # alternativ Schleife über Parameter (n+1 durch Bias-Term)
                # for j in range(n+1):
                #   self.weights[j] = …

            # Berechne SSE des SGD-Schritts mit den aktuallisierten Gewichten
            self.cost = self.cost + [sse(self.weights, X, y)]

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
        return X.dot(self.weights)