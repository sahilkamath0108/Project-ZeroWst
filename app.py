from flask import Flask,render_template, request, redirect
import pickle
import pandas as pd
import numpy as np
import nltk
import string
import re
import spacy
nltk.download('stopwords')
from nltk.corpus import stopwords
nltk.download('punkt')

nltk.download('wordnet')
nltk.download('omw-1.4')

with open('model/twitter_predictions.pkl', 'rb') as f:
    model = pickle.load(f)

with open('model/vectorizer.pkl', 'rb') as f:
    vectorizer = pickle.load(f)


# Remove URLs
def remove_url(text):
    return re.sub(r"http\S+", "", text)

# Removing Punctuations
# I may leave blank space (ts) where i get bored, so dont thing task is buggy
def remove_punct(text):
    """new_text = []
    for t in text:
        if  not in string.punctuation:                      #this is first place. just to show it's intentional
            new_text.append()"""
    return re.sub(r'[^\w\s]', '', text)

#Tokenizer
##

encoder = spacy.load('en_core_web_sm')


def text_to_tokens(text_seqs):
 
  for strings in text_seqs:
    doc = encoder(strings)
    
    tokens = [token.text.lower() for token in doc]
    return tokens

#Removing Stop words
from nltk.corpus import stopwords

def remove_sw(text):
    new_text = []
    for t in text:
        if t not in stopwords.words('english'):
            new_text.append(t)
    return new_text
                                                            

#Lemmatizaion
from nltk.stem import WordNetLemmatizer

lemmatizer = WordNetLemmatizer()

def word_lemmatizer(text):
    new_text = []
    for t in text:
        lem_text = lemmatizer.lemmatize(t)
        new_text.append(lem_text)
    return new_text



app = Flask(__name__, template_folder='templates')             #add templates folder here

@app.route('/', methods=['GET','POST'])                                 #define methods in route
def main():
    
    if request.method == 'GET':
        return render_template('main.html')                                            #render main.html
    
    if request.method == 'POST':
        
        tweet = request.form['tweet']

        # make a DataFrame "df" and add tweet in it under column named "tweet"
        df = pd.DataFrame()
        k=[]
        k.append(tweet)
        df['tweet'] = k

        # 1. remove url
        df['tweet'] = df['tweet'].apply(lambda t: remove_url(t))
        # 2. remove punct
        df['tweet'] = df['tweet'].apply(lambda t: remove_punct(t))

        #3. tokenizer.tokenize(t.lower())
        df['tweet'] = df['tweet'].apply(lambda t: text_to_tokens(t))
        # 4. remove_sw()
        df['tweet'] = df['tweet'].apply(lambda t: remove_sw(t))
        # 5. word_lemmatizer()
        df['tweet'] = df['tweet'].apply(lambda t: word_lemmatizer(t))


        final_text = df['tweet']
        final_text.iloc[0] = ' '.join(final_text.iloc[0])
        final_text = vectorizer.transform(final_text)


        prediction = model.predict_proba(final_text)
        positive = round(prediction[0][0] * 100)
        negative = round(prediction[0][1] * 100)
        
        return render_template('main.html', original_input={'Review':tweet}, rating1=positive, rating2=negative)

if __name__ == '__main__':
    app.run()
