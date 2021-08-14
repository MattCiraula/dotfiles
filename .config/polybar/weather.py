import requests

try:
    r = requests.get(url = 'http://wttr.in/Pittsburgh?format=1')
    icon = r.text[:1]
    temp = r.text[3:].strip()
    print(icon + ' ' + temp)
except:
    print('err')
