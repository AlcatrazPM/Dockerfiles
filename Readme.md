# Dockerfiles
Repository containing development and production containers

### dev_database
Container for a development database, populated with mock data, both encrypted and in clear text;\
To be used by developers in implementing client side cryptography\
Schema for the database is:
```json
{
    "_id": ObjectID(), //can be ignored
    "email": "john.doe@getnada.com", //unique index
    "credential": "password_hash",
    "date": "YYYY-MM-DD HH:mm:ss.______", //registration date
    "e_dek": "", //Encrypted Data Encryption Key; byte array
    "i_kek": "", //Information needed to compute the Key Encryption Key; byte array
    "secure_entries": [ //Encrypted entries. List of documents
        {
            "site": "", //byte array containing encrypted site
            "user": "", //byte array containing encrypted username
            "pass": "" //byte array containing encrypted password
        },
        .
        .
        .
    ],
    "clear_entries": [ //Clear entries. List of documents
        {
            "site": "www.github.com", //string containing clear text site
            "user": "dorel", //string containing clear text username
            "pass": "sapogroapa" //string containing clear text password
        },
        .
        .
        .
    ]
}
```
**Note**: to get the byte arrays from the strings encode as UTF-8 before handling