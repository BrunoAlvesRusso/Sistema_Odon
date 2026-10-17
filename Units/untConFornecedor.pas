unit untConFornecedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ComCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, Data.SqlExpr;

type
  TfrmConFornecedor = class(TForm)
    sbtAlterar: TSpeedButton;
    sbtCancelar: TSpeedButton;
    sbtExcluir: TSpeedButton;
    gbxPesquisar: TGroupBox;
    lblPor: TLabel;
    sbtPesquisar: TSpeedButton;
    lblSituacao: TLabel;
    cbxFiltro: TComboBox;
    edtNome: TEdit;
    mskCNPJ: TMaskEdit;
    cbxSituação: TComboBox;
    dbgFornecedor: TDBGrid;
    stbFornecedor: TStatusBar;
    MainMenu1: TMainMenu;
    Fechar1: TMenuItem;
    ImprimirCtrlP1: TMenuItem;
    procedure cbxFiltroChange(Sender: TObject);
    procedure Fechar1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure sbtAlterarClick(Sender: TObject);
    procedure sbtAlterarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbtAlterarMouseLeave(Sender: TObject);
    procedure sbtCancelarClick(Sender: TObject);
    procedure sbtCancelarMouseLeave(Sender: TObject);
    procedure sbtCancelarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbtPesquisarClick(Sender: TObject);
    procedure sbtPesquisarMouseLeave(Sender: TObject);
    procedure sbtPesquisarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbtExcluirClick(Sender: TObject);
    procedure sbtExcluirMouseLeave(Sender: TObject);
    procedure sbtExcluirMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure dbgFornecedorDblClick(Sender: TObject);
    procedure dbgFornecedorKeyPress(Sender: TObject; var Key: Char);
    procedure dbgFornecedorTitleClick(Column: TColumn);
    procedure ImprimirCtrlP1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LimpaCampos;
  end;

var
  frmConFornecedor: TfrmConFornecedor;

implementation

{$R *.dfm}

uses untDM, untCadFornecedor, untRotinas, untDMReport;

procedure TfrmConFornecedor.cbxFiltroChange(Sender: TObject);
begin
    case cbxFiltro.ItemIndex of
      0, 2, 3: // cidade, razão social, nome fantasia
        begin
          mskCNPJ.Visible := False;
          edtNome.Visible := True;
          edtNome.Clear;
          edtNome.SetFocus;
        end;
      1: // cnpj
        begin
          mskCNPJ.Visible := True;
          edtNome.Visible := False;
          mskCNPJ.Clear;
          mskCNPJ.SetFocus;
        end;
    end;
    DM.sdsFornecedor.Close;
end;

procedure TfrmConFornecedor.dbgFornecedorDblClick(Sender: TObject);
begin
    sbtAlterar.Click;
end;

procedure TfrmConFornecedor.dbgFornecedorKeyPress(Sender: TObject;
  var Key: Char);
begin
    if key = #13 then
      sbtAlterar.Click;
end;

procedure TfrmConFornecedor.dbgFornecedorTitleClick(Column: TColumn);
begin
    DM.sdsFornecedor.IndexFieldNames := Column.FieldName;
end;

procedure TfrmConFornecedor.Fechar1Click(Sender: TObject);
begin
    Close;
end;

procedure TfrmConFornecedor.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #27 then
      Close;
end;

procedure TfrmConFornecedor.FormShow(Sender: TObject);
begin
    LimpaCampos;
    cbxFiltro.ItemIndex := 2;
end;

procedure TfrmConFornecedor.ImprimirCtrlP1Click(Sender: TObject);
begin
    if (DM.sdsFornecedor.Active) and (DM.sdsFornecedor.RecordCount > 0) then
      DMReport.frxRptFornecedor.ShowReport;
end;

procedure TfrmConFornecedor.LimpaCampos;
var Sender: TObject;
begin
    cbxFiltro.ItemIndex   := 2;
    cbxSituação.ItemIndex := 3;
    cbxFiltro.OnChange(Sender);
    stbFornecedor.Panels[0].Text := '';
    sbtExcluir.Enabled := False;
    sbtAlterar.Enabled := False;
end;

procedure TfrmConFornecedor.sbtAlterarClick(Sender: TObject);
begin
    gAlterar := True;
    Close;
end;

procedure TfrmConFornecedor.sbtAlterarMouseLeave(Sender: TObject);
begin
    sbtAlterar.Caption := '';
end;

procedure TfrmConFornecedor.sbtAlterarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    sbtAlterar.Caption := 'Alterar';
end;

procedure TfrmConFornecedor.sbtCancelarClick(Sender: TObject);
begin
    LimpaCampos;
end;

procedure TfrmConFornecedor.sbtCancelarMouseLeave(Sender: TObject);
begin
    sbtCancelar.Caption := '';
end;

procedure TfrmConFornecedor.sbtCancelarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    sbtCancelar.Caption := 'Cancelar';
end;

procedure TfrmConFornecedor.sbtExcluirClick(Sender: TObject);
begin
    frmCadFornecedor.InsertUpdateDelete(2);
    sbtPesquisar.Click;
end;

procedure TfrmConFornecedor.sbtExcluirMouseLeave(Sender: TObject);
begin
    sbtExcluir.Caption := '';
end;

procedure TfrmConFornecedor.sbtExcluirMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    sbtExcluir.Caption := 'Excluir';
end;

procedure TfrmConFornecedor.sbtPesquisarClick(Sender: TObject);
var vSQL : string;
begin
    vSQL := 'select * from FOR00 a where not a.RAZAO_SOCIAL is null';

    case cbxFiltro.ItemIndex of
      0: // cidade
        begin
          vSQL := vSQL + ' and a.CIDADE like '+QuotedStr('%'+trim(edtNome.Text)+'%');
        end;
      1: // CNPJ
        begin
          if Trim(mskCNPJ.Text) = '' then begin
            DM.sdsFornecedor.Close;
            Informacao('Atenção', 'Digite o número do CNPJ para efetuar a busca.');
            mskCNPJ.SetFocus;
            Exit;
          end
          else
            vSQL := vSQL + ' and a.CNPJ = '+QuotedStr(mskCNPJ.Text);
        end;
      2: //nome fantasia
        begin
          vSQL := vSQL + ' and a.NOME_FANTASIA like '+QuotedStr('%'+trim(edtNome.Text)+'%');
        end;
      3: // Razão Social
        begin
          vSQL := vSQL + ' and a.RAZAO_SOCIAL like '+QuotedStr('%'+trim(edtNome.Text)+'%');
        end;

    end;

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

    vSQL := vSQL + ' order by a.NOME_FANTASIA';

    with DM do begin

      try
        TRANSACAO.TransactionID := DM.NewTransactionID;
        TRANSACAO.IsolationLevel := xilREPEATABLEREAD;

        with sdsFornecedor do begin
          Close;
          DataSet.CommandText := vSQL;
          Open;
        end; // fim with sdsFornecedor

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

    stbFornecedor.Panels[0].Text := 'Encontrado(s) ' +IntToStr(DM.sdsFornecedor.RecordCount)+' registro(s)' ;

    if DM.sdsFornecedor.RecordCount > 0 then begin
      sbtAlterar.Enabled := True;
      sbtExcluir.Enabled := True;
    end
    else begin
      sbtAlterar.Enabled := False;
      sbtExcluir.Enabled := False;
    end;

end;

procedure TfrmConFornecedor.sbtPesquisarMouseLeave(Sender: TObject);
begin
    sbtPesquisar.Caption := '';
end;

procedure TfrmConFornecedor.sbtPesquisarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    sbtPesquisar.Caption := 'Pesquisar';
end;

end.
