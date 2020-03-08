from elasticsearch import Elasticsearch
import datetime
import hashlib
import time

for x in range (0,17):
    regTime = datetime.datetime.now().strftime("%Y-%m-%dT%H:%M:%S%z")

    if x < 5:
        y = 3
    elif x < 8:
        y = 2
    else:
        y = 1
    data = {
          "Client": "Juan Montoya",
          "Address": "Crr 72 Bis No 53-48",
          "Piority": y,
          "weight": x,
          "unit": "kg",
          "location": {
            "lat": 4.6775397,
            "lon": -74.1122391
          },
          "shippingDate": regTime,
          "wasSent": False,
    }

    es = Elasticsearch(
        ["elastic:FARpud68@186.29.105.44:9200"],
        scheme="http",
        request_timeout=300,
        ignore_cert=False
        )

    result = (data["shippingDate"])

    es.index(index='orders', doc_type='people', body=data, id=result)
    time.sleep(10)
