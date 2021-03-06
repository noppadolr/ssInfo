﻿unit PregOver42Form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxRibbonSkins, dxSkinsCore, dxSkinsDefaultPainters,
  dxRibbonCustomizationForm, dxStatusBar, dxRibbonStatusBar, cxClasses, dxBar,
  dxRibbon, Data.DB, DBAccess, MyAccess, MemDS, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  cxDataControllerConditionalFormattingRulesManagerDialog, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxGridCustomView, cxGrid, cxTextEdit;

type
  TFormPregOver42 = class(TForm)
    dxRibbon1Tab1: TdxRibbonTab;
    dxRibbon1: TdxRibbon;
    dxBarManager1: TdxBarManager;
    dxRibbonStatusBar1: TdxRibbonStatusBar;
    btnExportExcel: TdxBarLargeButton;
    PintReport: TdxBarLargeButton;
    dxBarManager1Bar2: TdxBar;
    btnNameList: TdxBarLargeButton;
    MyQuery1: TMyQuery;
    MyDataSource1: TMyDataSource;
    cxGridSumDBTableView1: TcxGridDBTableView;
    cxGridSumLevel1: TcxGridLevel;
    cxGridSum: TcxGrid;
    cxGridSumDBTableView1HOSPCODE: TcxGridDBColumn;
    cxGridSumDBTableView1hosname: TcxGridDBColumn;
    cxGridSumDBTableView1c: TcxGridDBColumn;
    btnReport: TdxBarLargeButton;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    cxGridListDBTableView1: TcxGridDBTableView;
    cxGridListLevel1: TcxGridLevel;
    cxGridList: TcxGrid;
    qNameList: TMyQuery;
    DNameList: TMyDataSource;
    cxGridListDBTableView1HOSPCODE: TcxGridDBColumn;
    cxGridListDBTableView1PID: TcxGridDBColumn;
    cxGridListDBTableView1NAME: TcxGridDBColumn;
    cxGridListDBTableView1age_y: TcxGridDBColumn;
    cxGridListDBTableView1GRAVIDA: TcxGridDBColumn;
    cxGridListDBTableView1LMP: TcxGridDBColumn;
    cxGridListDBTableView1EDC: TcxGridDBColumn;
    cxGridListDBTableView1pregageweek: TcxGridDBColumn;
    cxGridListDBTableView1VDRL_RESULT: TcxGridDBColumn;
    cxGridListDBTableView1HB_RESULT: TcxGridDBColumn;
    cxGridListDBTableView1THALASSEMIA: TcxGridDBColumn;
    cxGridListDBTableView1HCT_RESULT: TcxGridDBColumn;
    cxGridListDBTableView1DATE_HCT: TcxGridDBColumn;
    cxGridListDBTableView1hosname: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    procedure FormCreate(Sender: TObject);
    procedure btnNameListClick(Sender: TObject);
    procedure btnReportClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPregOver42: TFormPregOver42;

implementation

{$R *.dfm}

uses AllUnit, ConnectionForm, DataModule, LoginForm, MainForm;
const fname='รายงานหญิงตั้งครรภ์ที่มีอายุครรภ์เกิน 42 สัปดาห์';
procedure TFormPregOver42.btnNameListClick(Sender: TObject);
begin
  cxGridsum.Visible:=False;
  btnNameList.Enabled:=false;
  btnReport.Enabled:=true;
  cxGridlist.Visible:=true;
  cxGridList.Align:=alClient;
end;

procedure TFormPregOver42.btnReportClick(Sender: TObject);
begin
    cxGridSum.Visible:=true;
    btnNameList.Enabled:=true;
    btnReport.Enabled:=false;
    cxGridlist.Visible:=false;

end;

procedure TFormPregOver42.FormCreate(Sender: TObject);
begin
  dxRibbonStatusBar1.Panels[1].Text:=FormMain.dxRibbonStatusBar1.Panels[1].Text;
  Caption:=FormMain.Caption+' :: '+fname;
  MyQuery1.Open;
   cxGridlist.Visible:=false;
   btnReport.Enabled:=false;


end;

end.
