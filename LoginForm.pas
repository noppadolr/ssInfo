﻿unit LoginForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, dxGDIPlusClasses,
  Vcl.StdCtrls,inifiles;

type
  TFormLogin = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    btnConnectiomSetting: TButton;
    EdtUser: TEdit;
    EdtPassword: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    BtnLogin: TButton;
    BtnCancel: TButton;
    procedure BtnCancelClick(Sender: TObject);
    procedure btnConnectiomSettingClick(Sender: TObject);
    procedure BtnLoginClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormLogin: TFormLogin;

implementation

{$R *.dfm}

uses  Mainform, AllUnit, DataModule, ConnectionForm;

procedure TFormLogin.BtnCancelClick(Sender: TObject);
begin
Application.Terminate;
end;



procedure TFormLogin.btnConnectiomSettingClick(Sender: TObject);
begin
    if FormConnection=nil then FormConnection:=TFormConnection.Create(self);
    FormConnection.ShowModal;


end;

procedure TFormLogin.BtnLoginClick(Sender: TObject);
begin
    DMU.MyConnection1.Close;
    edtUser.Text:='05964';
    edtPassword.Text:='0000000000002';
    with dmu.MyQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT ');
      SQL.Add(' pr.HOSPCODE,pr.CID');
      SQL.Add(',concat(cp.detail,pr.`NAME`,"   ",pr.LNAME)as name');
      SQL.Add(',pr.PROVIDERTYPE');
      SQL.Add(',ct.providertype');
      sql.Add(',h.hosname');
      SQL.Add('FROM provider as pr');
      SQL.Add('LEFT JOIN cprename as cp on pr.PRENAME=cp.id_prename');
      SQL.Add('LEFT JOIN cprovidertype as ct on pr.PROVIDERTYPE=ct.id_providertype');
      sql.Add('LEFT JOIN chospital as h on pr.HOSPCODE=h.hoscode');
      SQL.Add('');
      SQL.Add('WHERE pr.HOSPCODE='+Trim(edtUser.Text));
      SQL.Add('AND pr.CID='+Trim(edtPassword.Text));
      SQL.Add('');
      SQL.Add('GROUP BY concat(pr.HOSPCODE,pr.CID)');
      SQL.Add('');
      Open;
    end;

    if dmu.MyQuery1.RecordCount>0 then
    begin
     //ShowMessage('ล้อกอินแล้ว'+dmu.MyQuery1.FieldByName('name').AsString);
     FormMain.con_user:=dmu.MyConnection1.Username;
     FormMain.con_pasw:=dmu.MyConnection1.Password;
     FormMain.con_db:=dmu.MyConnection1.Database;
     FormMain.con_server:=dmu.MyConnection1.Server;
     FormMain.con_port:=dmu.MyConnection1.Port.ToString;
     FormMain.user_name:='ผุ้เข้าใช้งานระบบ  :  '+dmu.MyQuery1.FieldByName('name').AsString;
     Application.Title:='Sansai Info'+' - '+dmu.MyQuery1.FieldByName('hosname').AsString;
     FormMain.login:=true;
     Self.Close;
     FormMain.Show;
    end

    else
      if dmu.MyQuery1.RecordCount=0 then
            begin
            Application.Title:='Sansai Info' ;
            ShowMessage('ชื่อผู้ใช้ หรือ รหัสผ่าน ไม่ถูกต้อง');
      end;




end;

procedure TFormLogin.FormCreate(Sender: TObject);
begin
    Caption :=FormMain.AppName+' - '+'Login เพื่อเข้าระบบ';
end;

end.
