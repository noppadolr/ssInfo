unit DataModule;

interface

uses
  System.SysUtils, System.Classes, Data.DB, DBAccess, MyAccess, MemDS;

type
  TDMU = class(TDataModule)
    MyConnection1: TMyConnection;
    MyQuery1: TMyQuery;
    MyDataSource1: TMyDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMU: TDMU;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses MainForm;

{$R *.dfm}

end.
