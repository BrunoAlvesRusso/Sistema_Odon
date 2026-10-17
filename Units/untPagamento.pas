unit untPagamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.Buttons, SqlExpr, Vcl.DBCtrls;

type
  TfrmPagamento = class(TForm)
    MainMenu1: TMainMenu;
    FecharEsc1: TMenuItem;
    Panel1: TPanel;
    gbxDespesas: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtDescricao: TEdit;
    dtpVencimento: TDateTimePicker;
    edtValor: TEdit;
    sbtCancelar: TSpeedButton;
    sbtCadastrar: TSpeedButton;
    ConsultarF21: TMenuItem;
    lblDtPagamento: TLabel;
    dtpPagamento: TDateTimePicker;
    cbxSituação: TComboBox;
    lblSituacao: TLabel;
    dblProfissional: TDBLookupComboBox;
    Label5: TLabel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FecharEsc1Click(Sender: TObject);
    procedure edtValorKeyPress(Sender: TObject; var Key: Char);
    procedure sbtCancelarMouseLeave(Sender: TObject);
    procedure sbtCancelarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbtCadastrarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbtCadastrarMouseLeave(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbtCadastrarClick(Sender: TObject);
    procedure sbtCancelarClick(Sender: TObject);
    procedure ConsultarF21Click(Sender: TObject);
    procedure dblProfissionalKeyPress(Sender: TObject; var Key: Char);
    procedure cbxSituaçãoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure InsertUpdateDelete(pTipo : Integer);
    procedure LimpaCampos;
  end;

var
  frmPagamento: TfrmPagamento;

implementation

{$R *.dfm}

uses untRotinas, untDM, untConPagamento;

procedure TfrmPagamento.cbxSituaçãoChange(Sender: TObject);
begin
    if cbxSituação.ItemIndex = 1 then begin
      lblDtPagamento.Visible := True;
      dtpPagamento.Visible := True;
      dtpPagamento.Date := Date;
    end
    else begin
      lblDtPagamento.Visible := False;
      dtpPagamento.Visible := False;
    end;
end;

procedure TfrmPagamento.ConsultarF21Click(Sender: TObject);
begin
    frmConPagamento := TfrmConPagamento.Create(Application);
    frmConPagamento.ShowModal;

    if gAlterar then begin
      edtDescricao.Text      := DM.sdsAPagarDESCRICAO.AsString;
      edtValor.Text          := FormatFloat('###,###,##0.00', DM.sdsAPagarVALOR.AsFloat);
      dtpVencimento.Date     := DM.sdsAPagarDT_VENCIMENTO.AsDateTime;
      dblProfissional.KeyValue := IntToStr(DM.sdsAPagarNU_COLABORADOR.AsInteger);
      sbtCadastrar.Caption := 'Alterar';
    end;

    frmConPagamento.Free;
    frmConPagamento := nil;
end;

procedure TfrmPagamento.dblProfissionalKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #8 then
      dblProfissional.KeyValue := null;
end;

procedure TfrmPagamento.edtValorKeyPress(Sender: TObject; var Key: Char);
begin
    if not (key in ['0'..'9',#8,#13,',']) then
      key := #0;
end;

procedure TfrmPagamento.FecharEsc1Click(Sender: TObject);
begin
    Close;
end;

procedure TfrmPagamento.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #27 then
      Close;
end;

procedure TfrmPagamento.FormShow(Sender: TObject);
begin
    dtpVencimento.Date := Date;
    gAlterar := False;
    DM.sdsProfissional.Open;
end;

procedure TfrmPagamento.InsertUpdateDelete(pTipo : Integer);
var vSQL, vMensagem  : string;
begin
    case pTipo of
      0: // inserir
        begin
          vSQL := ' insert into DES00 '+
                  ' (DESCRICAO, NU_COLABORADOR, VALOR, DT_VENCIMENTO, SITUACAO ';
                  if cbxSituação.ItemIndex = 1 then
                    vSQL := vSQL + ', DT_PAGAMENTO';
                  vSQL := vSQL +') VALUES '+
                  ' (:pDESCRICAO, :pNU_COLABORADOR, :pVALOR, :pDT_VENCIMENTO, :pSITUACAO';
                  if cbxSituação.ItemIndex = 1 then
                    vSQL := vSQL + ', :pDT_PAGAMENTO ';
                  vSQL := vSQL + ')';

          vMensagem := 'incluido';
        end;

      1: // alterar
        begin
          vSQL := ' update DES00 set '+
                  ' DESCRICAO     = :pDESCRICAO, '+
                  ' NU_COLABORADOR= :pNU_COLABORADOR, '+
                  ' VALOR         = :pVALOR, '+
                  ' DT_VENCIMENTO = :pDT_VENCIMENTO, ';

          if cbxSituação.ItemIndex = 1 then
            vSQL := vSQL + ' DT_PAGAMENTO  = :pDT_PAGAMENTO, ';

          vSQL := vSQL + ' SITUACAO      = :pSITUACAO '+
                         ' where INDICE  = :pINDICE';

          vMensagem := 'alterado';
        end;

      2: //apagar
        begin
          if Confirmacao('Confirmação', 'Deseja, realmente, excluir este registro?') then begin

            vSQL := 'delete from DES00 '+
                    'where INDICE = :pINDICE';

            vMensagem := 'excluido';

          end
          else Exit;
        end;
    end;

    with DM do begin

      try
        TRANSACAO.TransactionID  := NewTransactionID;
        TRANSACAO.IsolationLevel := xilREPEATABLEREAD;

        with sqlAux do begin

          SQL.Clear;
          CommandText := vSQL;

          if pTipo in [1,2] then
              ParamByName('pINDICE').AsInteger := DM.sdsAPagarINDICE.AsInteger;

          // se for inserir ou alterar passa os parametros
          if pTipo in [0,1] then begin

            ParamByName('pDESCRICAO').AsString      := edtDescricao.Text;
            ParamByName('pNU_COLABORADOR').AsInteger := dblProfissional.KeyValue;
            ParamByName('pVALOR').AsFloat           := StrToFloat(edtValor.Text);
            ParamByName('pDT_VENCIMENTO').AsDate    := dtpVencimento.Date;
            if cbxSituação.ItemIndex = 1 then
              ParamByName('pDT_PAGAMENTO').AsDate     := dtpPagamento.Date;
            ParamByName('pSITUACAO').AsString       := cbxSituação.Text;

            CONEXAO.StartTransaction(TRANSACAO);
            Close;
            ExecSQL;
            CONEXAO.Commit(TRANSACAO);
            Afirmacao('Confirmação', 'Registro '+vMensagem+' com sucesso!');
          end
          else begin
            CONEXAO.StartTransaction(TRANSACAO);
            Close;
            ExecSQL;
            CONEXAO.Commit(TRANSACAO);
          end;
        end; // fim with sqlAux
      except
        on Exc:Exception do
          begin
            CONEXAO.Rollback(TRANSACAO);
            Informacao('Atenção!', 'Ocorreu um erro no gravação ao banco de dados: ' + Exc.Message);
            Exit;
          end;
      end;

    end; // fim with DM
end;

procedure TfrmPagamento.LimpaCampos;
begin
    edtDescricao.Clear;
    edtValor.Clear;
    dtpVencimento.Date := Date;
    cbxSituação.ItemIndex := 0;
    lblDtPagamento.Visible := False;
    dtpPagamento.Visible := False;
    sbtCadastrar.Caption := 'Cadastrar';
    gAlterar := False;
    dblProfissional.KeyValue := null;
    edtDescricao.SetFocus;
end;

procedure TfrmPagamento.sbtCadastrarClick(Sender: TObject);
begin
    if Trim(edtDescricao.Text) = '' then begin
      Informacao('Atenção', 'Campo descrição obrigatório.');
      edtDescricao.SetFocus;
      Exit;
    end;

    if dblProfissional.KeyValue = Null then begin
      Informacao('Atenção', 'Selecione um profissional.');
      dblProfissional.SetFocus;
      Exit;
    end;

    if Trim(edtValor.Text) = '' then begin
      Informacao('Atenção', 'Informe um valor.');
      edtValor.SetFocus;
      Exit;
    end;

    if not gAlterar then begin
      InsertUpdateDelete(0);
      sbtCadastrar.Caption := 'Cadastrar';
    end
    else begin
      InsertUpdateDelete(1);
      gAlterar := False;
      DM.sdsProduto.Close;
    end;
    edtDescricao.SetFocus;
    LimpaCampos;
end;

procedure TfrmPagamento.sbtCadastrarMouseLeave(Sender: TObject);
begin
    sbtCadastrar.Caption := '';
end;

procedure TfrmPagamento.sbtCadastrarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    if gAlterar then
      sbtCadastrar.Caption := 'Alterar'
    else
      sbtCadastrar.Caption := 'Cadastrar';
end;

procedure TfrmPagamento.sbtCancelarClick(Sender: TObject);
begin
    LimpaCampos;
end;

procedure TfrmPagamento.sbtCancelarMouseLeave(Sender: TObject);
begin
    sbtCancelar.Caption := '';
end;

procedure TfrmPagamento.sbtCancelarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    sbtCancelar.Caption := 'Cancelar';
end;

end.
