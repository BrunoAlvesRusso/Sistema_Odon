program Sistema;

{$IF CompilerVersion >= 21.0}
{$WEAKLINKRTTI ON}
{$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])}
{$IFEND}

uses
  Vcl.Forms,
  SysUtils,
  Vcl.Themes,
  Vcl.Styles,
  untPrincipal in '..\Units\untPrincipal.pas' {frmPrincipal},
  untCadCliente in '..\Units\untCadCliente.pas' {frmCadCliente},
  untCadFornecedor in '..\Units\untCadFornecedor.pas' {frmCadFornecedor},
  untApresentacao in '..\Units\untApresentacao.pas' {frmApresentacao},
  untCadFuncionario in '..\Units\untCadFuncionario.pas' {frmCadFuncionario},
  untConCliente in '..\Units\untConCliente.pas' {frmConCliente},
  untRotinas in '..\Units\untRotinas.pas',
  untDM in '..\Units\untDM.pas' {DM: TDataModule},
  untConFornecedor in '..\Units\untConFornecedor.pas' {frmConFornecedor},
  untConFuncionario in '..\Units\untConFuncionario.pas' {frmConFuncionario},
  untCadProduto in '..\Units\untCadProduto.pas' {frmCadProduto},
  untConProduto in '..\Units\untConProduto.pas' {frmConProduto},
  untCadVenda in '..\Units\untCadVenda.pas' {frmCadVenda},
  untAgenda in '..\Units\untAgenda.pas' {frmAgenda},
  untCadAgenda in '..\Units\untCadAgenda.pas' {frmCadAgenda},
  untConfiguracoes in '..\Units\untConfiguracoes.pas' {frmConfiguracoes},
  untEncaixe in '..\Units\untEncaixe.pas' {frmEncaixe},
  untAviso in '..\Units\untAviso.pas' {frmAviso},
  untDebitos in '..\Units\untDebitos.pas' {frmDebitos},
  untContas in '..\Units\untContas.pas' {frmContas},
  untPagamento in '..\Units\untPagamento.pas' {frmPagamento},
  untConPagamento in '..\Units\untConPagamento.pas' {frmConPagamento},
  untBalanco in '..\Units\untBalanco.pas' {frmBalanco},
  untLogin in '..\Units\untLogin.pas' {frmLogin},
  untCadUsuario in '..\Units\untCadUsuario.pas' {frmCadUsuario},
  untConUsuario in '..\Units\untConUsuario.pas' {frmConsultaUsuario},
  untFaceBook in '..\Units\untFaceBook.pas',
  untAlbuns in '..\Units\untAlbuns.pas',
  untFoto in '..\Units\untFoto.pas',
  untFechaCaixa in '..\Units\untFechaCaixa.pas' {frmFechaCaixa},
  untDMReport in '..\Units\untDMReport.pas' {DMReport},
  untRemetente in '..\Units\untRemetente.pas' {frmRemetente},
  untRemetenteCliente in '..\Units\untRemetenteCliente.pas' {frmRemetenteCliente},
  untHistorico in '..\Units\untHistorico.pas' {frmHistorico},
  untHistoricoEvolucao in '..\Units\untHistoricoEvolucao.pas' {frmHistoricoEvolucao},
  untOdontograma in '..\Units\untOdontograma.pas' {frmOdontograma},
  untCadProcedimento in '..\Units\untCadProcedimento.pas' {frmCadProcedimento},
  untConProcedimento in '..\Units\untConProcedimento.pas' {frmConProcedimento},
  untBackup in '..\Units\untBackup.pas' {frmBackup},
  untCadAnamnese in '..\Units\untCadAnamnese.pas' {frmCadAnamnese},
  untAnamnese in '..\Units\untAnamnese.pas' {frmAnamnese},
  Windows,
  untImagemHistorico in '..\Units\untImagemHistorico.pas' {frmImagemHistorico},
  untCaixa in '..\Units\untCaixa.pas' {frmCaixa},
  untChave in '..\Units\untChave.pas' {frmChave},
  untSobre in '..\Units\untSobre.pas' {frmSobre};

var Hwnd:THandle;

{$R *.res}

begin
    Application.Initialize;

      Application.Title := 'ODON - Sistema de Gerenciamento para Clínicas Odontológicas';
      Application.MainFormOnTaskbar := True;
      Application.CreateForm(TDM, DM);
  frmApresentacao := TfrmApresentacao.Create(Application);
      frmApresentacao.Show;
      frmApresentacao.animacao;
      frmApresentacao.Free;
      frmApresentacao := nil;

      frmLogin := TfrmLogin.Create(Application);
      frmLogin.ShowModal;
      frmLogin.Free;
      frmLogin := nil;

      Application.CreateForm(TfrmPrincipal, frmPrincipal);

    Application.Run;
end.
