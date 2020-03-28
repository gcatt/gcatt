from bs4 import BeautifulSoup
import requests
import time
import pandas as pd

data_NLZ = []

url = "https://www.bafu.admin.ch/bafu/de/home/themen/luft/zustand/daten/datenabfrage-nabel.html"
r = requests.get(url, verify = False)
doc = BeautifulSoup(r.text, 'html.parser')

for item in doc:
    print(doc)