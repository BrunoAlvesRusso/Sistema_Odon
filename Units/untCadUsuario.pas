unit untCadUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Buttons, SqlExpr;

type
  TfrmCadUsuario = class(TForm)
    MainMenu1: TMainMenu;
    ConsultarF21: TMenuItem;
    FecharEsc1: TMenuItem;
    Panel1: TPanel;
    gbxCadastro: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtNome: TEdit;
    edtLogin: TEdit;
    edtSenha: TEdit;
    edtConfirmar: TEdit;
    Label5: TLabel;
    cbxPermissão: TComboBox;
    sbtCancelar: TSpeedButton;
    sbtCadastrar: TSpeedButton;
    procedure FecharEsc1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure sbtCancelarMouseLeave(Sender: TObject);
    procedure sbtCancelarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbtCadastrarMouseLeave(Sender: TObject);
    procedure sbtCadastrarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbtCadastrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbtCancelarClick(Sender: TObject);
    procedure ConsultarF21Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure InsertUpdateDelete(pTipo : Integer);
    procedure LimpaCampos;
  end;

var
  frmCadUsuario: TfrmCadUsuario;

implementation

{$R *.dfm}

uses untRotinas, untDM, untConUsuario;

procedure TfrmCadUsuario.ConsultarF21Click(Sender: TObject);
begin
    frmConsultaUsuario := TfrmConsultaUsuario.Create(Application);
    frmConsultaUsuario.ShowModal;

    if gAlterar then begin
      edtNome.Text           := DM.sdsLoginNOME.AsString;
      edtLogin.Text          := DM.sdsLoginLOGIN.AsString;
      cbxPermissão.ItemIndex := cbxPermissão.Items.IndexOf(Trim(DM.sdsLoginPERMISSAO.AsString));
      sbtCadastrar.Caption := 'Alterar';
    end;

    frmConsultaUsuario.Free;
    frmConsultaUsuario := nil;
end;

procedure TfrmCadUsuario.FecharEsc1Click(Sender: TObject);
begin
    Close;
end;

procedure TfrmCadUsuario.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #27 then
      Close;
end;

procedure TfrmCadUsuario.FormShow(Sender: TObject);
begin
    gAlterar := False;
end;

procedure TfrmCadUsuario.InsertUpdateDelete(pTipo : Integer);
var vSQL, vMensagem  : string;
begin
    case pTipo of
      0: // inserir
        begin
          vSQL := 'insert into USU00 '+
                  '(NOME, LOGIN, SENHA, PERMISSAO) '+
                  'VALUES '+
                  '(:pNOME, :pLOGIN, :pSENHA, :pPERMISSAO)';

          vMensagem := 'incluido';
        end;

      1: // alterar
        begin
          vSQL := 'update USU00 set '+
                  'NOME          = :pNOME, '+
                  'LOGIN         = :pLOGIN, '+
                  'SENHA         = :pSENHA, '+
                  'PERMISSAO     = :pPERMISSAO '+
                  'where INDICE  = :pINDICE';

          vMensagem := 'alterado';
        end;

      2: //apagar
        begin
          if Confirmacao('Confirmação', 'Deseja, realmente, excluir este registro?') then begin

            vSQL := 'delete from USU00 '+
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
              ParamByName('pINDICE').AsInteger := DM.sdsLoginINDICE.AsInteger;

          // se for inserir ou alterar passa os parametros
          if pTipo in [0,1] then begin

            ParamByName('pNOME').AsString       := edtNome.Text;
            ParamByName('pLOGIN').AsString      := edtLogin.Text;
            ParamByName('pSENHA').AsString      := edtSenha.Text;//Criptografa(edtSenha.Text, 108);
            ParamByName('pPERMISSAO').AsInteger := cbxPermissão.ItemIndex;

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

procedure TfrmCadUsuario.LimpaCampos;
begin
    edtNome.Clear;
    edtLogin.Clear;
    edtSenha.Clear;
    edtConfirmar.Clear;
    cbxPermissão.ItemIndex := 1;
    gAlterar := False;
end;

procedure TfrmCadUsuario.sbtCadastrarClick(Sender: TObject);
begin
    if Trim(edtNome.Text) = '' then begin
      Informacao('Atenção', 'Campo obrigatório em branco.');
      edtNome.SetFocus;
      Exit;
    end;

    if edtLogin.Text = '' then begin
      Informacao('Atenção', 'Campo obrigatório em branco.');
      edtLogin.SetFocus;
      Exit;
    end;

    if edtSenha.Text = '' then begin
      Informacao('Atenção', 'Campo obrigatório em branco.');
      edtSenha.SetFocus;
      Exit;
    end;

    if edtConfirmar.Text = '' then begin
      Informacao('Atenção', 'Campo obrigatório em branco.');
      edtConfirmar.SetFocus;
      Exit;
    end;

    if edtSenha.Text <> edtConfirmar.Text then begin
      Informacao('Atenção', 'Senha não corresponde a confirmação de senha. Verifique.');
      edtConfirmar.SetFocus;
      Exit;
    end;

    if not gAlterar then begin
      InsertUpdateDelete(0);
      sbtCadastrar.Caption := 'Cadastrar';
    end
    else begin
      InsertUpdateDelete(1);
      gAlterar := False;
      DM.sdsLogin.Close;
    end;

    edtNome.SetFocus;
    LimpaCampos;
end;

procedure TfrmCadUsuario.sbtCadastrarMouseLeave(Sender: TObject);
begin
    sbtCadastrar.Caption := '';
end;

procedure TfrmCadUsuario.sbtCadastrarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    if gAlterar then
      sbtCadastrar.Caption := 'Alterar'
    else
      sbtCadastrar.Caption := 'Cadastrar';
end;

procedure TfrmCadUsuario.sbtCancelarClick(Sender: TObject);
begin
    LimpaCampos;
end;

procedure TfrmCadUsuario.sbtCancelarMouseLeave(Sender: TObject);
begin
    sbtCancelar.Caption := '';
end;

procedure TfrmCadUsuario.sbtCancelarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    sbtCancelar.Caption := 'Cancelar';
end;

end.
