#!/usr/bin/python3.6

import pymongo
import json
import sys
from pprint import pprint

if __name__ == "__main__":
    port = int(sys.argv[1])

    with open("entries.in") as entries:
        put = json.loads(entries.read())

        c = pymongo.MongoClient(port=port)
        db = c['alcatraz']
        collection = db['users']
        collection.create_index("email", unique=True)

        try:
            collection.insert_many(put)
        except:
            pass


