term = 'Fall2012'
import re, requests, time
header = {}
headerfile = 'header.txt'
with open(headerfile, 'r') as header_file:
                for line in header_file.readlines():
                        colon = line.find(':')
                        header[line[:colon].strip()] = line[colon+1:].strip()
url = "https://wiki.school.yandex.ru/shad/videocollections/"+term
r = requests.request(method='GET', url=url, headers=header)
mainfile = r.text.replace('http://school-wiki.yandex.ru/Videocollections/'+term+'/','')
mainfile = mainfile.replace('http://school-wiki.yandex.ru/videocollections/'+term+'/','')
with open('_'+term, 'w', encoding='utf-8') as f:
    f.write(mainfile)
rlist = re.findall('href="http://school-wiki.yandex.ru/videocollections/'+term.lower()+'/.*?"', r.text) + re.findall('href="http://school-wiki.yandex.ru/Videocollections/'+term.lower()+'/.*?"', r.text) + re.findall('href="http://school-wiki.yandex.ru/videocollections/'+term+'/.*?"', r.text) + re.findall('href="http://school-wiki.yandex.ru/Videocollections/'+term+'/.*?"', r.text)
for link in rlist:
    time.sleep(0.1)
    name = link[link.rfind(term[1:])+len(term):-1]
    url = 'https://wiki.school.yandex.ru/shad/videocollections/'+term.lower()+'/'+name
    print(url)
    req = requests.request(method='GET', url=url, headers=header)
    with open(name, 'w', encoding='utf-8') as f:
        f.write(req.text)
#attempts to fix for direct links in Fall2012 are removed, parce que requests fucks out to download the whole video
#and it would be better if that zip-file would be small as shit, so fuck that stuff
#so you will probably never watch that. Congrats!
#et, yeah, Fall2013 was not permitted to achieve at all.
