import urllib2
x=urllib2.urlopen('http://killer.flare.ws/krug1/%D0%9E%D1%81%D1%82%D1%80%D0%B8%D0%BA%D0%BE%D0%B2.html').read()
y=''
while (y!='\xd0\x9E\xd1\x81\xd1\x82\xd1\x80\xd0\xb8\xd0\xba\xd0\xbe\xd0\xb2'):
	z=x[(x.find('-3')+25):-1]
	t=y
	y=z[0:(z.find(' '))]
	#file = open((t.decode("utf-8"))+' kills '+(y.decode("utf-8"))+'.html', "w")
	#file.write(x)
	#file.close()
	imgurl='http://killer.flare.ws'+x[(x.find('src')+7):(x.find('jpg'))]+'jpg'
	img=urllib2.urlopen(imgurl).read()
	destination = imgurl.rsplit('/',1)[1]
	f = open(destination, "wb")
	f.write(img)
	f.close()
	x=urllib2.urlopen('http://killer.flare.ws/krug1/'+y+'.html').read()
