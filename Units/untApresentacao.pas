unit untApresentacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Imaging.GIFImg, SimpleDS;

type
  TfrmApresentacao = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure animacao;
  end;

var
  frmApresentacao: TfrmApresentacao;

implementation

{$R *.dfm}

uses untDM, untRotinas;

procedure TfrmApresentacao.animacao;
var i: Integer;
begin
    for i := 0 to 100 do begin
      Sleep(40);
      Application.ProcessMessages;
    end;
    Sleep(1000);
end;

procedure TfrmApresentacao.FormCreate(Sender: TObject);
begin
    Self.AlphaBlend      := True;
    Self.AlphaBlendValue := 0;
    Timer1.Interval      := 15;
    Timer1.Enabled       := True;
end;

procedure TfrmApresentacao.Timer1Timer(Sender: TObject);
begin
    if Self.AlphaBlendValue > 250 then begin
      Self.AlphaBlendValue := 255;
      Timer1.Enabled := False;
    end
    else Self.AlphaBlendValue := Self.AlphaBlendValue + 3;
end;

end.
