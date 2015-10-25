# -*- coding: utf-8
import requests
import time
import datetime
import ast
import os
import re
import random
import urllib.request
from tkinter import *
#https://oauth.vk.com/authorize?client_id=5015702&scope=notify,friends,photos,audio,video,docs,notes,pages,status,offers,questions,wall,groups,messages,notifications,stats,ads,offline&redirect_uri=https://oauth.vk.com/blank.html&display=page&response_type=token
sleepTime = 1
waitTime = 53
mnemofile = 'mnemo.txt'
ignorefile = 'ignore.txt'
looping = False
photosizes = [2560, 1280, 807, 604, 512, 352, 256, 130, 128, 100, 75, 64]
token_file = open('token_file.txt', 'r') 
token_list = [token[:-1] for token in token_file.readlines() if token[0]!='#'] #start line with # to make it comment
token_file.close()
printm=''
width=0
height=0
mnemonics={}
ignore=[]
idscash=[]
lastNviewcash=[]
prob=[]
smileys = os.listdir('smileys')
simple_smileys={128522: ':-)', 128515: ':-D', 128521: ';-)', 128518: 'xD', 128540: ';-P', 128523: ':-p', 128525: '8-)', 128526: 'B-)', 128530: ':-(', 128527: ';-]', 128532: '3(', 128546: ":'(", 128557: ':_(', 128553: ':((', 128552: ':o', 128528: ':|',128524: '3-)', 128519: 'O:)', 128560: ';o', 128562: '8o', 128563: '8|', 128567: ':X', 10084: '<3', 128538: ':-*', 128544: '>(', 128545: '>((', 9786: ':-]', 128520: '}:)', 128077: ':like:', 128078: ':dislike:', 9757: ':up:', 9996: ':v:', 128076: ':ok:'}
rev_simple_smileys={':-)': 'D83DDE0A.png', ':-D': 'D83DDE03.png', ';-)': 'D83DDE09.png', 'xD': 'D83DDE06.png', ';-P': 'D83DDE1C.png', ':-p': 'D83DDE0B.png', '8-)': 'D83DDE0D.png', 'B-)': 'D83DDE0E.png', ':-(': 'D83DDE12.png', ';-]': 'D83DDE0F.png', '3(': 'D83DDE14.png', ":'(": 'D83DDE22.png', ':_(': 'D83DDE2D.png', ':((': 'D83DDE29.png', ':o': 'D83DDE28.png', ':|': 'D83DDE10.png', '3-)': 'D83DDE0C.png', 'O:)': 'D83DDE07.png', ';o': 'D83DDE30.png', '8o': 'D83DDE32.png', '8|': 'D83DDE33.png', ':X': 'D83DDE37.png', '<3': '2764.png', ':-*': 'D83DDE1A.png', '>(': 'D83DDE20.png', '>((': 'D83DDE21.png', ':-]': '263A.png', '}:)': 'D83DDE08.png', ':like:': 'D83DDC4D.png', ':dislike:': 'D83DDC4E.png', ':up:': '261D.png', ':v:': '270C.png', ':ok:': 'D83DDC4C.png'}
def call_api(method, params):
        #print(method, params)
        #time.sleep(sleepTime)
        print('.', end='') if not looping else print(',', end='')
        params["access_token"] = token_list[token_num]
        params["v"] = "5.35"
        url = "https://api.vk.com/method/" + method
        er = False
        E = False
        while True:
                try:
                        try:
                                result = requests.post(url, data=params).json()
                                E = False
                        except KeyboardInterrupt:
                                return()
                        if 'error' not in result:
                                return result["response"] if "response" in result else result
                                er = False
                        else:
                                if not er:
                                        err = result.get('error')
                                        msg = err.get('error_msg')
                                        print(msg)
                                        if msg.find('Validation')>=0:
                                                print(err.get('redirect_uri'))
                                        er = True
                                time.sleep(sleepTime)
                except:
                        if not E:
                                print('E', end='')
                                E = True
                        time.sleep(sleepTime)
for token_num in range(len(token_list)):
        idscash = idscash + [call_api('users.get', {})[0]]
        lastNviewcash = lastNviewcash + [call_api('notifications.get',{'count': '0'}).get('last_viewed')]
        prob=prob+[1]
print()
token_num = 0
def cin():
        try:
                s = input()
                return(s)
        except KeyboardInterrupt:
                exit
def read_mnemonics():
        result = {}
        with open(mnemofile) as f:
                for line in f:
                        key, value = line.split()
                        result[key] = value
        f.close()
        return result
def rus_to_lat(wrong):
        right = ''
        for wrong_letter in wrong:
                right_letter = 'qwertyuiop[]asdfghjkl;\'zxcvbnm,._'['йцукенгшщзхъфывапролджэячсмитьбю_'.find(wrong_letter)]
                right = right + right_letter
        return right
def mn(idstring):
        if idstring in mnemonics: return ['user_id', mnemonics[idstring]]
        elif idstring.isdigit(): return ['user_id', idstring]
        elif not re.match("^[' 'A-Za-z0-9_-]*$", idstring): return mn(rus_to_lat(idstring.lower()))
        else: return ['domain', idstring]
def read_ignore():
        result = []
        with open(ignorefile) as f:
                for line in f:
                        line = line.strip()
                        result.append(mn(line)[1])
        f.close()
        return result
def smiley_hex(c, sh):
        return hex(c+sh).upper()[2:]+'.png'
def charfilter(s):
        r=''
        for c in s:
                ch = ord(c)
                if ch<8617: r+=c
                elif ch in simple_smileys: r+=simple_smileys[ch]
                else: r+='&#'+str(ch)+';'
        return r
def prints(s):
        global printm
        printm+=s
def printsn(s): #print(s)
        prints(s+'\n')
def print_attachments(attache):
        if attache is not None:
                for attached in attache:
                        atype = attached.get('type')
                        cropf = atype.find('_')
                        if cropf>=0: croptype = atype[:cropf]
                        else: croptype = atype
                        stuff = attached.get(atype)
                        owner = stuff.get('owner_id')
                        if owner is None: owner = stuff.get('to_id')
                        cropadress = str(owner)+'_'+str(stuff.get('id'))
                        adress = croptype + cropadress
                        if (atype=='photo')or(atype=='sticker'):
                                for size in photosizes:
                                        link=stuff.get('photo_'+str(size))
                                        if link is not None:
                                                printsn(link)
                                                break
                        elif atype=='video':
                                req = str(cropadress)+'_'+str(stuff.get('access_key'))
                                printsn(call_api('video.get', {'videos': req}).get('items')[0].get('player'))
                        else:
                                url = stuff.get('url')
                                if url is not None:
                                        urlf = url.find('?extra')        
                                        if (urlf!=-1):
                                                printsn(stuff.get('artist')+' - '+stuff.get('title'))
                                                printsn(url[:urlf]+' ')
                                        else: printsn(url+' ')
                        printsn(adress+' ')
def print_message(message, k):
        body = message.get('body')
        if body!='':
                if message.get('emoji'): printsn(charfilter(body))
                else: printsn(body)
        print_attachments(message.get('attachments'))
        fwd = message.get('fwd_messages')
        tab = ''
        for i in range(0,k): tab = tab + '     '
        if fwd is not None:
                printsn(tab+'[fwd_messages:]')
                for fwdm in fwd:
                        for i in range(0,k+1): prints('     ')
                        prints('['+str(fwdm.get('user_id'))+']')
                        print_message(fwdm, k+1)                     
def getHistory(count, offset, print_numbers, uid):
        if not isinstance(uid, int): uid = call_api('users.get', {'user_ids': uid})[0].get('id')
        unread = False
        try:
                history = call_api('messages.getHistory', {'count': count, 'offset': offset, 'user_id': uid}).get('items')
        except:
                return(0)
        message={'date': 0}
        inoutchar = ''
        if history is not None:
                for message in reversed(history):
                        if not unread and (message.get('read_state')==0):
                                unread = True
                                printsn('_._')
                        if (message.get('out')==0):
                                if (inoutchar!='>'):
                                        inoutchar='>'
                                        printsn(inoutchar)
                        else:
                                if (inoutchar!='<'):
                                        inoutchar='<'
                                        printsn(inoutchar)
                        if print_numbers:
                                printsn('['+str(message.get('id'))+']')
                        print_message(message, 0)
                        if print_numbers:
                                printsn('['+str(datetime.datetime.fromtimestamp(message.get('date')))+']')
                if not print_numbers: printsn('['+str(datetime.datetime.fromtimestamp(message.get('date')))+']')
def messaging():
        global token_num, printm, waitTime
        print(idscash[token_num].get('first_name'), idscash[token_num].get('last_name')+':')
        while True:
                m = ''
                s = ''
                userid = None
                wall_flag = False
                while (s=='')or((s[-1]!='#')and(s[-1]!='№')):
                        s = cin()
                        if s is None: return(0)
                        if (m==''):
                                if (s==''): return(0)
                                attachments = None
                                forward_messages = None
                                subject = None
                                if s.isdigit():
                                        ints = int(s)
                                        if ints<10:
                                                token_num = ints
                                                print(idscash[token_num].get('first_name'), idscash[token_num].get('last_name')+':')
                                        else: waitTime = ints
                                        continue
                                if (len(s)==1):
                                        if (s=="'")or(s=='э'):
                                                return(-1)
                                        if s=='+':
                                                #print('[forward messages ids (e.g. 1232,1233,1237) | attachments (e.g. photo123123_123223,audio-34232_23123)]')
                                                s = cin()
                                                if s is None: return(0)
                                                if s[0].isdigit(): forward_messages = s
                                                elif (s[0].lower()=='s')or(s[0].lower()=='ы'): subject = s[2:] #s_The subject of my message
                                                else: attachments = s
                                                s=cin() #no continue for message
                                                if s is None: return(0)
                                        if (s.lower()=='n')or(s.lower()=='т'):
                                                call_api('notifications.markAsViewed', {})
                                                lastNviewcash[token_num] = int(time.time())
                                                print('Done')
                                                continue
                                        elif (s.lower()=='p')or(s.lower()=='з'):
                                                print('Set probabilities of token_nums while checkbox')
                                                global prob
                                                prob = [float(input()) for i in range(len(token_list))]
                                                continue
                                        elif (s.lower()=='e')or(s.lower()=='у'):                #rasp.yandex.ru/search/suburban/?
                                                x = urllib.request.urlopen('https://rasp.yandex.ru/informers/search/?fromId=s9600721&amp;toId=s9601728&amp;').read().decode('utf-8')
                                                #x = requests.get('https://rasp.yandex.ru/informers/search/?fromId=s9600721&amp;toId=s9601728&amp;').text
                                                print(x[x.find('<title>')+7:x.find('</title>')])
                                                l2 = [x[m.start()-5:m.start()] for m in re.finditer(':00&', x)]
                                                l3 = list(map(lambda x, y: x+' - '+y, l2[::2], l2[1::2]))
                                                for r in l3: print(r)
                                                continue
                                        elif (s.lower()=='w')or(s.lower()=='ц'):
                                                s = cin()
                                                if s is None: return(0)
                                                wall_owner = mn(s)
                                                if wall_owner[0]=='user_id': wall_owner[0]='owner_id'
                                                print('Now you have to input the number of posts')
                                                s = cin()
                                                if s is None: return(0)
                                                try: postsN = int(s)
                                                except: return(0)
                                                wall = call_api('wall.get', {wall_owner[0]: wall_owner[1], 'count': postsN}).get('items')
                                                printm='\n'
                                                for post in wall:
                                                        printsn(charfilter(post.get('text')))
                                                        reposted = post.get('copy_history')
                                                        if reposted:
                                                                for reposts in reposted:
                                                                        printsn('\t[REPOSTED]')
                                                                        printsn('\t'+charfilter(reposts.get('text')))
                                                        printsn('____')
                                                print(printm)
                                                printm=''
                                                continue
                                        elif (s==':')or(s==';')or(s.lower()=='ж'):
                                                s = cin()
                                                if s is None: return(0)
                                                if s.find('http')!=0: s='http://'+s
                                                x = requests.get(s)
                                                print(x.text)
                                                continue
                                        elif (s.lower()=='s')or(s.lower()=='ы'):
                                                s = cin()
                                                if s is None: return(0)
                                                if s in rev_simple_smileys:
                                                        os.system('smileys\\'+rev_simple_smileys[s])
                                                        continue
                                                try: c = int(s)
                                                except:
                                                        while (s!='')and not (s[0].isdigit()): s=s[1:]
                                                        while (s!='')and not (s[-1].isdigit()): s=s[:-1]
                                                        try: c=int(s)
                                                        except: return(0)
                                                h72 = smiley_hex(c,3627804672)
                                                h60 = smiley_hex(c,3627740160)
                                                h0 = smiley_hex(c,0)
                                                if h72 in smileys: os.system('smileys\\'+h72)
                                                elif h60 in smileys: os.system('smileys\\'+h60)
                                                elif h0 in smileys: os.system('smileys\\'+h0)
                                                continue
                                        elif (s.lower()=='t')or(s.lower()=='е'):
                                                s = cin()
                                                if s is None: return(0)
                                                lit = ast.literal_eval(s)
                                                g = call_api(*lit)
                                                print(charfilter(str(g)))
                                                continue
                                        elif (s.lower()=='l')or(s.lower()=='д'):
                                                print('type owner_id\ntypes:\npost comment photo audio video note photo_comment video_comment topic_comment sitepage')
                                                s = cin()
                                                if s is None: return(0)
                                                lobjecttype, what = s.split()
                                                lowner, lid = what.split('_') #ifLiked - likes.delete
                                                print(call_api('likes.add', {'type': lobjecttype, 'owner_id': lowner, 'item_id': lid}))
                                                continue
                                        elif (s.lower()=='v')or(s.lower()=='м'):
                                                s = cin()
                                                if s is None: return(0)
                                                v = call_api('video.search', {'q':s, 'sort': '10', 'hd': '1', 'filters': 'long', 'adult': '1'})
                                                for vid in v.get('items'):
                                                        print(vid.get('title'))
                                                        print(vid.get('player'))
                                                continue
                                        elif (s.lower()=='x')or(s.lower()=='ч'):
                                                s = cin() #get the video from a "player"-link
                                                if s is None: return(0)
                                                x = requests.get(s).text
                                                if x.find('Видеозапись была помечена модераторами сайта как «Материал для взрослых». Такие видеозаписи запрещено встраивать на внешние сайты.')>=0:
                                                        print('Damn')
                                                        continue
                                                xd = x.find('video_max_hd = ')
                                                try: video_max_hd = int(x[xd+16:xd+17])
                                                except: video_max_hd = 0
                                                hds = ['240', '360', '480', '720', '1080']
                                                video_url = x[x.find('url'+hds[video_max_hd])+7:]
                                                video_url = video_url[:video_url.find('&amp;')]
                                                print(video_url)
                                                continue
                                        elif (s.lower()=='a')or(s.lower()=='ф'):
                                                if attachments is not None:
                                                        add_owner_id, add_audio_id = attachments.split('_')
                                                        print(call_api('audio.add', {'owner_id': int(add_owner_id[5:]), 'audio_id': int(add_audio_id)}))
                                                        continue
                                                big_audio_flag = (s=='A')or(s=='Ф')
                                                print('[M3U]\n[wget]\n[Number]\n[Author]\n[Title]') if big_audio_flag else print('[M3U]\n[wget]\n[Number]\n[Search string]')
                                                m3u_flag=False
                                                wget_flag=False
                                                s = cin()
                                                if s is None: return(0)
                                                if (s.lower()=='m3u')or(s.lower()=='ь3г'):
                                                        m3u_flag=True
                                                        s = cin()
                                                        if s is None: return(0)
                                                if (s.lower()=='wget')or(s.lower()=='цпуе'):
                                                        wget_flag=True
                                                        s = cin()
                                                        if s is None: return(0)
                                                if s.isdigit():
                                                        au_count = int(s)
                                                        s = cin()
                                                        if s is None: return(0)
                                                else:
                                                        if m3u_flag: au_count = 1000
                                                        else: au_count = 10
                                                if big_audio_flag:
                                                        autitle = cin()
                                                        if autitle is None: return(0)
                                                        autitle = autitle.strip()
                                                audio_list = []
                                                AU_OFFSET_CONSTANT = 300
                                                au_offset = 0
                                                while au_count>0:
                                                        if s.strip()=='':
                                                                audio_list = audio_list + call_api('audio.get', {'owner_id': idscash[token_num].get('id'), 'count': min(au_count, AU_OFFSET_CONSTANT), 'offset': au_offset}).get('items')
                                                        else:
                                                                if big_audio_flag:
                                                                        if autitle=='':
                                                                                audio_list = audio_list + call_api('audio.search', {'q': s, 'count': min(au_count, AU_OFFSET_CONSTANT), 'offset': au_offset, 'performer_only': 1}).get('items')
                                                                        else:
                                                                                audio_list = audio_list + call_api('audio.search', {'q': s+' '+autitle, 'count': min(au_count, AU_OFFSET_CONSTANT), 'offset': au_offset}).get('items')
                                                                else:
                                                                        audio_list = audio_list + call_api('audio.search', {'q': s, 'count': min(au_count, AU_OFFSET_CONSTANT), 'offset': au_offset}).get('items')
                                                        au_offset = au_offset + AU_OFFSET_CONSTANT
                                                        au_count = au_count - AU_OFFSET_CONSTANT
                                                        print(len(audio_list), end='')
                                                print()
                                                def au_adress(audio):
                                                        return 'audio' + str(audio.get('owner_id')) + '_' + str(audio.get('id'))
                                                def au(audio):
                                                        return audio.get('artist') + ' - ' + audio.get('title')
                                                if wget_flag:
                                                        wget_filename = 'auwget.bat'
                                                        wget_file = open(wget_filename, 'w', encoding='utf-8')
                                                        wget_file.write('mkdir '+s+'\n')
                                                        for audio in audio_list:
                                                                url = audio.get('url')
                                                                aufname = re.sub('"(.*?)"', r'«\1»', au(audio)) # "" to «»
                                                                aufname = re.sub(r'[\\/:*?<>|+\n]','-',aufname) # replace bad characters with -
                                                                if url!='': wget_file.write('wget '+url[:url.find('?extra')]+' -O "' + s+'\\'+aufname + '.mp3"\n')
                                                        wget_file.write('Del %0 /q\n')
                                                        wget_file.close()
                                                        os.system(wget_filename)
                                                if m3u_flag:
                                                        m3u_file = open('m3u.m3u', 'w', encoding='utf-8')
                                                        m3u_file.write('#EXTM3U\n')
                                                        for audio in audio_list:
                                                                url = audio.get('url')                
                                                                m3u_file.write('#EXTINF:'+str(audio.get('duration'))+', '+au(audio)+'\n#'+au_adress(audio)+'\n'+url[:url.find('?extra')]+'\n')
                                                        m3u_file.close()
                                                else:
                                                        for audio in audio_list:
                                                                if (not big_audio_flag) or ((audio.get('artist').lower()==s.lower())and((audio.get('title').lower()==autitle.lower())or(autitle==''))):
                                                                        url = audio.get('url')
                                                                        if not big_audio_flag or (autitle==''): print(au(audio))
                                                                        print(url[:url.find('?extra')], au_adress(audio))
                                                continue
                                        elif (s.lower()=='u')or(s.lower()=='г'):
                                                s = cin()
                                                if s is None: return(0)
                                                suserid = mn(s)
                                                info = call_api('users.get', {'user_ids': suserid[1]})[0]
                                                print(info)
                                                actif = call_api('messages.getLastActivity', {'user_id': info.get('id')})
                                                onstatus = 'online' if actif.get('online') else 'offline'
                                                print(onstatus, datetime.datetime.fromtimestamp(actif.get('time')))
                                                continue
                                        elif (s.lower()=='f')or(s.lower()=='а'):
                                                s = cin()
                                                if s is None: return(0)
                                                if s=='':
                                                        friend_id_list = call_api('friends.getRecent', {'count': 1000})
                                                        friend_list = call_api('users.get', {'user_ids': str(friend_id_list)[1:-1]})
                                                        for friend in friend_list:
                                                                print(friend.get('first_name'), friend.get('last_name'), friend.get('id'))
                                                else:
                                                        suserid = mn(s)
                                                        if suserid[1][0]=='-':
                                                                print(call_api('groups.join', {'group_id': suserid[1][1:]}))
                                                        else:
                                                                print(call_api('friends.add', {'user_id': suserid[1]})) #domain unavailable
                                                continue
                                        elif (s.lower()=='p')or(s.lower()=='з'):
                                                wall_flag = True
                                                userid = 0
                                                s = cin()
                                                if s is None: return(0)
                                        elif (s.lower()=='r')or(s.lower()=='к'):
                                                resmes = call_api('messages.getDialogs', {'unread': '1'}).get('items')
                                                if (resmes == []):
                                                        print('-')
                                                else:
                                                        for mes in resmes:
                                                                rm = mes.get('message')
                                                                print(rm.get('user_id'), mes.get('unread'), '#'+charfilter(rm.get('body')))
                                                continue
                                        elif (s.lower()=='i')or(s.lower()=='ш'):
                                                print(ignore)
                                                s = cin()
                                                if s is None: return(0)
                                                s = s.strip()
                                                if s=='': return(0)
                                                iuid = mn(s)
                                                if iuid[1] in ignore:
                                                        ignore.remove(iuid[1])
                                                        print('temporarily seen')
                                                else:
                                                        ignore.append(iuid[1])
                                                        with open(ignorefile, 'a') as f:
                                                                f.write('\n'+s)
                                                        f.close()
                                                continue
                                        elif (s.lower()=='h')or(s.lower()=='р'):
                                                print('count, offset, print_numbers, uid')
                                                try:
                                                        hcount, hoffset, hprint_numbers, huid = input(), input(), input(), input()
                                                except KeyboardInterrupt:
                                                        return(0)
                                                getHistory(hcount, hoffset, hprint_numbers, huid)
                                                print(printm)
                                                continue
                                        elif (s.lower()=='d')or(s.lower()=='в'):
                                                print('DELETE MESSAGES BY IDS.\nInput message ids, separated with commas.')
                                                ids = cin()
                                                if ids is None: return(0)
                                                delete_list = call_api('messages.getById', {'message_ids': ids}).get('items')
                                                printm = ''
                                                for mes in delete_list:                                                        
                                                        del_uid = str(mes.get('user_id'))
                                                        if (mes.get('out')==0): printsn('>'+del_uid)
                                                        else: printsn('<'+del_uid)
                                                        print_message(mes, 0)
                                                print(printm)
                                                print('DELETE THESE MESSAGES?\nY\\N')
                                                delete_confirmation = cin()
                                                if delete_confirmation is None: return(0)
                                                if delete_confirmation.lower()=='y':
                                                        print(call_api('messages.delete', {'message_ids': ids}))
                                                continue
                        sharp = s.find('#')
                        Nsign = s.find('№')
                        if (Nsign>=0)and((Nsign<sharp)or(sharp<0)): sharp = Nsign
                        if userid is None:
                                try:
                                        userstr = s[:sharp]
                                        s = s[sharp+1:]
                                        userid = mn(userstr)
                                except:
                                        print('message format: userid#multi-line message#')
                                        continue
                        m+='\n'+s
                        if m=='\n':
                                break
                m=m[:-1]
                if wall_flag:
                        call_api('wall.post', {'message': m, 'attachments': attachments})
                        print('Done')
                        break
                if userid is None: return(0)
                if (userid[1][0]=='-'):
                         call_api('wall.post', {'owner_id': userid[1], 'from_group': 1, 'message': m, 'attachments': attachments})
                         print('Done')
                         break
                if (m==''):
                        call_api('messages.markAsRead', {'peer_id': userid[1]})
                        printm='\n'
                        getHistory(10, 0, False, userid[1])
                        print(printm)
                        printm = ''
                        return(-1)
                if (m=='\n')and(attachments is None)and(forward_messages is None):
                        call_api('messages.markAsRead', {'peer_id': userid[1]})
                        printm='\n'
                        getHistory(10, 0, False, userid[1])
                        print(printm)
                        printm = ''
                elif (m=='\n#')or(m=='\n№'):
                        printm='\n'
                        getHistory(200, 0, False, userid[1])
                        print(printm)
                        printm = ''
                else:
                        resh = re.match('\n[#|№]+', m)
                        if resh:
                                getHistory(200, (resh.endpos-3)*200, True, userid[1])
                                print(printm)
                                printm = ''
                        else:
                                if isinstance(userid[1],int) and (userid[1]>2000000000):
                                        userid[0] = 'chat_id'
                                        userid[1] = userid[1]-2000000000
                                out_flag = (m[-1]=='#')or(m[-1]=='№')
                                if out_flag: m=m[:-1]
                                call_api('messages.send', {userid[0]: userid[1], 'message': m, 'attachment': attachments, 'forward_messages': forward_messages, 'title': subject})
                                getHistory(10, 0, False, userid[1])
                                print(printm)
                                printm = ''
                                if out_flag: return(-1)
def check_inbox():
        A=0
        global token_num
        index = 0
        prev_token_num = token_num
        for token_num in range(len(token_list)):
                if random.random() > prob[token_num]: continue
                try:
                        myname = idscash[token_num]
                        viewed_time = lastNviewcash[token_num]
                        notif_resp = call_api('notifications.get',{'start_time': viewed_time})
                        resp = call_api('messages.getDialogs', {'unread': '1'})
                        r = notif_resp.get('count')
                        t = resp.get('count')
                except:
                        return(0)
                A+=r+t
                printsn(myname.get('first_name')+' '+myname.get('last_name')+' - '+str(t)+' new dialogues'+' - '+str(r)+' new responses')
                items = resp.get('items')
                if items:
                        for x in resp.get('items'):
                                N = x.get('unread')
                                mes = x.get('message')
                                chat_id = mes.get('chat_id')
                                if chat_id is None: #check dialogue is not a chat
                                        uid = str(mes.get('user_id'))
                                        if uid in ignore:
                                                A-=1
                                                t-=1
                                                continue
                                        respname = call_api('users.get', {'user_ids': uid})[0]
                                        printsn(respname.get('first_name')+' '+respname.get('last_name')+' '+str(uid)+' '+str(N)+' messages')
                                        getHistory(N, 0, False, uid)
                                else:
                                        uid = 2000000000 + chat_id
                                        if str(uid) in ignore:
                                                A-=1
                                                t-=1
                                                call_api('messages.markAsRead', {'peer_id': 2000000000+chat_id}) #autoread
                                        else:
                                                printsn(str(uid)+' chat '+str(N))
                                                getHistory(N, 0, False, uid)
                if (t>0):
                        printsn("-------")
                for x in reversed(notif_resp.get('items')):
                        parent = x.get('parent')
                        xtype = x.get('type')
                        if parent is not None:
                                parent_id = parent.get('to_id')
                                if parent_id is None:                
                                      if parent.get('post') is not None:
                                              parent = parent.get('post')
                                              parent_id = parent.get('to_id')
                                      elif parent.get('photo') is not None:
                                              parent = parent.get('photo')
                                              parent_id = parent.get('owner_id')
                                      else:
                                              parent_id = parent.get('owner_id')
                                if 'photo' in xtype:
                                      printsn('vk.com/photo'+str(parent_id)+'_'+str(parent.get('id')))
                                else:
                                      printsn('vk.com/wall'+str(parent_id)+'_'+str(parent.get('id')))
                                printsn(parent.get('text'))
                                print_attachments(parent.get('attachments'))
                        feedback = x.get('feedback')
                        whos = feedback.get('items')
                        if whos is not None:
                                for who in whos:
                                        whuid = who.get('from_id')
                                        whuidinfo = call_api('users.get', {'user_ids': whuid})[0]
                                        printsn(whuidinfo.get('first_name')+' '+whuidinfo.get('last_name')+' '+str(whuid))
                        comment = feedback.get('text')
                        if comment is None:
                                printsn(xtype)
                        else:
                                printsn(charfilter(comment))
                                print_attachments(feedback.get('attachments'))
                printsn("_____________")
        token_num = prev_token_num
        return(A) #messages+notifies of all tokens
def main():
        global printm, mnemonics, ignore, waitTime, looping
        mnemonics = read_mnemonics()
        ignore = read_ignore()
        while True:
                mes=0
                mes=messaging()
                while (mes!=-1):
                        printm='\n'
                        check_inbox()
                        print(printm)
                        mes=messaging()
                else:
                        printm=''
                        looping = True
                        while (check_inbox()==0):
                                printm=''
                                print('-', end='')
                                try:
                                        for timer in range(waitTime):
                                                time.sleep(1)
                                except KeyboardInterrupt:
                                        print()
                                        break
                        else:
                                print()
                                master=Tk()
                                master.wm_attributes("-topmost", 1)
                                master.wm_state('normal')
                                w = Canvas(master, width=width, height=height)
                                w = Message(master, text=printm)
                                w.pack()
                                master.mainloop()
                                print(printm)
                        looping = False
if __name__ == '__main__':
        main()
