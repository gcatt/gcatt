import csv
import requests
from bs4 import BeautifulSoup
import urllib.request
import time
import pandas as pd


r = requests.get("https://www.watson.ch/Spass/")

doc = BeautifulSoup(r.text, "html.parser")

data_watson_headers = []
data_watson_teaserlink = []
data_watson_storyimage = []

for item in doc.select("h2"):
    try:
        item = item.select_one("div").text
        item = item.strip()
        data_watson_headers.append(item)
    except:
        pass

for item in doc.select(".teaserlink"):
    try:
        item = item.get("href")
        element = "https://www.watson.ch"
        data_watson_teaserlink.append(element + item)
    except:
        pass

for item in doc.select(".storyimage"):
    try:
        item = item.get("style")
        item = item.strip("background-image:url")
        item = item.strip(" url")
        item = item.strip("(")
        item = item[:-2]
        if "watson.ch" in item:
            data_watson_storyimage.append("https:"+item)
        else:
            data_watson_storyimage.append("https://cdn2.watson.ch"+item)
    except:
        pass

time.sleep(2)
for item in data_watson_storyimage:
    urllib.request.urlretrieve(data_watson_storyimage[0],"Watson_Output/1_picture_watson.jpg")

df = pd.DataFrame()
df["Titel"] = data_watson_headers
df["Links"] = data_watson_teaserlink
#df["Bildlinks"] = data_watson_storyimage


df.to_csv("Watson_Output/Watson_Spass.csv", index=False, header=True, sep=";")


