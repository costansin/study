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
                elif ch in simple_smileys: r+=simple_smileys[ch]+' '
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
