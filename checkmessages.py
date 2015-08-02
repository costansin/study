# -*- coding: utf-8
import requests
import time

def call_api(method, params, token):        
        params["access_token"] = token
        params["v"] = "5.35"
        url = "https://api.vk.com/method/" + method
        result = requests.post(url, data=params).json()
        return result["response"] if "response" in result else result
	
#https://oauth.vk.com/authorize?client_id=5015702&scope=notify,friends,photos,audio,video,docs,notes,pages,status,offers,questions,wall,groups,messages,notifications,stats,ads,offline&redirect_uri=https://oauth.vk.com/blank.html&display=page&response_type=token

photosizes = [2560, 1280, 807, 604, 130, 75]
token_file = open('token_file.txt', 'r') 
token_list = [token[:-1] for token in token_file.readlines() if token[0]!='#'] #start line with # to make it comment
token_file.close()

def messaging():
        print('message: 2343423#0#Hey!#')
        while True:
                m = ''
                s = '0'
                userid = 0
                while s[-1]!='#':
                        s=input()
                        if s=='': return(0)
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
                call_api('messages.send', {'user_id': userid, 'message': m[:-1]}, token_list[token_num])
                print('Done')

def read_mnemonics(mnemofile):
        result = {}
        with open(mnemofile) as f:
                for line in f:
                        key, value = line.split()
                        result[key] = value
        f.close()
        return result

mnemonics = read_mnemonics('mnemo.txt')

def print_attachments(attache):
        if attache is not None:
                for attached in attache:
                        type = attached.get('type')
                        if type=='photo':
                                photo = attached.get('photo')
                                for size in photosizes:
                                        link=photo.get('photo_'+str(size))
                                        if link is not None:
                                                print(link)
                                                break
                        elif type=='video':
                                video = attached.get('video')
                                req = str(video.get('owner_id'))+'_'+str(video.get('id'))+'_'+str(video.get('access_key'))
                                print(call_api('video.get', {'videos': req}, mytoken).get('items')[0].get('player'))
                        elif type=='wall':
                                post = attached.get('wall')
                                print('vk.com/wall'+str(post.get('to_id'))+'_'+str(post.get('to_id')))
                        else:
                                url = attached.get(type).get('url')
                                print(url[:url.find('?extra')])

def main():
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
                                        print(message.get('body'))
                                        print_attachments(message.get('attachments'))
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
                                print(comment)
                                print_attachments(feedback.get('attachments'))
                print("_____________")
        messaging()
        
if __name__ == '__main__':
        main()
