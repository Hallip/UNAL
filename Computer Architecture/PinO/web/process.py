import requests
from bs4 import BeautifulSoup as bs
import sys

documento = sys.argv[1]

def proceso(doc):
    f = open("c:\\t.txt","w")
    f.write(doc)

print(proceso(documento))
