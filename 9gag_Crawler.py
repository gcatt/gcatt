### insert Crawler

from bs4 import BeautifulSoup
import pandas as pd

data = []
time.sleep(1)
url = "https://9gag.com/coronavirus"
r = requests.get(url, verify = False)
doc = BeautifulSoup(r.text, 'html.parser')



