unit untContas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.ExtCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, SimpleDS, Vcl.DBCtrls;

type
  TfrmContas = class(TForm)
    MainMenu1: TMainMenu;
    FecharEsc1: TMenuItem;
    Panel1: TPanel;
    gbxPesquisar: TGroupBox;
    sbtPesquisar: TSpeedButton;
    gbxPeriodo: TGroupBox;
    lblDe: TLabel;
    lblAte: TLabel;
    dtpDe: TDateTimePicker;
    dtpAte: TDateTimePicker;
    ckbPeriodo: TCheckBox;
    dbgContas: TDBGrid;
    stbBarra: TStatusBar;
    Label1: TLabel;
    lblTotal: TLabel;
    edtNome: TEdit;
    lblNome: TLabel;
    Label2: TLabel;
    dblProfissional: TDBLookupComboBox;
    ImprimirCtrlP1: TMenuItem;
    procedure FecharEsc1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure ckbPeriodoClick(Sender: TObject);
    procedure sbtPesquisarMouseLeave(Sender: TObject);
    procedure sbtPesquisarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbtPesquisarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblProfissionalKeyPress(Sender: TObject; var Key: Char);
    procedure ImprimirCtrlP1Click(Sender: TObject);
    procedure dbgContasTitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
    total : Double;
  end;

var
  frmContas: TfrmContas;

implementation

{$R *.dfm}

uses untDM, untRotinas, untDMReport;

procedure TfrmContas.ckbPeriodoClick(Sender: TObject);
begin
    if ckbPeriodo.Checked then
      gbxPeriodo.Enabled := True
    else begin
      dtpDe.Date  := Date - 30;
      dtpAte.Date := Date;
      gbxPeriodo.Enabled := False;
    end;
end;

procedure TfrmContas.dbgContasTitleClick(Column: TColumn);
begin
    DM.sdsAReceber.IndexFieldNames := Column.FieldName;
end;

procedure TfrmContas.dblProfissionalKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #8 then
      dblProfissional.KeyValue := null;
end;

procedure TfrmContas.FecharEsc1Click(Sender: TObject);
begin
    Close;
end;

procedure TfrmContas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    DM.sdsAReceber.Close;
    DM.sdsProfissional.Close;
end;

procedure TfrmContas.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #27 then
      Close;
end;

procedure TfrmContas.FormShow(Sender: TObject);
begin
    dtpDe.Date  := Date - 30;
    dtpAte.Date := Date;
    DM.sdsProfissional.Open;
end;

procedure TfrmContas.ImprimirCtrlP1Click(Sender: TObject);
begin
    if (DM.sdsAReceber.Active) and (DM.sdsAReceber.RecordCount > 0) then begin
      DMReport.frxRptAReceber.Variables.Variables['Total'] := QuotedStr(FloatToStr(total));
      DMReport.frxRptAReceber.ShowReport;
    end;
end;

procedure TfrmContas.sbtPesquisarClick(Sender: TObject);
var sSQL : string;
    sdsTemp : TSimpleDataSet;
begin
    sSQL := ' select * from cxa00 a '+
            ' left join cli00 b on a.nu_cliente = b.indice '+
            ' left join col00 c on a.nu_colaborador = c.indice '+
            ' where a.situacao = '+ QuotedStr('PENDENTE');


    // profissional
    if dblProfissional.KeyValue <> null then
      sSQL := sSQL + ' and c.INDICE = '+IntToStr(dblProfissional.KeyValue);

    // cliente
    if Trim(edtNome.Text) <> '' then begin
      sSQL := sSQL + ' and b.NOME like '+QuotedStr('%'+trim(edtNome.Text)+'%');
    end;


    // período
    if ckbPeriodo.Checked then begin
      if ValidaPeriodo(DateToStr(dtpDe.Date), DateToStr(dtpAte.Date)) then begin
        sSQL := sSQL + ' and a.dt_atendimento between :pDT_INI'+
                       ' and :pDT_FIM';
      end
      else Exit;
    end;

    sSQL := sSQL + ' order by b.NOME ';

    DM.sdsAReceber.Close;
    DM.sdsAReceber.DataSet.CommandText := sSQL;
    if ckbPeriodo.Checked then begin
      DM.sdsAReceber.DataSet.ParamByName('pDT_INI').AsDateTime := dtpDe.DateTime;
      DM.sdsAReceber.DataSet.ParamByName('pDT_FIM').AsDateTime := dtpAte.DateTime;
    end;
    DM.sdsAReceber.Open;

    sdsTemp := TSimpleDataSet.Create(nil);
    sdsTemp.Connection := DM.CONEXAO;

    sSQL := ' select sum(a.valor_total) as total from cxa00 a '+
            ' left join cli00 b on a.nu_cliente = b.indice '+
            ' left join col00 c on a.nu_colaborador = c.indice '+
            ' where a.situacao = '+ QuotedStr('PENDENTE');


    // profissional
    if dblProfissional.KeyValue <> null then
      sSQL := sSQL + ' and c.INDICE = '+IntToStr(dblProfissional.KeyValue);

    // cliente
    if Trim(edtNome.Text) <> '' then begin
      sSQL := sSQL + ' and b.NOME like '+QuotedStr('%'+trim(edtNome.Text)+'%');
    end;

    // período
    if ckbPeriodo.Checked then begin
      if ValidaPeriodo(DateToStr(dtpDe.Date), DateToStr(dtpAte.Date)) then begin
        sSQL := sSQL + ' and a.dt_atendimento between :pDT_INI'+
                       ' and :pDT_FIM';
      end
      else Exit;
    end;

    with sdsTemp do begin
      Close;
      DataSet.CommandText := sSQL;
      if ckbPeriodo.Checked then begin
        sdsTemp.DataSet.ParamByName('pDT_INI').AsDateTime := dtpDe.DateTime;
        sdsTemp.DataSet.ParamByName('pDT_FIM').AsDateTime := dtpAte.DateTime;
      end;
      Open;
    end;

    lblTotal.Caption := FormatFloat('R$ ###,###,##0.00', sdsTemp.FieldByName('total').AsFloat);
    total := sdsTemp.FieldByName('total').AsFloat;
    sdsTemp.Free;

    stbBarra.Panels[0].Text := 'Encontrado(s) ' +IntToStr(DM.sdsAReceber.RecordCount)+' registro(s)' ;
end;

procedure TfrmContas.sbtPesquisarMouseLeave(Sender: TObject);
begin
    sbtPesquisar.Caption := '';
end;

procedure TfrmContas.sbtPesquisarMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
    sbtPesquisar.Caption := 'Pesquisar';
end;

end.
