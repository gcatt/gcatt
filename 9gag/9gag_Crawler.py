from selenium import webdriver
import time
from bs4 import BeautifulSoup
import pandas as pd
import urllib.request

import xlrd

from selenium.webdriver.chrome.options import Options
chrome_options = Options()
chrome_options.add_argument("--incognito")
chrome_options.add_argument("--window-size=1920x1080")

driver = webdriver.Chrome(executable_path=r"/Users/giannipinelli/git_repos/gcatt/chromedriver")

driver.get('https://9gag.com/coronavirus/fresh')

time.sleep(2)
data_9gag_header = []
data_9gag_link = []
data_9gag_image = []

get_header = driver.find_elements_by_tag_name('h1')
for header in get_header[:-1]:
    header = header.get_attribute('textContent')
    data_9gag_header.append(header)

get_image = driver.find_elements_by_css_selector('article > header > a[href]')
for image in get_image[:3]:
    image = image.get_attribute('href')
    image = image[21:]
    image = "https://img-9gag-fun.9cache.com/photo/" + image + "_460s.jpg"
    data_9gag_image.append(image)

get_link = driver.find_elements_by_css_selector('article > header > a[href]')
for link in get_link[:3]:
    link = link.get_attribute('href')
    data_9gag_link.append(link)


time.sleep(2)
for item in data_9gag_image:
    urllib.request.urlretrieve(data_9gag_image[0],"9gag_Output/1_9gag_image.jpg")
    urllib.request.urlretrieve(data_9gag_image[1],"9gag_Output/2_9gag_image.jpg")
    urllib.request.urlretrieve(data_9gag_image[2],"9gag_Output/3_9gag_image.jpg")






time.sleep(4)
driver.close()

print(data_9gag_link)
print(data_9gag_header)
print(data_9gag_image)


print(len(data_9gag_link))
print(len(data_9gag_header))
print(len(data_9gag_image))


df = pd.DataFrame()
df["Titel"] = data_9gag_header
df["Links"] = data_9gag_link
df["Image"] = data_9gag_image


df.to_csv("9gag_Output/9gag_Output.csv", index=False, header=True, sep=";")