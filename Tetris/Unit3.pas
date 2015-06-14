unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  TMF = class(TForm)
    buf: TBitmap;
    Panel1: TPanel;
    Timer1: TTimer;
    Button1: TButton;
    Button2: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type TPoint = record
  x,y: integer;
  c: TColor;
end;

var
  MF: TMF;
  buf: TBitMap;
  z: file of char;
  score: integer;
  w,h: integer;
  c,o,v: cardinal;
  kind: integer;
  a: array[1..4] of TPoint;
  b: boolean;
  gameover: boolean;

implementation

{$R *.dfm}


procedure TMF.FormPaint(Sender: TObject);
begin
  MF.canvas.draw(0,0,buf);
end;

procedure P(x,y: integer; color: TColor);
var i,j: integer;
begin
  for i:=(x-1)*c+1 to x*c-1 do
    for j:=(y-1)*c+1 to y*c-1 do
      MF.buf.Canvas.Pixels[i,j]:=color;
  MF.FormPaint(MF);
end;

function F(x,y: integer):TColor;
begin
  If y<=0 then Result:=clWhite
  else Result:=MF.buf.Canvas.Pixels[x*c-c shr 1,y*c-c shr 1];
end;

function rndcolor(x: integer):TColor;
begin
  case x of
  1:Result:=RGB(255,0,0);//random($100);
  2:Result:=RGB(0,128,0);//random($100)*$100;
  3:Result:=RGB(0,0,128);//random($100)*$10000;
  4:Result:=RGB(240,240,50);//random($100)*$101;
  5:Result:=RGB(0,128,255);//random($1000000);
  else Result:=RGB(255,0,255);//random($100)*$10001;
  end;
end;

function ravno(q,e: TPoint):boolean;
begin
  Result:=(q.x=e.x)and(q.y=e.y)
end;

procedure run(x1,y1,x2,y2,x3,y3,x4,y4: integer);
begin
  a[1].x:=x1;
  a[1].y:=y1;
  a[1].c:=rndcolor(random(6)+1);
  a[2].x:=x2;
  a[2].y:=y2;
  a[2].c:=a[1].c;
  a[3].x:=x3;
  a[3].y:=y3;
  a[3].c:=a[1].c;
  a[4].x:=x4;
  a[4].y:=y4;
  a[4].c:=a[1].c;
end;

procedure Eras(row: integer);
var i,j: integer;
begin
  for i:=row downto 1 do
    for j:=1 to w do
      P(j,i,f(j,i-1));
  Inc(score,2000);
  MF.Panel1.Caption:='Score: '+inttostr(Score div 100);
end;

procedure R;
begin
  If b then
    begin
      Eras(h);
      Dec(score,50);
      MF.Panel1.Caption:='Score: '+inttostr(Score div 100);
    end;
end;

procedure L(xf: integer);
var j:integer;
  z: array[1..4] of TPoint;
begin
  If b then exit;
  for j:=1 to 4 do
  begin
    z[j]:=a[j];
    z[j].x:=z[j].x+xf;
  end;
  If ((f(z[1].x,z[1].y)=clWhite)or ravno(z[1],a[1])or ravno(z[1],a[2])or ravno(z[1],a[3])or ravno(z[1],a[4]))
  and((f(z[2].x,z[2].y)=clWhite)or ravno(z[2],a[1])or ravno(z[2],a[2])or ravno(z[2],a[3])or ravno(z[2],a[4]))
  and((f(z[3].x,z[3].y)=clWhite)or ravno(z[3],a[1])or ravno(z[3],a[2])or ravno(z[3],a[3])or ravno(z[3],a[4]))
  and((f(z[4].x,z[4].y)=clWhite)or ravno(z[4],a[1])or ravno(z[4],a[2])or ravno(z[4],a[3])or ravno(z[4],a[4]))
  and((a[1].x>1)and(xf=-1)or(a[1].x<w)and(xf=1))
  and((a[2].x>1)and(xf=-1)or(a[2].x<w)and(xf=1))
  and((a[3].x>1)and(xf=-1)or(a[3].x<w)and(xf=1))
  and((a[4].x>1)and(xf=-1)or(a[4].x<w)and(xf=1)) then
  for j:=1 to 4 do
  begin
    P(a[j].x,a[j].y,clWhite);
    Inc(a[j].x,xf);
  end;
  for j:=1 to 4 do
    P(a[j].x,a[j].y,a[j].c);
end;

procedure StartRotation;
var j,nj:integer;
  z: array[1..4] of TPoint;
begin
  If kind=6 then exit;
  for j:=1 to 4 do
  begin
    z[j].x:=a[j].x-a[2].x;
    z[j].y:=a[j].y-a[2].y;
    nj:=a[2].x-z[j].y;
    z[j].y:=a[2].y+z[j].x;
    z[j].x:=nj;
  end;
  for j:=1 to 4 do
    P(a[j].x,a[j].y,clWhite);
  for j:=1 to 4 do
    begin
    a[j].x:=z[j].x;
    a[j].y:=z[j].y;
    P(a[j].x,a[j].y,a[j].c);
    end;
end;

procedure Rotate;
var j,nj:integer;
  z: array[1..4] of TPoint;
begin
  If b then exit;
  If kind=6 then exit;
  for j:=1 to 4 do
  begin
    z[j].x:=a[j].x-a[2].x;
    z[j].y:=a[j].y-a[2].y;
    nj:=a[2].x-z[j].y;
    z[j].y:=a[2].y+z[j].x;
    z[j].x:=nj;
  end;
  If ((f(z[1].x,z[1].y)=clWhite)or ravno(z[1],a[1])or ravno(z[1],a[2])or ravno(z[1],a[3])or ravno(z[1],a[4]))
  and((f(z[2].x,z[2].y)=clWhite)or ravno(z[2],a[1])or ravno(z[2],a[2])or ravno(z[2],a[3])or ravno(z[2],a[4]))
  and((f(z[3].x,z[3].y)=clWhite)or ravno(z[3],a[1])or ravno(z[3],a[2])or ravno(z[3],a[3])or ravno(z[3],a[4]))
  and((f(z[4].x,z[4].y)=clWhite)or(z[4].y=0)or ravno(z[4],a[1])or ravno(z[4],a[2])or ravno(z[4],a[3])or ravno(z[4],a[4]))
  and(z[1].y<=h)and(z[2].y<=h)and(z[3].y<=h)and(z[4].y<=h)
  and(z[1].x>0)and(z[1].x<=w)and(z[2].x>0)and(z[2].x<=w)and(z[3].x>0)and(z[3].x<=w)and(z[4].x>0)and(z[4].x<=w) then
  begin
  for j:=1 to 4 do
    P(a[j].x,a[j].y,clWhite);
  for j:=1 to 4 do
    begin
    a[j].x:=z[j].x;
    a[j].y:=z[j].y;
    P(a[j].x,a[j].y,a[j].c);
    end;
  end;
end;

procedure TMF.Timer1Timer(Sender: TObject);
var i,k,emptybonus: integer;
  z: array[1..4] of TPoint;
  full,empty: boolean;
begin
  If score>=0 then
  begin
    If 99900000 div v>score then Timer1.Interval:=100000000 div (100000+v*score)
    else Timer1.Interval:=1;
  end;
  If b then
  begin
//    If score>-2 then Inc(score,1);
    MF.Panel1.Caption:='Score: '+inttostr(Score div 100);
    gameover:=true;
    kind:=random(7)+1;
    case kind of
      1:run(w div 2,0,w div 2+1,0,w div 2+2,0,w div 2+3,0);
      2:run(w div 2,0,w div 2+1,0,w div 2+2,0,w div 2,-1);
      3:run(w div 2,0,w div 2+1,0,w div 2+2,0,w div 2+2,-1);
      4:run(w div 2+2,0,w div 2+1,0,w div 2+1,-1,w div 2,-1);
      5:run(w div 2,0,w div 2+1,0,w div 2+1,-1,w div 2+2,-1);
      6:run(w div 2+1,0,w div 2+2,0,w div 2+1,-1,w div 2+2,-1);
      7:run(w div 2,0,w div 2+1,0,w div 2+2,0,w div 2+1,-1);
    end;
    i:=random(4);
    for i:=1 to i do StartRotation;
  end;
  for i:=1 to 4 do
  begin
    z[i]:=a[i];
    z[i].y:=z[i].y+1;
  end;
  If ((f(z[1].x,z[1].y)=clWhite)or ravno(z[1],a[1])or ravno(z[1],a[2])or ravno(z[1],a[3])or ravno(z[1],a[4]))
  and((f(z[2].x,z[2].y)=clWhite)or ravno(z[2],a[1])or ravno(z[2],a[2])or ravno(z[2],a[3])or ravno(z[2],a[4]))
  and((f(z[3].x,z[3].y)=clWhite)or ravno(z[3],a[1])or ravno(z[3],a[2])or ravno(z[3],a[3])or ravno(z[3],a[4]))
  and((f(z[4].x,z[4].y)=clWhite)or(z[4].y=0)or ravno(z[4],a[1])or ravno(z[4],a[2])or ravno(z[4],a[3])or ravno(z[4],a[4]))
  and(a[1].y<h)and(a[2].y<h)and(a[3].y<h)and(a[4].y<h) then
  begin
    for i:=1 to 4 do
    begin
      P(a[i].x,a[i].y,clWhite);
      Inc(a[i].y);
    end;
    for i:=1 to 4 do
      P(a[i].x,a[i].y,a[i].c);
    b:=false;
    gameover:=false;
  end
  else
  begin
    If gameover then
    begin
      for i:=1 to h do R;
      If score>-100000 then score:=-100000;
      Button1.Caption:='YOU LOSE! But game isn''t over';
      Button1.Show;
    end;
    If score<0 then Timer1.Interval:=random(1000)+1;
    b:=true;
    i:=h+1;
    emptybonus:=0;
    While i>1 do
    begin
      Dec(i);
      full:=true;
      empty:=true;
      for k:=1 to w do full:=full and (f(k,i)<>clWhite);
      for k:=1 to w do empty:=empty and (f(k,i)=clWhite);
      If full then
      begin
        Eras(i);
        Inc(i);
      end;
      if empty then inc(emptybonus);
    end;
    if (emptybonus=h)and(score>0) then
    begin
      Button1.Caption:='YOU WON IN TETRIS!!';
      Button1.Show;
      Button2Click(MF);
      inc(score,100000);
    end;
    if score>0 then inc(score,emptybonus);
  end;
end;

procedure TMF.FormClose(Sender: TObject; var Action: TCloseAction);
var ch: char;
  e,i: integer;
begin
  Rewrite(z);
  ch:=chr(score shr 24);
  Write(z,ch);
  ch:=chr(score shr 16 and 255);
  Write(z,ch);
  ch:=chr(score shr 8 and 255);
  Write(z,ch);
  ch:=chr(Timer1.Interval shr 8);
  Write(z,ch);
  ch:=chr(score and 255);
  Write(z,ch);
  ch:=chr(Timer1.Interval and 255);
  Write(z,ch);
  ch:=chr(ord(b)+random(128)*2);
  Write(z,ch);
  for i:=1 to 4 do
  begin
    ch:=chr(a[i].x);
    Write(z,ch);
    ch:=chr(a[i].y);
    Write(z,ch);
    case a[i].c of
      255: ch:=chr(random(37)*6+1);
      32768: ch:=chr(random(37)*6+2);
      8388608: ch:=chr(random(37)*6+3);
      59110: ch:=chr(random(37)*6+4);
      16744448: ch:=chr(random(37)*6+5);
      else ch:=chr(random(37)*6);
    end;
    Write(z,ch);
  end;
  for e:=1 to h do
    for i:=1 to w do
    begin
      case f(i,e) of
        16777215: ch:=chr(random(37)*7);
        255: ch:=chr(random(37)*7+1);
        32768: ch:=chr(random(37)*7+2);
        8388608: ch:=chr(random(37)*7+3);
        59110: ch:=chr(random(37)*7+4);
        16744448: ch:=chr(random(37)*7+5);
        else ch:=chr(random(37)*7+6);
      end;
      Write(z,ch);
    end;
  CloseFile(z);
end;

procedure TMF.FormCreate(Sender: TObject);
var i,e: integer;
  ch:char;
begin
  Randomize;
  c:=15;
  o:=50;
  v:=3;
  gameover:=false;
  b:=true;
  MF.buf:=TBitMap.Create;
  MF.buf.Height:=MF.Height-o;
  MF.buf.Width:=MF.Width;
  w:=MF.Width div c;
  h:=(MF.Height-o) div c;
  for i:=1 to h do
  begin
    MF.buf.Canvas.MoveTo(0,i*c);
    MF.buf.Canvas.LineTo(w*c,i*c);
  end;
  for i:=1 to w do
  begin
    MF.buf.Canvas.MoveTo(i*c,0);
    MF.buf.Canvas.LineTo(i*c,h*c);
  end;
  AssignFile(z,'savegame.txt');
  Reset(z);
  Read(z,ch);
  e:=ord(ch);
  Read(z,ch);
  e:=e shl 8 + ord(ch);
  Read(z,ch);
  e:=e shl 8 + ord(ch);
  Read(z,ch);
  i:=ord(ch);
  Read(z,ch);
  e:=e shl 8 + ord(ch);
  Read(z,ch);
  i:=i shl 8 + ord(ch);
  score:=e;
  Timer1.Interval:=i;
  Read(z,ch);
  b:=odd(ord(ch));
  for i:=1 to 4 do
  begin
    Read(z,ch);
    a[i].x:=ord(ch);
    Read(z,ch);
    a[i].y:=ord(ch);
    Read(z,ch);
    case ord(ch) mod 6 of
        1:a[i].c:=RGB(255,0,0);
        2:a[i].c:=RGB(0,128,0);
        3:a[i].c:=RGB(0,0,128);
        4:a[i].c:=RGB(230,230,0);
        5:a[i].c:=RGB(0,128,255);
        0:a[i].c:=RGB(255,0,255);
      end;
  end;
  for e:=1 to h do
    for i:=1 to w do
    begin
      Read(z,ch);
      case ord(ch) mod 7 of
        0:P(i,e,RGB(255,255,255));
        1:P(i,e,RGB(255,0,0));
        2:P(i,e,RGB(0,128,0));
        3:P(i,e,RGB(0,0,128));
        4:P(i,e,RGB(230,230,0));
        5:P(i,e,RGB(0,128,255));
        6:P(i,e,RGB(255,0,255));
      end;
    end;
  Panel1.Caption:='Score: '+inttostr(score div 100);
end;

procedure Down;
begin
  MF.Timer1.Interval:=10;
end;

procedure Pausing;
begin
  If not MF.Button1.Visible then
  begin
    MF.Timer1.Enabled:=not MF.Timer1.Enabled;
    MF.Button2.Visible:=not MF.Button2.Visible;
  end;
end;

procedure TMF.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    $25:If MF.Timer1.Enabled then L(-1);
    $26:If MF.Timer1.Enabled then Rotate;
    $27:If MF.Timer1.Enabled then L(1);
    $28:If MF.Timer1.Enabled then Down;
    $13,$20:Pausing;
    $52:If MF.Timer1.Enabled then R;
  end;
end;

procedure TMF.Button1Click(Sender: TObject);
begin
  Button1.Hide;
end;

procedure TMF.Button2Click(Sender: TObject);
begin
  Pausing;
end;

procedure TMF.FormDeactivate(Sender: TObject);
begin
  MF.Timer1.Enabled:=false;
  MF.Button2.Visible:=true;
end;

end.