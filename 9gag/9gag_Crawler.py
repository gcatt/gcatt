from selenium import webdriver
from selenium.webdriver.common.by import By

from selenium.webdriver.common.keys import Keys
import time
from bs4 import BeautifulSoup
import pandas as pd

#import xlrd

from selenium.webdriver.chrome.options import Options

chrome_options = Options()
chrome_options.add_argument("--incognito")
chrome_options.add_argument("--window-size=1920x1080")

driver = webdriver.Chrome(executable_path=r"C:\home\marius\PyCharm_Projects\webdrivers\chromedriver.exe")

driver.get('https://9gag.com/coronavirus/fresh')

time.sleep(2)
data_9gag_header = []
data_9gag_link = []

get_header = driver.find_elements_by_tag_name('h1')
for header in get_header[:-1]:
    header = header.get_attribute('textContent')
    data_9gag_header.append(header)


# print(len(driver.find_elements_by_class_name('post-section')))
# get_link = driver.find_elements_by_class_name('post-section')
get_link = driver.find_elements_by_css_selector('article > header > a[href]')

for link in get_link:
    link = link.get_attribute('href')
    data_9gag_link.append(link)

time.sleep(4)
driver.close()

print(data_9gag_link)
print(data_9gag_header)

print(len(data_9gag_link))
print(len(data_9gag_header))


df = pd.DataFrame()
df["Titel"] = data_9gag_header
df["Links"] = data_9gag_link


df.to_csv("9gag_Output/9gag_Output.csv", index=False, header=True, sep=";")