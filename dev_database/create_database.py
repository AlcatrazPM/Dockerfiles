#!/usr/bin/python3.6

import json
import sys
from pymongo import *
from bson import *
from pprint import pprint

if __name__ == "__main__":
    port = int(sys.argv[1])

    with open("auth_entries.json") as entries:
        put = json.loads(entries.read())

        c = MongoClient(port=port)
        db = c['alcatraz']
        collection = db['users']
        collection.create_index("email", unique=True)

        for user in put:
            user["_id"] = ObjectId(user["_id"])

        try:
            collection.insert_many(put)
        except:
            pass

    with open("data_entries.json") as entries:
        put = json.loads(entries.read())

        c = MongoClient(port=port + 1)
        db = c['alcatraz']
        collection = db['entries']

        for user in put:
            user["userid"] = ObjectId(user["userid"])

            for entry in user["entries"]:
                entry["_id"] = ObjectId(entry["_id"])

            for entry in user["clear_entries"]:
                entry["_id"] = ObjectId(entry["_id"])

        try:
            collection.insert_many(put)
        except:
            pass


