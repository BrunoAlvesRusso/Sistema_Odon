unit untConCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Mask, Vcl.Buttons, Data.SQLExpr, {RpDefine,
  RpCon, RpConDS,} frxClass, frxDBSet, SimpleDS;

type
  TfrmConCliente = class(TForm)
    MainMenu1: TMainMenu;
    Fechar1: TMenuItem;
    gbxPesquisar: TGroupBox;
    dbgCliente: TDBGrid;
    gbxPeriodo: TGroupBox;
    dtpDe: TDateTimePicker;
    dtpAte: TDateTimePicker;
    lblDe: TLabel;
    lblAte: TLabel;
    lblPor: TLabel;
    cbxFiltro: TComboBox;
    edtNome: TEdit;
    mskCPF: TMaskEdit;
    cbxSituação: TComboBox;
    sbtAlterar: TSpeedButton;
    sbtCancelar: TSpeedButton;
    sbtPesquisar: TSpeedButton;
    sbtExcluir: TSpeedButton;
    ckbPeriodo: TCheckBox;
    lblSituacao: TLabel;
    stbBarra: TStatusBar;
    sbtNovo: TSpeedButton;
    Imprimir1: TMenuItem;
    procedure Fechar1Click(Sender: TObject);
    procedure cbxFiltroChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbtCancelarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ckbPeriodoClick(Sender: TObject);
    procedure sbtPesquisarClick(Sender: TObject);
    procedure sbtPesquisarMouseLeave(Sender: TObject);
    procedure sbtPesquisarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbtExcluirMouseLeave(Sender: TObject);
    procedure sbtExcluirMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbtCancelarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbtCancelarMouseLeave(Sender: TObject);
    procedure sbtAlterarMouseLeave(Sender: TObject);
    procedure sbtAlterarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbtAlterarClick(Sender: TObject);
    procedure sbtExcluirClick(Sender: TObject);
    procedure sbtNovoClick(Sender: TObject);
    procedure sbtNovoMouseLeave(Sender: TObject);
    procedure sbtNovoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure dbgClienteDblClick(Sender: TObject);
    procedure dbgClienteKeyPress(Sender: TObject; var Key: Char);
    procedure dbgClienteTitleClick(Column: TColumn);
    procedure Imprimir1Click(Sender: TObject);
    procedure edtNomeKeyPress(Sender: TObject; var Key: Char);
    procedure mskCPFKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure LimpaCampos;
    procedure ZeraPeriodo;
  public
    { Public declarations }
  end;

var
  frmConCliente: TfrmConCliente;

implementation

{$R *.dfm}

uses untDM, untRotinas, untCadCliente, untAgenda, untDMReport, untPrincipal;

procedure TfrmConCliente.cbxFiltroChange(Sender: TObject);
begin
    case cbxFiltro.ItemIndex of
      0, 1: // nome cliente, cidade
        begin
          mskCPF.Visible  := False;
          edtNome.Visible := True;
          edtNome.Clear;
          edtNome.SetFocus;
        end;
      2: // cpf
        begin
          mskCPF.Visible  := True;
          edtNome.Visible := False;
          mskCPF.Clear;
          mskCPF.SetFocus;
        end;
    end;
    DM.sdsCliente.Close;
end;

procedure TfrmConCliente.ckbPeriodoClick(Sender: TObject);
begin
    if ckbPeriodo.Checked then
      gbxPeriodo.Enabled := True
    else begin
      ZeraPeriodo;
      gbxPeriodo.Enabled := False;
    end;
end;

procedure TfrmConCliente.dbgClienteDblClick(Sender: TObject);
begin
    sbtAlterar.Click;
end;

procedure TfrmConCliente.dbgClienteKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #13 then
      sbtAlterar.Click;
end;

procedure TfrmConCliente.dbgClienteTitleClick(Column: TColumn);
begin
    DM.sdsCliente.IndexFieldNames := Column.FieldName;
end;

procedure TfrmConCliente.edtNomeKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #13 then
      sbtPesquisar.Click;
end;

procedure TfrmConCliente.Fechar1Click(Sender: TObject);
begin
    Close;
end;

procedure TfrmConCliente.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #27 then
      Close;
end;

procedure TfrmConCliente.FormShow(Sender: TObject);
begin
    LimpaCampos;
    cbxFiltro.ItemIndex := 0;
    ZeraPeriodo;
    if gAgenda then
      sbtNovo.Visible := True;
end;

procedure TfrmConCliente.Imprimir1Click(Sender: TObject);
begin
    if (DM.sdsCliente.Active) and (DM.sdsCliente.RecordCount > 0) then
      DMReport.frxRptCliente.ShowReport;
end;

procedure TfrmConCliente.LimpaCampos;
var Sender: TObject;
begin
    cbxFiltro.ItemIndex   := 0;
    cbxSituação.ItemIndex := 3;
    cbxFiltroChange(Sender);
    ckbPeriodo.Checked := False;
    stbBarra.Panels[0].Text := '';
    sbtExcluir.Enabled := False;
    sbtAlterar.Enabled := False;
end;

procedure TfrmConCliente.mskCPFKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #13 then
      sbtPesquisar.Click;
end;

procedure TfrmConCliente.sbtAlterarClick(Sender: TObject);
begin
    if gAgenda then begin
      if DM.sdsClienteSITUACAO.AsString <> 'ATIVO' then begin
        Informacao('Atenção', 'Você deve utilizar clientes que estejam com situação Ativo.');
        Exit;
      end;

      pNumeroAgenda := DM.sdsClienteINDICE.AsInteger;
      pNomeAgenda   := DM.sdsClienteNOME.AsString;
    end;
    gAlterar := True;
    Close;
end;

procedure TfrmConCliente.sbtAlterarMouseLeave(Sender: TObject);
begin
    sbtAlterar.Caption := '';
end;

procedure TfrmConCliente.sbtAlterarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    sbtAlterar.Caption := 'Selecionar';
end;

procedure TfrmConCliente.sbtCancelarClick(Sender: TObject);
begin
    LimpaCampos;
end;

procedure TfrmConCliente.sbtCancelarMouseLeave(Sender: TObject);
begin
    sbtCancelar.Caption := '';
end;

procedure TfrmConCliente.sbtCancelarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    sbtCancelar.Caption := 'Cancelar';
end;

procedure TfrmConCliente.sbtPesquisarClick(Sender: TObject);
var vSQL : string;
    sdsTemp : TSimpleDataSet;
begin
    vSQL := 'select * from CLI00 a ';

    case cbxFiltro.ItemIndex of
      0: // nome cliente
        begin
          vSQL := vSQL + ' where a.NOME like '+QuotedStr('%'+trim(edtNome.Text)+'%');
        end;
      1: // cidade
        begin
          vSQL := vSQL + ' where a.CIDADE like '+QuotedStr('%'+trim(edtNome.Text)+'%');
        end;
      2: // CPF
        begin
          if Trim(mskCPF.Text) = '' then begin
            DM.sdsCliente.Close;
            Informacao('Atenção', 'Digite o número do CPF para efetuar a busca.');
            mskCPF.SetFocus;
            Exit;
          end
          else
            vSQL := vSQL + ' where a.CPF_CNPJ = '+QuotedStr(mskCPF.Text);
        end;
    end;

    case cbxSituação.ItemIndex of
      0: // ativo
        begin
          vSQL := vSQL + ' and a.SITUACAO = '+QuotedStr('ATIVO');
        end;
      1: // bloqueado
        begin
          vSQL := vSQL + ' and a.SITUACAO = '+QuotedStr('BLOQUEADO');
        end;
      2: // inativo
        begin
          vSQL := vSQL + ' and a.SITUACAO = '+QuotedStr('INATIVO');
        end;
    end;

    if ckbPeriodo.Checked then begin
      if ValidaPeriodo(DateToStr(dtpDe.Date), DateToStr(dtpAte.Date)) then begin
        vSQL := vSQL + ' and a.DT_ULTIMA_CONSULTA between :pDT_INI'+
                       ' and :pDT_FIM';
      end
      else Exit;
    end;

    vSQL := vSQL + ' order by a.NOME';

    DM.sdsCliente.DisableControls;
    with DM do begin
      try
        TRANSACAO.TransactionID  := NewTransactionID;
        TRANSACAO.IsolationLevel := xilREADCOMMITTED;

        with sdsCliente do begin
          Close;
          DataSet.CommandText := vSQL;

          if ckbPeriodo.Checked then begin
            DataSet.ParamByName('pDT_INI').AsDateTime := dtpDe.DateTime;
            DataSet.ParamByName('pDT_FIM').AsDateTime := dtpAte.DateTime;
          end;

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
    DM.sdsCliente.EnableControls;
    stbBarra.Panels[0].Text := 'Encontrado(s) ' +IntToStr(DM.sdsCliente.RecordCount)+' registro(s)' ;

    if DM.sdsCliente.RecordCount > 0 then begin
      sbtAlterar.Enabled := True;
      sbtExcluir.Enabled := True;
    end
    else begin
      sbtAlterar.Enabled := False;
      sbtExcluir.Enabled := False;
    end;

end;

procedure TfrmConCliente.sbtPesquisarMouseLeave(Sender: TObject);
begin
    sbtPesquisar.Caption := '';
end;

procedure TfrmConCliente.sbtPesquisarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    sbtPesquisar.Caption := 'Pesquisar';
end;

procedure TfrmConCliente.sbtExcluirClick(Sender: TObject);
begin
    frmCadCliente.InsertUpdateDelete(2);
    sbtPesquisar.Click;
end;

procedure TfrmConCliente.sbtExcluirMouseLeave(Sender: TObject);
begin
    sbtExcluir.Caption := '';
end;

procedure TfrmConCliente.sbtExcluirMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    sbtExcluir.Caption := 'Excluir';
end;

procedure TfrmConCliente.sbtNovoClick(Sender: TObject);
begin
    frmCadCliente := TfrmCadCliente.Create(Application);
    frmCadCliente.ShowModal;
    frmCadCliente.LimpaCampos;
    frmCadCliente.Free;
    frmCadCliente := nil;
end;

procedure TfrmConCliente.sbtNovoMouseLeave(Sender: TObject);
begin
    sbtNovo.Caption := '';
end;

procedure TfrmConCliente.sbtNovoMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
    sbtNovo.Caption := 'Novo';
end;

procedure TfrmConCliente.ZeraPeriodo;
begin
    dtpDe.Date  := Date - 30;
    dtpAte.Date := Date;
end;

end.
