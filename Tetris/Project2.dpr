program Project2;

uses
  Forms,
  Unit3 in 'Unit3.pas' {MF};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '������';
  Application.CreateForm(TMF, MF);
  Application.Run;
end.
