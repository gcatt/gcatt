from datetime import datetime, timedelta


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







