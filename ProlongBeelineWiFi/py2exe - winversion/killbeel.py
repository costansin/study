import urllib2
import time

while 1:
	urllib2.urlopen('http://startwifi.beeline.ru/status?logout=1')
	x=urllib2.urlopen('http://cp.beelinewifi.ru/v/?lang=ru&url=aHR0cDovL2dvb2dsZS5ydS8%3D&id=1').read()
	urllib2.urlopen('http://cp.beelinewifi.ru/d/internal/?'+x[(x.find('url')+20):(x.find("WiFi'")+4)])
	time.sleep(800.0)
