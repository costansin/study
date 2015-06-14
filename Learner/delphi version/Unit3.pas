unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ShellApi;

type
  TMF = class(TForm)
    Edit1: TEdit;
    Panel1: TPanel;
    Edit2: TEdit;
    Panel2: TPanel;
    Button1: TButton;
    Panel4: TMemo;
    Panel5: TMemo;
    CheckBox1: TCheckBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    Label1: TLabel;
    Label2: TLabel;
    Button3: TButton;
    Label3: TLabel;
    Button4: TButton;
    Button5: TButton;
    Button2: TButton;
    Edit3: TEdit;
    ComboBox1: TComboBox;
    procedure Panel4Click(Sender: TObject);
    procedure Panel5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure gen;
    procedure outp(Sender: TObject);
    procedure Rereading;
    procedure Saving;
    procedure zhr(p: byte);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit2Enter(Sender: TObject);
    procedure Panel4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure UP(p: integer);
    procedure ComboBox1Change(Sender: TObject);
  end;

type
  words=record
    mark: byte;
    rus,frn: string;
  end;
  mark_bounds=record
    b,r :integer;
  end;

var
  MF: TMF;
  i,j,iold: integer;
  gf: array [1..6] of mark_bounds;
  L: Longint;
  A: array [0..10000] of words;
  regime, Editing, b5: boolean;

implementation

{$R *.dfm}

procedure update_array;
var k,ii: integer;
begin
  k:=1;
  for ii:=5 downto 2 do
  begin
    gf[ii].r:=gf[ii+1].r+k*(gf[ii-1].b-gf[ii].b);
    k:=k shl 1;
  end;
end;

procedure rating;
begin
  MF.Label2.Caption:='Learning rate (5-4-3-2): '+inttostr(gf[4].b-gf[5].b)+'-'+
    inttostr(gf[3].b-gf[4].b)+'-'+inttostr(gf[2].b-gf[3].b)+'-'+inttostr(gf[1].b-gf[2].b);
end;

procedure TMF.Rereading;
var i: integer; c: char;
begin
  (*case Combobox1.ItemIndex of
    0:reset(input,'GE.txt');
    1:reset(input,'HR.txt');
    2:reset(input,'econom.txt');
    3:reset(input,'mil.txt');
    4:reset(input,'comcor.txt');
    5:reset(input,'video.txt');
    6:reset(input,'ALL.txt');
  end;*)
  reset(input,'dictionary.txt');
  Readln(L);
  fillchar(A,sizeof(A),0);
  A[0].mark:=5; gf[1].b:=L+1; gf[5].b:=1; gf[6].r:=0;
  for i:=1 to L do
  begin
    Read(c);
    while c<>'#' do
    begin
      A[i].frn:=A[i].frn+c;
      Read(c);
    end;
    Read(c);
    while c<>'#' do
    begin
      A[i].rus:=A[i].rus+c;
      Read(c);
    end;
    Readln(A[i].mark);
    if A[i-1].mark>A[i].mark then gf[A[i].mark].b:=i;
  end;
  for i:=2 to 4 do
    if gf[i].b=0 then gf[i].b:=gf[i-1].b;
  update_array;
  rating;
  CloseFile(input);
end;

procedure TMF.FormCreate(Sender: TObject);
begin
  Randomize;
  Rereading;
  i:=L;
  outp(MF);
  Panel5.Text:=A[i].frn;
  regime:=true;
  Editing:=false;
  b5:=true;
 // Unit1.b:=false;
  Button5.Enabled:=false;
end;

procedure TMF.gen;
var ty: integer;
begin
  iold:=i;
  ty:=random(gf[2].r)+1;
  if ty<=gf[3].r then
    if ty<=gf[4].r then
      if ty<=gf[5].r then
        i:=ty
      else i:=gf[4].b+(ty-1-gf[5].r) shr 1
    else i:=gf[3].b+(ty-1-gf[4].r) shr 2
  else i:=gf[2].b+(ty-1-gf[3].r) shr 3;
end;

procedure TMF.outp(Sender: TObject);
begin
  if Editing then exit;
  if Sender<>Panel5 then Panel5.Clear;
  Edit1.Clear; Edit2.Clear;
  if CheckBox1.Checked then Panel4.Text:=A[i].rus
    else Panel4.Text:=A[i].frn;
  RadioButton4.Checked:=false;
  RadioButton3.Checked:=false;
  RadioButton2.Checked:=false;
  RadioButton1.Checked:=false;
  regime:=false;
  b5:=true;
  Button5.Caption:='Delete';
end;

procedure TMF.Panel4Click(Sender: TObject);
begin
  if Panel5.Text<>'' then gen;
  outp(MF);
end;

procedure TMF.Panel5Click(Sender: TObject);
begin
  outp(Panel5);
  if Editing then exit;
  if CheckBox1.Checked
    then Panel5.Text:=A[i].frn
    else Panel5.Text:=A[i].rus;
  case A[i].mark of
    2: RadioButton4.Checked:=true;
    3: RadioButton3.Checked:=true;
    4: RadioButton2.Checked:=true;
    5: RadioButton1.Checked:=true;
  end;
end;

procedure TMF.Button1Click(Sender: TObject);
var t: integer;
  e1,e2: string;
begin
  Rereading;
  RadioButton1.Checked:=false;
  RadioButton2.Checked:=false;
  RadioButton3.Checked:=false;
  RadioButton4.Checked:=false;
  Panel4.Clear; Panel5.Clear;
  if (Edit1.Text<>'')and(Edit2.Text<>'') then
  begin
    if not Editing then
    begin
      Inc(L);
      i:=L;
      A[i].mark:=2
    end
    else
    begin
      Button2.Caption:='Edit';
      Editing:=false
    end;
    e1:=Edit1.Text;
    e2:=Edit2.Text;
    A[i].frn:='';
    A[i].rus:='';
    for t:=1 to length(e1) do
      if e1[t]<>'\' then A[i].frn:=A[i].frn+e1[t]
      else A[i].frn:=A[i].frn+#13+#10;
    for t:=1 to length(e2) do
      if e2[t]<>'\' then A[i].rus:=A[i].rus+e2[t]
      else A[i].rus:=A[i].rus+#13+#10;
    Edit1.Clear; Edit2.Clear;
  end;
  Saving;
  regime:=true;
end;

procedure swap(var x: integer; y: integer);
var z: words;
begin
  z:=A[x];
  A[x]:=A[y];
  A[y]:=z;
  x:=y;
end;

procedure TMF.zhr(p: byte);
var k: integer;
begin
  if Panel5.Text='' then
  begin
    RadioButton1.Checked:=false;
    RadioButton2.Checked:=false;
    RadioButton3.Checked:=false;
    RadioButton4.Checked:=false;
    //U swap any element to delete with the last of its mark? Perfect!
    swap(i,gf[A[i].mark-1].b-1);
    exit;
  end;
  Rereading;
  if p=A[i].mark then swap(i,gf[A[i].mark-1].b-1);
  if p>A[i].mark then
  begin
    swap(i,gf[A[i].mark].b);
    for k:=A[i].mark+1 to p do
    begin
      swap(i,gf[k].b);
      inc(gf[k-1].b)
    end;
    A[i].mark:=p;
  end
  else
  begin
    swap(i,gf[A[i].mark-1].b-1);
    for k:=A[i].mark-1 downto p do
    begin
      swap(i,gf[k-1].b-1);
      dec(gf[k].b)
    end;
    A[i].mark:=p;
  end;
  update_array;
  rating;
  Saving;
end;

procedure TMF.RadioButton1Click(Sender: TObject);
begin
  zhr(5);
end;

procedure TMF.RadioButton2Click(Sender: TObject);
begin
  zhr(4);
end;

procedure TMF.RadioButton3Click(Sender: TObject);
begin
  zhr(3);
end;

procedure TMF.RadioButton4Click(Sender: TObject);
begin
  zhr(2);
end;

procedure TMF.Saving;
var i: integer;
begin
  (*case Combobox1.ItemIndex of
    0:reset(output,'GE.txt');
    1:reset(output,'HR.txt');
    2:reset(output,'econom.txt');
    3:reset(output,'mil.txt');
    4:reset(output,'comcor.txt');
    5:reset(output,'video.txt');
    6:reset(output,'ALL.txt');
  end;*)
  reset(output,'dictionary.txt');
  Writeln(L);
  for i:=1 to L do Writeln(A[i].frn+'#'+A[i].rus+'#',A[i].mark);
  CloseFile(output);
end;

procedure TMF.Button3Click(Sender: TObject);
var g: integer;
begin
  If regime then
  begin
    outp(MF)
  end
  else
  begin
    g:=i;
    i:=iold;
    iold:=g;
    outp(MF)
  end
end;

procedure TMF.CheckBox1Click(Sender: TObject);
begin
  outp(MF);
  Panel5.Clear
end;

procedure TMF.Button4Click(Sender: TObject);
var s: PAnsiChar;
begin
  (*case Combobox1.ItemIndex of
    0:s:='GE.txt';
    1:s:='HR.txt';
    2:s:='econom.txt';
    3:s:='mil.txt';
    4:s:='comcor.txt';
    5:s:='video.txt';
    6:s:='ALL.txt';
  end;*)
  s:='dictionary.txt';
  ShellExecute(Application.Handle,
    'open',
    'c:\windows\notepad.exe',
    s,
    nil,
    SW_SHOWNORMAL);
end;

procedure TMF.Button5Click(Sender: TObject);
begin
  if b5 then
  begin
    if (Panel4.Text='')or(L<1) then exit;
    Rereading;
    zhr(2);
    Dec(L);
    Saving;
    gen;
    Button5.Caption:='Отмена'
  end
  else
  begin
    if Checkbox1.Checked then
    begin
      Edit1.Text:=Panel5.Text;
      Edit2.Text:=Panel4.Text;
    end
    else
    begin
      Edit1.Text:=Panel4.Text;
      Edit2.Text:=Panel5.Text;
    end;
    Button1Click(Button1);
    Edit1.Clear;
    Edit2.Clear;
    Button5.Caption:='Delete'
  end;
  b5:=not b5;
end;

procedure TMF.Button2Click(Sender: TObject);
var j: integer;
begin
  Edit1.Text:='';
  Edit2.Text:='';
  if Editing then
  begin
    Button2.Caption:='Edit';
    Editing:=false;
    exit
  end
  else
  begin
    Button2.Caption:='Отмена';
    Editing:=true;
  end;
  for j:=1 to length(A[i].frn) do
  begin
    if A[i].frn[j]=#10 then Edit1.Text:=Edit1.Text+'\'
    else if A[i].frn[j]<>#13 then Edit1.Text:=Edit1.Text+A[i].frn[j];
  end;
  for j:=1 to length(A[i].rus) do
  begin
    if A[i].rus[j]=#10 then Edit2.Text:=Edit2.Text+'\'
    else if A[i].rus[j]<>#13 then Edit2.Text:=Edit2.Text+A[i].rus[j];
  end;
end;

procedure TMF.Panel1Click(Sender: TObject);
var i: byte;
begin
  Edit1.Clear;
  for i:=0 to 255 do Edit1.Text:=Edit1.Text+chr(i)+' -'+inttostr(i)+'|';
end;

procedure TMF.Edit1Enter(Sender: TObject);
begin
  LoadKeyboardLayout('00000409', 1)
end;

procedure TMF.Edit2Enter(Sender: TObject);
begin
  LoadKeyboardLayout('00000419', 1)
end;

procedure TMF.UP(p: integer);
begin
  case a[i].mark+p of
    5: RadioButton1Click(MF);
    4: RadioButton2Click(MF);
    3: RadioButton3Click(MF);
    2: RadioButton4Click(MF);
  end;
end;

procedure TMF.Panel4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    $25:Panel4Click(MF);
    $26: UP(1);
    $27:Panel5Click(MF);
    $28: UP(-1);
    vk_BACK: Button3Click(MF);
  end;
end;

procedure TMF.ComboBox1Change(Sender: TObject);
begin
  Rereading;
end;

end.
