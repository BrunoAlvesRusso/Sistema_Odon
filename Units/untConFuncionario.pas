unit untConFuncionario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Mask, Vcl.Buttons, Vcl.Menus, Vcl.Grids, Vcl.DBGrids, SQLExpr;

type
  TfrmConFuncionario = class(TForm)
    sbtAlterar: TSpeedButton;
    sbtCancelar: TSpeedButton;
    sbtExcluir: TSpeedButton;
    gbxPesquisar: TGroupBox;
    lblNome: TLabel;
    sbtPesquisar: TSpeedButton;
    lblSituacao: TLabel;
    edtNome: TEdit;
    cbxSituação: TComboBox;
    dbgFuncionario: TDBGrid;
    MainMenu1: TMainMenu;
    Fechar1: TMenuItem;
    stbFuncionario: TStatusBar;
    ImprimirCtrlP1: TMenuItem;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Fechar1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbtAlterarClick(Sender: TObject);
    procedure sbtAlterarMouseLeave(Sender: TObject);
    procedure sbtAlterarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbtCancelarClick(Sender: TObject);
    procedure sbtCancelarMouseLeave(Sender: TObject);
    procedure sbtCancelarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbtExcluirClick(Sender: TObject);
    procedure sbtExcluirMouseLeave(Sender: TObject);
    procedure sbtExcluirMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbtPesquisarClick(Sender: TObject);
    procedure sbtPesquisarMouseLeave(Sender: TObject);
    procedure sbtPesquisarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure dbgFuncionarioDblClick(Sender: TObject);
    procedure dbgFuncionarioKeyPress(Sender: TObject; var Key: Char);
    procedure dbgFuncionarioTitleClick(Column: TColumn);
    procedure ImprimirCtrlP1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LimpaCampos;
  end;

var
  frmConFuncionario: TfrmConFuncionario;

implementation

{$R *.dfm}

uses untDM, untRotinas, untCadFuncionario, untDMReport;

procedure TfrmConFuncionario.dbgFuncionarioDblClick(Sender: TObject);
begin
    sbtAlterar.Click;
end;

procedure TfrmConFuncionario.dbgFuncionarioKeyPress(Sender: TObject;
  var Key: Char);
begin
    if key = #13 then
      sbtAlterar.Click;
end;

procedure TfrmConFuncionario.dbgFuncionarioTitleClick(Column: TColumn);
begin
    DM.sdsFuncionario.IndexFieldNames := Column.FieldName;
end;

procedure TfrmConFuncionario.Fechar1Click(Sender: TObject);
begin
    Close;
end;

procedure TfrmConFuncionario.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #27 then
      Close;
end;

procedure TfrmConFuncionario.FormShow(Sender: TObject);
begin
    LimpaCampos;
end;

procedure TfrmConFuncionario.ImprimirCtrlP1Click(Sender: TObject);
begin
    if (DM.sdsFuncionario.Active) and (DM.sdsFuncionario.RecordCount > 0) then
      DMReport.frxRptFuncionario.ShowReport;
end;

procedure TfrmConFuncionario.LimpaCampos;
begin
    cbxSituação.ItemIndex := 3;
    edtNome.Clear;
    stbFuncionario.Panels[0].Text := '';
    DM.sdsFuncionario.Close;
    sbtExcluir.Enabled := False;
    sbtAlterar.Enabled := False;
    gAlterar := False;
end;

procedure TfrmConFuncionario.sbtAlterarClick(Sender: TObject);
begin
    gAlterar := True;
    Close;
end;

procedure TfrmConFuncionario.sbtAlterarMouseLeave(Sender: TObject);
begin
    sbtAlterar.Caption := '';
end;

procedure TfrmConFuncionario.sbtAlterarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    sbtAlterar.Caption := 'Alterar';
end;

procedure TfrmConFuncionario.sbtCancelarClick(Sender: TObject);
begin
    LimpaCampos;
end;

procedure TfrmConFuncionario.sbtCancelarMouseLeave(Sender: TObject);
begin
    sbtCancelar.Caption := '';
end;

procedure TfrmConFuncionario.sbtCancelarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    sbtCancelar.Caption := 'Cancelar';
end;

procedure TfrmConFuncionario.sbtExcluirClick(Sender: TObject);
begin
    frmCadFuncionario.InsertUpdateDelete(2);
    sbtPesquisar.Click;
end;

procedure TfrmConFuncionario.sbtExcluirMouseLeave(Sender: TObject);
begin
    sbtExcluir.Caption := '';
end;

procedure TfrmConFuncionario.sbtExcluirMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    sbtExcluir.Caption := 'Excluir';
end;

procedure TfrmConFuncionario.sbtPesquisarClick(Sender: TObject);
var vSQL : string;
begin
    vSQL := 'select * from FUN00 a where not a.NOME is null';

    if Trim(edtNome.Text) <> '' then
      vSQL := vSQL + ' and a.NOME like '+ QuotedStr('%'+edtNome.Text+'%');

    case cbxSituação.ItemIndex of
      0: // ativo
        begin
          vSQL := vSQL + ' and a.SITUACAO = '+QuotedStr('ATIVO');
        end;
      1: // bloqueado
        begin
          vSQL := vSQL + ' and a.SITUACAO = '+QuotedStr('BLOQUEADO');
        end;
      2: // inativo
        begin
          vSQL := vSQL + ' and a.SITUACAO = '+QuotedStr('INATIVO');
        end;
    end;


    vSQL := vSQL + ' order by a.NOME';

    with DM do begin

      try
        TRANSACAO.TransactionID := DM.NewTransactionID;
        TRANSACAO.IsolationLevel := xilREPEATABLEREAD;

        with sdsFuncionario do begin
          Close;
          DataSet.CommandText := vSQL;
          Open;
        end; // fim with sdsFuncionario

        CONEXAO.StartTransaction(TRANSACAO);
        CONEXAO.Commit(DM.TRANSACAO);
      except
        begin
          CONEXAO.Rollback(TRANSACAO);
          Application.MessageBox('Falha na conexão com o banco!', 'Atenção!', MB_ICONERROR + MB_OK);
          Exit;
        end;
      end;

    end; // fim with DM

    stbFuncionario.Panels[0].Text := 'Encontrado(s) ' +IntToStr(DM.sdsFuncionario.RecordCount)+' registro(s)' ;

    if DM.sdsFuncionario.RecordCount > 0 then begin
      sbtAlterar.Enabled := True;
      sbtExcluir.Enabled := True;
    end
    else begin
      sbtAlterar.Enabled := False;
      sbtExcluir.Enabled := False;
    end;
end;

procedure TfrmConFuncionario.sbtPesquisarMouseLeave(Sender: TObject);
begin
    sbtPesquisar.Caption := '';
end;

procedure TfrmConFuncionario.sbtPesquisarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    sbtPesquisar.Caption := 'Pesquisar';
end;

end.
