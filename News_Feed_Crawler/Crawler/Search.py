import requests
from bs4 import BeautifulSoup
import time
from urllib.parse import urljoin
from .Articles import Articles


class Search():
    def __init__(self, keyword):
        '''Initialisierung des Crawlers. Nimmt Keyword als Input und setzt die URL auf die google news reslutate
        der letzen 24 Stunden'''

        self.keyword = keyword
        self.url_base = 'https://www.google.com'
        self.url = 'https://www.google.com/search?q={0}&tbm=nws&sxsrf=ALeKk01ydDBtwXL-qN3RhmsmlUZEoZDefA' \
                   ':1584897311765&source=lnt&tbs=qdr:d&sa=X&ved=0ahUKEwjLrJfKyq7oAhXR8aYKHVDtD-AQpwUIJA&biw=1280&bih' \
                   '=355&dpr=2'.format(self.keyword)

    def run(self):
        '''Crawlt alle gefunden Artikel und speichert diese als Objekte in der Klasse Articles() ab. Als Return-Wert
        wird eine Liste mit allen Objekten wiedergegeben.'''

        link_counter = 0
        results = []

        while self.url != '':
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

            ##### wenn Nächste Seite vorhanden, neue URL festlegen. Ansonsten Beenden des Programms
            try:
                next_button = doc.select(".nMymef a")[-1]
                if next_button.attrs['aria-label'] == 'Nächste Seite':
                    next_href = next_button.attrs["href"]
                    self.url = urljoin(self.url_base, next_href)
                else:
                    self.url = ''
            except:
                break

        return results




