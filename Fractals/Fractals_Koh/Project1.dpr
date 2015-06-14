program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {MF};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMF, MF);
  Application.Run;
end.
