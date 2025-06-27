#!/usr/bin/env python3

from os import getenv
from re import sub
from random import choice
from time import sleep
from html.parser import HTMLParser
from anki.collection import Collection

COLLECTION_PATH = f'{getenv('HOME')}/.local/share/Anki2/fekoneko/collection.anki2'
NOTE_TYPE_NAME = 'Japanese word note'
FIELD_INDEX = 0

class HTMLTextExtractor(HTMLParser):
    def __init__(self):
        super(HTMLTextExtractor, self).__init__()
        self.result = []

    def handle_data(self, data):
        self.result.append(data)

    def get_text(self):
        return ''.join(self.result)

def html_to_text(html):
    prepared_html = sub('<rt>[\\w\\W]*<\\/rt>', '', html)
    html_text_extractor = HTMLTextExtractor()
    html_text_extractor.feed(prepared_html)
    return html_text_extractor.get_text()

def get_field_by_note_id(note_id):
    note = collection.get_note(note_id)
    raw_field = note.fields[FIELD_INDEX]
    return html_to_text(raw_field)

retries = 0
while retries < 3:
    try:
        collection = Collection(COLLECTION_PATH)
        note_ids = collection.find_notes(f'"note:{NOTE_TYPE_NAME}"')
        random_note_id = choice(note_ids)
        print(get_field_by_note_id(random_note_id))
        exit(0)
    except:
        retries += 1
        sleep(retries ** 2)

exit(1)
