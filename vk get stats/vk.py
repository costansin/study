# -*- coding: UTF-8 -*-
import urllib2, random, time
for i in range(0,100000):
	id="http://www.vk.com/id"+str(random.randint(1,196198700))
	z=urllib2.urlopen(id).read()
	if (z.find("Страница удалена, либо еще не создана.")>-1):
		print (id+"#NO")
	elif (z.find("Страница была заблокирована по жалобам пользователей. Возможно, она была взломана.")>-1):
		print (id+"#BLOCKED")
	elif (z.find("Страница пользователя удалена. Информация недоступна.")>-1):
		print (id+"#DELETED")
	elif (z.find("Страница доступна только авторизованным пользователям.")>-1):
		print (id+"#NOSTAT")
	else:
		p=z.find("заходил")
		if (p>-1):
			print(id+"#"+str(z.count(".jpg"))+"#"+z[p:(p+50)])
		else:
			print(id+"#"+str(z.count(".jpg")))
