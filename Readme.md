# Dockerfiles
Repository containing development and production containers

### dev_database
Container for two development databases, populated with mock data, both encrypted and in clear text;\
To be used by developers in implementing client side cryptography\
Schema for the authentication database is:
```json5
    {
        "_id": ObjectID(), // UUID
        "email": "vladdnastase@gmail.com", // unique
        "name": "Vlad Nastase",
        "date": "2020-04-14 12:32:40.884680",
        "session_timer": 15, //JWT Token timer
        "credential": "3d57e5f0db1443e87fad25c66752b895dcaa250c019bf2e0e9eb9365b59f1443321d73ae53215759c34db97f543efa0dca67fe0ace3adb342644eb1f1fb869a6", // hashed password
        "e_dek": "EtDimlhuRFU1mWEq0U0o2A/4tlDg45RwDYHFx9heRKOH9KS6MU2O34hdhF/zjMas", // byte array
        "i_kek": "mvgUTG0W7lvH/44SLC70hfD07127+00yIFgB66UBNNo=" // byte array
    }
```

Schema for the data database is:
```json5
    {
        "userid": ObjectID(), // to be used to identify the user
        "entries": [
            {
                "_id": ObjectID(), // to be used to identify when modifying
                "site": "j7sHxmM30gT1YtYdY2vvig2P41p8FaJUfNAOHK457+ogccqehnb5/5L3T99Y43ic", //byte array
                "username": "/jEwNp415/6CqrLlQPUbnanFeWEl7LfUCGlF5aFB6Y4=", //byte array
                "password": "7Zvr+zwR76Nu+BMkddvHYY0AVbE8v8OKjniBun9BJq4=", //byte array
                "favorite": true
            },
            .
            .
            .
        ]
        "clear_entries": [
            {
                "_id": ObjectID(),
                "site": "ciment.com",
                "username": "dorel",
                "password": "sapogroapa",
                "favorite": true
            },
            .
            .
            .
        ]
    }
```
**Note**: to get the byte arrays from the strings encode as UTF-8 before handling