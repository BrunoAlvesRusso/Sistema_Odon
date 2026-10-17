unit untCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.DBCtrls, Vcl.ExtCtrls, SqlExpr, Math, Vcl.Grids, Vcl.DBGrids;

type
  TfrmCaixa = class(TForm)
    MainMenu1: TMainMenu;
    FecharEsc1: TMenuItem;
    pnlCaixa: TPanel;
    gbxCaixa: TGroupBox;
    Label1: TLabel;
    sbtPesquisar: TSpeedButton;
    edtCliente: TEdit;
    Label2: TLabel;
    dblProfissional: TDBLookupComboBox;
    Label4: TLabel;
    Label5: TLabel;
    edtValorTotal: TEdit;
    edtValorPago: TEdit;
    sbtCadastrar: TSpeedButton;
    sbtCancelar: TSpeedButton;
    dbgPagamento: TDBGrid;
    edtPendente: TEdit;
    Label3: TLabel;
    ckbTodos: TCheckBox;
    edtJuro: TEdit;
    lblJuro: TLabel;
    lblSimbolo: TLabel;
    Label6: TLabel;
    edtPagoPor: TEdit;
    edtRecebidoPor: TEdit;
    Label7: TLabel;
    procedure FecharEsc1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure sbtCancelarMouseLeave(Sender: TObject);
    procedure sbtCancelarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbtCadastrarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbtCadastrarMouseLeave(Sender: TObject);
    procedure edtValorTotalKeyPress(Sender: TObject; var Key: Char);
    procedure edtValorPagoKeyPress(Sender: TObject; var Key: Char);
    procedure sbtCancelarClick(Sender: TObject);
    procedure sbtCadastrarClick(Sender: TObject);
    procedure sbtPesquisarClick(Sender: TObject);
    procedure dblProfissionalClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgPagamentoCellClick(Column: TColumn);
    procedure edtPendenteKeyPress(Sender: TObject; var Key: Char);
    procedure edtValorPagoChange(Sender: TObject);
    procedure edtValorTotalChange(Sender: TObject);
    procedure edtValorTotalExit(Sender: TObject);
    procedure ckbTodosClick(Sender: TObject);
    procedure edtJuroKeyPress(Sender: TObject; var Key: Char);
    procedure edtJuroExit(Sender: TObject);
    procedure edtJuroChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    situacao_financ_col : string;
    procedure LimpaCampos;
    function CalculaDebito : Double;
    function CalculaJuro : Double;
  end;

var
  frmCaixa: TfrmCaixa;

implementation

{$R *.dfm}

uses untDM, untRotinas, untConCliente, untDMReport;

procedure TfrmCaixa.edtValorPagoChange(Sender: TObject);
begin
    //if rdgEntradaSaida.ItemIndex = 0 then
      edtPendente.Text := FormatFloat('###,###,##0.00', CalculaDebito);
end;

procedure TfrmCaixa.edtValorPagoKeyPress(Sender: TObject; var Key: Char);
begin
    if not (key in ['0'..'9', #8, #13, ',']) then
      key := #0;
end;

function TfrmCaixa.CalculaDebito: Double;
var vlrTotal, vlrPago: Double;
begin
    if Trim(edtValorTotal.Text) = '' then
      vlrTotal := 0
    else
      vlrTotal    := StrToFloat(edtValorTotal.Text);

    if Trim(edtValorPago.Text) = '' then
      vlrPago := 0
    else
      vlrPago    := StrToFloat(edtValorPago.Text);

    Result := vlrTotal - vlrPago;
end;

function TfrmCaixa.CalculaJuro: Double;
var juro: Double;
begin
    try
      juro := StrToFloat(edtJuro.Text);
    except
      juro := 0;
    end;

    Result := DM.sdsCaixaVALOR_TOTAL.AsFloat + (DM.sdsCaixaVALOR_TOTAL.AsFloat * juro / 100);
end;

procedure TfrmCaixa.ckbTodosClick(Sender: TObject);
begin
    if ckbTodos.Checked then begin
      edtValorTotal.Clear;
      edtValorPago.Clear;
      edtPendente.Clear;
      edtValorTotal.Enabled := false;
      edtValorPago.Enabled := false;
    end
    else begin
      edtValorTotal.Enabled := True;
      edtValorPago.Enabled := True;
    end;
end;

procedure TfrmCaixa.dbgPagamentoCellClick(Column: TColumn);
begin
    if DM.sdsCaixaVALOR_TOTAL.AsFloat <> 0 then begin
      if date - DM.sdsCaixaDT_ATENDIMENTO.AsDateTime > 30 then begin
        lblJuro.Enabled := True;
        edtJuro.Enabled := True;
        lblSimbolo.Enabled := True;
      end
      else begin
        edtJuro.Text := '0';
        lblJuro.Enabled := False;
        edtJuro.Enabled := False;
        lblSimbolo.Enabled := False;
      end;

      edtValorTotal.Text := FormatFloat('###,###,##0.00',DM.sdsCaixaVALOR_TOTAL.AsFloat);
      edtValorTotal.Enabled := False;
      edtValorPago.Text  := FormatFloat('###,###,##0.00',DM.sdsCaixaVALOR_PAGO.AsFloat);
      edtPendente.Text   := FormatFloat('###,###,##0.00',DM.sdsCaixaVALOR_PENDENTE.AsFloat);
    end
    else begin
      edtValorTotal.Text := FormatFloat('###,###,##0.00', 0);
      edtValorTotal.Enabled := True;
      edtValorPago.Text  := FormatFloat('###,###,##0.00', 0);
      edtPendente.Text   := FormatFloat('###,###,##0.00', 0);
    end
end;

procedure TfrmCaixa.dblProfissionalClick(Sender: TObject);
begin
    DM.sdsCaixa.Close;
    DM.sdsCaixa.DataSet.CommandText := ' select * from CXA00 a '+
                                       ' where a.SITUACAO = '+QuotedStr('PENDENTE')+
                                       ' and a.NU_COLABORADOR = '+IntToStr(dblProfissional.KeyValue)+
                                       ' order by a.DT_ATENDIMENTO ';
    DM.sdsCaixa.Open;
end;

procedure TfrmCaixa.edtJuroChange(Sender: TObject);
begin
    if Trim(edtJuro.Text) <> '' then
      edtValorTotal.Text := FloatToStr(CalculaJuro);
end;

procedure TfrmCaixa.edtJuroExit(Sender: TObject);
begin
    if Trim(edtJuro.Text) <> '' then
      edtValorTotal.Text := FloatToStr(CalculaJuro)
    else
      edtJuro.Text := '0';
end;

procedure TfrmCaixa.edtJuroKeyPress(Sender: TObject; var Key: Char);
begin
    if not (key in ['0'..'9', #8, #13, ',']) then
      key := #0;
end;

procedure TfrmCaixa.edtPendenteKeyPress(Sender: TObject; var Key: Char);
begin
    if not (key in ['0'..'9', #8, #13, ',']) then
      key := #0;
end;

procedure TfrmCaixa.edtValorTotalChange(Sender: TObject);
begin
    edtPendente.Text := FormatFloat('###,###,##0.00', CalculaDebito);
end;

procedure TfrmCaixa.edtValorTotalExit(Sender: TObject);
begin
    edtPendente.Text := FormatFloat('###,###,##0.00', CalculaDebito);
end;

procedure TfrmCaixa.edtValorTotalKeyPress(Sender: TObject; var Key: Char);
begin
    if not (key in ['0'..'9', #8, #13, ',']) then
      key := #0;
end;

procedure TfrmCaixa.FecharEsc1Click(Sender: TObject);
begin
    Close;
end;

procedure TfrmCaixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    DM.sdsCaixa.Close;
end;

procedure TfrmCaixa.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #27 then
      Close;
end;

procedure TfrmCaixa.FormShow(Sender: TObject);
begin
    DM.sdsProfissional.Close;
    DM.sdsProfissional.Open;
    DM.sdsCaixa.Close;
    dblProfissional.KeyValue := DM.sdsProfissionalINDICE.AsInteger;
    edtRecebidoPor.Text := gUsuario;
end;

procedure TfrmCaixa.LimpaCampos;
begin
    edtCliente.Clear;
    DM.sdsProfissional.Close;
    DM.sdsProfissional.Open;
    dblProfissional.KeyValue := DM.sdsProfissionalINDICE.AsInteger;
    edtValorTotal.Clear;
    edtValorPago.Clear;
    edtValorTotal.Enabled := True;
    edtValorPago.Enabled := True;
    edtPendente.Clear;
    DM.sdsCaixa.Close;
    ckbTodos.Checked := False;
    lblJuro.Enabled := False;
    edtJuro.Text := '0';
    edtJuro.Enabled := False;
    lblSimbolo.Enabled := False;
    edtRecebidoPor.Text := gUsuario;
    edtPagoPor.Clear;
end;

procedure TfrmCaixa.sbtCadastrarClick(Sender: TObject);
var sSql, DtAtendimento : string;
    ValorTotal, ValorPago, ValorPendente, ValorRel : Double;
begin
    if Trim(edtCliente.Text) = '' then begin
      Informacao('Atenção', 'Informe um cliente.');
      sbtPesquisar.Click;
      Exit;
    end;

    if (DM.sdsCaixa.Active) and (DM.sdsCaixa.RecordCount = 0) then begin
      Informacao('Atenção', 'Nenhum registro existente para baixa.');
      Exit;
    end;

    if trim(edtValorTotal.Text) = '' then
      ValorTotal := 0
    else ValorTotal := StrToFloat(edtValorTotal.Text);

    if trim(edtValorPago.Text) = '' then
      ValorPago := 0
    else ValorPago := StrToFloat(edtValorPago.Text);

    if (trim(edtPendente.Text) = ''){ or (StrToFloat(edtPendente.Text) < 0)} then
      ValorPendente := 0
    else ValorPendente := StrToFloat(edtPendente.Text);

    if (ValorTotal - ValorPago) < 0 then begin
      if not Confirmacao('Atenção', 'Será exigito um troco de '+
                          FormatFloat('R$ ###,###,##0.00', Abs(ValorTotal - ValorPago))+
                          '.'+#13+'Deseja continuar?') then
        Exit;
      ValorPendente := 0;//ValorTotal - ValorPago;
    end;

    {if dblProfissional.KeyValue = null then begin
      Informacao('Atenção','Selecione um profissional.');
      dblProfissional.SetFocus;
      Exit;
    end;}

    if not ckbTodos.Checked then begin
      if (ValorTotal = 0) and (ValorPago = 0) and
         (ValorPendente = 0) then begin
        Informacao('Atenção', 'Informe o valor total.');
        edtValorTotal.SetFocus;
        Exit;
      end;

      if (ValorTotal > 0) and (ValorPago = 0) and
         (ValorPendente = 0) and (DM.sdsCaixaVALOR_TOTAL.AsFloat <> 0) then begin
        Informacao('Atenção', 'Informe o valor pago.');
        edtValorPago.SetFocus;
        Exit;
      end;
    end;

    if ckbTodos.Checked then begin

      if not Confirmacao('Atenção', 'A opção para quitar todas as contas está marcada. Deseja, realmente, continuar?') then
        Exit;

      sSql := ' update CXA00 set '+
              ' VALOR_TOTAL    = :pVALOR_TOTAL, '+
              ' VALOR_PAGO     = :pVALOR_PAGO, '+
              ' VALOR_PENDENTE = :pVALOR_PENDENTE, '+
              ' DT_PAGAMENTO   = :pDT_PAGAMENTO, '+
              ' PAGO_POR       = :pPAGO_POR, '+
              ' RECEBIDO_POR   = :pRECEBIDO_POR, '+
              ' SITUACAO       = :pSITUACAO '+
              ' where INDICE   = :pINDICE ';

      DM.sdsCaixa.First;
      ValorRel := 0;
      DtAtendimento := FormatDateTime('dd/mm/yyyy', DM.sdsCaixaDT_ATENDIMENTO.AsDateTime);
      while not DM.sdsCaixa.Eof do begin

        if DM.sdsCaixaVALOR_TOTAL.AsFloat <> 0 then begin

          with DM do begin
            try
              TRANSACAO.TransactionID  := NewTransactionID;
              TRANSACAO.IsolationLevel := xilREADCOMMITTED;
              with sqlAux do begin
                SQL.Clear;
                CommandText := sSql;

                ParamByName('pINDICE').AsInteger       := DM.sdsCaixaINDICE.AsInteger;
                ParamByName('pVALOR_TOTAL').AsFloat    := DM.sdsCaixaVALOR_TOTAL.AsFloat;
                ParamByName('pVALOR_PAGO').AsFloat     := DM.sdsCaixaVALOR_TOTAL.AsFloat;
                ParamByName('pVALOR_PENDENTE').AsFloat := 0.00;
                ParamByName('pDT_PAGAMENTO').AsDate    := Date;
                ParamByName('pSITUACAO').AsString      := 'PAGO';
                ParamByName('pPAGO_POR').AsString      := Trim(edtPagoPor.Text);
                ParamByName('pRECEBIDO_POR').AsString  := Trim(edtRecebidoPor.Text);

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

          ValorRel := ValorRel + DM.sdsCaixaVALOR_TOTAL.AsFloat;
        end;

        DM.sdsCaixa.Next;

      end;

      Afirmacao('Confirmação', 'Registro inserido com sucesso!');

      if (ValorPendente = 0) then begin
        with DMReport.frxRptCaixa do begin
          Variables.Variables['Cliente']       := QuotedStr(edtCliente.Text);
          Variables.Variables['Profissional']  := QuotedStr(dblProfissional.Text);
          Variables.Variables['Total']         := QuotedStr(FormatFloat('R$ ###,###,##0.00', ValorRel));
          Variables.Variables['Pago']          := QuotedStr(FormatFloat('R$ ###,###,##0.00', ValorRel));
          Variables.Variables['DtPagto']       := QuotedStr(DateToStr(Date));
          Variables.Variables['DtAtendimento'] := QuotedStr(DtAtendimento);
          ShowReport;
        end;
      end

    end
    else
    begin
      if (ValorPago > 0) and (ValorPendente = 0) then begin
        with DM do begin
          try
            TRANSACAO.TransactionID  := NewTransactionID;
            TRANSACAO.IsolationLevel := xilREADCOMMITTED;
            with sqlAux do begin
              SQL.Clear;
              CommandText := ' update CXA00 set '+
                             ' VALOR_TOTAL    = :pVALOR_TOTAL, '+
                             ' VALOR_PAGO     = :pVALOR_PAGO, '+
                             ' VALOR_PENDENTE = :pVALOR_PENDENTE, '+
                             ' DT_PAGAMENTO   = :pDT_PAGAMENTO, '+
                             ' PAGO_POR       = :pPAGO_POR, '+
                             ' RECEBIDO_POR   = :pRECEBIDO_POR, '+
                             ' SITUACAO       = :pSITUACAO '+
                             ' where INDICE   = :pINDICE';

              ParamByName('pVALOR_TOTAL').AsFloat    := ValorTotal;
              ParamByName('pVALOR_PAGO').AsFloat     := ValorPago;
              ParamByName('pVALOR_PENDENTE').AsFloat := ValorTotal - ValorPago;
              ParamByName('pSITUACAO').AsString      := 'PAGO';
              ParamByName('pDT_PAGAMENTO').AsDate    := Date;
              ParamByName('pINDICE').AsInteger       := DM.sdsCaixaINDICE.AsInteger;
              ParamByName('pPAGO_POR').AsString      := Trim(edtPagoPor.Text);
              ParamByName('pRECEBIDO_POR').AsString  := Trim(edtRecebidoPor.Text);

              CONEXAO.StartTransaction(TRANSACAO);
              Close;
              ExecSQL;
              CONEXAO.Commit(TRANSACAO);
            end;
          except
            on Exc:Exception do
              begin
                CONEXAO.Rollback(TRANSACAO);
                Informacao('Atenção!', 'Ocorreu um erro no gravação ao banco de dados: ' + Exc.Message);
                Exit;
              end;
          end;
        end;
      end;

      if (ValorPago > 0) and (ValorPendente > 0) then begin // Pagamento em parcela
        with DM do begin
          try
            TRANSACAO.TransactionID  := NewTransactionID;
            TRANSACAO.IsolationLevel := xilREADCOMMITTED;
            with sqlAux do begin
              SQL.Clear;
              CommandText := ' update CXA00 set '+
                             ' VALOR_TOTAL    = :pVALOR_TOTAL, '+
                             ' VALOR_PAGO     = :pVALOR_PAGO, '+
                             ' VALOR_PENDENTE = :pVALOR_PENDENTE, '+
                             ' DT_PAGAMENTO   = :pDT_PAGAMENTO, '+
                             ' PAGO_POR       = :pPAGO_POR, '+
                             ' RECEBIDO_POR   = :pRECEBIDO_POR, '+
                             ' SITUACAO       = :pSITUACAO '+
                             ' where INDICE   = :pINDICE';

              ParamByName('pVALOR_TOTAL').AsFloat    := ValorTotal;
              ParamByName('pVALOR_PAGO').AsFloat     := ValorPago;
              ParamByName('pVALOR_PENDENTE').AsFloat := ValorPendente;
              ParamByName('pSITUACAO').AsString      := 'PAGO';
              ParamByName('pDT_PAGAMENTO').AsDate    := Date;
              ParamByName('pINDICE').AsInteger       := DM.sdsCaixaINDICE.AsInteger;
              ParamByName('pPAGO_POR').AsString      := Trim(edtPagoPor.Text);
              ParamByName('pRECEBIDO_POR').AsString  := Trim(edtRecebidoPor.Text);

              CONEXAO.StartTransaction(TRANSACAO);
              Close;
              ExecSQL;
              CONEXAO.Commit(TRANSACAO);
            end;
          except
            on Exc:Exception do
              begin
                CONEXAO.Rollback(TRANSACAO);
                Informacao('Atenção!', 'Ocorreu um erro no gravação ao banco de dados: ' + Exc.Message);
                Exit;
              end;
          end;
        end;

        with DM do begin
          try
            TRANSACAO.TransactionID  := NewTransactionID;
            TRANSACAO.IsolationLevel := xilREADCOMMITTED;
            with sqlAux do begin
              SQL.Clear;
              CommandText := ' insert into CXA00 '+
                             ' (NU_COLABORADOR, NU_CLIENTE, VALOR_TOTAL, VALOR_PAGO, '+
                             ' VALOR_PENDENTE, SITUACAO, DT_ATENDIMENTO, TRANSACAO) '+
                             ' values '+
                             ' (:pNU_COLABORADOR, :pNU_CLIENTE, :pVALOR_TOTAL, :pVALOR_PAGO, '+
                             ' :pVALOR_PENDENTE, :pSITUACAO, :pDT_ATENDIMENTO, :pTRANSACAO) ';

              ParamByName('pNU_COLABORADOR').AsInteger := dblProfissional.KeyValue;
              ParamByName('pNU_CLIENTE').AsInteger     := pNumeroAgenda;
              ParamByName('pDT_ATENDIMENTO').AsDate    := DM.sdsCaixaDT_ATENDIMENTO.AsDateTime;
              ParamByName('pSITUACAO').AsString        := 'PENDENTE';
              ParamByName('pTRANSACAO').AsString       := 'E';
              ParamByName('pVALOR_TOTAL').AsFloat      := ValorPendente;
              ParamByName('pVALOR_PAGO').AsFloat       := 0;
              ParamByName('pVALOR_PENDENTE').AsFloat   := ValorPendente;

              CONEXAO.StartTransaction(TRANSACAO);
              Close;
              ExecSQL;
              CONEXAO.Commit(TRANSACAO);
            end;
          except
            on Exc:Exception do
              begin
                CONEXAO.Rollback(TRANSACAO);
                Informacao('Atenção!', 'Ocorreu um erro no gravação ao banco de dados: ' + Exc.Message);
                Exit;
              end;
          end;
        end;
      end;

      if (ValorPago = 0) and (ValorPendente > 0) then begin // Pagamento em parcela
        with DM do begin
          try
            TRANSACAO.TransactionID  := NewTransactionID;
            TRANSACAO.IsolationLevel := xilREADCOMMITTED;
            with sqlAux do begin
              SQL.Clear;
              CommandText := ' update CXA00 set '+
                             ' NU_CLIENTE     = :pNU_CLIENTE, '+
                             ' DT_ATENDIMENTO = :pDT_ATENDIMENTO, '+
                             ' VALOR_TOTAL    = :pVALOR_TOTAL, '+
                             ' VALOR_PAGO     = :pVALOR_PAGO, '+
                             ' VALOR_PENDENTE = :pVALOR_PENDENTE, '+
                             ' TRANSACAO      = :pTRANSACAO, '+
                             ' SITUACAO       = :pSITUACAO '+
                             ' where INDICE   = :pINDICE';

              ParamByName('pNU_CLIENTE').AsInteger   := pNumeroAgenda;
              ParamByName('pDT_ATENDIMENTO').AsDate  := DM.sdsCaixaDT_ATENDIMENTO.AsDateTime;
              ParamByName('pVALOR_TOTAL').AsFloat    := ValorTotal;
              ParamByName('pVALOR_PAGO').AsFloat     := ValorPago;
              ParamByName('pVALOR_PENDENTE').AsFloat := ValorPendente;
              ParamByName('pSITUACAO').AsString      := 'PENDENTE';
              ParamByName('pTRANSACAO').AsString     := 'E';
              ParamByName('pINDICE').AsInteger       := DM.sdsCaixaINDICE.AsInteger;

              CONEXAO.StartTransaction(TRANSACAO);
              Close;
              ExecSQL;
              CONEXAO.Commit(TRANSACAO);
            end;
          except
            on Exc:Exception do
              begin
                CONEXAO.Rollback(TRANSACAO);
                Informacao('Atenção!', 'Ocorreu um erro no gravação ao banco de dados: ' + Exc.Message);
                Exit;
              end;
          end;
        end;
      end;

      Afirmacao('Confirmação', 'Registro inserido com sucesso!');

      if (ValorPago > 0) then
      begin
        with DMReport.frxRptCaixa do begin
          Variables.Variables['Cliente']       := QuotedStr(edtCliente.Text);
          Variables.Variables['Profissional']  := QuotedStr(dblProfissional.Text);
          Variables.Variables['Total']         := QuotedStr(FormatFloat('R$ ###,###,##0.00', StrToFloat(edtValorTotal.Text)));
          Variables.Variables['Pago']          := QuotedStr(FormatFloat('R$ ###,###,##0.00', ValorTotal - ValorPendente));
          Variables.Variables['DtPagto']       := QuotedStr(DateToStr(Date));
          Variables.Variables['DtAtendimento'] := QuotedStr(DateToStr(DM.sdsCaixaDT_ATENDIMENTO.AsDateTime));
          ShowReport;
        end;
      end;

    end;

    LimpaCampos;
end;

procedure TfrmCaixa.sbtCadastrarMouseLeave(Sender: TObject);
begin
    sbtCadastrar.Caption := '';
end;

procedure TfrmCaixa.sbtCadastrarMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
    sbtCadastrar.Caption := 'Cadastrar';
end;

procedure TfrmCaixa.sbtCancelarClick(Sender: TObject);
begin
    LimpaCampos;
end;

procedure TfrmCaixa.sbtCancelarMouseLeave(Sender: TObject);
begin
    sbtCancelar.Caption := '';
end;

procedure TfrmCaixa.sbtCancelarMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
    sbtCancelar.Caption := 'Cancelar';
end;

procedure TfrmCaixa.sbtPesquisarClick(Sender: TObject);
begin
    gAgenda := True;
    CriaForm(TfrmConCliente, frmConCliente, False);
    edtCliente.Text := pNomeAgenda;

    DM.sdsCaixa.Close;
    DM.sdsCaixa.DataSet.CommandText := ' select * from CXA00 a '+
                                       ' where a.nu_cliente = '+IntToStr(pNumeroAgenda)+
                                       ' and a.SITUACAO = '+QuotedStr('PENDENTE')+
                                       ' and a.NU_COLABORADOR = '+IntToStr(dblProfissional.KeyValue)+
                                       ' order by a.DT_ATENDIMENTO ';
    DM.sdsCaixa.Open;
    edtValorTotal.Enabled := True;
    edtValorTotal.Clear;
    edtValorPago.Clear;
    edtPendente.Clear;
end;

end.
