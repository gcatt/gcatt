from bs4 import BeautifulSoup
import requests
import time
import pandas as pd

data_nlz_header = []
data_nlz_link = []

url = "https://www.luzernerzeitung.ch/suche?q=Corona"
r = requests.get(url, verify = False)
doc = BeautifulSoup(r.text, 'html.parser')

for item in doc.select("h2"):
    try:
        item = item.select_one(".teaser__title-name").text
        item = item.strip()
        data_nlz_header.append(item)
    except:
        pass

for item in doc.select(".teaser__link")[0::2]:
    try:
        item = item.get("href")
        element = "https://www.nzz.ch"
        #print(element+item)
        data_nlz_link.append(element+item)
    except:
        pass


df = pd.DataFrame()
df['Titel'] = data_nlz_header
df['Link'] = data_nlz_link

print(df)

df.to_csv("NLZ_headlines_Corona.csv", index=False, header=True)