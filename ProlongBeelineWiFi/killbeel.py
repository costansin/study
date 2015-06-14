import urllib2, time, datetime, commands

a=''
d=0
while 1:
	a=commands.getoutput('ping -s 0 -c 1 -w 1 8.8.8.8')
	if time.time()-d<850:
		time.sleep(1.0)
		continue
	if len(a)==31:
		print 0,
		time.sleep(1.0)
		continue
	try:
		urllib2.urlopen('http://startwifi.beeline.ru/status?logout=1')
		x=urllib2.urlopen('http://cp.beelinewifi.ru/v/?lang=ru&url=aHR0cDovL2dvb2dsZS5ydS8%3D&id=1').read()
		urllib2.urlopen('http://cp.beelinewifi.ru/d/internal/?'+x[(x.find('url')+20):(x.find("WiFi'")+4)])
	except:
		print "FAIL!",
	else:
		d=time.time()
		print "killbeeled at",
		print datetime.datetime.now()
