unit untRemetenteCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons;

type
  TfrmRemetenteCliente = class(TForm)
    dbgCliente: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure dbgClienteDblClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbgClienteKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    Destinatario : string;
  end;

var
  frmRemetenteCliente: TfrmRemetenteCliente;

implementation

{$R *.dfm}

uses untDM, untRemetente;

procedure TfrmRemetenteCliente.dbgClienteDblClick(Sender: TObject);
begin
    if DM.sdsRemetenteClienteEMAIL.AsString <> '' then
      Destinatario := DM.sdsRemetenteClienteEMAIL.AsString;
    Close;
end;

procedure TfrmRemetenteCliente.dbgClienteKeyPress(Sender: TObject;
  var Key: Char);
begin
    if key = #13 then begin
      if DM.sdsRemetenteClienteEMAIL.AsString <> '' then
        Destinatario := DM.sdsRemetenteClienteEMAIL.AsString;
      Close;
    end;
end;

procedure TfrmRemetenteCliente.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #27 then
      Close;
end;

procedure TfrmRemetenteCliente.FormShow(Sender: TObject);
begin
    DM.sdsRemetenteCliente.Close;
    DM.sdsRemetenteCliente.DataSet.CommandText := ' select NOME, EMAIL from CLI00 '+
                                                  ' where (email <> '+QuotedStr('')+' and email is not null) ';
    DM.sdsRemetenteCliente.Open;

    Destinatario := '';
end;

end.
