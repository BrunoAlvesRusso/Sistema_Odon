unit untCadFuncionario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.Mask,
  Vcl.Buttons, Vcl.ComCtrls, Data.SqlExpr, Vcl.DBCtrls, Vcl.ExtDlgs;

type
  TfrmCadFuncionario = class(TForm)
    gbxCadFuncionario: TGroupBox;
    sbtCadastrar: TSpeedButton;
    sbtCancelar: TSpeedButton;
    gbxIdFuncionario: TGroupBox;
    lblNome: TLabel;
    lblNascimento: TLabel;
    lblSituacao: TLabel;
    edtNomeFuncionario: TEdit;
    cbxSituação: TComboBox;
    MainMenu1: TMainMenu;
    FecharEsc1: TMenuItem;
    gbxEndereco: TGroupBox;
    lblTipoLogradouro: TLabel;
    lblLogradouro: TLabel;
    lblNúmero: TLabel;
    lblComplemento: TLabel;
    lblBairro: TLabel;
    lblCidade: TLabel;
    lblUF: TLabel;
    lblCEP: TLabel;
    lblReferencia: TLabel;
    edtLogradouro: TEdit;
    edtNumero: TEdit;
    cbxComplemento: TComboBox;
    edtBairro: TEdit;
    edtCidade: TEdit;
    cbxUF: TComboBox;
    mskCEP: TMaskEdit;
    edtReferencia: TEdit;
    cbxTipoLogradouro: TComboBox;
    gbxContato: TGroupBox;
    lblFixo: TLabel;
    lblCelular1: TLabel;
    lblCelular2: TLabel;
    lblFax: TLabel;
    lblEmail: TLabel;
    mskFixo: TMaskEdit;
    mskCelular1: TMaskEdit;
    mskCelular2: TMaskEdit;
    mskFax: TMaskEdit;
    edtEmail: TEdit;
    dtpNascimento: TDateTimePicker;
    lblObservação: TLabel;
    memObs: TMemo;
    lblSexo: TLabel;
    cbxSexo: TComboBox;
    ConsultarF21: TMenuItem;
    procedure FecharEsc1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure sbtCancelarMouseLeave(Sender: TObject);
    procedure sbtCancelarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbtCadastrarMouseLeave(Sender: TObject);
    procedure sbtCadastrarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbtCadastrarClick(Sender: TObject);
    procedure sbtCancelarClick(Sender: TObject);
    procedure ConsultarF21Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LimpaCampos;
    procedure InsertUpdateDelete(pTipo : Integer);
  end;

var
  frmCadFuncionario: TfrmCadFuncionario;

implementation

{$R *.dfm}

uses untDM, untRotinas, untConFuncionario;

procedure TfrmCadFuncionario.ConsultarF21Click(Sender: TObject);
begin
    frmConFuncionario := TfrmConFuncionario.Create(Application);
    frmConFuncionario.ShowModal;

    if gAlterar then begin
      edtNomeFuncionario.Text := DM.sdsFuncionarioNOME.AsString;
      dtpNascimento.Date := DM.sdsFuncionarioDT_NASCIMENTO.AsDateTime;
      if DM.sdsFuncionarioSEXO.AsString = 'M' then
        cbxSexo.ItemIndex := 0
      else
        cbxSexo.ItemIndex := 1;
      cbxSituação.ItemIndex       := cbxSituação.Items.IndexOf(DM.sdsFuncionarioSITUACAO.AsString);
      cbxUF.ItemIndex             := cbxUF.Items.IndexOf(DM.sdsFuncionarioUF.AsString);
      mskCEP.Text                 := DM.sdsFuncionarioCEP.AsString;
      edtCidade.Text              := DM.sdsFuncionarioCIDADE.AsString;
      edtBairro.Text              := DM.sdsFuncionarioBAIRRO.AsString;
      cbxTipoLogradouro.ItemIndex := cbxTipoLogradouro.Items.IndexOf(DM.sdsFuncionarioTIPO_LOGRADOURO.AsString);
      edtLogradouro.Text          := DM.sdsFuncionarioLOGRADOURO.AsString;
      edtNumero.Text              := DM.sdsFuncionarioNUMERO.AsString;
      cbxComplemento.ItemIndex    := cbxComplemento.Items.IndexOf(DM.sdsFuncionarioCOMPLEMENTO.AsString);
      edtReferencia.Text          := DM.sdsFuncionarioREFERENCIA.AsString;
      mskFixo.Text                := DM.sdsFuncionarioTELEFONE_FIXO.AsString;
      mskCelular1.Text            := DM.sdsFuncionarioCELULAR.AsString;
      mskCelular2.Text            := DM.sdsFuncionarioCELULAR2.AsString;
      mskFax.Text                 := DM.sdsFuncionarioFAX.AsString;
      edtEmail.Text               := DM.sdsFuncionarioEMAIL.AsString;
      memObs.Lines.Add(DM.sdsFuncionarioOBSERVACAO.AsString);
      sbtCadastrar.Caption := 'Alterar';
    end;

    frmConFuncionario.Free;
    frmConFuncionario := nil;
end;

procedure TfrmCadFuncionario.FecharEsc1Click(Sender: TObject);
begin
    Close;
end;

procedure TfrmCadFuncionario.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #27 then
      Close;
end;

procedure TfrmCadFuncionario.FormShow(Sender: TObject);
begin
    dtpNascimento.Date := Date;
    gAlterar := False;
end;

procedure TfrmCadFuncionario.InsertUpdateDelete(pTipo : Integer);
var vSQL, vMensagem  : string;
begin
    case pTipo of
      0: // inserir
        begin
          vSQL := 'insert into FUN00 '+
                  '(NOME, DT_NASCIMENTO, SEXO, '+
                  'SITUACAO, UF, CEP, CIDADE, BAIRRO,'+
                  'TIPO_LOGRADOURO, LOGRADOURO, NUMERO, COMPLEMENTO,'+
                  'REFERENCIA, TELEFONE_FIXO, CELULAR, CELULAR2, FAX,'+
                  'EMAIL, OBSERVACAO) '+
                  'VALUES '+
                  '(:pNOME, :pDT_NASCIMENTO, :pSEXO, '+
                  ':pSITUACAO, :pUF, :pCEP, :pCIDADE, :pBAIRRO,'+
                  ':pTIPO_LOGRADOURO, :pLOGRADOURO, :pNUMERO, :pCOMPLEMENTO,'+
                  ':pREFERENCIA, :pTELEFONE_FIXO, :pCELULAR, :pCELULAR2, :pFAX,'+
                  ':pEMAIL, :pOBSERVACAO)';

          vMensagem := 'incluido';
        end;

      1: // alterar
        begin
          vSQL := 'update FUN00 set '+
                  'NOME             = :pNOME, '+
                  'DT_NASCIMENTO    = :pDT_NASCIMENTO, '+
                  'SEXO             = :pSEXO, '+
                  'SITUACAO         = :pSITUACAO, '+
                  'UF               = :pUF, '+
                  'CEP              = :pCEP, '+
                  'CIDADE           = :pCIDADE, '+
                  'BAIRRO           = :pBAIRRO, '+
                  'TIPO_LOGRADOURO  = :pTIPO_LOGRADOURO, '+
                  'LOGRADOURO       = :pLOGRADOURO, '+
                  'NUMERO           = :pNUMERO, '+
                  'COMPLEMENTO      = :pCOMPLEMENTO, '+
                  'REFERENCIA       = :pREFERENCIA, '+
                  'TELEFONE_FIXO    = :pTELEFONE_FIXO, '+
                  'CELULAR          = :pCELULAR, '+
                  'CELULAR2         = :pCELULAR2, '+
                  'FAX              = :pFAX, '+
                  'EMAIL            = :pEMAIL, '+
                  'OBSERVACAO       = :pOBSERVACAO '+
                  'where INDICE = :pINDICE';

          vMensagem := 'alterado';
        end;

      2: //apagar
        begin
          if Confirmacao('Confirmação', 'Deseja, realmente, excluir este registro?') then begin

            vSQL := 'delete from FUN00 '+
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
              ParamByName('pINDICE').AsInteger := DM.sdsFuncionarioINDICE.AsInteger;

          // se for inserir ou alterar passa os parametros
          if pTipo in [0,1] then begin

            ParamByName('pNOME').AsString            := edtNomeFuncionario.Text;
            ParamByName('pDT_NASCIMENTO').AsDate     := dtpNascimento.Date;
            if cbxSexo.ItemIndex = 0 then
              ParamByName('pSEXO').AsString          := 'M'
            else
              ParamByName('pSEXO').AsString          := 'F';
            ParamByName('pSITUACAO').AsString        := cbxSituação.Text;
            ParamByName('pUF').AsString              := cbxUF.Text;
            ParamByName('pCEP').AsString             := mskCEP.Text;
            ParamByName('pCIDADE').AsString          := edtCidade.Text;
            ParamByName('pBAIRRO').AsString          := edtBairro.Text;
            ParamByName('pTIPO_LOGRADOURO').AsString := cbxTipoLogradouro.Text;
            ParamByName('pLOGRADOURO').AsString      := edtLogradouro.Text;
            ParamByName('pNUMERO').AsString          := edtNumero.Text;
            ParamByName('pCOMPLEMENTO').AsString     := cbxComplemento.Text;
            ParamByName('pREFERENCIA').AsString      := edtReferencia.Text;
            ParamByName('pTELEFONE_FIXO').AsString   := mskFixo.Text;
            ParamByName('pCELULAR').AsString         := mskCelular1.Text;
            ParamByName('pCELULAR2').AsString        := mskCelular2.Text;
            ParamByName('pFAX').AsString             := mskFax.Text;
            ParamByName('pEMAIL').AsString           := edtEmail.Text;
            ParamByName('pOBSERVACAO').AsString      := memObs.Text;

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

procedure TfrmCadFuncionario.sbtCadastrarClick(Sender: TObject);
begin
    if not gAlterar then begin
      InsertUpdateDelete(0);
      sbtCadastrar.Caption := 'Cadastrar';
    end
    else begin
      InsertUpdateDelete(1);
      gAlterar := False;
      DM.sdsFuncionario.Close;
    end;
    edtNomeFuncionario.SetFocus;
    LimpaCampos;
end;

procedure TfrmCadFuncionario.sbtCadastrarMouseLeave(Sender: TObject);
begin
    sbtCadastrar.Caption := '';
end;

procedure TfrmCadFuncionario.sbtCadastrarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    if gAlterar then
      sbtCadastrar.Caption := 'Alterar'
    else
      sbtCadastrar.Caption := 'Cadastrar';
end;

procedure TfrmCadFuncionario.sbtCancelarClick(Sender: TObject);
begin
    LimpaCampos;
end;

procedure TfrmCadFuncionario.LimpaCampos;
begin
    // Identificação do cliente
    edtNomeFuncionario.Clear;
    dtpNascimento.Date := Date;
    cbxSexo.ItemIndex := -1;
    cbxSituação.ItemIndex := 0;

    // Endereço
    cbxUF.ItemIndex := -1;
    mskCEP.Clear;
    edtCidade.Clear;
    edtBairro.Clear;
    cbxTipoLogradouro.ItemIndex := 22;
    edtLogradouro.Clear;
    edtNumero.Clear;
    cbxComplemento.ItemIndex := 1;
    edtReferencia.Clear;

    // Contato
    mskFixo.Clear;
    mskCelular1.Clear;
    mskCelular2.Clear;
    mskFax.Clear;
    edtEmail.Clear;

    // Observação
    memObs.Clear;

    gAlterar := False;

    edtNomeFuncionario.SetFocus;
end;

procedure TfrmCadFuncionario.sbtCancelarMouseLeave(Sender: TObject);
begin
    sbtCancelar.Caption := '';
end;

procedure TfrmCadFuncionario.sbtCancelarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    sbtCancelar.Caption := 'Cancelar';
end;

end.
