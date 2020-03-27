

class Articles():
    '''Speichern der gecrawlten Artikel'''
    def __init__(self, title, text, link, timestamp):
        self.title = title
        self.text = text
        self.link = link
        self.timestamp = timestamp

