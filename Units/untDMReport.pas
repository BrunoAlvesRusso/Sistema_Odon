unit untDMReport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxClass, frxDBSet, frxGradient,
  frxExportPDF;

type
  TDMReport = class(TForm)
    frxCliente: TfrxDBDataset;
    frxRptCliente: TfrxReport;
    frxGradientObject1: TfrxGradientObject;
    frxFornecedor: TfrxDBDataset;
    frxRptFornecedor: TfrxReport;
    frxPDFExport1: TfrxPDFExport;
    frxFuncionario: TfrxDBDataset;
    frxRptFuncionario: TfrxReport;
    frxProduto: TfrxDBDataset;
    frxRptProduto: TfrxReport;
    frxAgenda: TfrxDBDataset;
    frxRptAgenda: TfrxReport;
    frxRptMovimentacao: TfrxReport;
    frxMovimentacao: TfrxDBDataset;
    frxRptDespesas: TfrxReport;
    frxAPagar: TfrxDBDataset;
    frxRptAReceber: TfrxReport;
    frxAReceber: TfrxDBDataset;
    frxRptBalanco: TfrxReport;
    frxRptFechaCaixa: TfrxReport;
    frxFechaCaixa: TfrxDBDataset;
    frxRptCaixa: TfrxReport;
    frxCaixa: TfrxDBDataset;
    frxRptCaixaTodos: TfrxReport;
    frxCaixaTodos: TfrxDBDataset;
    frxRptMarcados: TfrxReport;
    frxMarcados: TfrxDBDataset;
    frxGerenciador: TfrxDBDataset;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMReport: TDMReport;

implementation

{$R *.dfm}

uses untDM;

end.
