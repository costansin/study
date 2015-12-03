# -*- coding: utf-8
import requests, time, datetime, ast, os, re, random
from tkinter import *
sleepTime, waitTime = 0.34, 53
INFINITY, AU_OFFSET_CONSTANT, HI_OFFSET_CONSTANT, W_OFFSET_CONSTANT, mnemofile, ignorefile, tokenfile, raspyafile, cachefile, looping, photosizes, printm, width, height, mnemonics, ignore, idscache, uidscache, lastNviewcache, prob, token_num, full_auth_line = 10000000, 300, 200, 100, 'mnemo.txt', 'ignore.txt', 'tokens.txt', 'rasp.ya.txt', 'cache.txt', False, [2560, 1280, 807, 604, 512, 352, 256, 130, 128, 100, 75, 64], '', 0, 0, {}, [], [], {}, [], [], 0, 'https://oauth.vk.com/authorize?client_id=5015702&scope=notify,friends,photos,audio,video,docs,notes,pages,status,offers,questions,wall,groups,messages,notifications,stats,ads,offline&redirect_uri=https://oauth.vk.com/blank.html&display=page&response_type=token'
simple_smileys={128522: ':-)', 128515: ':-D', 128521: ';-)', 128518: 'xD', 128540: ';-P', 128523: ':-p', 128525: '8-)', 128526: 'B-)', 128530: ':-(', 128527: ';-]', 128532: '3(', 128546: ":'(", 128557: ':_(', 128553: ':((', 128552: ':o', 128528: ':|',128524: '3-)', 128519: 'O:)', 128560: ';o', 128562: '8o', 128563: '8|', 128567: ':X', 10084: '<3', 128538: ':-*', 128544: '>(', 128545: '>((', 9786: ':-]', 128520: '}:)', 128077: ':like:', 128078: ':dislike:', 9757: ':up:', 9996: ':v:', 128076: ':ok:'}
rev_simple_smileys={':-)': 'D83DDE0A.png', ':-D': 'D83DDE03.png', ';-)': 'D83DDE09.png', 'xD': 'D83DDE06.png', ';-P': 'D83DDE1C.png', ':-p': 'D83DDE0B.png', '8-)': 'D83DDE0D.png', 'B-)': 'D83DDE0E.png', ':-(': 'D83DDE12.png', ';-]': 'D83DDE0F.png', '3(': 'D83DDE14.png', ":'(": 'D83DDE22.png', ':_(': 'D83DDE2D.png', ':((': 'D83DDE29.png', ':o': 'D83DDE28.png', ':|': 'D83DDE10.png', '3-)': 'D83DDE0C.png', 'O:)': 'D83DDE07.png', ';o': 'D83DDE30.png', '8o': 'D83DDE32.png', '8|': 'D83DDE33.png', ':X': 'D83DDE37.png', '<3': '2764.png', ':-*': 'D83DDE1A.png', '>(': 'D83DDE20.png', '>((': 'D83DDE21.png', ':-]': '263A.png', '}:)': 'D83DDE08.png', ':like:': 'D83DDC4D.png', ':dislike:': 'D83DDC4E.png', ':up:': '261D.png', ':v:': '270C.png', ':ok:': 'D83DDC4C.png'}
smiley = re.compile('|'.join([re.escape(sm) for sm in rev_simple_smileys])+r'|\d+') #warning: all numbers are smileys!
def start():        
        for x in mnemofile, ignorefile, tokenfile, raspyafile, cachefile:
                if not os.path.exists(x):
                        with open(x, 'w') as f: pass
        global token_list, raspyadress, smileys
        with open(tokenfile, 'r') as token_file: token_list = [token[:-1] for token in token_file.readlines() if token[0]!='#'] #start line with # to make it comment
        with open(raspyafile, 'r') as raspya_file: raspyadress = [a for a in raspya_file.readlines() if a[0]!='#'] #start line with # to make it comment
        if os.path.isdir('smileys'): smileys = os.listdir('smileys')
def call_api(method, params):
        #print(method, params)
        #time.sleep(sleepTime)
        print('.', end='') if not looping else print(',', end='')
        if method[:7]=='http://':
                q = method.find('?')
                url = method[:q]
                files = {'photo': ('file.png', open(params, 'rb'))}
                params = {} #dict(urllib.parse.parse_qsl(urllib.parse.urlsplit(method[q+1:]).query))
                for query in method[q+1:].split('&'):
                        v = query.split('=')
                        params[v[0]]=v[1]
        else:
                params["access_token"] = token_list[token_num]
                params["v"] = "5.40"
                url = "https://api.vk.com/method/" + method
                files = None
        E = False
        while True:
                try:
                        E = False
                        try: result = requests.post(url, data=params, files=files)
                        except KeyboardInterrupt: return
                        result = result.json()
                        if 'error' not in result: return result["response"] if "response" in result else result
                        else:
                                err = result.get('error')
                                msg = err.get('error_msg')
                                print(msg)
                                if msg.find('Validation')+1: print(err.get('redirect_uri'))
                                if msg.find('authorization')+1: print(full_auth_line)
                                return
                except:
                        if not E:
                                print('E', end='')
                                E = True
                        time.sleep(sleepTime)
def saveinstance():
        with open(cachefile, 'w', encoding='utf-8') as cache_file:
                cache_file.write(str(idscache)+'\n')
                cache_file.write(str(lastNviewcache)+'\n')
                cache_file.write(str(prob)+'\n')
                cache_file.write(str(token_num)+'\n')
                cache_file.write(str(prevuserid)+'\n')
                cache_file.write(str(uidscache)+'\n')
def reset():
        global token_num, idscache, uidscache, lastNviewcache, prob, prevuserid, token_list
        idscache, uidscache, lastNviewcache, prob = [], {}, [], []
        if not token_list:
                print(full_auth_line+'\n\n\nauthorisation token needed\nplease insert that in your browser and do what it interdicts\ni strongly promiss not to steal your profile\nactually, i cannot :(\n')
                s = cin()
                if s is None:
                        print("c'mon, i AM really a good guy")
                        s = cin()
                        if s is None:
                                raise PermissionError ('Lack of trust error')
                refull = re.findall('access_token=.*?&', s)
                if refull: s = refull[0][13:-1]
                token_list = [s]
                with open(tokenfile, 'w') as token_file: token_file.write(s+'\n')
        for token_num in range(len(token_list)):
                api_call = call_api('users.get', {})
                if api_call:
                        me = api_call[0]
                        idscache = idscache + [me]
                        uidscache[me.get('id')] = me
                else: idscache = idscache + [{'last_name': str(token_num), 'first_name': 'token_num', 'id': 0}]
                api_call = call_api('notifications.get',{'count': '0'})
                if api_call: lastNviewcache = lastNviewcache + [api_call.get('last_viewed')]
                else: lastNviewcache = lastNviewcache + [int(time.time())]
                prob=prob+[1, 1]
        token_num = 0
        prevuserid = idscache[token_num].get('id')
        saveinstance()
        print()
        return 0
def getcache():
        global token_num, idscache, lastNviewcache, prob, prevuserid, uidscache
        with open(cachefile, 'r', encoding='utf-8') as cache_file:
                try:
                        i, l, p, t, r, u = cache_file.readlines()
                        idscache, lastNviewcache, prob, token_num, prevuserid, uidscache = ast.literal_eval(i), ast.literal_eval(l), ast.literal_eval(p), int(t), ast.literal_eval(r), ast.literal_eval(u)
                except: reset()
def getcached(uid):
        global uidscache
        result = uidscache.get(uid)
        if result is None:
                api_call = call_api('users.get', {'user_ids': uid})
                if api_call: result = api_call[0]
                if result: uidscache[uid] = result
                saveinstance()
        return result
def get_long_list(method, params, l_count, OFFSET_CONSTANT):
        l_offset = 0
        long_list = []
        long_list_step = []
        while l_count>0:
                params.update({'count': min(l_count, OFFSET_CONSTANT),'offset': l_offset})
                api_call = call_api(method, params)
                if api_call: long_list_step = api_call.get('items')
                else: long_list_step = None
                if not long_list_step: break
                long_list = long_list + long_list_step
                l_offset = l_offset + OFFSET_CONSTANT
                l_count = l_count - OFFSET_CONSTANT
                print(len(long_list), end='')
        return long_list
def cin():
        try:
                s = input()
                return(s)
        except KeyboardInterrupt: exit
def read_mnemonics():
        result = {}
        with open(mnemofile, 'r') as f:
                for line in f:
                        key, value = line.split()
                        result[key] = int(value)
        return result
def l(wrong):
        wrong = wrong.lower().strip() 
        right = ''  #re.match("^[' 'A-Za-z0-9_-]*$", wrong)
        for wrong_letter in wrong:
                if ord(wrong_letter)<128: right_letter = wrong_letter
                else: right_letter = 'qwertyuiop[]asdfghjkl;\'zxcvbnm,.#_'['йцукенгшщзхъфывапролджэячсмитьбю№_'.find(wrong_letter)]
                right = right + right_letter
        return right
def mn(idstring):
        idstring = l(idstring)
        if idstring in mnemonics: return mnemonics[idstring]
        else:
                try: return int(idstring)
                except: return #api_call = call_api('users.get', {'user_ids': idstring}) #if api_call: return str(api_call[0].get('id')) #else: return '0'
def read_ignore():
        result = []
        with open(ignorefile, 'r') as f:
                for line in f:
                        line = line.strip()
                        result.append(mn(line))
        return result
def smiley_hex(c, sh): return hex(c+sh).upper()[2:]+'.png'
def charfilter(s):
        r=''
        for c in s:
                ch = ord(c)
                if ch<8617: r+=c
                elif ch in simple_smileys: r+=simple_smileys[ch]+' '
                else: r+='&#'+str(ch)+';'
        return r
def printms():
        global printm
        #print('{'+printm+'}')
        print(printm)
        printm = ''
def printsn(s):
        global printm
        printm += s + '\n' #print(s)
def printtime(date): return('['+datetime.datetime.fromtimestamp(date).strftime('%d %b %Y (%a) %H:%M:%S')+']')
def name_from_id(uid):
        cachedid = getcached(uid)
        return cachedid.get('first_name')+' '+cachedid.get('last_name')+' ('+str(cachedid.get('id'))+')'
def iam():
        if idscache: print(idscache[token_num].get('first_name'), idscache[token_num].get('last_name')+' to '+name_from_id(prevuserid)+':')
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
                        if owner is None:
                                try: owner = -stuff.get('group_id')
                                except: owner = None
                        cropadress = str(owner)+'_'+str(stuff.get('id'))
                        adress = croptype + cropadress
                        if (atype=='photo')or(atype=='sticker'):
                                for size in photosizes:
                                        link=stuff.get('photo_'+str(size))
                                        if link is not None:
                                                printsn(link)
                                                break
                        #elif atype=='video': adress = adress + '_' + str(stuff.get('access_key')) #call_api('video.get', {'videos': req})# api_call.get('items')[0].get('player'))
                        elif atype=='link':
                                printsn('['+stuff.get('title')+']\n['+stuff.get('description')+']\n'+stuff.get('url'))
                                return
                        else:
                                url = stuff.get('url')
                                if url is None: url = stuff.get('view_url')
                                if url is not None:
                                        urlf = url.find('?extra')        
                                        if (urlf!=-1):
                                                printsn(stuff.get('artist')+' - '+stuff.get('title'))
                                                printsn(url[:urlf]+' ')
                                        else: printsn(url+' ')
                        printsn(adress+' ')
def print_message(prefix, message, k):
        body = prefix + message.get('body')
        if body: printsn(charfilter(body)) if message.get('emoji') else printsn(body)
        print_attachments(message.get('attachments'))
        fwd = message.get('fwd_messages')
        if fwd is not None:
                printsn('     '*k + '[fwd_messages:]')
                for fwdm in fwd: print_message('     '*(k+1) + '['+name_from_id(fwdm.get('user_id'))+']', fwdm, k+1)
def getHistory(count, print_numbers, uid):
        if not isinstance(uid, int): uid = mn(uid)
        chat = uid>=2000000000
        unread = False
        history = get_long_list('messages.getHistory', {'user_id': uid}, count, HI_OFFSET_CONSTANT)
        inoutchar = ''
        if not history: return
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
                print_message('['+name_from_id(message.get('user_id'))+']' if chat else '', message, 0)
                if print_numbers: printsn(printtime(message.get('date')))
        if not print_numbers: printsn(printtime(message.get('date')))
def showprintm():
        master=Tk()
        master.wm_attributes("-topmost", 1)
        master.wm_state('normal')
        w = Canvas(master, width=width, height=height)
        w = Message(master, text=printm)
        w.pack()
        master.mainloop()
def messaging():
        global token_num, printm, waitTime, prevuserid
        iam()
        m = ''
        s = ''
        userid = None
        wall_flag = False
        attachments = ''
        forward_messages = ''
        subject = None
        while (s=='')or(l(s[-1])!='#'):
                s = cin()
                if s is None: return(0)
                if (m==''):
                        if (s==''): return(-2)
                        if (len(s)==1):
                                if s.isdigit():
                                        n = int(s)
                                        if n<=len(token_list): token_num = n
                                        iam()
                                        continue												
                                def r(c): return l(s)==c
                                if r("?"):
                                        print("' - wait regime\n+ - attach (? for more info)\n~ or ' - waittime for wait regime\nn - mark notifications as read\no - open a file from a direct link (see help there using ?-command)\np - set probabilities of checking (2N numbers in columnar form)\ne - rasp.ya.ru from the file with informer-links\nw - see wall or wall post\n: - any site in Internet in raw\ns - see smiley image from its number or :-] - form\nt - input raw api call\nl - like something\nv - find a video; V - find an hd-video\na - find an audio (? for help); A - find an audio of exact author (? for help), title or id\nx - raw link to audio/video (x of video2982_242 is player-link, x of a player-link is its raw video file)\nu - user/group info\nf - friend someone/join a group/see friends of\nb - posts to your wall - warning: makes you online!\nr - reset cache\n. - quick check\ni - see ignore list and add something to it\nm - see mnemolist and add something to it\nh - saving history to file\n- - delete messages by ids\nz - see what would it be if latinize the layout - using latinizing function all the wrong (russian) layout or wrong case commands would be properly understood)\ng - user IP and location\n? - this help info\nq - quit")
                                        continue
                                if r("'"): return(-1)
                                if r("+"):
                                        s = cin()
                                        if s is None: return(0)
                                        if r("?"):
                                                print('forward messages ids (e.g. 1232,1233,1237) |\nattachments (e.g. photo123123_123223,audio-34232_23123) |\ns Subject of the message |\nu - upload photo to message (input file adress or nothing to upload Безымянный.png) |\nw - upload photo to wallpost (same here)')
                                                continue
                                        if r("u"): uploades = ['photos.getMessagesUploadServer', 'photos.saveMessagesPhoto']
                                        elif r("w"): uploades = ['photos.getWallUploadServer', 'photos.saveWallPhoto']
                                        if uploades:
                                                s = cin()
                                                if s is None: return(0)
                                                if s.strip()=='': s='Безымянный.png'
                                                upload_url = call_api(uploades[0], {})
                                                if upload_url: upload_stuff = call_api(upload_url.get('upload_url'), s)
                                                else: return(0)
                                                if upload_stuff: uploaded_photo = call_api(uploades[1], upload_stuff)      
                                                else: return(0)
                                                if uploaded_photo: s = 'photo'+str(uploaded_photo[0].get('owner_id'))+'_'+str(uploaded_photo[0].get('id'))
                                                print('\n'+s)
                                        if s[0].isdigit(): forward_messages += ','+s
                                        elif l(s[0])=='s': subject = s[2:] #s_The subject of my message
                                        else: attachments += ','+s
                                        continue
                                if r("~")or r("`"):
                                        s = cin()
                                        if s is None: return(0)
                                        try: waitTime = int(s)
                                        except: return(0)
                                        continue
                                elif r("n"):
                                        call_api('notifications.markAsViewed', {})
                                        lastNviewcache[token_num] = int(time.time())
                                        saveinstance()
                                        print()
                                        continue
                                elif r("p"):
                                        print('Set probabilities of token_nums while checkbox')
                                        global prob
                                        prob = [float(input()) for i in range(2*len(token_list))]
                                        continue
                                elif r("e"): #rasp.yandex.ru/search/suburban/? #https://rasp.yandex.ru/informers/search/?fromId=s0000000&amp;toId=s0000000&amp;
                                        for rasp in raspyadress:
                                                r = requests.get(rasp)
                                                r.encoding = 'UTF-8'
                                                x = r.text
                                                print(x[x.find('<title>')+7:x.find('</title>')])
                                                l2 = [x[m.start()-5:m.start()] for m in re.finditer(':00&', x)]
                                                stations = [st[st.find('>')+1:st.find('<')].replace('\xa0',' ') for st in re.findall(r'overflow-inner.*?div',x)]
                                                l3 = list(map(lambda z, x, y: x+' - '+y+' - '+z, stations[::], l2[::2], l2[1::2]))
                                                for r in l3: print(r)
                                        continue
                                elif r("w"):
                                        s = cin()
                                        if s is None: return(0)
                                        wall_owner = mn(s)
                                        if wall_owner is None:
                                                findwall = s.find('wall')
                                                if findwall+1: s = s[findwall:]
                                                s = s.replace('wall','')
                                                wall = call_api('wall.getById',{'posts':s})
                                                if wall is None: return(0)
                                        else:
                                                print('Now you have to input the number of posts')
                                                s = cin()
                                                if s is None: return(0)
                                                try: postsN = int(s)
                                                except: return(0)
                                                api_call = call_api('wall.get', {'owner_id': wall_owner, 'count': postsN})
                                                if api_call: wall = api_call.get('items')
                                                else: return(0)
                                        printm='\n'
                                        for post in wall:
                                                printsn('wall'+str(post.get('from_id'))+'_'+str(post.get('id'))+'\n\n'+charfilter(post.get('text')))
                                                reposted = post.get('copy_history')
                                                if reposted:
                                                        for reposts in reposted:
                                                                printsn('\t[REPOSTED]\n\t'+charfilter(reposts.get('text')))
                                                                print_attachments(reposts.get('attachments'))                
                                                print_attachments(post.get('attachments'))
                                                printsn('\n'+str(post.get('likes').get('count'))+' likes, '+str(post.get('comments').get('count'))+' comments')
                                                printsn('____')
                                        if len(wall)==1:
                                                printsn('COMMENTS:')
                                                post = wall[0]
                                                wowner = post.get('from_id')
                                                wid = post.get('id')
                                                wallcomments = get_long_list('wall.getComments', {'owner_id': wowner, 'post_id': wid, 'need_likes': 1},INFINITY,W_OFFSET_CONSTANT)
                                                for comment in wallcomments:
                                                        printsn('wall'+str(post.get('from_id'))+'_'+str(comment.get('id'))+'\nid'+str(comment.get('from_id'))+'\n\n'+charfilter(comment.get('text')))
                                                        print_attachments(comment.get('attachments'))
                                                        printsn('\n'+str(comment.get('likes').get('count'))+' likes')
                                                        printsn('____')
                                        printms()
                                        continue
                                elif r(":"):
                                        s = cin()
                                        if s is None: return(0)
                                        if s.find('http')!=0: s='http://'+s
                                        x = requests.get(s)
                                        print(x.text)
                                        continue
                                elif r("s"):
                                        s = cin()
                                        if s is None: return(0)
                                        y = smiley.findall(s)
                                        for s in y:
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
                                elif r("t"):
                                        s = cin()
                                        if s is None: return(0)
                                        lit = ast.literal_eval(s)
                                        g = call_api(*lit)
                                        print(charfilter(str(g)))
                                        continue
                                elif r("l"):
                                        print('type owner_id\ntypes:\npost comment photo audio video note photo_comment video_comment topic_comment sitepage')
                                        s = cin()
                                        if s is None: return(0)
                                        lobjecttype, what = s.split()
                                        lowner, lid = what.split('_') #ifLiked - likes.delete
                                        print(call_api('likes.add', {'type': lobjecttype, 'owner_id': lowner, 'item_id': lid}))
                                        continue
                                elif r("d"):
                                        print('DELETE WALL POST')
                                        s = cin()
                                        if s is None: return(0)
                                        wcrop = s.find('wall')
                                        if wcrop+1: s = s[wcrop+4:]
                                        wowner, wid = s.split('_')
                                        wall = call_api('wall.getById',{'posts':s})
                                        if not wall: return[0]
                                        post = wall[0]
                                        printsn('\n'+charfilter(post.get('text')))              
                                        print_attachments(post.get('attachments'))
                                        printms()
                                        print('DELETE THIS POST?\nY\\N')
                                        delete_confirmation = cin()
                                        if delete_confirmation is None: return(0)
                                        if l(delete_confirmation)=='y': print(call_api('wall.delete', {'owner_id': wowner, 'post_id': wid}))
                                        continue
                                elif r("o"):
                                        s = cin()
                                        if s is None: return(0)
                                        if r("?"): print('opens a file from a direct link. Or opens tokenfile, mnemofile, ignorefile, raspyafile - using T,M,I,R commands')
                                        elif r("t"): os.system(tokenfile)
                                        elif r("m"): os.system(mnemofile)
                                        elif r("i"): os.system(ignorefile)
                                        elif r("r"): os.system(raspyafile)
                                        else:
                                                ofname = 'file'+s[s.rfind('.'):]
                                                with open(ofname, 'wb') as f:
                                                        f.write(requests.get(s).content)
                                                os.system(ofname)
                                                continue
                                        start()
                                        continue
                                elif r("v"):
                                        s = cin()
                                        if s is None: return(0)
                                        vhd = int(s.isupper())
                                        v = call_api('video.search', {'q':s, 'sort': 2, 'hd': vhd, 'filters': 'long'*vhd, 'adult': '1'})
                                        if v is None: return(0)
                                        for vid in v.get('items'):
                                                print(vid.get('title')) #print(vid.get('player'))
                                                print('video'+str(vid.get('owner_id'))+'_'+str(vid.get('id')))
                                        continue
                                elif r("x"):
                                        s = cin() #get the video from a "player"-link or "player"-link from video id
                                        if s is None: return(0)
                                        if not s.find('audio'):
                                                owner, aid = s[5:].split('_')
                                                api_call = call_api('audio.get', {'owner_id': owner, 'audio_ids': aid})
                                                if not api_call: return(0)
                                                auresplist = api_call.get('items')
                                                if not auresplist: return(0)
                                                aur = auresplist[0]
                                                for x in aur: print(x, aur[x], sep='\t\t')
                                        elif s.find('video_ext')+1:
                                                x = requests.get(s).text
                                                if x.find('Видеозапись была помечена модераторами сайта как «Материал для взрослых». Такие видеозаписи запрещено встраивать на внешние сайты.')+1:
                                                        print('Adult content error')
                                                        continue
                                                xd = x.find('video_max_hd = ')
                                                try: video_max_hd = int(x[xd+16:xd+17])
                                                except: video_max_hd = 0
                                                hds = ['240', '360', '480', '720', '1080']
                                                video_url = x[x.find('url'+hds[video_max_hd])+7:]
                                                video_url = video_url[:video_url.find('&amp;')]
                                                print(video_url)       
                                        else:
                                                s = s[s.find('video')+5:]
                                                api_call = call_api('video.get', {'videos': s})
                                                if api_call:
                                                        vid = api_call.get('items')
                                                        if vid:
                                                                v = vid[0]
                                                                if v.get('is_private'): print('ADULT_CONTENT')
                                                                print(v.get('player'))
                                        continue
                                elif r("a"):
                                        if attachments:
                                                add_owner_id, add_audio_id = attachments.split('_')
                                                print(call_api('audio.add', {'owner_id': int(add_owner_id[6:]), 'audio_id': int(add_audio_id)}))
                                                continue
                                        big_audio_flag = s.isupper()
                                        m3u_flag = True
                                        wget_flag = False
                                        wget_start_num = None
                                        s = cin()
                                        if s is None: return(0)
                                        if r("?"):
                                                print('[HERE]\n[WGET][start num]\n[Number]\n[Author | ID]\n[Title | id/mnemonic]') if big_audio_flag else print('[HERE]\n[wget][start num]\n[Number]\n[Search string]')
                                        if r("here"):
                                                m3u_flag = False
                                                s = cin()
                                                if s is None: return(0)
                                        if l(s[:4])=='wget':
                                                wget_flag = True
                                                try: wget_start_num = int(s[4:])
                                                except: wget_start_num = None
                                                s = cin()
                                                if s is None: return(0)
                                        if s.isdigit():
                                                au_count = int(s)
                                                s = cin()
                                                if s is None: return(0)
                                        else:
                                                if m3u_flag: au_count = 3000
                                                else: au_count = 10
                                        if big_audio_flag:
                                                autitle = cin()
                                                if autitle is None: return(0)
                                                autitle = autitle.strip()
                                        s = s.strip().lower()
                                        audio_list = []
                                        audioget = s=='id' 
                                        if not s:
                                                audioget = True
                                                t = idscache[token_num].get('id')
                                        elif audioget: t = mn(autitle)
                                        if audioget: big_audio_flag = False
                                        if audioget: audio_list = get_long_list('audio.get', {'owner_id': t}, au_count, AU_OFFSET_CONSTANT)
                                        elif big_audio_flag:
                                                if autitle=='': audio_list = get_long_list('audio.search', {'q': s, 'performer_only': 1}, au_count, AU_OFFSET_CONSTANT)
                                                else: audio_list = get_long_list('audio.search', {'q': s+' '+autitle}, au_count, AU_OFFSET_CONSTANT)
                                        else: audio_list = get_long_list('audio.search', {'q': s}, au_count, AU_OFFSET_CONSTANT)
                                        print()
                                        def au_adress(audio): return 'audio' + str(audio.get('owner_id')) + '_' + str(audio.get('id'))
                                        def au(audio): return audio.get('artist') + ' - ' + audio.get('title')
                                        if wget_flag:
                                                wget_filename = 'auwget.bat'
                                                with open(wget_filename, 'w', encoding='utf-8') as wget_file:
                                                        if not s: s = '~'
                                                        if wget_start_num is None: aunum = ''
                                                        else: wget_start_num -= len(audio_list)
                                                        wget_file.write('chcp 65001\nmkdir '+s+'\n')
                                                        for audio in audio_list:
                                                                url = audio.get('url')
                                                                aufname = re.sub('"(.*?)"', r'«\1»', au(audio)) # "" to «»
                                                                aufname = re.sub(r'[\\/:*?<>|+\n]','-',aufname) # replace bad characters with -
                                                                if wget_start_num is not None:
                                                                        wget_start_num += 1
                                                                        aunum = str(wget_start_num)+'_'
                                                                if url!='': wget_file.write('wget -nc '+url[:url.find('?extra')]+' -O "' + s+'\\'+aunum+aufname + '.mp3"\n')
                                                        wget_file.write('Del %0 /q\n')
                                                os.system(wget_filename)
                                        if m3u_flag:
                                                if audioget and not s: m3uname = str(token_num)
                                                else: m3uname = 'm3u'
                                                with open(m3uname+'.m3u', 'w', encoding='utf-8') as m3u_file:
                                                        m3u_file.write('#EXTM3U\n')
                                                        for audio in audio_list:
                                                                if (not big_audio_flag) or ((audio.get('artist').lower()==s.lower())and((audio.get('title').lower()==autitle.lower())or(autitle==''))):
                                                                        url = audio.get('url')                
                                                                        m3u_file.write('#EXTINF:'+str(audio.get('duration'))+', '+au(audio)+'\n#'+au_adress(audio)+'\n'+url[:url.find('?extra')]+'\n')
                                        else:
                                                for audio in audio_list:
                                                        if (not big_audio_flag) or ((audio.get('artist').lower()==s.lower())and((audio.get('title').lower()==autitle.lower())or(autitle==''))):
                                                                url = audio.get('url')
                                                                if not big_audio_flag or (autitle==''): print(au(audio))
                                                                print(url[:url.find('?extra')], au_adress(audio))
                                        continue
                                elif r("u"):
                                        s = cin()
                                        if s is None: return(0)
                                        suserid = mn(s)
                                        if not suserid: suserid = l(s)
                                        info = call_api('users.get', {'user_ids': suserid})
                                        if info:
                                                for user in info:
                                                        deactif = user.get('deactivated')
                                                        if deactif is None: deactif = ''
                                                        print(user.get('first_name'),user.get('last_name'),user.get('id'),deactif)
                                                if len(info)==1:
                                                        actif = call_api('messages.getLastActivity', {'user_id': info[0].get('id')})
                                                        if actif:
                                                                onstatus = 'online' if actif.get('online') else 'offline'
                                                                print(onstatus, printtime(actif.get('time')))
                                        else:
                                                info = call_api('utils.resolveScreenName', {'screen_name': suserid})
                                                if info: print(info.get('type'), info.get('object_id'))
                                        print('Now ' + printtime(time.time()))
                                        continue
                                elif r("f"):
                                        print("'' | > | < | F | number")
                                        s = cin()
                                        if s is None: return(0)
                                        friend_id_list = None
                                        if s=='': friend_id_list = call_api('friends.getRecent', {'count': 1000})
                                        elif l(s)=='<' or l(s)==',': friend_id_list = call_api('friends.getRequests', {'count': 1000, 'out': 1})
                                        elif l(s)=='>' or l(s)=='.': friend_id_list = call_api('friends.getRequests', {'count': 1000, 'out': 0})
                                        elif l(s)=='f':
                                                s = cin()
                                                if s is None: return(0)
                                                t = mn(s)
                                                if t<0: friend_id_list = call_api('groups.getMembers', {'group_id': -t, 'count': 1000, 'sort': 'time_desc'})
                                                else: friend_id_list = call_api('friends.get', {'user_id': t, 'count': 1000})
                                        if friend_id_list:
                                                friend_list = call_api('users.get', {'user_ids': str(friend_id_list)[1:-1]})
                                                if friend_list:
                                                        for friend in friend_list:
                                                                try:
                                                                        print(friend.get('first_name'), friend.get('last_name'), friend.get('id'))
                                                                        uidscache[friend.get('id')] = friend
                                                                except KeyboardInterrupt: break
                                                saveinstance()
                                        else:
                                                suserid = mn(s)
                                                if suserid<0: print(call_api('groups.join', {'group_id': -suserid}))
                                                else: print(call_api('friends.add', {'user_id': suserid})) #domain unavailable
                                        continue
                                elif r("b"): #makes you online!
                                        wall_flag = True
                                        userid = 0
                                        s = cin()
                                        if s is None: return(0)
                                elif r("r"): return(reset())
                                elif r("."):
                                        api_call = call_api('messages.getDialogs', {'unread': '1'})
                                        if api_call: resmes = api_call.get('items')
                                        else: return(0)
                                        if (resmes == []): print('-')
                                        else:
                                                for mes in resmes:
                                                        rm = mes.get('message')
                                                        print(rm.get('user_id'), mes.get('unread'), '#'+charfilter(rm.get('body')))
                                        continue
                                elif r("i"):
                                        print(ignore)
                                        print("Now add something to ignore list or temporarily remove something from it (to cancel - CTRL+C).")
                                        s = cin()
                                        if s is None: return(0)
                                        s = l(s.strip())
                                        if s=='': return(0)
                                        iuid = mn(s)
                                        if iuid in ignore:
                                                ignore.remove(iuid)
                                                print('temporarily seen')
                                        else:
                                                ignore.append(iuid)
                                                if os.path.exists(ignorefile):
                                                        with open(ignorefile, 'a') as f: f.write('\n'+s)
                                                else:
                                                        print('ignore file was deleted!')
                                                        with open(ignorefile, 'w') as f: f.write('\n'+s)
                                        continue
                                elif r("m"):
                                        print(mnemonics)
                                        print("Now add something to mnemo list (to cancel - CTRL+C).")
                                        s = cin()
                                        if s is None: return(0)
                                        s = s.strip()
                                        if s=='': return(0)
                                        muserids = cin()
                                        if muserids is None: return(0)
                                        try: muserid = int(muserids)
                                        except: return(0)
                                        muserids = str(muserid)
                                        mnemonics[s] = muserid
                                        if os.path.exists(mnemofile):
                                                with open(mnemofile, 'a') as f: f.write('\n'+s+' '+muserids)
                                        else:
                                                print('mnemo file was deleted!')
                                                with open(mnemofile, 'w') as f: f.write('\n'+s+' '+muserids)
                                        continue
                                elif r("h"):
                                        print("saving history to file. if you need HELP - type '?'")
                                        huid = cin()
                                        if huid is None: return(0)
                                        huid = mn(huid)
                                        getHistory(INFINITY, True, huid)
                                        with open('history_' + str(idscache[token_num].get('id')) + '_to_' + name_from_id(huid) + '.txt', 'w', encoding='utf-8') as f: f.write(printm)
                                        printm=''
                                        print()
                                        continue
                                elif r("-"):
                                        print('DELETE MESSAGES BY IDS.\nInput message ids, separated with commas.')
                                        ids = cin()
                                        if ids is None: return(0)
                                        api_call = call_api('messages.getById', {'message_ids': ids})
                                        if api_call: delete_list = api_call.get('items')
                                        else: return(0)
                                        printm = ''
                                        for mes in delete_list:                                                        
                                                del_uid = str(mes.get('user_id'))
                                                if (mes.get('out')==0): printsn('>'+del_uid)
                                                else: printsn('<'+del_uid)
                                                print_message('', mes, 0)
                                        printms()
                                        print('DELETE THESE MESSAGES?\nY\\N')
                                        delete_confirmation = cin()
                                        if delete_confirmation is None: return(0)
                                        if l(delete_confirmation)=='y': print(call_api('messages.delete', {'message_ids': ids}))
                                        continue
                                elif r("z"):
                                        s = cin()
                                        if s is None: return(0)
                                        print(l(s))
                                        continue
                                elif r("g"):
                                        site = 'https://yandex.ru/internet' #'http://jsonip.com' ip = r.json()['ip']
                                        r = requests.get(site)
                                        r.encoding = 'UTF-8'
                                        x = r.text
                                        p = x.find('Поздравляем') #region = re.findall(r'Регион.*?\<\/li\>', x)
                                        inf = x[p:p+200] #if region is not None: print(region[0][:-12].replace('</div><span class="data__item-content">',' '))
                                        inf = inf.replace('strong','').replace('/', '').replace('<>', '')
                                        print(inf[:inf.find('Браузер')])
                                        continue
                                elif r("q"):
                                        saveinstance()
                                        return(-3)
                sharp = s.find('#')
                Nsign = s.find('№')
                if (Nsign>=0)and((Nsign<sharp)or(sharp<0)): sharp = Nsign
                alls = s
                if userid is None:
                        userstr = s[:sharp]
                        s = s[sharp+1:]
                        userid = mn(userstr)
                if not userid:
                        userid = prevuserid
                        s = alls
                m+='\n'+s
                if m=='\n':
                        break
        prevuserid = userid
        m=m[:-1]
        if wall_flag:
                print(call_api('wall.post', {'message': m, 'attachments': attachments}))
                return(0)
        if userid is None: return(0)
        if userid<0:
                 print(call_api('wall.post', {'owner_id': userid, 'from_group': 1, 'message': m, 'attachments': attachments}))
                 return(0)
        if (m==''): return(0)
        elif (m=='\n')and not attachments and not forward_messages:
                call_api('messages.markAsRead', {'peer_id': userid})
                getHistory(10, False, userid)
                printms() #return(-1)
        elif (l(m)=='#'):
                getHistory(200, False, userid)
                printms()
        else:
                resh = re.match('\n[#|№]+', m)
                if resh:
                        getHistory((resh.endpos-2)*200, True, userid)
                        printms()
                else:
                        if userid>=2000000000:
                                meth = 'chat_id'
                                userid = userid-2000000000
                        else: meth = 'user_id'
                        out_flag = l(m[-1])=='#'
                        if out_flag: m=m[:-1]
                        print(len(m))
                        if len(m)>348:
                                print("C'mon, do I really interested in that? Better ask me how am I.\n[or all is well?]")
                                confirmation = cin()
                                if confirmation is None or l(confirmation)!="all is well":
                                        print("resend it to youself, yeah? hah")
                                        confirmation = cin()
                                        if confirmation is None: return(0)
                                        userid = idscache[token_num].get('id')
                        getHistory(10, False, userid)
                        if not printm:
                                print('The history is empty!\nall is well?')
                                confirmation = cin()
                                if confirmation is None or l(confirmation)!="all is well":
                                        print('Input another token_num')
                                        s = cin()
                                        if not s: return(0)
                                        if s.isdigit(): token_num = int(s)
                                        else: return(0)
                        while len(m)>4096:
                                lastn = m[:4096].rfind('\n')
                                if lastn==-1: lastn=4095
                                call_api('messages.send', {meth: userid, 'message': m[:lastn], 'attachment': attachments, 'forward_messages': forward_messages, 'title': subject})
                                m = m[lastn:]
                        call_api('messages.send', {meth: userid, 'message': m, 'attachment': attachments, 'forward_messages': forward_messages, 'title': subject})
                        print(printm+m+'\n'+printtime(time.time()))
                        printm = ''
                        if out_flag: return(-1)
        return(0)
def check_inbox():
        A=0
        global token_num, printm
        index = 0
        prev_token_num = token_num
        for token_num in range(len(token_list)): #if random.random() > prob[token_num]: continue
                myname = idscache[token_num]
                viewed_time = lastNviewcache[token_num]
                notif_resp, resp = None, None
                if not looping or random.random() < prob[token_num*2-1]: notif_resp = call_api('notifications.get',{'start_time': viewed_time})
                if not looping or random.random() < prob[token_num*2]: resp = call_api('messages.getDialogs', {'unread': '1'})
                if notif_resp:
                        r = notif_resp.get('count')
                        nitems = reversed(notif_resp.get('items'))
                else:
                        r = 0
                        nitems = []
                if resp:
                        t = resp.get('count')
                        items = resp.get('items')
                else:
                        t = 0
                        items = []
                A+=r+t
                printsn('\n'+myname.get('first_name')+' '+myname.get('last_name')+' - '+str(t)+' new dialogues'+' - '+str(r)+' new responses')
                if not looping: printms()
                for x in items:
                        N = x.get('unread')
                        mes = x.get('message')
                        chat_id = mes.get('chat_id')
                        chat = chat_id is not None
                        if chat: uid = 2000000000 + chat_id #check dialogue is not a chat
                        else: uid = mes.get('user_id')
                        if uid in ignore:
                                A-=1
                                t-=1
                                if chat: call_api('messages.markAsRead', {'peer_id': 2000000000+chat_id}) #autoread
                                continue
                        respname = getcached(uid)
                        if respname: printsn('\n'+respname.get('first_name')+' '+respname.get('last_name')+' '+str(uid)+' '+str(N)+' messages')
                        getHistory(N, False, uid)
                        if not looping: printms()
                if r and t: printsn("-------")
                for x in nitems:
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
                                      else: parent_id = parent.get('owner_id')
                                if 'photo' in xtype: printsn('vk.com/photo'+str(parent_id)+'_'+str(parent.get('id')))
                                else: printsn('vk.com/wall'+str(parent_id)+'_'+str(parent.get('id')))
                                printsn(parent.get('text'))
                                print_attachments(parent.get('attachments'))
                        feedback = x.get('feedback')
                        whos = feedback.get('items')
                        if whos is not None:
                                for who in whos:
                                        whuid = who.get('from_id')
                                        whuidinfo = getcached(whuid)
                                        if whuidinfo: printsn(whuidinfo.get('first_name')+' '+whuidinfo.get('last_name')+' '+str(whuid))
                        comment = feedback.get('text')
                        if comment is None:
                                printsn(xtype)
                        else:
                                printsn(charfilter(comment))
                                print_attachments(feedback.get('attachments'))
                        if not looping: printms()
                #printsn("_____________")
        token_num = prev_token_num
        return(A) #messages+notifies of all tokens
def main():
        global printm, mnemonics, ignore, waitTime, looping
        start()
        mnemonics = read_mnemonics()
        ignore = read_ignore()
        getcache()
        while True:
                mes=messaging()
                if mes<0:
                        if mes==-2:
                                if check_inbox()>0: pass#printms()
                                else:
                                        print()
                                        printm=''
                        elif mes==-1:
                                looping = True
                                while (check_inbox()==0):
                                        print('-', end='')
                                        try:
                                                for timer in range(waitTime):
                                                        time.sleep(1)
                                        except KeyboardInterrupt:
                                                print()
                                                break
                                else:
                                        showprintm()
                                        printms()
                                looping = False
                        elif mes==-3: return
if __name__ == '__main__': main()
