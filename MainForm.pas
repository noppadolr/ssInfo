unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxRibbonSkins, dxSkinsCore, dxSkinsDefaultPainters,
  dxRibbonCustomizationForm, cxClasses, dxBar, dxRibbon, dxStatusBar,
  dxRibbonStatusBar, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxNavigator, dxDateRanges,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid;

type
  TFormMain = class(TForm)
    dxRibbon1Tab1: TdxRibbonTab;
    dxRibbon1: TdxRibbon;
    dxBarManager1: TdxBarManager;
    dxRibbonStatusBar1: TdxRibbonStatusBar;
    dxRibbon1Tab2: TdxRibbonTab;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);

   const  AppName  = 'Sansai Info';
  private
    { Private declarations }
  public
    user_name,user_login,dbms,pasw,cid,hcode,mainhcode,dcscript,hdcscript,cupscript,xlocal : string;
    con_user,con_pasw,con_db,con_server,con_port,xversion,hosname,offid506 : string;
    dwcon_user,dwcon_pasw,dwcon_db,dwcon_server,dwcon_port : string;
    TraceString : TStringList;
    login,first : Boolean;
    stLat,stLng,mysqlver : string;


  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

uses DataModule, AllUnit, LoginForm;

procedure TFormMain.FormActivate(Sender: TObject);
begin
dxRibbon1.Visible:=false;
dxRibbon1.Visible:=true;
if not login then FormLogin.ShowModal;

end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
login:=false;
first:=true;


if not login then
  begin
    if FormLogin=nil then
        begin
        FormLogin:=TFormLogin.Create(self);

    end;
  end;

end;

procedure TFormMain.FormShow(Sender: TObject);
begin
      self.SetFocus;
      dxRibbonStatusBar1.Panels[1].Text := user_name;
      self.Caption:=Application.Title;
end;

end.
