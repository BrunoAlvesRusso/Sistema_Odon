unit untHistorico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls;

type
  TfrmHistorico = class(TForm)
    dbgHistorico: TDBGrid;
    MainMenu1: TMainMenu;
    Sair1: TMenuItem;
    StatusBar1: TStatusBar;
    procedure Sair1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHistorico: TfrmHistorico;

implementation

{$R *.dfm}

uses untDM;

procedure TfrmHistorico.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #27 then
      Close;
end;

procedure TfrmHistorico.Sair1Click(Sender: TObject);
begin
    Close;
end;

end.
