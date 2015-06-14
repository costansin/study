# -*- coding: UTF-8 -*-
import commands, urllib
f=open("source","r")
g=open("result","w")
s=f.read()
k=0
d=s.find("[[")
t=s.find("]]")+2
while (d!=-1):
	g.write(s[k:d])
	r=s[d+2:t-1] #r=link|word] or link]
	r=urllib.quote(r[0:r.find("|")]) #r==link
	z=commands.getoutput('curl -d "" http://en.wikipedia.org/wiki/'+r)
	y=z.find("ru.wikipedia.org/wiki/")
	if (y==-1):
		g.write(s[d:t])
	else:
		g.write("[["+urllib.unquote(z[y+22:z.find('"',y)])+"|]]")
	k=t
	d=s.find("[[",d+1)
	t=s.find("]]",t+1)+2
f.close()
g.close()
