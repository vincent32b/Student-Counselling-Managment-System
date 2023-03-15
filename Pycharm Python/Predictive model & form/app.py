import streamlit as st
import seaborn as sns
from sklearn.metrics import confusion_matrix, ConfusionMatrixDisplay
from sklearn.neighbors import KNeighborsClassifier
from sklearn.model_selection import train_test_split
import matplotlib.pyplot as plt
import pandas as pd
from sklearn import datasets, neighbors
from mlxtend.plotting import plot_decision_regions


@st.cache(persist=True)
def load_data():
    data = pd.read_csv('D:\FYP2\studentdataset.csv')
    return data


df = pd.read_csv('D:\FYP2\studentdataset.csv')

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


# get the state selected in the selectbox


def get_graph():
    st.title("Hello")
    fig = sns.pairplot(df, hue="G3")
    fig2 = st.pyplot(fig)
    return fig2


class_names = "Fail", "Pass"


def get_matrix():
    st.title("Confusion Matrix")
    cm = confusion_matrix(y_test, y_pred)
    ConfusionMatrixDisplay.from_predictions(y_test, y_pred, display_labels=class_names)
    st.set_option('deprecation.showPyplotGlobalUse', False)
    st.pyplot()

def get_knn():
    st.title("KNN Graph")
    X1 = df[['G1', 'G2']].values
    Y1 = df['G3'].astype(int).values
    clf = neighbors.KNeighborsClassifier(n_neighbors=22)
    clf.fit(X1, Y1)
    # Plotting decision region
    plot_decision_regions(X1, Y1, clf=clf, legend=2)
    # Adding axes annotations
    plt.xlabel('X')
    plt.ylabel('Y')
    plt.title('Knn with K=' + str(22))

    st.pyplot(plt.show())

st.title("KNN Classification algorithm")

col1, col2, col3 = st.columns(3)
col1.metric("Total Test Case", "209", "")
col2.metric("Number of selected attributes", "5", "")
col3.metric("Accuracy", score, "")

st.title("Correlation Test")
st.write("G2                  0.910743")
st.write("G1                  0.809142")
st.write("studytime           0.161629")
st.write("failures           -0.383145")
st.write("absences           -0.045671")

get_matrix()
get_knn()
