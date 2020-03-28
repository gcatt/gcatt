from bs4 import BeautifulSoup
import requests
import time
import pandas as pd

data_NLZ = []

url = "https://www.luzernerzeitung.ch/suche?q=Corona"
r = requests.get(url, verify = False)
doc = BeautifulSoup(r.text, 'html.parser')

for item in doc:
    print(doc)