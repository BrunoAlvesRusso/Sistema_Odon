unit untAviso;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Vcl.Menus;

type
  TfrmAviso = class(TForm)
    GroupBox1: TGroupBox;
    dbgAniversario: TDBGrid;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    dbgAPagar: TDBGrid;
    dbgAReceber: TDBGrid;
    lblAniversariantes: TLabel;
    lblAPagar: TLabel;
    lblAReceber: TLabel;
    PopupMenu1: TPopupMenu;
    EnviarMensagem1: TMenuItem;
    Enviarmensagemparatodos1: TMenuItem;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure dbgAPagarTitleClick(Column: TColumn);
    procedure dbgAReceberTitleClick(Column: TColumn);
    procedure EnviarMensagem1Click(Sender: TObject);
    procedure Enviarmensagemparatodos1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAviso: TfrmAviso;

implementation

{$R *.dfm}

uses untRotinas, untDM, untRemetente;

procedure TfrmAviso.dbgAPagarTitleClick(Column: TColumn);
begin
    DM.sdsAPagar.IndexFieldNames := Column.FieldName;
end;

procedure TfrmAviso.dbgAReceberTitleClick(Column: TColumn);
begin
    DM.sdsAReceber.IndexFieldNames := Column.FieldName;
end;

procedure TfrmAviso.EnviarMensagem1Click(Sender: TObject);
begin
    // Mensagem individual
    if DM.sdsAniversarios.RecordCount > 0 then begin
      frmRemetente := TfrmRemetente.Create(Application);

        with frmRemetente do begin
          ckbTodos.Checked := False;
          ckbTodos.Enabled := False;
          sbtPesquisar.Enabled := False;
          memRemetente.Text := DM.sdsAniversarios.FieldByName('EMAIL').AsString;
          memRemetente.Enabled := False;
        end;

      frmRemetente.ShowModal;
      frmRemetente.Free;
      frmRemetente := nil;
    end
    else begin
      Informacao('Aviso','Nenhum registro encontrado.');
      Exit;
    end;
end;

procedure TfrmAviso.Enviarmensagemparatodos1Click(Sender: TObject);
var emails: string;
begin
    // Enviar a todos
    if DM.sdsAniversarios.RecordCount > 0 then begin
      frmRemetente := TfrmRemetente.Create(Application);

        with frmRemetente do begin
          ckbTodos.Checked := False;
          ckbTodos.Enabled := False;
          sbtPesquisar.Enabled := False;
          DM.sdsAniversarios.First;
          while not DM.sdsAniversarios.Eof do begin
            if DM.sdsAniversarios.FieldByName('EMAIL').AsString <> '' then begin
              if emails = '' then
                emails := DM.sdsAniversarios.FieldByName('EMAIL').AsString
              else emails := emails +'; '+ DM.sdsAniversarios.FieldByName('EMAIL').AsString;
            end;
            DM.sdsAniversarios.Next;
          end;
          memRemetente.Text := emails;
          memRemetente.Enabled := False;
        end;

      frmRemetente.ShowModal;
      frmRemetente.Free;
      frmRemetente := nil;
    end
    else begin
      Informacao('Aviso','Nenhum registro encontrado.');
      Exit;
    end;
end;

procedure TfrmAviso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    DM.sdsCliente.Close;
    DM.sdsAniversarios.Close;
    DM.sdsAPagar.Close;
    DM.sdsAReceber.Close;
end;

procedure TfrmAviso.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #27 then
      Close;
end;

procedure TfrmAviso.FormShow(Sender: TObject);
begin
    lblAniversariantes.Caption := 'Encontrado(s) ' +IntToStr(DM.sdsAniversarios.RecordCount)+' aniversariante(s)';
    lblAPagar.Caption          := 'Encontrado(s) ' +IntToStr(DM.sdsAPagar.RecordCount)+' a pagar';
    lblAReceber.Caption        := 'Encontrado(s) ' +IntToStr(DM.sdsAReceber.RecordCount)+' a receber';
end;

end.
