unit untImagemHistorico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls;

type
  TfrmImagemHistorico = class(TForm)
    MainMenu1: TMainMenu;
    Fechar1: TMenuItem;
    Imagem1: TImage;
    procedure Fechar1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImagemHistorico: TfrmImagemHistorico;

implementation

{$R *.dfm}

procedure TfrmImagemHistorico.Fechar1Click(Sender: TObject);
begin
    Close;
end;

end.
