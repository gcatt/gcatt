### insert Crawler

from bs4 import BeautifulSoup
import requests
import time
import pandas as pd

data_nzz_headers = []
data_nzz_links = []

url = "https://www.nzz.ch/suche?q=corona"
r = requests.get(url, verify = False)
doc = BeautifulSoup(r.text, 'html.parser')

for item in doc.select("h2"):
    try:
        item = item.select_one(".teaser__title-name").text
        item = item.strip()
        data_nzz_headers.append(item)
    except:
        pass

for item in doc.select(".teaser__link")[0::2]:
    try:
        item = item.get("href")
        element = "https://www.nzz.ch"
        data_nzz_links.append(element+item)
    except:
        pass

df = pd.DataFrame()
df["Titel"] = data_nzz_headers
df["Link"] = data_nzz_links


print(df)

df.to_csv("NZZ_Output/NZZ_headlines_Corona.csv", index=False, header=True)

