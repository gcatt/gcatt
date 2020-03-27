import requests
from bs4 import BeautifulSoup
import time
from .Articles import Articles


class Search():
    def __init__(self, ):
        '''Initialisierung des Crawlers. Nimmt Keyword als Input und setzt die URL auf die google news reslutate
        der letzen 24 Stunden'''

        self.url_base = 'https://www.google.com'
        self.url = 'https://www.google.com/search?q=corona&tbm=nws&sxsrf=ALeKk02ZFpt_qmZ516m_nuYTRHVUgXvk2A' \
                   ':1585335930840&source=lnt&tbs=qdr:h&sa=X&ved=0ahUKEwjtnYfIrLvoAhViMewKHWMcBzMQpwUIJA&biw=1280&bih' \
                   '=674&dpr=1 '

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




