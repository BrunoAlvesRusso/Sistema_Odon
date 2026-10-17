unit untConProcedimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons, SQLExpr;

type
  TfrmConProcedimento = class(TForm)
    MainMenu1: TMainMenu;
    Fechar1: TMenuItem;
    GroupBox1: TGroupBox;
    cmbPor: TComboBox;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    lblPor: TLabel;
    edtProcDesc: TEdit;
    sbtPesquisar: TSpeedButton;
    sbtCancelar: TSpeedButton;
    sbtAlterar: TSpeedButton;
    sbtExcluir: TSpeedButton;
    procedure Fechar1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure sbtPesquisarClick(Sender: TObject);
    procedure cmbPorChange(Sender: TObject);
    procedure edtProcDescKeyPress(Sender: TObject; var Key: Char);
    procedure sbtCancelarClick(Sender: TObject);
    procedure sbtAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure sbtPesquisarMouseLeave(Sender: TObject);
    procedure sbtCancelarMouseLeave(Sender: TObject);
    procedure sbtAlterarMouseLeave(Sender: TObject);
    procedure sbtExcluirMouseLeave(Sender: TObject);
    procedure sbtExcluirMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbtCancelarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbtAlterarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbtPesquisarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbtExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConProcedimento: TfrmConProcedimento;

implementation

{$R *.dfm}

uses untDM, untRotinas, untCadProcedimento;

procedure TfrmConProcedimento.cmbPorChange(Sender: TObject);
begin
    edtProcDesc.SetFocus;
    lblPor.Caption := cmbPor.Text;
end;

procedure TfrmConProcedimento.DBGrid1DblClick(Sender: TObject);
begin
    sbtAlterar.Click;
end;

procedure TfrmConProcedimento.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
    if key = #13 then
      sbtAlterar.Click;
end;

procedure TfrmConProcedimento.edtProcDescKeyPress(Sender: TObject;
  var Key: Char);
begin
    if key = #13 then
      sbtPesquisar.Click;
end;

procedure TfrmConProcedimento.Fechar1Click(Sender: TObject);
begin
    Close;
end;

procedure TfrmConProcedimento.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #27 then
      Close;
end;

procedure TfrmConProcedimento.FormShow(Sender: TObject);
begin
    gAlterar := False;
    DM.sdsProcedimento.Close;
    edtProcDesc.SetFocus;
end;

procedure TfrmConProcedimento.sbtAlterarClick(Sender: TObject);
begin
    gAlterar := True;
    Close;
end;

procedure TfrmConProcedimento.sbtAlterarMouseLeave(Sender: TObject);
begin
    sbtAlterar.Caption := '';
end;

procedure TfrmConProcedimento.sbtAlterarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    sbtAlterar.Caption := 'Alterar';
end;

procedure TfrmConProcedimento.sbtCancelarClick(Sender: TObject);
begin
    cmbPor.ItemIndex := 0;
    edtProcDesc.Clear;
    DM.sdsProcedimento.Close;
    sbtAlterar.Enabled := False;
    sbtExcluir.Enabled := False;
    lblPor.Caption := 'Procedimento';
    edtProcDesc.SetFocus;
end;

procedure TfrmConProcedimento.sbtCancelarMouseLeave(Sender: TObject);
begin
    sbtCancelar.Caption := '';
end;

procedure TfrmConProcedimento.sbtCancelarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    sbtCancelar.Caption := 'Cancelar';
end;

procedure TfrmConProcedimento.sbtExcluirClick(Sender: TObject);
begin
    frmCadProcedimento.InsertUpdateDelete(2);
    sbtPesquisar.Click;
end;

procedure TfrmConProcedimento.sbtExcluirMouseLeave(Sender: TObject);
begin
    sbtExcluir.Caption := '';
end;

procedure TfrmConProcedimento.sbtExcluirMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    sbtExcluir.Caption := 'Excluir';
end;

procedure TfrmConProcedimento.sbtPesquisarClick(Sender: TObject);
var vSQL : string;
begin
    vSQL := 'select * from PCT00 a ';

    case cmbPor.ItemIndex of
      0: // nome cliente
        begin
          vSQL := vSQL + ' where a.PROCEDIMENTO like '+QuotedStr('%'+trim(edtProcDesc.Text)+'%');
        end;
      1: // cidade
        begin
          vSQL := vSQL + ' where a.DESCRICAO like '+QuotedStr('%'+trim(edtProcDesc.Text)+'%');
        end;
    end;

    with DM do begin
      try
        TRANSACAO.TransactionID  := NewTransactionID;
        TRANSACAO.IsolationLevel := xilREADCOMMITTED;

        with sdsProcedimento do begin
          Close;
          DataSet.CommandText := vSQL;
          Open;
          CONEXAO.StartTransaction(TRANSACAO);
          CONEXAO.Commit(TRANSACAO);
        end; // fim with sqlAux
      except
        on Exc:Exception do
          begin
            CONEXAO.Rollback(TRANSACAO);
            Informacao('Atenção!', 'Ocorreu um erro na consulta ao banco de dados: ' + Exc.Message);
            Exit;
          end;
      end;
    end; // fim with DM

    if DM.sdsProcedimento.RecordCount > 0 then begin
      sbtAlterar.Enabled := True;
      sbtExcluir.Enabled := True;
    end
    else begin
      sbtAlterar.Enabled := False;
      sbtExcluir.Enabled := False;
    end;
end;

procedure TfrmConProcedimento.sbtPesquisarMouseLeave(Sender: TObject);
begin
    sbtPesquisar.Caption := '';
end;

procedure TfrmConProcedimento.sbtPesquisarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    sbtPesquisar.Caption := 'Pesquisar';
end;

end.
