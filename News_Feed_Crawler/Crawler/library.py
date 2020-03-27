from datetime import datetime, timedelta
from textblob_de import TextBlobDE as TextBlob

def change_timestamp(timestamp):
    '''Definieren der Publikationszeit. transformation von "vor 5 Stunden" zu genauem Zeitpunkt'''
    print(timestamp)
    vor_number, unit = timestamp.split('\xa0')
    vor, number = vor_number.split(' ')
    time_now = datetime.now()
    if unit == 'Stunden' or unit == 'Stunde':
        timestamp = time_now - timedelta(hours=int(number))
    if unit == 'Minuten':
        timestamp = time_now - timedelta(minutes=int(number))

    return timestamp



def sentiment_analysis(output):
    '''Analyse der gefundenen Teaser zur Stimmung und Subjektivität der Beiträge'''
    sentiment = 0
    subjectivity = 0
    for i in output:
        blob = TextBlob(i[3])
        sentiment += blob.sentiment.polarity / len(output)
        subjectivity += blob.sentiment.subjectivity / len(output)

    if sentiment < 0:
        sentiment = ['Stimmung: ', sentiment, 'Negativ']
    else:
        sentiment = ['Stimmung: ', sentiment, 'Positiv']


    if subjectivity < -0.5 or subjectivity > 0.5:
        subjectivity = ['Subjektivität: ', subjectivity, 'Subjektiv']
    else:
        subjectivity = ['Subjektivität: ', subjectivity, 'Faktenbasiert']

    return sentiment, subjectivity



