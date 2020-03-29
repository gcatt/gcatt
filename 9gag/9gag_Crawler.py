from selenium import webdriver
from selenium.webdriver.common.by import By

from selenium.webdriver.common.keys import Keys
import time
from bs4 import BeautifulSoup
import pandas as pd

import xlrd

from selenium.webdriver.chrome.options import Options

chrome_options = Options()
chrome_options.add_argument("--incognito")
chrome_options.add_argument("--window-size=1920x1080")

driver = webdriver.Chrome(executable_path= r'/Users/giannipinelli/Downloads/chromedriver')

driver.get('https://9gag.com/coronavirus/fresh')

time.sleep(2)
# data_9gag_header = []
#data_9gag_link = []

print(len(driver.find_elements_by_tag_name('h1')))
get_header = driver.find_elements_by_tag_name('h1')
for header in get_header:
    print(header.get_attribute('textContent'))


# print(len(driver.find_elements_by_class_name('post-section')))
# get_link = driver.find_elements_by_class_name('post-section')
get_link = driver.find_elements_by_css_selector('article > header > a[href]')
for link in get_link:
    link = link.get_attribute('href')
    print(link)
time.sleep(4)
driver.close()



# select_csv = driver.find_element_by_id('csv')
# select_csv.click()
# #time.sleep(1)
#
# csv_download = driver.find_element_by_xpath('//*[@id="abfrage_form"]/p/button[1]')
# #time.sleep(1)
# csv_download.click()
# time.sleep(10)
#
# print('********************************************!!!DOWNLOAD COMPLETED!!!********************************************')
# driver.quit()
#
# #Import Datasets and Save
# df = pd.read_csv(r"C:\Users\ginoc\Downloads\ZUE.csv", sep='delimiter', header=None)
# df.drop([0,1,2,3,4], inplace = True)
# df.to_csv(r"C:\Users\ginoc\Git_Repos\gcatt\NABEL_Crawler\Outputs\ZUE.csv", index = False, header = False, encoding="utf-8")
# df_new = pd.read_csv(r"C:\Users\ginoc\Git_Repos\gcatt\NABEL_Crawler\Outputs\ZUE.csv", sep=';')
# df_new.to_csv(r"C:\Users\ginoc\Git_Repos\gcatt\NABEL_Crawler\Outputs\R_Ready\ZUE_clean.csv", index = False, header = True, encoding="utf-8")
