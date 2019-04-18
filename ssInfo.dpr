program ssInfo;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {FormMain},
  DataModule in 'DataModule.pas' {DMU: TDataModule},
  LoginForm in 'LoginForm.pas' {FormLogin},
  ConnectionForm in 'ConnectionForm.pas' {FormConnection},
  PregOver42Form in 'PregOver42Form.pas' {FormPregOver42},
  UnitAll in 'UnitAll.pas',
  test in 'test.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TDMU, DMU);
  Application.Run;
end.
