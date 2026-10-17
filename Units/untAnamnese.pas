unit untAnamnese;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Buttons,
  Vcl.Menus, SimpleDS, Data.SqlExpr;

type
  TfrmAnamnese = class(TForm)
    MainMenu1: TMainMenu;
    FecharEsc1: TMenuItem;
    GroupBox1: TGroupBox;
    sbtCadastrar: TSpeedButton;
    sbtCancelar: TSpeedButton;
    edtResposta1: TEdit;
    edtResposta2: TEdit;
    edtResposta3: TEdit;
    edtResposta4: TEdit;
    edtResposta5: TEdit;
    edtResposta6: TEdit;
    edtResposta7: TEdit;
    edtResposta8: TEdit;
    edtResposta9: TEdit;
    edtResposta10: TEdit;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    DBText8: TDBText;
    DBText9: TDBText;
    DBText10: TDBText;
    procedure FormCreate(Sender: TObject);
    procedure FecharEsc1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure sbtCancelarClick(Sender: TObject);
    procedure sbtCancelarMouseLeave(Sender: TObject);
    procedure sbtCancelarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbtCadastrarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbtCadastrarMouseLeave(Sender: TObject);
    procedure sbtCadastrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure InsertUpdateDelete(pTipo : Integer);
  end;

var
  frmAnamnese: TfrmAnamnese;

implementation

{$R *.dfm}

uses untDM, untRotinas;

procedure TfrmAnamnese.FecharEsc1Click(Sender: TObject);
begin
    Close;
end;

procedure TfrmAnamnese.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    gAlterar := False;
end;

procedure TfrmAnamnese.FormCreate(Sender: TObject);
begin
    if DM.sdsAnamnesePERGUNTA1.AsString <> '' then
      edtResposta1.Visible := True;
    if DM.sdsAnamnesePERGUNTA2.AsString <> '' then
      edtResposta2.Visible := True;
    if DM.sdsAnamnesePERGUNTA3.AsString <> '' then
      edtResposta3.Visible := True;
    if DM.sdsAnamnesePERGUNTA4.AsString <> '' then
      edtResposta4.Visible := True;
    if DM.sdsAnamnesePERGUNTA5.AsString <> '' then
      edtResposta5.Visible := True;
    if DM.sdsAnamnesePERGUNTA6.AsString <> '' then
      edtResposta6.Visible := True;
    if DM.sdsAnamnesePERGUNTA7.AsString <> '' then
      edtResposta7.Visible := True;
    if DM.sdsAnamnesePERGUNTA8.AsString <> '' then
      edtResposta8.Visible := True;
    if DM.sdsAnamnesePERGUNTA9.AsString <> '' then
      edtResposta9.Visible := True;
    if DM.sdsAnamnesePERGUNTA10.AsString <> '' then
      edtResposta10.Visible := True;
end;

procedure TfrmAnamnese.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #27 then
      Close;
end;

procedure TfrmAnamnese.FormShow(Sender: TObject);
begin
    gAlterar := False;

    with DM do begin
      try
        TRANSACAO.TransactionID  := NewTransactionID;
        TRANSACAO.IsolationLevel := xilREADCOMMITTED;

        with sdsAnamneseResp do begin
          Close;
          DataSet.CommandText := ' select * from ANA01 where NU_CLIENTE = '+IntToStr(DM.sdsClienteINDICE.AsInteger);
          Open;
          CONEXAO.StartTransaction(TRANSACAO);
          CONEXAO.Commit(TRANSACAO);
        end;
      except
        on Exc:Exception do
          begin
            CONEXAO.Rollback(TRANSACAO);
            Informacao('Atenção!', 'Ocorreu um erro na consulta ao banco de dados: ' + Exc.Message);
            Exit;
          end;
      end;
    end; // fim with DM

    if dm.sdsAnamneseResp.RecordCount > 0 then begin
      gAlterar := True;
      if DM.sdsAnamnesePERGUNTA1.AsString <> '' then begin
        edtResposta1.Visible := True;
        edtResposta1.Text  := DM.sdsAnamneseRespRESPOSTA1.AsString;
      end;
      if DM.sdsAnamnesePERGUNTA2.AsString <> '' then begin
        edtResposta2.Visible := True;
        edtResposta2.Text  := DM.sdsAnamneseRespRESPOSTA2.AsString;
      end;
      if DM.sdsAnamnesePERGUNTA3.AsString <> '' then begin
        edtResposta3.Visible := True;
        edtResposta3.Text  := DM.sdsAnamneseRespRESPOSTA3.AsString;
      end;
      if DM.sdsAnamnesePERGUNTA4.AsString <> '' then begin
        edtResposta4.Visible := True;
        edtResposta4.Text  := DM.sdsAnamneseRespRESPOSTA4.AsString;
      end;
      if DM.sdsAnamnesePERGUNTA5.AsString <> '' then begin
        edtResposta5.Visible := True;
        edtResposta5.Text  := DM.sdsAnamneseRespRESPOSTA5.AsString;
      end;
      if DM.sdsAnamnesePERGUNTA6.AsString <> '' then begin
        edtResposta6.Visible := True;
        edtResposta6.Text  := DM.sdsAnamneseRespRESPOSTA6.AsString;
      end;
      if DM.sdsAnamnesePERGUNTA7.AsString <> '' then begin
        edtResposta7.Visible := True;
        edtResposta7.Text  := DM.sdsAnamneseRespRESPOSTA7.AsString;
      end;
      if DM.sdsAnamnesePERGUNTA8.AsString <> '' then begin
        edtResposta8.Visible := True;
        edtResposta8.Text  := DM.sdsAnamneseRespRESPOSTA8.AsString;
      end;
      if DM.sdsAnamnesePERGUNTA9.AsString <> '' then begin
        edtResposta9.Visible := True;
        edtResposta9.Text  := DM.sdsAnamneseRespRESPOSTA9.AsString;
      end;
      if DM.sdsAnamnesePERGUNTA10.AsString <> '' then begin
        edtResposta10.Visible := True;
        edtResposta10.Text := DM.sdsAnamneseRespRESPOSTA10.AsString;
      end;
    end;
end;

procedure TfrmAnamnese.InsertUpdateDelete(pTipo : Integer);
var vSQL, vMensagem : string;
begin
    case pTipo of
      0: // inserir
        begin
          vSQL := ' insert into ANA01 '+
                  ' (NU_CLIENTE, RESPOSTA1, RESPOSTA2, RESPOSTA3, RESPOSTA4, RESPOSTA5, '+
                  '  RESPOSTA6, RESPOSTA7, RESPOSTA8, RESPOSTA9, RESPOSTA10) '+
                  ' VALUES '+
                  ' (:pNU_CLIENTE, :pRESPOSTA1, :pRESPOSTA2, :pRESPOSTA3, :pRESPOSTA4, :pRESPOSTA5, '+
                  '  :pRESPOSTA6, :pRESPOSTA7, :pRESPOSTA8, :pRESPOSTA9, :pRESPOSTA10)';

          vMensagem := 'incluido';
        end;

      1: // alterar
        begin
          vSQL := ' update ANA01 set '+
                  ' NU_CLIENTE = :pNU_CLIENTE, '+
                  ' RESPOSTA1  = :pRESPOSTA1, '+
                  ' RESPOSTA2  = :pRESPOSTA2, '+
                  ' RESPOSTA3  = :pRESPOSTA3, '+
                  ' RESPOSTA4  = :pRESPOSTA4, '+
                  ' RESPOSTA5  = :pRESPOSTA5, '+
                  ' RESPOSTA6  = :pRESPOSTA6, '+
                  ' RESPOSTA7  = :pRESPOSTA7, '+
                  ' RESPOSTA8  = :pRESPOSTA8, '+
                  ' RESPOSTA9  = :pRESPOSTA9, '+
                  ' RESPOSTA10 = :pRESPOSTA10 ';

          vSQL := vSQL + ' where INDICE = :pINDICE';

          vMensagem := 'alterado';
        end;

      2: //apagar
        begin
          if Confirmacao('Confirmação', 'Deseja, realmente, excluir este registro?') then begin

            vSQL := 'delete from ANA01 '+
                    'where INDICE = :pINDICE';

            vMensagem := 'excluido';

          end
          else Exit;
        end;
    end;

    with DM do begin

      try
        TRANSACAO.TransactionID  := NewTransactionID;
        TRANSACAO.IsolationLevel := xilREADCOMMITTED;

        with sqlAux do begin
          SQL.Clear;
          Close;
          CommandText := vSQL;

          if pTipo in [1,2] then
            ParamByName('pINDICE').AsInteger := DM.sdsAnamneseRespINDICE.AsInteger;

          // se for inserir ou alterar passa os parametros
          if pTipo in [0,1] then begin
            ParamByName('pNU_CLIENTE').AsInteger := DM.sdsClienteINDICE.AsInteger;
            if edtResposta1.Visible then
              ParamByName('pRESPOSTA1').AsString   := Trim(edtResposta1.Text)
            else ParamByName('pRESPOSTA1').AsString := '';
            if edtResposta2.Visible then
              ParamByName('pRESPOSTA2').AsString   := Trim(edtResposta2.Text)
            else ParamByName('pRESPOSTA2').AsString := '';
            if edtResposta3.Visible then
              ParamByName('pRESPOSTA3').AsString   := Trim(edtResposta3.Text)
            else ParamByName('pRESPOSTA3').AsString := '';
            if edtResposta4.Visible then
              ParamByName('pRESPOSTA4').AsString   := Trim(edtResposta4.Text)
            else ParamByName('pRESPOSTA4').AsString := '';
            if edtResposta5.Visible then
              ParamByName('pRESPOSTA5').AsString   := Trim(edtResposta5.Text)
            else ParamByName('pRESPOSTA5').AsString := '';
            if edtResposta6.Visible then
              ParamByName('pRESPOSTA6').AsString   := Trim(edtResposta6.Text)
            else ParamByName('pRESPOSTA6').AsString := '';
            if edtResposta7.Visible then
              ParamByName('pRESPOSTA7').AsString   := Trim(edtResposta7.Text)
            else ParamByName('pRESPOSTA7').AsString := '';
            if edtResposta8.Visible then
              ParamByName('pRESPOSTA8').AsString   := Trim(edtResposta8.Text)
            else ParamByName('pRESPOSTA8').AsString := '';
            if edtResposta9.Visible then
              ParamByName('pRESPOSTA9').AsString   := Trim(edtResposta9.Text)
            else ParamByName('pRESPOSTA9').AsString := '';
            if edtResposta10.Visible then
              ParamByName('pRESPOSTA10').AsString   := Trim(edtResposta10.Text)
            else ParamByName('pRESPOSTA10').AsString := '';
          end;
          CONEXAO.StartTransaction(TRANSACAO);
          ExecSQL;
          CONEXAO.Commit(TRANSACAO);
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

procedure TfrmAnamnese.sbtCadastrarClick(Sender: TObject);
begin
    if Trim(edtResposta1.Text) =  '' then begin
      Informacao('Atenção', 'Por favor, responda a pergunta.');
      edtResposta1.SetFocus;
      Exit;
    end;

    if not gAlterar then begin
      InsertUpdateDelete(0);
      sbtCadastrar.Caption := 'Cadastrar';
    end
    else begin
      InsertUpdateDelete(1);
    end;
end;

procedure TfrmAnamnese.sbtCadastrarMouseLeave(Sender: TObject);
begin
    sbtCadastrar.Caption := '';
end;

procedure TfrmAnamnese.sbtCadastrarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    if gAlterar then
      sbtCadastrar.Caption := 'Alterar'
    else
      sbtCadastrar.Caption := 'Cadastrar';
end;

procedure TfrmAnamnese.sbtCancelarClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmAnamnese.sbtCancelarMouseLeave(Sender: TObject);
begin
    sbtCancelar.Caption := '';
end;

procedure TfrmAnamnese.sbtCancelarMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
    sbtCancelar.Caption := 'Cancelar';
end;

end.
