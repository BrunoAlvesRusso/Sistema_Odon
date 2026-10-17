unit untConProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Menus, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, SQLExpr, Vcl.DBCtrls;

type
  TfrmConProduto = class(TForm)
    sbtAlterar: TSpeedButton;
    sbtCancelar: TSpeedButton;
    sbtExcluir: TSpeedButton;
    gbxPesquisar: TGroupBox;
    lblPor: TLabel;
    sbtPesquisar: TSpeedButton;
    cbxFiltro: TComboBox;
    edtDescricao: TEdit;
    dbgProduto: TDBGrid;
    MainMenu1: TMainMenu;
    Fechar1: TMenuItem;
    stbBarra: TStatusBar;
    dblFornecedor: TDBLookupComboBox;
    ImprimirCtrlP1: TMenuItem;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure sbtPesquisarMouseLeave(Sender: TObject);
    procedure sbtPesquisarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbtExcluirMouseLeave(Sender: TObject);
    procedure sbtExcluirMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbtCancelarMouseLeave(Sender: TObject);
    procedure sbtCancelarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbtAlterarMouseLeave(Sender: TObject);
    procedure sbtAlterarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbtPesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbxFiltroChange(Sender: TObject);
    procedure sbtCancelarClick(Sender: TObject);
    procedure sbtAlterarClick(Sender: TObject);
    procedure sbtExcluirClick(Sender: TObject);
    procedure dbgProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure dbgProdutoDblClick(Sender: TObject);
    procedure dbgProdutoTitleClick(Column: TColumn);
    procedure ImprimirCtrlP1Click(Sender: TObject);
    procedure dblFornecedorKeyPress(Sender: TObject; var Key: Char);
    procedure Fechar1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LimpaCampos;
  end;

var
  frmConProduto: TfrmConProduto;

implementation

{$R *.dfm}

uses untDM, untCadProduto, untRotinas, untCadVenda, untDMReport;

procedure TfrmConProduto.cbxFiltroChange(Sender: TObject);
begin
    case cbxFiltro.ItemIndex of
      0: // DESCRIÇÃO
        begin
          edtDescricao.Visible  := True;
          dblFornecedor.Visible := False;
          edtDescricao.Clear;
        end;
      1: // FORNECEDOR
        begin
          edtDescricao.Visible  := False;
          dblFornecedor.Visible := True;
          dblFornecedor.KeyValue := null;
          DM.sdsFornecedor.Close;
          DM.sdsFornecedor.Open;
        end;
    end;
    DM.sdsProduto.Close;
end;

procedure TfrmConProduto.dbgProdutoDblClick(Sender: TObject);
begin
    sbtAlterar.Click;
end;

procedure TfrmConProduto.dbgProdutoKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #13 then
      sbtAlterar.Click;
end;

procedure TfrmConProduto.dbgProdutoTitleClick(Column: TColumn);
begin
    DM.sdsProduto.IndexFieldNames := Column.FieldName;
end;

procedure TfrmConProduto.dblFornecedorKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #8 then
      dblFornecedor.KeyValue := null;
end;

procedure TfrmConProduto.Fechar1Click(Sender: TObject);
begin
    Close;
end;

procedure TfrmConProduto.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #27 then
      Close;
end;

procedure TfrmConProduto.FormShow(Sender: TObject);
begin
    LimpaCampos;
end;

procedure TfrmConProduto.ImprimirCtrlP1Click(Sender: TObject);
begin
    if (DM.sdsProduto.Active) and (DM.sdsProduto.RecordCount > 0) then
      DMReport.frxRptProduto.ShowReport;
end;

procedure TfrmConProduto.LimpaCampos;
begin
    cbxFiltro.ItemIndex := 0;
    edtDescricao.Visible := True;
    dblFornecedor.Visible := False;
    DM.sdsProduto.Close;
    sbtAlterar.Enabled := False;
    sbtExcluir.Enabled := False;
    edtDescricao.Clear;

    stbBarra.Panels[0].Text := '';
end;

procedure TfrmConProduto.sbtAlterarClick(Sender: TObject);
begin
    gAlterar := True;
    Close;
end;

procedure TfrmConProduto.sbtAlterarMouseLeave(Sender: TObject);
begin
    sbtAlterar.Caption := '';
end;

procedure TfrmConProduto.sbtAlterarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    sbtAlterar.Caption := 'Alterar';
end;

procedure TfrmConProduto.sbtCancelarClick(Sender: TObject);
begin
    LimpaCampos;
end;

procedure TfrmConProduto.sbtCancelarMouseLeave(Sender: TObject);
begin
    sbtCancelar.Caption := '';
end;

procedure TfrmConProduto.sbtCancelarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    sbtCancelar.Caption := 'Cancelar';
end;

procedure TfrmConProduto.sbtExcluirClick(Sender: TObject);
begin
    frmCadProduto.InsertUpdateDelete(2);
    sbtPesquisar.Click;
end;

procedure TfrmConProduto.sbtExcluirMouseLeave(Sender: TObject);
begin
    sbtExcluir.Caption := '';
end;

procedure TfrmConProduto.sbtExcluirMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    sbtExcluir.Caption := 'Excluir';
end;

procedure TfrmConProduto.sbtPesquisarClick(Sender: TObject);
var vSQL : string;
begin
    vSQL := 'select * from PRO00 a '+
            'left join FOR00 b on b.INDICE = a.NU_FORNECEDOR '+
            'where not DESCRICAO is null ';

    case cbxFiltro.ItemIndex of
      0: // DESCRIÇÃO
        begin
          if Trim(edtDescricao.Text) <> '' then
          vSQL := vSQL + ' and DESCRICAO like '+QuotedStr('%'+edtDescricao.Text+'%');
        end;
      1: // FORNECEDOR
        begin
          if dblFornecedor.Text <> '' then
            vSQL := vSQL + ' and NU_FORNECEDOR = '+QuotedStr(dblFornecedor.KeyValue);
        end;
    end;

    vSQL := vSQL + ' order by DESCRICAO';

    with DM do begin

      try
        TRANSACAO.TransactionID := DM.NewTransactionID;
        TRANSACAO.IsolationLevel := xilREPEATABLEREAD;

        with sdsProduto do begin
          Close;
          DataSet.CommandText := vSQL;
          Open;
        end;

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

    stbBarra.Panels[0].Text := 'Encontrado(s) ' +IntToStr(DM.sdsProduto.RecordCount)+' registro(s)' ;

    if DM.sdsProduto.RecordCount > 0 then begin
      sbtAlterar.Enabled := True;
      sbtExcluir.Enabled := True;
    end
    else begin
      sbtAlterar.Enabled := False;
      sbtExcluir.Enabled := False;
    end;
end;

procedure TfrmConProduto.sbtPesquisarMouseLeave(Sender: TObject);
begin
    sbtPesquisar.Caption := '';
end;

procedure TfrmConProduto.sbtPesquisarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    sbtPesquisar.Caption := 'Pesquisar';
end;

end.
