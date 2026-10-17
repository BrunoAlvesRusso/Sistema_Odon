unit untFechaCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, SimpleDS, SqlExpr;

type
  TfrmFechaCaixa = class(TForm)
    MainMenu1: TMainMenu;
    FecharEsc1: TMenuItem;
    gbxDebitos: TGroupBox;
    dbgDebitos: TDBGrid;
    gbxPesquisa: TGroupBox;
    Label1: TLabel;
    sbtPesquisar: TSpeedButton;
    dblProfissional: TDBLookupComboBox;
    gbxPeriodo: TGroupBox;
    Label2: TLabel;
    lblAte: TLabel;
    dtpDe: TDateTimePicker;
    dtpAte: TDateTimePicker;
    ckbPeriodo: TCheckBox;
    Label3: TLabel;
    lblTotal: TLabel;
    ImprimirCtrlP1: TMenuItem;
    stbBararStatus: TStatusBar;
    Label6: TLabel;
    DBGrid1: TDBGrid;
    Label7: TLabel;
    Label8: TLabel;
    lblTotal3: TLabel;
    EfetuarPagamento1: TMenuItem;
    Label4: TLabel;
    lblLucro: TLabel;
    procedure FecharEsc1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure dblProfissionalKeyPress(Sender: TObject; var Key: Char);
    procedure ckbPeriodoClick(Sender: TObject);
    procedure sbtPesquisarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgDebitosTitleClick(Column: TColumn);
    procedure ImprimirCtrlP1Click(Sender: TObject);
    procedure sbtPesquisarMouseLeave(Sender: TObject);
    procedure sbtPesquisarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure EfetuarPagamento1Click(Sender: TObject);
    procedure dbgDebitosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ConsultaRetirada;
  end;

var
  frmFechaCaixa: TfrmFechaCaixa;

implementation

{$R *.dfm}

uses untDM, untRotinas, untDMReport, untCaixa, untLogin;

procedure TfrmFechaCaixa.ckbPeriodoClick(Sender: TObject);
begin
    if ckbPeriodo.Checked then
      gbxPeriodo.Enabled := True
    else gbxPeriodo.Enabled := False;
end;

procedure TfrmFechaCaixa.ConsultaRetirada;
begin
    DM.sdsRetiradas.Close;
    DM.sdsRetiradas.DataSet.CommandText := ' select * from cxa00 a '+
                                           ' where a.transacao = '+QuotedStr('S')+
                                           ' and a.nu_colaborador = '+IntToStr(dblProfissional.KeyValue)+
                                           ' order by a.dt_pagamento ';
    DM.sdsRetiradas.Open;

end;

procedure TfrmFechaCaixa.dbgDebitosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
{    if DM.sdsFechaCaixaSITUACAO_FINANC_COL.AsString = 'PAGO' then begin// condição
      dbgDebitos.Canvas.Brush.Color:= clSkyBlue; // coloque aqui a cor desejada
      dbgDebitos.Canvas.Font.Color:= clWhite;
    end
    else begin
      dbgDebitos.Canvas.Brush.Color:= clWhite;
      dbgDebitos.Canvas.Font.Color:= clWindowText;
    end;

    dbgDebitos.DefaultDrawDataCell(Rect, dbgDebitos.columns[DataCol].field, State); }
end;

procedure TfrmFechaCaixa.dbgDebitosTitleClick(Column: TColumn);
begin
    DM.sdsFechaCaixa.IndexFieldNames := Column.FieldName;
end;

procedure TfrmFechaCaixa.DBGrid1TitleClick(Column: TColumn);
begin
    DM.sdsAPagar.IndexFieldNames := Column.FieldName;
end;

procedure TfrmFechaCaixa.dblProfissionalKeyPress(Sender: TObject;
  var Key: Char);
begin
    if key = #13 then
      sbtPesquisar.Click;

    if key = #8 then
      dblProfissional.KeyValue := null;
end;

procedure TfrmFechaCaixa.EfetuarPagamento1Click(Sender: TObject);
begin
{   DM.sdsFechaCaixa.First;
    DM.sdsFechaCaixa.DisableControls;
    while not DM.sdsFechaCaixa.Eof do begin
      if dbgDebitos.SelectedRows.IndexOf(DM.sdsFechaCaixa.BookMark) >= 0 then begin
        if (DM.sdsFechaCaixaSITUACAO_FINANC_COL.AsString = 'PAGO') and
           (not Permissao(gLogin, gSenha)) then begin
            Informacao('Atenção', 'Esta operação não é permitida. Contate o usuário administrador.');
            Exit;
        end;

        with DM do begin
          try
            TRANSACAO.TransactionID  := NewTransactionID;
            TRANSACAO.IsolationLevel := xilREADCOMMITTED;
            with sqlAux do begin
              SQL.Clear;
              CommandText := ' update CXA00 set '+
                             ' SITUACAO_FINANC_COL = :pSITUACAO_FINANC_COL '+
                             ' where INDICE   = :pINDICE ';

              ParamByName('pINDICE').AsInteger := DM.sdsFechaCaixaINDICE.AsInteger;
              if DM.sdsFechaCaixaSITUACAO_FINANC_COL.AsString <> 'PAGO' then
                ParamByName('pSITUACAO_FINANC_COL').AsString := 'PAGO'
              else
                ParamByName('pSITUACAO_FINANC_COL').AsString := '';

              CONEXAO.StartTransaction(TRANSACAO);
              Close;
              ExecSQL;
              CONEXAO.Commit(TRANSACAO);
            end;
          except
            on Exc:Exception do
              begin
                CONEXAO.Rollback(TRANSACAO);
                Informacao('Atenção!', 'Ocorreu um erro na gravação ao banco de dados: ' + Exc.Message);
                Exit;
              end;
          end;
        end;
      end;
      DM.sdsFechaCaixa.Next;
    end;
    DM.sdsFechaCaixa.EnableControls;
    sbtPesquisar.Click;             }
end;

procedure TfrmFechaCaixa.FecharEsc1Click(Sender: TObject);
begin
    Close;
end;

procedure TfrmFechaCaixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    DM.sdsFechaCaixa.Close;
    DM.sdsRetiradas.Close;
    DM.sdsAPagar.Close;
end;

procedure TfrmFechaCaixa.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #27 then
      Close;
end;

procedure TfrmFechaCaixa.FormShow(Sender: TObject);
begin
    DM.sdsRetiradas.Close;
    DM.sdsProfissional.Open;
    DM.sdsAPagar.Close;
    dtpDe.Date := Date;
    dtpAte.Date := Date;
end;

procedure TfrmFechaCaixa.ImprimirCtrlP1Click(Sender: TObject);
begin
    if (DM.sdsFechaCaixa.Active) and (DM.sdsFechaCaixa.RecordCount > 0) then begin
      DMReport.frxRptFechaCaixa.Variables.Variables['Total'] := QuotedStr(lblTotal.Caption);
      DMReport.frxRptFechaCaixa.ShowReport;
    end;
end;

procedure TfrmFechaCaixa.sbtPesquisarClick(Sender: TObject);
var sSQL : string;
    sdsTemp : TSimpleDataSet;
    total1, total2 : Double;
begin
    /////////////////// CONSULTAS //////////////////////////////////////////////
    sSQL := ' select b.indice, c.nome, d.indice, d.nome, Valor, Data, b.situacao_financ_col from '+
            ' (select a.indice, a.nu_colaborador, a.nu_cliente, sum(a.valor_pago + iif (a.valor_pendente > 0, 0, a.valor_pendente)) as Valor, '+
            ' a.dt_pagamento as Data, a.situacao_financ_col, a.situacao from cxa00 a '+
            ' group by a.nu_cliente, a.nu_colaborador, a.dt_pagamento, a.situacao_financ_col, a.situacao, a.indice) b '+
            ' inner join cli00 c on b.nu_cliente = c.indice '+
            ' inner join col00 d on b.nu_colaborador = d.indice '+
            ' where b.nu_colaborador is not null and Valor <> '+FloatToStr(0.00);

    if dblProfissional.KeyValue <> null then
      sSQL := sSQL + ' and b.nu_colaborador = '+IntToStr(dblProfissional.KeyValue);   // profissional

    if ckbPeriodo.Checked then begin                                          // data pagamento
      if ValidaPeriodo(DateToStr(dtpDe.Date), DateToStr(dtpAte.Date)) then begin
        sSQL := sSQL + ' and Data between :pDT_INI'+
                       ' and :pDT_FIM';
      end
      else Exit;
    end;

    sSQL := sSQL + ' order by d.nome ';

    DM.sdsFechaCaixa.DisableControls;
    DM.sdsFechaCaixa.Close;
    DM.sdsFechaCaixa.DataSet.CommandText := sSQL;
    if ckbPeriodo.Checked then begin
      DM.sdsFechaCaixa.DataSet.ParamByName('pDT_INI').AsDateTime := dtpDe.DateTime;
      DM.sdsFechaCaixa.DataSet.ParamByName('pDT_FIM').AsDateTime := dtpAte.DateTime;
    end;
    DM.sdsFechaCaixa.Open;
    DM.sdsFechaCaixa.EnableControls;

   { if DM.sdsFechaCaixa.RecordCount > 0 then
      EfetuarPagamento1.Visible := True
    else EfetuarPagamento1.Visible := False;    }
    /////////////////// FIM CONSULTAS //////////////////////////////////////////


    sdsTemp := TSimpleDataSet.Create(nil);
    sdsTemp.Connection := DM.CONEXAO;


    /////////////////// TOTAL CONSULTAS ////////////////////////////////////////
    sSQL := ' select sum(a.valor_pago + iif (a.valor_pendente > 0, 0, a.valor_pendente)) as Valor from cxa00 a '+
            ' where a.nu_colaborador is not null ';

    if dblProfissional.KeyValue <> null then
      sSQL := sSQL + ' and a.nu_colaborador = '+IntToStr(dblProfissional.KeyValue);   // profissional

    if ckbPeriodo.Checked then begin                                          // data pagamento
      if ValidaPeriodo(DateToStr(dtpDe.Date), DateToStr(dtpAte.Date)) then begin
        sSQL := sSQL + ' and a.dt_pagamento between :pDT_INI'+
                       ' and :pDT_FIM';
      end
      else Exit;
    end;

    sdsTemp.Close;
    sdsTemp.DataSet.CommandText := sSQL;
    if ckbPeriodo.Checked then begin
      sdsTemp.DataSet.ParamByName('pDT_INI').AsDateTime := dtpDe.DateTime;
      sdsTemp.DataSet.ParamByName('pDT_FIM').AsDateTime := dtpAte.DateTime;
    end;
    sdsTemp.Open;
    total1 := sdsTemp.FieldByName('Valor').AsFloat;
    lblTotal.Caption := FormatFloat('R$ ###,###,##0.00', sdsTemp.FieldByName('Valor').AsFloat);
    /////////////////// FIM TOTAL CONSULTAS ////////////////////////////////////


    /////////////////// DESPESAS ///////////////////////////////////////////////
    sSQL := ' select * from des00 a '+
            ' inner join col00 b on a.nu_colaborador = b.indice '+
            ' where not a.DESCRICAO is null and a.SITUACAO = '+QuotedStr('Pago');

    // profissional
    if dblProfissional.KeyValue <> null then
      sSQL := sSQL + ' and a.NU_COLABORADOR = '+IntToStr(dblProfissional.KeyValue);

    if ckbPeriodo.Checked then begin                                          // data pagamento
      if ValidaPeriodo(DateToStr(dtpDe.Date), DateToStr(dtpAte.Date)) then begin
        sSQL := sSQL + ' and a.DT_PAGAMENTO between :pDT_INI'+
                       ' and :pDT_FIM';
      end
      else Exit;
    end;

    sSQL := sSQL + ' order by a.DESCRICAO';

    DM.sdsAPagar.DisableControls;
    with DM.sdsAPagar do begin
      Close;
      DataSet.CommandText := sSQL;
      if ckbPeriodo.Checked then begin
        DataSet.ParamByName('pDT_INI').AsDateTime := dtpDe.DateTime;
        DataSet.ParamByName('pDT_FIM').AsDateTime := dtpAte.DateTime;
      end;
      Open;
    end;
    DM.sdsAPagar.EnableControls;
    /////////////////// FIM DESPESAS ///////////////////////////////////////////


    /////////////////// TOTAL DESPESAS /////////////////////////////////////////
    sSQL := ' select sum(a.valor) as Valor from des00 a '+
            ' inner join col00 b on a.nu_colaborador = b.indice '+
            ' where a.nu_colaborador is not null and a.SITUACAO = '+QuotedStr('Pago');

    if dblProfissional.KeyValue <> null then
      sSQL := sSQL + ' and a.nu_colaborador = '+IntToStr(dblProfissional.KeyValue);   // profissional

    if ckbPeriodo.Checked then begin                                          // data pagamento
      if ValidaPeriodo(DateToStr(dtpDe.Date), DateToStr(dtpAte.Date)) then begin
        sSQL := sSQL + ' and a.dt_pagamento between :pDT_INI'+
                       ' and :pDT_FIM';
      end
      else Exit;
    end;

    sdsTemp.Close;
    sdsTemp.DataSet.CommandText := sSQL;
    if ckbPeriodo.Checked then begin
      sdsTemp.DataSet.ParamByName('pDT_INI').AsDateTime := dtpDe.DateTime;
      sdsTemp.DataSet.ParamByName('pDT_FIM').AsDateTime := dtpAte.DateTime;
    end;
    sdsTemp.Open;
    total2 := sdsTemp.FieldByName('Valor').AsFloat;
    lblTotal3.Caption := FormatFloat('R$ ###,###,##0.00', sdsTemp.FieldByName('Valor').AsFloat);
    /////////////////// FIM TOTAL DESPESAS /////////////////////////////////////

    if total1 > total2 then
      lblLucro.Font.Color := clBlue
    else if total1 - total2 = 0 then
      lblLucro.Font.Color := clBlack
    else if total1 < total2 then
      lblLucro.Font.Color := clRed;

    lblLucro.Caption := FormatFloat('R$ ###,###,##0.00', total1 - total2);
end;

procedure TfrmFechaCaixa.sbtPesquisarMouseLeave(Sender: TObject);
begin
    sbtPesquisar.Caption := '';
end;

procedure TfrmFechaCaixa.sbtPesquisarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    sbtPesquisar.Caption := 'Pesquisar';
end;

end.
