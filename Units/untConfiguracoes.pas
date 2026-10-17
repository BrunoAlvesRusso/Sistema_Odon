unit untConfiguracoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons, Vcl.Menus, SQLExpr, SimpleDS, Vcl.FileCtrl,
  Vcl.ExtDlgs, Vcl.Mask, Vcl.ExtCtrls, Vcl.Imaging.jpeg, Vcl.Imaging.pngimage;

type
  TfrmConfiguracoes = class(TForm)
    pgcConfiguracoes: TPageControl;
    tbsColaborador: TTabSheet;
    GroupBox1: TGroupBox;
    lblNome: TLabel;
    sbtCadastrar: TSpeedButton;
    sbtCancelar: TSpeedButton;
    edtColaborador: TEdit;
    dbgProfissional: TDBGrid;
    ckbstatus: TCheckBox;
    MainMenu1: TMainMenu;
    FecharEsc1: TMenuItem;
    PopupMenu1: TPopupMenu;
    Alterar1: TMenuItem;
    Excluir1: TMenuItem;
    tbsBackup: TTabSheet;
    gbxBackup: TGroupBox;
    opdBackup: TOpenDialog;
    edtBaseDados: TEdit;
    sbtPesquisar: TSpeedButton;
    Label1: TLabel;
    edtNomeBackup: TEdit;
    Label3: TLabel;
    sbtCadBackup: TSpeedButton;
    tbsEmail: TTabSheet;
    cbxEmail: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    sbtCadEmail: TSpeedButton;
    edtSmtp: TEdit;
    edtAssunto: TEdit;
    edtPorta: TEdit;
    Label6: TLabel;
    edtLogin: TEdit;
    edtSenha: TEdit;
    Label8: TLabel;
    memMensagem: TMemo;
    Label9: TLabel;
    tbsPermissao: TTabSheet;
    sbxPermissao: TScrollBox;
    gbxCadastro: TGroupBox;
    ckbCliente: TCheckBox;
    ckbFornecedor: TCheckBox;
    ckbFuncionario: TCheckBox;
    ckbProduto: TCheckBox;
    gbxAgendaAvisos: TGroupBox;
    ckbAgenda: TCheckBox;
    ckbAvisos: TCheckBox;
    gbxControleCaixa: TGroupBox;
    ckbCaixa: TCheckBox;
    ckbMovimentacao: TCheckBox;
    ckbDespesas: TCheckBox;
    ckbAReceber: TCheckBox;
    ckbBalanco: TCheckBox;
    gbxMensagens: TGroupBox;
    ckbEmail: TCheckBox;
    gbxUsuarios: TGroupBox;
    ckbUsuario: TCheckBox;
    gbxConfiguracao: TGroupBox;
    ckbConfiguracao: TCheckBox;
    gbxFinalizar: TGroupBox;
    ckbBackup: TCheckBox;
    sbtPermissao: TSpeedButton;
    ckbFechaCaixa: TCheckBox;
    ckbProcedimento: TCheckBox;
    sbtPesquisarBkp: TSpeedButton;
    sdlBackup: TSaveDialog;
    tbsGeral: TTabSheet;
    sbxGeral: TScrollBox;
    Label2: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    lblUF: TLabel;
    lblCEP: TLabel;
    cbxUF: TComboBox;
    mskCEP: TMaskEdit;
    edtCidade: TEdit;
    lblCidade: TLabel;
    edtBairro: TEdit;
    lblBairro: TLabel;
    lblTipoLogradouro: TLabel;
    cbxTipoLogradouro: TComboBox;
    lblLogradouro: TLabel;
    edtLogradouro: TEdit;
    lblNúmero: TLabel;
    lblComplemento: TLabel;
    edtNumero: TEdit;
    cbxComplemento: TComboBox;
    edtRazaoSocial: TEdit;
    edtNomeFantasia: TEdit;
    edtIE: TEdit;
    mskCNPJ: TMaskEdit;
    sbtGeral: TSpeedButton;
    Label13: TLabel;
    lblTelefone: TLabel;
    lblFax: TLabel;
    mskTelefone: TMaskEdit;
    mskFax: TMaskEdit;
    GroupBox2: TGroupBox;
    imgLogo: TImage;
    sbtLogo: TSpeedButton;
    opdImagem: TOpenPictureDialog;
    TabSheet1: TTabSheet;
    GroupBox3: TGroupBox;
    sbtAnamnese: TSpeedButton;
    edtCro: TEdit;
    Label14: TLabel;
    procedure sbtCancelarMouseLeave(Sender: TObject);
    procedure sbtCancelarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbtCadastrarMouseLeave(Sender: TObject);
    procedure sbtCadastrarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbtCadastrarClick(Sender: TObject);
    procedure sbtCancelarClick(Sender: TObject);
    procedure Alterar1Click(Sender: TObject);
    procedure Excluir1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure PopupMenu1Change(Sender: TObject; Source: TMenuItem;
      Rebuild: Boolean);
    procedure pgcConfiguracoesChange(Sender: TObject);
    procedure sbtPesquisarClick(Sender: TObject);
    procedure sbtCadBackupClick(Sender: TObject);
    procedure sbtCadEmailClick(Sender: TObject);
    procedure sbtPermissaoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FecharEsc1Click(Sender: TObject);
    procedure sbtPesquisarBkpClick(Sender: TObject);
    procedure sbtGeralClick(Sender: TObject);
    procedure sbtLogoClick(Sender: TObject);
    procedure sbtAnamneseClick(Sender: TObject);
    procedure dbgProfissionalDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    pLogo : string;
    procedure AtualizaGrid;
    procedure InsertUpdateDelete(pTipo : Integer);
  end;

var
  frmConfiguracoes: TfrmConfiguracoes;

implementation

{$R *.dfm}

uses untDM, untRotinas, untCadAnamnese;

procedure TfrmConfiguracoes.Alterar1Click(Sender: TObject);
begin
    gAlterar := True;
    edtColaborador.Text := DM.sdsProfissionalNOME.AsString;
    if DM.sdsProfissionalSITUACAO.AsString = 'S' then
      ckbstatus.Checked := True
    else ckbstatus.Checked := False;
end;

procedure TfrmConfiguracoes.AtualizaGrid;
begin
    with DM.sdsProfissional do begin
      Close;
      DataSet.CommandText := 'select * from COL00 order by NOME';
      Open;
    end
end;

procedure TfrmConfiguracoes.dbgProfissionalDblClick(Sender: TObject);
begin
    edtColaborador.Text := DM.sdsProfissionalNOME.AsString;
    edtCro.Text         := DM.sdsProfissionalCRO.AsString;
    gAlterar            := True;
end;

procedure TfrmConfiguracoes.Excluir1Click(Sender: TObject);
begin
    InsertUpdateDelete(2);
    AtualizaGrid;
    gAlterar := False;
    if DM.sdsProfissional.RecordCount > 0 then begin
      Alterar1.Enabled := True;
      Excluir1.Enabled := True;
    end
    else begin
      Alterar1.Enabled := False;
      Excluir1.Enabled := False;
    end;
end;

procedure TfrmConfiguracoes.FecharEsc1Click(Sender: TObject);
begin
    Close;
end;

procedure TfrmConfiguracoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    DM.sdsProfissional.Close;
    DM.sdsProfissional.DataSet.CommandText := ' select * from COL00 '+
                                              ' where SITUACAO = '+QuotedStr('S')+
                                              ' order by NOME ';
end;

procedure TfrmConfiguracoes.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #27 then
      Close;
end;

procedure TfrmConfiguracoes.FormShow(Sender: TObject);
begin
    pgcConfiguracoes.TabIndex := 0;
    edtRazaoSocial.SetFocus;
    edtRazaoSocial.Text         := DM.sdsGerenciadorRAZAO_SOCIAL.AsString;
    edtNomeFantasia.Text        := DM.sdsGerenciadorNOME_FANTASIA.AsString;
    edtIE.Text                  := DM.sdsGerenciadorIE.AsString;
    mskCNPJ.Text                := DM.sdsGerenciadorCNPJ.AsString;
    cbxUF.ItemIndex             := cbxUF.Items.IndexOf(DM.sdsGerenciadorUF.AsString);
    mskCEP.Text                 := DM.sdsGerenciadorCEP.AsString;
    edtCidade.Text              := DM.sdsGerenciadorCIDADE.AsString;
    edtBairro.Text              := DM.sdsGerenciadorBAIRRO.AsString;
    cbxTipoLogradouro.ItemIndex := cbxTipoLogradouro.Items.IndexOf(DM.sdsGerenciadorTIPO_LOGRADOURO.AsString);
    edtLogradouro.Text          := DM.sdsGerenciadorLOGRADOURO.AsString;
    edtNumero.Text              := DM.sdsGerenciadorNUMERO.AsString;
    cbxComplemento.ItemIndex    := cbxComplemento.Items.IndexOf(DM.sdsGerenciadorCOMPLEMENTO.AsString);
    mskTelefone.Text            := DM.sdsGerenciadorTELEFONE.AsString;
    mskFax.Text                 := DM.sdsGerenciadorFAX.AsString;
    pLogo                       := DM.sdsGerenciadorLOGO.AsString;
    if Trim(pLogo) <> '' then
      imgLogo.Picture.LoadFromFile(pLogo);
end;

procedure TfrmConfiguracoes.sbtAnamneseClick(Sender: TObject);
begin
    CriaForm(TfrmCadAnamnese, frmCadAnamnese, False);
end;

procedure TfrmConfiguracoes.sbtCadastrarClick(Sender: TObject);
begin
    if Trim(edtColaborador.Text) = '' then begin
      Informacao('Atenção', 'Campo nome está em branco.');
      edtColaborador.SetFocus;
      Exit;
    end;

    if Trim(edtCro.Text) = '' then begin
      Informacao('Atenção', 'Campo CRO está em branco.');
      edtCro.SetFocus;
      Exit;
    end;

    if not gAlterar then begin
      InsertUpdateDelete(0);
    end
    else begin
       InsertUpdateDelete(1);
    end;
    gAlterar := False;

    edtColaborador.Clear;
    edtCro.Clear;
    ckbstatus.Checked := True;
    sbtCadastrar.Caption := 'Cadastar';
end;

procedure TfrmConfiguracoes.InsertUpdateDelete(pTipo : Integer);
var vSQL, vMensagem  : string;
begin
    case pTipo of
      0: // inserir
        begin
          vSQL := 'insert into COL00 '+
                  '(NOME, CRO, SITUACAO) '+
                  'VALUES '+
                  '(:pNOME, :pCRO, :pSITUACAO)';

          vMensagem := 'incluido';
        end;

      1: // alterar
        begin
          vSQL := 'update COL00 set '+
                  'NOME     = :pNOME, '+
                  'CRO      = :pCRO, '+
                  'SITUACAO = :pSITUACAO '+
                  'where INDICE = :pINDICE';

          vMensagem := 'alterado';
        end;

      2: //apagar
        begin
          if Confirmacao('Confirmação', 'Deseja, realmente, excluir este registro?') then begin

            vSQL := 'delete from COL00 '+
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
              ParamByName('pINDICE').AsInteger := DM.sdsProfissionalINDICE.AsInteger;

          // se for inserir ou alterar passa os parametros
          if pTipo in [0,1] then begin

            ParamByName('pNOME').AsString := trim(edtColaborador.Text);
            ParamByName('pCRO').AsString   := trim(edtCro.Text);
            if ckbstatus.Checked then
              ParamByName('pSITUACAO').AsString := 'S'
            else ParamByName('pSITUACAO').AsString := 'N';

            CONEXAO.StartTransaction(TRANSACAO);
            Close;
            ExecSQL;
            CONEXAO.Commit(TRANSACAO);
            edtColaborador.Clear;
            AtualizaGrid;
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

procedure TfrmConfiguracoes.pgcConfiguracoesChange(Sender: TObject);
begin
    case pgcConfiguracoes.TabIndex of
      0: // Geral
        begin
          edtRazaoSocial.SetFocus;
          edtRazaoSocial.Text         := DM.sdsGerenciadorRAZAO_SOCIAL.AsString;
          edtNomeFantasia.Text        := DM.sdsGerenciadorNOME_FANTASIA.AsString;
          edtIE.Text                  := DM.sdsGerenciadorIE.AsString;
          mskCNPJ.Text                := DM.sdsGerenciadorCNPJ.AsString;
          cbxUF.ItemIndex             := cbxUF.Items.IndexOf(DM.sdsGerenciadorUF.AsString);
          mskCEP.Text                 := DM.sdsGerenciadorCEP.AsString;
          edtCidade.Text              := DM.sdsGerenciadorCIDADE.AsString;
          edtBairro.Text              := DM.sdsGerenciadorBAIRRO.AsString;
          cbxTipoLogradouro.ItemIndex := cbxTipoLogradouro.Items.IndexOf(DM.sdsGerenciadorTIPO_LOGRADOURO.AsString);
          edtLogradouro.Text          := DM.sdsGerenciadorLOGRADOURO.AsString;
          edtNumero.Text              := DM.sdsGerenciadorNUMERO.AsString;
          cbxComplemento.ItemIndex    := cbxComplemento.Items.IndexOf(DM.sdsGerenciadorCOMPLEMENTO.AsString);
          mskTelefone.Text            := DM.sdsGerenciadorTELEFONE.AsString;
          mskFax.Text                 := DM.sdsGerenciadorFAX.AsString;
          pLogo                       := DM.sdsGerenciadorLOGO.AsString;
          if Trim(pLogo) <> '' then
            imgLogo.Picture.LoadFromFile(pLogo);
        end;
      1: // Colaborador
        begin
          AtualizaGrid;
          gAlterar := False;

        end;
      2: // Backup
        begin
          edtBaseDados.Text  := DM.sdsGerenciadorCAMINHO_BASE.AsString;
          edtNomeBackup.Text := DM.sdsGerenciadorCAMINHO_BACKUP.AsString;
        end;
      3: // E-Mail
        begin
          with DM do begin
            sdsEmail.Close;
            sdsEmail.DataSet.CommandText := 'select * from EMA00';
            sdsEmail.Open;

            edtSmtp.Text     := sdsEmailSMTP.AsString;
            edtPorta.Text    := sdsEmailPORTA.AsString;
            edtLogin.Text    := sdsEmailLOGIN.AsString;
            edtSenha.Text    := sdsEmailSENHA.AsString;
            edtAssunto.Text  := sdsEmailASSUNTO.AsString;
            memMensagem.Text := sdsEmailMENSAGEM.AsString;
          end;
        end;
      4: // Permissões
        begin
          DM.sdsPermissao.Close;
          DM.sdsPermissao.DataSet.CommandText := 'select * from BLO00';
          DM.sdsPermissao.Open;

          DM.sdsPermissao.First;
          while not DM.sdsPermissao.Eof do begin

            case DM.sdsPermissaoINDICE.AsInteger of
              1: // CLIENTE
                if DM.sdsPermissaoSITUACAO.AsString = 'S' then
                  ckbCliente.Checked := True
                else ckbCliente.Checked := False;
              2: // FORNECEDOR
                if DM.sdsPermissaoSITUACAO.AsString = 'S' then
                  ckbFornecedor.Checked := True
                else ckbFornecedor.Checked := False;
              3: // FUNCIONÁRIO
                if DM.sdsPermissaoSITUACAO.AsString = 'S' then
                  ckbFuncionario.Checked := True
                else ckbFuncionario.Checked := False;
              4: // PRODUTO
                if DM.sdsPermissaoSITUACAO.AsString = 'S' then
                  ckbProduto.Checked := True
                else ckbProduto.Checked := False;
              5: // AGENDA
                if DM.sdsPermissaoSITUACAO.AsString = 'S' then
                  ckbAgenda.Checked := True
                else ckbAgenda.Checked := False;
              6: // AVISOS
                if DM.sdsPermissaoSITUACAO.AsString = 'S' then
                  ckbAvisos.Checked := True
                else ckbAvisos.Checked := False;
              7: // CAIXA
                if DM.sdsPermissaoSITUACAO.AsString = 'S' then
                  ckbCaixa.Checked := True
                else ckbCaixa.Checked := False;
              8: // MOVIMENTAÇÃO
                if DM.sdsPermissaoSITUACAO.AsString = 'S' then
                  ckbMovimentacao.Checked := True
                else ckbMovimentacao.Checked := False;
              9: // DESPESAS
                if DM.sdsPermissaoSITUACAO.AsString = 'S' then
                  ckbDespesas.Checked := True
                else ckbDespesas.Checked := False;
              10:// A RECEBER
                if DM.sdsPermissaoSITUACAO.AsString = 'S' then
                  ckbAReceber.Checked := True
                else ckbAReceber.Checked := False;
              11:// BALANÇO
                if DM.sdsPermissaoSITUACAO.AsString = 'S' then
                  ckbBalanco.Checked := True
                else ckbBalanco.Checked := False;
              12:// EMAIL
                if DM.sdsPermissaoSITUACAO.AsString = 'S' then
                  ckbEmail.Checked := True
                else ckbEmail.Checked := False;
              13:// USUÁRIO
                if DM.sdsPermissaoSITUACAO.AsString = 'S' then
                  ckbUsuario.Checked := True
                else ckbUsuario.Checked := False;
              14:// CONFIGURAÇÃO
                if DM.sdsPermissaoSITUACAO.AsString = 'S' then
                  ckbConfiguracao.Checked := True
                else ckbConfiguracao.Checked := False;
              15:// BACKUP
                if DM.sdsPermissaoSITUACAO.AsString = 'S' then
                  ckbBackup.Checked := True
                else ckbBackup.Checked := False;
              16:// FECHAR CAIXA
                if DM.sdsPermissaoSITUACAO.AsString = 'S' then
                  ckbFechaCaixa.Checked := True
                else ckbFechaCaixa.Checked := False;
              17:// PROCEDIMENTO
                if DM.sdsPermissaoSITUACAO.AsString = 'S' then
                  ckbProcedimento.Checked := True
                else ckbProcedimento.Checked := False;
            end; // fim case
            DM.sdsPermissao.Next;
          end; // fim while

        end;
    end;
end;

procedure TfrmConfiguracoes.PopupMenu1Change(Sender: TObject; Source: TMenuItem;
  Rebuild: Boolean);
var sdsTemp : TSimpleDataSet;
begin
    sdsTemp := TSimpleDataSet.Create(nil);
    sdsTemp.Connection := DM.CONEXAO;

    with sdsTemp do begin
      Close;
      DataSet.CommandText := 'select * from COL00 order by NOME';
      Open;
    end;

    gAlterar := False;
    if sdsTemp.RecordCount > 0 then begin
      Alterar1.Enabled := True;
      Excluir1.Enabled := True;
    end
    else begin
      Alterar1.Enabled := False;
      Excluir1.Enabled := False;
    end;
end;

procedure TfrmConfiguracoes.sbtCadastrarMouseLeave(Sender: TObject);
begin
    sbtCadastrar.Caption := '';
end;

procedure TfrmConfiguracoes.sbtCadastrarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    if not gAlterar then
      sbtCadastrar.Caption := 'Cadastrar'
    else sbtCadastrar.Caption := 'Alterar';
end;

procedure TfrmConfiguracoes.sbtCancelarClick(Sender: TObject);
begin
    edtColaborador.Clear;
    edtCro.Clear;
    ckbstatus.Checked := True;
    sbtCadastrar.Caption := 'Cadastar';
    gAlterar := false;
end;

procedure TfrmConfiguracoes.sbtCancelarMouseLeave(Sender: TObject);
begin
    sbtCancelar.Caption := '';
end;

procedure TfrmConfiguracoes.sbtCancelarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    sbtCancelar.Caption := 'Cancelar';
end;

procedure TfrmConfiguracoes.sbtGeralClick(Sender: TObject);
var vSQL : string;
begin
    vSQL := 'update GER00 set '+
            'RAZAO_SOCIAL     = :pRAZAO_SOCIAL, '+
            'NOME_FANTASIA    = :pNOME_FANTASIA, '+
            'IE               = :pIE, '+
            'CNPJ             = :pCNPJ, '+
            'UF               = :pUF, '+
            'CEP              = :pCEP, '+
            'CIDADE           = :pCIDADE, '+
            'BAIRRO           = :pBAIRRO, '+
            'TIPO_LOGRADOURO  = :pTIPO_LOGRADOURO, '+
            'LOGRADOURO       = :pLOGRADOURO, '+
            'NUMERO           = :pNUMERO, '+
            'COMPLEMENTO      = :pCOMPLEMENTO, '+
            'TELEFONE         = :pTELEFONE, '+
            'FAX              = :pFAX, '+
            'LOGO             = :pLOGO '+
            'where INDICE = :pINDICE';

    with DM do begin

      try
        TRANSACAO.TransactionID  := NewTransactionID;
        TRANSACAO.IsolationLevel := xilREPEATABLEREAD;

        with sqlAux do begin

          SQL.Clear;
          CommandText := vSQL;
          ParamByName('pINDICE').AsInteger         := DM.sdsGerenciadorINDICE.AsInteger;
          ParamByName('pRAZAO_SOCIAL').AsString    := edtRazaoSocial.Text;
          ParamByName('pNOME_FANTASIA').AsString   := edtNomeFantasia.Text;
          ParamByName('pIE').AsString              := edtIE.Text;
          ParamByName('pCNPJ').AsString            := mskCNPJ.Text;
          ParamByName('pUF').AsString              := cbxUF.Text;
          ParamByName('pCEP').AsString             := mskCEP.Text;
          ParamByName('pCIDADE').AsString          := edtCidade.Text;
          ParamByName('pBAIRRO').AsString          := edtBairro.Text;
          ParamByName('pTIPO_LOGRADOURO').AsString := cbxTipoLogradouro.Text;
          ParamByName('pLOGRADOURO').AsString      := edtLogradouro.Text;
          ParamByName('pNUMERO').AsString          := edtNumero.Text;
          ParamByName('pCOMPLEMENTO').AsString     := cbxComplemento.Text;
          ParamByName('pTELEFONE').AsString        := Trim(StringReplace(mskTelefone.Text, '', EmptyStr, [rfReplaceAll]));
          ParamByName('pFAX').AsString             := Trim(StringReplace(mskFax.Text, '', EmptyStr, [rfReplaceAll]));
          ParamByName('pLOGO').AsString            := pLogo;

          CONEXAO.StartTransaction(TRANSACAO);
          Close;
          ExecSQL;
          CONEXAO.Commit(TRANSACAO);
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

procedure TfrmConfiguracoes.sbtLogoClick(Sender: TObject);
begin
    opdImagem.InitialDir := ExtractFilePath('C\TISystems\Imagens');
    if opdImagem.Execute then begin
      pLogo := opdImagem.FileName;
      imgLogo.Picture.LoadFromFile(pLogo);
    end;
end;

procedure TfrmConfiguracoes.sbtPesquisarBkpClick(Sender: TObject);
begin
    sdlBackup.InitialDir := ExtractFilePath('C:\TISystems\Backups');
    if sdlBackup.Execute then begin
      edtNomeBackup.Text := sdlBackup.FileName;
    end;
end;

procedure TfrmConfiguracoes.sbtPesquisarClick(Sender: TObject);
begin
    opdBackup.InitialDir := ExtractFilePath('C:\TISystems\Banco');
    if opdBackup.Execute then begin
      edtBaseDados.Text := opdBackup.FileName;
    end;
end;

procedure TfrmConfiguracoes.sbtPermissaoClick(Sender: TObject);
var situacao : string;
begin
    DM.sdsPermissao.Close;
    DM.sdsPermissao.DataSet.CommandText := 'select * from BLO00';
    DM.sdsPermissao.Open;

    DM.sdsPermissao.First;
    while not DM.sdsPermissao.Eof do begin

      case DM.sdsPermissaoINDICE.AsInteger of
        1: // CLIENTE
          if ckbCliente.Checked then
            situacao := 'S'
          else situacao := 'N';
        2: // FORNECEDOR
          if ckbFornecedor.Checked then
            situacao := 'S'
          else situacao := 'N';
        3: // FUNCIONÁRIO
          if ckbFuncionario.Checked then
            situacao := 'S'
          else situacao := 'N';
        4: // PRODUTO
          if ckbProduto.Checked then
            situacao := 'S'
          else situacao := 'N';
        5: // AGENDA
          if ckbAgenda.Checked then
            situacao := 'S'
          else situacao := 'N';
        6: // AVISOS
          if ckbAvisos.Checked then
            situacao := 'S'
          else situacao := 'N';
        7: // CAIXA
          if ckbCaixa.Checked then
            situacao := 'S'
          else situacao := 'N';
        8: // MOVIMENTAÇÃO
          if ckbMovimentacao.Checked then
            situacao := 'S'
          else situacao := 'N';
        9: // DESPESAS
          if ckbDespesas.Checked then
            situacao := 'S'
          else situacao := 'N';
        10:// A RECEBER
          if ckbAReceber.Checked then
            situacao := 'S'
          else situacao := 'N';
        11:// BALANÇO
          if ckbBalanco.Checked then
            situacao := 'S'
          else situacao := 'N';
        12:// EMAIL
          if ckbEmail.Checked then
            situacao := 'S'
          else situacao := 'N';
        13:// USUÁRIO
          if ckbUsuario.Checked then
            situacao := 'S'
          else situacao := 'N';
        14:// CONFIGURAÇÃO
          if ckbConfiguracao.Checked then
            situacao := 'S'
          else situacao := 'N';
        15:// BACKUP
          if ckbBackup.Checked then
            situacao := 'S'
          else situacao := 'N';
        16:// FECHAR CAIXA
          if ckbFechaCaixa.Checked then
            situacao := 'S'
          else situacao := 'N';
        17:// PROCEDIMENTO
          if ckbProcedimento.Checked then
            situacao := 'S'
          else situacao := 'N';

      end;

      with DM do begin

        try
          TRANSACAO.TransactionID  := NewTransactionID;
          TRANSACAO.IsolationLevel := xilREPEATABLEREAD;

          with sqlAux do begin
            SQL.Clear;
            CommandText := ' update BLO00 set '+
                           ' SITUACAO     = :pSITUACAO '+
                           ' where INDICE = :pINDICE';

            ParamByName('pINDICE').AsInteger  := DM.sdsPermissaoINDICE.AsInteger;
            ParamByName('pSITUACAO').AsString := situacao;
            CONEXAO.StartTransaction(TRANSACAO);
            Close;
            ExecSQL;
            CONEXAO.Commit(TRANSACAO);
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
      DM.sdsPermissao.Next;

    end; // fim while
    Afirmacao('Confirmação', 'Registro inserido com sucesso!');
end;

procedure TfrmConfiguracoes.sbtCadBackupClick(Sender: TObject);
var vSQL : string;
begin

    vSQL := 'update GER00 set '+
            'CAMINHO_BASE   = :pCAMINHO_BASE, '+
            'CAMINHO_BACKUP = :pCAMINHO_BACKUP '+
            'where INDICE = :pINDICE';


    with DM do begin

      try
        TRANSACAO.TransactionID  := NewTransactionID;
        TRANSACAO.IsolationLevel := xilREPEATABLEREAD;

        with sqlAux do begin
          SQL.Clear;
          CommandText := vSQL;
          ParamByName('pINDICE').AsInteger        := DM.sdsGerenciadorINDICE.AsInteger;
          ParamByName('pCAMINHO_BASE').AsString   := edtBaseDados.Text;
          ParamByName('pCAMINHO_BACKUP').AsString := edtNomeBackup.Text;
          CONEXAO.StartTransaction(TRANSACAO);
          Close;
          ExecSQL;
          CONEXAO.Commit(TRANSACAO);
          Afirmacao('Confirmação', 'Registro inserido com sucesso!');
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

procedure TfrmConfiguracoes.sbtCadEmailClick(Sender: TObject);
var vSQL : string;
begin

    DM.sdsEmail.Close;
    DM.sdsEmail.DataSet.CommandText := 'select * from EMA00';
    DM.sdsEmail.Open;

    vSQL := ' update EMA00 set '+
            ' SMTP         = :pSMTP, '+
            ' PORTA        = :pPORTA, '+
            ' LOGIN        = :pLOGIN, '+
            ' SENHA        = :pSENHA, '+
            ' ASSUNTO      = :pASSUNTO, '+
            ' MENSAGEM     = :pMENSAGEM '+
            ' where INDICE = :pINDICE';


    with DM do begin

      try
        TRANSACAO.TransactionID  := NewTransactionID;
        TRANSACAO.IsolationLevel := xilREPEATABLEREAD;

        with sqlAux do begin
          SQL.Clear;
          CommandText := vSQL;
          ParamByName('pINDICE').AsInteger  := DM.sdsEmailINDICE.AsInteger;
          ParamByName('pSMTP').AsString     := edtSmtp.Text;
          ParamByName('pPORTA').AsInteger   := StrToInt(edtPorta.Text);
          ParamByName('pLOGIN').AsString    := edtLogin.Text;
          ParamByName('pSENHA').AsString    := edtSenha.Text;
          ParamByName('pASSUNTO').AsString  := edtAssunto.Text;
          ParamByName('pMENSAGEM').AsString := memMensagem.Text;
          CONEXAO.StartTransaction(TRANSACAO);
          Close;
          ExecSQL;
          CONEXAO.Commit(TRANSACAO);
          Afirmacao('Confirmação', 'Registro inserido com sucesso!');
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

end.
