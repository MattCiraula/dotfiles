import requests
import sys

try:
    r = requests.get(url = 'https://blockchain.info/ticker')
    price = r.json()['USD']['last']/ 1000
    print(f"{price:.1f}\n")
except:
    quit()
