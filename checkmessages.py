# -*- coding: utf-8
import requests
import time
#https://oauth.vk.com/authorize?client_id=5015702&scope=notify,friends,photos,audio,video,docs,notes,pages,status,offers,questions,wall,groups,messages,notifications,stats,ads,offline&redirect_uri=https://oauth.vk.com/blank.html&display=page&response_type=token
sleepTime = 1
photosizes = [2560, 1280, 807, 604, 512, 352, 256, 130, 128, 100, 75, 64]
token_file = open('token_file.txt', 'r') 
token_list = [token[:-1] for token in token_file.readlines() if token[0]!='#'] #start line with # to make it comment
token_file.close()

def call_api(method, params, token):        
        params["access_token"] = token
        params["v"] = "5.35"
        url = "https://api.vk.com/method/" + method
        while True:
                try:
                        result = requests.post(url, data=params).json()
                        return result["response"] if "response" in result else result
                except:
                        sleep(sleepTime)
                        
def read_mnemonics(mnemofile):
        result = {}
        with open(mnemofile) as f:
                for line in f:
                        key, value = line.split()
                        result[key] = value
        f.close()
        return result

mnemonics = read_mnemonics('mnemo.txt')
	
def charfilter(s):
        r=''
        for c in s:
                if ord(c)<65536:
                        r+=c
                else:
                        r+='vk.com/images/emoji/'+hex(ord(c)+3627804672).upper()[2:]+'_2x.png'
        return r

def messaging():
        print('message: 2343423#0#Hey!#')
        while True:
                m = ''
                s = ''
                userid = 0
                while (s=='')or(s[-1]!='#'):
                        s=input()
                        if m=='':
                                if s=='': return(0)
                                #elif s='#N': call_api('notifications.markAsViewed', token_list[token_num])
                        sharp = s.find('#')
                        if userid==0:
                                try:
                                        userstr = s[:sharp]
                                        userid = mnemonics.get(userstr)
                                        if userid is None: userid = int(userstr)
                                        s = s[sharp+1:]
                                        sharp = s.find('#')
                                        token_num = int(s[:sharp])
                                        s = s[sharp+1:]
                                except:
                                        print('message format: userid#token number#multiple lines message#')
                                        continue
                        m+='\n'+s
                if m!='\n#':
                        call_api('messages.send', {'user_id': userid, 'message': m[:-1]}, token_list[token_num])
                else:
                        call_api('messages.markAsRead', {'peer_id': userid}, token_list[token_num])
                print('Done')

def print_attachments(attache):
        if attache is not None:
                for attached in attache:
                        type = attached.get('type')
                        stuff = attached.get(type)
                        if (type=='photo')or(type=='sticker'):
                                for size in photosizes:
                                        link=stuff.get('photo_'+str(size))
                                        if link is not None:
                                                print(link)
                                                break
                        elif type=='video':
                                req = str(stuff.get('owner_id'))+'_'+str(stuff.get('id'))+'_'+str(stuff.get('access_key'))
                                print(call_api('video.get', {'videos': req}, mytoken).get('items')[0].get('player'))
                        elif type=='wall':
                                print('vk.com/wall'+str(stuff.get('to_id'))+'_'+str(stuff.get('to_id')))
                        else:
                                url = stuff.get('url')
                                print(url[:url.find('?extra')])

def check_inbox():
        for mytoken in token_list:
                myname = call_api('users.get', {}, mytoken)[0]
                viewed_time = call_api('notifications.get',{'count': '0'}, mytoken).get('last_viewed')
                notif_resp = call_api('notifications.get',{'start_time': viewed_time}, mytoken)
                r = notif_resp.get('count')
                resp = call_api('messages.getDialogs', {'unread': '1'}, mytoken)
                print(myname.get('first_name')+' '+myname.get('last_name')+' - '+str(resp.get('count'))+' new dialogues'+' - '+str(r)+' new responses')
                for x in resp.get('items'):
                        N = x.get('unread')
                        mes = x.get('message')
                        if mes.get('chat_id') is None: #check dialogue is not a chat
                                uid = mes.get('user_id')
                                respname = call_api('users.get', {'user_ids': uid}, mytoken)[0]
                                print(respname.get('first_name')+' '+respname.get('last_name')+' '+str(uid)+' '+str(N)+' messages')
                                history = call_api('messages.getHistory', {'count': N, 'user_id': uid}, mytoken).get('items')
                                for message in reversed(history):
                                        print(charfilter(message.get('body')))
                                        print_attachments(message.get('attachments'))
                                        fwd = message.get('fwd_messages')
                                        if fwd is not None:
                                                print('fwd_messages')
                                                for fwdm in fwd:
                                                        print(str(fwdm.get('user_id'))+'#'+charfilter(fwdm.get('body')))
                print("-------")
                for x in reversed(notif_resp.get('items')):
                        parent = x.get('parent')
                        parent_id = parent.get('to_id')
                        if parent_id is None: parent_id = parent.get('post').get('to_id')
                        print('vk.com/wall'+str(parent_id)+'_'+str(parent.get('id')))
                        feedback = x.get('feedback')
                        comment = feedback.get('text')
                        if comment is None:
                                print(x.get('type'))
                        else:
                                print(charfilter(comment))
                                print_attachments(feedback.get('attachments'))
                print("_____________")

def main():
        while True:
                check_inbox()
                messaging()
        
if __name__ == '__main__':
        main()
