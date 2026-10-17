unit untCadFornecedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.Mask,
  Vcl.Buttons, Vcl.ComCtrls, Data.SQLExpr, Vcl.ExtDlgs, Vcl.DBCtrls;

type
  TfrmCadFornecedor = class(TForm)
    gbxCadFornecedor: TGroupBox;
    sbtCadastrar: TSpeedButton;
    sbtCancelar: TSpeedButton;
    gbxIdFornecedor: TGroupBox;
    lblRazaoSocial: TLabel;
    lblNomeFantasia: TLabel;
    lblCPF_CNPJ: TLabel;
    lblIE: TLabel;
    lblSituacao: TLabel;
    edtRazaoSocial: TEdit;
    edtNomeFantasia: TEdit;
    mskCNPJ: TMaskEdit;
    cbxSituação: TComboBox;
    edtIE: TEdit;
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
    MainMenu1: TMainMenu;
    FecharEsc1: TMenuItem;
    memObs: TMemo;
    lblObservação: TLabel;
    ConsultarF21: TMenuItem;
    procedure FecharEsc1Click(Sender: TObject);
    procedure sbtCadastrarClick(Sender: TObject);
    procedure sbtCadastrarMouseLeave(Sender: TObject);
    procedure sbtCadastrarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbtCancelarClick(Sender: TObject);
    procedure sbtCancelarMouseLeave(Sender: TObject);
    procedure sbtCancelarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
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
  frmCadFornecedor: TfrmCadFornecedor;

implementation

{$R *.dfm}

uses untDM, untRotinas, untConFornecedor;

procedure TfrmCadFornecedor.ConsultarF21Click(Sender: TObject);
begin
    frmConFornecedor := TfrmConFornecedor.Create(Application);
    frmConFornecedor.ShowModal;

    if gAlterar then begin
      edtRazaoSocial.Text         := DM.sdsFornecedorRAZAO_SOCIAL.AsString;
      edtNomeFantasia.Text        := DM.sdsFornecedorNOME_FANTASIA.AsString;
      mskCNPJ.Text                := DM.sdsFornecedorCNPJ.AsString;
      edtIE.Text                  := DM.sdsFornecedorIE.AsString;
      cbxSituação.ItemIndex       := cbxSituação.Items.IndexOf(DM.sdsFornecedorSITUACAO.AsString);
      cbxUF.ItemIndex             := cbxUF.Items.IndexOf(DM.sdsFornecedorUF.AsString);
      mskCEP.Text                 := DM.sdsFornecedorCEP.AsString;
      edtCidade.Text              := DM.sdsFornecedorCIDADE.AsString;
      edtBairro.Text              := DM.sdsFornecedorBAIRRO.AsString;
      cbxTipoLogradouro.ItemIndex := cbxTipoLogradouro.Items.IndexOf(DM.sdsFornecedorTIPO_LOGRADOURO.AsString);
      edtLogradouro.Text          := DM.sdsFornecedorLOGRADOURO.AsString;
      edtNumero.Text              := DM.sdsFornecedorNUMERO.AsString;
      cbxComplemento.ItemIndex    := cbxComplemento.Items.IndexOf(DM.sdsFornecedorCOMPLEMENTO.AsString);
      edtReferencia.Text          := DM.sdsFornecedorREFERENCIA.AsString;
      mskFixo.Text                := DM.sdsFornecedorTELEFONE_FIXO.AsString;
      mskCelular1.Text            := DM.sdsFornecedorCELULAR.AsString;
      mskCelular2.Text            := DM.sdsFornecedorCELULAR2.AsString;
      mskFax.Text                 := DM.sdsFornecedorFAX.AsString;
      edtEmail.Text               := DM.sdsFornecedorEMAIL.AsString;
      memObs.Lines.Add(DM.sdsFornecedorOBSERVACAO.AsString);
      sbtCadastrar.Caption := 'Alterar';
    end;

    frmConFornecedor.Free;
    frmConFornecedor := nil;
end;

procedure TfrmCadFornecedor.FecharEsc1Click(Sender: TObject);
begin
    Close;
end;

procedure TfrmCadFornecedor.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #27 then
      Close;
end;

procedure TfrmCadFornecedor.FormShow(Sender: TObject);
begin
    gAlterar := False;
end;

procedure TfrmCadFornecedor.InsertUpdateDelete(pTipo : Integer);
var vSQL, vMensagem  : string;
begin
    case pTipo of
      0: // inserir
        begin
          vSQL := 'insert into FOR00 '+
                  '(RAZAO_SOCIAL, NOME_FANTASIA, IE, CNPJ, '+
                  'SITUACAO, UF, CEP, CIDADE, BAIRRO, '+
                  'TIPO_LOGRADOURO, LOGRADOURO, NUMERO, COMPLEMENTO, '+
                  'REFERENCIA, TELEFONE_FIXO, CELULAR, CELULAR2, FAX, '+
                  'EMAIL, OBSERVACAO) '+
                  'VALUES '+
                  '(:pRAZAO_SOCIAL, :pNOME_FANTASIA, :pIE, :pCNPJ, '+
                  ':pSITUACAO, :pUF, :pCEP, :pCIDADE, :pBAIRRO, '+
                  ':pTIPO_LOGRADOURO, :pLOGRADOURO, :pNUMERO, :pCOMPLEMENTO, '+
                  ':pREFERENCIA, :pTELEFONE_FIXO, :pCELULAR, :pCELULAR2, :pFAX, '+
                  ':pEMAIL, :pOBSERVACAO)';

          vMensagem := 'incluido';
        end;

      1: // alterar
        begin
          vSQL := 'update FOR00 set '+
                  'RAZAO_SOCIAL     = :pRAZAO_SOCIAL, '+
                  'NOME_FANTASIA    = :pNOME_FANTASIA, '+
                  'IE               = :pIE, '+
                  'CNPJ             = :pCNPJ, '+
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

            vSQL := 'delete from FOR00 '+
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
              ParamByName('pINDICE').AsInteger := DM.sdsFornecedorINDICE.AsInteger;

          // se for inserir ou alterar passa os parametros
          if pTipo in [0,1] then begin

            ParamByName('pRAZAO_SOCIAL').AsString    := edtRazaoSocial.Text;
            ParamByName('pNOME_FANTASIA').AsString   := edtNomeFantasia.Text;
            ParamByName('pIE').AsString              := edtIE.Text;
            ParamByName('pCNPJ').AsString            := mskCNPJ.Text;
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
            LimpaCampos;
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

procedure TfrmCadFornecedor.sbtCadastrarClick(Sender: TObject);
begin
    if not gAlterar then begin
      InsertUpdateDelete(0);
      sbtCadastrar.Caption := 'Cadastrar';
    end
    else begin
      InsertUpdateDelete(1);
      DM.sdsFornecedor.Close;
    end;
    edtRazaoSocial.SetFocus;
    LimpaCampos;
end;

procedure TfrmCadFornecedor.sbtCadastrarMouseLeave(Sender: TObject);
begin
    sbtCadastrar.Caption := '';
end;

procedure TfrmCadFornecedor.sbtCadastrarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    if gAlterar then
      sbtCadastrar.Caption := 'Alterar'
    else
      sbtCadastrar.Caption := 'Cadastrar';
end;

procedure TfrmCadFornecedor.sbtCancelarClick(Sender: TObject);
begin
    LimpaCampos;
end;

procedure TfrmCadFornecedor.sbtCancelarMouseLeave(Sender: TObject);
begin
    sbtCancelar.Caption := '';
end;

procedure TfrmCadFornecedor.sbtCancelarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    sbtCancelar.Caption := 'Cancelar';
end;

procedure TfrmCadFornecedor.LimpaCampos;
begin
    // Identificação do Fornecedor
    edtRazaoSocial.Clear;
    edtNomeFantasia.Clear;
    edtIE.Clear;
    mskCNPJ.Clear;
    cbxSituação.ItemIndex := 0;

    // Foto


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

    edtRazaoSocial.SetFocus;
end;

end.
