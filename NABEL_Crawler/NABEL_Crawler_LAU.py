from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import time
from bs4 import BeautifulSoup
import pandas as pd

import xlrd

from selenium.webdriver.chrome.options import Options
chrome_options = Options()
chrome_options.add_argument("--incognito")
chrome_options.add_argument("--window-size=1920x1080")

driver = webdriver.Chrome(executable_path = r'C:\Users\ginoc\Downloads\chromedriver_win32\chromedriver.exe')

driver.get('https://www.bafu.admin.ch/bafu/de/home/themen/luft/zustand/daten/datenabfrage-nabel.html')

time.sleep(1)

select_nach_stationen_field = driver.find_element_by_partial_link_text('Abfrage nach Station')
select_nach_stationen_field.click()
time.sleep(1)

# Choose Station
select_station = driver.find_element_by_xpath('//*[@id="station_select_chosen"]')
select_station.click()
type_station = driver.find_element_by_xpath('//*[@id="station_select_chosen"]/div/div/input')
type_station.send_keys('Lausanne')    ### Change per Station ###
type_station.send_keys(Keys.RETURN)
time.sleep(1)

select_select_all = driver.find_element_by_xpath('//*[@id="station"]/p[1]/button[1]')
select_select_all.click()
time.sleep(1)

select_data_type = driver.find_element_by_xpath('//*[@id="tagesmittelwerte"]')
select_data_type.click()
time.sleep(1)

select_timespan_type = driver.find_element_by_id('frei')
select_timespan_type.click()
time.sleep(1)

select_timespan_from = driver.find_element_by_id('von')
select_timespan_from.clear()
select_timespan_from.send_keys('2000-01-01')
time.sleep(1)

select_timespan_to = driver.find_element_by_xpath('//*[@id="abfrage_form"]/fieldset[2]/div[2]/div[2]/div/button')
select_timespan_to.click()
time.sleep(1)

select_csv = driver.find_element_by_id('csv')
select_csv.click()
time.sleep(1)

csv_download = driver.find_element_by_xpath('//*[@id="abfrage_form"]/p/button[1]')
time.sleep(1)
csv_download.click()
time.sleep(15)

print('********************************************!!!DOWNLOAD COMPLETED!!!********************************************')
driver.quit()

#Import Datasets and Save
df = pd.read_csv(r"C:\Users\ginoc\Downloads\LAU.csv", sep='delimiter', header=None)
df.drop([0,1,2,3,4], inplace = True)
df.to_csv('LAU.csv', index = False, header = False, encoding="utf-8")
df_new = pd.read_csv('LAU.csv', sep=';')
df_new.to_csv('LAU_clean.csv', index = False, header = True, encoding="utf-8")