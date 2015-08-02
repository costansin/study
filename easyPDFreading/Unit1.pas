unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Startbtn: TButton;
    Tmr: TTimer;
    procedure StartbtnClick(Sender: TObject);
    procedure TmrTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  PageCountEdit: HWND;
  s: ANSIString;
  l,v,vprev: integer;

implementation

{$R *.dfm}

procedure TForm1.StartbtnClick(Sender: TObject);
var SumatraPDFWindow, ReBarWindow32stuff, ToolbarWindow32stuff: HWND;
begin
  Randomize;
  SumatraPDFWindow := FindWindow('SUMATRA_PDF_FRAME',nil);
  ReBarWindow32stuff := FindWindowEx(SumatraPDFWindow, 0, 'ReBarWindow32', nil);
  ToolbarWindow32stuff := FindWindowEx(ReBarWindow32stuff, 0, 'ToolbarWindow32', nil);
  PageCountEdit := FindWindowEx(ToolbarWindow32stuff, 0, 'Edit', nil);
  //PageCountEdit := FindWindowEx(ToolbarWindow32stuff, 0, nil, 'Страница:');
  //if PageCountEdit<>0 then ShowMessage('0');
  //SetWindowText(PageCountEdit, '0');
//SumatraPDFWindow := FindWindow('Notepad',nil);
//SetWindowText(PageCountEdit, 'wasup');
//  SendMessage(PageCountEdit, wm_SetText, 0, lparam(lpctstr('35')));
//  GetWindowText(PageCountEdit, s, 2);
  s := 'tralalalalalala';  //kinda initialization, it's magic
  Tmr.Enabled:=true;
  Hide;
end;

procedure TForm1.TmrTimer(Sender: TObject);
begin
  l := SendMessage(PageCountEdit, WM_GETTEXT, 10, lparam(@s[1]));
  Caption:=copy(s,1,l);
  v := StrToInt(copy(s, 1, l ));
  if (v-vprev=1) then
  begin
    vprev:=v;
    if Random<0.1 then ShowMessage('УРА!');
  end;
  vprev:=v;
end;

end.
