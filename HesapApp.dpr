program HesapApp;

uses
  System.StartUpCopy,
  FMX.Forms,
  MainHesap in 'MainHesap.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
