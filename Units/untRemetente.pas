unit untRemetente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.Buttons, Vcl.StdCtrls;

type
  TfrmRemetente = class(TForm)
    MainMenu1: TMainMenu;
    FecharEsc1: TMenuItem;
    ckbTodos: TCheckBox;
    gbxRemetente: TGroupBox;
    memRemetente: TMemo;
    Label9: TLabel;
    sbtPesquisar: TSpeedButton;
    sbtCadEmail: TSpeedButton;
    memMensagem: TMemo;
    Label1: TLabel;
    edtAssunto: TEdit;
    Label2: TLabel;
    sbtAnexo: TSpeedButton;
    memAnexo: TMemo;
    opgAnexo: TOpenDialog;
    Label3: TLabel;
    procedure FecharEsc1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure sbtPesquisarClick(Sender: TObject);
    procedure ckbTodosClick(Sender: TObject);
    procedure sbtCadEmailClick(Sender: TObject);
    procedure sbtAnexoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    gAnexo : string;
  end;

var
  frmRemetente: TfrmRemetente;

implementation

{$R *.dfm}

uses untDM, untRotinas, untRemetenteCliente;

procedure TfrmRemetente.ckbTodosClick(Sender: TObject);
begin
    if ckbTodos.Checked then begin
      sbtPesquisar.Enabled := False;
      memRemetente.Clear;
      memRemetente.Enabled := False;
      edtAssunto.Clear;
      edtAssunto.Enabled := False;
      memMensagem.Clear;
      memMensagem.Enabled := False;
    end
    else begin
      sbtPesquisar.Enabled := True;
      memRemetente.Enabled := True;
      edtAssunto.Enabled   := True;
      memMensagem.Enabled  := True;
    end;
end;

procedure TfrmRemetente.FecharEsc1Click(Sender: TObject);
begin
    Close;
end;

procedure TfrmRemetente.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #27 then
      Close;
end;

procedure TfrmRemetente.FormShow(Sender: TObject);
begin
    gAnexo := '';
end;

procedure TfrmRemetente.sbtCadEmailClick(Sender: TObject);
var Destinatario, Assunto, Mensagem, Senha : string;
begin
    Destinatario := '';
    DM.sdsEmail.Close;
    DM.sdsEmail.DataSet.CommandText := 'select * from EMA00';
    DM.sdsEmail.Open;

    if ckbTodos.Checked then begin
      DM.sdsCliente.Close;
      DM.sdsCliente.DataSet.CommandText := 'select * from CLI00 where EMAIL <> '+QuotedStr('');
      DM.sdsCliente.Open;

      if DM.sdsCliente.RecordCount > 0 then begin
        DM.sdsCliente.First;
        while not DM.sdsCliente.Eof do begin
          if Destinatario = '' then
            Destinatario :=  DM.sdsClienteEMAIL.AsString
          else Destinatario :=  Destinatario +'; '+ DM.sdsClienteEMAIL.AsString;
          DM.sdsCliente.Next;
        end;
        Assunto  := DM.sdsEmailASSUNTO.AsString;
        Mensagem := DM.sdsEmailMENSAGEM.AsString;
      end;
    end
    else begin
      Destinatario := memRemetente.Text;
      Assunto      := edtAssunto.Text;
      Mensagem     := memMensagem.Text;
    end;

    Senha := DM.sdsEmailSENHA.AsString;

    if Trim(memAnexo.Text) = '' then
      gAnexo := '';

    //Chamando a Função EnviarEmail
    EnviarEmail(DM.sdsEmailSMTP.AsString,     // host
                DM.sdsEmailPORTA.AsInteger,   // porta (25 é padrão)
                DM.sdsEmailLOGIN.AsString,    // e-mail do remetente
                Senha,                        // senha do remetente
                Destinatario,                 // e-mail(s) do(s) destinatario(s) (se superior a 1 usar ";", sem as aspas, entre eles)
                Assunto,                      // assunto
                Mensagem,                     // mensagem
                gAnexo,                       // anexo(s)
                True,                         // padrão
                True                          // padrão
                );

    DM.sdsCliente.Close;
    DM.sdsEmail.Close;

    //Informacao('Enviado', 'E-mails enviados com sucesso.');
    Close;
end;

procedure TfrmRemetente.sbtAnexoClick(Sender: TObject);
var i    : Integer;
    vAux : string;
begin
    if opgAnexo.Execute then begin

      //if gAnexo = '' then
        gAnexo := opgAnexo.FileName;
      //else gAnexo := gAnexo + '; ' + opgAnexo.FileName;
      i := Length(gAnexo);
      while gAnexo[i] <> '\' do begin
        vAux := Copy(gAnexo, i, i);
        Dec(i);
      end;

      memAnexo.Text := vAux;

    end;
end;

procedure TfrmRemetente.sbtPesquisarClick(Sender: TObject);
begin
    frmRemetenteCliente := TfrmRemetenteCliente.Create(Application);
    frmRemetenteCliente.ShowModal;

    if Trim(memRemetente.Text) = '' then
      memRemetente.Text := frmRemetenteCliente.Destinatario
    else memRemetente.Text := memRemetente.Text + '; '+ frmRemetenteCliente.Destinatario;

    frmRemetenteCliente.Free;
    frmRemetenteCliente := nil;
end;

end.
