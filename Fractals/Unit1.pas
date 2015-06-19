unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Spin, Math, Menus, ComCtrls, Buttons, Gauges, ClipBrd;

type
  TMF = class(TForm)
    Paintb: TButton;
    lbl1: TLabel;
    lbl2: TLabel;
    e1: TEdit;
    e2: TEdit;
    e3: TEdit;
    e4: TEdit;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    se1: TSpinEdit;
    lbl11: TLabel;
    se7: TSpinEdit;
    se8: TSpinEdit;
    se9: TSpinEdit;
    se10: TSpinEdit;
    se11: TSpinEdit;
    se12: TSpinEdit;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    lbl17: TLabel;
    lbl18: TLabel;
    lbl19: TLabel;
    lbl20: TLabel;
    chk1: TCheckBox;
    edt1: TEdit;
    edt2: TEdit;
    edt3: TEdit;
    edt4: TEdit;
    edt5: TPanel;
    edt6: TPanel;
    lbl21: TLabel;
    lbl22: TLabel;
    lbl23: TLabel;
    se2: TEdit;
    e: TImage;
    chk2: TCheckBox;
    cbb1: TComboBoxEx;
    se3: TSpinEdit;
    lbl24: TLabel;
    lbl25: TLabel;
    lbl26: TLabel;
    e7: TEdit;
    e8: TEdit;
    lbl27: TLabel;
    se4: TSpinEdit;
    lbl28: TLabel;
    lbl29: TLabel;
    se5: TSpinEdit;
    Label1: TLabel;
    Exponent: TCheckBox;
    BitBtn1: TBitBtn;
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn2: TBitBtn;
    edt7: TPanel;
    nfracbtn: TPanel;
    kfracbtn: TPanel;
    mfracbtn: TPanel;
    nfracedt: TEdit;
    kfracedt: TEdit;
    mfracedt: TEdit;
    SearchSpEd: TSpinEdit;
    SearchBtn: TPanel;
    Stochastic_label: TStaticText;
    stochastic_edt: TEdit;
    Bevel: TBevel;
    SaveBtn: TBitBtn;
    chk1a: TCheckBox;
    ImportBtn: TBitBtn;
    OpenDial: TOpenDialog;
    chtofile: TCheckBox;
    width_spn: TSpinEdit;
    height_spn: TSpinEdit;
    widthlabel: TLabel;
    heightlabel: TLabel;
    multiplylabel: TLabel;
    multiply_spn: TSpinEdit;
    Gauge: TGauge;
    RofBlack_spn: TSpinEdit;
    GofBlack_spn: TSpinEdit;
    BofBlack_spn: TSpinEdit;
    Blackbtn: TPanel;
    NotPaintBtn: TPanel;
    ResetNotPaintBtn: TPanel;
    StopBtn: TBitBtn;
    ShowNPAChk: TCheckBox;
    totlcrzxhk: TCheckBox;
    SymBtn: TBitBtn;
    NaturBtn: TBitBtn;
    AcceptBtn: TBitBtn;
    SmoothBtn: TBitBtn;
    LoadBtn: TBitBtn;
    MultiplBorderBtn: TBitBtn;
    Smoothchx: TCheckBox;
    TwoStripesChx: TCheckBox;
    SaveBlackChx: TCheckBox;
    SaveBlackLbl: TLabel;
    SOVBtn: TBitBtn;
    binarfunctioncbb: TComboBox;
    qlrspn: TSpinEdit;
    shspn: TSpinEdit;
    qlrLbl: TLabel;
    shLbl: TLabel;
    onlyblackChx: TCheckBox;
    Transformchx: TCheckBox;
    ZoomScroll: TScrollBar;
    CancelScroll: TButton;
    NotBlackChx: TCheckBox;
    Floatxorchx: TCheckBox;
    Japanchx: TCheckBox;
    CardioidBtn: TBitBtn;
    Answer: TBitBtn;
    RandomQBtn: TBitBtn;
    NormalizeChx: TCheckBox;
    OvernormalizeChx: TCheckBox;
    ScrollBar1: TScrollBar;
    inversechx: TCheckBox;
    invedt: TEdit;
    procedure savetohistory(ttr: char);
    procedure OldImport(s: TFileName);
    procedure inpooot;
    procedure drawin;
    procedure PaintbClick(Sender: TObject);
    procedure chk1Click(Sender: TObject);
    procedure eMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure eMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure eMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure eContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure se4Change(Sender: TObject);
    procedure se3Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure kfracbtnClick(Sender: TObject);
    procedure nfracbtnClick(Sender: TObject);
    procedure mfracbtnClick(Sender: TObject);
    procedure SearchBtnClick(Sender: TObject);
    procedure SaveBtnClick(Sender: TObject);
    procedure ImportBtnClick(Sender: TObject);
    procedure chtofileClick(Sender: TObject);
    procedure multiply_spnChange(Sender: TObject);
    procedure BlackbtnClick(Sender: TObject);
    procedure NotPaintBtnClick(Sender: TObject);
    procedure ResetNotPaintBtnClick(Sender: TObject);
    procedure StopBtnClick(Sender: TObject);
    procedure SymBtnClick(Sender: TObject);
    procedure NaturBtnClick(Sender: TObject);
    procedure AcceptBtnClick(Sender: TObject);
    procedure SmoothBtnClick(Sender: TObject);
    procedure LoadBtnClick(Sender: TObject);
    procedure MultiplBorderBtnClick(Sender: TObject);
    procedure SOVBtnClick(Sender: TObject);
    procedure ZoomScrollChange(Sender: TObject);
    procedure CancelScrollClick(Sender: TObject);
    procedure CardioidBtnClick(Sender: TObject);
    procedure AnswerClick(Sender: TObject);
    procedure RandomQBtnClick(Sender: TObject);
    procedure DragonBtnClick(Sender: TObject);
  end;

type
  double=extended;
  TComplex=record
  x,y:Double;
  end;

var
  MF: TMF;
  f: TBitmap;
  xx,yy,xxx,yyy,w,h,black,start_of_draw: Integer;
  cbb:integer;//string;
  ee1,ee2,ee3,ee4,ee7,ee8,et1,et2,et3,et4,inf,stocheps,inversion_shift_plus,inverse_shift: Double;
  MO,Fl,fl1,fl2,fl3,fl4,fl7,fl8,ch1,ch2,notpaint,stopped,shownpas,sov,ch1a,
   notblack,floatxoring,searching,expch,tofile,fix_import_bug,totlcrz,saveblack,
   blackonly,transform,japan,smoothy,twostripes,invchx: Boolean;
  colorpd:array of TColor;
  ar:array[0..16777216] of record
    x,y: integer;
    end;
  notpaintares: array of record
    x1,x2,y1,y2: double;
  end;
  znt,cnt,vnt: TComplex;
  Lsearch,Rsearch,Usearch,Dsearch: double;

implementation

{$R *.dfm}

function xm(x: double):Integer;
var d: Extended;
begin
  d:=(x-et1)*w/(et3-et1);
  If (d<0)or(d>w) then Result:=-1
  else Result:=Round(d);
end;

function ym(y: double):Integer;
var d: Extended;
begin
  d:=(y-et2)*h/(et4-et2);
  If (d<0)or(d>h) then Result:=-1
  else Result:=Round(d);
end;

function xr(x: integer): double;
begin
  xr:=et1+x*(et3-et1)/w
end;

function yr(y: integer): double;
begin
  yr:=et2+y*(et4-et2)/h
end;

function Absq(z: TComplex): Double;
begin
  case cbb of
  1: {|x|} if abs(z.y)>1E2065 then Absq:=1E2065 else Absq:=Abs(z.x);
  2: {|y|} if abs(z.x)>1E2065 then Absq:=1E2065 else Absq:=Abs(z.y);
  3: {|Min(x,y)|} Absq:=Abs(Min(z.x,z.y));
  4: {|Max(x,y)|} Absq:=Abs(Max(z.x,z.y));
  5: {|x|+|y|}  Absq:=Abs(z.x)+Abs(z.y);
  6: {||x|-|y||}  Absq:=Abs(Abs(z.x)-Abs(z.y));
  7: {|x+y|}  Absq:=Abs(z.x+z.y);
  8: {|x-y|}  Absq:=Abs(z.x-z.y);
  9: {|x*y|} if (abs(z.x)>1E2065)or(abs(z.y)>1E2065) then Absq:=1E2065 else Absq:=Abs(z.x*z.y);
  10: {|||x+y|-|x||-|x-y||} Absq:=abs(abs(abs(z.x+z.y)-abs(z.x))-abs(z.x-z.y));
  11: {||x+y|/2+|x-y|/2+|x|+|y||} Absq:=abs(abs(z.x+z.y)/2+abs(z.x-z.y)/2+abs(z.x)+abs(z.y));
  else {|z|} begin cbb:=0; Absq:=z.x*z.x+z.y*z.y; end;
  end;
end;
//if (z.x=0)or(z.y=0) then Absq:=inf+3 else Absq:=Abs(z.x/z.y+z.y/z.x);

function Sqrd(a: double):Double;
begin
  If (cbb=0)or(cbb=9) then Sqrd:=a*a
  else Sqrd:=a;
end;

function Complex(x,y: Double):TComplex;
begin
  Result.x:=x; Result.y:=y;
end;

function Conj(z: TComplex):TComplex;
begin
  Result.x:=z.x; Result.y:=-z.y;
end;

function Neg(z: TComplex):TComplex;
begin
  neg.x:=-z.x; neg.y:=-z.y
end;

function sum(z1,z2: TComplex):TComplex;
begin
  sum.x:=z1.x+z2.x;
  sum.y:=z1.y+z2.y
end;

function mul(z1,z2: TComplex):TComplex;
begin
  mul.x:=z1.x*z2.x-z1.y*z2.y;
  mul.y:=z1.x*z2.y+z2.x*z1.y
end;

function dev(z1,z2: TComplex):TComplex;
var z3: TComplex;
    ab: Double;
begin
  ab:=z2.x*z2.x+z2.y*z2.y;
  if ab=0 then
  begin
    dev:=Complex(Maxint,Maxint);
    exit;
  end;
  z3:=Conj(z2);
  z3:=mul(z1,z3);
  dev:=Complex(z3.x/ab,z3.y/ab)
end;

function QPower(zz: TComplex; n: integer; u: extended):TComplex;
var zzz: TComplex;
  R,fi,abss: extended;
  function p(n: integer):TComplex;
  begin
    If n=0 then
    begin
      Result:=Complex(1,0);
    end
    else
    If odd(n) then Result:=mul(p(n-1),zz)
    else
    begin
      Result:=p(n shr 1);
      Result:=mul(result,result)
    end;
  end;
begin
  if u<>0 then
  begin
    abss:=zz.x*zz.x+zz.y*zz.y;
    if abss=0 then R:=0
     else  R:=exp(u*ln(abss)/2);
    //atctan2(y,x)   //atest: z^3+c
    fi:=u*arctan2(zz.y,zz.x);
    {if zz.x>0 then fi:=u*arctan(zz.y/zz.x)
       else if zz.x<0 then fi:=u*(pi+arctan(zz.y/zz.x))
         else if zz.y>=0 then fi:=u*pi/2
           else fi:=-u*pi/2;}
    Result:=Complex(R*cos(fi),R*sin(fi));
  end
  else
  If n<0 then
  begin
    zzz:=Complex(1,0);
    Result:=dev(zzz,QPower(zz,-n,0))
  end
  else result:=p(n);
end;

function expz(z: TComplex):TComplex;
begin
  if (z.x>5678.2617031470719747459655389855) {sqrt(ln 2^2^14)} then
  begin
    Result:=Complex(inf,inf);
    exit;
  end;
  Result:=Complex(exp(z.x)*cos(z.y), exp(z.x)*sin(z.y));
end;

function Logz(z: TComplex):TComplex;
var abss: Double;
begin
  abss:=z.x*z.x+z.y*z.y;
  if abss=0 then Result.x:=inf
  else Result.x:=ln(abss)/2;
  Result.y:=arctan2(z.y,z.x);
end;

function Sinz(z: TComplex): TComplex;
begin
  Result:=dev(sum(Expz(mul(z,Complex(0,1))),Neg(Expz(mul(z,Complex(0,-1))))),Complex(0,2));
end;

function Cosz(z: TComplex): TComplex;
begin
  Result:=dev(sum(Expz(mul(z,Complex(0,1))),Expz(mul(z,Complex(0,-1)))),Complex(2,0));
end;

function Tanz(z: TComplex): TComplex;
begin
  Result:=dev(sinz(z),cosz(z));
end;

function Shinz(z: TComplex): TComplex;
begin
  Result:=dev(sum(Expz(z),Neg(Expz(Neg(z)))),Complex(2,0));
end;

function Chosz(z: TComplex): TComplex;
begin
  Result:=dev(sum(Expz(z),Expz(Neg(z))),Complex(2,0));
end;

function Thanz(z: TComplex): TComplex;
begin
  Result:=dev(shinz(z),chosz(z));
end;

function hd(g: double):Integer;
begin
  hd:=Round(g);
  If Result<0 then Result:=255-Result;
end;

var v1,v2,v3,u1,u2,u3: integer;
  k,n,m,iter: integer;
  kex,nex,mex: extended;
  typ,sh: integer;
  qlr: cardinal;
  start_colors: integer;

procedure TMF.inpooot;
var i: integer;
begin
  japan:=japanchx.Checked;
  floatxoring:=Floatxorchx.Checked;
  tofile:=chtofile.Checked;
  NotPaintBtn.Color:=clBtnFace;
  start_of_draw:=0;
  shownpas:=ShowNPAChk.Checked;
  iter:=se1.Value;
  typ:=binarfunctioncbb.ItemIndex;
  if sov then
  begin
    sh:=shspn.Value;
    qlr:=qlrspn.Value;
    blackonly:=onlyblackChx.Checked;
    iter:=min(w,h);
  end;
  notblack:=NotBlackChx.Checked;
  transform:=Transformchx.Checked;
  ch1:=chk1.Checked;
  ch1a:=ch1a and chk1a.Checked;
  u1:=MF.se7.Value;   v1:=MF.se8.Value-u1;
  u2:=MF.se9.Value;   v2:=MF.se10.Value-u2;
  u3:=MF.se11.Value;  v3:=MF.se12.Value-u3;//Round(clWhite-clWhite/p*iter) $380000
  if ch1a then start_colors:=length(colorpd) else start_colors:=1;
  setlength(colorpd,iter+1);
  if ch1 or ch1a then for i:=start_colors to iter do colorpd[i]:=random($1000000)
  else for i:=1 to iter do
    colorpd[i]:=RGB(hd(v1/i*iter+u1),hd(v2/i*iter+u2),hd(v3/i*iter+u3));
  savetohistory('C');  
  ch1a:=true;
  et1:=StrToFloat(edt1.text);
  et2:=StrToFloat(edt2.text);
  et3:=StrToFloat(edt3.text);
  et4:=StrToFloat(edt4.text);
  if sov then exit;
  saveblack:=SaveBlackChx.Checked;
  if cbb1.ItemIndex<>-1 then cbb:=cbb1.ItemIndex;
  Fl1:=e1.Text='-';
  Fl2:=e2.Text='-';
  Fl3:=e3.Text='-';
  Fl4:=e4.Text='-';
  Fl7:=e7.Text='-';
  Fl8:=e8.Text='-';
  invchx:=inversechx.Checked;
  inversion_shift_plus:=StrToFloat(invedt.Text);
  ch2:=chk2.Checked;
  stocheps:=StrToFloat(stochastic_edt.text);
  expch:=Exponent.Checked;
  If not fl1 then ee1:=StrToFloat(e1.Text);
  If not fl2 then ee2:=StrToFloat(e2.Text);
  If not fl3 then ee3:=StrToFloat(e3.Text);
  If not fl4 then ee4:=StrToFloat(e4.Text);
  If not fl7 then ee7:=StrToFloat(e7.Text);
  If not fl8 then ee8:=StrToFloat(e8.Text);
  inf:=StrToFloat(se2.Text);
  n:=se3.Value;
  m:=se4.Value;
  k:=se5.Value;
  if nfracbtn.Tag=0 then nex:=0
    else if nfracbtn.Tag=1 then nex:=StrToFloat(nfracedt.Text)
      else exit;
  if mfracbtn.Tag=0 then mex:=0
    else if mfracbtn.Tag=1 then mex:=StrToFloat(mfracedt.Text)
      else exit;
  if kfracbtn.Tag=0 then kex:=0
    else if kfracbtn.Tag=1 then kex:=StrToFloat(kfracedt.Text)
      else exit;
  totlcrz:=totlcrzxhk.Checked;
  black:=RGB(RofBlack_spn.Value,GofBlack_spn.Value,BofBlack_spn.Value);
end;

var mus: array [-1..1001,-1..1001] of integer;
  absqz: integer;
  absqzz: double;
  cht: array of record
    z:TComplex;
    i: integer;
  end;

procedure addcht(z: TComplex; i: integer);
begin
  if Absq(sum(z,neg(cht[length(cht)-1].z)))>0.03 then
  begin
    setlength(cht,length(cht)+1);
    cht[length(cht)-1].z:=z;
    cht[length(cht)-1].i:=i;
  end;
end;

const  epsmus=0.1;
procedure TMF.drawin;
var
  x,y: cardinal;
  i,q: Integer;
  z,c,v,stoch: TComplex;
  g: TBitmap;
label jumptoxorin;
  function bin(a,b: cardinal; t: integer) :cardinal;
  begin
    case t of
      1: Result:=a or b;
      2: Result:=a xor b;
      3: Result:=not (a and b);
      4: Result:=not (a or b);
      5: Result:=not (a xor b);
      6: Result:=not a or b;
      7: Result:=a or not b;
      8: Result:=a and not b;
      9: Result:=not a and b;
      else Result:=a and b;
    end;
  end;
  function floatxor(x,y: double): double;
  var a,b,c: cardinal;
    s: extended;
    const k=4294967296;
  begin
    Result:=sign(x)*sign(y); x:=abs(x); y:=abs(y);
    a:=trunc(x); b:=trunc(y); c:=bin(a,b,typ); s:=c;
    x:=frac(x)*k; y:=frac(y)*k;
    a:=trunc(x); b:=trunc(y); c:=bin(a,b,typ); s:=s+c/k;
    x:=frac(x)*k; y:=frac(y)*k;
    a:=trunc(x); b:=trunc(y); c:=bin(a,b,typ); s:=s+c/k/k;
    Result:=Result*s;
  end;
  function FloatxorToColor(f: double): TColor;
  begin
    Result:=Round(f*qlr)//Round(arctan(f)*$400000/arctan(1)+$800000)*qlr;
  end;
  var deb: double;
begin
  g:=TBitMap.Create;
  g.Width:=w;
  g.Height:=h;
  g.Canvas.Draw(0,0,f);
  notpaint:=false;
  stopped:=false;
  StopBtn.Caption:='PAUSE';
  Gauge.Show;
  ZoomScroll.Position:=ZoomScroll.Max shr 1;
  for x:=start_of_draw to w do
  begin
    Application.ProcessMessages(); //if not tofile then
    for y:=0 to h do
    begin
      if saveblack and (f.Canvas.Pixels[x,y]=black) then goto jumptoxorin;
      for i:=0 to length(notpaintares)-1 do
      if (notpaintares[i].x1<xr(x))and(xr(x)<notpaintares[i].x2)and
          (notpaintares[i].y1<yr(y))and(yr(y)<notpaintares[i].y2) then
      begin
        notpaint:=true;
        break;
      end;
      if notpaint then
      begin
        if shownpas then f.Canvas.Pixels[x,y]:=clWhite-black
        else f.Canvas.Pixels[x,y]:=black;
        notpaint:=false;
        goto jumptoxorin;
      end;
      if sov then
      begin
        if floatxoring then
        begin
          deb:=floatxor(xr(x),yr(y));
          f.Canvas.Pixels[x,y]:=FloatxorToColor(deb);
        end else
        if blackonly then f.Canvas.Pixels[x,y]:=colorpd[bin(x,y,typ)shl sh]
          {if (bin(x,y,typ)shl sh=qlr) then f.Canvas.Pixels[x,y]:=black
            else f.Canvas.Pixels[x,y]:=clWhite}
          else f.Canvas.Pixels[x,y]:=(bin(x,y,typ)shl sh)*qlr;
        goto jumptoxorin;
      end;
      if (n=1)or(n=0) then inverse_shift:=0 else
        inverse_shift:=exp(1/(n-1)*ln(1/n))-exp(n/(n-1)*ln(1/n));
      inverse_shift:=inverse_shift+inversion_shift_plus;
      If fl1 then z.x:=xr(x)
        else z.x:=ee1;
      If fl2 then z.y:=yr(y)
        else z.y:=ee2;
      if invchx and (fl1 or fl2) then z:=sum(dev(Complex(0.5,0),sum(z,Complex(-inverse_shift,0))),Complex(inverse_shift,0));
      If fl3 then c.x:=xr(x)
        else c.x:=ee3;
      If fl4 then c.y:=yr(y)
        else c.y:=ee4;
      if invchx and (fl3 or fl4) then c:=sum(dev(Complex(0.5,0),sum(c,Complex(-inverse_shift,0))),Complex(inverse_shift,0));
      If fl7 then v.x:=xr(x)
        else v.x:=ee7;
      If fl8 then v.y:=yr(y)
        else v.y:=ee8;
      if invchx and (fl7 or fl8) then v:=sum(dev(Complex(0.5,0),sum(v,Complex(-inverse_shift,0))),Complex(inverse_shift,0));
      i:=0;
      if stocheps<>0 then
      begin
        stoch.x:=ln(stocheps);//*((x+1)/f.Width)*((x+1)/f.Width)*((x+1)/f.Width));
        stoch.y:=random*arctan(1)*8;
        stoch:=expz(stoch);
        z:=sum(z,stoch);
      end;
      //Замени Белый на произвольный, не забудь его в Symmetry
{!}   If ch2 and (f.Canvas.Pixels[x,y]<>clWhite) then goto jumptoxorin;
      while i<iter do
      begin
        Inc(i);
        if expch then z:=mul(sum(Expz(QPower(z,n,nex)),QPower(c,k,kex)),QPower(v,m,mex))
        else z:=mul(sum(QPower(z,n,nex),QPower(c,k,kex)),QPower(v,m,mex));
          //z:=sum(QPower(z,2,0),mul(sum(Complex(1,0),QPower(sum(Complex(1,0),neg(c)),0,0.5)),z));
        If ch2 then
        begin
          ar[i].x:=xm(z.x);
          ar[i].y:=ym(z.y);
        end;
        If Absq(z)>Sqrd(inf) then
        begin
          if not totlcrz then f.Canvas.Pixels[x,y]:=Colorpd[i];
          If ch2 then
            for q:=i-1 downto 1 do
              f.Canvas.Pixels[ar[q].x,ar[q].y]:=Colorpd[i-q];
          Break;
        end;
      end;
      If (i=iter) and not notblack then
      if japan then
      begin
        z:=Complex(0,0);
        i:=0;
        repeat
          z:=sum(mul(z,z),c);
          inc(i);
        until (Absq(z)<epsmus)or(i>20);
        if i>20 then mus[x,y]:=-1 else mus[x,y]:=i;
        absqzz:=Absq(z)/epsmus;
        absqz:=Round(100*absqzz);
        f.Canvas.Pixels[x,y]:=RGB(absqz,absqz,absqz);
        if absqz=0 then
        begin
          addcht(Complex(xr(x),yr(y)),i);
          f.Canvas.Pixels[x,y]:=clRed;
        end;
      end
      else f.Canvas.Pixels[x,y]:=black;
      jumptoxorin:
      if transform then f.Canvas.Pixels[x,y]:=bin(f.Canvas.Pixels[x,y],g.Canvas.Pixels[x,y],typ)
    end;
    Gauge.Progress:=Round(100*x/w);
    Gauge.Refresh;
    if not tofile then
    begin
      e.canvas.draw(0,0,f);
      e.Refresh;
      if stopped then begin start_of_draw:=x; exit; end
    end
  end;
  Gauge.Hide;
  {rewrite(output,'cht.txt');
  for i:=1 to length(cht)-1 do Writeln(cht[i].i,' ',FloatToStr(cht[i].z.x),' ',FloatToStr(cht[i].z.y));
  CloseFile(output);}
end;

procedure TMF.savetohistory(ttr: char);
var i: integer;
begin
  AssignFile(output,'temp');
  append(output);
  case ttr of
    'B': Writeln('#',ttr,' ',ord(smoothy),' ',ord(twostripes));
    'S': Writeln('#',ttr);
    'N': Writeln('#',ttr,' ',notpaintares[length(notpaintares)-1].x1,' ',
           notpaintares[length(notpaintares)-1].x2,' ',
           notpaintares[length(notpaintares)-1].y1,' ',
           notpaintares[length(notpaintares)-1].y2);
    'X': begin
           Writeln('#',ttr,' ',typ,' ',qlr,' ',sh,' ',ord(blackonly),' ',
            ord(floatxoring),' ',ord(transform),' ',ord(shownpas),' ',et1,' ',et2,' ',et3,' ',et4);
         end;
    'C': begin //if start_colors<>iter then 
           Writeln('#',ttr,' ',v1,' ',v2,' ',v3,' ',u1,' ',u2,' ',u3,' ',black,' ',ord(ch1),' ',
            ord(ch1a),' ',ord(ch2),' ',ord(totlcrz),' ',ord(notblack),' ',ord(saveblack));
           if ch1 or (sov and blackonly) then for i:=start_colors to iter do Writeln(colorpd[i]);
         end;
    else begin
           Writeln('#',ttr,' ',cbb,' ',stocheps,' ',et1,' ',et2,' ',et3,' ',et4,' ',iter,' ',inf,' ',ord(expch));
           If not fl1 then Writeln('=',ee1,' ') else Writeln('- ');
           If not fl2 then Writeln('=',ee2,' ') else Writeln('- ');
           If not fl3 then Writeln('=',ee3,' ') else Writeln('- ');
           If not fl4 then Writeln('=',ee4,' ') else Writeln('- ');
           If not fl7 then Writeln('=',ee7,' ') else Writeln('- ');
           If not fl8 then Writeln('=',ee8,' ') else Writeln('- ');
           Writeln(n,' ',m,' ',k,' ',nex,' ',mex,' ',kex);
         end;
         //LN!
         //Гладкий SaveBlack!
  end;
  CloseFile(output);
end;

procedure TMF.PaintbClick(Sender: TObject);
begin
  inpooot;
  If ch2 and not transform then
  begin
    f.Width:=0;
    f.Height:=0;
    f.Width:=e.Width;
    f.Height:=e.Height;
  end;
  if tofile then
  begin
    w:=width_spn.Value; f.Width:=w;
    h:=height_spn.Value; f.Height:=h;
  end
  else
  If ((w<>e.Width)or(h<>e.Height))and not transform then
  begin
    w:=e.Width;
    h:=e.Height;
    f.Width:=w;
    f.Height:=h;
    e.Picture:=nil;
    width_spn.Value:=w;
    height_spn.Value:=h;
  end;
  if sov and not floatxoring then begin et1:=0; et2:=h; et3:=w; et4:=0; end;
  drawin;
  if tofile then SavebtnClick(Paintb);
  //MessageDlg('Save it!' +#10+#13+ DateTimeToStr(Now), mtInformation, [mbOk], 0);
  fix_import_bug:=false;
  if sov then savetohistory('X') else savetohistory('A');
  //Обработай паузу!
end;

procedure TMF.chk1Click(Sender: TObject);
begin
  se7.Enabled:=not se7.Enabled;
  se8.Enabled:=not se8.Enabled;
  se9.Enabled:=not se9.Enabled;
  se10.Enabled:=not se10.Enabled;
  se11.Enabled:=not se11.Enabled;
  se12.Enabled:=not se12.Enabled;
  //chk1a.Enabled:=not chk1a.Enabled
end;

procedure TMF.eMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  xx:=x;
  yy:=y;
  xxx:=x;
  yyy:=y;
  MO:=true;
end;

procedure TMF.eMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var ax,ay,dx,dy,rx,ry,rxx,ryy: extended;
begin
  MO:=false;
  if fix_import_bug then exit;
  if notpaint then
  begin
    notpaintares[length(notpaintares)-1].x1:=xr(min(xx,x));
    notpaintares[length(notpaintares)-1].x2:=xr(max(xx,x));
    notpaintares[length(notpaintares)-1].y1:=yr(max(yy,y));
    notpaintares[length(notpaintares)-1].y2:=yr(min(yy,y));
    savetohistory('N');
    notpaint:=false;
    NotPaintBtn.Color:=clBtnFace;
    exit
  end;
  If (x<>xx)and(y<>yy) then
    if searching then
    begin
      Lsearch:=xr(min(xx,x));
      Usearch:=yr(min(yy,y));
      Rsearch:=xr(max(xx,x));
      Dsearch:=yr(max(yy,y));
    end
    else
    begin
      dx:=xr(min(xx,x)); dy:=yr(min(yy,y)); ax:=xr(max(xx,x)); ay:=yr(max(yy,y));
      rx:=dx; ry:=dy; rxx:=ax; ryy:=ay;
      if sov and OvernormalizeChx.Checked then
      begin
        dx:=sign(rx); while abs(dx)<abs(rx) do dx:=dx*2; while abs(dx)>abs(rx) do dx:=dx/2;
        ax:=dx*2; if ax-rx>rx-dx then rx:=dx else rx:=ax;
        dy:=sign(ry); while abs(dy)<abs(ry) do dy:=dy*2; while abs(dy)>abs(ry) do dy:=dy/2;
        ay:=dy*2; if ay-ry>ry-dy then ry:=dy else ry:=ay;
      end;
      if sov and NormalizeChx.Checked then
      begin
        ax:=rxx-rx; ay:=ryy-ry;
        dx:=xr(w); dy:=yr(h);
        while dx>ax do dx:=dx/2;
        while dy>ay do dy:=dy/2;
        rxx:=rx+dx; ryy:=ry+dy;
      end;
      ee1:=rx;
      ee2:=ry;
      ee3:=rxx;
      ee4:=ryy;
      MF.Edt1.Text:=FloatToStr(ee1);
      MF.Edt2.Text:=FloatToStr(ee2);
      MF.Edt3.Text:=FloatToStr(ee3);
      MF.Edt4.Text:=FloatToStr(ee4);
    end
  else
  begin
    If fl1 then znt.x:=xr(x)
      else znt.x:=ee1;
    If fl2 then znt.y:=yr(y)
      else znt.y:=ee2;
    If fl3 then cnt.x:=xr(x)
      else cnt.x:=ee3;
    If fl4 then cnt.y:=yr(y)
      else cnt.y:=ee4;
    If fl7 then vnt.x:=xr(x)
      else vnt.x:=ee7;
    If fl8 then vnt.y:=yr(y)
      else vnt.y:=ee8;
    {if Exponent.Checked then znt:=mul(sum(Expz(QPower(znt,n,nex)),QPower(cnt,k,kex)),QPower(vnt,m,mex))
      else znt:=mul(sum(QPower(znt,n,nex),QPower(cnt,k,kex)),QPower(vnt,m,mex));}
    Clipboard.AsText:=FloatToStr(xr(x))+' '+FloatToStr(yr(y));  
  end;
end;

procedure TMF.eMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
  var i: Integer;
begin
  If MO and (x<>xx)and(y<>yy) then
  begin
    for i:=Min(xx,xxx) to Max(xx,xxx) do
    begin
      e.Canvas.Pixels[i,yy]:=clWhite-e.Canvas.Pixels[i,yy];
      e.Canvas.Pixels[i,yyy]:=clWhite-e.Canvas.Pixels[i,yyy]
    end;
    for i:=Min(yy,yyy) to Max(yy,yyy) do
    begin
      e.Canvas.Pixels[xx,i]:=clWhite-e.Canvas.Pixels[xx,i];
      e.Canvas.Pixels[xxx,i]:=clWhite-e.Canvas.Pixels[xxx,i]
    end;
    xxx:=x;
    yyy:=y;
    for i:=Min(xx,xxx) to Max(xx,xxx) do
    begin
      e.Canvas.Pixels[i,yy]:=clWhite-e.Canvas.Pixels[i,yy];
      e.Canvas.Pixels[i,yyy]:=clWhite-e.Canvas.Pixels[i,yyy]
    end;
    for i:=Min(yy,yyy) to Max(yy,yyy) do
    begin
      e.Canvas.Pixels[xx,i]:=clWhite-e.Canvas.Pixels[xx,i];
      e.Canvas.Pixels[xxx,i]:=clWhite-e.Canvas.Pixels[xxx,i]
    end;
  end;
  edt5.Caption:=FloatToStr(xr(X));
  edt6.Caption:=FloatToStr(yr(Y));
  i:=f.Canvas.Pixels[X,Y];               //FloatToStr(xr(X)*xr(X)+yr(Y)*yr(Y))
  edt7.Caption:=IntToStr(i and 255)+' '+IntToStr(i shr 8 and 255)+' '+IntToStr(i shr 16)
  //+floattostr(frac(mus[x,y]/2520){' mus='+inttostr(mus[x,y]});
end;

procedure TMF.eContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin
  MF.e1.Text:='-';
  MF.e2.Text:='-';
  MF.e3.Text:=FloatToStr(xr(MousePos.X));
  MF.e4.Text:=FloatToStr(yr(MousePos.Y));
  MF.edt1.Text:='-2';
  MF.edt2.Text:='2';
  MF.edt3.Text:='2';
  MF.edt4.Text:='-2';
  MF.chk2.Checked:=true;
end;

procedure TMF.FormCreate(Sender: TObject);
begin
  Randomize;
  f:=TBitMap.Create;
  w:=MF.e.Width; f.Width:=w;
  h:=MF.e.Height; f.Height:=h;
  ch1:=MF.chk1.Checked;
  ch1a:=false;
  ch2:=MF.chk2.Checked;
  et1:=StrToFloat(MF.edt1.text);
  et2:=StrToFloat(MF.edt2.text);
  et3:=StrToFloat(MF.edt3.text);
  et4:=StrToFloat(MF.edt4.text);
  OpenDial.InitialDir := ExtractFilePath(Application.ExeName);
  searching:=false;
  fix_import_bug:=false;
  notpaint:=false;
  cbb1.ItemIndex:=6;
  sov:=false;
  qlrspn.Value:=random(Maxint);//2^31-1
  setlength(cht,1);
  rewrite(output,'temp'); CloseFile(output);

  BitBtn2Click(MF);
  inpooot;
  f.LoadFromFile('default.bmp');
  e.Canvas.Draw(0,0,f);
  e.Refresh;
end;

procedure TMF.se4Change(Sender: TObject);
begin
  MF.edt1.Text:='-2';
  MF.edt2.Text:='2';
  MF.edt3.Text:='2';
  MF.edt4.Text:='-2';
end;

procedure TMF.se3Change(Sender: TObject);
begin
  MF.edt1.Text:='-2';
  MF.edt2.Text:='2';
  MF.edt3.Text:='2';
  MF.edt4.Text:='-2';
end;

procedure TMF.BitBtn1Click(Sender: TObject);
begin
  //If Absq(znt)>Sqrd(inf) then exit;
  f.Canvas.MoveTo(xm(znt.x),ym(znt.y));
  if Exponent.Checked then znt:=mul(sum(expz(QPower(znt,n,nex)),QPower(cnt,k,kex)),QPower(vnt,m,mex))
  else znt:=mul(sum(QPower(znt,n,nex),QPower(cnt,k,kex)),QPower(vnt,m,mex));
  f.Canvas.Pen.Color:=$FF-random(50);
  f.Canvas.LineTo(xm(znt.x),ym(znt.y));
  Panel1.Caption:=FloatToStr(znt.x);
  Panel2.Caption:=FloatToStr(znt.y);
  MF.canvas.draw(0,0,f)
end;

procedure TMF.BitBtn2Click(Sender: TObject);
begin
  e1.Text:='0';
  e2.Text:='0';
  e3.Text:='-';
  e4.Text:='-';
  e7.Text:='-';
  e8.Text:='-';
  se3.Value:=2;
  se5.Value:=1;
  se4.Value:=0;
  Exponent.Checked:=false;
  chk2.Checked:=false;
  cbb1.ItemIndex:=0;
  edt1.Text:='-2';
  edt2.Text:='1,33';
  edt3.Text:='0,7';
  edt4.Text:='-1,33';
end;

procedure TMF.nfracbtnClick(Sender: TObject);
var flt: extended;
  unexcept: boolean;
begin
  flt:=0;//чтоб обмануть ворнинги
  if nfracbtn.Tag<2 then
  begin
    nfracedt.Show;
    if nfracbtn.Tag=0 then nfracedt.Text:=inttostr(se3.Value);
    nfracbtn.Color:=RGB(243,28,46);
    nfracbtn.Tag:=random(17)+3;
  end
  else
  begin
    unexcept:=true;
    try
      flt:=StrToFloat(nfracedt.Text)
    except unexcept:=false end;
    if unexcept then
    begin
      nfracbtn.Color:=clBtnFace;
      nfracbtn.Tag:=0;
      if frac(flt)=0 then nfracedt.Hide
      else nfracbtn.Tag:=1;
      se3.Value:=round(flt);
    end
  end
end;

procedure TMF.kfracbtnClick(Sender: TObject);
var flt: extended;
  unexcept: boolean;
begin
  flt:=0;//чтоб обмануть ворнинги
  if kfracbtn.Tag<2 then
  begin
    kfracedt.Show;
    if kfracbtn.Tag=0 then kfracedt.Text:=inttostr(se5.Value);
    kfracbtn.Color:=RGB(243,28,46);
    kfracbtn.Tag:=random(17)+3;
  end
  else
  begin
    unexcept:=true;
    try
      flt:=StrToFloat(kfracedt.Text)
    except unexcept:=false end;
    if unexcept then
    begin
      kfracbtn.Color:=clBtnFace;
      kfracbtn.Tag:=0;
      if frac(flt)=0 then kfracedt.Hide
      else kfracbtn.Tag:=1;
      se5.Value:=round(flt);
    end
  end
end;

procedure TMF.mfracbtnClick(Sender: TObject);
var flt: extended;
  unexcept: boolean;
begin
  flt:=0;//чтоб обмануть ворнинги
  if mfracbtn.Tag<2 then
  begin
    mfracedt.Show;
    if mfracbtn.Tag=0 then mfracedt.Text:=inttostr(se4.Value);
    mfracbtn.Color:=RGB(243,28,46);
    mfracbtn.Tag:=random(17)+3;
  end
  else
  begin
    unexcept:=true;
    try
      flt:=StrToFloat(mfracedt.Text)
    except unexcept:=false end;
    if unexcept then
    begin
      mfracbtn.Color:=clBtnFace;
      mfracbtn.Tag:=0;
      if frac(flt)=0 then mfracedt.Hide
      else mfracbtn.Tag:=1;
      se4.Value:=round(flt);
    end
  end
end;

procedure Rectngl(L,R,D,U: double);
var ll,rr,dd,uu: integer;
begin
  ll:=xm(l); rr:=xm(r); dd:=ym(d); uu:=ym(u);
  f.Canvas.Pen.Color:=$FF-random(50);
  f.Canvas.MoveTo(ll,uu);
  f.Canvas.LineTo(rr,uu);
  f.Canvas.LineTo(rr,dd);
  f.Canvas.LineTo(ll,dd);
  f.Canvas.LineTo(ll,uu);
  MF.e.Canvas.Draw(0,0,f);
end;

procedure TMF.SearchBtnClick(Sender: TObject);
var L,R,U,D: extended;
  it,j: integer;
  zozL,zozR,cocL,cocR: TComplex;
const eps=1e-11;
begin
  SearchBtn.Font.Color:=SearchBtn.Color;
  SearchBtn.Color:=clWhite-SearchBtn.Color;
  searching:=not searching;
  if not searching then
  begin
    L:=Lsearch;
    R:=Rsearch;
    D:=Dsearch;
    U:=Usearch;
 Rectngl(L,R,D,U);
    it:=SearchSpEd.Value;
    repeat
      Application.ProcessMessages();
      zozL:=Complex(0,0);
      zozR:=zozL;
      cocL.x:=L+(R-L)/3;
      cocR.x:=R-(R-L)/3;
      cocL.y:=(U+D)/2;
      cocR.y:=(U+D)/2;
      for j:=1 to it{+1} do
      begin
          zozL:=sum(QPower(zozL,n,nex),QPower(cocL,k,kex));
          zozR:=sum(QPower(zozR,n,nex),QPower(cocR,k,kex));
      end;
      if Absq(zozL)<Absq(zozR)
      {Absq(sum(zozL,neg(cocL)))<Absq(sum(zozR,neg(cocR)))} then L:=cocL.x
      else R:=cocR.x;
 Rectngl(L,R,D,U);
     { zozL:=Complex(0,0);
      zozR:=zozL;
      cocL.y:=D+(U-D)/3;
      cocR.y:=U-(U-D)/3;
      cocL.x:=(L+R)/2;
      cocR.x:=(L+R)/2;
      for j:=1 to it do
      begin
          zozL:=sum(QPower(zozL,n,nex),QPower(cocL,k,kex));
          zozR:=sum(QPower(zozR,n,nex),QPower(cocR,k,kex));
      end;
      if Absq(zozL)<Absq(zozR) then D:=cocL.y
      else U:=cocR.y;
 Rectngl(L,R,D,U);   }
    until (cocL.x-cocR.x)*(cocL.x-cocR.x)+(cocL.y-cocR.y)*(cocL.y-cocR.y)<eps;
    Panel1.Caption:=floattostr(cocL.x);
    Panel2.Caption:=floattostr(cocL.y);
    znt:=cocL;
    if notblack then
    begin
      rewrite(output,'search'+inttostr(it)+'.txt');
      Writeln(floattostr(cocL.x),' ',floattostr(cocL.y));
      CloseFile(output);
    end;
  end;
end;

procedure TMF.SaveBtnClick(Sender: TObject);
var fname: string;
  i: integer;
begin
  i:=DateTimeToFileDate(now)-1100000000;
  fname:=inttostr(i)+'u'+inttostr(random(34021));
  f.SaveToFile(fname+'.bmp');
  CopyFile(Pchar('temp'), Pchar(fname+'.frx'), true);
  MessageDlg('Saved???' +#10+#13+ DateTimeToStr(Now), mtInformation, [mbOk], 0);
end;

procedure TMF.OldImport(s: TFileName);
var ch1c,ch2c,fl1c,fl2c,fl3c,fl4c,fl7c,fl8c,expchc,blackonlyc: char;
  i: integer;
begin
  reset(input,s);
  Readln(cbb);
  if cbb=-2 then
  begin 
    Readln(typ); binarfunctioncbb.ItemIndex:=typ;
    Readln(qlr); qlrspn.Value:=qlr;
    Readln(sh); shspn.Value:=sh;
    Readln(blackonlyc); blackonly:=blackonlyc='T'; onlyblackChx.Checked:=blackonly;
    if not sov then SovBtnClick(ImportBtn);
  end
  else if sov then SovBtnClick(ImportBtn);
  Readln(ch1c); ch1:=ch1c='T';
  if not sov then
  begin
    Readln(ch2c); ch2:=ch2c='T';
    ch1a:=true;
    Readln(stocheps);
    Readln(et1);Readln(et2);Readln(et3);Readln(et4);
    Readln(Fl1c); fl1:=fl1c='T';
    Readln(Fl2c); fl2:=fl2c='T';
    Readln(Fl3c); fl3:=fl3c='T';
    Readln(Fl4c); fl4:=fl4c='T';
    Readln(Fl7c); fl7:=fl7c='T';
    Readln(Fl8c); fl8:=fl8c='T';
    If not fl1 then Readln(ee1) else Readln;
    If not fl2 then Readln(ee2) else Readln;
    If not fl3 then Readln(ee3) else Readln;
    If not fl4 then Readln(ee4) else Readln;
    If not fl7 then Readln(ee7) else Readln;
    If not fl8 then Readln(ee8) else Readln;
    Readln(inf);
  end;
  Readln(iter);
  if not sov then
  begin
    Readln(n);Readln(m);Readln(k);
    Readln(nex);Readln(mex);Readln(kex);
  end;
  Readln(v1);Readln(v2);Readln(v3);Readln(u1);Readln(u2);Readln(u3);
  setlength(colorpd,iter+1);
  if ch1 or (sov and blackonly) then for i:=1 to iter do Readln(colorpd[i])
  else for i:=1 to iter do
    colorpd[i]:=RGB(hd(v1/i*iter+u1),hd(v2/i*iter+u2),hd(v3/i*iter+u3));
  if not sov then
  begin
    Readln(black);
    Readln(expchc); expch:=expchc='T';
  end;
  CloseFile(input);

  se1.Value:=iter;
  chk1.Checked:=ch1;
  chk1a.Checked:=true;
  se7.Value:=u1;   se8.Value:=v1+u1;
  se9.Value:=u2;   se10.Value:=v2+u2;
  se11.Value:=u3;  se12.Value:=v3+u3;
  cbb1.ItemIndex:=cbb;
  if fl1 then e1.Text:='-' else e1.Text:=FloatToStr(ee1);
  if fl2 then e2.Text:='-' else e2.Text:=FloatToStr(ee2);
  if fl3 then e3.Text:='-' else e3.Text:=FloatToStr(ee3);
  if fl4 then e4.Text:='-' else e4.Text:=FloatToStr(ee4);
  if fl7 then e7.Text:='-' else e7.Text:=FloatToStr(ee7);
  if fl8 then e8.Text:='-' else e8.Text:=FloatToStr(ee8);
  chk2.Checked:=ch2;;
  stochastic_edt.text:=FloatToStr(stocheps);
  Exponent.Checked:=expch;
  se2.Text:=FloatToStr(inf);
  se3.Value:=n;
  se4.Value:=m;
  se5.Value:=k;
  if frac(nex)=0 then nex:=0 else begin nfracedt.Text:=FloatToStr(nex); nfracedt.Show; nfracbtn.Tag:=1; end;
  if frac(mex)=0 then mex:=0 else begin mfracedt.Text:=FloatToStr(mex); mfracedt.Show; mfracbtn.Tag:=1; end;
  if frac(kex)=0 then kex:=0 else begin kfracedt.Text:=FloatToStr(kex); kfracedt.Show; kfracbtn.Tag:=1; end;
  edt1.text:=FloatToStr(et1);
  edt2.text:=FloatToStr(et2);
  edt3.text:=FloatToStr(et3);
  edt4.text:=FloatToStr(et4);
  fix_import_bug:=true;
  RofBlack_spn.Value:=black and 255;
  GofBlack_spn.Value:=black shr 8 and 255;
  BofBlack_spn.Value:=black shr 16;
  //drawin;
end;

procedure TMF.ImportBtnClick(Sender: TObject);
var s: TFileName;
begin
  if OpenDial.Execute then s:=OpenDial.FileName else exit;
  if s[length(s)-2]<>'x' then begin oldimport(s); exit end;
    MessageDlg('Unfortunately u''v''n''t writtn'' new import LOL', mtInformation, [mbOk], 0);
  SetCurrentDir(ExtractFilePath(Application.ExeName));//ибо при загрузке меняет раб.дир.  
end;

procedure TMF.chtofileClick(Sender: TObject);
begin
  if e.Enabled then
  begin
    e.Anchors:=[akLeft,akTop];
    ClientWidth:=ClientWidth - e.Width + 200;
    mf.BorderStyle:=bsSingle;
    mf.BorderIcons:=[biSystemMenu,biMinimize];
  end
  else
  begin
    ClientWidth:=ClientWidth + e.Width - 200;
    e.Anchors:=[akLeft,akTop,akRight,akBottom];
    mf.BorderStyle:=bsSizeable;
    mf.BorderIcons:=[biSystemMenu,biMaximize,biMinimize];
  end;
  e.Enabled:=not e.Enabled;
  e.Picture:=nil;
  multiplylabel.Visible:= not multiplylabel.Visible;
  multiply_spn.Visible:=not multiply_spn.Visible;
  widthlabel.Visible:= not widthlabel.Visible;
  width_spn.Visible:= not width_spn.Visible;
  heightlabel.Visible:= not heightlabel.Visible;
  height_spn.Visible:= not height_spn.Visible;
  NaturBtn.Visible:= not NaturBtn.Visible;
  AcceptBtn.Visible:= not AcceptBtn.Visible  
end;

procedure TMF.multiply_spnChange(Sender: TObject);
begin
  width_spn.Value:=multiply_spn.Value*f.Width;
  height_spn.Value:=multiply_spn.Value*f.Height;
end;

procedure TMF.BlackbtnClick(Sender: TObject);
begin
  Blackbtn.Color:=-16776946-Blackbtn.Color; // clRed/clBtnFace
  RofBlack_spn.Visible:=not RofBlack_spn.Visible;
  GofBlack_spn.Visible:=not GofBlack_spn.Visible;
  BofBlack_spn.Visible:=not BofBlack_spn.Visible;
  black:=RGB(RofBlack_spn.Value,GofBlack_spn.Value,BofBlack_spn.Value);
end;

procedure TMF.NotPaintBtnClick(Sender: TObject);
begin
  notpaint:=true;
  NotPaintBtn.Color:=RGB(243,28,46);//clBtnFace
  setlength(notpaintares,length(notpaintares)+1);
end;

procedure TMF.ResetNotPaintBtnClick(Sender: TObject);
begin
  notpaint:=false;
  NotPaintBtn.Color:=clBtnFace;
  setlength(notpaintares,0);
end;

procedure TMF.StopBtnClick(Sender: TObject);
begin
  stopped:=not stopped;
  if stopped then StopBtn.Caption:='UNPAUSE'
  else
  begin
    StopBtn.Caption:='PAUSE';
    drawin
  end;
end;

procedure TMF.SymBtnClick(Sender: TObject);
var x,y: integer;
begin
  notpaint:=false;
  stopped:=false;
  StopBtn.Caption:='PAUSE';
  Gauge.Show;
  for y:=1 to h do
  begin
    Application.ProcessMessages();//if not tofile then 
    for x:=1 to w do
      if f.Canvas.Pixels[x,y]=clWhite then f.Canvas.Pixels[x,y]:=f.Canvas.Pixels[w-x,h-y];
    Gauge.Progress:=Round(100*y/h);
    Gauge.Refresh;
    if not tofile then
    begin
      e.canvas.draw(0,0,f);
      e.Refresh;
      if stopped then exit
    end
  end;
  Gauge.Hide;
  if tofile then SavebtnClick(Paintb);
  savetohistory('S');
end;

procedure TMF.NaturBtnClick(Sender: TObject);
var rel,ordd: double;
  ord: integer;
begin
  rel:=abs((et1-et3)/(et2-et4));
  if rel<1 then ord:=Round(ln(abs(et1-et3))/ln(10))
  else ord:=Round(ln(abs(et2-et4))/ln(10));
  ordd:=QPower(Complex(10,0),ord,0).x;
  width_spn.Value:=Round(abs(et1-et3)*rel/ordd*100);
  height_spn.Value:=Round(abs(et1-et3)/ordd*100);
end;

procedure TMF.AcceptBtnClick(Sender: TObject);
begin
  f.Width:=width_spn.Value;
  f.Height:=height_spn.Value;
end;

procedure TMF.SmoothBtnClick(Sender: TObject);
type TisBorderOutput=record
    isbrdr: boolean; //clr2_found
    clr1,clr2: TColor;
  end;
var g: TBitmap;
  x,y: integer;
  isBrd: TisBorderOutput;

  function middlclr(clr1,clr2: TColor):TColor;
  begin
    if smoothy then
      if twostripes then
      Result:=RGB(
      ((clr1 and 255) + (clr2 and 255)) shr 1,
      ((clr1 shr 8 and 255) + (clr2 shr 8 and 255)) shr 1,
      ((clr1 shr 16) + (clr2 shr 16)) shr 1)
      {else
      Result:=RGB(
      ((clr1 and 255) shl 1 + (clr2 and 255)) div 3,
      ((clr1 shr 8 and 255) shl 1 + (clr2 shr 8 and 255)) div 3,
      ((clr1 shr 16) shl 1 + (clr2 shr 16)) div 3)}
      else Result:=clr1 xor clr2
    else
    if twostripes then Result:=(clr1 + clr2) shr 1
    else Result:=(clr1 shl 1 + clr2) div 3
  end;

  function isborder(x,y: integer): TisBorderOutput;
  var
    xx,yy: integer;
    clr: TColor;
  begin
    Result.isbrdr:=false;
    Result.clr1:=g.Canvas.Pixels[x,y];
    for xx:=x-1 to x+1 do
      for yy:=y-1 to y+1 do
      begin
        clr:=g.Canvas.Pixels[xx,yy];
        if Result.isbrdr then
          if (clr<>Result.clr1)and(clr<>Result.clr2) then begin Result.isbrdr:=false; exit end else
        else
        if clr<>Result.clr1 then begin Result.clr2:=clr; Result.isbrdr:=true end;
      end;
  end;

begin
  smoothy:=Smoothchx.Checked;
  twostripes:=TwoStripesChx.Checked;
  g:=TBitMap.Create;
  w:=f.Width;
  h:=f.Height;
  g.Width:=w;
  g.Height:=h;
  g.Canvas.draw(0,0,f);
  Gauge.Show;
  for x:=1 to w-2 do
  begin
    Application.ProcessMessages();//if not tofile then 
    for y:=1 to h-2 do
    begin
      isBrd:=isborder(x,y);
      if isBrd.isbrdr then f.Canvas.Pixels[x,y]:=middlclr(isBrd.clr1,isBrd.clr2);
    end;
    e.Canvas.Draw(0,0,f);;
    e.Refresh;
    Gauge.Progress:=Round(100*(x-1)/(w-1));
  end;
  Gauge.Hide;
  savetohistory('B');
end;

procedure TMF.LoadBtnClick(Sender: TObject);
begin
  if OpenDial.Execute then f.LoadFromFile(OpenDial.FileName);
  SetCurrentDir(ExtractFilePath(Application.ExeName));//ибо при загрузке меняет раб.дир.
  e.Canvas.Draw(0,0,f);
  e.Refresh;
end;

procedure TMF.MultiplBorderBtnClick(Sender: TObject);
begin
  stopped:=false;
  StopBtn.Caption:='PAUSE';
  while not stopped do
  begin
    Application.ProcessMessages();
    SmoothBtnClick(MF);
  end;
end;

procedure TMF.SOVBtnClick(Sender: TObject);
begin
  sov:=not sov;
  lbl1.Visible:=not lbl1.Visible;
  lbl2.Visible:=not lbl2.Visible;
  e1.Visible:=not e1.Visible;
  e2.Visible:=not e2.Visible;
  e3.Visible:=not e3.Visible;
  e4.Visible:=not e4.Visible;
  lbl3.Visible:=not lbl3.Visible;
  lbl4.Visible:=not lbl4.Visible;
  lbl5.Visible:=not lbl5.Visible;
  lbl6.Visible:=not lbl6.Visible;
  se1.Visible:=not se1.Visible;
  lbl11.Visible:=not lbl11.Visible;
  lbl21.Visible:=not lbl21.Visible;
  lbl22.Visible:=not lbl22.Visible;
  se2.Visible:=not se2.Visible;
  chk2.Visible:=not chk2.Visible;
  cbb1.Visible:=not cbb1.Visible;
  se3.Visible:=not se3.Visible;
  lbl24.Visible:=not lbl24.Visible;
  lbl25.Visible:=not lbl25.Visible;
  lbl26.Visible:=not lbl26.Visible;
  e7.Visible:=not e7.Visible;
  e8.Visible:=not e8.Visible;
  lbl27.Visible:=not lbl27.Visible;
  se4.Visible:=not se4.Visible;
  lbl28.Visible:=not lbl28.Visible;
  lbl29.Visible:=not lbl29.Visible;
  se5.Visible:=not se5.Visible;
  Label1.Visible:=not Label1.Visible;
  Exponent.Visible:=not Exponent.Visible;
  BitBtn1.Visible:=not BitBtn1.Visible;
  Panel1.Visible:=not Panel1.Visible;
  Panel2.Visible:=not Panel2.Visible;
  BitBtn2.Visible:=not BitBtn2.Visible;
  Stochastic_label.Visible:=not Stochastic_label.Visible;
  stochastic_edt.Visible:=not stochastic_edt.Visible;
  totlcrzxhk.Visible:=not totlcrzxhk.Visible;
  SaveBlackChx.Visible:=not SaveBlackChx.Visible;
  SaveBlackLbl.Visible:=not SaveBlackLbl.Visible;
  binarfunctioncbb.Visible:=not binarfunctioncbb.Visible;
  qlrspn.Visible:=not qlrspn.Visible;
  shspn.Visible:=not shspn.Visible;
  qlrLbl.Visible:=not qlrLbl.Visible;
  shLbl.Visible:=not shLbl.Visible;
  onlyblackChx.Visible:=not onlyblackChx.Visible;
  Floatxorchx.Visible:=not Floatxorchx.Visible;
  Japanchx.Visible:=not Japanchx.Visible;
  nfracbtn.Visible:=not nfracbtn.Visible;
  mfracbtn.Visible:=not mfracbtn.Visible;
  kfracbtn.Visible:=not kfracbtn.Visible;
  NotBlackChx.Visible:=not NotBlackChx.Visible;
  RandomQBtn.Visible:=not RandomQBtn.Visible;
  NormalizeChx.Visible:=not NormalizeChx.Visible;
  OvernormalizeChx.Visible:=not OvernormalizeChx.Visible;
end;

procedure TMF.ZoomScrollChange(Sender: TObject);
var delta: double;
begin
  delta:=(ZoomScroll.Max shr 1-ZoomScroll.Position)/ZoomScroll.Max;
  edt1.Text:=FloatToStr(et1+(et3-et1)*delta);
  edt2.Text:=FloatToStr(et2+(et4-et2)*delta);
  edt3.Text:=FloatToStr(et3-(et3-et1)*delta);
  edt4.Text:=FloatToStr(et4-(et4-et2)*delta);
end;

procedure TMF.CancelScrollClick(Sender: TObject);
begin
  ZoomScroll.Position:=ZoomScroll.Max shr 1;
end;

procedure TMF.CardioidBtnClick(Sender: TObject);
var q,x,y{,s}: double;
  //k: integer;
  k: extended;
  //lambda,c: TComplex;
  Rsum,rsmall,l: double;
  inz: TComplex;
const eps=5e-2;
  RR=0.25;

  {function cardio(q,R: double):double;
  begin
    //Result:=2*R*(1-cos(q));
   // Result:=k*R*(1-sin(k*q)/k/sin(q))
{    Result:=k*R*(1-cos((k-1)*q));
//   Result:=k*R*(1-QPower(Complex(cos(q),0),(k-1),0).x)
  end;

{
k s
2 1
3 1,3
4 1,58
5 1,87
13 4
27 7,6
127 33}

begin
  //k:=se3.Value;
  if nex=0 then k:=n else k:=nex; 
  l:=(ScrollBar1.Max-ScrollBar1.Position)/ScrollBar1.Max;
//  s:=RR*k+RR*2;
 // s:=strtofloat(se2.Text);
  f.Canvas.Pen.Color:=$FF-random(50);
  q:=0;
  //for i:=1 to k do

  rsmall:=exp(1/(k-1)*ln(1/k));
  Rsum:=exp(k/(k-1)*ln(1/k));
  x:=-Rsum*exp(n*ln(l))+rsmall*l;
  inverse_shift:=x+inversion_shift_plus;
  y:=0;
  if invchx then
    begin
      inz:=Complex(x,y);
      inz:=sum(dev(Complex(0.5,0),sum(inz,Complex(-inverse_shift,0))),Complex(inverse_shift,0));
      x:=inz.x; y:=inz.y;
    end;
  f.Canvas.MoveTo(xm(x),ym(y));

  repeat
    Application.ProcessMessages();
    {r:=cardio(q,RR);
    x:=r*cos(q)+RR;
    y:=r*sin(q);}
    rsmall:=exp(1/(k-1)*ln(1/k));
    Rsum:=exp(k/(k-1)*ln(1/k));
    x:=-Rsum*cos(q)*exp(n*ln(l))+cos(q/k)*rsmall*l;
    y:=-Rsum*sin(q)*exp(n*ln(l))+sin(q/k)*rsmall*l;
{    lambda:=expz(Complex(0,q));
    c:=mul( QPower(dev(lambda,Complex(k,0)),0,1/(k-1) ),(sum(Complex(1,0),neg(dev(lambda,Complex(k,0))))));
    x:=c.x; y:=c.y;}
    q:=q+eps;
    if invchx then
    begin
      inz:=Complex(x,y);
      inz:=sum(dev(Complex(0.5,0),sum(inz,Complex(-inverse_shift,0))),Complex(inverse_shift,0));
      //inz:=dev(Complex(inversion_radius,0),Complex(x-0.5,y));
      x:=inz.x; y:=inz.y;
    end;
    f.Canvas.LineTo(xm(x),ym(y));
    e.canvas.draw(0,0,f);
    e.Refresh;
  until q>k*2*pi;
end;

procedure TMF.AnswerClick(Sender: TObject);
var k{,anss}: extended;
  ex,ans: TComplex;
begin
  //k:=0;
  k:=StrToFloat(stochastic_edt.Text);
  {f.Width:=0;
  f.Height:=0;}
  f.Width:=e.Width;
  f.Height:=e.Height;
  w:=e.Width;
  h:=e.Height;
  Gauge.Show;
  f.Canvas.MoveTo(xm(0.25),ym(0));
  {while k<10 do
  begin
    Application.ProcessMessages();
    Gauge.Progress:=Round(20*k);  }  //0.5*e^(2*k*pi*i)
    ex:=mul(expz(Complex(0,8*arctan(1)*k)),Complex(0.5,0));
    ans:=mul(ex,sum(Complex(1,0),neg(ex))); // 0.5*e^(2*k*pi*i) * (1-0.5*e^(2*k*pi*i))
    f.Canvas.Pen.Color:=$FF-random(50);
    f.Canvas.LineTo(xm(ans.x),ym(ans.y));
    mus[xm(ans.x),ym(ans.y)]:=Round((k-1)*2520);
    //https://upload.wikimedia.org/math/9/9/9/9990e0622b2dfbb762836f38d455581f.png
    //2520 devides first 10 naturals, so 2520 = q, the denominator
    //anss:=sqrt(Absq(ans));//f.Canvas.Pixels[Round((k-1)*w),Round(h-anss*h))]:=clBlack;
    e.Canvas.Draw(0,0,f);
    e.Refresh;
//    k:=k+1/2520;
//  end;
  Gauge.Hide;
  Panel1.Caption:=FloatToStr(ans.x);
  Panel2.Caption:=FloatToStr(ans.y);
end;

procedure TMF.RandomQBtnClick(Sender: TObject);
begin
  qlrspn.Value:=random(Maxint);
end;

procedure TMF.DragonBtnClick(Sender: TObject);
begin
//there should be smth
end;

end.

