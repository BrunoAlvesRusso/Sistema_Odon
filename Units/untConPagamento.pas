unit untConPagamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.Grids, Vcl.DBGrids,
  Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls, SqlExpr, Vcl.ExtCtrls, SimpleDS;

type
  TfrmConPagamento = class(TForm)
    sbtAlterar: TSpeedButton;
    sbtCancelar: TSpeedButton;
    sbtExcluir: TSpeedButton;
    gbxPesquisar: TGroupBox;
    lblDescricao: TLabel;
    sbtPesquisar: TSpeedButton;
    edtDescricao: TEdit;
    dbgProduto: TDBGrid;
    MainMenu1: TMainMenu;
    Fechar1: TMenuItem;
    stbBarra: TStatusBar;
    rgpSituacao: TRadioGroup;
    ImprimirCtrlP1: TMenuItem;
    dblProfissional: TDBLookupComboBox;
    Label5: TLabel;
    GroupBox1: TGroupBox;
    cbxPeriodo: TComboBox;
    dtpDe: TDateTimePicker;
    lblDe: TLabel;
    lblAte: TLabel;
    dtpAte: TDateTimePicker;
    lblTotal: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Fechar1Click(Sender: TObject);
    procedure sbtExcluirClick(Sender: TObject);
    procedure sbtCancelarClick(Sender: TObject);
    procedure dbgProdutoTitleClick(Column: TColumn);
    procedure sbtPesquisarClick(Sender: TObject);
    procedure sbtPesquisarMouseLeave(Sender: TObject);
    procedure sbtPesquisarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbtExcluirMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbtExcluirMouseLeave(Sender: TObject);
    procedure sbtCancelarMouseLeave(Sender: TObject);
    procedure sbtCancelarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbtAlterarMouseLeave(Sender: TObject);
    procedure sbtAlterarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbtAlterarClick(Sender: TObject);
    procedure dbgProdutoDblClick(Sender: TObject);
    procedure dbgProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure cbxPeriodoChange(Sender: TObject);
    procedure ImprimirCtrlP1Click(Sender: TObject);
    procedure dblProfissionalKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LimpaCampos;
  end;

var
  frmConPagamento: TfrmConPagamento;

implementation

{$R *.dfm}

uses untDM, untPagamento, untRotinas, untDMReport;

procedure TfrmConPagamento.cbxPeriodoChange(Sender: TObject);
begin
    if cbxPeriodo.ItemIndex = 0 then begin
      dtpDe.Enabled := False;
      dtpAte.Enabled := False;
    end
    else begin
      dtpDe.Enabled := True;
      dtpAte.Enabled := True;
      dtpDe.Date  := Date - 30;
      dtpAte.Date := Date;
    end;
end;

procedure TfrmConPagamento.dbgProdutoDblClick(Sender: TObject);
begin
    sbtAlterar.Click;
end;

procedure TfrmConPagamento.dbgProdutoKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #13 then
      sbtAlterar.Click;
end;

procedure TfrmConPagamento.dbgProdutoTitleClick(Column: TColumn);
begin
    DM.sdsAPagar.IndexFieldNames := Column.FieldName;
end;

procedure TfrmConPagamento.dblProfissionalKeyPress(Sender: TObject;
  var Key: Char);
begin
    if key = #8 then
      dblProfissional.KeyValue := null;
end;

procedure TfrmConPagamento.Fechar1Click(Sender: TObject);
begin
    Close;
end;

procedure TfrmConPagamento.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #27 then
      Close;
end;

procedure TfrmConPagamento.FormShow(Sender: TObject);
begin
    LimpaCampos;
end;

procedure TfrmConPagamento.ImprimirCtrlP1Click(Sender: TObject);
begin
    if (DM.sdsAPagar.Active) and (DM.sdsAPagar.RecordCount > 0) then
      DMReport.frxRptDespesas.ShowReport;
end;

procedure TfrmConPagamento.LimpaCampos;
begin
    cbxPeriodo.ItemIndex := 0;
    edtDescricao.Clear;
    edtDescricao.SetFocus;
    sbtAlterar.Enabled := False;
    sbtExcluir.Enabled := False;
    DM.sdsAPagar.Close;
    stbBarra.Panels[0].Text := '';
    dblProfissional.KeyValue := null;
    dtpDe.Enabled := False;
    dtpAte.Enabled := False;
    lblTotal.Caption := '';
end;

procedure TfrmConPagamento.sbtAlterarClick(Sender: TObject);
begin
    if DM.sdsAPagarSITUACAO.AsString = 'Pago' then begin
      Informacao('Atenção', 'O pagamento deste despesa já foi efetuado.');
      Exit;
    end;
    gAlterar := True;
    Close;
end;

procedure TfrmConPagamento.sbtAlterarMouseLeave(Sender: TObject);
begin
    sbtAlterar.Caption := '';
end;

procedure TfrmConPagamento.sbtAlterarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    sbtAlterar.Caption := 'Selecionar';
end;

procedure TfrmConPagamento.sbtCancelarClick(Sender: TObject);
begin
    LimpaCampos;
end;

procedure TfrmConPagamento.sbtCancelarMouseLeave(Sender: TObject);
begin
    sbtCancelar.Caption := '';
end;

procedure TfrmConPagamento.sbtCancelarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    sbtCancelar.Caption := 'Cancelar';
end;

procedure TfrmConPagamento.sbtExcluirClick(Sender: TObject);
begin
    if DM.sdsAPagarSITUACAO.AsString = 'Pago' then begin
      Informacao('Atenção', 'Você não pode excluir um pagamento efetuado.');
      Exit;
    end;
    frmPagamento.InsertUpdateDelete(2);
    sbtPesquisar.Click;
end;

procedure TfrmConPagamento.sbtExcluirMouseLeave(Sender: TObject);
begin
    sbtExcluir.Caption := '';
end;

procedure TfrmConPagamento.sbtExcluirMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    sbtExcluir.Caption := 'Excluir';
end;

procedure TfrmConPagamento.sbtPesquisarClick(Sender: TObject);
var vSQL : string;
    sdsTemp : TSimpleDataSet;
    total : Double;
begin
    vSQL := ' select * from des00 a '+
            ' inner join col00 b on a.nu_colaborador = b.indice '+
            'where not a.DESCRICAO is null ';


    if Trim(edtDescricao.Text) <> '' then
      vSQL := vSQL + ' and a.DESCRICAO like '+QuotedStr('%'+edtDescricao.Text+'%');

    // profissional
    if dblProfissional.KeyValue <> null then
      vSQL := vSQL + ' and a.NU_COLABORADOR = '+IntToStr(dblProfissional.KeyValue);

    if cbxPeriodo.ItemIndex <> 0 then begin
      if ValidaPeriodo(DateToStr(dtpDe.Date), DateToStr(dtpAte.Date)) then begin
        if cbxPeriodo.ItemIndex = 1 then begin
          vSQL := vSQL + ' and a.DT_PAGAMENTO between :pDT_INI'+
                         ' and :pDT_FIM';
        end
        else begin
          vSQL := vSQL + ' and a.DT_VENCIMENTO between :pDT_INI'+
                         ' and :pDT_FIM';
        end;
      end
      else Exit;
    end;

    if rgpSituacao.ItemIndex <> 0 then
      vSQL := vSQL + ' and a.SITUACAO = '+QuotedStr(rgpSituacao.Items[rgpSituacao.ItemIndex]);

    vSQL := vSQL + ' order by a.DESCRICAO';

    with DM do begin

      try
        TRANSACAO.TransactionID := DM.NewTransactionID;
        TRANSACAO.IsolationLevel := xilREPEATABLEREAD;

        with sdsAPagar do begin
          Close;
          DataSet.CommandText := vSQL;
          if cbxPeriodo.ItemIndex <> 0 then begin
            DataSet.ParamByName('pDT_INI').AsDateTime := dtpDe.DateTime;
            DataSet.ParamByName('pDT_FIM').AsDateTime := dtpAte.DateTime;
          end;
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

    if DM.sdsAPagar.RecordCount > 0 then begin
      sdsTemp := TSimpleDataSet.Create(nil);
      sdsTemp.Connection := DM.CONEXAO;
      sdsTemp.Close;
      sdsTemp.DataSet.CommandText := vSQL;
      if cbxPeriodo.ItemIndex <> 0 then begin
        sdsTemp.DataSet.ParamByName('pDT_INI').AsDateTime := dtpDe.DateTime;
        sdsTemp.DataSet.ParamByName('pDT_FIM').AsDateTime := dtpAte.DateTime;
      end;
      sdsTemp.Open;
      total := 0;
      sdsTemp.First;
      while not sdsTemp.Eof do begin
        total := total + sdsTemp.FieldByName('Valor').AsFloat;
        sdsTemp.Next;
      end;
      lblTotal.Caption := 'Total: '+FormatFloat('R$###,##0.00', total);
      sdsTemp.Free;
    end
    else lblTotal.Caption := '';


    stbBarra.Panels[0].Text := 'Encontrado(s) ' +IntToStr(DM.sdsAPagar.RecordCount)+' registro(s)' ;

    if DM.sdsAPagar.RecordCount > 0 then begin
      sbtAlterar.Enabled := True;
      sbtExcluir.Enabled := True;
    end
    else begin
      sbtAlterar.Enabled := False;
      sbtExcluir.Enabled := False;
    end;
end;

procedure TfrmConPagamento.sbtPesquisarMouseLeave(Sender: TObject);
begin
    sbtPesquisar.Caption := '';
end;

procedure TfrmConPagamento.sbtPesquisarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    sbtPesquisar.Caption := 'Pesquisar';
end;

end.
