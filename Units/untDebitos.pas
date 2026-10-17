unit untDebitos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.DBCtrls, SimpleDS;

type
  TfrmDebitos = class(TForm)
    gbxDebitos: TGroupBox;
    MainMenu1: TMainMenu;
    FecharEsc1: TMenuItem;
    dbgDebitos: TDBGrid;
    gbxPesquisa: TGroupBox;
    edtDescricao: TEdit;
    cbxSituação: TComboBox;
    lblSituacao: TLabel;
    Label1: TLabel;
    sbtPesquisar: TSpeedButton;
    stbDebito: TStatusBar;
    dblProfissional: TDBLookupComboBox;
    lblDe: TLabel;
    gbxPeriodo: TGroupBox;
    Label2: TLabel;
    lblAte: TLabel;
    dtpDe: TDateTimePicker;
    dtpAte: TDateTimePicker;
    ckbAtendimento: TCheckBox;
    ckbPagamento: TCheckBox;
    ImprimirCtrlP1: TMenuItem;
    Label3: TLabel;
    Label4: TLabel;
    lblTotalPago: TLabel;
    lblTotalPendente: TLabel;
    procedure FecharEsc1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure sbtPesquisarMouseLeave(Sender: TObject);
    procedure sbtPesquisarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbtPesquisarClick(Sender: TObject);
    procedure rgpTransacaoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblProfissionalKeyPress(Sender: TObject; var Key: Char);
    procedure edtDescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure cbxSituaçãoKeyPress(Sender: TObject; var Key: Char);
    procedure dbgDebitosTitleClick(Column: TColumn);
    procedure ckbAtendimentoClick(Sender: TObject);
    procedure ckbPagamentoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ImprimirCtrlP1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDebitos: TfrmDebitos;

implementation

{$R *.dfm}

uses untDM, untRotinas, untDMReport;

procedure TfrmDebitos.cbxSituaçãoKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #13 then
      sbtPesquisar.Click;
end;

procedure TfrmDebitos.ckbAtendimentoClick(Sender: TObject);
begin
    ckbPagamento.Checked := False;
    if (not ckbAtendimento.Checked) and (not ckbPagamento.Checked) then
      gbxPeriodo.Enabled := False
    else gbxPeriodo.Enabled := True;
end;

procedure TfrmDebitos.ckbPagamentoClick(Sender: TObject);
begin
    ckbAtendimento.Checked := False;
    if (not ckbAtendimento.Checked) and (not ckbPagamento.Checked) then
      gbxPeriodo.Enabled := False
    else gbxPeriodo.Enabled := True;
end;

procedure TfrmDebitos.dbgDebitosTitleClick(Column: TColumn);
begin
    DM.sdsDebito.IndexFieldNames := Column.FieldName;
end;

procedure TfrmDebitos.dblProfissionalKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #13 then
      sbtPesquisar.Click;

    if key = #8 then
      dblProfissional.KeyValue := null;
end;

procedure TfrmDebitos.edtDescricaoKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #13 then
      sbtPesquisar.Click;
end;

procedure TfrmDebitos.FecharEsc1Click(Sender: TObject);
begin
    Close;
end;

procedure TfrmDebitos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    DM.sdsDebito.Close;
end;

procedure TfrmDebitos.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #27 then
      Close;
end;

procedure TfrmDebitos.FormShow(Sender: TObject);
begin
    DM.sdsProfissional.Open;
    dtpDe.Date := Date;
    dtpAte.Date := Date;
end;

procedure TfrmDebitos.ImprimirCtrlP1Click(Sender: TObject);
begin
    if (DM.sdsDebito.Active) and (DM.sdsDebito.RecordCount > 0) then
      DMReport.frxRptMovimentacao.ShowReport;
end;

procedure TfrmDebitos.rgpTransacaoClick(Sender: TObject);
begin
    cbxSituação.ItemIndex := 0;
end;

procedure TfrmDebitos.sbtPesquisarClick(Sender: TObject);
var sSQL, sSQL2 : string;
    sdsTemp : TSimpleDataSet;
begin
    sSQL := ' select * from cxa00 a '+
            ' left join cli00 b on a.nu_cliente = b.indice '+
            ' left join col00 c on a.nu_colaborador = c.indice '+
            ' where c.nome is not null ';

    sSQL2 := ' select sum(a.valor_pago + iif (a.valor_pendente > 0, 0, a.valor_pendente)) as Pago from cxa00 a '+
             ' left join cli00 b on a.nu_cliente = b.indice '+
             ' left join col00 c on a.nu_colaborador = c.indice '+
             ' where c.nome is not null ';

    case cbxSituação.ItemIndex of
      1 :
        begin
          sSQL := sSQL + ' and a.SITUACAO = '+QuotedStr('PAGO');
          sSQL2 := sSQL2 + ' and a.SITUACAO = '+QuotedStr('PAGO');
        end;
      2 :
        begin
          sSQL := sSQL + ' and a.SITUACAO = '+QuotedStr('PENDENTE');
          sSQL2 := sSQL2 + ' and a.SITUACAO = '+QuotedStr('PENDENTE');
        end;
    end;

    if Trim(edtDescricao.Text) <> '' then begin
      sSQL := sSQL + ' and b.NOME like '+QuotedStr('%'+edtDescricao.Text+'%');// cliente
      sSQL2 := sSQL2 + ' and b.NOME like '+QuotedStr('%'+edtDescricao.Text+'%');
    end;
    if dblProfissional.KeyValue <> null then begin
      sSQL := sSQL + ' and c.INDICE = '+IntToStr(dblProfissional.KeyValue);   // profissional
      sSQL2 := sSQL2 + ' and c.INDICE = '+IntToStr(dblProfissional.KeyValue);
    end;
    if ckbAtendimento.Checked then begin                                          // data atendimento
      if ValidaPeriodo(DateToStr(dtpDe.Date), DateToStr(dtpAte.Date)) then begin
        sSQL := sSQL + ' and a.dt_atendimento between :pDT_INI'+
                       ' and :pDT_FIM';
        sSQL2 := sSQL2 + ' and a.dt_atendimento between :pDT_INI'+
                         ' and :pDT_FIM';
      end
      else Exit;
    end;

    if ckbPagamento.Checked then begin                                          // data pagamento
      if ValidaPeriodo(DateToStr(dtpDe.Date), DateToStr(dtpAte.Date)) then begin
        sSQL := sSQL + ' and a.dt_pagamento between :pDT_INI'+
                       ' and :pDT_FIM';
        sSQL2 := sSQL2 + ' and a.dt_pagamento between :pDT_INI'+
                       ' and :pDT_FIM';
      end
      else Exit;
    end;

    sSQL := sSQL + ' order by a.dt_atendimento ';

    DM.sdsDebito.Close;
    DM.sdsDebito.DataSet.CommandText := sSQL;
    if (ckbAtendimento.Checked) or (ckbPagamento.Checked) then begin
      DM.sdsDebito.DataSet.ParamByName('pDT_INI').AsDateTime := dtpDe.DateTime;
      DM.sdsDebito.DataSet.ParamByName('pDT_FIM').AsDateTime := dtpAte.DateTime;
    end;
    DM.sdsDebito.Open;

    stbDebito.Panels[0].Text := 'Encontrado(s) ' +IntToStr(DM.sdsDebito.RecordCount)+' registro(s)' ;

    sdsTemp := TSimpleDataSet.Create(nil);
    sdsTemp.Connection := DM.CONEXAO;
    DM.sdsSomaMovimentacao.Close;
    DM.sdsSomaMovimentacao.DataSet.CommandText := sSQL2;
    if (ckbAtendimento.Checked) or (ckbPagamento.Checked) then begin
      DM.sdsSomaMovimentacao.DataSet.ParamByName('pDT_INI').AsDateTime := dtpDe.DateTime;
      DM.sdsSomaMovimentacao.DataSet.ParamByName('pDT_FIM').AsDateTime := dtpAte.DateTime;
    end;
    DM.sdsSomaMovimentacao.Open;

    lblTotalPago.Caption     := FormatFloat('R$ ###,###,##0.00', DM.sdsSomaMovimentacaoPAGO.AsFloat);
    //lblTotalPendente.Caption := FormatFloat('R$ ###,###,##0.00', DM.sdsSomaMovimentacaoPENDENTE.AsFloat);
end;

procedure TfrmDebitos.sbtPesquisarMouseLeave(Sender: TObject);
begin
    sbtPesquisar.Caption := '';
end;

procedure TfrmDebitos.sbtPesquisarMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
    sbtPesquisar.Caption := 'Pesquisar';
end;

end.
