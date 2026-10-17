unit untLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage, SimpleDS, SQLExpr;

type
  TfrmLogin = class(TForm)
    imgLoginSenha: TImage;
    imgEntrar: TImage;
    imgCancelar: TImage;
    edtSenha: TEdit;
    imgSenha: TImage;
    edtLogin: TEdit;
    imgLogin: TImage;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure imgEntrarClick(Sender: TObject);
    procedure imgCancelarClick(Sender: TObject);
    procedure edtLoginKeyPress(Sender: TObject; var Key: Char);
    procedure edtSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses untRotinas, untPrincipal, untDM, untChave;

procedure TfrmLogin.edtLoginKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #13 then
      edtSenha.SetFocus;
end;

procedure TfrmLogin.edtSenhaKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #13 then
      imgEntrarClick(Sender);
end;

procedure TfrmLogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #27 then
      Application.Terminate;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin

    try
      DM.TRANSACAO.TransactionID  := DM.NewTransactionID;
      DM.TRANSACAO.IsolationLevel := xilREADCOMMITTED;

      DM.sdsGerenciador.Close;
      DM.sdsGerenciador.DataSet.CommandText := ' select * from GER00 ';

      DM.CONEXAO.StartTransaction(DM.TRANSACAO);
      DM.sdsGerenciador.Open;
      DM.CONEXAO.Commit(DM.TRANSACAO);

    except
      on Exc:Exception do
        begin
          DM.CONEXAO.Rollback(DM.TRANSACAO);
          Informacao('Atenção!', 'Ocorreu um erro na consulta ao banco de dados: ' + Exc.Message);
          Exit;
        end;
    end;

    if DateToStr(DM.sdsGerenciadorDT_IMPLANTACAO.AsDateTime) <> '30/12/1899' then begin

        if (Date - DM.sdsGerenciadorDT_RENOVACAO.AsDateTime >= DM.sdsGerenciadorPERIODO_ATIVO.AsInteger) or
           (DM.sdsGerenciadorSISTEMA_ATIVO.AsString = 'N') then begin

          with DM do begin
            try
              TRANSACAO.TransactionID  := NewTransactionID;
              TRANSACAO.IsolationLevel := xilREADCOMMITTED;
              with sqlAux do begin
                SQL.Clear;
                CommandText := ' update GER00 set '+
                               ' SISTEMA_ATIVO = :pSISTEMA_ATIVO '+
                               ' where INDICE  = :pINDICE';
                ParamByName('pINDICE').AsInteger := DM.sdsGerenciadorINDICE.AsInteger;
                ParamByName('pSISTEMA_ATIVO').AsString := 'N';
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

          Informacao('Atenção', 'Sua licença para utilização do sistema expirou.' +#13+
                                'Entre em contato com a empresa responsável.'+#13+
                                'contato@odon.com.br');//+#13+
                                //'Controle: '+DM.sdsGerenciadorCHAVE.AsString);

          if Confirmacao('Chave', 'Inserir chave de ativação?') then
            CriaForm(TfrmChave, frmChave, False)
          else
            Application.Terminate;
        end;
    end;

end;

procedure TfrmLogin.imgCancelarClick(Sender: TObject);
begin
    Application.Terminate;
end;

procedure TfrmLogin.imgEntrarClick(Sender: TObject);
var senha : string;
begin
    gLogin := edtLogin.Text;
    gSenha := edtSenha.Text; //Criptografa(edtSenha.Text, 108);

    if not LoginSenha(gLogin, gSenha) then begin
      edtLogin.SetFocus;
      Exit;
    end
    else Close;
end;

end.
