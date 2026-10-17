unit untPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.RibbonLunaStyleActnCtrls,
  Vcl.Ribbon, Vcl.ImgList, Vcl.ComCtrls, Vcl.Buttons, Vcl.ToolWin, Vcl.ActnMan,
  Vcl.ActnCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, SimpleDS, Vcl.Imaging.pngimage,
  IBX.IBServices, {RpBase, RpSystem, RpDefine, RpRave, }sqlexpr, db, Jpeg;

type
  TfrmPrincipal = class(TForm)
    imlMenu: TImageList;
    stbBarra: TStatusBar;
    lblExpira: TLabel;
    Timer1: TTimer;
    Image2: TImage;
    pnlMenu: TPanel;
    pctMenuPrincipal: TPageControl;
    tsClientes: TTabSheet;
    sbtCadCliente: TSpeedButton;
    sbtFornecedor: TSpeedButton;
    sbtFuncionario: TSpeedButton;
    sbtProdutos: TSpeedButton;
    sbtProcedimento: TSpeedButton;
    tsAgenda: TTabSheet;
    sbtAgenda: TSpeedButton;
    sbtAvisos: TSpeedButton;
    tsCaixa: TTabSheet;
    sbtDebitos: TSpeedButton;
    sbtContas2: TSpeedButton;
    sbtCaixa: TSpeedButton;
    sbtBalanco: TSpeedButton;
    sbtDespesas: TSpeedButton;
    sbtFechaCaixa: TSpeedButton;
    tsMensagem: TTabSheet;
    sbtEmail: TSpeedButton;
    sbtFaceBook: TSpeedButton;
    tsUsuarios: TTabSheet;
    sbtUsuario: TSpeedButton;
    tsConfiguracoes: TTabSheet;
    sbtConfigurações: TSpeedButton;
    tsSair: TTabSheet;
    sbtBackup: TSpeedButton;
    sbtSair: TSpeedButton;
    Image1: TImage;
    Image3: TImage;
    sbtSobre: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure sbtCadClienteClick(Sender: TObject);
    procedure sbtFornecedorClick(Sender: TObject);
    procedure sbtFuncionarioClick(Sender: TObject);
    procedure sbtSairClick(Sender: TObject);
    procedure sbtProdutosClick(Sender: TObject);
    procedure sbtAgendaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtConfiguraçõesClick(Sender: TObject);
    procedure sbtCaixaClick(Sender: TObject);
    procedure pctMenuPrincipalMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure imgLogoPrincipalMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbtDebitosClick(Sender: TObject);
    procedure sbtContas2Click(Sender: TObject);
    procedure sbtDespesasClick(Sender: TObject);
    procedure sbtAvisosClick(Sender: TObject);
    procedure sbtUsuarioClick(Sender: TObject);
    procedure sbtBalancoClick(Sender: TObject);
    procedure sbtBackupClick(Sender: TObject);
    procedure sbtEmailClick(Sender: TObject);
    procedure pctMenuPrincipalChange(Sender: TObject);
    procedure sbtFechaCaixaClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure sbtProcedimentoClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure sbtSobreClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses untCadCliente, untConCliente, untRotinas, untCadFornecedor,
  untConFornecedor, untCadFuncionario, untConFuncionario, untCadProduto,
  untConProduto, untCadVenda, untAgenda, untConfiguracoes, untDM, untAviso,
  untCaixa, untDebitos, untContas, untPagamento, untCadUsuario, untBalanco,
  untFaceBook, untFechaCaixa, untDMReport, untRemetente,
  untCadProcedimento, untBackup, untApresentacao, untLogin, untSobre;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    if Confirmacao('Backup', 'Efetuar backup?') then
      sbtBackup.Click;

    if not Confirmacao('Sair', 'Deseja finalizar o sistema?') then
      Action := caNone;
end;

procedure TfrmPrincipal.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #27 then
      Close;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
var Ano, Mes, Dia: Word;
    DtAtual, DtRenovacao, Data: TDate;
    Periodo: Integer;
begin
    with DM.sdsGerenciador do begin
      Close;
      DataSet.CommandText := ' select * from GER00 ';
      Open;
    end;

    if DateToStr(DM.sdsGerenciadorDT_IMPLANTACAO.AsDateTime) = '30/12/1899' then begin
      try
        DM.TRANSACAO.TransactionID  := DM.NewTransactionID;
        DM.TRANSACAO.IsolationLevel := xilREPEATABLEREAD;
        DM.sqlAux.SQL.Clear;
        DM.sqlAux.CommandText := ' update GER00 set DT_IMPLANTACAO = :pDT_IMPLANTACAO, DT_RENOVACAO = :pDT_RENOVACAO ';
        DM.sqlAux.ParamByName('pDT_IMPLANTACAO').AsDate := Date;
        DM.sqlAux.ParamByName('pDT_RENOVACAO').AsDate  := Date;
        DM.CONEXAO.StartTransaction(DM.TRANSACAO);
        DM.sqlAux.Close;
        DM.sqlAux.ExecSQL;
        DM.CONEXAO.Commit(DM.TRANSACAO);
      except
        on Exc:Exception do
          begin
            DM.CONEXAO.Rollback(DM.TRANSACAO);
            Informacao('Atenção!', 'Ocorreu um erro no gravação ao banco de dados: ' + Exc.Message);
            Exit;
          end;
      end;
    end;

    with DM.sdsGerenciador do begin
      Close;
      DataSet.CommandText := ' select * from GER00 ';
      Open;
    end;

    if Trim(DM.sdsGerenciadorLOGO.AsString) <> '' then
      Image1.Picture.LoadFromFile(DM.sdsGerenciadorLOGO.AsString);

    DtAtual := Date;
    DtRenovacao := DM.sdsGerenciadorDT_RENOVACAO.AsDateTime;
    Periodo := DM.sdsGerenciadorPERIODO_ATIVO.AsInteger;
    Data := DtRenovacao + Periodo;
    if DtAtual >= (Data - 10) then begin
      lblExpira.Visible := True;
      lblExpira.Caption := 'Sua licença é válida até dia '+ DateToStr(Data);
    end;


    DMReport := TDMReport.Create(nil);

    //pctMenuPrincipal.Height := 24;

    pctMenuPrincipal.TabIndex := 0;

    DecodeDate(Date , Ano, Mes, Dia);

    with DM.sdsAniversarios do begin
      Close;
      DataSet.CommandText := ' select * from CLI00 '+
                             ' where extract(day from (dt_nascimento)) = '+FloatToStr(Dia)+
                             ' and extract(month from (dt_nascimento)) = '+FloatToStr(Mes);
      Open;
    end;

    with DM.sdsAPagar do begin
      Close;
      DataSet.CommandText := ' select * from des00 a '+
                             ' left join col00 b on a.nu_colaborador = b.indice '+
                             ' where a.DT_VENCIMENTO <= '+QuotedStr(InverteData(DateToStr(Date + 5)))+
                             ' and a.SITUACAO = '+QuotedStr('Pendente');
      Open;
    end;

    with DM.sdsAReceber do begin
      Close;
      DataSet.CommandText := ' select b.nome, a.valor_total, a.dt_atendimento, c.nome from cxa00 a '+
                             ' left join cli00 b on a.nu_cliente = b.indice '+
                             ' left join col00 c on a.nu_colaborador = c.indice '+
                             ' where a.situacao = '+QuotedStr('PENDENTE') +
                             ' and a.transacao = '+QuotedStr('E')+
                             ' and a.dt_atendimento < :pDtAtendimento';
      DataSet.ParamByName('pDtAtendimento').AsDate := Date;
      Open;
    end;

    if (DM.sdsAniversarios.RecordCount > 0) or
       (DM.sdsAReceber.RecordCount > 0) or
       (DM.sdsAPagar.RecordCount > 0) then  begin
      CriaForm(TfrmAviso, frmAviso, False);
    end;

    stbBarra.Panels[0].Text := 'Usuário: '+ gUsuario;
    stbBarra.Panels[2].Text := GetVersion;

    if not Permissao(gLogin, gSenha) then begin
      DM.sdsPermissao.Close;
      DM.sdsPermissao.DataSet.CommandText := 'select * from BLO00';
      DM.sdsPermissao.Open;

      case pctMenuPrincipal.TabIndex of
        0: // Cadastro
          begin
            DM.sdsPermissao.First;
            while not DM.sdsPermissao.Eof do begin
              case DM.sdsPermissaoINDICE.AsInteger of
                1:  // CLIENTE
                  if DM.sdsPermissaoSITUACAO.AsString = 'S' then
                    sbtCadCliente.Visible := True
                  else sbtCadCliente.Visible := False;
                2: // FORNECEDOR
                  if DM.sdsPermissaoSITUACAO.AsString = 'S' then
                    sbtFornecedor.Visible := True
                  else sbtFornecedor.Visible := False;
                3: // FUNCIONÁRIO
                  if DM.sdsPermissaoSITUACAO.AsString = 'S' then
                    sbtFuncionario.Visible := True
                  else sbtFuncionario.Visible := False;
                4: // PRODUTO
                  if DM.sdsPermissaoSITUACAO.AsString = 'S' then
                    sbtProdutos.Visible := True
                  else sbtProdutos.Visible := False;
                17: // PROCEDIMENTO
                  if DM.sdsPermissaoSITUACAO.AsString = 'S' then
                    sbtProcedimento.Visible := True
                  else sbtProcedimento.Visible := False;
              end;
              DM.sdsPermissao.Next;
            end;
          end;
      end;

      DM.sdsPermissao.First;
      while not DM.sdsPermissao.Eof do begin
        case DM.sdsPermissaoINDICE.AsInteger of
          12: // MENSAGEM
            if DM.sdsPermissaoSITUACAO.AsString = 'N' then
              tsMensagem.TabVisible := False;
          13: // USUÁRIO
            if DM.sdsPermissaoSITUACAO.AsString = 'N' then
              tsUsuarios.TabVisible := False;
          14: // CONFIGURAÇÃO
            if DM.sdsPermissaoSITUACAO.AsString = 'N' then
              tsConfiguracoes.TabVisible := False;
        end;
        DM.sdsPermissao.Next;
      end;

    end;

end;

procedure TfrmPrincipal.imgLogoPrincipalMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    //pctMenuPrincipal.Height := 24;
end;

procedure TfrmPrincipal.pctMenuPrincipalChange(Sender: TObject);
begin
    if not Permissao(gLogin, gSenha) then begin
      DM.sdsPermissao.Close;
      DM.sdsPermissao.DataSet.CommandText := 'select * from BLO00';
      DM.sdsPermissao.Open;

      case pctMenuPrincipal.TabIndex of
        0: // Cadastro
          begin
            DM.sdsPermissao.First;
            while not DM.sdsPermissao.Eof do begin
              case DM.sdsPermissaoINDICE.AsInteger of
                1:  // CLIENTE
                  if DM.sdsPermissaoSITUACAO.AsString = 'S' then
                    sbtCadCliente.Visible := True
                  else sbtCadCliente.Visible := False;
                2: // FORNECEDOR
                  if DM.sdsPermissaoSITUACAO.AsString = 'S' then
                    sbtFornecedor.Visible := True
                  else sbtFornecedor.Visible := False;
                3: // FUNCIONÁRIO
                  if DM.sdsPermissaoSITUACAO.AsString = 'S' then
                    sbtFuncionario.Visible := True
                  else sbtFuncionario.Visible := False;
                4: // PRODUTO
                  if DM.sdsPermissaoSITUACAO.AsString = 'S' then
                    sbtProdutos.Visible := True
                  else sbtProdutos.Visible := False;
                17: // PROCEDIMENTO
                  if DM.sdsPermissaoSITUACAO.AsString = 'S' then
                    sbtProcedimento.Visible := True
                  else sbtProcedimento.Visible := False;
              end;
              DM.sdsPermissao.Next;
            end;
          end;
        1: // Agenda e Avisos
          begin
            DM.sdsPermissao.First;
            while not DM.sdsPermissao.Eof do begin
              case DM.sdsPermissaoINDICE.AsInteger of
                5: // AGENDA
                  if DM.sdsPermissaoSITUACAO.AsString = 'S' then
                    sbtAgenda.Visible := True
                  else sbtAgenda.Visible := False;
                6: // AVISOS
                  if DM.sdsPermissaoSITUACAO.AsString = 'S' then
                    sbtAvisos.Visible := True
                  else sbtAvisos.Visible := False;
              end;
              DM.sdsPermissao.Next;
            end;
          end;
        2: // Controle de Caixa
          begin
            DM.sdsPermissao.First;
            while not DM.sdsPermissao.Eof do begin
              case DM.sdsPermissaoINDICE.AsInteger of
                7: // CAIXA
                  if DM.sdsPermissaoSITUACAO.AsString = 'S' then
                    sbtCaixa.Visible := True
                  else sbtCaixa.Visible := False;
                8: // MOVIMENTAÇÃO
                  if DM.sdsPermissaoSITUACAO.AsString = 'S' then
                    sbtDebitos.Visible := True
                  else sbtDebitos.Visible := False;
                9: // DESPESAS
                  if DM.sdsPermissaoSITUACAO.AsString = 'S' then
                    sbtDespesas.Visible := True
                  else sbtDespesas.Visible := False;
                10:// A RECEBER
                  if DM.sdsPermissaoSITUACAO.AsString = 'S' then
                    sbtContas2.Visible := True
                  else sbtContas2.Visible := False;
                11:// BALANÇO
                  if DM.sdsPermissaoSITUACAO.AsString = 'S' then
                    sbtBalanco.Visible := True
                  else sbtBalanco.Visible := False;
                16:// FECHAR CAIXA
                  if DM.sdsPermissaoSITUACAO.AsString = 'S' then
                    sbtFechaCaixa.Visible := True
                  else sbtFechaCaixa.Visible := False;
              end;
              DM.sdsPermissao.Next;
            end;
          end;
        3: // Mensagens
          begin
            DM.sdsPermissao.First;
            while not DM.sdsPermissao.Eof do begin
              case DM.sdsPermissaoINDICE.AsInteger of
                12: // EMAIL
                  if DM.sdsPermissaoSITUACAO.AsString = 'S' then
                    sbtEmail.Visible := True
                  else sbtEmail.Visible := False;
              end;
              DM.sdsPermissao.Next;
            end;
          end;
        4: // Usuários
          begin
            DM.sdsPermissao.First;
            while not DM.sdsPermissao.Eof do begin
              case DM.sdsPermissaoINDICE.AsInteger of
                13: // USUÁRIO
                  if DM.sdsPermissaoSITUACAO.AsString = 'S' then
                    sbtUsuario.Visible := True
                  else sbtUsuario.Visible := False;
              end;
              DM.sdsPermissao.Next;
            end;
          end;
        5: // Configurações
          begin
            DM.sdsPermissao.First;
            while not DM.sdsPermissao.Eof do begin
              case DM.sdsPermissaoINDICE.AsInteger of
                14: // CONFIGURAÇÃO
                  if DM.sdsPermissaoSITUACAO.AsString = 'S' then
                    sbtConfigurações.Visible := True
                  else sbtConfigurações.Visible := False;
              end;
              DM.sdsPermissao.Next;
            end;
          end;
        6: // Sair
          begin
            DM.sdsPermissao.First;
            while not DM.sdsPermissao.Eof do begin
              case DM.sdsPermissaoINDICE.AsInteger of
                15: // BACKUP
                  if DM.sdsPermissaoSITUACAO.AsString = 'S' then
                    sbtBackup.Visible := True
                  else sbtBalanco.Visible := False;
              end;
              DM.sdsPermissao.Next;
            end;
          end;
      end;

      DM.sdsPermissao.First;
      while not DM.sdsPermissao.Eof do begin
        case DM.sdsPermissaoINDICE.AsInteger of
          13: // USUÁRIO
            if DM.sdsPermissaoSITUACAO.AsString = 'N' then
              tsUsuarios.TabVisible := False;
          14: // CONFIGURAÇÃO
            if DM.sdsPermissaoSITUACAO.AsString = 'N' then
              tsConfiguracoes.TabVisible := False;
        end;
        DM.sdsPermissao.Next;
      end;

    end;
end;

procedure TfrmPrincipal.pctMenuPrincipalMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    //pctMenuPrincipal.Height := 133;
end;

procedure TfrmPrincipal.sbtAgendaClick(Sender: TObject);
begin
    CriaForm(TfrmAgenda, frmAgenda, False);
end;

procedure TfrmPrincipal.sbtAvisosClick(Sender: TObject);
var Ano, Mes, Dia: Word;
begin
    //pctMenuPrincipal.Height := 24;

    //pctMenuPrincipal.TabIndex := 0;

    DecodeDate(Date, Ano, Mes, Dia);

    with DM.sdsAniversarios do begin
      Close;
      DataSet.CommandText := ' select * from CLI00 '+
                             ' where extract(day from (dt_nascimento)) = '+FloatToStr(Dia)+
                             ' and extract(month from (dt_nascimento)) = '+FloatToStr(Mes);
      Open;
    end;

    with DM.sdsAPagar do begin
      Close;
      DataSet.CommandText := ' select * from des00 a '+
                             ' left join col00 b on a.nu_colaborador = b.indice '+
                             ' where a.DT_VENCIMENTO <= '+QuotedStr(InverteData(DateToStr(Date + 5)))+
                             ' and a.SITUACAO = '+QuotedStr('Pendente');
      Open;
    end;

    with DM.sdsAReceber do begin
      Close;
      DataSet.CommandText := ' select b.nome, a.valor_total, a.dt_atendimento, c.nome from cxa00 a '+
                             ' left join cli00 b on a.nu_cliente = b.indice '+
                             ' left join col00 c on a.nu_colaborador = c.indice '+
                             ' where a.situacao = '+QuotedStr('PENDENTE') +
                             ' and a.transacao = '+QuotedStr('E')+
                             ' and a.dt_atendimento < :pDtAtendimento';
      DataSet.ParamByName('pDtAtendimento').AsDate := Date;
      Open;
    end;

    if (DM.sdsAniversarios.RecordCount > 0) or
       (DM.sdsAReceber.RecordCount > 0) or
       (DM.sdsAPagar.RecordCount > 0) then  begin
      CriaForm(TfrmAviso, frmAviso, False);
    end
    else
      Informacao('Aviso', 'Nenhum aviso foi encontrado.');
end;

procedure TfrmPrincipal.sbtBackupClick(Sender: TObject);
begin
    CriaForm(TfrmBackup, frmBackup, False);
end;

procedure TfrmPrincipal.sbtBalancoClick(Sender: TObject);
begin
    CriaForm(TfrmBalanco, frmBalanco, False);
end;

procedure TfrmPrincipal.sbtCadClienteClick(Sender: TObject);
begin
    CriaForm(TfrmCadCliente, frmCadCliente, False);
end;

procedure TfrmPrincipal.sbtCaixaClick(Sender: TObject);
begin
    CriaForm(TfrmCaixa, frmCaixa, False);
end;

procedure TfrmPrincipal.sbtConfiguraçõesClick(Sender: TObject);
begin
    CriaForm(TfrmConfiguracoes, frmConfiguracoes, false);
end;

procedure TfrmPrincipal.sbtContas2Click(Sender: TObject);
begin
    CriaForm(TfrmContas, frmContas, False);
end;

procedure TfrmPrincipal.sbtDebitosClick(Sender: TObject);
begin
    CriaForm(TfrmDebitos, frmDebitos, False);
end;

procedure TfrmPrincipal.sbtDespesasClick(Sender: TObject);
begin
    CriaForm(TfrmPagamento, frmPagamento, False);
end;

procedure TfrmPrincipal.sbtEmailClick(Sender: TObject);
begin
    CriaForm(TfrmRemetente, frmRemetente, False);
end;

procedure TfrmPrincipal.sbtFechaCaixaClick(Sender: TObject);
begin
    CriaForm(TfrmFechaCaixa, frmFechaCaixa, False);
end;

procedure TfrmPrincipal.sbtFornecedorClick(Sender: TObject);
begin
    CriaForm(TfrmCadFornecedor, frmCadFornecedor, False);
end;

procedure TfrmPrincipal.sbtFuncionarioClick(Sender: TObject);
begin
    CriaForm(TfrmCadFuncionario, frmCadFuncionario, False);
end;

procedure TfrmPrincipal.sbtProcedimentoClick(Sender: TObject);
begin
    CriaForm(TfrmCadProcedimento, frmCadProcedimento, False);
end;

procedure TfrmPrincipal.sbtProdutosClick(Sender: TObject);
begin
    CriaForm(TfrmCadProduto, frmCadProduto, False);
end;

procedure TfrmPrincipal.sbtSairClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmPrincipal.sbtSobreClick(Sender: TObject);
begin
    CriaForm(TfrmSobre, frmSobre, False);
end;

procedure TfrmPrincipal.sbtUsuarioClick(Sender: TObject);
begin
    CriaForm(TfrmCadUsuario, frmCadUsuario, False);
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
    stbBarra.Panels[1].Text := '.::'+FormatDateTime('dddd'', ''dd'' de ''mmmm'' de ''yyyy', Now)+' - '+FormatDateTime('hh:mm:ss', GetTime)+'::.';
end;

end.
