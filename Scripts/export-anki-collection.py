#!/usr/bin/env python3

from os import getenv
from sys import argv
from time import sleep
from anki.collection import Collection
from anki.exporting import AnkiCollectionPackageExporter

if len(argv) != 2:
    print('Usage: %s <output file>' % argv[0])
    exit(1)

COLLECTION_PATH = f'{getenv('HOME')}/.local/share/Anki2/fekoneko/collection.anki2'
destination_path = argv[1]

retries = 0
while True:
    try:
        collection = Collection(COLLECTION_PATH)
        exporter = AnkiCollectionPackageExporter(collection)
        exporter.exportInto(destination_path)
        print('Exported to %s' % destination_path)
        break
    except Exception as e:
        if retries >= 3:
            exit(e)
        retries += 1
        sleep(retries ** 2)
