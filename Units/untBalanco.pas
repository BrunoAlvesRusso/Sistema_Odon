unit untBalanco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Menus, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, SimpleDS, Vcl.DBCtrls;

type
  TfrmBalanco = class(TForm)
    Panel1: TPanel;
    MainMenu1: TMainMenu;
    FecharEsc1: TMenuItem;
    gbxPeriodo: TGroupBox;
    dtpAte: TDateTimePicker;
    dtpDe: TDateTimePicker;
    lblDe: TLabel;
    lblAte: TLabel;
    sbtPesquisar: TSpeedButton;
    gbxBalanco: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblNumAgendamentos: TLabel;
    lblAtendidos: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lblGasto: TLabel;
    lblNaoCompareceram: TLabel;
    lblRecebido: TLabel;
    lblAReceber: TLabel;
    GroupBox1: TGroupBox;
    lblAPagar: TLabel;
    ImprimirCtrlP1: TMenuItem;
    lblTotalSalarial: TLabel;
    Label5: TLabel;
    lblValorTotal: TLabel;
    Label10: TLabel;
    dblProfissional: TDBLookupComboBox;
    Label4: TLabel;
    procedure FecharEsc1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure sbtPesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbtPesquisarMouseLeave(Sender: TObject);
    procedure sbtPesquisarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ImprimirCtrlP1Click(Sender: TObject);
    procedure dblProfissionalKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBalanco: TfrmBalanco;

implementation

{$R *.dfm}

uses untDM, untRotinas, untDMReport;

procedure TfrmBalanco.dblProfissionalKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #8 then
      dblProfissional.KeyValue := null;
end;

procedure TfrmBalanco.FecharEsc1Click(Sender: TObject);
begin
    Close;
end;

procedure TfrmBalanco.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #27 then
      Close;
end;

procedure TfrmBalanco.FormShow(Sender: TObject);
begin
    DM.sdsProfissional.Open;
    dtpDe.Date  := Date;
    dtpAte.Date := Date;
    gbxBalanco.Caption := '---------------------------------------------------   Balanço   ----------------------------------------------------';
end;

procedure TfrmBalanco.ImprimirCtrlP1Click(Sender: TObject);
begin
    with DMReport.frxRptBalanco.Variables do begin
      Variables['Periodo']         := QuotedStr(gbxBalanco.Caption);
      Variables['Agendamentos']    := QuotedStr(lblNumAgendamentos.Caption);
      Variables['Atendimentos']    := QuotedStr(lblAtendidos.Caption);
      Variables['NaoCompareceram'] := QuotedStr(lblNaoCompareceram.Caption);

      Variables['Recebido']        := QuotedStr(lblRecebido.Caption);
      Variables['Gasto']           := QuotedStr(lblGasto.Caption);
      Variables['Receber']         := QuotedStr(lblAReceber.Caption);
      Variables['Pagar']           := QuotedStr(lblAPagar.Caption);
      Variables['SalarioPago']     := QuotedStr(lblTotalSalarial.Caption);

      Variables['Total']           := QuotedStr(lblValorTotal.Caption);
    end;
    DMReport.frxRptBalanco.ShowReport;
end;

procedure TfrmBalanco.sbtPesquisarClick(Sender: TObject);
var sdsTemp : TSimpleDataSet;
    total, gasto, recebido, receber, pagar, salariopg : Double;
begin
    gbxBalanco.Caption := '----------------------------   Balanço do período de '+
                          DateToStr(dtpDe.Date)+' até '+DateToStr(dtpAte.Date)+
                          '   ---------------------------';

    sdsTemp := TSimpleDataSet.Create(nil);
    sdsTemp.Connection := DM.CONEXAO;

    // Número Agendamentos
    with sdsTemp do begin
      Close;
      DataSet.CommandText := ' select * from age00 a '+
                             ' where a.data between '+QuotedStr(InverteData(DateToStr(dtpDe.Date)))+
                             ' and '+QuotedStr(InverteData(DateToStr(dtpAte.Date)))+
                             ' and a.cliente <> '+QuotedStr('')+
                             ' and a.CLIENTE <> '+QuotedStr('NÃO AGENDAR');
      if dblProfissional.KeyValue <> null then
        DataSet.CommandText := DataSet.CommandText + ' and a.nu_colaborador = '+IntToStr(dblProfissional.KeyValue);
      Open;
    end;

    lblNumAgendamentos.Caption := IntToStr(sdsTemp.RecordCount);


    // Atendidos
    with sdsTemp do begin
      Close;
      DataSet.CommandText := ' select * from age00 a '+
                             ' where a.data between '+QuotedStr(InverteData(DateToStr(dtpDe.Date)))+
                             ' and '+QuotedStr(InverteData(DateToStr(dtpAte.Date)))+
                             ' and a.situacao = '+QuotedStr('CONCLUÍDO')+
                             ' and a.CLIENTE <> '+QuotedStr('NÃO AGENDAR');
      if dblProfissional.KeyValue <> null then
        DataSet.CommandText := DataSet.CommandText + ' and a.nu_colaborador = '+IntToStr(dblProfissional.KeyValue);
      Open;
    end;

    lblAtendidos.Caption := IntToStr(sdsTemp.RecordCount);


    // Não Compareceram
    with sdsTemp do begin
      Close;
      DataSet.CommandText := ' select * from age00 a '+
                             ' where a.data <= '+QuotedStr(InverteData(DateToStr(Date)))+
                             ' and a.data between '+QuotedStr(InverteData(DateToStr(dtpDe.Date)))+
                             ' and '+QuotedStr(InverteData(DateToStr(dtpAte.Date)))+
                             ' and a.situacao = '+QuotedStr('ABERTO')+
                             ' and a.CLIENTE <> '+QuotedStr('NÃO AGENDAR');
      if dblProfissional.KeyValue <> null then
        DataSet.CommandText := DataSet.CommandText + ' and a.nu_colaborador = '+IntToStr(dblProfissional.KeyValue);
      Open;
    end;

    lblNaoCompareceram.Caption := IntToStr(sdsTemp.RecordCount);


    // Valor Total Recebido
    with sdsTemp do begin
      Close;
      DataSet.CommandText := ' select sum(a.valor_pago + iif (a.valor_pendente > 0, 0, a.valor_pendente)) as Total from cxa00 a '+
                             ' where a.dt_pagamento between '+QuotedStr(InverteData(DateToStr(dtpDe.Date)))+
                             ' and '+QuotedStr(InverteData(DateToStr(dtpAte.Date)))+
                             ' and a.transacao = '+QuotedStr('E')+
                             ' and a.situacao = '+QuotedStr('PAGO');
      if dblProfissional.KeyValue <> null then
        DataSet.CommandText := DataSet.CommandText + ' and a.nu_colaborador = '+IntToStr(dblProfissional.KeyValue);
      Open;
    end;

    recebido := sdsTemp.FieldByName('Total').AsFloat;
    lblRecebido.Caption := FormatFloat('R$ ###,###,##0.00', sdsTemp.FieldByName('Total').AsFloat);


    // Valor Total Gasto
    with sdsTemp do begin
      Close;
      DataSet.CommandText := ' select sum(a.valor_total) as Total from cxa00 a '+
                             ' where a.dt_pagamento between '+QuotedStr(InverteData(DateToStr(dtpDe.Date)))+
                             ' and '+QuotedStr(InverteData(DateToStr(dtpAte.Date)))+
                             ' and a.transacao = '+QuotedStr('S');
      if dblProfissional.KeyValue <> null then
        DataSet.CommandText := DataSet.CommandText + ' and a.nu_colaborador = '+IntToStr(dblProfissional.KeyValue);
      Open;
    end;
    gasto := sdsTemp.FieldByName('Total').AsFloat;

    with sdsTemp do begin
      Close;
      DataSet.CommandText := ' select sum(b.valor) as Total from des00 b '+
                             ' where b.situacao = '+QuotedStr('Pago')+
                             ' and b.dt_pagamento between '+QuotedStr(InverteData(DateToStr(dtpDe.Date)))+
                             ' and '+QuotedStr(InverteData(DateToStr(dtpAte.Date)));
      if dblProfissional.KeyValue <> null then
        DataSet.CommandText := DataSet.CommandText + ' and b.nu_colaborador = '+IntToStr(dblProfissional.KeyValue);
      Open;
    end;
    gasto := gasto + sdsTemp.FieldByName('Total').AsFloat;

    lblGasto.Caption := FormatFloat('R$ ###,###,##0.00', gasto);


    // Valor Total a Receber
    with sdsTemp do begin
      Close;
      DataSet.CommandText := ' select sum(a.valor_total) as Total from cxa00 a '+
                             ' where a.dt_atendimento between '+QuotedStr(InverteData(DateToStr(dtpDe.Date)))+
                             ' and '+QuotedStr(InverteData(DateToStr(dtpAte.Date)))+
                             ' and a.transacao = '+QuotedStr('E')+
                             ' and a.situacao = '+QuotedStr('PENDENTE');
      if dblProfissional.KeyValue <> null then
        DataSet.CommandText := DataSet.CommandText + ' and a.nu_colaborador = '+IntToStr(dblProfissional.KeyValue);
      Open;
    end;

    receber := sdsTemp.FieldByName('Total').AsFloat;
    lblAReceber.Caption := FormatFloat('R$ ###,###,##0.00', sdsTemp.FieldByName('Total').AsFloat);


    // Valor Total a Pagar
    with sdsTemp do begin
      Close;
      DataSet.CommandText := ' select sum(a.valor) as Total from des00 a '+
                             //' inner join col00 b on a.nu_colaborador = b.indice '+
                             ' where a.dt_vencimento between '+QuotedStr(InverteData(DateToStr(dtpDe.Date)))+
                             ' and '+QuotedStr(InverteData(DateToStr(dtpAte.Date)))+
                             ' and a.situacao = '+QuotedStr('Pendente');
      if dblProfissional.KeyValue <> null then
        DataSet.CommandText := DataSet.CommandText + ' and a.nu_colaborador = '+IntToStr(dblProfissional.KeyValue);
      Open;
    end;

    pagar := sdsTemp.FieldByName('Total').AsFloat;
    lblAPagar.Caption := FormatFloat('R$ ###,###,##0.00', sdsTemp.FieldByName('Total').AsFloat);


    // Valor Total Salarial
 {   with sdsTemp do begin
      sdsTemp.Close;
      sdsTemp.DataSet.CommandText := ' select sum(a.valor_pago) as Total from cxa00 a '+
                                     ' where a.nu_colaborador is not null '+
                                     ' and situacao_financ_col = '+QuotedStr('PAGO')+
                                     ' and a.dt_pagamento between :pDT_INI and :pDT_FIM';
      if dblProfissional.KeyValue <> null then
        DataSet.CommandText := DataSet.CommandText + ' and a.nu_colaborador = '+IntToStr(dblProfissional.KeyValue);

      sdsTemp.DataSet.ParamByName('pDT_INI').AsDateTime := dtpDe.DateTime;
      sdsTemp.DataSet.ParamByName('pDT_FIM').AsDateTime := dtpAte.DateTime;
      Open;
    end;

    salariopg := sdsTemp.FieldByName('Total').AsFloat;
    lblTotalSalarial.Caption := FormatFloat('R$ ###,###,##0.00', sdsTemp.FieldByName('Total').AsFloat);

    total := recebido - (gasto + salariopg);  }

    total := recebido - gasto;
    lblValorTotal.Caption := FormatFloat('R$ ###,###,##0.00', total);

    if total < 0 then begin
      Label10.Font.Color := clRed;
      lblValorTotal.Font.Color := clRed;
    end
    else if total = 0 then begin
      Label10.Font.Color := clBlack;
      lblValorTotal.Font.Color := clBlack;
    end
    else
    begin
      Label10.Font.Color := clBlue;
      lblValorTotal.Font.Color := clBlue;
    end;
end;

procedure TfrmBalanco.sbtPesquisarMouseLeave(Sender: TObject);
begin
    sbtPesquisar.Caption := '';
end;

procedure TfrmBalanco.sbtPesquisarMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
    sbtPesquisar.Caption := 'Pesquisar';
end;

end.
