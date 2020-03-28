import csv
import requests
from bs4 import BeautifulSoup
import time
from datetime import datetime, timedelta

class Search():
    def __init__(self, ):
        '''Initialisierung des Crawlers. Nimmt Keyword als Input und setzt die URL auf die google news reslutate
        der letzen 24 Stunden'''

        self.url_base = 'https://www.google.com'
        self.url = 'https://www.google.com/search?biw=1920&bih=1001&tbs=qdr%3Ad&tbm=nws&sxsrf' \
                   '=ALeKk00UssXbx_Vx6uv0PlHTsb6V6cw6Qg%3A1585409233137&ei=0Wx_Xv-CCKGLmwXc4ZjgCw&q=corona+good+news' \
                   '&oq=corona+good+news&gs_l=psy-ab.3..0.14034.14511.0.15500.4.4.0.0.0.0.294.294.2-1.1.0....0...1c.1' \
                   '.64.psy-ab..3.1.294....0.i-7Rn7mew1k '

    def run(self):
        '''Crawlt alle gefunden Artikel und speichert diese als Objekte in der Klasse Articles() ab. Als Return-Wert
        wird eine Liste mit allen Objekten wiedergegeben.'''

        link_counter = 0
        results = []


        ###### html text holen
        r = requests.get(self.url)
        time.sleep(1)
        doc = BeautifulSoup(r.text, 'html.parser')


        ##### Loop durch alle gefundenen Artikel auf der Seite und abspeichern der Daten in Variablen
        for i in doc.select('.ZINbbc'):
            try:
                link = i.select_one('a').attrs['href'][7:]
                title = i.select_one('.BNeawe').text
                text = i.select('.BNeawe')[3]
                text = text.select('span')[-1].next_sibling
                timestamp = i.select('.BNeawe')[3].select_one('span').text

                article = Articles(title, text, link, timestamp)
                results.append(article)

            except:
                pass


        return results

class Articles():
    '''Speichern der gecrawlten Artikel'''
    def __init__(self, title, text, link, timestamp):
        self.title = title
        self.text = text
        self.link = link
        self.timestamp = timestamp

def change_timestamp(timestamp):
    '''Definieren der Publikationszeit. transformation von "vor 5 Stunden" zu genauem Zeitpunkt'''
    vor_number, unit = timestamp.split('\xa0')
    vor, number = vor_number.split(' ')
    time_now = datetime.now()
    if unit == 'Stunden' or unit == 'Stunde':
        timestamp = time_now - timedelta(hours=int(number))
    if unit == 'Minuten':
        timestamp = time_now - timedelta(minutes=int(number))

    return timestamp

def main():
    ### Initializing Vars
    date_today = datetime.now()
    output = []
    path = 'Google_Output/google.csv'

    #### Daten holen
    a = Search()
    results = a.run()

    ##### Output Liste erstellen und nach datum und zeit sortieren
    for article in results:
        output.append([article.title, article.link])
    output = sorted(output, key=lambda x: (x[1], x[0]), reverse=True)


    with open(path, 'w') as csvfile:
        spamwriter = csv.writer(csvfile, delimiter='|',
                                quotechar='"', quoting=csv.QUOTE_MINIMAL)

        spamwriter.writerow(['Titel', 'Link'])
        for row in output:
            spamwriter.writerow(row)
    print(output)

    return output
if __name__ == '__main__':
    main()
