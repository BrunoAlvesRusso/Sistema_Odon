unit untSobre;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.DBCtrls;

type
  TfrmSobre = class(TForm)
    Shape1: TShape;
    sbtOk: TSpeedButton;
    Label1: TLabel;
    DBText1: TDBText;
    Image1: TImage;
    Label2: TLabel;
    procedure sbtOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSobre: TfrmSobre;

implementation

{$R *.dfm}

uses untDM;

procedure TfrmSobre.FormShow(Sender: TObject);
begin
    DM.sdsGerenciador.Close;
    DM.sdsGerenciador.Open;
end;

procedure TfrmSobre.sbtOkClick(Sender: TObject);
begin
    Close;
end;

end.
