
from datetime import datetime
from Crawler import Search, change_timestamp

'''Author: Fabian Pfister
Ziel: Das Ziel des Crawlers besteht darin, die Google Suche nach News aus den letzen 24h nach einem bestimmten Keyword
zu durchsuchen. Anschliessend werden alle angezeigten Einträge heruntergeladen und die Publikationszeit, das Datum, 
der Titel, der Teaser und der Link zum Artikel sortiert in einer CSV-Datei abgespeichert. Zudem wird im Anschluss 
eine kurze Sentiment-Analyse durchgeführt.

Test-Cases:
Keyword = 'Corona' am 20.03.2020
Keyword = 'Bitcoin+price' am 20.03.2020
Keyword = 'Boeing Stock' am 20.03.2020
Keyword = 'Dow Jones'
Keyword = 'Lucerne'

Programmiert auf MacOS
'''


def main():
    ### Initializing Vars
    date_today = datetime.now()
    output = []

    #### Daten holen
    a = Search()
    results = a.run()

    ##### Output Liste erstellen und nach datum und zeit sortieren
    for article in results:
        article_timestamp = change_timestamp(article.timestamp)
        date = article_timestamp.strftime("%d/%m/%Y")
        time = article_timestamp.strftime("%H:%M")
        output.append([time, date, article.title, article.text, article.link])
    output = sorted(output, key=lambda x: (x[1], x[0]), reverse=True)


    return output
if __name__ == '__main__':
    main()
