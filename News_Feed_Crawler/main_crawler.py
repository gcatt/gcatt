import csv
from datetime import datetime
from Crawler import Search, sentiment_analysis, change_timestamp

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


def main(keyword):
    ### Initializing Vars
    date_today = datetime.now()
    filename = keyword + '_' + date_today.strftime('%Y%m%d') + '.csv'
    folder = 'Output/'
    path = folder + filename
    output = []

    #### Daten holen
    a = Search(keyword)
    results = a.run()


    #### CSV öffnen
    with open(path, 'w', encoding='utf-8') as csvfile:
        rowwriter = csv.writer(csvfile, delimiter=';', quotechar='"', quoting=csv.QUOTE_MINIMAL)

        ##### Output Liste erstellen und nach datum und zeit sortieren
        for article in results:
            article_timestamp = change_timestamp(article.timestamp)
            date = article_timestamp.strftime("%d/%m/%Y")
            time = article_timestamp.strftime("%H:%M")
            output.append([time, date, article.title, article.text, article.link])
        output = sorted(output, key=lambda x: (x[1], x[0]), reverse=True)

        #### Sentiment-Analyse durchführen
        sentiment, subjectivity = sentiment_analysis(output)

        ##### csv-datei schreiben
        rowwriter.writerow(['Keyword: ', keyword])
        rowwriter.writerow([''])
        rowwriter.writerow(sentiment)
        rowwriter.writerow(subjectivity)
        for line in output:
            rowwriter.writerow(line)


if __name__ == '__main__':
    main(input('Keyword: '))
