import requests
from bs4 import BeautifulSoup
import lxml
import scrapy
import pandas as pd

url="https://www.worldometers.info/coronavirus/coronavirus-cases/"
pageContent=requests.get(url)
tree = lxml.html.fromstring(pageContent.content)
for item in tree:
    recovered=item.xpath('//div[@class="number-table"]/text()')



url="https://www.worldometers.info/coronavirus/country/switzerland/"
pageContent=requests.get(url)
tree = lxml.html.fromstring(pageContent.content)
for item in tree:
    recoveredSwiss=item.xpath('//div[@class="maincounter-number"]/span/text()')

print("Recovered worldwide:",recovered[4])
print("Recovered in Switzerland:",recoveredSwiss[2])

RecoveredTable=pd.DataFrame({"Recovered in Switzerland:":[recoveredSwiss[2]], "Recovered worldwide:": [recovered[4]]})
RecoveredTable.to_csv(r"C:\Users\MrGaM\Desktop\RecoveredTable.csv", sep=";",index = False, header = True, encoding="utf-8")

