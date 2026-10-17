unit untCadAnamnese;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.Buttons, Data.SqlExpr;

type
  TfrmCadAnamnese = class(TForm)
    MainMenu1: TMainMenu;
    FecharEsc1: TMenuItem;
    GroupBox1: TGroupBox;
    edtPergunta1: TEdit;
    Label1: TLabel;
    edtPergunta2: TEdit;
    Label2: TLabel;
    edtPergunta3: TEdit;
    Label3: TLabel;
    edtPergunta4: TEdit;
    Label4: TLabel;
    edtPergunta5: TEdit;
    Label5: TLabel;
    edtPergunta6: TEdit;
    Label6: TLabel;
    edtPergunta7: TEdit;
    Label7: TLabel;
    edtPergunta8: TEdit;
    Label8: TLabel;
    edtPergunta9: TEdit;
    Label9: TLabel;
    edtPergunta10: TEdit;
    Label10: TLabel;
    sbtCadastrar: TSpeedButton;
    sbtCancelar: TSpeedButton;
    procedure FecharEsc1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure sbtCancelarMouseLeave(Sender: TObject);
    procedure sbtCancelarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbtCadastrarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbtCadastrarMouseLeave(Sender: TObject);
    procedure sbtCadastrarClick(Sender: TObject);
    procedure sbtCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadAnamnese: TfrmCadAnamnese;

implementation

{$R *.dfm}

uses untPrincipal, untRotinas, untDM;

procedure TfrmCadAnamnese.FecharEsc1Click(Sender: TObject);
begin
    Close;
end;

procedure TfrmCadAnamnese.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #27 then
      Close;
end;

procedure TfrmCadAnamnese.FormShow(Sender: TObject);
begin
    DM.sdsAnamnese.Close;
    DM.sdsAnamnese.Open;
    edtPergunta1.Text  := DM.sdsAnamnesePERGUNTA1.AsString;
    edtPergunta2.Text  := DM.sdsAnamnesePERGUNTA2.AsString;
    edtPergunta3.Text  := DM.sdsAnamnesePERGUNTA3.AsString;
    edtPergunta4.Text  := DM.sdsAnamnesePERGUNTA4.AsString;
    edtPergunta5.Text  := DM.sdsAnamnesePERGUNTA5.AsString;
    edtPergunta6.Text  := DM.sdsAnamnesePERGUNTA6.AsString;
    edtPergunta7.Text  := DM.sdsAnamnesePERGUNTA7.AsString;
    edtPergunta8.Text  := DM.sdsAnamnesePERGUNTA8.AsString;
    edtPergunta9.Text  := DM.sdsAnamnesePERGUNTA9.AsString;
    edtPergunta10.Text := DM.sdsAnamnesePERGUNTA10.AsString;
end;

procedure TfrmCadAnamnese.sbtCadastrarClick(Sender: TObject);
begin
    try
      DM.TRANSACAO.TransactionID  := DM.NewTransactionID;
      DM.TRANSACAO.IsolationLevel := xilREADCOMMITTED;
      DM.sqlAux.SQL.Clear;
      if DM.sdsAnamnese.RecordCount = 0 then
      begin
        DM.sqlAux.CommandText := ' insert into ANA00 ('+
                                 ' PERGUNTA1, PERGUNTA2, PERGUNTA3, PERGUNTA4, PERGUNTA5, '+
                                 ' PERGUNTA6, PERGUNTA7, PERGUNTA8, PERGUNTA9, PERGUNTA10) '+
                                 ' values ('+
                                 QuotedStr(edtPergunta1.Text)+', '+
                                 QuotedStr(edtPergunta2.Text)+', '+
                                 QuotedStr(edtPergunta3.Text)+', '+
                                 QuotedStr(edtPergunta4.Text)+', '+
                                 QuotedStr(edtPergunta5.Text)+', '+
                                 QuotedStr(edtPergunta6.Text)+', '+
                                 QuotedStr(edtPergunta7.Text)+', '+
                                 QuotedStr(edtPergunta8.Text)+', '+
                                 QuotedStr(edtPergunta9.Text)+', '+
                                 QuotedStr(edtPergunta10.Text)+')';
      end
      else
      begin
        DM.sqlAux.CommandText := ' update ANA00 set '+
                                 ' PERGUNTA1  = '+QuotedStr(edtPergunta1.Text)+', '+
                                 ' PERGUNTA2  = '+QuotedStr(edtPergunta2.Text)+', '+
                                 ' PERGUNTA3  = '+QuotedStr(edtPergunta3.Text)+', '+
                                 ' PERGUNTA4  = '+QuotedStr(edtPergunta4.Text)+', '+
                                 ' PERGUNTA5  = '+QuotedStr(edtPergunta5.Text)+', '+
                                 ' PERGUNTA6  = '+QuotedStr(edtPergunta6.Text)+', '+
                                 ' PERGUNTA7  = '+QuotedStr(edtPergunta7.Text)+', '+
                                 ' PERGUNTA8  = '+QuotedStr(edtPergunta8.Text)+', '+
                                 ' PERGUNTA9  = '+QuotedStr(edtPergunta9.Text)+', '+
                                 ' PERGUNTA10 = '+QuotedStr(edtPergunta10.Text);
      end;
      DM.CONEXAO.StartTransaction(DM.TRANSACAO);
      DM.sqlAux.ExecSQL;
      DM.CONEXAO.Commit(DM.TRANSACAO);
      Afirmacao('Confirmação', 'Registro alterado com sucesso!');
      Close;
    except
      on Exc:Exception do
        begin
          DM.CONEXAO.Rollback(DM.TRANSACAO);
          Informacao('Atenção!', 'Erro na comunicação com o banco: ' + Exc.Message);
          Exit;
        end;
    end;
end;

procedure TfrmCadAnamnese.sbtCadastrarMouseLeave(Sender: TObject);
begin
    sbtCadastrar.Caption := '';
end;

procedure TfrmCadAnamnese.sbtCadastrarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    sbtCadastrar.Caption := 'Alterar';
end;

procedure TfrmCadAnamnese.sbtCancelarClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmCadAnamnese.sbtCancelarMouseLeave(Sender: TObject);
begin
    sbtCancelar.Caption := '';
end;

procedure TfrmCadAnamnese.sbtCancelarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    sbtCancelar.Caption := 'Cancelar';
end;

end.
