unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Spin, ClipBrd;

type
  TMF = class(TForm)
    Button1: TButton;
    im: TImage;
    edt1: TEdit;
    edt2: TEdit;
    btn1: TButton;
    BitBtn1: TBitBtn;
    oddchx: TCheckBox;
    Button2: TButton;
    ClosureBtn: TBitBtn;
    SaveBtn: TBitBtn;
    degsn: TSpinEdit;
    ClrEdt: TLabeledEdit;
    ClearBtn: TBitBtn;
    Panel1: TPanel;
    Panel2: TPanel;
    NotEraseChx: TCheckBox;
    DownBtn: TBitBtn;
    musbtn: TBitBtn;
    gldnbtn: TBitBtn;
    qbtn: TBitBtn;
    function genclrd: TColor;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btn1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure imMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button2Click(Sender: TObject);
    procedure SaveBtnClick(Sender: TObject);
    procedure ClosureBtnClick(Sender: TObject);
    procedure ClearBtnClick(Sender: TObject);
    procedure imMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure imContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure oddchxClick(Sender: TObject);
    procedure NotEraseChxClick(Sender: TObject);
    procedure DownBtnClick(Sender: TObject);
    procedure musbtnClick(Sender: TObject);
    procedure gldnbtnClick(Sender: TObject);
    procedure qbtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
  leaf=record
    x1,y1,x2,y2: Integer;
    clr: TColor;
  end;

var
  MF: TMF;
  f: TBitMap;
  l: array of leaf;
  s: string;
  e1,e2: extended;

implementation

{$R *.dfm}

function TMF.genclrd: TColor;
begin
  if ClrEdt.Text='-' then genclrd:=Random($1000000) else //чтоб не вылетала ошибка
    try genclrd:=StrToInt(ClrEdt.Text);
    except genclrd:=Random($1000000); end;
end;

procedure TMF.FormCreate(Sender: TObject);
var a,v: integer; k: extended;
begin
  Randomize;
  e1:=0; e2:=0;
  s:='T';
  if oddchx.Checked then s:=s+'u';
  if NotEraseChx.Checked then s:=s+'n';
  SetLength(l,4);
  a:=300; v:=200; k:=sqrt(3)/2;
  l[1].x1:=v;
  l[1].y1:=v;
  l[1].x2:=v+a;
  l[1].y2:=v;
  l[1].clr:=clNavy;
  im.Canvas.Pen.Color:=l[1].clr;
  im.Canvas.MoveTo(l[1].x1,l[1].y1);
  im.Canvas.LineTo(l[1].x2,l[1].y2);
  l[2].x1:=l[1].x2;
  l[2].y1:=l[1].y2;
  l[2].x2:=v+a div 2;
  l[2].y2:=Round(v+k*a);
  l[2].clr:=clNavy;
  //img1.Canvas.Pen.Color:=l[2].clr;
  im.Canvas.LineTo(l[2].x2,l[2].y2);
  l[3].x1:=l[2].x2;
  l[3].y1:=l[2].y2;
  l[3].x2:=l[1].x1;
  l[3].y2:=l[1].y1;
  l[3].clr:=clNavy;
  //img1.Canvas.Pen.Color:=l[3].clr;
  im.Canvas.LineTo(l[3].x2,l[3].y2);
end;

procedure TMF.Button1Click(Sender: TObject);
var i,j,ll: Integer;
  t,k: extended;
  v,oddity,noterase: boolean;
  genclrr: TColor;
begin
  noterase:=NotEraseChx.Checked;
  genclrr:=genclrd;
  k:=Sqrt(3)/2;
  j:=Length(l);
  SetLength(l,Length(l) shl 2-3);
  v:=false;
  if e1<>StrToFloat(edt1.Text) then
  begin
    e1:=StrToFloat(edt1.Text);
    v:=true;
  end;
  if e2<>StrToFloat(edt2.Text) then
  begin
    e2:=StrToFloat(edt2.Text);
    v:=true;
  end;
  if v then s:=s+edt1.Text+'_'+edt2.Text;
  oddity:=oddchx.Checked;
  ll:=(Length(l)+3) shr 2 - 1;
  for i:=1 to ll do
  begin
    if not noterase then
    begin
      im.Canvas.Pen.Color:=clWhite;
      im.Canvas.MoveTo(l[i].x1,l[i].y1);
      im.Canvas.LineTo(l[i].x2,l[i].y2);
    end;
    im.Canvas.Pen.Color:=l[i].clr;
    im.Canvas.MoveTo(l[i].x1,l[i].y1);
    l[j].x1:=l[i].x1+Round((l[i].x2-l[i].x1)/3);
    l[j].y1:=l[i].y1+Round((l[i].y2-l[i].y1)/3);
    if oddity and (i>(ll+1) shr 1) then t:=-k/9 else t:=k/9;
    l[j].x2:=(l[i].x1+l[i].x2+1) div 2 + Round(e1*(l[i].y2-l[i].y1)*t);
    l[j].y2:=(l[i].y1+l[i].y2+1) div 2 - Round(e2*(l[i].x2-l[i].x1)*t);
    l[j].clr:=genclrr;
    im.Canvas.LineTo(l[j].x1,l[j].y1);
    Inc(j);
    l[j].x1:=l[j-1].x2;
    l[j].y1:=l[j-1].y2;
    l[j].x2:=l[i].x1+Round((l[i].x2-l[i].x1)/3*2);
    l[j].y2:=l[i].y1+Round((l[i].y2-l[i].y1)/3*2);
    l[j].clr:=genclrr;
    im.Canvas.Pen.Color:=l[j].clr;
    im.Canvas.LineTo(l[j].x1,l[j].y1);
    Inc(j);
    l[j].x1:=l[j-1].x2;
    l[j].y1:=l[j-1].y2;
    l[j].x2:=l[i].x2;
    l[j].y2:=l[i].y2;
    l[i].x2:=l[j-2].x1;
    l[i].y2:=l[j-2].y1;
    l[j].clr:=l[i].clr;
    im.Canvas.LineTo(l[j].x1,l[j].y1);
    im.Canvas.Pen.Color:=l[i].clr;
    im.Canvas.LineTo(l[j].x2,l[j].y2);
    Inc(j);
  end;
  s:=s+'k';
end;

procedure TMF.btn1Click(Sender: TObject);
//  var x: Integer;
begin
  im.Picture:=nil;
  if length(l)>3 then
  begin
    SetLength(l,1);
    im.Canvas.MoveTo(0,0);
    s:='';
    if oddchx.Checked then s:=s+'u';
    if NotEraseChx.Checked then s:=s+'n';
  end
  else
  FormCreate(MF);
end;

procedure TMF.BitBtn1Click(Sender: TObject);
var i,j,ll: Integer;
  t: extended;
  v,oddity,noterase: boolean;
  genclrr: TColor;
begin
  genclrr:=genclrd;
  noterase:=NotEraseChx.Checked;
  j:=Length(l);
  SetLength(l,Length(l)shl 1-1);
  v:=false;
  if e1<>StrToFloat(edt1.Text) then
  begin
    e1:=StrToFloat(edt1.Text);
    v:=true;
  end;
  if e2<>StrToFloat(edt2.Text) then
  begin
    e2:=StrToFloat(edt2.Text);
    v:=true;
  end;
  if v then s:=s+edt1.Text+'_'+edt2.Text;
  oddity:=not oddchx.Checked;
  ll:=(Length(l)-1) shr 1;
  for i:=1 to ll do
  begin
    //sgnp:=sgnp*sgn;
    if not noterase then
    begin
      im.Canvas.Pen.Color:=clWhite;
      im.Canvas.MoveTo(l[i].x1,l[i].y1);
      im.Canvas.LineTo(l[i].x2,l[i].y2);
    end;
    im.Canvas.Pen.Color:=l[i].clr;
    im.Canvas.MoveTo(l[i].x1,l[i].y1);
    if oddity and (i>(ll+1) shr 1) then t:=-1/6 else t:=1/6;
    l[j].x1:=(l[i].x1+l[i].x2+1) div 2 + Round(e1*(l[i].y2-l[i].y1)*t);
    l[j].y1:=(l[i].y1+l[i].y2+1) div 2 - Round(e2*(l[i].x2-l[i].x1)*t);
    im.Canvas.Pen.Color:=l[i].clr;
    im.Canvas.LineTo(l[j].x1,l[j].y1);
    l[j].x2:=l[i].x2;
    l[j].y2:=l[i].y2;
    l[j].clr:=genclrr;
    im.Canvas.Pen.Color:=l[j].clr;
    im.Canvas.LineTo(l[j].x2,l[j].y2);
    l[i].x2:=l[j].x1;
    l[i].y2:=l[j].y1;
    Inc(j);
  end;
  s:=s+'d';
end;


procedure TMF.Button2Click(Sender: TObject);
var i,j,ll: Integer;
  t,k: extended;
  v,oddity,noterase: boolean;
  genclrr: TColor;
begin
  noterase:=NotEraseChx.Checked;
  genclrr:=genclrd;
  //k:=sqrt(2)/2;    t=5*k/36
  k:=sqrt(3)/2;
  j:=Length(l);
  SetLength(l,Length(l)*3-2);
  v:=false;
  if e1<>StrToFloat(edt1.Text) then
  begin
    e1:=StrToFloat(edt1.Text);
    v:=true;
  end;
  if e2<>StrToFloat(edt2.Text) then
  begin
    e2:=StrToFloat(edt2.Text);
    v:=true;
  end;
  if v then s:=s+edt1.Text+'_'+edt2.Text;
  oddity:=oddchx.Checked;
  ll:=(Length(l)-1)div 3;
  for i:=1 to ll do
  begin
    if not noterase then
    begin
      im.Canvas.Pen.Color:=clWhite;
      im.Canvas.MoveTo(l[i].x1,l[i].y1);
      im.Canvas.LineTo(l[i].x2,l[i].y2);
    end;
    im.Canvas.MoveTo(l[i].x1,l[i].y1);
    if oddity and (i>(ll+1) shr 1) then t:=-k/9 else t:=k/9;
    l[j].x1:=(l[i].x1+l[i].x2+1) div 2 + Round(e1*(l[i].y2-l[i].y1)*t);
    l[j].y1:=(l[i].y1+l[i].y2+1) div 2 - Round(e2*(l[i].x2-l[i].x1)*t);
    l[j].x2:=(l[i].x1+l[i].x2+1) div 2 - Round(e1*(l[i].y2-l[i].y1)*t);
    l[j].y2:=(l[i].y1+l[i].y2+1) div 2 + Round(e2*(l[i].x2-l[i].x1)*t);
    l[j].clr:=l[i].clr;
    l[i].clr:=genclrr;
    im.Canvas.Pen.Color:=l[i].clr;
    im.Canvas.LineTo(l[j].x1,l[j].y1);
    im.Canvas.Pen.Color:=l[j].clr;
    im.Canvas.LineTo(l[j].x2,l[j].y2);
    im.Canvas.Pen.Color:=l[i].clr;
    im.Canvas.LineTo(l[i].x2,l[i].y2);
    inc(j);
    l[j].x1:=l[j-1].x2;
    l[j].y1:=l[j-1].y2;
    l[j].x2:=l[i].x2;
    l[j].y2:=l[i].y2;
    l[j].clr:=l[j-1].clr;
    l[i].x2:=l[j-1].x1;
    l[i].y2:=l[j-1].y1;
    Inc(j);
  end;
  s:=s+'t';
end;


procedure TMF.gldnbtnClick(Sender: TObject);
var i,j,ll: Integer;
  t: extended;
  v,oddity,noterase: boolean;
  genclrr: TColor;
begin
  genclrr:=genclrd;
  noterase:=NotEraseChx.Checked;
  j:=Length(l);
  SetLength(l,Length(l)shl 1-1);
  v:=false;
  if e1<>StrToFloat(edt1.Text) then
  begin
    e1:=StrToFloat(edt1.Text);
    v:=true;
  end;
  if e2<>StrToFloat(edt2.Text) then
  begin
    e2:=StrToFloat(edt2.Text);
    v:=true;
  end;
  if v then s:=s+edt1.Text+'_'+edt2.Text;
  oddity:=not oddchx.Checked;
  ll:=(Length(l)-1) shr 1;
  for i:=1 to ll do
  begin
    //sgnp:=sgnp*sgn;
    if not noterase then
    begin
      im.Canvas.Pen.Color:=clWhite;
      im.Canvas.MoveTo(l[i].x1,l[i].y1);
      im.Canvas.LineTo(l[i].x2,l[i].y2);
    end;
    im.Canvas.Pen.Color:=l[i].clr;
    im.Canvas.MoveTo(l[i].x1,l[i].y1);
    if oddity and (i>(ll+1) shr 1) then t:=-1/6 else t:=1/6;
    l[j].x1:=(l[i].x1+l[i].x2+1) div 2 + Round(e1*(l[i].y2-l[i].y1)*t);
    l[j].y1:=(l[i].y1+l[i].y2+1) div 2 - Round(e2*(l[i].x2-l[i].x1)*t);
    im.Canvas.Pen.Color:=l[i].clr;
    im.Canvas.LineTo(l[j].x1,l[j].y1);
    l[j].x2:=l[i].x2;
    l[j].y2:=l[i].y2;
    l[j].clr:=genclrr;
    im.Canvas.Pen.Color:=l[j].clr;
    im.Canvas.LineTo(l[j].x2,l[j].y2);
    l[i].x2:=l[j].x1;
    l[i].y2:=l[j].y1;
    Inc(j);
  end;
  s:=s+'g';
end;

procedure TMF.btn1ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin
  SetLength(l,1);
  s:=s+'r';
  {l[1].x1:=400;
  l[1].y1:=200;
  l[1].x2:=600;
  l[1].y2:=400;
  img1.Canvas.Pen.Color:=clNavy;
  img1.Canvas.MoveTo(l[1].x1,l[1].y1);
  img1.Canvas.LineTo(l[1].x2,l[1].y2);}
end;

procedure TMF.imMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  setlength(l,length(l)+1);
  l[length(l)-1].x1:=x;
  l[length(l)-1].y1:=y;
  im.Canvas.Pen.Color:=clNavy;
  im.Canvas.MoveTo(x,y);
  s:=s+inttostr(x)+' '+inttostr(y)+' ';
end;

procedure TMF.imMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  l[length(l)-1].x2:=x;
  l[length(l)-1].y2:=y;
  l[length(l)-1].clr:=genclrd;
  im.Canvas.LineTo(x,y);
  s:=s+inttostr(x)+' '+inttostr(y)+' ';
end;

procedure TMF.SaveBtnClick(Sender: TObject);
begin
  im.Picture.SaveToFile(s+'-'+chr(65+random(26))+chr(65+random(26))+'.bmp');
end;

procedure TMF.ClosureBtnClick(Sender: TObject);
var g: TBitMap;
  x,y,xx,yy,t,sum,p: integer;
begin
  g:=TBitMap.Create;
  g.Width:=im.Width;
  g.Height:=im.Height;
  p:=degsn.Value;
  for x:=1 to g.Width-2 do
    for y:=1 to g.Height-2 do
    begin
      if im.Canvas.Pixels[x,y]<>clWhite then
      g.Canvas.Pixels[x,y]:=im.Canvas.Pixels[x,y] else
      begin
        t:=0;
        sum:=0;
        for xx:=x-1 to x+1 do
          for yy:=y-1 to y+1 do
          if im.Canvas.Pixels[xx,yy]<>clWhite then
          begin
            inc(sum,im.Canvas.Pixels[xx,yy]);
            inc(t);
          end;
        if t>=p then g.Canvas.Pixels[x,y]:=sum div t;
      end;
    end;
  im.Canvas.Draw(0,0,g);
  s:=s+'c'+inttostr(p); 
end;

procedure TMF.ClearBtnClick(Sender: TObject);
begin
  im.Picture:=nil;
  im.Canvas.MoveTo(0,0);
end;

procedure TMF.imMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  Panel1.Caption:=inttostr(x)+' '+inttostr(y);
  Panel2.Caption:=inttostr(im.Canvas.Pixels[x,y]);
  Panel2.Color:=im.Canvas.Pixels[x,y];
end;

procedure TMF.imContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin
  ClipBoard.AsText:=Panel2.Caption;
end;

procedure TMF.oddchxClick(Sender: TObject);
begin
  if s[length(s)]='u' then setlength(s,length(s)-1) else s:=s+'u'
end;

procedure TMF.NotEraseChxClick(Sender: TObject);
begin
  if s[length(s)]='n' then setlength(s,length(s)-1) else s:=s+'n'
end;

procedure TMF.DownBtnClick(Sender: TObject);
var minx, miny, maxx, maxy, i: integer;
//  r,k: TRect;
const brd=40;
begin
  {r.Left:=200; r.Top:=200; r.Right:=300; r.Bottom:=300;
  r.Left:=0; r.Top:=0; r.Right:=100; r.Bottom:=100;
  im.Canvas.CopyRect(k,im.Canvas,r);
  это всЄ дл€ поиска минимума из концов отрезков дл€ красивого сохранени€}
  maxx:=l[length(l)-1].x2;
  minx:=maxx;
  maxy:=l[length(l)-1].y2;
  miny:=maxy;
  for i:=1 to length(l)-1 do
  begin
    if l[i].x1>maxx then maxx:=l[i].x1;
    if l[i].y1>maxy then maxy:=l[i].y1;
    if l[i].x1<minx then minx:=l[i].x1;
    if l[i].y1<miny then miny:=l[i].y1;
  end;
  for i:=1 to length(l)-1 do //Ќа случай разрывности
  begin
    if l[i].x2>maxx then maxx:=l[i].x2;
    if l[i].y2>maxy then maxy:=l[i].y2;
    if l[i].x2<minx then minx:=l[i].x2;
    if l[i].y2<miny then miny:=l[i].y2;
  end;
  im.Width:=maxx-minx+brd shl 1;
  im.Height:=maxy-miny+brd shl 1;
  for i:=1 to length(l)-1 do
  begin
    l[i].x1:=l[i].x1-minx+brd;
    l[i].x2:=l[i].x2-minx+brd;
    l[i].y1:=l[i].y1-miny+brd;
    l[i].y2:=l[i].y2-miny+brd;
  end;
  im.Picture:=nil;
  for i:=1 to length(l)-1 do
  begin
    im.Canvas.Pen.Color:=l[i].clr;
    im.Canvas.MoveTo(l[i].x1,l[i].y1);
    im.Canvas.LineTo(l[i].x2,l[i].y2);
  end;
end;

procedure TMF.musbtnClick(Sender: TObject);
var fi: extended; h: integer;
  procedure golden(x,y: integer);
  var q,l: integer;
  begin
    l:=y-x;
    q:=Round(l*fi)+x;
    im.Canvas.MoveTo(q,h);
    im.Canvas.LineTo(q,h-abs(l));
    //im.Canvas.Pixels[q,h-l]:=genclrr;
    if abs(x-y)>1 then
    begin
      golden(x,q);
      golden(y,q);
    end
  end;

begin
  im.Canvas.Pen.Color:=genclrd;
  fi:=(sqrt(5)-1)/2;
  h:=im.Height;
  golden(0,im.Width);
end;


procedure TMF.qbtnClick(Sender: TObject);
const z=2520;

  function gcd(a,b: integer): integer;
  begin
    if b<>0 then Result:=gcd(b,a mod b)
    else Result:=a;
  end;

var p,q,i,w,h: integer; genclrr: TColor;
begin
  w:=im.Width; h:=im.Height;
  {im.Canvas.Pen.Color:=genclrd; //}  genclrr:=genclrd;
  for i:=1 to z do
  begin
    q:=gcd(z,i);
    p:=i div q;
    q:=z div q;
    {im.Canvas.MoveTo(Round(i*w/z),h);
    im.Canvas.LineTo(Round(i*w/z),h-p-q);
//}  im.Canvas.Pixels[Round(i*w/z),h-p-q]:=genclrr;
  end;
end;

end.
