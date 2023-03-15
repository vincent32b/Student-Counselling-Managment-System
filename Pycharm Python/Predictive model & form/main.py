import streamlit as st
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import LabelEncoder

from sklearn.neighbors import KNeighborsClassifier
import numpy as np

st.header("Predict your academic performance")

# load model
df = pd.read_csv('D:\FYP2\studentdataset.csv')
print(df.head())
df.loc[df.G3 <= 10, 'G3'] = 0
df.loc[df.G3 > 10, 'G3'] = 1

X = df[['studytime', 'failures', 'absences', 'G1', 'G2']]
y = df['G3']

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=1)

knn = KNeighborsClassifier(n_neighbors=22)
# FIT the classifier to the data
knn.fit(X_train, y_train)
y_pred = knn.predict(X_test)
score = knn.score(X_test, y_test)

print(score)

st.subheader("Study Time")
left_column, right_column = st.columns(2)
with left_column:
    st.write('1: Less than 2 hours')
    st.write('2: 2 to 5 hours')
    st.write('3: 5 to 10 hours')
    st.write('4: More than 10 hours')
    inp_species = st.radio(
        'Enter Study Time',
        np.unique(df['studytime']))

st.subheader("failures")
left_column, right_column = st.columns(2)
with left_column:
    inp_species1 = st.slider(
        'Enter number of time failures:',
        df['failures'].min(),10)

st.subheader("absences")
left_column, right_column = st.columns(2)
with left_column:
    inp_species2 = st.slider(
        'Number of time absences',
        df['absences'].min(),df['absences'].max())

st.subheader("G1")
left_column, right_column = st.columns(2)
with left_column:
    inp_species3 = st.slider(
        'First Semester Score',
        df['G1'].min(),20)

st.subheader("G2")
left_column, right_column = st.columns(2)
with left_column:
    inp_species6 = st.slider('Second Semester Score',
                             df['G2'].min(),20)

print("hi")

if st.button('Make Prediction'):

    inputs = np.expand_dims(
        [int(inp_species), int(inp_species1), int(inp_species2), int(inp_species3), int(inp_species6)], 0)
    knn.fit(X_train, y_train)
    prediction = knn.predict(inputs)
    st.write("Predicted Result:")
    if prediction == 0:
        st.write("Alert! You will FAIL")
    elif prediction == 1:
        st.write("Congrats! You will PASS")
