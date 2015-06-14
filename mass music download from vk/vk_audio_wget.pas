program vk_audio_wget_fpc_to_bash;
uses SysUtils;
var a,b,c,d: text;
  h: char;
  s: array [0..10000] of record
    s: string;
    l: string;
  end;
  v,u,dir: string;
  i,j,n: integer;
begin
  assign(a,'vkopt');
  assign(b,'names');
  assign(c,'bashy.sh');
  assign(d,'samenames');
  reset(a);
  reset(b);
  rewrite(c);
  rewrite(d);
  i:=0;
  Writeln(c,'mkdir out');
  dir:='out';
  Readln(b); Readln(b);
  while not eof(a) do
  begin
    u:='wget -nc ';//Write(c,'wget -nc ');
    Read(a,h);
    While (h<>'?') and not eoln(a) do
    begin
      u:=u+h;//Write(c,h);
      Read(a,h);
    end;
    Readln(a);
    u:=u+' -O ';//Write(c,' -O ');
    inc(i);
    s[i].s:='';
    v:='';
    While not eoln(b) do
    begin
      Read(b,h);
      s[i].s:=s[i].s+h;
      if (h='`')or(h='"') then h:='''' else
      if (h='/')or(h='|')or(h='\')or(h=':') then h:=' ' else
      if (h='<') then h:='[' else if (h='>') then h:=']'; 
      if (h='(')or(h=')')or(h='[')or(h=']')or(h='&')or(h='$')or(h='=')
        or(h='''')or(h=' ')or(h='^')or(h='!') then v:=v+'\';//Write(c,'\');
      if (h<>'?')and(h<>'*') then v:=v+h;//Write(c,h);
    end;
    for j:=1 to length(s[i].s) do
      if (s[i].s[j]='–') then
      begin
        n:=j;
        break
      end;
    //dir:=copy(s[i].s,1,n-2);
    //Writeln(c,'mkdir ',dir);
    Writeln(c,u,dir,'/',v,'.mp3');
    Readln(b); Readln(b,s[i].l); Readln(b);
  end;
  n:=i;
  Writeln(d,n);
  for i:=1 to n-1 do
    for j:=i+1 to n do
    if (s[i].s=s[j].s)and(s[i].l<>s[j].l) then Writeln(d,i,' ',j,' # ',s[i].s);
  close(a);
  close(b);
  close(c);
  close(d);
end.
