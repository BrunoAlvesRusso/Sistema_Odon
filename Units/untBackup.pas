unit untBackup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IBX.IBServices, Vcl.Buttons,
  Vcl.Samples.Gauges;

type
  TfrmBackup = class(TForm)
    memBackup: TMemo;
    IBBackupService1: TIBBackupService;
    sbtBackup: TSpeedButton;
    lblAviso: TLabel;
    sbtRestaurar: TSpeedButton;
    IBRestoreService1: TIBRestoreService;
    lblRestore: TLabel;
    edtArqRestore: TEdit;
    sbtPesquisar: TSpeedButton;
    opdRestore: TOpenDialog;
    procedure sbtBackupClick(Sender: TObject);
    procedure sbtRestaurarClick(Sender: TObject);
    procedure sbtPesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBackup: TfrmBackup;

implementation

{$R *.dfm}

uses untDM, untRotinas;

procedure TfrmBackup.FormShow(Sender: TObject);
begin
    if Permissao(gLogin, gSenha) then begin
      edtArqRestore.Visible := True;
      lblRestore.Visible    := True;
      sbtPesquisar.Visible  := True;
      sbtRestaurar.Visible  := True;
    end;
end;

procedure TfrmBackup.sbtBackupClick(Sender: TObject);
begin
    lblAviso.Visible := True;

    DM.sdsGerenciador.Close;
    DM.sdsGerenciador.DataSet.CommandText := 'select * from GER00';
    DM.sdsGerenciador.Open;
    try
      with IBBackupService1 do
      begin
        ServerName:= 'localhost';//nome do servidor
        LoginPrompt:=False;
        Params.Add('user_name=SYSDBA');//nome de usuário
        Params.Add('password=masterkey');//senha do usuário
        Active:=True;//ativa o serviço de backup, mais ainda não inicia.
        {a propriedade verbose do TIBBackupService especifica
        se durante o processo de backup será retornado para a
        aplicação o detalhamento da execução}
        Verbose:=True;
        DatabaseName := DM.sdsGerenciadorCAMINHO_BASE.AsString;//caminho da base de dados
        BackupFile.Clear;
        BackupFile.Add(DM.sdsGerenciadorCAMINHO_BACKUP.AsString+'_'+
                       FormatDateTime('ddmmyyyy',Date)+'.fbk');//'_'+
                       //FormatDateTime('hhmm', Time)+'.fbk');//adiciona o caminho do arquivo de backup escolhido pelo usuário

        DM.CONEXAO.Connected := False;//desconecta da base de dados

        Protocol := TCP;//protocolo de conexão

        //Options := [];
        //IgnoreChecksums     = verifica erro de corrupção        (false)
        //IgnoreLimbo         = continua backup mesmo com erro    (false)
        //NogarbageCollection = otimiza o banco                   (true)
        //NonTransportable    = se TRUE envia apenas para windows (true)


        ServiceStart;//inicia o processo de backup

        memBackup.Clear;
        while not Eof do begin
          memBackup.Lines.Add(GetNextLine);
          Application.ProcessMessages;
        end;

        memBackup.Lines.Add('');
        memBackup.Lines.Add('...Backup Terminado...');
        Active := False;//desativa o serviço de backup
        lblAviso.Visible := False;

      end;
      DM.CONEXAO.Connected := True;//conecta o sistema na base de dados
      Afirmacao('Backup', 'Operação realizada com sucesso!');
      Close;
    except
      on E: Exception do
      begin
        memBackup.Lines.Add('Ocorreu algum erro ao efetuar o backup.');
        memBackup.Lines.Add('Informações da exceção:');
        memBackup.Lines.Add('  '+E.Message);
        DM.CONEXAO.Connected:=True;//conecta o sistema na base de dados
        lblAviso.Visible := False;
      end;
    end;
    DM.sdsGerenciador.Close;


end;

procedure TfrmBackup.sbtPesquisarClick(Sender: TObject);
begin
    opdRestore.InitialDir := ExtractFilePath(Application.ExeName);
    if opdRestore.Execute then begin
      edtArqRestore.Text := opdRestore.FileName;
    end;
end;

procedure TfrmBackup.sbtRestaurarClick(Sender: TObject);
var Arquivo, ArqNovo, Aquivo2: String;
begin
    if Trim(edtArqRestore.Text) = '' then begin
      Informacao('Atenção', 'Identifique o caminho onde o backup está armazenado.');
      edtArqRestore.SetFocus;
      Exit;
    end;

    DM.sdsGerenciador.Close;
    DM.sdsGerenciador.DataSet.CommandText := 'select * from GER00';
    DM.sdsGerenciador.Open;

    try
      with IBRestoreService1 do
      begin
        Arquivo:= ExtractFileName(edtArqRestore.Text);
        ArqNovo:= ChangeFileExt(Arquivo,'.fdb');
        Aquivo2:= ExtractFilePath(edtArqRestore.Text) + ArqNovo;
        DatabaseName.Add(Aquivo2); //caminho da base de dados fbk
        ServerName:= 'localhost'; //nome do servidor
        BackupFile.Clear;
        BackupFile.Add(ChangeFileExt(edtArqRestore.Text,'.fbk'));//adiciona o caminho do arquivo de restore escolhido pelo usuário
        Protocol:=TCP;//protocolo de conexão
        Params.Clear;
        LoginPrompt:=False;
        Params.Add('user_name=SYSDBA');//nome de usuário
        Params.Add('password=masterkey');//senha do usuário
        Active:=True;//ativa o serviço de backup, mais ainda não inicia.

        //Options:=[];//limpa a propriedade option
        {o bloco de if abaixo esta adicionando as opções de restauração de acordo com o  que o usuário escolheu. Após esta listagem você encontra um link para um outro artigo onde você encontra mais informações sobre essas e outras opções de restauração}
        //NoValidityCheck = otimiza o banco                   (true)
        //Replace         = se TRUE envia apenas para windows (true)

        {a propriedade verbose do TIBBackupService especifica
        se durante o processo de backup será retornado para a
        aplicação o detalhamento da execução}
        Verbose:=True;
        //DM.CONEXAO.Connected := False;//desconecta da base de dados

        ServiceStart;//inicia o processo de backup
        memBackup.Clear;
        while not Eof do begin
          memBackup.Lines.Add(GetNextLine);
          Application.ProcessMessages;
        end;

        memBackup.Lines.Add('');
        memBackup.Lines.Add('...Restauração Terminada...');

        Active:=False;//desativa o serviço de backup
        //DM.CONEXAO.Connected := True;//conecta o sistema na base de dados
        Application.ProcessMessages;
      end;
    except
      on E: Exception do
      begin
        memBackup.Lines.Add('');
        memBackup.Lines.Add('Ocorreu um erro inesperado. A restauração não foi concluída.');
        memBackup.Lines.Add('Informações da exceção:');
        memBackup.Lines.Add('  '+E.Message);
        //DM.CONEXAO.Connected:=True;//conecta o sistema na base de dados
      end;
    end;
end;

end.
