unit untCadProcedimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.Buttons, SQLExpr;

type
  TfrmCadProcedimento = class(TForm)
    MainMenu1: TMainMenu;
    FecharEsc1: TMenuItem;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edtProcedimento: TEdit;
    edtDescricao: TEdit;
    sbtCancelar: TSpeedButton;
    sbtCadastrar: TSpeedButton;
    Consultar1: TMenuItem;
    procedure sbtCancelarMouseLeave(Sender: TObject);
    procedure sbtCancelarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbtCadastrarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbtCadastrarMouseLeave(Sender: TObject);
    procedure sbtCancelarClick(Sender: TObject);
    procedure sbtCadastrarClick(Sender: TObject);
    procedure FecharEsc1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Consultar1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure InsertUpdateDelete(pTipo : Integer);
  end;

var
  frmCadProcedimento: TfrmCadProcedimento;

implementation

{$R *.dfm}

uses untRotinas, untDM, untConProcedimento;

procedure TfrmCadProcedimento.Consultar1Click(Sender: TObject);
begin
    frmConProcedimento := TfrmConProcedimento.Create(Application);
    frmConProcedimento.ShowModal;

    if gAlterar then begin
      edtProcedimento.Text := DM.sdsProcedimentoPROCEDIMENTO.AsString;
      edtDescricao.Text    := DM.sdsProcedimentoDESCRICAO.AsString;
      sbtCadastrar.Caption := 'Alterar';
    end;

    frmConProcedimento.Free;
    frmConProcedimento := nil;
end;

procedure TfrmCadProcedimento.FecharEsc1Click(Sender: TObject);
begin
    Close;
end;

procedure TfrmCadProcedimento.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #27 then
      Close;
end;

procedure TfrmCadProcedimento.FormShow(Sender: TObject);
begin
    gAlterar := False;
end;

procedure TfrmCadProcedimento.InsertUpdateDelete(pTipo: Integer);
var vSQL, vMensagem  : string;
begin
    case pTipo of
      0: // inserir
        begin
          vSQL := 'insert into PCT00 '+
                  '(PROCEDIMENTO, DESCRICAO) '+
                  'VALUES '+
                  '(:pPROCEDIMENTO, :pDESCRICAO)';

          vMensagem := 'incluido';
        end;

      1: // alterar
        begin
          vSQL := 'update PCT00 set '+
                  'PROCEDIMENTO  = :pPROCEDIMENTO, '+
                  'DESCRICAO     = :pDESCRICAO '+
                  'where INDICE  = :pINDICE';

          vMensagem := 'alterado';
        end;

      2: //apagar
        begin
          if Confirmacao('Confirmação', 'Deseja, realmente, excluir este registro?') then begin

            vSQL := 'delete from PCT00 '+
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
              ParamByName('pINDICE').AsInteger := DM.sdsProcedimentoINDICE.AsInteger;

          // se for inserir ou alterar passa os parametros
          if pTipo in [0,1] then begin
            ParamByName('pPROCEDIMENTO').AsString := edtProcedimento.Text;
            ParamByName('pDESCRICAO').AsString    := edtDescricao.Text;

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

procedure TfrmCadProcedimento.sbtCadastrarClick(Sender: TObject);
begin
    if not gAlterar then begin
      InsertUpdateDelete(0);
      sbtCadastrar.Caption := 'Cadastrar';
    end
    else begin
      InsertUpdateDelete(1);
      gAlterar := False;
      DM.sdsProcedimento.Close;
    end;
    edtProcedimento.SetFocus;

    edtProcedimento.Clear;
    edtDescricao.Clear;
    gAlterar := False;
    edtProcedimento.SetFocus;
end;

procedure TfrmCadProcedimento.sbtCadastrarMouseLeave(Sender: TObject);
begin
    sbtCadastrar.Caption := '';
end;

procedure TfrmCadProcedimento.sbtCadastrarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    if gAlterar then
      sbtCadastrar.Caption := 'Alterar'
    else
      sbtCadastrar.Caption := 'Cadastrar';
end;

procedure TfrmCadProcedimento.sbtCancelarClick(Sender: TObject);
begin
    edtProcedimento.Clear;
    edtDescricao.Clear;
    gAlterar := False;
    edtProcedimento.SetFocus;
end;

procedure TfrmCadProcedimento.sbtCancelarMouseLeave(Sender: TObject);
begin
    sbtCancelar.Caption := '';
end;

procedure TfrmCadProcedimento.sbtCancelarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    sbtCancelar.Caption := 'Cancelar';
end;

end.
