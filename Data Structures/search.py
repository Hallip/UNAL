from elasticsearch import Elasticsearch
import datetime
import hashlib
import time
import Queue

Tipo3 = Queue.Queue()
Tipo2 = Queue.Queue()
Tipo1 = Queue.Queue()


es = Elasticsearch(
    ["elastic:FARpud68@186.29.105.44:9200"],
    scheme="http",
    request_timeout=300,
    ignore_cert=False
    )

cons= {
  "query": {
    "bool": {
      "must": [
        {
          "match": {
            "wasSent": False
          }
        },
        {
          "match": {
            "Piority": 3
          }
        }
      ]
    }
  }, "sort": [
    {
      "shippingDate": {
        "order": "asc"
      }
    }
  ]
}
res = es.search(index="orders", body=cons)
print("Got %d Hits:" % res['hits']['total']['value'])
for hit in res['hits']['hits']:
    Tipo3.put(hit)

cons= {
  "query": {
    "bool": {
      "must": [
        {
          "match": {
            "wasSent": False
          }
        },
        {
          "match": {
            "Piority": 2
          }
        }
      ]
    }
  }, "sort": [
    {
      "shippingDate": {
        "order": "asc"
      }
    }
  ]
}
res = es.search(index="orders", body=cons)
print("Got %d Hits:" % res['hits']['total']['value'])
for hit in res['hits']['hits']:
    Tipo2.put(hit)

cons= {
  "query": {
    "bool": {
      "must": [
        {
          "match": {
            "wasSent": False
          }
        },
        {
          "match": {
            "Piority": 1
          }
        }
      ]
    }
  }, "sort": [
    {
      "shippingDate": {
        "order": "asc"
      }
    }
  ]
}

res = es.search(index="orders", body=cons)
print("Got %d Hits:" % res['hits']['total']['value'])
for hit in res['hits']['hits']:
    Tipo1.put(hit)

t1 = 0
t2 = 0
t3 = 0

for x in range(0,20):
    if not(Tipo3.empty()):
        Tipo3.get()
        t3 += 1
    elif not(Tipo2.empty()):
        Tipo2.get()
        t2 += 1
    elif not(Tipo1.empty()):
        Tipo1.get()
        t1 += 1

regTime = datetime.datetime.now().strftime("%Y-%m-%dT%H:%M:%S%z")

data = {
      "Client": "Benito Perez",
      "ID": "8382374859",
      "package": (t1+t2+t3),
      "Piority1": t1,
      "Piority2": t2,
      "Piority3": t3,
      "shippingDate": regTime,
}

es.index(index='delivery', doc_type='people', body=data)
