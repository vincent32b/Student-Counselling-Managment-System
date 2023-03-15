import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
from itertools import combinations
import numpy as np

from sklearn.model_selection import cross_val_score
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import  LabelEncoder
from sklearn.tree import DecisionTreeRegressor
from sklearn.ensemble import RandomForestRegressor
from sklearn.neighbors import KNeighborsClassifier

from sklearn.metrics import mean_squared_error, mean_absolute_error, r2_score

df = pd.read_csv('D:\FYP2\studentdataset.csv')

df.loc[df.G3 <= 9, 'G3'] = 0
df.loc[df.G3 > 9, 'G3'] = 1
df.loc[df.G2 <= 9, 'G2'] = 0
df.loc[df.G2 > 9, 'G2'] = 1
df.loc[df.G1 <= 9, 'G1'] = 0
df.loc[df.G1 > 9, 'G1'] = 1

X = df[['studytime','failures', 'absences', 'G1', 'G2']]
y = df['G3']

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=1)

knn = KNeighborsClassifier(n_neighbors = 3)
#FIT the classifier to the data
knn.fit(X_train, y_train)
y_pred = knn.predict(X_test)
score=knn.score(X_test, y_test)

print(score)
knn.save_model("best_model.json")