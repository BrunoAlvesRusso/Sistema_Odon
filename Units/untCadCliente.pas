unit untCadCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.Mask,
  Vcl.Buttons, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.ExtDlgs, Data.SQLExpr,
  System.Math, DB, jpeg, SimpleDS;

type
  TfrmCadCliente = class(TForm)
    gbxCadClientes: TGroupBox;
    sbtCadastrar: TSpeedButton;
    sbtCancelar: TSpeedButton;
    memObs: TMemo;
    gbxIdCliente: TGroupBox;
    lblNomeCliente: TLabel;
    lblCPF_CNPJ: TLabel;
    lblRG_IE: TLabel;
    lblSexo: TLabel;
    lblEstadoCivil: TLabel;
    lblNascimento: TLabel;
    lblSituacao: TLabel;
    edtNomeCliente: TEdit;
    mskRG: TMaskEdit;
    mskCPF: TMaskEdit;
    cbxSexo: TComboBox;
    cbxEstadoCivil: TComboBox;
    cbxSituação: TComboBox;
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
    gbxMovimentacao: TGroupBox;
    lblDtCadastro: TLabel;
    lblUltimaConsulta: TLabel;
    lblDtAtual: TLabel;
    MainMenu1: TMainMenu;
    Fechar1: TMenuItem;
    dtpNascimento: TDateTimePicker;
    dtpCadastro: TDateTimePicker;
    dtpUltimaConsulta: TDateTimePicker;
    dtpData: TDateTimePicker;
    lblObservação: TLabel;
    sbtFoto: TSpeedButton;
    lblFoto: TLabel;
    Foto: TDBImage;
    opdFoto: TOpenPictureDialog;
    Consultar1: TMenuItem;
    pgcEncaminhamento: TPageControl;
    tbsAnteriores: TTabSheet;
    tbsEncaminhamento: TTabSheet;
    gbxAnterior: TGroupBox;
    lblResponsavel: TLabel;
    lblProcAnteriores: TLabel;
    edtIndicadoPor: TEdit;
    memProcedimentos: TMemo;
    gbxEncaminhamento: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edtEncPara: TEdit;
    memEncProcedimento: TMemo;
    Label3: TLabel;
    edtResponsavel: TEdit;
    EnviarEMailCtrlE1: TMenuItem;
    lblProxConsulta: TLabel;
    dtpProxConsulta: TDateTimePicker;
    HistricodeHorriosCtrlH1: TMenuItem;
    HistricodeImagens1: TMenuItem;
    Odontograma1: TMenuItem;
    Histrico1: TMenuItem;
    AnamneseCtrlA1: TMenuItem;
    procedure Fechar1Click(Sender: TObject);
    procedure sbtCancelarClick(Sender: TObject);
    procedure sbtFotoClick(Sender: TObject);
    procedure sbtCancelarMouseLeave(Sender: TObject);
    procedure sbtCancelarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbtCadastrarMouseLeave(Sender: TObject);
    procedure sbtCadastrarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbtCadastrarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Consultar1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EnviarEMailCtrlE1Click(Sender: TObject);
    procedure HistricodeHorriosCtrlH1Click(Sender: TObject);
    procedure HistricodeImagens1Click(Sender: TObject);
    procedure Odontograma1Click(Sender: TObject);
    procedure AnamneseCtrlA1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    gCaminhoFoto : string;
    gNuCliente : Integer;
    procedure LimpaCampos;
    procedure InsertUpdateDelete(pTipo : Integer);
  end;

var
  frmCadCliente: TfrmCadCliente;

implementation

{$R *.dfm}

uses untRotinas, untDM, untConCliente, untRemetente, untHistorico,
  untHistoricoEvolucao, untOdontograma, untAnamnese, untConfiguracoes,
  untCadAnamnese;

procedure TfrmCadCliente.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #27 then
      Close;
end;

procedure TfrmCadCliente.FormShow(Sender: TObject);
begin
    gAlterar := False;
    dtpNascimento.Date := Date;
    dtpCadastro.Date := Date;
    dtpUltimaConsulta.Date := Date;
    dtpProxConsulta.Date := Date;
    dtpData.Date := Date;
    pgcEncaminhamento.TabIndex := 0;
    DM.sdsCliente.Close;
end;

procedure TfrmCadCliente.HistricodeHorriosCtrlH1Click(Sender: TObject);
begin
    frmHistorico := TfrmHistorico.Create(Application);
      DM.sdsAgenda.Close;
      DM.sdsAgenda.DataSet.CommandText := ' select * from age00 a '+
                                          ' inner join col00 b on a.nu_colaborador = b.indice '+
                                          ' where a.nu_cliente = '+IntToStr(DM.sdsClienteINDICE.AsInteger)+
                                          ' order by a.data';
      DM.sdsAgenda.Open;
      frmHistorico.StatusBar1.Panels[0].Text := 'Total de agendamentos: '+IntToStr(DM.sdsAgenda.RecordCount);
    frmHistorico.ShowModal;
    frmHistorico.Free;
    frmHistorico := nil;
end;

procedure TfrmCadCliente.HistricodeImagens1Click(Sender: TObject);
begin
    frmHistoricoEvolucao := TfrmHistoricoEvolucao.Create(Application);
    frmHistoricoEvolucao.gNuCliente := gNuCliente;
    frmHistoricoEvolucao.ShowModal;
    frmHistoricoEvolucao.Free;
    frmHistoricoEvolucao := nil;
end;

procedure TfrmCadCliente.InsertUpdateDelete(pTipo : Integer);
var vSQL, vSQL2, vMensagem, vBmp, vCaminho : string;
    vFoto: TFileStream;
    vFotoBmp: TBitmap;
    sdsTemp : TSimpleDataSet;
    codCliente : Integer;
begin
    case pTipo of
      0: // inserir
        begin
          vSQL := 'insert into CLI00 '+
                  '(NOME, RESPONSAVEL, RG_IE,'+
                  'CPF_CNPJ, DT_NASCIMENTO, SEXO, ESTADO_CIVIL,'+
                  'SITUACAO, UF, CEP, CIDADE, BAIRRO,'+
                  'TIPO_LOGRADOURO, LOGRADOURO, NUMERO, COMPLEMENTO,'+
                  'REFERENCIA, TELEFONE_FIXO, CELULAR, CELULAR2, FAX,'+
                  'EMAIL, RESP_ANTERIOR, PROCED_ANTERIOR, ENCAMINHADO_PARA, ULTIMO_PROCED, '+
                  'DT_CADASTRO, DT_ULTIMA_CONSULTA, DT_PROX_CONSULTA, OBSERVACAO) '+
                  'VALUES '+
                  '(:pNOME, :pRESPONSAVEL, :pRG_IE,'+
                  ':pCPF_CNPJ, :pDT_NASCIMENTO, :pSEXO, :pESTADO_CIVIL,'+
                  ':pSITUACAO, :pUF, :pCEP, :pCIDADE, :pBAIRRO,'+
                  ':pTIPO_LOGRADOURO, :pLOGRADOURO, :pNUMERO, :pCOMPLEMENTO,'+
                  ':pREFERENCIA, :pTELEFONE_FIXO, :pCELULAR, :pCELULAR2, :pFAX,'+
                  ':pEMAIL, :pRESP_ANTERIOR, :pPROCED_ANTERIOR, :pENCAMINHADO_PARA,'+
                  ':pULTIMO_PROCED, :pDT_CADASTRO, :pDT_ULTIMA_CONSULTA, :pDT_PROX_CONSULTA, :pOBSERVACAO)';

          vMensagem := 'incluido';
        end;

      1: // alterar
        begin
          vSQL := 'update CLI00 set '+
                  'NOME             = :pNOME, '+
                  'RESPONSAVEL      = :pRESPONSAVEL, '+
                  'RG_IE            = :pRG_IE, '+
                  'CPF_CNPJ         = :pCPF_CNPJ, '+
                  'DT_NASCIMENTO    = :pDT_NASCIMENTO, '+
                  'SEXO             = :pSEXO, '+
                  'ESTADO_CIVIL     = :pESTADO_CIVIL, '+
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
                  'RESP_ANTERIOR    = :pRESP_ANTERIOR, '+
                  'PROCED_ANTERIOR  = :pPROCED_ANTERIOR, '+
                  'ENCAMINHADO_PARA = :pENCAMINHADO_PARA, '+
                  'ULTIMO_PROCED    = :pULTIMO_PROCED, '+
                  'OBSERVACAO       = :pOBSERVACAO';

          vSQL := vSQL + ' where INDICE = :pINDICE';

          vMensagem := 'alterado';
        end;

      2: //apagar
        begin
          if Confirmacao('Confirmação', 'Deseja, realmente, excluir este registro?') then begin

            vSQL := 'delete from CLI00 '+
                    'where INDICE = :pINDICE';

            vSQL2 := ' delete from FOT00 '+
                     ' where NU_CLIENTE = :pNU_CLIENTE';

            vMensagem := 'excluido';

          end
          else Exit;
        end;
    end;

    with DM do begin

      try
        codCliente := DM.sdsClienteINDICE.AsInteger;

        TRANSACAO.TransactionID  := NewTransactionID;
        TRANSACAO.IsolationLevel := xilREPEATABLEREAD;

        with sqlAux do begin

          if pTipo = 2 then begin
            try
              SQL.Clear;
              CommandText := vSQL2;
              ParamByName('pNU_CLIENTE').AsInteger := codCliente;
              CONEXAO.StartTransaction(TRANSACAO);
              Close;
              ExecSQL;
              CONEXAO.Commit(TRANSACAO);
            except
              on Exc:Exception do
                begin
                  CONEXAO.Rollback(TRANSACAO);
                  Informacao('Atenção!', 'A imagem não pode ser excluída: ' + Exc.Message);
                  Exit;
                end;
            end;
          end;


          SQL.Clear;
          CommandText := vSQL;

          if pTipo in [1,2] then
            ParamByName('pINDICE').AsInteger := codCliente;

          // se for inserir ou alterar passa os parametros
          if pTipo in [0,1] then begin

            ParamByName('pNOME').AsString            := edtNomeCliente.Text;
            ParamByName('pRESPONSAVEL').AsString     := edtResponsavel.Text;
            ParamByName('pRG_IE').AsString           := mskRG.Text;
            ParamByName('pCPF_CNPJ').AsString        := mskCPF.Text;
            ParamByName('pDT_NASCIMENTO').AsDate     := dtpNascimento.Date;
            if cbxSexo.ItemIndex = 0 then
              ParamByName('pSEXO').AsString          := 'M'
            else
              ParamByName('pSEXO').AsString          := 'F';
            ParamByName('pESTADO_CIVIL').AsString    := cbxEstadoCivil.Text;
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
            ParamByName('pRESP_ANTERIOR').AsString   := edtIndicadoPor.Text;
            ParamByName('pPROCED_ANTERIOR').AsString := memProcedimentos.Text;
            ParamByName('pENCAMINHADO_PARA').AsString:= edtEncPara.Text;
            ParamByName('pULTIMO_PROCED').AsString := memEncProcedimento.Text;
            if pTipo = 0 then begin
              ParamByName('pDT_CADASTRO').AsDate        := dtpCadastro.Date;
              ParamByName('pDT_ULTIMA_CONSULTA').AsDate := dtpUltimaConsulta.Date;
              ParamByName('pDT_PROX_CONSULTA').AsDate   := dtpProxConsulta.Date;
            end;
            ParamByName('pOBSERVACAO').AsString      := memObs.Text;

          end;
          CONEXAO.StartTransaction(TRANSACAO);
          Close;
          ExecSQL;
          CONEXAO.Commit(TRANSACAO);


          //gravar a foto
          if (ptipo <> 2) and (opdFoto.FileName <> '') then begin
            sdsTemp := TSimpleDataSet.Create(nil);
            sdsTemp.Connection := DM.CONEXAO;

            sdsTemp.Close;
            sdsTemp.DataSet.CommandText := ' select * from FOT00 '+
                                           ' where NU_CLIENTE = :pNU_CLIENTE';
            sdsTemp.DataSet.ParamByName('pNU_CLIENTE').AsInteger := codCliente;
            sdsTemp.Open;

            with DM do begin
              try
                TRANSACAO.TransactionID  := NewTransactionID;
                TRANSACAO.IsolationLevel := xilREPEATABLEREAD;

                with sqlAux do begin
                  SQL.Clear;

                  if (sdsTemp.RecordCount = 0) or (pTipo = 0) then begin
                    CommandText := 'insert into FOT00 '+
                                   '(IMAGEM, NU_CLIENTE) VALUES (:pIMAGEM, :pNU_CLIENTE)';
                    if pTipo = 1 then
                      ParamByName('pNU_CLIENTE').AsInteger := codCliente
                    else begin
                      DM.sdsCliente.Close;
                      DM.sdsCliente.DataSet.CommandText := ' select * from CLI00 order by INDICE';
                      DM.sdsCliente.Open;
                      DM.sdsCliente.Last;
                      ParamByName('pNU_CLIENTE').AsInteger := DM.sdsClienteINDICE.AsInteger;
                    end;
                  end
                  else begin
                    CommandText := ' update FOT00 set '+
                                   ' IMAGEM     = :pIMAGEM, '+
                                   ' NU_CLIENTE = :pNU_CLIENTE '+
                                   ' where NU_CLIENTE = :pNU_CLIENTE ';

                    sdsTemp.Close;
                    sdsTemp.DataSet.CommandText := ' select * from CLI00 where INDICE = '+IntToStr(codCliente);
                    sdsTemp.Open;
                    ParamByName('pNU_CLIENTE').AsInteger := codCliente;
                  end;

                  vBmp := JpgToBmp(opdFoto.FileName);
                  vFoto := TFileStream.Create(vBmp, fmOpenRead);
                  vCaminho := opdFoto.FileName;
                  ParamByName('pIMAGEM').LoadFromStream(vFoto, ftGraphic);


                  CONEXAO.StartTransaction(TRANSACAO);
                  Close;
                  ExecSQL;
                  CONEXAO.Commit(TRANSACAO);
                end;
              except
                on Exc:Exception do
                  begin
                    CONEXAO.Rollback(TRANSACAO);
                    Informacao('Atenção!', 'A imagem não pode ser gravada no banco de dados: ' + Exc.Message);
                    Exit;
                  end;
              end;
            end;
            sdsTemp.Free;
          end;

          Afirmacao('Confirmação', 'Registro '+vMensagem+' com sucesso!');
        end; // fim with sqlAux
      except
        on Exc:Exception do
          begin
            CONEXAO.Rollback(TRANSACAO);
            Informacao('Atenção!', 'Ocorreu um erro na gravação ao banco de dados: ' + Exc.Message);
            Exit;
          end;
      end;

    end; // fim with DM
end;

procedure TfrmCadCliente.AnamneseCtrlA1Click(Sender: TObject);
begin
    DM.sdsAnamnese.Close;
    DM.sdsAnamnese.Open;
    if DM.sdsAnamnesePERGUNTA1.AsString = '' then
    begin
      if Confirmacao('Atenção', 'Nenhuma pergunta para anamnese foi cadastrada.'+#13+
                     'Deseja cadastra-las agora?') then
      begin
        CriaForm(TfrmCadAnamnese, frmCadAnamnese, False);
        DM.sdsAnamnese.Close;
        DM.sdsAnamnese.Open;
      end
      else
        Exit;
    end
    else
      CriaForm(TfrmAnamnese, frmAnamnese, False);

    DM.sdsAnamnese.Close;

end;

procedure TfrmCadCliente.Consultar1Click(Sender: TObject);
var vFoto: TStream;  // um stream para o conteúdo do campo BLOB
    //imagem : TPicture;
    sdsTemp : TSimpleDataSet;
    imagem : TBitmap;
begin
    LimpaCampos;

    gAgenda := False;
    opdFoto.FileName := '';
    frmConCliente := TfrmConCliente.Create(Application);
    frmConCliente.ShowModal;

    if (gAlterar) and (frmConCliente.sbtAlterar.Enabled = True) then begin
      DM.sdsFoto.Close;
      DM.sdsFoto.DataSet.CommandText := 'select * from FOT00 where NU_CLIENTE = '+ IntToStr(DM.sdsClienteINDICE.AsInteger);
      DM.sdsFoto.Open;

      //ShowMessage(IntToStr(DM.sdsFoto.RecordCount));

      if DM.sdsFotoIMAGEM.AsString <> '' then begin
        vFoto := DM.sdsFoto.CreateBlobStream(DM.sdsFotoIMAGEM, bmRead);
        imagem := TBitmap.Create();
        imagem.LoadFromStream(vFoto);
        Foto.Picture.Assign(imagem);
        imagem.Free;
      end;

      edtNomeCliente.Text     := DM.sdsClienteNOME.AsString;
      edtResponsavel.Text     := DM.sdsClienteRESPONSAVEL.AsString;
      mskCPF.Text             := DM.sdsClienteCPF_CNPJ.AsString;
      mskRG.Text              := DM.sdsClienteRG_IE.AsString;
      dtpNascimento.Date      := DM.sdsClienteDT_NASCIMENTO.AsDateTime;
      if DM.sdsClienteSEXO.AsString = 'M' then
        cbxSexo.ItemIndex := 0
      else
        cbxSexo.ItemIndex := 1;
      cbxEstadoCivil.ItemIndex    := cbxEstadoCivil.Items.IndexOf(DM.sdsClienteESTADO_CIVIL.AsString);
      cbxSituação.ItemIndex       := cbxSituação.Items.IndexOf(DM.sdsClienteSITUACAO.AsString);
      cbxUF.ItemIndex             := cbxUF.Items.IndexOf(DM.sdsClienteUF.AsString);
      mskCEP.Text                 := DM.sdsClienteCEP.AsString;
      edtCidade.Text              := DM.sdsClienteCIDADE.AsString;
      edtBairro.Text              := DM.sdsClienteBAIRRO.AsString;
      cbxTipoLogradouro.ItemIndex := cbxTipoLogradouro.Items.IndexOf(DM.sdsClienteTIPO_LOGRADOURO.AsString);
      edtLogradouro.Text          := DM.sdsClienteLOGRADOURO.AsString;
      edtNumero.Text              := DM.sdsClienteNUMERO.AsString;
      cbxComplemento.ItemIndex    := cbxComplemento.Items.IndexOf(DM.sdsClienteCOMPLEMENTO.AsString);
      edtReferencia.Text          := DM.sdsClienteREFERENCIA.AsString;
      mskFixo.Text                := DM.sdsClienteTELEFONE_FIXO.AsString;
      mskCelular1.Text            := DM.sdsClienteCELULAR.AsString;
      mskCelular2.Text            := DM.sdsClienteCELULAR2.AsString;
      mskFax.Text                 := DM.sdsClienteFAX.AsString;
      edtEmail.Text               := DM.sdsClienteEMAIL.AsString;
      edtIndicadoPor.Text         := DM.sdsClienteRESP_ANTERIOR.AsString;
      memProcedimentos.Lines.Add(DM.sdsClientePROCED_ANTERIOR.AsString);
      edtEncPara.Text             := DM.sdsClienteENCAMINHADO_PARA.AsString;
      memEncProcedimento.Lines.Add(DM.sdsClienteULTIMO_PROCED.AsString);
      dtpCadastro.Date            := DM.sdsClienteDT_CADASTRO.AsDateTime;
      dtpCadastro.Enabled         := False;
      memObs.Lines.Add(DM.sdsClienteOBSERVACAO.AsString);
      dtpUltimaConsulta.Date      := DM.sdsClienteDT_ULTIMA_CONSULTA.AsDateTime;
      // cria SimpleDataSet temporário
      sdsTemp := TSimpleDataSet.Create(nil);
      sdsTemp.Connection := DM.CONEXAO;

      with sdsTemp do begin
        Close;
        // consulta se há agendamento marcado para a data, hora e colaborador
        DataSet.CommandText := ' select first 1 * from age00 a '+
                               ' where a.DATA > :pDATA and '+
                               ' a.nu_cliente = :pNU_CLIENTE and '+
                               ' a.situacao = '+QuotedStr('ABERTO')+
                               ' order by a.data, a.HORA ';
        DataSet.ParamByName('pDATA').AsDate := Date;
        DataSet.ParamByName('pNU_CLIENTE').AsInteger := DM.sdsClienteINDICE.AsInteger;
        Open;
      end;
      if sdsTemp.RecordCount > 0 then
        dtpProxConsulta.Date := sdsTemp.FieldByName('DATA').AsDateTime
      else dtpProxConsulta.Date := Date;
      gNuCliente := DM.sdsClienteINDICE.AsInteger;

      sbtCadastrar.Caption := 'Alterar';

      Histrico1.Visible := True;

{      if Trim(DM.sdsClienteEMAIL.AsString) <> '' then begin
        EnviarEMailCtrlE1.Visible := True;
      end
      else begin
        EnviarEMailCtrlE1.Visible := False;
      end;
}
      Odontograma1.Visible := True;
      AnamneseCtrlA1.Visible := True;

    end;

    frmConCliente.Free;
    frmConCliente := nil;
end;

procedure TfrmCadCliente.EnviarEMailCtrlE1Click(Sender: TObject);
begin
    frmRemetente := TfrmRemetente.Create(Application);
      with frmRemetente do begin
        ckbTodos.Checked := False;
        ckbTodos.Enabled := False;
        sbtPesquisar.Enabled := False;
        memRemetente.Text := edtEmail.Text;
        memRemetente.Enabled := False;
      end;

    frmRemetente.ShowModal;
    frmRemetente.Free;
    frmRemetente := nil;
end;

procedure TfrmCadCliente.Fechar1Click(Sender: TObject);
begin
    Close;
end;

procedure TfrmCadCliente.sbtCadastrarClick(Sender: TObject);
var ano1, ano2: string;
begin
    if Trim(edtNomeCliente.Text) =  '' then begin
      Informacao('Atenção', 'Digite o nome do cliente.');
      edtNomeCliente.SetFocus;
      Exit;
    end;

    ano1 := copy(DateToStr(date), 7, 4);
    ano2 := copy(DateToStr(dtpNascimento.Date), 7, 4);
    // calcula o ano de nascimento para maior idade
    if (StrToInt(ano1) - StrToInt(ano2) < 18) and (Trim(edtResponsavel.Text) = '') then begin
      Informacao('Atenção', 'Digite o nome do responsável.');
      edtResponsavel.SetFocus;
      Exit;
    end;

    // se não possuir dentes
    if dtpNascimento.Date > Date - 180 then begin
      Informacao('Atenção', 'Data Nascimento imprópria');
      dtpNascimento.SetFocus;
      Exit;
    end;


    if not gAlterar then begin
      InsertUpdateDelete(0);
      sbtCadastrar.Caption := 'Cadastrar';
    end
    else begin
      InsertUpdateDelete(1);
      gAlterar := False;
      DM.sdsCliente.Close;
    end;
    edtNomeCliente.SetFocus;
    LimpaCampos;
end;

procedure TfrmCadCliente.sbtCadastrarMouseLeave(Sender: TObject);
begin
    sbtCadastrar.Caption := '';
end;

procedure TfrmCadCliente.sbtCadastrarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    if gAlterar then
      sbtCadastrar.Caption := 'Alterar'
    else
      sbtCadastrar.Caption := 'Cadastrar';
end;

procedure TfrmCadCliente.sbtCancelarClick(Sender: TObject);
begin
    LimpaCampos;
    edtNomeCliente.SetFocus;
end;

procedure TfrmCadCliente.sbtCancelarMouseLeave(Sender: TObject);
begin
    sbtCancelar.Caption := '';
end;

procedure TfrmCadCliente.sbtCancelarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    sbtCancelar.Caption := 'Cancelar';
end;

procedure TfrmCadCliente.LimpaCampos;
begin
    // Identificação do cliente
    edtNomeCliente.Clear;
    edtResponsavel.Clear;
    mskRG.Clear;
    mskCPF.Clear;
    dtpNascimento.Date := Date;
    cbxSexo.ItemIndex := 0;
    cbxEstadoCivil.ItemIndex := -1;
    cbxSituação.ItemIndex := 0;

    // Foto
    Foto.Picture.Bitmap := nil;

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

    // Responsável
    edtIndicadoPor.Clear;
    memProcedimentos.Clear;
    edtEncPara.Clear;
    memEncProcedimento.Clear;
    pgcEncaminhamento.TabIndex := 0;

    // Observação
    memObs.Clear;

    // Movimento da conta
    dtpCadastro.Date := Date;
    dtpUltimaConsulta.Date := Date;
    dtpProxConsulta.Date := Date;
    dtpData.Date := Date;

    EnviarEMailCtrlE1.Visible := False;
    Histrico1.Visible := False;
    Odontograma1.Visible := False;
    AnamneseCtrlA1.Visible := False;

    gAlterar := False;
end;

procedure TfrmCadCliente.Odontograma1Click(Sender: TObject);
begin
    frmOdontograma := TfrmOdontograma.Create(Application);
      if Permissao(gLogin, gSenha) then begin
        frmOdontograma.pgcAdultoInfantil.Enabled := True;
      end
      else begin
        frmOdontograma.pgcAdultoInfantil.Enabled := False;
        frmOdontograma.sbtCadastrar.Enabled := False;
      end;
    frmOdontograma.Caption := 'Odontograma de '+DM.sdsClienteNOME.AsString;
    frmOdontograma.ShowModal;
    frmOdontograma.Free;
    frmOdontograma := nil;
end;

procedure TfrmCadCliente.sbtFotoClick(Sender: TObject);
begin
    opdFoto.Filter := 'Jpg|*.jpg';
    if opdFoto.Execute then begin
      Foto.Picture.LoadFromFile(opdFoto.FileName);
      //RedimensionarImagem(Foto.Picture.Graphic, 120, 130);
    end;
end;

end.
