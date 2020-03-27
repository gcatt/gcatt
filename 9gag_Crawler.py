### insert Crawler

from bs4 import BeautifulSoup
import requests
import time
import pandas as pd

data = []

url = "https://9gag.com/coronavirus"
r = requests.get(url, verify = False)
doc = BeautifulSoup(r.text, 'html.parser')

for item in doc:
    print(doc)









