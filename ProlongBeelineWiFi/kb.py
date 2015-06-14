import urllib2
import time

i=0
while 1:

    try:

        urllib2.urlopen('http://startwifi.beeline.ru/status?logout=1')

    except:

        print 0
        time.sleep(1.0)

    else:

        try:

            x=urllib2.urlopen('http://cp.beelinewifi.ru/v/?lang=ru&url=aHR0cDovL2dvb2dsZS5ydS8%3D&id=1').read()
            urllib2.urlopen('http://cp.beelinewifi.ru/d/internal/?'+x[(x.find('url')+20):(x.find("WiFi'")+4)])

        except:

            print 0

        i+=1
        print(i)
        for r in range(1,800):

            a=time.time()
            time.sleep(1.0)
            if (time.time()-a>2): break
