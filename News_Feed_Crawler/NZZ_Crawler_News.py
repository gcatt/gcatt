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
        #print(item)
        data_nzz_headers.append(item)
    except:
        pass

for item in doc.select(".teaser__link"):
    try:
        item = item.get("href")
        element = "https://www.nzz.ch"
        #print(element+item)
        data_nzz_links.append(element+item)
    except:
        pass


# print(data_nzz_headers)
# print(data_nzz_links)

zip_data = zip(data_nzz_headers, data_nzz_links)

dict_data = dict(zip_data)
print(dict_data)


#df = pd.DataFrame(data_nzz_links, data_nzz_headers)

print(len(data_nzz_headers))
print(len(data_nzz_links))


#index = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]


