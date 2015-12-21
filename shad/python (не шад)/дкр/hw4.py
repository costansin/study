#1
class EqualsAnything(object):
    def __eq__(self, other):
        return True

#2
import math
class Vect3D:
    def __init__(self, x, y, z):
        self.x, self.y, self.z = x, y, z
    def __str__(self):
        return '(' + str(self.x) + ', ' + str(self.y) + ', ' + str(self.z) + ')'
    def __len__(self):
        return 3
    def __getitem__(self, key):
        if key==0: return self.x
        elif key==1: return self.y
        elif key==2: return self.z
        else: raise IndexError
    def __add__(self, other):
        return Vect3D(self.x + other.x, self.y + other.y, self.z + other.z)
    def __sub__(self, other):
        return Vect3D(self.x - other.x, self.y - other.y, self.z - other.z)
    def __mul__(self, other):
        return Vect3D(self.y * other.z - self.z * other.y, self.z * other.x - self.x * other.z, self.x * other.y - self.y * other.x)
    def __iadd__(self, other):
        self.x += other.x
        self.y += other.y
        self.z += other.z
        return self
    def __iadd__(self, other):
        self.x -= other.x
        self.y -= other.y
        self.z -= other.z
        return self
    def __imul__(self, other):
        x = self.y * other.z - self.z * other.y
        y = self.z * other.x - self.x * other.z
        z = self.x * other.y - self.y * other.x
        self.x, self.y, self.z = x, y, z
        return self
    def dot(self, other):
        return self.x * other.x +  self.y * other.y +  self.z * other.z
    def length(self):
        return math.sqrt(self.x * self.x +  self.y * self.y +  self.z * self.z)

#3
#a)
def select_even(l):
    return [x for x in l if not x&1]

#b)
def slice_odd(l):
    return l[::2] #если первый элемент считать первым, а не нулевым, иначе l[1::2]

#c)
def reverse_even(l):
    return [x for x in l if not x&1][::-1] #или reversed вместо [::-1]

#d)
def keys_by_value(d):
    return [x[0] for x in sorted(d.items(), key=lambda tupl: tupl[-1])]

#e)
def duplicates(l):
    lset = set(l)
    ans = set()
    for x in l:
        if x in lset: lset.remove(x)
        else: ans.add(x)
    return ans

#4
def Fib():
    x1 = 1
    x2 = 0
    while True:
        x3 = x1 + x2
        x1, x2 = x2, x3
        yield x3

#5
def diff_at(f, x, x0, order=1):
    return sympy.diff(f, x, order).subs(x, x0)

#6
import re, requests
def hse_capitalize(s):
        return s[0].upper() + s[1:]
class Employee:

    def __init__(self, page, fromdept=False):
        if fromdept:
            self.__t = page
            self.__r = True
            self.__name = self._hsematch('title="', '"')
            self.__page = "http://hse.ru" + self._hsematch('<div class="content__inner content__inner_foot1"><a href="', '"')
            self.__job = self._hsematch('<p class="with-indent7">', '</p>').replace(': <a class="link"', ':</span><a').split('<br>')
            self.__phone_numbers = self._hsematch('<div class="l-extra small">', '</div>', default='Job not found').split('<script>')[0].split('<br>')
            self.__true_init__(True)
        else:    
            self.__page = page
            self.__r = None

    def __true_init__(self, fromdept=False):
        if not fromdept:
            try: self.__r = requests.get(self.__page)
            except:
                self.__r = None
                exit
            self.__t = self.__r.text
            self.__name = self._hsematch('<span class="breadcrumb_current">', '</span>', default='Name not found')
            self.__job = self._hsematch('<ul class="g-ul g-list small"><li>', '</li></ul>', default='Job not found').replace('<span class="person-appointment-title">','').split('</li><li>')
            self.__phone_numbers = self._hsematch('</dt><dd>Телефон:<br>', '</dd><dd>').split('<br>')
        self.__aff = []
        if self.__job != ['Job not found']:
            for post_string in self.__job:
                post, dept_string = post_string.split(':</span>')
                for dept in dept_string.split(' / '):
                    dept_name = dept[dept.find('>')+1:-4]
                    self.__aff.append((Department.by_title(Department, dept_name), hse_capitalize(post)))
        self.__emails = self._hsematch('<script>hseEObfuscator(', ');</script>').strip('\n\t[]"').replace('","', '').split('"],["')
        #self.__interests = self._hsematch('<div class="b-person-data__inner b-person-data__tags">', '</a></div>').replace('<a class="tag tag_small" href="/org/persons/?intst=', '').split('</a>')
        self.__interests = re.findall('intst=.*?<|\\?elib=.*?<', self.__t) #просили только intst-интересы, но я добавлю и elib, но по keywords по числу only нельзя отличить одних от других! (нумерация у них вроде общая, elib!=intst)
        self.__keywords = []
        if self.__emails == ['']: self.__emails = 'No emails'
        if self.__phone_numbers[-1] == '': self.__phone_numbers.pop()
        if self.__phone_numbers == []: self.__phone_numbers = 'No phone numbers'
        if self.__interests==[]: self.__keywords = 'No keywords'
        else:
            for interest in self.__interests:
                two_strings = interest.split('">')
                self.__keywords.append((int(two_strings[0][6:]), two_strings[1][:-1]))
                
    def _hsematch(self, *tag, default=''):
            t0 = self.__t.find(tag[0])
            if t0 == -1: return default
            else: t0 += len(tag[0])
            return self.__t[t0:self.__t.find(tag[1], t0)]

    @property
    def homepage(self):
        return self.__page

    @property
    def full_name(self):
        if self.__r is None: self.__true_init__()
        return self.__name

    @property
    def affiliations(self):
        if self.__r is None: self.__true_init__()
        return self.__aff

    @property
    def emails(self):
        if self.__r is None: self.__true_init__()
        return self.__emails

    @property
    def phone_numbers(self):
        if self.__r is None: self.__true_init__()
        return self.__phone_numbers

    @property
    def keywords(self):
        if self.__r is None: self.__true_init__()
        return self.__keywords

#7
class Department:

    try:
        with open("init_page.txt", 'r', encoding='utf-8') as __f: _init_page = __f.read()
    except: 
        print("Department class initialization...")
        try: __init_page = requests.get("http://www.hse.ru/org/persons/?udept=97608491").text
        except:
            print("No internet!")
            exit
        else:
            with open("init_page.txt", 'w', encoding='utf-8') as __f: __f.write(_init_page)
            print("Completed!")

    __dept_to_title_string = _init_page[_init_page.find('<div class="grid">'):_init_page.find('<div class="b-side">')]
    __title_to_page_string = _init_page[_init_page.find('<span class="counter_level2">2.1'):_init_page.find('<span class="counter_level1">3')]
    _campuses = [campus.replace('<noindex>','') for campus in __dept_to_title_string.split('</noindex>')[:-1]]
    __detotitstr = ''.join([pair[0]+'</a><'+pair[1][16:] for pair in zip(_campuses, __dept_to_title_string.split('>Подразделения<')[1:])])
    _dept_to_title = {int(y[0]): hse_capitalize(y[1]) for y in [x[6:-4].split('">') for x in re.findall("udept=.*?</a>", __dept_to_title_string)] if y[0]}
    _title_to_dept = {title:[] for title in _dept_to_title.values()}
    for udept in _dept_to_title.keys():
        _title_to_dept.get(_dept_to_title[udept]).append(udept) #ambiguity!

    def __path_record(s, reg, flag=False): #really the only way to overcome the ambiguity problem for a correct udept <-> page
        ans = {}
        li = re.findall('<li|</li>', s)
        spr = re.split('<li|</li>', s)[1:]
        path = []
        for i,st in enumerate(spr):
            if li[i]=='<li':
                rem = re.search(reg, st)
                if rem:
                    dt, mch = rem.group()[6:-4].split('">')
                    if flag: dt = dt[:dt.find('"')]
                    elif dt: dt = int(dt)
                    path.append(hse_capitalize(mch))
                    if dt:
                        if flag: ans['#'.join(path)] = dt
                        else: ans[dt] = path.copy()
                else:
                    if flag:
                        rem = re.search('<h.?><span class.*</span>', st)
                        if rem:
                            mch = rem.group()[4:]
                            mch = mch[mch.find('>')+1: mch.rfind('<')]
                            path.append(hse_capitalize(mch))
            else: path.pop()
        return ans

    _dept_to_path = __path_record(__detotitstr, 'udept=.*?</a>')
    _path_to_page = __path_record('<li>'+__title_to_page_string[:-29].replace('<ins class="i"></ins>', ''), 'href=".*?</a>', True)
    _path_to_dept = dict(zip(['#'.join(dlist) for dlist in _dept_to_path.values()], _dept_to_path.keys()))
    def __dept_to_page(path_to_page, dept_to_path, udepts): #mother of God, sometimes i hate python: in a class u cant just s=0 \ [s for x in [1]]
        return {udept: path_to_page.get('#'.join(dept_to_path[udept])) for udept in udepts}
    _dept_to_page = __dept_to_page(_path_to_page, _dept_to_path, _dept_to_title.keys())
    _page_to_dept = {page:[] for page in _dept_to_page.values()}
    for dept in _dept_to_page.keys():
        _page_to_dept.get(_dept_to_page[dept]).append(dept) #ambiguity!
    
    def __init__(self, udept):
        self.__udept = udept
        self.__title = self._dept_to_title.get(udept)
        self.__page = self._dept_to_page.get(self.__udept, 'No homepage')
        self.__r = None

    def __true_init__(self): #only needed in staff method
        import time, datetime
        #print(datetime.datetime.fromtimestamp(time.time()))
        try: self.__r = requests.get("http://www.hse.ru/org/persons/?udept=" + str(self.__udept))
        except:
            self.__r = None
            exit
        #print(datetime.datetime.fromtimestamp(time.time()))
        self.__t = [self.__r.text] #на всякий случай будем хранить подгруженные страницы Department'а; очевидно, можно этого не делать
        if 'abc-filter__letter_all' not in self.__t[0]: #то нам повезло: Department гигантский, и сейчас мы будем грузить его побуквенно полтора часа
            letters = re.findall(';category=">.?', self.__t[0])
            print(letters[0][-1], end='')
            for ltr in letters[1:]: #assert, что если вкладки "Все" нет, то по умолчанию грузится первая буква, а не какая-то рандомная
                print(ltr[-1], end='')
                self.__t.append(requests.get("http://www.hse.ru/org/persons/?ltr=" + ltr[-1] + ";udept=" + str(self.__udept)).text)
            print()
        elif 'abc-filter__letter_current abc-filter__letter_all' not in self.__t[0]: #в udept=103790783 зачем-то по умолчанию грузятся не все, а буква А
            try: self.__r = requests.get("http://www.hse.ru/org/persons/?ltr=Все;udept=" + str(self.__udept))
            except:
                self.__r = None
                exit
            else: self.__t = [self.__r.text]
        self.__staff = []
        for page in self.__t:
            relist = re.findall('<div class="post person">.*?</div></div></div></div></div>', page, flags=re.DOTALL)
            for person in relist:
                emp = Employee(person, True)
                post = ''
                for job in emp.affiliations:
                    for dept in job[0]:
                        if dept.udept == self.__udept:
                            post = job[1]
                            break
                    if post: break
                else:
                    post = emp.affiliations
                self.__staff.append((emp, post))

    @property
    def staff(self):
        if self.__r is None: self.__true_init__()
        return self.__staff

    @property
    def title(self):
        return self.__title

    def by_title(cls, title): #mapping (title -> Department) is ambiguous
        return [Department(udept) for udept in cls._title_to_dept.get(title, [])]

    @property
    def homepage(self):
        return self.__page

    def by_homepage(cls, homepage): #mapping (homepage -> Department) is ambiguous too
        return [Department(x) for x in cls._page_to_dept.get(homepage)]

    @property
    def udept(self):
        return self.__udept
