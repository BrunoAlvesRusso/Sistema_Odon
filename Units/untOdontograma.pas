unit untOdontograma;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.jpeg,
  Vcl.Grids, Vcl.ColorGrd, Vcl.StdCtrls, Vcl.Menus, Vcl.ComCtrls, Vcl.Buttons, SQLExpr,
  Vcl.DBCtrls;

type
  TfrmOdontograma = class(TForm)
    MainMenu1: TMainMenu;
    Retornar1: TMenuItem;
    pgcAdultoInfantil: TPageControl;
    tbsAdulto: TTabSheet;
    sbtCancelar: TSpeedButton;
    sbtCadastrar: TSpeedButton;
    gbxLegenda: TGroupBox;
    clbLegenda1: TColorBox;
    clbLegenda2: TColorBox;
    clbLegenda3: TColorBox;
    clbLegenda4: TColorBox;
    clbLegenda5: TColorBox;
    clbLegenda6: TColorBox;
    clbLegenda7: TColorBox;
    clbLegenda8: TColorBox;
    clbLegenda9: TColorBox;
    clbLegenda10: TColorBox;
    clbLegenda11: TColorBox;
    clbLegenda12: TColorBox;
    clbLegenda13: TColorBox;
    clbLegenda14: TColorBox;
    clbLegenda15: TColorBox;
    rbt6: TRadioButton;
    rbt7: TRadioButton;
    rbt8: TRadioButton;
    rbt9: TRadioButton;
    rbt10: TRadioButton;
    rbt11: TRadioButton;
    rbt12: TRadioButton;
    rbt13: TRadioButton;
    rbt14: TRadioButton;
    rbt15: TRadioButton;
    rbt1: TRadioButton;
    rbt2: TRadioButton;
    rbt3: TRadioButton;
    rbt4: TRadioButton;
    rbt5: TRadioButton;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Image1: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    Image11: TImage;
    Image12: TImage;
    Image13: TImage;
    Image14: TImage;
    Image15: TImage;
    Image16: TImage;
    Image17: TImage;
    Image2: TImage;
    Image18: TImage;
    Image19: TImage;
    Image20: TImage;
    Image21: TImage;
    Image22: TImage;
    Image23: TImage;
    Image24: TImage;
    Image25: TImage;
    Image26: TImage;
    Image27: TImage;
    Image28: TImage;
    Image29: TImage;
    Image30: TImage;
    Image31: TImage;
    Image32: TImage;
    pnl18: TPanel;
    gbx18_4: TGroupBox;
    gbx18_8: TGroupBox;
    gbx18_6: TGroupBox;
    gbx18_2: TGroupBox;
    gbx18_9: TGroupBox;
    gbx18_1: TGroupBox;
    gbx18_3: TGroupBox;
    gbx18_7: TGroupBox;
    gbx18_5: TGroupBox;
    pnl17: TPanel;
    gbx17_4: TGroupBox;
    gbx17_8: TGroupBox;
    gbx17_6: TGroupBox;
    gbx17_2: TGroupBox;
    gbx17_9: TGroupBox;
    gbx17_1: TGroupBox;
    gbx17_3: TGroupBox;
    gbx17_7: TGroupBox;
    gbx17_5: TGroupBox;
    pnl16: TPanel;
    gbx16_4: TGroupBox;
    gbx16_8: TGroupBox;
    gbx16_6: TGroupBox;
    gbx16_2: TGroupBox;
    gbx16_9: TGroupBox;
    gbx16_1: TGroupBox;
    gbx16_3: TGroupBox;
    gbx16_7: TGroupBox;
    gbx16_5: TGroupBox;
    pnl15: TPanel;
    gbx15_4: TGroupBox;
    gbx15_8: TGroupBox;
    gbx15_6: TGroupBox;
    gbx15_2: TGroupBox;
    gbx15_9: TGroupBox;
    gbx15_1: TGroupBox;
    gbx15_3: TGroupBox;
    gbx15_7: TGroupBox;
    gbx15_5: TGroupBox;
    pnl14: TPanel;
    gbx14_4: TGroupBox;
    gbx14_8: TGroupBox;
    gbx14_6: TGroupBox;
    gbx14_2: TGroupBox;
    gbx14_9: TGroupBox;
    gbx14_1: TGroupBox;
    gbx14_3: TGroupBox;
    gbx14_7: TGroupBox;
    gbx14_5: TGroupBox;
    pnl13: TPanel;
    gbx13_4: TGroupBox;
    gbx13_8: TGroupBox;
    gbx13_6: TGroupBox;
    gbx13_2: TGroupBox;
    gbx13_9: TGroupBox;
    gbx13_1: TGroupBox;
    gbx13_3: TGroupBox;
    gbx13_7: TGroupBox;
    gbx13_5: TGroupBox;
    pnl12: TPanel;
    gbx12_4: TGroupBox;
    gbx12_8: TGroupBox;
    gbx12_6: TGroupBox;
    gbx12_2: TGroupBox;
    gbx12_9: TGroupBox;
    gbx12_1: TGroupBox;
    gbx12_3: TGroupBox;
    gbx12_7: TGroupBox;
    gbx12_5: TGroupBox;
    pnl11: TPanel;
    gbx11_4: TGroupBox;
    gbx11_8: TGroupBox;
    gbx11_6: TGroupBox;
    gbx11_2: TGroupBox;
    gbx11_9: TGroupBox;
    gbx11_1: TGroupBox;
    gbx11_3: TGroupBox;
    gbx11_7: TGroupBox;
    gbx11_5: TGroupBox;
    pnl21: TPanel;
    gbx21_4: TGroupBox;
    gbx21_8: TGroupBox;
    gbx21_6: TGroupBox;
    gbx21_2: TGroupBox;
    gbx21_9: TGroupBox;
    gbx21_1: TGroupBox;
    gbx21_3: TGroupBox;
    gbx21_7: TGroupBox;
    gbx21_5: TGroupBox;
    pnl22: TPanel;
    gbx22_4: TGroupBox;
    gbx22_8: TGroupBox;
    gbx22_6: TGroupBox;
    gbx22_2: TGroupBox;
    gbx22_9: TGroupBox;
    gbx22_1: TGroupBox;
    gbx22_3: TGroupBox;
    gbx22_7: TGroupBox;
    gbx22_5: TGroupBox;
    pnl23: TPanel;
    gbx23_4: TGroupBox;
    gbx23_8: TGroupBox;
    gbx23_6: TGroupBox;
    gbx23_2: TGroupBox;
    gbx23_9: TGroupBox;
    gbx23_1: TGroupBox;
    gbx23_3: TGroupBox;
    gbx23_7: TGroupBox;
    gbx23_5: TGroupBox;
    pnl24: TPanel;
    gbx24_4: TGroupBox;
    gbx24_8: TGroupBox;
    gbx24_6: TGroupBox;
    gbx24_2: TGroupBox;
    gbx24_9: TGroupBox;
    gbx24_1: TGroupBox;
    gbx24_3: TGroupBox;
    gbx24_7: TGroupBox;
    gbx24_5: TGroupBox;
    pnl25: TPanel;
    gbx25_4: TGroupBox;
    gbx25_8: TGroupBox;
    gbx25_6: TGroupBox;
    gbx25_2: TGroupBox;
    gbx25_9: TGroupBox;
    gbx25_1: TGroupBox;
    gbx25_3: TGroupBox;
    gbx25_7: TGroupBox;
    gbx25_5: TGroupBox;
    pnl26: TPanel;
    gbx26_4: TGroupBox;
    gbx26_8: TGroupBox;
    gbx26_6: TGroupBox;
    gbx26_2: TGroupBox;
    gbx26_9: TGroupBox;
    gbx26_1: TGroupBox;
    gbx26_3: TGroupBox;
    gbx26_7: TGroupBox;
    gbx26_5: TGroupBox;
    pnl27: TPanel;
    gbx27_4: TGroupBox;
    gbx27_8: TGroupBox;
    gbx27_6: TGroupBox;
    gbx27_2: TGroupBox;
    gbx27_9: TGroupBox;
    gbx27_1: TGroupBox;
    gbx27_3: TGroupBox;
    gbx27_7: TGroupBox;
    gbx27_5: TGroupBox;
    pnl28: TPanel;
    gbx28_4: TGroupBox;
    gbx28_8: TGroupBox;
    gbx28_6: TGroupBox;
    gbx28_2: TGroupBox;
    gbx28_9: TGroupBox;
    gbx28_1: TGroupBox;
    gbx28_3: TGroupBox;
    gbx28_7: TGroupBox;
    gbx28_5: TGroupBox;
    pnl48: TPanel;
    gbx48_4: TGroupBox;
    gbx48_8: TGroupBox;
    gbx48_6: TGroupBox;
    gbx48_2: TGroupBox;
    gbx48_9: TGroupBox;
    gbx48_1: TGroupBox;
    gbx48_3: TGroupBox;
    gbx48_7: TGroupBox;
    gbx48_5: TGroupBox;
    pnl47: TPanel;
    gbx47_4: TGroupBox;
    gbx47_8: TGroupBox;
    gbx47_6: TGroupBox;
    gbx47_2: TGroupBox;
    gbx47_9: TGroupBox;
    gbx47_1: TGroupBox;
    gbx47_3: TGroupBox;
    gbx47_7: TGroupBox;
    gbx47_5: TGroupBox;
    pnl46: TPanel;
    gbx46_4: TGroupBox;
    gbx46_8: TGroupBox;
    gbx46_6: TGroupBox;
    gbx46_2: TGroupBox;
    gbx46_9: TGroupBox;
    gbx46_1: TGroupBox;
    gbx46_3: TGroupBox;
    gbx46_7: TGroupBox;
    gbx46_5: TGroupBox;
    pnl45: TPanel;
    gbx45_4: TGroupBox;
    gbx45_8: TGroupBox;
    gbx45_6: TGroupBox;
    gbx45_2: TGroupBox;
    gbx45_9: TGroupBox;
    gbx45_1: TGroupBox;
    gbx45_3: TGroupBox;
    gbx45_7: TGroupBox;
    gbx45_5: TGroupBox;
    pnl44: TPanel;
    gbx44_4: TGroupBox;
    gbx44_8: TGroupBox;
    gbx44_6: TGroupBox;
    gbx44_2: TGroupBox;
    gbx44_9: TGroupBox;
    gbx44_1: TGroupBox;
    gbx44_3: TGroupBox;
    gbx44_7: TGroupBox;
    gbx44_5: TGroupBox;
    pnl43: TPanel;
    gbx43_4: TGroupBox;
    gbx43_8: TGroupBox;
    gbx43_6: TGroupBox;
    gbx43_2: TGroupBox;
    gbx43_9: TGroupBox;
    gbx43_1: TGroupBox;
    gbx43_3: TGroupBox;
    gbx43_7: TGroupBox;
    gbx43_5: TGroupBox;
    pnl42: TPanel;
    gbx42_4: TGroupBox;
    gbx42_8: TGroupBox;
    gbx42_6: TGroupBox;
    gbx42_2: TGroupBox;
    gbx42_9: TGroupBox;
    gbx42_1: TGroupBox;
    gbx42_3: TGroupBox;
    gbx42_7: TGroupBox;
    gbx42_5: TGroupBox;
    pnl41: TPanel;
    gbx41_4: TGroupBox;
    gbx41_8: TGroupBox;
    gbx41_6: TGroupBox;
    gbx41_2: TGroupBox;
    gbx41_9: TGroupBox;
    gbx41_1: TGroupBox;
    gbx41_3: TGroupBox;
    gbx41_7: TGroupBox;
    gbx41_5: TGroupBox;
    pnl31: TPanel;
    gbx31_4: TGroupBox;
    gbx31_8: TGroupBox;
    gbx31_6: TGroupBox;
    gbx31_2: TGroupBox;
    gbx31_9: TGroupBox;
    gbx31_1: TGroupBox;
    gbx31_3: TGroupBox;
    gbx31_7: TGroupBox;
    gbx31_5: TGroupBox;
    pnl32: TPanel;
    gbx32_4: TGroupBox;
    gbx32_8: TGroupBox;
    gbx32_6: TGroupBox;
    gbx32_2: TGroupBox;
    gbx32_9: TGroupBox;
    gbx32_1: TGroupBox;
    gbx32_3: TGroupBox;
    gbx32_7: TGroupBox;
    gbx32_5: TGroupBox;
    pnl33: TPanel;
    gbx33_4: TGroupBox;
    gbx33_8: TGroupBox;
    gbx33_6: TGroupBox;
    gbx33_2: TGroupBox;
    gbx33_9: TGroupBox;
    gbx33_1: TGroupBox;
    gbx33_3: TGroupBox;
    gbx33_7: TGroupBox;
    gbx33_5: TGroupBox;
    pnl34: TPanel;
    gbx34_4: TGroupBox;
    gbx34_8: TGroupBox;
    gbx34_6: TGroupBox;
    gbx34_2: TGroupBox;
    gbx34_9: TGroupBox;
    gbx34_1: TGroupBox;
    gbx34_3: TGroupBox;
    gbx34_7: TGroupBox;
    gbx34_5: TGroupBox;
    pnl35: TPanel;
    gbx35_4: TGroupBox;
    gbx35_8: TGroupBox;
    gbx35_6: TGroupBox;
    gbx35_2: TGroupBox;
    gbx35_9: TGroupBox;
    gbx35_1: TGroupBox;
    gbx35_3: TGroupBox;
    gbx35_7: TGroupBox;
    gbx35_5: TGroupBox;
    pnl36: TPanel;
    gbx36_4: TGroupBox;
    gbx36_8: TGroupBox;
    gbx36_6: TGroupBox;
    gbx36_2: TGroupBox;
    gbx36_9: TGroupBox;
    gbx36_1: TGroupBox;
    gbx36_3: TGroupBox;
    gbx36_7: TGroupBox;
    gbx36_5: TGroupBox;
    pnl37: TPanel;
    gbx37_4: TGroupBox;
    gbx37_8: TGroupBox;
    gbx37_6: TGroupBox;
    gbx37_2: TGroupBox;
    gbx37_9: TGroupBox;
    gbx37_1: TGroupBox;
    gbx37_3: TGroupBox;
    gbx37_7: TGroupBox;
    gbx37_5: TGroupBox;
    pnl38: TPanel;
    gbx38_4: TGroupBox;
    gbx38_8: TGroupBox;
    gbx38_6: TGroupBox;
    gbx38_2: TGroupBox;
    gbx38_9: TGroupBox;
    gbx38_1: TGroupBox;
    gbx38_3: TGroupBox;
    gbx38_7: TGroupBox;
    gbx38_5: TGroupBox;
    dblLeg1: TDBLookupComboBox;
    dblLeg2: TDBLookupComboBox;
    dblLeg3: TDBLookupComboBox;
    dblLeg4: TDBLookupComboBox;
    dblLeg5: TDBLookupComboBox;
    dblLeg6: TDBLookupComboBox;
    dblLeg7: TDBLookupComboBox;
    dblLeg8: TDBLookupComboBox;
    dblLeg9: TDBLookupComboBox;
    dblLeg10: TDBLookupComboBox;
    dblLeg11: TDBLookupComboBox;
    dblLeg12: TDBLookupComboBox;
    dblLeg13: TDBLookupComboBox;
    dblLeg14: TDBLookupComboBox;
    dblLeg15: TDBLookupComboBox;
    procedure Retornar1Click(Sender: TObject);
    procedure sbtCancelarMouseLeave(Sender: TObject);
    procedure sbtCancelarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbtCadastrarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbtCadastrarMouseLeave(Sender: TObject);
    procedure sbtCadastrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gbx18_1Click(Sender: TObject);
    procedure gbx18_2Click(Sender: TObject);
    procedure gbx18_3Click(Sender: TObject);
    procedure gbx18_4Click(Sender: TObject);
    procedure gbx18_5Click(Sender: TObject);
    procedure gbx18_6Click(Sender: TObject);
    procedure gbx18_7Click(Sender: TObject);
    procedure gbx18_8Click(Sender: TObject);
    procedure gbx18_9Click(Sender: TObject);
    procedure gbx17_1Click(Sender: TObject);
    procedure gbx17_2Click(Sender: TObject);
    procedure gbx17_3Click(Sender: TObject);
    procedure gbx17_4Click(Sender: TObject);
    procedure gbx17_5Click(Sender: TObject);
    procedure gbx17_6Click(Sender: TObject);
    procedure gbx17_7Click(Sender: TObject);
    procedure gbx17_8Click(Sender: TObject);
    procedure gbx17_9Click(Sender: TObject);
    procedure gbx16_1Click(Sender: TObject);
    procedure gbx16_2Click(Sender: TObject);
    procedure gbx16_3Click(Sender: TObject);
    procedure gbx16_4Click(Sender: TObject);
    procedure gbx16_5Click(Sender: TObject);
    procedure gbx16_6Click(Sender: TObject);
    procedure gbx16_7Click(Sender: TObject);
    procedure gbx16_8Click(Sender: TObject);
    procedure gbx16_9Click(Sender: TObject);
    procedure gbx15_1Click(Sender: TObject);
    procedure gbx15_2Click(Sender: TObject);
    procedure gbx15_3Click(Sender: TObject);
    procedure gbx15_4Click(Sender: TObject);
    procedure gbx15_5Click(Sender: TObject);
    procedure gbx15_6Click(Sender: TObject);
    procedure gbx15_7Click(Sender: TObject);
    procedure gbx15_8Click(Sender: TObject);
    procedure gbx15_9Click(Sender: TObject);
    procedure gbx14_1Click(Sender: TObject);
    procedure gbx14_2Click(Sender: TObject);
    procedure gbx14_3Click(Sender: TObject);
    procedure gbx14_4Click(Sender: TObject);
    procedure gbx14_5Click(Sender: TObject);
    procedure gbx14_6Click(Sender: TObject);
    procedure gbx14_7Click(Sender: TObject);
    procedure gbx14_8Click(Sender: TObject);
    procedure gbx14_9Click(Sender: TObject);
    procedure gbx13_1Click(Sender: TObject);
    procedure gbx13_2Click(Sender: TObject);
    procedure gbx13_3Click(Sender: TObject);
    procedure gbx13_4Click(Sender: TObject);
    procedure gbx13_5Click(Sender: TObject);
    procedure gbx13_6Click(Sender: TObject);
    procedure gbx13_7Click(Sender: TObject);
    procedure gbx13_8Click(Sender: TObject);
    procedure gbx13_9Click(Sender: TObject);
    procedure gbx12_1Click(Sender: TObject);
    procedure gbx12_2Click(Sender: TObject);
    procedure gbx12_3Click(Sender: TObject);
    procedure gbx12_4Click(Sender: TObject);
    procedure gbx12_5Click(Sender: TObject);
    procedure gbx12_6Click(Sender: TObject);
    procedure gbx12_7Click(Sender: TObject);
    procedure gbx12_8Click(Sender: TObject);
    procedure gbx12_9Click(Sender: TObject);
    procedure gbx11_1Click(Sender: TObject);
    procedure gbx11_2Click(Sender: TObject);
    procedure gbx11_3Click(Sender: TObject);
    procedure gbx11_4Click(Sender: TObject);
    procedure gbx11_5Click(Sender: TObject);
    procedure gbx11_6Click(Sender: TObject);
    procedure gbx11_7Click(Sender: TObject);
    procedure gbx11_8Click(Sender: TObject);
    procedure gbx11_9Click(Sender: TObject);
    procedure gbx21_1Click(Sender: TObject);
    procedure gbx21_2Click(Sender: TObject);
    procedure gbx21_3Click(Sender: TObject);
    procedure gbx21_4Click(Sender: TObject);
    procedure gbx21_5Click(Sender: TObject);
    procedure gbx21_6Click(Sender: TObject);
    procedure gbx21_7Click(Sender: TObject);
    procedure gbx21_8Click(Sender: TObject);
    procedure gbx21_9Click(Sender: TObject);
    procedure gbx22_1Click(Sender: TObject);
    procedure gbx22_2Click(Sender: TObject);
    procedure gbx22_3Click(Sender: TObject);
    procedure gbx22_4Click(Sender: TObject);
    procedure gbx22_5Click(Sender: TObject);
    procedure gbx22_6Click(Sender: TObject);
    procedure gbx22_7Click(Sender: TObject);
    procedure gbx22_8Click(Sender: TObject);
    procedure gbx22_9Click(Sender: TObject);
    procedure gbx23_1Click(Sender: TObject);
    procedure gbx23_2Click(Sender: TObject);
    procedure gbx23_3Click(Sender: TObject);
    procedure gbx23_4Click(Sender: TObject);
    procedure gbx23_5Click(Sender: TObject);
    procedure gbx23_6Click(Sender: TObject);
    procedure gbx23_7Click(Sender: TObject);
    procedure gbx23_8Click(Sender: TObject);
    procedure gbx23_9Click(Sender: TObject);
    procedure gbx24_1Click(Sender: TObject);
    procedure gbx24_2Click(Sender: TObject);
    procedure gbx24_3Click(Sender: TObject);
    procedure gbx24_4Click(Sender: TObject);
    procedure gbx24_5Click(Sender: TObject);
    procedure gbx24_6Click(Sender: TObject);
    procedure gbx24_7Click(Sender: TObject);
    procedure gbx24_8Click(Sender: TObject);
    procedure gbx24_9Click(Sender: TObject);
    procedure gbx25_1Click(Sender: TObject);
    procedure gbx25_2Click(Sender: TObject);
    procedure gbx25_3Click(Sender: TObject);
    procedure gbx25_4Click(Sender: TObject);
    procedure gbx25_5Click(Sender: TObject);
    procedure gbx25_6Click(Sender: TObject);
    procedure gbx25_7Click(Sender: TObject);
    procedure gbx25_8Click(Sender: TObject);
    procedure gbx25_9Click(Sender: TObject);
    procedure gbx26_1Click(Sender: TObject);
    procedure gbx26_2Click(Sender: TObject);
    procedure gbx26_3Click(Sender: TObject);
    procedure gbx26_4Click(Sender: TObject);
    procedure gbx26_5Click(Sender: TObject);
    procedure gbx26_6Click(Sender: TObject);
    procedure gbx26_7Click(Sender: TObject);
    procedure gbx26_8Click(Sender: TObject);
    procedure gbx26_9Click(Sender: TObject);
    procedure gbx27_1Click(Sender: TObject);
    procedure gbx27_2Click(Sender: TObject);
    procedure gbx27_3Click(Sender: TObject);
    procedure gbx27_4Click(Sender: TObject);
    procedure gbx27_5Click(Sender: TObject);
    procedure gbx27_6Click(Sender: TObject);
    procedure gbx27_7Click(Sender: TObject);
    procedure gbx27_8Click(Sender: TObject);
    procedure gbx27_9Click(Sender: TObject);
    procedure gbx28_1Click(Sender: TObject);
    procedure gbx28_2Click(Sender: TObject);
    procedure gbx28_3Click(Sender: TObject);
    procedure gbx28_4Click(Sender: TObject);
    procedure gbx28_5Click(Sender: TObject);
    procedure gbx28_6Click(Sender: TObject);
    procedure gbx28_7Click(Sender: TObject);
    procedure gbx28_8Click(Sender: TObject);
    procedure gbx28_9Click(Sender: TObject);
    procedure gbx48_1Click(Sender: TObject);
    procedure gbx48_2Click(Sender: TObject);
    procedure gbx48_3Click(Sender: TObject);
    procedure gbx48_4Click(Sender: TObject);
    procedure gbx48_5Click(Sender: TObject);
    procedure gbx48_6Click(Sender: TObject);
    procedure gbx48_7Click(Sender: TObject);
    procedure gbx48_8Click(Sender: TObject);
    procedure gbx48_9Click(Sender: TObject);
    procedure gbx47_1Click(Sender: TObject);
    procedure gbx47_2Click(Sender: TObject);
    procedure gbx47_3Click(Sender: TObject);
    procedure gbx47_4Click(Sender: TObject);
    procedure gbx47_5Click(Sender: TObject);
    procedure gbx47_6Click(Sender: TObject);
    procedure gbx47_7Click(Sender: TObject);
    procedure gbx47_8Click(Sender: TObject);
    procedure gbx47_9Click(Sender: TObject);
    procedure gbx46_1Click(Sender: TObject);
    procedure gbx46_2Click(Sender: TObject);
    procedure gbx46_3Click(Sender: TObject);
    procedure gbx46_4Click(Sender: TObject);
    procedure gbx46_5Click(Sender: TObject);
    procedure gbx46_6Click(Sender: TObject);
    procedure gbx46_7Click(Sender: TObject);
    procedure gbx46_8Click(Sender: TObject);
    procedure gbx46_9Click(Sender: TObject);
    procedure gbx45_1Click(Sender: TObject);
    procedure gbx45_2Click(Sender: TObject);
    procedure gbx45_3Click(Sender: TObject);
    procedure gbx45_4Click(Sender: TObject);
    procedure gbx45_5Click(Sender: TObject);
    procedure gbx45_6Click(Sender: TObject);
    procedure gbx45_7Click(Sender: TObject);
    procedure gbx45_8Click(Sender: TObject);
    procedure gbx45_9Click(Sender: TObject);
    procedure gbx44_1Click(Sender: TObject);
    procedure gbx44_2Click(Sender: TObject);
    procedure gbx44_3Click(Sender: TObject);
    procedure gbx44_4Click(Sender: TObject);
    procedure gbx44_5Click(Sender: TObject);
    procedure gbx44_6Click(Sender: TObject);
    procedure gbx44_7Click(Sender: TObject);
    procedure gbx44_8Click(Sender: TObject);
    procedure gbx44_9Click(Sender: TObject);
    procedure gbx43_1Click(Sender: TObject);
    procedure gbx43_2Click(Sender: TObject);
    procedure gbx43_3Click(Sender: TObject);
    procedure gbx43_4Click(Sender: TObject);
    procedure gbx43_5Click(Sender: TObject);
    procedure gbx43_6Click(Sender: TObject);
    procedure gbx43_7Click(Sender: TObject);
    procedure gbx43_8Click(Sender: TObject);
    procedure gbx43_9Click(Sender: TObject);
    procedure gbx42_1Click(Sender: TObject);
    procedure gbx42_2Click(Sender: TObject);
    procedure gbx42_3Click(Sender: TObject);
    procedure gbx42_4Click(Sender: TObject);
    procedure gbx42_5Click(Sender: TObject);
    procedure gbx42_6Click(Sender: TObject);
    procedure gbx42_7Click(Sender: TObject);
    procedure gbx42_8Click(Sender: TObject);
    procedure gbx42_9Click(Sender: TObject);
    procedure gbx41_1Click(Sender: TObject);
    procedure gbx41_2Click(Sender: TObject);
    procedure gbx41_3Click(Sender: TObject);
    procedure gbx41_4Click(Sender: TObject);
    procedure gbx41_5Click(Sender: TObject);
    procedure gbx41_6Click(Sender: TObject);
    procedure gbx41_7Click(Sender: TObject);
    procedure gbx41_8Click(Sender: TObject);
    procedure gbx41_9Click(Sender: TObject);
    procedure gbx31_1Click(Sender: TObject);
    procedure gbx31_2Click(Sender: TObject);
    procedure gbx31_3Click(Sender: TObject);
    procedure gbx31_4Click(Sender: TObject);
    procedure gbx31_5Click(Sender: TObject);
    procedure gbx31_6Click(Sender: TObject);
    procedure gbx31_7Click(Sender: TObject);
    procedure gbx31_8Click(Sender: TObject);
    procedure gbx31_9Click(Sender: TObject);
    procedure gbx32_1Click(Sender: TObject);
    procedure gbx32_2Click(Sender: TObject);
    procedure gbx32_3Click(Sender: TObject);
    procedure gbx32_4Click(Sender: TObject);
    procedure gbx32_5Click(Sender: TObject);
    procedure gbx32_6Click(Sender: TObject);
    procedure gbx32_7Click(Sender: TObject);
    procedure gbx32_8Click(Sender: TObject);
    procedure gbx32_9Click(Sender: TObject);
    procedure gbx33_1Click(Sender: TObject);
    procedure gbx33_2Click(Sender: TObject);
    procedure gbx33_3Click(Sender: TObject);
    procedure gbx33_4Click(Sender: TObject);
    procedure gbx33_5Click(Sender: TObject);
    procedure gbx33_6Click(Sender: TObject);
    procedure gbx33_7Click(Sender: TObject);
    procedure gbx33_8Click(Sender: TObject);
    procedure gbx33_9Click(Sender: TObject);
    procedure gbx34_1Click(Sender: TObject);
    procedure gbx34_2Click(Sender: TObject);
    procedure gbx34_3Click(Sender: TObject);
    procedure gbx34_4Click(Sender: TObject);
    procedure gbx34_5Click(Sender: TObject);
    procedure gbx34_6Click(Sender: TObject);
    procedure gbx34_7Click(Sender: TObject);
    procedure gbx34_8Click(Sender: TObject);
    procedure gbx34_9Click(Sender: TObject);
    procedure gbx35_1Click(Sender: TObject);
    procedure gbx35_2Click(Sender: TObject);
    procedure gbx35_3Click(Sender: TObject);
    procedure gbx35_4Click(Sender: TObject);
    procedure gbx35_5Click(Sender: TObject);
    procedure gbx35_6Click(Sender: TObject);
    procedure gbx35_7Click(Sender: TObject);
    procedure gbx35_8Click(Sender: TObject);
    procedure gbx35_9Click(Sender: TObject);
    procedure gbx36_1Click(Sender: TObject);
    procedure gbx36_2Click(Sender: TObject);
    procedure gbx36_3Click(Sender: TObject);
    procedure gbx36_4Click(Sender: TObject);
    procedure gbx36_5Click(Sender: TObject);
    procedure gbx36_6Click(Sender: TObject);
    procedure gbx36_7Click(Sender: TObject);
    procedure gbx36_8Click(Sender: TObject);
    procedure gbx36_9Click(Sender: TObject);
    procedure gbx37_1Click(Sender: TObject);
    procedure gbx37_2Click(Sender: TObject);
    procedure gbx37_3Click(Sender: TObject);
    procedure gbx37_4Click(Sender: TObject);
    procedure gbx37_5Click(Sender: TObject);
    procedure gbx37_6Click(Sender: TObject);
    procedure gbx37_7Click(Sender: TObject);
    procedure gbx37_8Click(Sender: TObject);
    procedure gbx37_9Click(Sender: TObject);
    procedure gbx38_1Click(Sender: TObject);
    procedure gbx38_2Click(Sender: TObject);
    procedure gbx38_3Click(Sender: TObject);
    procedure gbx38_4Click(Sender: TObject);
    procedure gbx38_5Click(Sender: TObject);
    procedure gbx38_6Click(Sender: TObject);
    procedure gbx38_7Click(Sender: TObject);
    procedure gbx38_8Click(Sender: TObject);
    procedure gbx38_9Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure rbt2Click(Sender: TObject);
    procedure rbt1Click(Sender: TObject);
    procedure rbt3Click(Sender: TObject);
    procedure rbt4Click(Sender: TObject);
    procedure rbt5Click(Sender: TObject);
    procedure rbt6Click(Sender: TObject);
    procedure rbt7Click(Sender: TObject);
    procedure rbt8Click(Sender: TObject);
    procedure rbt9Click(Sender: TObject);
    procedure rbt10Click(Sender: TObject);
    procedure rbt11Click(Sender: TObject);
    procedure rbt12Click(Sender: TObject);
    procedure rbt13Click(Sender: TObject);
    procedure rbt14Click(Sender: TObject);
    procedure rbt15Click(Sender: TObject);
    procedure sbtCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vTipo : Integer;
    vSQLOdontograma, vMsg  : string;
    procedure InsertUpdateDelete;
    procedure InsertUpdateDelete2(pTipo : Integer);
    procedure ParametrosCad;
    function SelecinaLegenda : TColor;
  end;

var
  frmOdontograma: TfrmOdontograma;

implementation

{$R *.dfm}

uses untDM, untRotinas;

procedure TfrmOdontograma.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    DM.sdsLegenda.Close;
    DM.sdsOdontograma.Close;
end;

procedure TfrmOdontograma.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #27 then
      Close;
end;

procedure TfrmOdontograma.FormShow(Sender: TObject);
begin

    with DM do begin
      try
        TRANSACAO.TransactionID  := NewTransactionID;
        TRANSACAO.IsolationLevel := xilREADCOMMITTED;
        with sdsOdontograma do begin
          Close;
          DataSet.CommandText := ' select * from ODO00 '+
                                 ' where NU_CLIENTE = '+IntToStr(sdsClienteINDICE.AsInteger);
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

    if DM.sdsOdontograma.RecordCount > 0 then begin

      gbx18_1.Color := StringToColor(DM.sdsOdontogramaDENTE18_1.AsString);
      gbx18_2.Color := StringToColor(DM.sdsOdontogramaDENTE18_2.AsString);
      gbx18_3.Color := StringToColor(DM.sdsOdontogramaDENTE18_3.AsString);
      gbx18_4.Color := StringToColor(DM.sdsOdontogramaDENTE18_4.AsString);
      gbx18_5.Color := StringToColor(DM.sdsOdontogramaDENTE18_5.AsString);
      gbx18_6.Color := StringToColor(DM.sdsOdontogramaDENTE18_6.AsString);
      gbx18_7.Color := StringToColor(DM.sdsOdontogramaDENTE18_7.AsString);
      gbx18_8.Color := StringToColor(DM.sdsOdontogramaDENTE18_8.AsString);
      gbx18_9.Color := StringToColor(DM.sdsOdontogramaDENTE18_9.AsString);
      gbx17_1.Color := StringToColor(DM.sdsOdontogramaDENTE17_1.AsString);
      gbx17_2.Color := StringToColor(DM.sdsOdontogramaDENTE17_2.AsString);
      gbx17_3.Color := StringToColor(DM.sdsOdontogramaDENTE17_3.AsString);
      gbx17_4.Color := StringToColor(DM.sdsOdontogramaDENTE17_4.AsString);
      gbx17_5.Color := StringToColor(DM.sdsOdontogramaDENTE17_5.AsString);
      gbx17_6.Color := StringToColor(DM.sdsOdontogramaDENTE17_6.AsString);
      gbx17_7.Color := StringToColor(DM.sdsOdontogramaDENTE17_7.AsString);
      gbx17_8.Color := StringToColor(DM.sdsOdontogramaDENTE17_8.AsString);
      gbx17_9.Color := StringToColor(DM.sdsOdontogramaDENTE17_9.AsString);
      gbx16_1.Color := StringToColor(DM.sdsOdontogramaDENTE16_1.AsString);
      gbx16_2.Color := StringToColor(DM.sdsOdontogramaDENTE16_2.AsString);
      gbx16_3.Color := StringToColor(DM.sdsOdontogramaDENTE16_3.AsString);
      gbx16_4.Color := StringToColor(DM.sdsOdontogramaDENTE16_4.AsString);
      gbx16_5.Color := StringToColor(DM.sdsOdontogramaDENTE16_5.AsString);
      gbx16_6.Color := StringToColor(DM.sdsOdontogramaDENTE16_6.AsString);
      gbx16_7.Color := StringToColor(DM.sdsOdontogramaDENTE16_7.AsString);
      gbx16_8.Color := StringToColor(DM.sdsOdontogramaDENTE16_8.AsString);
      gbx16_9.Color := StringToColor(DM.sdsOdontogramaDENTE16_9.AsString);
      gbx15_1.Color := StringToColor(DM.sdsOdontogramaDENTE15_1.AsString);
      gbx15_2.Color := StringToColor(DM.sdsOdontogramaDENTE15_2.AsString);
      gbx15_3.Color := StringToColor(DM.sdsOdontogramaDENTE15_3.AsString);
      gbx15_4.Color := StringToColor(DM.sdsOdontogramaDENTE15_4.AsString);
      gbx15_5.Color := StringToColor(DM.sdsOdontogramaDENTE15_5.AsString);
      gbx15_6.Color := StringToColor(DM.sdsOdontogramaDENTE15_6.AsString);
      gbx15_7.Color := StringToColor(DM.sdsOdontogramaDENTE15_7.AsString);
      gbx15_8.Color := StringToColor(DM.sdsOdontogramaDENTE15_8.AsString);
      gbx15_9.Color := StringToColor(DM.sdsOdontogramaDENTE15_9.AsString);
      gbx14_1.Color := StringToColor(DM.sdsOdontogramaDENTE14_1.AsString);
      gbx14_2.Color := StringToColor(DM.sdsOdontogramaDENTE14_2.AsString);
      gbx14_3.Color := StringToColor(DM.sdsOdontogramaDENTE14_3.AsString);
      gbx14_4.Color := StringToColor(DM.sdsOdontogramaDENTE14_4.AsString);
      gbx14_5.Color := StringToColor(DM.sdsOdontogramaDENTE14_5.AsString);
      gbx14_6.Color := StringToColor(DM.sdsOdontogramaDENTE14_6.AsString);
      gbx14_7.Color := StringToColor(DM.sdsOdontogramaDENTE14_7.AsString);
      gbx14_8.Color := StringToColor(DM.sdsOdontogramaDENTE14_8.AsString);
      gbx14_9.Color := StringToColor(DM.sdsOdontogramaDENTE14_9.AsString);
      gbx13_1.Color := StringToColor(DM.sdsOdontogramaDENTE13_1.AsString);
      gbx13_2.Color := StringToColor(DM.sdsOdontogramaDENTE13_2.AsString);
      gbx13_3.Color := StringToColor(DM.sdsOdontogramaDENTE13_3.AsString);
      gbx13_4.Color := StringToColor(DM.sdsOdontogramaDENTE13_4.AsString);
      gbx13_5.Color := StringToColor(DM.sdsOdontogramaDENTE13_5.AsString);
      gbx13_6.Color := StringToColor(DM.sdsOdontogramaDENTE13_6.AsString);
      gbx13_7.Color := StringToColor(DM.sdsOdontogramaDENTE13_7.AsString);
      gbx13_8.Color := StringToColor(DM.sdsOdontogramaDENTE13_8.AsString);
      gbx13_9.Color := StringToColor(DM.sdsOdontogramaDENTE13_9.AsString);
      gbx12_1.Color := StringToColor(DM.sdsOdontogramaDENTE12_1.AsString);
      gbx12_2.Color := StringToColor(DM.sdsOdontogramaDENTE12_2.AsString);
      gbx12_3.Color := StringToColor(DM.sdsOdontogramaDENTE12_3.AsString);
      gbx12_4.Color := StringToColor(DM.sdsOdontogramaDENTE12_4.AsString);
      gbx12_5.Color := StringToColor(DM.sdsOdontogramaDENTE12_5.AsString);
      gbx12_6.Color := StringToColor(DM.sdsOdontogramaDENTE12_6.AsString);
      gbx12_7.Color := StringToColor(DM.sdsOdontogramaDENTE12_7.AsString);
      gbx12_8.Color := StringToColor(DM.sdsOdontogramaDENTE12_8.AsString);
      gbx12_9.Color := StringToColor(DM.sdsOdontogramaDENTE12_9.AsString);
      gbx11_1.Color := StringToColor(DM.sdsOdontogramaDENTE11_1.AsString);
      gbx11_2.Color := StringToColor(DM.sdsOdontogramaDENTE11_2.AsString);
      gbx11_3.Color := StringToColor(DM.sdsOdontogramaDENTE11_3.AsString);
      gbx11_4.Color := StringToColor(DM.sdsOdontogramaDENTE11_4.AsString);
      gbx11_5.Color := StringToColor(DM.sdsOdontogramaDENTE11_5.AsString);
      gbx11_6.Color := StringToColor(DM.sdsOdontogramaDENTE11_6.AsString);
      gbx11_7.Color := StringToColor(DM.sdsOdontogramaDENTE11_7.AsString);
      gbx11_8.Color := StringToColor(DM.sdsOdontogramaDENTE11_8.AsString);
      gbx11_9.Color := StringToColor(DM.sdsOdontogramaDENTE11_9.AsString);

      gbx28_1.Color := StringToColor(DM.sdsOdontogramaDENTE28_1.AsString);
      gbx28_2.Color := StringToColor(DM.sdsOdontogramaDENTE28_2.AsString);
      gbx28_3.Color := StringToColor(DM.sdsOdontogramaDENTE28_3.AsString);
      gbx28_4.Color := StringToColor(DM.sdsOdontogramaDENTE28_4.AsString);
      gbx28_5.Color := StringToColor(DM.sdsOdontogramaDENTE28_5.AsString);
      gbx28_6.Color := StringToColor(DM.sdsOdontogramaDENTE28_6.AsString);
      gbx28_7.Color := StringToColor(DM.sdsOdontogramaDENTE28_7.AsString);
      gbx28_8.Color := StringToColor(DM.sdsOdontogramaDENTE28_8.AsString);
      gbx28_9.Color := StringToColor(DM.sdsOdontogramaDENTE28_9.AsString);
      gbx27_1.Color := StringToColor(DM.sdsOdontogramaDENTE27_1.AsString);
      gbx27_2.Color := StringToColor(DM.sdsOdontogramaDENTE27_2.AsString);
      gbx27_3.Color := StringToColor(DM.sdsOdontogramaDENTE27_3.AsString);
      gbx27_4.Color := StringToColor(DM.sdsOdontogramaDENTE27_4.AsString);
      gbx27_5.Color := StringToColor(DM.sdsOdontogramaDENTE27_5.AsString);
      gbx27_6.Color := StringToColor(DM.sdsOdontogramaDENTE27_6.AsString);
      gbx27_7.Color := StringToColor(DM.sdsOdontogramaDENTE27_7.AsString);
      gbx27_8.Color := StringToColor(DM.sdsOdontogramaDENTE27_8.AsString);
      gbx27_9.Color := StringToColor(DM.sdsOdontogramaDENTE27_9.AsString);
      gbx26_1.Color := StringToColor(DM.sdsOdontogramaDENTE26_1.AsString);
      gbx26_2.Color := StringToColor(DM.sdsOdontogramaDENTE26_2.AsString);
      gbx26_3.Color := StringToColor(DM.sdsOdontogramaDENTE26_3.AsString);
      gbx26_4.Color := StringToColor(DM.sdsOdontogramaDENTE26_4.AsString);
      gbx26_5.Color := StringToColor(DM.sdsOdontogramaDENTE26_5.AsString);
      gbx26_6.Color := StringToColor(DM.sdsOdontogramaDENTE26_6.AsString);
      gbx26_7.Color := StringToColor(DM.sdsOdontogramaDENTE26_7.AsString);
      gbx26_8.Color := StringToColor(DM.sdsOdontogramaDENTE26_8.AsString);
      gbx26_9.Color := StringToColor(DM.sdsOdontogramaDENTE26_9.AsString);
      gbx25_1.Color := StringToColor(DM.sdsOdontogramaDENTE25_1.AsString);
      gbx25_2.Color := StringToColor(DM.sdsOdontogramaDENTE25_2.AsString);
      gbx25_3.Color := StringToColor(DM.sdsOdontogramaDENTE25_3.AsString);
      gbx25_4.Color := StringToColor(DM.sdsOdontogramaDENTE25_4.AsString);
      gbx25_5.Color := StringToColor(DM.sdsOdontogramaDENTE25_5.AsString);
      gbx25_6.Color := StringToColor(DM.sdsOdontogramaDENTE25_6.AsString);
      gbx25_7.Color := StringToColor(DM.sdsOdontogramaDENTE25_7.AsString);
      gbx25_8.Color := StringToColor(DM.sdsOdontogramaDENTE25_8.AsString);
      gbx25_9.Color := StringToColor(DM.sdsOdontogramaDENTE25_9.AsString);
      gbx24_1.Color := StringToColor(DM.sdsOdontogramaDENTE24_1.AsString);
      gbx24_2.Color := StringToColor(DM.sdsOdontogramaDENTE24_2.AsString);
      gbx24_3.Color := StringToColor(DM.sdsOdontogramaDENTE24_3.AsString);
      gbx24_4.Color := StringToColor(DM.sdsOdontogramaDENTE24_4.AsString);
      gbx24_5.Color := StringToColor(DM.sdsOdontogramaDENTE24_5.AsString);
      gbx24_6.Color := StringToColor(DM.sdsOdontogramaDENTE24_6.AsString);
      gbx24_7.Color := StringToColor(DM.sdsOdontogramaDENTE24_7.AsString);
      gbx24_8.Color := StringToColor(DM.sdsOdontogramaDENTE24_8.AsString);
      gbx24_9.Color := StringToColor(DM.sdsOdontogramaDENTE24_9.AsString);
      gbx23_1.Color := StringToColor(DM.sdsOdontogramaDENTE23_1.AsString);
      gbx23_2.Color := StringToColor(DM.sdsOdontogramaDENTE23_2.AsString);
      gbx23_3.Color := StringToColor(DM.sdsOdontogramaDENTE23_3.AsString);
      gbx23_4.Color := StringToColor(DM.sdsOdontogramaDENTE23_4.AsString);
      gbx23_5.Color := StringToColor(DM.sdsOdontogramaDENTE23_5.AsString);
      gbx23_6.Color := StringToColor(DM.sdsOdontogramaDENTE23_6.AsString);
      gbx23_7.Color := StringToColor(DM.sdsOdontogramaDENTE23_7.AsString);
      gbx23_8.Color := StringToColor(DM.sdsOdontogramaDENTE23_8.AsString);
      gbx23_9.Color := StringToColor(DM.sdsOdontogramaDENTE23_9.AsString);
      gbx22_1.Color := StringToColor(DM.sdsOdontogramaDENTE22_1.AsString);
      gbx22_2.Color := StringToColor(DM.sdsOdontogramaDENTE22_2.AsString);
      gbx22_3.Color := StringToColor(DM.sdsOdontogramaDENTE22_3.AsString);
      gbx22_4.Color := StringToColor(DM.sdsOdontogramaDENTE22_4.AsString);
      gbx22_5.Color := StringToColor(DM.sdsOdontogramaDENTE22_5.AsString);
      gbx22_6.Color := StringToColor(DM.sdsOdontogramaDENTE22_6.AsString);
      gbx22_7.Color := StringToColor(DM.sdsOdontogramaDENTE22_7.AsString);
      gbx22_8.Color := StringToColor(DM.sdsOdontogramaDENTE22_8.AsString);
      gbx22_9.Color := StringToColor(DM.sdsOdontogramaDENTE22_9.AsString);
      gbx21_1.Color := StringToColor(DM.sdsOdontogramaDENTE21_1.AsString);
      gbx21_2.Color := StringToColor(DM.sdsOdontogramaDENTE21_2.AsString);
      gbx21_3.Color := StringToColor(DM.sdsOdontogramaDENTE21_3.AsString);
      gbx21_4.Color := StringToColor(DM.sdsOdontogramaDENTE21_4.AsString);
      gbx21_5.Color := StringToColor(DM.sdsOdontogramaDENTE21_5.AsString);
      gbx21_6.Color := StringToColor(DM.sdsOdontogramaDENTE21_6.AsString);
      gbx21_7.Color := StringToColor(DM.sdsOdontogramaDENTE21_7.AsString);
      gbx21_8.Color := StringToColor(DM.sdsOdontogramaDENTE21_8.AsString);
      gbx21_9.Color := StringToColor(DM.sdsOdontogramaDENTE21_9.AsString);

      gbx38_1.Color := StringToColor(DM.sdsOdontogramaDENTE38_1.AsString);
      gbx38_2.Color := StringToColor(DM.sdsOdontogramaDENTE38_2.AsString);
      gbx38_3.Color := StringToColor(DM.sdsOdontogramaDENTE38_3.AsString);
      gbx38_4.Color := StringToColor(DM.sdsOdontogramaDENTE38_4.AsString);
      gbx38_5.Color := StringToColor(DM.sdsOdontogramaDENTE38_5.AsString);
      gbx38_6.Color := StringToColor(DM.sdsOdontogramaDENTE38_6.AsString);
      gbx38_7.Color := StringToColor(DM.sdsOdontogramaDENTE38_7.AsString);
      gbx38_8.Color := StringToColor(DM.sdsOdontogramaDENTE38_8.AsString);
      gbx38_9.Color := StringToColor(DM.sdsOdontogramaDENTE38_9.AsString);
      gbx37_1.Color := StringToColor(DM.sdsOdontogramaDENTE37_1.AsString);
      gbx37_2.Color := StringToColor(DM.sdsOdontogramaDENTE37_2.AsString);
      gbx37_3.Color := StringToColor(DM.sdsOdontogramaDENTE37_3.AsString);
      gbx37_4.Color := StringToColor(DM.sdsOdontogramaDENTE37_4.AsString);
      gbx37_5.Color := StringToColor(DM.sdsOdontogramaDENTE37_5.AsString);
      gbx37_6.Color := StringToColor(DM.sdsOdontogramaDENTE37_6.AsString);
      gbx37_7.Color := StringToColor(DM.sdsOdontogramaDENTE37_7.AsString);
      gbx37_8.Color := StringToColor(DM.sdsOdontogramaDENTE37_8.AsString);
      gbx37_9.Color := StringToColor(DM.sdsOdontogramaDENTE37_9.AsString);
      gbx36_1.Color := StringToColor(DM.sdsOdontogramaDENTE36_1.AsString);
      gbx36_2.Color := StringToColor(DM.sdsOdontogramaDENTE36_2.AsString);
      gbx36_3.Color := StringToColor(DM.sdsOdontogramaDENTE36_3.AsString);
      gbx36_4.Color := StringToColor(DM.sdsOdontogramaDENTE36_4.AsString);
      gbx36_5.Color := StringToColor(DM.sdsOdontogramaDENTE36_5.AsString);
      gbx36_6.Color := StringToColor(DM.sdsOdontogramaDENTE36_6.AsString);
      gbx36_7.Color := StringToColor(DM.sdsOdontogramaDENTE36_7.AsString);
      gbx36_8.Color := StringToColor(DM.sdsOdontogramaDENTE36_8.AsString);
      gbx36_9.Color := StringToColor(DM.sdsOdontogramaDENTE36_9.AsString);
      gbx35_1.Color := StringToColor(DM.sdsOdontogramaDENTE35_1.AsString);
      gbx35_2.Color := StringToColor(DM.sdsOdontogramaDENTE35_2.AsString);
      gbx35_3.Color := StringToColor(DM.sdsOdontogramaDENTE35_3.AsString);
      gbx35_4.Color := StringToColor(DM.sdsOdontogramaDENTE35_4.AsString);
      gbx35_5.Color := StringToColor(DM.sdsOdontogramaDENTE35_5.AsString);
      gbx35_6.Color := StringToColor(DM.sdsOdontogramaDENTE35_6.AsString);
      gbx35_7.Color := StringToColor(DM.sdsOdontogramaDENTE35_7.AsString);
      gbx35_8.Color := StringToColor(DM.sdsOdontogramaDENTE35_8.AsString);
      gbx35_9.Color := StringToColor(DM.sdsOdontogramaDENTE35_9.AsString);
      gbx34_1.Color := StringToColor(DM.sdsOdontogramaDENTE34_1.AsString);
      gbx34_2.Color := StringToColor(DM.sdsOdontogramaDENTE34_2.AsString);
      gbx34_3.Color := StringToColor(DM.sdsOdontogramaDENTE34_3.AsString);
      gbx34_4.Color := StringToColor(DM.sdsOdontogramaDENTE34_4.AsString);
      gbx34_5.Color := StringToColor(DM.sdsOdontogramaDENTE34_5.AsString);
      gbx34_6.Color := StringToColor(DM.sdsOdontogramaDENTE34_6.AsString);
      gbx34_7.Color := StringToColor(DM.sdsOdontogramaDENTE34_7.AsString);
      gbx34_8.Color := StringToColor(DM.sdsOdontogramaDENTE34_8.AsString);
      gbx34_9.Color := StringToColor(DM.sdsOdontogramaDENTE34_9.AsString);
      gbx33_1.Color := StringToColor(DM.sdsOdontogramaDENTE33_1.AsString);
      gbx33_2.Color := StringToColor(DM.sdsOdontogramaDENTE33_2.AsString);
      gbx33_3.Color := StringToColor(DM.sdsOdontogramaDENTE33_3.AsString);
      gbx33_4.Color := StringToColor(DM.sdsOdontogramaDENTE33_4.AsString);
      gbx33_5.Color := StringToColor(DM.sdsOdontogramaDENTE33_5.AsString);
      gbx33_6.Color := StringToColor(DM.sdsOdontogramaDENTE33_6.AsString);
      gbx33_7.Color := StringToColor(DM.sdsOdontogramaDENTE33_7.AsString);
      gbx33_8.Color := StringToColor(DM.sdsOdontogramaDENTE33_8.AsString);
      gbx33_9.Color := StringToColor(DM.sdsOdontogramaDENTE33_9.AsString);
      gbx32_1.Color := StringToColor(DM.sdsOdontogramaDENTE32_1.AsString);
      gbx32_2.Color := StringToColor(DM.sdsOdontogramaDENTE32_2.AsString);
      gbx32_3.Color := StringToColor(DM.sdsOdontogramaDENTE32_3.AsString);
      gbx32_4.Color := StringToColor(DM.sdsOdontogramaDENTE32_4.AsString);
      gbx32_5.Color := StringToColor(DM.sdsOdontogramaDENTE32_5.AsString);
      gbx32_6.Color := StringToColor(DM.sdsOdontogramaDENTE32_6.AsString);
      gbx32_7.Color := StringToColor(DM.sdsOdontogramaDENTE32_7.AsString);
      gbx32_8.Color := StringToColor(DM.sdsOdontogramaDENTE32_8.AsString);
      gbx32_9.Color := StringToColor(DM.sdsOdontogramaDENTE32_9.AsString);
      gbx31_1.Color := StringToColor(DM.sdsOdontogramaDENTE31_1.AsString);
      gbx31_2.Color := StringToColor(DM.sdsOdontogramaDENTE31_2.AsString);
      gbx31_3.Color := StringToColor(DM.sdsOdontogramaDENTE31_3.AsString);
      gbx31_4.Color := StringToColor(DM.sdsOdontogramaDENTE31_4.AsString);
      gbx31_5.Color := StringToColor(DM.sdsOdontogramaDENTE31_5.AsString);
      gbx31_6.Color := StringToColor(DM.sdsOdontogramaDENTE31_6.AsString);
      gbx31_7.Color := StringToColor(DM.sdsOdontogramaDENTE31_7.AsString);
      gbx31_8.Color := StringToColor(DM.sdsOdontogramaDENTE31_8.AsString);
      gbx31_9.Color := StringToColor(DM.sdsOdontogramaDENTE31_9.AsString);

      gbx48_1.Color := StringToColor(DM.sdsOdontogramaDENTE48_1.AsString);
      gbx48_2.Color := StringToColor(DM.sdsOdontogramaDENTE48_2.AsString);
      gbx48_3.Color := StringToColor(DM.sdsOdontogramaDENTE48_3.AsString);
      gbx48_4.Color := StringToColor(DM.sdsOdontogramaDENTE48_4.AsString);
      gbx48_5.Color := StringToColor(DM.sdsOdontogramaDENTE48_5.AsString);
      gbx48_6.Color := StringToColor(DM.sdsOdontogramaDENTE48_6.AsString);
      gbx48_7.Color := StringToColor(DM.sdsOdontogramaDENTE48_7.AsString);
      gbx48_8.Color := StringToColor(DM.sdsOdontogramaDENTE48_8.AsString);
      gbx48_9.Color := StringToColor(DM.sdsOdontogramaDENTE48_9.AsString);
      gbx47_1.Color := StringToColor(DM.sdsOdontogramaDENTE47_1.AsString);
      gbx47_2.Color := StringToColor(DM.sdsOdontogramaDENTE47_2.AsString);
      gbx47_3.Color := StringToColor(DM.sdsOdontogramaDENTE47_3.AsString);
      gbx47_4.Color := StringToColor(DM.sdsOdontogramaDENTE47_4.AsString);
      gbx47_5.Color := StringToColor(DM.sdsOdontogramaDENTE47_5.AsString);
      gbx47_6.Color := StringToColor(DM.sdsOdontogramaDENTE47_6.AsString);
      gbx47_7.Color := StringToColor(DM.sdsOdontogramaDENTE47_7.AsString);
      gbx47_8.Color := StringToColor(DM.sdsOdontogramaDENTE47_8.AsString);
      gbx47_9.Color := StringToColor(DM.sdsOdontogramaDENTE47_9.AsString);
      gbx46_1.Color := StringToColor(DM.sdsOdontogramaDENTE46_1.AsString);
      gbx46_2.Color := StringToColor(DM.sdsOdontogramaDENTE46_2.AsString);
      gbx46_3.Color := StringToColor(DM.sdsOdontogramaDENTE46_3.AsString);
      gbx46_4.Color := StringToColor(DM.sdsOdontogramaDENTE46_4.AsString);
      gbx46_5.Color := StringToColor(DM.sdsOdontogramaDENTE46_5.AsString);
      gbx46_6.Color := StringToColor(DM.sdsOdontogramaDENTE46_6.AsString);
      gbx46_7.Color := StringToColor(DM.sdsOdontogramaDENTE46_7.AsString);
      gbx46_8.Color := StringToColor(DM.sdsOdontogramaDENTE46_8.AsString);
      gbx46_9.Color := StringToColor(DM.sdsOdontogramaDENTE46_9.AsString);
      gbx45_1.Color := StringToColor(DM.sdsOdontogramaDENTE45_1.AsString);
      gbx45_2.Color := StringToColor(DM.sdsOdontogramaDENTE45_2.AsString);
      gbx45_3.Color := StringToColor(DM.sdsOdontogramaDENTE45_3.AsString);
      gbx45_4.Color := StringToColor(DM.sdsOdontogramaDENTE45_4.AsString);
      gbx45_5.Color := StringToColor(DM.sdsOdontogramaDENTE45_5.AsString);
      gbx45_6.Color := StringToColor(DM.sdsOdontogramaDENTE45_6.AsString);
      gbx45_7.Color := StringToColor(DM.sdsOdontogramaDENTE45_7.AsString);
      gbx45_8.Color := StringToColor(DM.sdsOdontogramaDENTE45_8.AsString);
      gbx45_9.Color := StringToColor(DM.sdsOdontogramaDENTE45_9.AsString);
      gbx44_1.Color := StringToColor(DM.sdsOdontogramaDENTE44_1.AsString);
      gbx44_2.Color := StringToColor(DM.sdsOdontogramaDENTE44_2.AsString);
      gbx44_3.Color := StringToColor(DM.sdsOdontogramaDENTE44_3.AsString);
      gbx44_4.Color := StringToColor(DM.sdsOdontogramaDENTE44_4.AsString);
      gbx44_5.Color := StringToColor(DM.sdsOdontogramaDENTE44_5.AsString);
      gbx44_6.Color := StringToColor(DM.sdsOdontogramaDENTE44_6.AsString);
      gbx44_7.Color := StringToColor(DM.sdsOdontogramaDENTE44_7.AsString);
      gbx44_8.Color := StringToColor(DM.sdsOdontogramaDENTE44_8.AsString);
      gbx44_9.Color := StringToColor(DM.sdsOdontogramaDENTE44_9.AsString);
      gbx43_1.Color := StringToColor(DM.sdsOdontogramaDENTE43_1.AsString);
      gbx43_2.Color := StringToColor(DM.sdsOdontogramaDENTE43_2.AsString);
      gbx43_3.Color := StringToColor(DM.sdsOdontogramaDENTE43_3.AsString);
      gbx43_4.Color := StringToColor(DM.sdsOdontogramaDENTE43_4.AsString);
      gbx43_5.Color := StringToColor(DM.sdsOdontogramaDENTE43_5.AsString);
      gbx43_6.Color := StringToColor(DM.sdsOdontogramaDENTE43_6.AsString);
      gbx43_7.Color := StringToColor(DM.sdsOdontogramaDENTE43_7.AsString);
      gbx43_8.Color := StringToColor(DM.sdsOdontogramaDENTE43_8.AsString);
      gbx43_9.Color := StringToColor(DM.sdsOdontogramaDENTE43_9.AsString);
      gbx42_1.Color := StringToColor(DM.sdsOdontogramaDENTE42_1.AsString);
      gbx42_2.Color := StringToColor(DM.sdsOdontogramaDENTE42_2.AsString);
      gbx42_3.Color := StringToColor(DM.sdsOdontogramaDENTE42_3.AsString);
      gbx42_4.Color := StringToColor(DM.sdsOdontogramaDENTE42_4.AsString);
      gbx42_5.Color := StringToColor(DM.sdsOdontogramaDENTE42_5.AsString);
      gbx42_6.Color := StringToColor(DM.sdsOdontogramaDENTE42_6.AsString);
      gbx42_7.Color := StringToColor(DM.sdsOdontogramaDENTE42_7.AsString);
      gbx42_8.Color := StringToColor(DM.sdsOdontogramaDENTE42_8.AsString);
      gbx42_9.Color := StringToColor(DM.sdsOdontogramaDENTE42_9.AsString);
      gbx41_1.Color := StringToColor(DM.sdsOdontogramaDENTE41_1.AsString);
      gbx41_2.Color := StringToColor(DM.sdsOdontogramaDENTE41_2.AsString);
      gbx41_3.Color := StringToColor(DM.sdsOdontogramaDENTE41_3.AsString);
      gbx41_4.Color := StringToColor(DM.sdsOdontogramaDENTE41_4.AsString);
      gbx41_5.Color := StringToColor(DM.sdsOdontogramaDENTE41_5.AsString);
      gbx41_6.Color := StringToColor(DM.sdsOdontogramaDENTE41_6.AsString);
      gbx41_7.Color := StringToColor(DM.sdsOdontogramaDENTE41_7.AsString);
      gbx41_8.Color := StringToColor(DM.sdsOdontogramaDENTE41_8.AsString);
      gbx41_9.Color := StringToColor(DM.sdsOdontogramaDENTE41_9.AsString);
    end;

    DM.sdsLegenda01.Close;
    DM.sdsLegenda02.Close;
    DM.sdsLegenda03.Close;
    DM.sdsLegenda04.Close;
    DM.sdsLegenda05.Close;
    DM.sdsLegenda06.Close;
    DM.sdsLegenda07.Close;
    DM.sdsLegenda08.Close;
    DM.sdsLegenda09.Close;
    DM.sdsLegenda10.Close;
    DM.sdsLegenda11.Close;
    DM.sdsLegenda12.Close;
    DM.sdsLegenda13.Close;
    DM.sdsLegenda14.Close;
    DM.sdsLegenda15.Close;

    DM.sdsLegenda01.Open;
    DM.sdsLegenda02.Open;
    DM.sdsLegenda03.Open;
    DM.sdsLegenda04.Open;
    DM.sdsLegenda05.Open;
    DM.sdsLegenda06.Open;
    DM.sdsLegenda07.Open;
    DM.sdsLegenda08.Open;
    DM.sdsLegenda09.Open;
    DM.sdsLegenda10.Open;
    DM.sdsLegenda11.Open;
    DM.sdsLegenda12.Open;
    DM.sdsLegenda13.Open;
    DM.sdsLegenda14.Open;
    DM.sdsLegenda15.Open;

    with DM do begin
      try
        TRANSACAO.TransactionID  := NewTransactionID;
        TRANSACAO.IsolationLevel := xilREADCOMMITTED;
        with sdsProcedimento do begin
          Close;
          DataSet.CommandText := ' select * from PCT00 order by PROCEDIMENTO ';
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

    with DM do begin
      try
        TRANSACAO.TransactionID  := NewTransactionID;
        TRANSACAO.IsolationLevel := xilREADCOMMITTED;
        with sdsLegenda do begin
          Close;
          DataSet.CommandText := ' select * from ODO01 '+
                                 ' where NU_CLIENTE = '+IntToStr(sdsClienteINDICE.AsInteger);
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

    if DM.sdsLegenda.RecordCount > 0 then begin
      clbLegenda1.Selected  := StringToColor(DM.sdsLegendaCOR1.AsString);
      dblLeg1.KeyValue      := DM.sdsLegendaDESC1.AsInteger;
      clbLegenda2.Selected  := StringToColor(DM.sdsLegendaCOR2.AsString);
      dblLeg2.KeyValue      := DM.sdsLegendaDESC2.AsInteger;
      clbLegenda3.Selected  := StringToColor(DM.sdsLegendaCOR3.AsString);
      dblLeg3.KeyValue      := DM.sdsLegendaDESC3.AsInteger;
      clbLegenda4.Selected  := StringToColor(DM.sdsLegendaCOR4.AsString);
      dblLeg4.KeyValue      := DM.sdsLegendaDESC4.AsInteger;
      clbLegenda5.Selected  := StringToColor(DM.sdsLegendaCOR5.AsString);
      dblLeg5.KeyValue      := DM.sdsLegendaDESC5.AsInteger;
      clbLegenda6.Selected  := StringToColor(DM.sdsLegendaCOR6.AsString);
      dblLeg6.KeyValue      := DM.sdsLegendaDESC6.AsInteger;
      clbLegenda7.Selected  := StringToColor(DM.sdsLegendaCOR7.AsString);
      dblLeg7.KeyValue      := DM.sdsLegendaDESC7.AsInteger;
      clbLegenda8.Selected  := StringToColor(DM.sdsLegendaCOR8.AsString);
      dblLeg8.KeyValue      := DM.sdsLegendaDESC8.AsInteger;
      clbLegenda9.Selected  := StringToColor(DM.sdsLegendaCOR9.AsString);
      dblLeg9.KeyValue      := DM.sdsLegendaDESC9.AsInteger;
      clbLegenda10.Selected := StringToColor(DM.sdsLegendaCOR10.AsString);
      dblLeg10.KeyValue     := DM.sdsLegendaDESC10.AsInteger;
      clbLegenda11.Selected := StringToColor(DM.sdsLegendaCOR11.AsString);
      dblLeg11.KeyValue     := DM.sdsLegendaDESC11.AsInteger;
      clbLegenda12.Selected := StringToColor(DM.sdsLegendaCOR12.AsString);
      dblLeg12.KeyValue     := DM.sdsLegendaDESC12.AsInteger;
      clbLegenda13.Selected := StringToColor(DM.sdsLegendaCOR13.AsString);
      dblLeg13.KeyValue     := DM.sdsLegendaDESC13.AsInteger;
      clbLegenda14.Selected := StringToColor(DM.sdsLegendaCOR14.AsString);
      dblLeg14.KeyValue     := DM.sdsLegendaDESC14.AsInteger;
      clbLegenda15.Selected := StringToColor(DM.sdsLegendaCOR15.AsString);
      dblLeg15.KeyValue     := DM.sdsLegendaDESC15.AsInteger;
    end;
end;

procedure TfrmOdontograma.gbx11_1Click(Sender: TObject);
begin
    gbx11_1.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx11_2Click(Sender: TObject);
begin
    gbx11_2.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx11_3Click(Sender: TObject);
begin
    gbx11_3.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx11_4Click(Sender: TObject);
begin
    gbx11_4.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx11_5Click(Sender: TObject);
begin
    gbx11_5.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx11_6Click(Sender: TObject);
begin
    gbx11_6.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx11_7Click(Sender: TObject);
begin
    gbx11_7.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx11_8Click(Sender: TObject);
begin
    gbx11_8.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx11_9Click(Sender: TObject);
begin
    gbx11_9.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx12_1Click(Sender: TObject);
begin
    gbx12_1.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx12_2Click(Sender: TObject);
begin
    gbx12_2.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx12_3Click(Sender: TObject);
begin
    gbx12_3.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx12_4Click(Sender: TObject);
begin
    gbx12_4.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx12_5Click(Sender: TObject);
begin
    gbx12_5.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx12_6Click(Sender: TObject);
begin
    gbx12_6.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx12_7Click(Sender: TObject);
begin
    gbx12_7.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx12_8Click(Sender: TObject);
begin
    gbx12_8.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx12_9Click(Sender: TObject);
begin
    gbx12_9.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx13_1Click(Sender: TObject);
begin
    gbx13_1.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx13_2Click(Sender: TObject);
begin
    gbx13_2.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx13_3Click(Sender: TObject);
begin
    gbx13_3.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx13_4Click(Sender: TObject);
begin
    gbx13_4.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx13_5Click(Sender: TObject);
begin
    gbx13_5.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx13_6Click(Sender: TObject);
begin
    gbx13_6.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx13_7Click(Sender: TObject);
begin
    gbx13_7.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx13_8Click(Sender: TObject);
begin
    gbx13_8.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx13_9Click(Sender: TObject);
begin
    gbx13_9.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx14_1Click(Sender: TObject);
begin
    gbx14_1.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx14_2Click(Sender: TObject);
begin
    gbx14_2.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx14_3Click(Sender: TObject);
begin
    gbx14_3.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx14_4Click(Sender: TObject);
begin
    gbx14_4.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx14_5Click(Sender: TObject);
begin
    gbx14_5.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx14_6Click(Sender: TObject);
begin
    gbx14_6.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx14_7Click(Sender: TObject);
begin
    gbx14_7.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx14_8Click(Sender: TObject);
begin
    gbx14_8.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx14_9Click(Sender: TObject);
begin
    gbx14_9.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx15_1Click(Sender: TObject);
begin
    gbx15_1.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx15_2Click(Sender: TObject);
begin
    gbx15_2.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx15_3Click(Sender: TObject);
begin
    gbx15_3.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx15_4Click(Sender: TObject);
begin
    gbx15_4.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx15_5Click(Sender: TObject);
begin
    gbx15_5.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx15_6Click(Sender: TObject);
begin
    gbx15_6.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx15_7Click(Sender: TObject);
begin
    gbx15_7.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx15_8Click(Sender: TObject);
begin
    gbx15_8.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx15_9Click(Sender: TObject);
begin
    gbx15_9.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx16_1Click(Sender: TObject);
begin
    gbx16_1.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx16_2Click(Sender: TObject);
begin
    gbx16_2.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx16_3Click(Sender: TObject);
begin
    gbx16_3.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx16_4Click(Sender: TObject);
begin
    gbx16_4.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx16_5Click(Sender: TObject);
begin
    gbx16_5.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx16_6Click(Sender: TObject);
begin
    gbx16_6.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx16_7Click(Sender: TObject);
begin
    gbx16_7.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx16_8Click(Sender: TObject);
begin
    gbx16_8.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx16_9Click(Sender: TObject);
begin
    gbx16_9.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx17_1Click(Sender: TObject);
begin
    gbx17_1.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx17_2Click(Sender: TObject);
begin
    gbx17_2.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx17_3Click(Sender: TObject);
begin
    gbx17_3.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx17_4Click(Sender: TObject);
begin
    gbx17_4.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx17_5Click(Sender: TObject);
begin
    gbx17_5.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx17_6Click(Sender: TObject);
begin
    gbx17_6.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx17_7Click(Sender: TObject);
begin
    gbx17_7.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx17_8Click(Sender: TObject);
begin
    gbx17_8.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx17_9Click(Sender: TObject);
begin
    gbx17_9.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx18_1Click(Sender: TObject);
begin
    gbx18_1.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx18_2Click(Sender: TObject);
begin
    gbx18_2.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx18_3Click(Sender: TObject);
begin
    gbx18_3.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx18_4Click(Sender: TObject);
begin
    gbx18_4.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx18_5Click(Sender: TObject);
begin
    gbx18_5.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx18_6Click(Sender: TObject);
begin
    gbx18_6.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx18_7Click(Sender: TObject);
begin
    gbx18_7.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx18_8Click(Sender: TObject);
begin
    gbx18_8.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx18_9Click(Sender: TObject);
begin
    gbx18_9.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx21_1Click(Sender: TObject);
begin
    gbx21_1.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx21_2Click(Sender: TObject);
begin
    gbx21_2.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx21_3Click(Sender: TObject);
begin
    gbx21_3.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx21_4Click(Sender: TObject);
begin
    gbx21_4.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx21_5Click(Sender: TObject);
begin
    gbx21_5.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx21_6Click(Sender: TObject);
begin
    gbx21_6.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx21_7Click(Sender: TObject);
begin
    gbx21_7.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx21_8Click(Sender: TObject);
begin
    gbx21_8.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx21_9Click(Sender: TObject);
begin
    gbx21_9.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx22_1Click(Sender: TObject);
begin
    gbx22_1.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx22_2Click(Sender: TObject);
begin
    gbx22_2.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx22_3Click(Sender: TObject);
begin
    gbx22_3.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx22_4Click(Sender: TObject);
begin
    gbx22_4.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx22_5Click(Sender: TObject);
begin
    gbx22_5.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx22_6Click(Sender: TObject);
begin
    gbx22_6.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx22_7Click(Sender: TObject);
begin
    gbx22_7.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx22_8Click(Sender: TObject);
begin
    gbx22_8.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx22_9Click(Sender: TObject);
begin
    gbx22_9.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx23_1Click(Sender: TObject);
begin
    gbx23_1.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx23_2Click(Sender: TObject);
begin
    gbx23_2.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx23_3Click(Sender: TObject);
begin
    gbx23_3.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx23_4Click(Sender: TObject);
begin
    gbx23_4.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx23_5Click(Sender: TObject);
begin
    gbx23_5.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx23_6Click(Sender: TObject);
begin
    gbx23_6.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx23_7Click(Sender: TObject);
begin
    gbx23_7.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx23_8Click(Sender: TObject);
begin
    gbx23_8.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx23_9Click(Sender: TObject);
begin
    gbx23_9.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx24_1Click(Sender: TObject);
begin
    gbx24_1.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx24_2Click(Sender: TObject);
begin
    gbx24_2.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx24_3Click(Sender: TObject);
begin
    gbx24_3.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx24_4Click(Sender: TObject);
begin
    gbx24_4.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx24_5Click(Sender: TObject);
begin
    gbx24_5.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx24_6Click(Sender: TObject);
begin
    gbx24_6.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx24_7Click(Sender: TObject);
begin
    gbx24_7.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx24_8Click(Sender: TObject);
begin
    gbx24_8.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx24_9Click(Sender: TObject);
begin
    gbx24_9.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx25_1Click(Sender: TObject);
begin
    gbx25_1.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx25_2Click(Sender: TObject);
begin
    gbx25_2.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx25_3Click(Sender: TObject);
begin
    gbx25_3.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx25_4Click(Sender: TObject);
begin
    gbx25_4.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx25_5Click(Sender: TObject);
begin
    gbx25_5.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx25_6Click(Sender: TObject);
begin
    gbx25_6.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx25_7Click(Sender: TObject);
begin
    gbx25_7.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx25_8Click(Sender: TObject);
begin
    gbx25_8.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx25_9Click(Sender: TObject);
begin
    gbx25_9.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx26_1Click(Sender: TObject);
begin
    gbx26_1.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx26_2Click(Sender: TObject);
begin
    gbx26_2.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx26_3Click(Sender: TObject);
begin
    gbx26_3.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx26_4Click(Sender: TObject);
begin
    gbx26_4.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx26_5Click(Sender: TObject);
begin
    gbx26_5.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx26_6Click(Sender: TObject);
begin
    gbx26_6.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx26_7Click(Sender: TObject);
begin
    gbx26_7.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx26_8Click(Sender: TObject);
begin
    gbx26_8.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx26_9Click(Sender: TObject);
begin
    gbx26_9.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx27_1Click(Sender: TObject);
begin
    gbx27_1.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx27_2Click(Sender: TObject);
begin
    gbx27_2.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx27_3Click(Sender: TObject);
begin
    gbx27_3.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx27_4Click(Sender: TObject);
begin
    gbx27_4.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx27_5Click(Sender: TObject);
begin
    gbx27_5.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx27_6Click(Sender: TObject);
begin
    gbx27_6.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx27_7Click(Sender: TObject);
begin
    gbx27_7.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx27_8Click(Sender: TObject);
begin
    gbx27_8.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx27_9Click(Sender: TObject);
begin
    gbx27_9.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx28_1Click(Sender: TObject);
begin
    gbx28_1.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx28_2Click(Sender: TObject);
begin
    gbx28_2.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx28_3Click(Sender: TObject);
begin
    gbx28_3.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx28_4Click(Sender: TObject);
begin
    gbx28_4.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx28_5Click(Sender: TObject);
begin
    gbx28_5.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx28_6Click(Sender: TObject);
begin
    gbx28_6.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx28_7Click(Sender: TObject);
begin
    gbx28_7.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx28_8Click(Sender: TObject);
begin
    gbx28_8.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx28_9Click(Sender: TObject);
begin
    gbx28_9.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx31_1Click(Sender: TObject);
begin
    gbx31_1.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx31_2Click(Sender: TObject);
begin
    gbx31_2.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx31_3Click(Sender: TObject);
begin
    gbx31_3.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx31_4Click(Sender: TObject);
begin
    gbx31_4.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx31_5Click(Sender: TObject);
begin
    gbx31_5.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx31_6Click(Sender: TObject);
begin
    gbx31_6.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx31_7Click(Sender: TObject);
begin
    gbx31_7.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx31_8Click(Sender: TObject);
begin
    gbx31_8.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx31_9Click(Sender: TObject);
begin
    gbx31_9.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx32_1Click(Sender: TObject);
begin
    gbx32_1.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx32_2Click(Sender: TObject);
begin
    gbx32_2.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx32_3Click(Sender: TObject);
begin
    gbx32_3.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx32_4Click(Sender: TObject);
begin
    gbx32_4.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx32_5Click(Sender: TObject);
begin
    gbx32_5.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx32_6Click(Sender: TObject);
begin
    gbx32_6.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx32_7Click(Sender: TObject);
begin
    gbx32_7.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx32_8Click(Sender: TObject);
begin
    gbx32_8.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx32_9Click(Sender: TObject);
begin
    gbx32_9.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx33_1Click(Sender: TObject);
begin
    gbx33_1.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx33_2Click(Sender: TObject);
begin
    gbx33_2.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx33_3Click(Sender: TObject);
begin
    gbx33_3.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx33_4Click(Sender: TObject);
begin
    gbx33_4.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx33_5Click(Sender: TObject);
begin
    gbx33_5.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx33_6Click(Sender: TObject);
begin
    gbx33_6.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx33_7Click(Sender: TObject);
begin
    gbx33_7.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx33_8Click(Sender: TObject);
begin
    gbx33_8.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx33_9Click(Sender: TObject);
begin
    gbx33_9.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx34_1Click(Sender: TObject);
begin
    gbx34_1.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx34_2Click(Sender: TObject);
begin
    gbx34_2.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx34_3Click(Sender: TObject);
begin
    gbx34_3.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx34_4Click(Sender: TObject);
begin
    gbx34_4.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx34_5Click(Sender: TObject);
begin
    gbx34_5.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx34_6Click(Sender: TObject);
begin
    gbx34_6.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx34_7Click(Sender: TObject);
begin
    gbx34_7.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx34_8Click(Sender: TObject);
begin
    gbx34_8.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx34_9Click(Sender: TObject);
begin
    gbx34_9.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx35_1Click(Sender: TObject);
begin
    gbx35_1.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx35_2Click(Sender: TObject);
begin
    gbx35_2.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx35_3Click(Sender: TObject);
begin
    gbx35_3.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx35_4Click(Sender: TObject);
begin
    gbx35_4.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx35_5Click(Sender: TObject);
begin
    gbx35_5.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx35_6Click(Sender: TObject);
begin
    gbx35_6.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx35_7Click(Sender: TObject);
begin
    gbx35_7.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx35_8Click(Sender: TObject);
begin
    gbx35_8.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx35_9Click(Sender: TObject);
begin
    gbx35_9.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx36_1Click(Sender: TObject);
begin
    gbx36_1.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx36_2Click(Sender: TObject);
begin
    gbx36_2.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx36_3Click(Sender: TObject);
begin
    gbx36_3.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx36_4Click(Sender: TObject);
begin
    gbx36_4.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx36_5Click(Sender: TObject);
begin
    gbx36_5.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx36_6Click(Sender: TObject);
begin
    gbx36_6.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx36_7Click(Sender: TObject);
begin
    gbx36_7.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx36_8Click(Sender: TObject);
begin
    gbx36_8.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx36_9Click(Sender: TObject);
begin
    gbx36_9.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx37_1Click(Sender: TObject);
begin
    gbx37_1.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx37_2Click(Sender: TObject);
begin
    gbx37_2.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx37_3Click(Sender: TObject);
begin
    gbx37_3.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx37_4Click(Sender: TObject);
begin
    gbx37_4.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx37_5Click(Sender: TObject);
begin
    gbx37_5.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx37_6Click(Sender: TObject);
begin
    gbx37_6.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx37_7Click(Sender: TObject);
begin
    gbx37_7.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx37_8Click(Sender: TObject);
begin
    gbx37_8.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx37_9Click(Sender: TObject);
begin
    gbx37_9.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx38_1Click(Sender: TObject);
begin
    gbx38_1.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx38_2Click(Sender: TObject);
begin
    gbx38_2.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx38_3Click(Sender: TObject);
begin
    gbx38_3.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx38_4Click(Sender: TObject);
begin
    gbx38_4.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx38_5Click(Sender: TObject);
begin
    gbx38_5.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx38_6Click(Sender: TObject);
begin
    gbx38_6.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx38_7Click(Sender: TObject);
begin
    gbx38_7.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx38_8Click(Sender: TObject);
begin
    gbx38_8.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx38_9Click(Sender: TObject);
begin
    gbx38_9.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx41_1Click(Sender: TObject);
begin
    gbx41_1.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx41_2Click(Sender: TObject);
begin
    gbx41_2.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx41_3Click(Sender: TObject);
begin
    gbx41_3.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx41_4Click(Sender: TObject);
begin
    gbx41_4.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx41_5Click(Sender: TObject);
begin
    gbx41_5.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx41_6Click(Sender: TObject);
begin
    gbx41_6.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx41_7Click(Sender: TObject);
begin
    gbx41_7.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx41_8Click(Sender: TObject);
begin
    gbx41_8.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx41_9Click(Sender: TObject);
begin
    gbx41_9.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx42_1Click(Sender: TObject);
begin
    gbx42_1.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx42_2Click(Sender: TObject);
begin
    gbx42_2.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx42_3Click(Sender: TObject);
begin
    gbx42_3.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx42_4Click(Sender: TObject);
begin
    gbx42_4.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx42_5Click(Sender: TObject);
begin
    gbx42_5.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx42_6Click(Sender: TObject);
begin
    gbx42_6.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx42_7Click(Sender: TObject);
begin
    gbx42_7.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx42_8Click(Sender: TObject);
begin
    gbx42_8.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx42_9Click(Sender: TObject);
begin
    gbx42_9.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx43_1Click(Sender: TObject);
begin
    gbx43_1.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx43_2Click(Sender: TObject);
begin
    gbx43_2.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx43_3Click(Sender: TObject);
begin
    gbx43_3.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx43_4Click(Sender: TObject);
begin
    gbx43_4.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx43_5Click(Sender: TObject);
begin
    gbx43_5.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx43_6Click(Sender: TObject);
begin
    gbx43_6.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx43_7Click(Sender: TObject);
begin
    gbx43_7.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx43_8Click(Sender: TObject);
begin
    gbx43_8.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx43_9Click(Sender: TObject);
begin
    gbx43_9.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx44_1Click(Sender: TObject);
begin
    gbx44_1.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx44_2Click(Sender: TObject);
begin
    gbx44_2.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx44_3Click(Sender: TObject);
begin
    gbx44_3.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx44_4Click(Sender: TObject);
begin
    gbx44_4.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx44_5Click(Sender: TObject);
begin
    gbx44_5.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx44_6Click(Sender: TObject);
begin
    gbx44_6.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx44_7Click(Sender: TObject);
begin
    gbx44_7.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx44_8Click(Sender: TObject);
begin
    gbx44_8.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx44_9Click(Sender: TObject);
begin
    gbx44_9.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx45_1Click(Sender: TObject);
begin
    gbx45_1.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx45_2Click(Sender: TObject);
begin
    gbx45_2.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx45_3Click(Sender: TObject);
begin
    gbx45_3.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx45_4Click(Sender: TObject);
begin
    gbx45_4.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx45_5Click(Sender: TObject);
begin
    gbx45_5.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx45_6Click(Sender: TObject);
begin
    gbx45_6.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx45_7Click(Sender: TObject);
begin
    gbx45_7.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx45_8Click(Sender: TObject);
begin
    gbx45_8.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx45_9Click(Sender: TObject);
begin
    gbx45_9.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx46_1Click(Sender: TObject);
begin
    gbx46_1.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx46_2Click(Sender: TObject);
begin
    gbx46_2.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx46_3Click(Sender: TObject);
begin
    gbx46_3.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx46_4Click(Sender: TObject);
begin
    gbx46_4.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx46_5Click(Sender: TObject);
begin
    gbx46_5.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx46_6Click(Sender: TObject);
begin
    gbx46_6.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx46_7Click(Sender: TObject);
begin
    gbx46_7.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx46_8Click(Sender: TObject);
begin
    gbx46_8.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx46_9Click(Sender: TObject);
begin
    gbx46_9.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx47_1Click(Sender: TObject);
begin
    gbx47_1.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx47_2Click(Sender: TObject);
begin
    gbx47_2.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx47_3Click(Sender: TObject);
begin
    gbx47_3.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx47_4Click(Sender: TObject);
begin
    gbx47_4.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx47_5Click(Sender: TObject);
begin
    gbx47_5.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx47_6Click(Sender: TObject);
begin
    gbx47_6.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx47_7Click(Sender: TObject);
begin
    gbx47_7.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx47_8Click(Sender: TObject);
begin
    gbx47_8.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx47_9Click(Sender: TObject);
begin
    gbx47_9.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx48_1Click(Sender: TObject);
begin
    gbx48_1.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx48_2Click(Sender: TObject);
begin
    gbx48_2.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx48_3Click(Sender: TObject);
begin
    gbx48_3.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx48_4Click(Sender: TObject);
begin
    gbx48_4.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx48_5Click(Sender: TObject);
begin
    gbx48_5.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx48_6Click(Sender: TObject);
begin
    gbx48_6.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx48_7Click(Sender: TObject);
begin
    gbx48_7.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx48_8Click(Sender: TObject);
begin
    gbx48_8.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.gbx48_9Click(Sender: TObject);
begin
    gbx48_9.Color := SelecinaLegenda;
end;

procedure TfrmOdontograma.InsertUpdateDelete;
begin
    case vTipo of
      0: // inserir
        begin
          vSQLOdontograma := ' insert into ODO00 '+
                  ' (NU_CLIENTE, '+
                  ' DENTE11_1, DENTE11_2, DENTE11_3, DENTE11_4, DENTE11_5, DENTE11_6, DENTE11_7, DENTE11_8, DENTE11_9, '+
                  ' DENTE12_1, DENTE12_2, DENTE12_3, DENTE12_4, DENTE12_5, DENTE12_6, DENTE12_7, DENTE12_8, DENTE12_9, '+
                  ' DENTE13_1, DENTE13_2, DENTE13_3, DENTE13_4, DENTE13_5, DENTE13_6, DENTE13_7, DENTE13_8, DENTE13_9, '+
                  ' DENTE14_1, DENTE14_2, DENTE14_3, DENTE14_4, DENTE14_5, DENTE14_6, DENTE14_7, DENTE14_8, DENTE14_9, '+
                  ' DENTE15_1, DENTE15_2, DENTE15_3, DENTE15_4, DENTE15_5, DENTE15_6, DENTE15_7, DENTE15_8, DENTE15_9, '+
                  ' DENTE16_1, DENTE16_2, DENTE16_3, DENTE16_4, DENTE16_5, DENTE16_6, DENTE16_7, DENTE16_8, DENTE16_9, '+
                  ' DENTE17_1, DENTE17_2, DENTE17_3, DENTE17_4, DENTE17_5, DENTE17_6, DENTE17_7, DENTE17_8, DENTE17_9, '+
                  ' DENTE18_1, DENTE18_2, DENTE18_3, DENTE18_4, DENTE18_5, DENTE18_6, DENTE18_7, DENTE18_8, DENTE18_9, '+

                  ' DENTE21_1, DENTE21_2, DENTE21_3, DENTE21_4, DENTE21_5, DENTE21_6, DENTE21_7, DENTE21_8, DENTE21_9, '+
                  ' DENTE22_1, DENTE22_2, DENTE22_3, DENTE22_4, DENTE22_5, DENTE22_6, DENTE22_7, DENTE22_8, DENTE22_9, '+
                  ' DENTE23_1, DENTE23_2, DENTE23_3, DENTE23_4, DENTE23_5, DENTE23_6, DENTE23_7, DENTE23_8, DENTE23_9, '+
                  ' DENTE24_1, DENTE24_2, DENTE24_3, DENTE24_4, DENTE24_5, DENTE24_6, DENTE24_7, DENTE24_8, DENTE24_9, '+
                  ' DENTE25_1, DENTE25_2, DENTE25_3, DENTE25_4, DENTE25_5, DENTE25_6, DENTE25_7, DENTE25_8, DENTE25_9, '+
                  ' DENTE26_1, DENTE26_2, DENTE26_3, DENTE26_4, DENTE26_5, DENTE26_6, DENTE26_7, DENTE26_8, DENTE26_9, '+
                  ' DENTE27_1, DENTE27_2, DENTE27_3, DENTE27_4, DENTE27_5, DENTE27_6, DENTE27_7, DENTE27_8, DENTE27_9, '+
                  ' DENTE28_1, DENTE28_2, DENTE28_3, DENTE28_4, DENTE28_5, DENTE28_6, DENTE28_7, DENTE28_8, DENTE28_9, '+

                  ' DENTE31_1, DENTE31_2, DENTE31_3, DENTE31_4, DENTE31_5, DENTE31_6, DENTE31_7, DENTE31_8, DENTE31_9, '+
                  ' DENTE32_1, DENTE32_2, DENTE32_3, DENTE32_4, DENTE32_5, DENTE32_6, DENTE32_7, DENTE32_8, DENTE32_9, '+
                  ' DENTE33_1, DENTE33_2, DENTE33_3, DENTE33_4, DENTE33_5, DENTE33_6, DENTE33_7, DENTE33_8, DENTE33_9, '+
                  ' DENTE34_1, DENTE34_2, DENTE34_3, DENTE34_4, DENTE34_5, DENTE34_6, DENTE34_7, DENTE34_8, DENTE34_9, '+
                  ' DENTE35_1, DENTE35_2, DENTE35_3, DENTE35_4, DENTE35_5, DENTE35_6, DENTE35_7, DENTE35_8, DENTE35_9, '+
                  ' DENTE36_1, DENTE36_2, DENTE36_3, DENTE36_4, DENTE36_5, DENTE36_6, DENTE36_7, DENTE36_8, DENTE36_9, '+
                  ' DENTE37_1, DENTE37_2, DENTE37_3, DENTE37_4, DENTE37_5, DENTE37_6, DENTE37_7, DENTE37_8, DENTE37_9, '+
                  ' DENTE38_1, DENTE38_2, DENTE38_3, DENTE38_4, DENTE38_5, DENTE38_6, DENTE38_7, DENTE38_8, DENTE38_9, '+

                  ' DENTE41_1, DENTE41_2, DENTE41_3, DENTE41_4, DENTE41_5, DENTE41_6, DENTE41_7, DENTE41_8, DENTE41_9, '+
                  ' DENTE42_1, DENTE42_2, DENTE42_3, DENTE42_4, DENTE42_5, DENTE42_6, DENTE42_7, DENTE42_8, DENTE42_9, '+
                  ' DENTE43_1, DENTE43_2, DENTE43_3, DENTE43_4, DENTE43_5, DENTE43_6, DENTE43_7, DENTE43_8, DENTE43_9, '+
                  ' DENTE44_1, DENTE44_2, DENTE44_3, DENTE44_4, DENTE44_5, DENTE44_6, DENTE44_7, DENTE44_8, DENTE44_9, '+
                  ' DENTE45_1, DENTE45_2, DENTE45_3, DENTE45_4, DENTE45_5, DENTE45_6, DENTE45_7, DENTE45_8, DENTE45_9, '+
                  ' DENTE46_1, DENTE46_2, DENTE46_3, DENTE46_4, DENTE46_5, DENTE46_6, DENTE46_7, DENTE46_8, DENTE46_9, '+
                  ' DENTE47_1, DENTE47_2, DENTE47_3, DENTE47_4, DENTE47_5, DENTE47_6, DENTE47_7, DENTE47_8, DENTE47_9, '+
                  ' DENTE48_1, DENTE48_2, DENTE48_3, DENTE48_4, DENTE48_5, DENTE48_6, DENTE48_7, DENTE48_8, DENTE48_9) '+

                  ' VALUES '+
                  ' (:pNU_CLIENTE, '+
                  ' :pDENTE11_1, :pDENTE11_2, :pDENTE11_3, :pDENTE11_4, :pDENTE11_5, :pDENTE11_6, :pDENTE11_7, :pDENTE11_8, :pDENTE11_9, '+
                  ' :pDENTE12_1, :pDENTE12_2, :pDENTE12_3, :pDENTE12_4, :pDENTE12_5, :pDENTE12_6, :pDENTE12_7, :pDENTE12_8, :pDENTE12_9, '+
                  ' :pDENTE13_1, :pDENTE13_2, :pDENTE13_3, :pDENTE13_4, :pDENTE13_5, :pDENTE13_6, :pDENTE13_7, :pDENTE13_8, :pDENTE13_9, '+
                  ' :pDENTE14_1, :pDENTE14_2, :pDENTE14_3, :pDENTE14_4, :pDENTE14_5, :pDENTE14_6, :pDENTE14_7, :pDENTE14_8, :pDENTE14_9, '+
                  ' :pDENTE15_1, :pDENTE15_2, :pDENTE15_3, :pDENTE15_4, :pDENTE15_5, :pDENTE15_6, :pDENTE15_7, :pDENTE15_8, :pDENTE15_9, '+
                  ' :pDENTE16_1, :pDENTE16_2, :pDENTE16_3, :pDENTE16_4, :pDENTE16_5, :pDENTE16_6, :pDENTE16_7, :pDENTE16_8, :pDENTE16_9, '+
                  ' :pDENTE17_1, :pDENTE17_2, :pDENTE17_3, :pDENTE17_4, :pDENTE17_5, :pDENTE17_6, :pDENTE17_7, :pDENTE17_8, :pDENTE17_9, '+
                  ' :pDENTE18_1, :pDENTE18_2, :pDENTE18_3, :pDENTE18_4, :pDENTE18_5, :pDENTE18_6, :pDENTE18_7, :pDENTE18_8, :pDENTE18_9, '+

                  ' :pDENTE21_1, :pDENTE21_2, :pDENTE21_3, :pDENTE21_4, :pDENTE21_5, :pDENTE21_6, :pDENTE21_7, :pDENTE21_8, :pDENTE21_9, '+
                  ' :pDENTE22_1, :pDENTE22_2, :pDENTE22_3, :pDENTE22_4, :pDENTE22_5, :pDENTE22_6, :pDENTE22_7, :pDENTE22_8, :pDENTE22_9, '+
                  ' :pDENTE23_1, :pDENTE23_2, :pDENTE23_3, :pDENTE23_4, :pDENTE23_5, :pDENTE23_6, :pDENTE23_7, :pDENTE23_8, :pDENTE23_9, '+
                  ' :pDENTE24_1, :pDENTE24_2, :pDENTE24_3, :pDENTE24_4, :pDENTE24_5, :pDENTE24_6, :pDENTE24_7, :pDENTE24_8, :pDENTE24_9, '+
                  ' :pDENTE25_1, :pDENTE25_2, :pDENTE25_3, :pDENTE25_4, :pDENTE25_5, :pDENTE25_6, :pDENTE25_7, :pDENTE25_8, :pDENTE25_9, '+
                  ' :pDENTE26_1, :pDENTE26_2, :pDENTE26_3, :pDENTE26_4, :pDENTE26_5, :pDENTE26_6, :pDENTE26_7, :pDENTE26_8, :pDENTE26_9, '+
                  ' :pDENTE27_1, :pDENTE27_2, :pDENTE27_3, :pDENTE27_4, :pDENTE27_5, :pDENTE27_6, :pDENTE27_7, :pDENTE27_8, :pDENTE27_9, '+
                  ' :pDENTE28_1, :pDENTE28_2, :pDENTE28_3, :pDENTE28_4, :pDENTE28_5, :pDENTE28_6, :pDENTE28_7, :pDENTE28_8, :pDENTE28_9, '+

                  ' :pDENTE31_1, :pDENTE31_2, :pDENTE31_3, :pDENTE31_4, :pDENTE31_5, :pDENTE31_6, :pDENTE31_7, :pDENTE31_8, :pDENTE31_9, '+
                  ' :pDENTE32_1, :pDENTE32_2, :pDENTE32_3, :pDENTE32_4, :pDENTE32_5, :pDENTE32_6, :pDENTE32_7, :pDENTE32_8, :pDENTE32_9, '+
                  ' :pDENTE33_1, :pDENTE33_2, :pDENTE33_3, :pDENTE33_4, :pDENTE33_5, :pDENTE33_6, :pDENTE33_7, :pDENTE33_8, :pDENTE33_9, '+
                  ' :pDENTE34_1, :pDENTE34_2, :pDENTE34_3, :pDENTE34_4, :pDENTE34_5, :pDENTE34_6, :pDENTE34_7, :pDENTE34_8, :pDENTE34_9, '+
                  ' :pDENTE35_1, :pDENTE35_2, :pDENTE35_3, :pDENTE35_4, :pDENTE35_5, :pDENTE35_6, :pDENTE35_7, :pDENTE35_8, :pDENTE35_9, '+
                  ' :pDENTE36_1, :pDENTE36_2, :pDENTE36_3, :pDENTE36_4, :pDENTE36_5, :pDENTE36_6, :pDENTE36_7, :pDENTE36_8, :pDENTE36_9, '+
                  ' :pDENTE37_1, :pDENTE37_2, :pDENTE37_3, :pDENTE37_4, :pDENTE37_5, :pDENTE37_6, :pDENTE37_7, :pDENTE37_8, :pDENTE37_9, '+
                  ' :pDENTE38_1, :pDENTE38_2, :pDENTE38_3, :pDENTE38_4, :pDENTE38_5, :pDENTE38_6, :pDENTE38_7, :pDENTE38_8, :pDENTE38_9, '+

                  ' :pDENTE41_1, :pDENTE41_2, :pDENTE41_3, :pDENTE41_4, :pDENTE41_5, :pDENTE41_6, :pDENTE41_7, :pDENTE41_8, :pDENTE41_9, '+
                  ' :pDENTE42_1, :pDENTE42_2, :pDENTE42_3, :pDENTE42_4, :pDENTE42_5, :pDENTE42_6, :pDENTE42_7, :pDENTE42_8, :pDENTE42_9, '+
                  ' :pDENTE43_1, :pDENTE43_2, :pDENTE43_3, :pDENTE43_4, :pDENTE43_5, :pDENTE43_6, :pDENTE43_7, :pDENTE43_8, :pDENTE43_9, '+
                  ' :pDENTE44_1, :pDENTE44_2, :pDENTE44_3, :pDENTE44_4, :pDENTE44_5, :pDENTE44_6, :pDENTE44_7, :pDENTE44_8, :pDENTE44_9, '+
                  ' :pDENTE45_1, :pDENTE45_2, :pDENTE45_3, :pDENTE45_4, :pDENTE45_5, :pDENTE45_6, :pDENTE45_7, :pDENTE45_8, :pDENTE45_9, '+
                  ' :pDENTE46_1, :pDENTE46_2, :pDENTE46_3, :pDENTE46_4, :pDENTE46_5, :pDENTE46_6, :pDENTE46_7, :pDENTE46_8, :pDENTE46_9, '+
                  ' :pDENTE47_1, :pDENTE47_2, :pDENTE47_3, :pDENTE47_4, :pDENTE47_5, :pDENTE47_6, :pDENTE47_7, :pDENTE47_8, :pDENTE47_9, '+
                  ' :pDENTE48_1, :pDENTE48_2, :pDENTE48_3, :pDENTE48_4, :pDENTE48_5, :pDENTE48_6, :pDENTE48_7, :pDENTE48_8, :pDENTE48_9) ';

          vMsg := 'incluido';
        end;

      1: // alterar
        begin
          vSQLOdontograma := ' update ODO00 set '+
                  ' DENTE11_1 = :pDENTE11_1, '+
                  ' DENTE11_2 = :pDENTE11_2, '+
                  ' DENTE11_3 = :pDENTE11_3, '+
                  ' DENTE11_4 = :pDENTE11_4, '+
                  ' DENTE11_5 = :pDENTE11_5, '+
                  ' DENTE11_6 = :pDENTE11_6, '+
                  ' DENTE11_7 = :pDENTE11_7, '+
                  ' DENTE11_8 = :pDENTE11_8, '+
                  ' DENTE11_9 = :pDENTE11_9, '+
                  ' DENTE12_1 = :pDENTE12_1, '+
                  ' DENTE12_2 = :pDENTE12_2, '+
                  ' DENTE12_3 = :pDENTE12_3, '+
                  ' DENTE12_4 = :pDENTE12_4, '+
                  ' DENTE12_5 = :pDENTE12_5, '+
                  ' DENTE12_6 = :pDENTE12_6, '+
                  ' DENTE12_7 = :pDENTE12_7, '+
                  ' DENTE12_8 = :pDENTE12_8, '+
                  ' DENTE12_9 = :pDENTE12_9, '+
                  ' DENTE13_1 = :pDENTE13_1, '+
                  ' DENTE13_2 = :pDENTE13_2, '+
                  ' DENTE13_3 = :pDENTE13_3, '+
                  ' DENTE13_4 = :pDENTE13_4, '+
                  ' DENTE13_5 = :pDENTE13_5, '+
                  ' DENTE13_6 = :pDENTE13_6, '+
                  ' DENTE13_7 = :pDENTE13_7, '+
                  ' DENTE13_8 = :pDENTE13_8, '+
                  ' DENTE13_9 = :pDENTE13_9, '+
                  ' DENTE14_1 = :pDENTE14_1, '+
                  ' DENTE14_2 = :pDENTE14_2, '+
                  ' DENTE14_3 = :pDENTE14_3, '+
                  ' DENTE14_4 = :pDENTE14_4, '+
                  ' DENTE14_5 = :pDENTE14_5, '+
                  ' DENTE14_6 = :pDENTE14_6, '+
                  ' DENTE14_7 = :pDENTE14_7, '+
                  ' DENTE14_8 = :pDENTE14_8, '+
                  ' DENTE14_9 = :pDENTE14_9, '+
                  ' DENTE15_1 = :pDENTE15_1, '+
                  ' DENTE15_2 = :pDENTE15_2, '+
                  ' DENTE15_3 = :pDENTE15_3, '+
                  ' DENTE15_4 = :pDENTE15_4, '+
                  ' DENTE15_5 = :pDENTE15_5, '+
                  ' DENTE15_6 = :pDENTE15_6, '+
                  ' DENTE15_7 = :pDENTE15_7, '+
                  ' DENTE15_8 = :pDENTE15_8, '+
                  ' DENTE15_9 = :pDENTE15_9, '+
                  ' DENTE16_1 = :pDENTE16_1, '+
                  ' DENTE16_2 = :pDENTE16_2, '+
                  ' DENTE16_3 = :pDENTE16_3, '+
                  ' DENTE16_4 = :pDENTE16_4, '+
                  ' DENTE16_5 = :pDENTE16_5, '+
                  ' DENTE16_6 = :pDENTE16_6, '+
                  ' DENTE16_7 = :pDENTE16_7, '+
                  ' DENTE16_8 = :pDENTE16_8, '+
                  ' DENTE16_9 = :pDENTE16_9, '+
                  ' DENTE17_1 = :pDENTE17_1, '+
                  ' DENTE17_2 = :pDENTE17_2, '+
                  ' DENTE17_3 = :pDENTE17_3, '+
                  ' DENTE17_4 = :pDENTE17_4, '+
                  ' DENTE17_5 = :pDENTE17_5, '+
                  ' DENTE17_6 = :pDENTE17_6, '+
                  ' DENTE17_7 = :pDENTE17_7, '+
                  ' DENTE17_8 = :pDENTE17_8, '+
                  ' DENTE17_9 = :pDENTE17_9, '+
                  ' DENTE18_1 = :pDENTE18_1, '+
                  ' DENTE18_2 = :pDENTE18_2, '+
                  ' DENTE18_3 = :pDENTE18_3, '+
                  ' DENTE18_4 = :pDENTE18_4, '+
                  ' DENTE18_5 = :pDENTE18_5, '+
                  ' DENTE18_6 = :pDENTE18_6, '+
                  ' DENTE18_7 = :pDENTE18_7, '+
                  ' DENTE18_8 = :pDENTE18_8, '+
                  ' DENTE18_9 = :pDENTE18_9, '+

                  ' DENTE21_1 = :pDENTE21_1, '+
                  ' DENTE21_2 = :pDENTE21_2, '+
                  ' DENTE21_3 = :pDENTE21_3, '+
                  ' DENTE21_4 = :pDENTE21_4, '+
                  ' DENTE21_5 = :pDENTE21_5, '+
                  ' DENTE21_6 = :pDENTE21_6, '+
                  ' DENTE21_7 = :pDENTE21_7, '+
                  ' DENTE21_8 = :pDENTE21_8, '+
                  ' DENTE21_9 = :pDENTE21_9, '+
                  ' DENTE22_1 = :pDENTE22_1, '+
                  ' DENTE22_2 = :pDENTE22_2, '+
                  ' DENTE22_3 = :pDENTE22_3, '+
                  ' DENTE22_4 = :pDENTE22_4, '+
                  ' DENTE22_5 = :pDENTE22_5, '+
                  ' DENTE22_6 = :pDENTE22_6, '+
                  ' DENTE22_7 = :pDENTE22_7, '+
                  ' DENTE22_8 = :pDENTE22_8, '+
                  ' DENTE22_9 = :pDENTE22_9, '+
                  ' DENTE23_1 = :pDENTE23_1, '+
                  ' DENTE23_2 = :pDENTE23_2, '+
                  ' DENTE23_3 = :pDENTE23_3, '+
                  ' DENTE23_4 = :pDENTE23_4, '+
                  ' DENTE23_5 = :pDENTE23_5, '+
                  ' DENTE23_6 = :pDENTE23_6, '+
                  ' DENTE23_7 = :pDENTE23_7, '+
                  ' DENTE23_8 = :pDENTE23_8, '+
                  ' DENTE23_9 = :pDENTE23_9, '+
                  ' DENTE24_1 = :pDENTE24_1, '+
                  ' DENTE24_2 = :pDENTE24_2, '+
                  ' DENTE24_3 = :pDENTE24_3, '+
                  ' DENTE24_4 = :pDENTE24_4, '+
                  ' DENTE24_5 = :pDENTE24_5, '+
                  ' DENTE24_6 = :pDENTE24_6, '+
                  ' DENTE24_7 = :pDENTE24_7, '+
                  ' DENTE24_8 = :pDENTE24_8, '+
                  ' DENTE24_9 = :pDENTE24_9, '+
                  ' DENTE25_1 = :pDENTE25_1, '+
                  ' DENTE25_2 = :pDENTE25_2, '+
                  ' DENTE25_3 = :pDENTE25_3, '+
                  ' DENTE25_4 = :pDENTE25_4, '+
                  ' DENTE25_5 = :pDENTE25_5, '+
                  ' DENTE25_6 = :pDENTE25_6, '+
                  ' DENTE25_7 = :pDENTE25_7, '+
                  ' DENTE25_8 = :pDENTE25_8, '+
                  ' DENTE25_9 = :pDENTE25_9, '+
                  ' DENTE26_1 = :pDENTE26_1, '+
                  ' DENTE26_2 = :pDENTE26_2, '+
                  ' DENTE26_3 = :pDENTE26_3, '+
                  ' DENTE26_4 = :pDENTE26_4, '+
                  ' DENTE26_5 = :pDENTE26_5, '+
                  ' DENTE26_6 = :pDENTE26_6, '+
                  ' DENTE26_7 = :pDENTE26_7, '+
                  ' DENTE26_8 = :pDENTE26_8, '+
                  ' DENTE26_9 = :pDENTE26_9, '+
                  ' DENTE27_1 = :pDENTE27_1, '+
                  ' DENTE27_2 = :pDENTE27_2, '+
                  ' DENTE27_3 = :pDENTE27_3, '+
                  ' DENTE27_4 = :pDENTE27_4, '+
                  ' DENTE27_5 = :pDENTE27_5, '+
                  ' DENTE27_6 = :pDENTE27_6, '+
                  ' DENTE27_7 = :pDENTE27_7, '+
                  ' DENTE27_8 = :pDENTE27_8, '+
                  ' DENTE27_9 = :pDENTE27_9, '+
                  ' DENTE28_1 = :pDENTE28_1, '+
                  ' DENTE28_2 = :pDENTE28_2, '+
                  ' DENTE28_3 = :pDENTE28_3, '+
                  ' DENTE28_4 = :pDENTE28_4, '+
                  ' DENTE28_5 = :pDENTE28_5, '+
                  ' DENTE28_6 = :pDENTE28_6, '+
                  ' DENTE28_7 = :pDENTE28_7, '+
                  ' DENTE28_8 = :pDENTE28_8, '+
                  ' DENTE28_9 = :pDENTE28_9, '+

                  ' DENTE31_1 = :pDENTE31_1, '+
                  ' DENTE31_2 = :pDENTE31_2, '+
                  ' DENTE31_3 = :pDENTE31_3, '+
                  ' DENTE31_4 = :pDENTE31_4, '+
                  ' DENTE31_5 = :pDENTE31_5, '+
                  ' DENTE31_6 = :pDENTE31_6, '+
                  ' DENTE31_7 = :pDENTE31_7, '+
                  ' DENTE31_8 = :pDENTE31_8, '+
                  ' DENTE31_9 = :pDENTE31_9, '+
                  ' DENTE32_1 = :pDENTE32_1, '+
                  ' DENTE32_2 = :pDENTE32_2, '+
                  ' DENTE32_3 = :pDENTE32_3, '+
                  ' DENTE32_4 = :pDENTE32_4, '+
                  ' DENTE32_5 = :pDENTE32_5, '+
                  ' DENTE32_6 = :pDENTE32_6, '+
                  ' DENTE32_7 = :pDENTE32_7, '+
                  ' DENTE32_8 = :pDENTE32_8, '+
                  ' DENTE32_9 = :pDENTE32_9, '+
                  ' DENTE33_1 = :pDENTE33_1, '+
                  ' DENTE33_2 = :pDENTE33_2, '+
                  ' DENTE33_3 = :pDENTE33_3, '+
                  ' DENTE33_4 = :pDENTE33_4, '+
                  ' DENTE33_5 = :pDENTE33_5, '+
                  ' DENTE33_6 = :pDENTE33_6, '+
                  ' DENTE33_7 = :pDENTE33_7, '+
                  ' DENTE33_8 = :pDENTE33_8, '+
                  ' DENTE33_9 = :pDENTE33_9, '+
                  ' DENTE34_1 = :pDENTE34_1, '+
                  ' DENTE34_2 = :pDENTE34_2, '+
                  ' DENTE34_3 = :pDENTE34_3, '+
                  ' DENTE34_4 = :pDENTE34_4, '+
                  ' DENTE34_5 = :pDENTE34_5, '+
                  ' DENTE34_6 = :pDENTE34_6, '+
                  ' DENTE34_7 = :pDENTE34_7, '+
                  ' DENTE34_8 = :pDENTE34_8, '+
                  ' DENTE34_9 = :pDENTE34_9, '+
                  ' DENTE35_1 = :pDENTE35_1, '+
                  ' DENTE35_2 = :pDENTE35_2, '+
                  ' DENTE35_3 = :pDENTE35_3, '+
                  ' DENTE35_4 = :pDENTE35_4, '+
                  ' DENTE35_5 = :pDENTE35_5, '+
                  ' DENTE35_6 = :pDENTE35_6, '+
                  ' DENTE35_7 = :pDENTE35_7, '+
                  ' DENTE35_8 = :pDENTE35_8, '+
                  ' DENTE35_9 = :pDENTE35_9, '+
                  ' DENTE36_1 = :pDENTE36_1, '+
                  ' DENTE36_2 = :pDENTE36_2, '+
                  ' DENTE36_3 = :pDENTE36_3, '+
                  ' DENTE36_4 = :pDENTE36_4, '+
                  ' DENTE36_5 = :pDENTE36_5, '+
                  ' DENTE36_6 = :pDENTE36_6, '+
                  ' DENTE36_7 = :pDENTE36_7, '+
                  ' DENTE36_8 = :pDENTE36_8, '+
                  ' DENTE36_9 = :pDENTE36_9, '+
                  ' DENTE37_1 = :pDENTE37_1, '+
                  ' DENTE37_2 = :pDENTE37_2, '+
                  ' DENTE37_3 = :pDENTE37_3, '+
                  ' DENTE37_4 = :pDENTE37_4, '+
                  ' DENTE37_5 = :pDENTE37_5, '+
                  ' DENTE37_6 = :pDENTE37_6, '+
                  ' DENTE37_7 = :pDENTE37_7, '+
                  ' DENTE37_8 = :pDENTE37_8, '+
                  ' DENTE37_9 = :pDENTE37_9, '+
                  ' DENTE38_1 = :pDENTE38_1, '+
                  ' DENTE38_2 = :pDENTE38_2, '+
                  ' DENTE38_3 = :pDENTE38_3, '+
                  ' DENTE38_4 = :pDENTE38_4, '+
                  ' DENTE38_5 = :pDENTE38_5, '+
                  ' DENTE38_6 = :pDENTE38_6, '+
                  ' DENTE38_7 = :pDENTE38_7, '+
                  ' DENTE38_8 = :pDENTE38_8, '+
                  ' DENTE38_9 = :pDENTE38_9, '+

                  ' DENTE41_1 = :pDENTE41_1, '+
                  ' DENTE41_2 = :pDENTE41_2, '+
                  ' DENTE41_3 = :pDENTE41_3, '+
                  ' DENTE41_4 = :pDENTE41_4, '+
                  ' DENTE41_5 = :pDENTE41_5, '+
                  ' DENTE41_6 = :pDENTE41_6, '+
                  ' DENTE41_7 = :pDENTE41_7, '+
                  ' DENTE41_8 = :pDENTE41_8, '+
                  ' DENTE41_9 = :pDENTE41_9, '+
                  ' DENTE42_1 = :pDENTE42_1, '+
                  ' DENTE42_2 = :pDENTE42_2, '+
                  ' DENTE42_3 = :pDENTE42_3, '+
                  ' DENTE42_4 = :pDENTE42_4, '+
                  ' DENTE42_5 = :pDENTE42_5, '+
                  ' DENTE42_6 = :pDENTE42_6, '+
                  ' DENTE42_7 = :pDENTE42_7, '+
                  ' DENTE42_8 = :pDENTE42_8, '+
                  ' DENTE42_9 = :pDENTE42_9, '+
                  ' DENTE43_1 = :pDENTE43_1, '+
                  ' DENTE43_2 = :pDENTE43_2, '+
                  ' DENTE43_3 = :pDENTE43_3, '+
                  ' DENTE43_4 = :pDENTE43_4, '+
                  ' DENTE43_5 = :pDENTE43_5, '+
                  ' DENTE43_6 = :pDENTE43_6, '+
                  ' DENTE43_7 = :pDENTE43_7, '+
                  ' DENTE43_8 = :pDENTE43_8, '+
                  ' DENTE43_9 = :pDENTE43_9, '+
                  ' DENTE44_1 = :pDENTE44_1, '+
                  ' DENTE44_2 = :pDENTE44_2, '+
                  ' DENTE44_3 = :pDENTE44_3, '+
                  ' DENTE44_4 = :pDENTE44_4, '+
                  ' DENTE44_5 = :pDENTE44_5, '+
                  ' DENTE44_6 = :pDENTE44_6, '+
                  ' DENTE44_7 = :pDENTE44_7, '+
                  ' DENTE44_8 = :pDENTE44_8, '+
                  ' DENTE44_9 = :pDENTE44_9, '+
                  ' DENTE45_1 = :pDENTE45_1, '+
                  ' DENTE45_2 = :pDENTE45_2, '+
                  ' DENTE45_3 = :pDENTE45_3, '+
                  ' DENTE45_4 = :pDENTE45_4, '+
                  ' DENTE45_5 = :pDENTE45_5, '+
                  ' DENTE45_6 = :pDENTE45_6, '+
                  ' DENTE45_7 = :pDENTE45_7, '+
                  ' DENTE45_8 = :pDENTE45_8, '+
                  ' DENTE45_9 = :pDENTE45_9, '+
                  ' DENTE46_1 = :pDENTE46_1, '+
                  ' DENTE46_2 = :pDENTE46_2, '+
                  ' DENTE46_3 = :pDENTE46_3, '+
                  ' DENTE46_4 = :pDENTE46_4, '+
                  ' DENTE46_5 = :pDENTE46_5, '+
                  ' DENTE46_6 = :pDENTE46_6, '+
                  ' DENTE46_7 = :pDENTE46_7, '+
                  ' DENTE46_8 = :pDENTE46_8, '+
                  ' DENTE46_9 = :pDENTE46_9, '+
                  ' DENTE47_1 = :pDENTE47_1, '+
                  ' DENTE47_2 = :pDENTE47_2, '+
                  ' DENTE47_3 = :pDENTE47_3, '+
                  ' DENTE47_4 = :pDENTE47_4, '+
                  ' DENTE47_5 = :pDENTE47_5, '+
                  ' DENTE47_6 = :pDENTE47_6, '+
                  ' DENTE47_7 = :pDENTE47_7, '+
                  ' DENTE47_8 = :pDENTE47_8, '+
                  ' DENTE47_9 = :pDENTE47_9, '+
                  ' DENTE48_1 = :pDENTE48_1, '+
                  ' DENTE48_2 = :pDENTE48_2, '+
                  ' DENTE48_3 = :pDENTE48_3, '+
                  ' DENTE48_4 = :pDENTE48_4, '+
                  ' DENTE48_5 = :pDENTE48_5, '+
                  ' DENTE48_6 = :pDENTE48_6, '+
                  ' DENTE48_7 = :pDENTE48_7, '+
                  ' DENTE48_8 = :pDENTE48_8, '+
                  ' DENTE48_9 = :pDENTE48_9 '+
                  ' where NU_CLIENTE = :pNU_CLIENTE';

          vMsg := 'alterado';
        end;

      2: //apagar
        begin
          if Confirmacao('Confirmação', 'Deseja, realmente, excluir este registro?') then begin

            vSQLOdontograma := 'delete from ODO00 '+
                    'where INDICE = :pINDICE';

            vMsg := 'excluido';

          end
          else Exit;
        end;
    end; // case
end;

procedure TfrmOdontograma.ParametrosCad;
begin
    try
      DM.TRANSACAO.TransactionID  := DM.NewTransactionID;
      DM.TRANSACAO.IsolationLevel := xilREPEATABLEREAD;

      DM.sqlAux.SQL.Clear;
      DM.sqlAux.CommandText := vSQLOdontograma;

      DM.sqlAux.ParamByName('pNU_CLIENTE').AsInteger := DM.sdsClienteINDICE.AsInteger;

        // se for inserir ou alterar passa os parametros
      if vTipo in [0,1] then begin
        DM.sqlAux.ParamByName('pDENTE11_1').AsString := ColorToString(gbx11_1.Color);
        DM.sqlAux.ParamByName('pDENTE11_2').AsString := ColorToString(gbx11_2.Color);
        DM.sqlAux.ParamByName('pDENTE11_3').AsString := ColorToString(gbx11_3.Color);
        DM.sqlAux.ParamByName('pDENTE11_4').AsString := ColorToString(gbx11_4.Color);
        DM.sqlAux.ParamByName('pDENTE11_5').AsString := ColorToString(gbx11_5.Color);
        DM.sqlAux.ParamByName('pDENTE11_6').AsString := ColorToString(gbx11_6.Color);
        DM.sqlAux.ParamByName('pDENTE11_7').AsString := ColorToString(gbx11_7.Color);
        DM.sqlAux.ParamByName('pDENTE11_8').AsString := ColorToString(gbx11_8.Color);
        DM.sqlAux.ParamByName('pDENTE11_9').AsString := ColorToString(gbx11_9.Color);
        DM.sqlAux.ParamByName('pDENTE12_1').AsString := ColorToString(gbx12_1.Color);
        DM.sqlAux.ParamByName('pDENTE12_2').AsString := ColorToString(gbx12_2.Color);
        DM.sqlAux.ParamByName('pDENTE12_3').AsString := ColorToString(gbx12_3.Color);
        DM.sqlAux.ParamByName('pDENTE12_4').AsString := ColorToString(gbx12_4.Color);
        DM.sqlAux.ParamByName('pDENTE12_5').AsString := ColorToString(gbx12_5.Color);
        DM.sqlAux.ParamByName('pDENTE12_6').AsString := ColorToString(gbx12_6.Color);
        DM.sqlAux.ParamByName('pDENTE12_7').AsString := ColorToString(gbx12_7.Color);
        DM.sqlAux.ParamByName('pDENTE12_8').AsString := ColorToString(gbx12_8.Color);
        DM.sqlAux.ParamByName('pDENTE12_9').AsString := ColorToString(gbx12_9.Color);
        DM.sqlAux.ParamByName('pDENTE13_1').AsString := ColorToString(gbx13_1.Color);
        DM.sqlAux.ParamByName('pDENTE13_2').AsString := ColorToString(gbx13_2.Color);
        DM.sqlAux.ParamByName('pDENTE13_3').AsString := ColorToString(gbx13_3.Color);
        DM.sqlAux.ParamByName('pDENTE13_4').AsString := ColorToString(gbx13_4.Color);
        DM.sqlAux.ParamByName('pDENTE13_5').AsString := ColorToString(gbx13_5.Color);
        DM.sqlAux.ParamByName('pDENTE13_6').AsString := ColorToString(gbx13_6.Color);
        DM.sqlAux.ParamByName('pDENTE13_7').AsString := ColorToString(gbx13_7.Color);
        DM.sqlAux.ParamByName('pDENTE13_8').AsString := ColorToString(gbx13_8.Color);
        DM.sqlAux.ParamByName('pDENTE13_9').AsString := ColorToString(gbx13_9.Color);
        DM.sqlAux.ParamByName('pDENTE14_1').AsString := ColorToString(gbx14_1.Color);
        DM.sqlAux.ParamByName('pDENTE14_2').AsString := ColorToString(gbx14_2.Color);
        DM.sqlAux.ParamByName('pDENTE14_3').AsString := ColorToString(gbx14_3.Color);
        DM.sqlAux.ParamByName('pDENTE14_4').AsString := ColorToString(gbx14_4.Color);
        DM.sqlAux.ParamByName('pDENTE14_5').AsString := ColorToString(gbx14_5.Color);
        DM.sqlAux.ParamByName('pDENTE14_6').AsString := ColorToString(gbx14_6.Color);
        DM.sqlAux.ParamByName('pDENTE14_7').AsString := ColorToString(gbx14_7.Color);
        DM.sqlAux.ParamByName('pDENTE14_8').AsString := ColorToString(gbx14_8.Color);
        DM.sqlAux.ParamByName('pDENTE14_9').AsString := ColorToString(gbx14_9.Color);
        DM.sqlAux.ParamByName('pDENTE15_1').AsString := ColorToString(gbx15_1.Color);
        DM.sqlAux.ParamByName('pDENTE15_2').AsString := ColorToString(gbx15_2.Color);
        DM.sqlAux.ParamByName('pDENTE15_3').AsString := ColorToString(gbx15_3.Color);
        DM.sqlAux.ParamByName('pDENTE15_4').AsString := ColorToString(gbx15_4.Color);
        DM.sqlAux.ParamByName('pDENTE15_5').AsString := ColorToString(gbx15_5.Color);
        DM.sqlAux.ParamByName('pDENTE15_6').AsString := ColorToString(gbx15_6.Color);
        DM.sqlAux.ParamByName('pDENTE15_7').AsString := ColorToString(gbx15_7.Color);
        DM.sqlAux.ParamByName('pDENTE15_8').AsString := ColorToString(gbx15_8.Color);
        DM.sqlAux.ParamByName('pDENTE15_9').AsString := ColorToString(gbx15_9.Color);
        DM.sqlAux.ParamByName('pDENTE16_1').AsString := ColorToString(gbx16_1.Color);
        DM.sqlAux.ParamByName('pDENTE16_2').AsString := ColorToString(gbx16_2.Color);
        DM.sqlAux.ParamByName('pDENTE16_3').AsString := ColorToString(gbx16_3.Color);
        DM.sqlAux.ParamByName('pDENTE16_4').AsString := ColorToString(gbx16_4.Color);
        DM.sqlAux.ParamByName('pDENTE16_5').AsString := ColorToString(gbx16_5.Color);
        DM.sqlAux.ParamByName('pDENTE16_6').AsString := ColorToString(gbx16_6.Color);
        DM.sqlAux.ParamByName('pDENTE16_7').AsString := ColorToString(gbx16_7.Color);
        DM.sqlAux.ParamByName('pDENTE16_8').AsString := ColorToString(gbx16_8.Color);
        DM.sqlAux.ParamByName('pDENTE16_9').AsString := ColorToString(gbx16_9.Color);
        DM.sqlAux.ParamByName('pDENTE17_1').AsString := ColorToString(gbx17_1.Color);
        DM.sqlAux.ParamByName('pDENTE17_2').AsString := ColorToString(gbx17_2.Color);
        DM.sqlAux.ParamByName('pDENTE17_3').AsString := ColorToString(gbx17_3.Color);
        DM.sqlAux.ParamByName('pDENTE17_4').AsString := ColorToString(gbx17_4.Color);
        DM.sqlAux.ParamByName('pDENTE17_5').AsString := ColorToString(gbx17_5.Color);
        DM.sqlAux.ParamByName('pDENTE17_6').AsString := ColorToString(gbx17_6.Color);
        DM.sqlAux.ParamByName('pDENTE17_7').AsString := ColorToString(gbx17_7.Color);
        DM.sqlAux.ParamByName('pDENTE17_8').AsString := ColorToString(gbx17_8.Color);
        DM.sqlAux.ParamByName('pDENTE17_9').AsString := ColorToString(gbx17_9.Color);
        DM.sqlAux.ParamByName('pDENTE18_1').AsString := ColorToString(gbx18_1.Color);
        DM.sqlAux.ParamByName('pDENTE18_2').AsString := ColorToString(gbx18_2.Color);
        DM.sqlAux.ParamByName('pDENTE18_3').AsString := ColorToString(gbx18_3.Color);
        DM.sqlAux.ParamByName('pDENTE18_4').AsString := ColorToString(gbx18_4.Color);
        DM.sqlAux.ParamByName('pDENTE18_5').AsString := ColorToString(gbx18_5.Color);
        DM.sqlAux.ParamByName('pDENTE18_6').AsString := ColorToString(gbx18_6.Color);
        DM.sqlAux.ParamByName('pDENTE18_7').AsString := ColorToString(gbx18_7.Color);
        DM.sqlAux.ParamByName('pDENTE18_8').AsString := ColorToString(gbx18_8.Color);
        DM.sqlAux.ParamByName('pDENTE18_9').AsString := ColorToString(gbx18_9.Color);

        DM.sqlAux.ParamByName('pDENTE21_1').AsString := ColorToString(gbx21_1.Color);
        DM.sqlAux.ParamByName('pDENTE21_2').AsString := ColorToString(gbx21_2.Color);
        DM.sqlAux.ParamByName('pDENTE21_3').AsString := ColorToString(gbx21_3.Color);
        DM.sqlAux.ParamByName('pDENTE21_4').AsString := ColorToString(gbx21_4.Color);
        DM.sqlAux.ParamByName('pDENTE21_5').AsString := ColorToString(gbx21_5.Color);
        DM.sqlAux.ParamByName('pDENTE21_6').AsString := ColorToString(gbx21_6.Color);
        DM.sqlAux.ParamByName('pDENTE21_7').AsString := ColorToString(gbx21_7.Color);
        DM.sqlAux.ParamByName('pDENTE21_8').AsString := ColorToString(gbx21_8.Color);
        DM.sqlAux.ParamByName('pDENTE21_9').AsString := ColorToString(gbx21_9.Color);
        DM.sqlAux.ParamByName('pDENTE22_1').AsString := ColorToString(gbx22_1.Color);
        DM.sqlAux.ParamByName('pDENTE22_2').AsString := ColorToString(gbx22_2.Color);
        DM.sqlAux.ParamByName('pDENTE22_3').AsString := ColorToString(gbx22_3.Color);
        DM.sqlAux.ParamByName('pDENTE22_4').AsString := ColorToString(gbx22_4.Color);
        DM.sqlAux.ParamByName('pDENTE22_5').AsString := ColorToString(gbx22_5.Color);
        DM.sqlAux.ParamByName('pDENTE22_6').AsString := ColorToString(gbx22_6.Color);
        DM.sqlAux.ParamByName('pDENTE22_7').AsString := ColorToString(gbx22_7.Color);
        DM.sqlAux.ParamByName('pDENTE22_8').AsString := ColorToString(gbx22_8.Color);
        DM.sqlAux.ParamByName('pDENTE22_9').AsString := ColorToString(gbx22_9.Color);
        DM.sqlAux.ParamByName('pDENTE23_1').AsString := ColorToString(gbx23_1.Color);
        DM.sqlAux.ParamByName('pDENTE23_2').AsString := ColorToString(gbx23_2.Color);
        DM.sqlAux.ParamByName('pDENTE23_3').AsString := ColorToString(gbx23_3.Color);
        DM.sqlAux.ParamByName('pDENTE23_4').AsString := ColorToString(gbx23_4.Color);
        DM.sqlAux.ParamByName('pDENTE23_5').AsString := ColorToString(gbx23_5.Color);
        DM.sqlAux.ParamByName('pDENTE23_6').AsString := ColorToString(gbx23_6.Color);
        DM.sqlAux.ParamByName('pDENTE23_7').AsString := ColorToString(gbx23_7.Color);
        DM.sqlAux.ParamByName('pDENTE23_8').AsString := ColorToString(gbx23_8.Color);
        DM.sqlAux.ParamByName('pDENTE23_9').AsString := ColorToString(gbx23_9.Color);
        DM.sqlAux.ParamByName('pDENTE24_1').AsString := ColorToString(gbx24_1.Color);
        DM.sqlAux.ParamByName('pDENTE24_2').AsString := ColorToString(gbx24_2.Color);
        DM.sqlAux.ParamByName('pDENTE24_3').AsString := ColorToString(gbx24_3.Color);
        DM.sqlAux.ParamByName('pDENTE24_4').AsString := ColorToString(gbx24_4.Color);
        DM.sqlAux.ParamByName('pDENTE24_5').AsString := ColorToString(gbx24_5.Color);
        DM.sqlAux.ParamByName('pDENTE24_6').AsString := ColorToString(gbx24_6.Color);
        DM.sqlAux.ParamByName('pDENTE24_7').AsString := ColorToString(gbx24_7.Color);
        DM.sqlAux.ParamByName('pDENTE24_8').AsString := ColorToString(gbx24_8.Color);
        DM.sqlAux.ParamByName('pDENTE24_9').AsString := ColorToString(gbx24_9.Color);
        DM.sqlAux.ParamByName('pDENTE25_1').AsString := ColorToString(gbx25_1.Color);
        DM.sqlAux.ParamByName('pDENTE25_2').AsString := ColorToString(gbx25_2.Color);
        DM.sqlAux.ParamByName('pDENTE25_3').AsString := ColorToString(gbx25_3.Color);
        DM.sqlAux.ParamByName('pDENTE25_4').AsString := ColorToString(gbx25_4.Color);
        DM.sqlAux.ParamByName('pDENTE25_5').AsString := ColorToString(gbx25_5.Color);
        DM.sqlAux.ParamByName('pDENTE25_6').AsString := ColorToString(gbx25_6.Color);
        DM.sqlAux.ParamByName('pDENTE25_7').AsString := ColorToString(gbx25_7.Color);
        DM.sqlAux.ParamByName('pDENTE25_8').AsString := ColorToString(gbx25_8.Color);
        DM.sqlAux.ParamByName('pDENTE25_9').AsString := ColorToString(gbx25_9.Color);
        DM.sqlAux.ParamByName('pDENTE26_1').AsString := ColorToString(gbx26_1.Color);
        DM.sqlAux.ParamByName('pDENTE26_2').AsString := ColorToString(gbx26_2.Color);
        DM.sqlAux.ParamByName('pDENTE26_3').AsString := ColorToString(gbx26_3.Color);
        DM.sqlAux.ParamByName('pDENTE26_4').AsString := ColorToString(gbx26_4.Color);
        DM.sqlAux.ParamByName('pDENTE26_5').AsString := ColorToString(gbx26_5.Color);
        DM.sqlAux.ParamByName('pDENTE26_6').AsString := ColorToString(gbx26_6.Color);
        DM.sqlAux.ParamByName('pDENTE26_7').AsString := ColorToString(gbx26_7.Color);
        DM.sqlAux.ParamByName('pDENTE26_8').AsString := ColorToString(gbx26_8.Color);
        DM.sqlAux.ParamByName('pDENTE26_9').AsString := ColorToString(gbx26_9.Color);
        DM.sqlAux.ParamByName('pDENTE27_1').AsString := ColorToString(gbx27_1.Color);
        DM.sqlAux.ParamByName('pDENTE27_2').AsString := ColorToString(gbx27_2.Color);
        DM.sqlAux.ParamByName('pDENTE27_3').AsString := ColorToString(gbx27_3.Color);
        DM.sqlAux.ParamByName('pDENTE27_4').AsString := ColorToString(gbx27_4.Color);
        DM.sqlAux.ParamByName('pDENTE27_5').AsString := ColorToString(gbx27_5.Color);
        DM.sqlAux.ParamByName('pDENTE27_6').AsString := ColorToString(gbx27_6.Color);
        DM.sqlAux.ParamByName('pDENTE27_7').AsString := ColorToString(gbx27_7.Color);
        DM.sqlAux.ParamByName('pDENTE27_8').AsString := ColorToString(gbx27_8.Color);
        DM.sqlAux.ParamByName('pDENTE27_9').AsString := ColorToString(gbx27_9.Color);
        DM.sqlAux.ParamByName('pDENTE28_1').AsString := ColorToString(gbx28_1.Color);
        DM.sqlAux.ParamByName('pDENTE28_2').AsString := ColorToString(gbx28_2.Color);
        DM.sqlAux.ParamByName('pDENTE28_3').AsString := ColorToString(gbx28_3.Color);
        DM.sqlAux.ParamByName('pDENTE28_4').AsString := ColorToString(gbx28_4.Color);
        DM.sqlAux.ParamByName('pDENTE28_5').AsString := ColorToString(gbx28_5.Color);
        DM.sqlAux.ParamByName('pDENTE28_6').AsString := ColorToString(gbx28_6.Color);
        DM.sqlAux.ParamByName('pDENTE28_7').AsString := ColorToString(gbx28_7.Color);
        DM.sqlAux.ParamByName('pDENTE28_8').AsString := ColorToString(gbx28_8.Color);
        DM.sqlAux.ParamByName('pDENTE28_9').AsString := ColorToString(gbx28_9.Color);

        DM.sqlAux.ParamByName('pDENTE31_1').AsString := ColorToString(gbx31_1.Color);
        DM.sqlAux.ParamByName('pDENTE31_2').AsString := ColorToString(gbx31_2.Color);
        DM.sqlAux.ParamByName('pDENTE31_3').AsString := ColorToString(gbx31_3.Color);
        DM.sqlAux.ParamByName('pDENTE31_4').AsString := ColorToString(gbx31_4.Color);
        DM.sqlAux.ParamByName('pDENTE31_5').AsString := ColorToString(gbx31_5.Color);
        DM.sqlAux.ParamByName('pDENTE31_6').AsString := ColorToString(gbx31_6.Color);
        DM.sqlAux.ParamByName('pDENTE31_7').AsString := ColorToString(gbx31_7.Color);
        DM.sqlAux.ParamByName('pDENTE31_8').AsString := ColorToString(gbx31_8.Color);
        DM.sqlAux.ParamByName('pDENTE31_9').AsString := ColorToString(gbx31_9.Color);
        DM.sqlAux.ParamByName('pDENTE32_1').AsString := ColorToString(gbx32_1.Color);
        DM.sqlAux.ParamByName('pDENTE32_2').AsString := ColorToString(gbx32_2.Color);
        DM.sqlAux.ParamByName('pDENTE32_3').AsString := ColorToString(gbx32_3.Color);
        DM.sqlAux.ParamByName('pDENTE32_4').AsString := ColorToString(gbx32_4.Color);
        DM.sqlAux.ParamByName('pDENTE32_5').AsString := ColorToString(gbx32_5.Color);
        DM.sqlAux.ParamByName('pDENTE32_6').AsString := ColorToString(gbx32_6.Color);
        DM.sqlAux.ParamByName('pDENTE32_7').AsString := ColorToString(gbx32_7.Color);
        DM.sqlAux.ParamByName('pDENTE32_8').AsString := ColorToString(gbx32_8.Color);
        DM.sqlAux.ParamByName('pDENTE32_9').AsString := ColorToString(gbx32_9.Color);
        DM.sqlAux.ParamByName('pDENTE33_1').AsString := ColorToString(gbx33_1.Color);
        DM.sqlAux.ParamByName('pDENTE33_2').AsString := ColorToString(gbx33_2.Color);
        DM.sqlAux.ParamByName('pDENTE33_3').AsString := ColorToString(gbx33_3.Color);
        DM.sqlAux.ParamByName('pDENTE33_4').AsString := ColorToString(gbx33_4.Color);
        DM.sqlAux.ParamByName('pDENTE33_5').AsString := ColorToString(gbx33_5.Color);
        DM.sqlAux.ParamByName('pDENTE33_6').AsString := ColorToString(gbx33_6.Color);
        DM.sqlAux.ParamByName('pDENTE33_7').AsString := ColorToString(gbx33_7.Color);
        DM.sqlAux.ParamByName('pDENTE33_8').AsString := ColorToString(gbx33_8.Color);
        DM.sqlAux.ParamByName('pDENTE33_9').AsString := ColorToString(gbx33_9.Color);
        DM.sqlAux.ParamByName('pDENTE34_1').AsString := ColorToString(gbx34_1.Color);
        DM.sqlAux.ParamByName('pDENTE34_2').AsString := ColorToString(gbx34_2.Color);
        DM.sqlAux.ParamByName('pDENTE34_3').AsString := ColorToString(gbx34_3.Color);
        DM.sqlAux.ParamByName('pDENTE34_4').AsString := ColorToString(gbx34_4.Color);
        DM.sqlAux.ParamByName('pDENTE34_5').AsString := ColorToString(gbx34_5.Color);
        DM.sqlAux.ParamByName('pDENTE34_6').AsString := ColorToString(gbx34_6.Color);
        DM.sqlAux.ParamByName('pDENTE34_7').AsString := ColorToString(gbx34_7.Color);
        DM.sqlAux.ParamByName('pDENTE34_8').AsString := ColorToString(gbx34_8.Color);
        DM.sqlAux.ParamByName('pDENTE34_9').AsString := ColorToString(gbx34_9.Color);
        DM.sqlAux.ParamByName('pDENTE35_1').AsString := ColorToString(gbx35_1.Color);
        DM.sqlAux.ParamByName('pDENTE35_2').AsString := ColorToString(gbx35_2.Color);
        DM.sqlAux.ParamByName('pDENTE35_3').AsString := ColorToString(gbx35_3.Color);
        DM.sqlAux.ParamByName('pDENTE35_4').AsString := ColorToString(gbx35_4.Color);
        DM.sqlAux.ParamByName('pDENTE35_5').AsString := ColorToString(gbx35_5.Color);
        DM.sqlAux.ParamByName('pDENTE35_6').AsString := ColorToString(gbx35_6.Color);
        DM.sqlAux.ParamByName('pDENTE35_7').AsString := ColorToString(gbx35_7.Color);
        DM.sqlAux.ParamByName('pDENTE35_8').AsString := ColorToString(gbx35_8.Color);
        DM.sqlAux.ParamByName('pDENTE35_9').AsString := ColorToString(gbx35_9.Color);
        DM.sqlAux.ParamByName('pDENTE36_1').AsString := ColorToString(gbx36_1.Color);
        DM.sqlAux.ParamByName('pDENTE36_2').AsString := ColorToString(gbx36_2.Color);
        DM.sqlAux.ParamByName('pDENTE36_3').AsString := ColorToString(gbx36_3.Color);
        DM.sqlAux.ParamByName('pDENTE36_4').AsString := ColorToString(gbx36_4.Color);
        DM.sqlAux.ParamByName('pDENTE36_5').AsString := ColorToString(gbx36_5.Color);
        DM.sqlAux.ParamByName('pDENTE36_6').AsString := ColorToString(gbx36_6.Color);
        DM.sqlAux.ParamByName('pDENTE36_7').AsString := ColorToString(gbx36_7.Color);
        DM.sqlAux.ParamByName('pDENTE36_8').AsString := ColorToString(gbx36_8.Color);
        DM.sqlAux.ParamByName('pDENTE36_9').AsString := ColorToString(gbx36_9.Color);
        DM.sqlAux.ParamByName('pDENTE37_1').AsString := ColorToString(gbx37_1.Color);
        DM.sqlAux.ParamByName('pDENTE37_2').AsString := ColorToString(gbx37_2.Color);
        DM.sqlAux.ParamByName('pDENTE37_3').AsString := ColorToString(gbx37_3.Color);
        DM.sqlAux.ParamByName('pDENTE37_4').AsString := ColorToString(gbx37_4.Color);
        DM.sqlAux.ParamByName('pDENTE37_5').AsString := ColorToString(gbx37_5.Color);
        DM.sqlAux.ParamByName('pDENTE37_6').AsString := ColorToString(gbx37_6.Color);
        DM.sqlAux.ParamByName('pDENTE37_7').AsString := ColorToString(gbx37_7.Color);
        DM.sqlAux.ParamByName('pDENTE37_8').AsString := ColorToString(gbx37_8.Color);
        DM.sqlAux.ParamByName('pDENTE37_9').AsString := ColorToString(gbx37_9.Color);
        DM.sqlAux.ParamByName('pDENTE38_1').AsString := ColorToString(gbx38_1.Color);
        DM.sqlAux.ParamByName('pDENTE38_2').AsString := ColorToString(gbx38_2.Color);
        DM.sqlAux.ParamByName('pDENTE38_3').AsString := ColorToString(gbx38_3.Color);
        DM.sqlAux.ParamByName('pDENTE38_4').AsString := ColorToString(gbx38_4.Color);
        DM.sqlAux.ParamByName('pDENTE38_5').AsString := ColorToString(gbx38_5.Color);
        DM.sqlAux.ParamByName('pDENTE38_6').AsString := ColorToString(gbx38_6.Color);
        DM.sqlAux.ParamByName('pDENTE38_7').AsString := ColorToString(gbx38_7.Color);
        DM.sqlAux.ParamByName('pDENTE38_8').AsString := ColorToString(gbx38_8.Color);
        DM.sqlAux.ParamByName('pDENTE38_9').AsString := ColorToString(gbx38_9.Color);

        DM.sqlAux.ParamByName('pDENTE41_1').AsString := ColorToString(gbx41_1.Color);
        DM.sqlAux.ParamByName('pDENTE41_2').AsString := ColorToString(gbx41_2.Color);
        DM.sqlAux.ParamByName('pDENTE41_3').AsString := ColorToString(gbx41_3.Color);
        DM.sqlAux.ParamByName('pDENTE41_4').AsString := ColorToString(gbx41_4.Color);
        DM.sqlAux.ParamByName('pDENTE41_5').AsString := ColorToString(gbx41_5.Color);
        DM.sqlAux.ParamByName('pDENTE41_6').AsString := ColorToString(gbx41_6.Color);
        DM.sqlAux.ParamByName('pDENTE41_7').AsString := ColorToString(gbx41_7.Color);
        DM.sqlAux.ParamByName('pDENTE41_8').AsString := ColorToString(gbx41_8.Color);
        DM.sqlAux.ParamByName('pDENTE41_9').AsString := ColorToString(gbx41_9.Color);
        DM.sqlAux.ParamByName('pDENTE42_1').AsString := ColorToString(gbx42_1.Color);
        DM.sqlAux.ParamByName('pDENTE42_2').AsString := ColorToString(gbx42_2.Color);
        DM.sqlAux.ParamByName('pDENTE42_3').AsString := ColorToString(gbx42_3.Color);
        DM.sqlAux.ParamByName('pDENTE42_4').AsString := ColorToString(gbx42_4.Color);
        DM.sqlAux.ParamByName('pDENTE42_5').AsString := ColorToString(gbx42_5.Color);
        DM.sqlAux.ParamByName('pDENTE42_6').AsString := ColorToString(gbx42_6.Color);
        DM.sqlAux.ParamByName('pDENTE42_7').AsString := ColorToString(gbx42_7.Color);
        DM.sqlAux.ParamByName('pDENTE42_8').AsString := ColorToString(gbx42_8.Color);
        DM.sqlAux.ParamByName('pDENTE42_9').AsString := ColorToString(gbx42_9.Color);
        DM.sqlAux.ParamByName('pDENTE43_1').AsString := ColorToString(gbx43_1.Color);
        DM.sqlAux.ParamByName('pDENTE43_2').AsString := ColorToString(gbx43_2.Color);
        DM.sqlAux.ParamByName('pDENTE43_3').AsString := ColorToString(gbx43_3.Color);
        DM.sqlAux.ParamByName('pDENTE43_4').AsString := ColorToString(gbx43_4.Color);
        DM.sqlAux.ParamByName('pDENTE43_5').AsString := ColorToString(gbx43_5.Color);
        DM.sqlAux.ParamByName('pDENTE43_6').AsString := ColorToString(gbx43_6.Color);
        DM.sqlAux.ParamByName('pDENTE43_7').AsString := ColorToString(gbx43_7.Color);
        DM.sqlAux.ParamByName('pDENTE43_8').AsString := ColorToString(gbx43_8.Color);
        DM.sqlAux.ParamByName('pDENTE43_9').AsString := ColorToString(gbx43_9.Color);
        DM.sqlAux.ParamByName('pDENTE44_1').AsString := ColorToString(gbx44_1.Color);
        DM.sqlAux.ParamByName('pDENTE44_2').AsString := ColorToString(gbx44_2.Color);
        DM.sqlAux.ParamByName('pDENTE44_3').AsString := ColorToString(gbx44_3.Color);
        DM.sqlAux.ParamByName('pDENTE44_4').AsString := ColorToString(gbx44_4.Color);
        DM.sqlAux.ParamByName('pDENTE44_5').AsString := ColorToString(gbx44_5.Color);
        DM.sqlAux.ParamByName('pDENTE44_6').AsString := ColorToString(gbx44_6.Color);
        DM.sqlAux.ParamByName('pDENTE44_7').AsString := ColorToString(gbx44_7.Color);
        DM.sqlAux.ParamByName('pDENTE44_8').AsString := ColorToString(gbx44_8.Color);
        DM.sqlAux.ParamByName('pDENTE44_9').AsString := ColorToString(gbx44_9.Color);
        DM.sqlAux.ParamByName('pDENTE45_1').AsString := ColorToString(gbx45_1.Color);
        DM.sqlAux.ParamByName('pDENTE45_2').AsString := ColorToString(gbx45_2.Color);
        DM.sqlAux.ParamByName('pDENTE45_3').AsString := ColorToString(gbx45_3.Color);
        DM.sqlAux.ParamByName('pDENTE45_4').AsString := ColorToString(gbx45_4.Color);
        DM.sqlAux.ParamByName('pDENTE45_5').AsString := ColorToString(gbx45_5.Color);
        DM.sqlAux.ParamByName('pDENTE45_6').AsString := ColorToString(gbx45_6.Color);
        DM.sqlAux.ParamByName('pDENTE45_7').AsString := ColorToString(gbx45_7.Color);
        DM.sqlAux.ParamByName('pDENTE45_8').AsString := ColorToString(gbx45_8.Color);
        DM.sqlAux.ParamByName('pDENTE45_9').AsString := ColorToString(gbx45_9.Color);
        DM.sqlAux.ParamByName('pDENTE46_1').AsString := ColorToString(gbx46_1.Color);
        DM.sqlAux.ParamByName('pDENTE46_2').AsString := ColorToString(gbx46_2.Color);
        DM.sqlAux.ParamByName('pDENTE46_3').AsString := ColorToString(gbx46_3.Color);
        DM.sqlAux.ParamByName('pDENTE46_4').AsString := ColorToString(gbx46_4.Color);
        DM.sqlAux.ParamByName('pDENTE46_5').AsString := ColorToString(gbx46_5.Color);
        DM.sqlAux.ParamByName('pDENTE46_6').AsString := ColorToString(gbx46_6.Color);
        DM.sqlAux.ParamByName('pDENTE46_7').AsString := ColorToString(gbx46_7.Color);
        DM.sqlAux.ParamByName('pDENTE46_8').AsString := ColorToString(gbx46_8.Color);
        DM.sqlAux.ParamByName('pDENTE46_9').AsString := ColorToString(gbx46_9.Color);
        DM.sqlAux.ParamByName('pDENTE47_1').AsString := ColorToString(gbx47_1.Color);
        DM.sqlAux.ParamByName('pDENTE47_2').AsString := ColorToString(gbx47_2.Color);
        DM.sqlAux.ParamByName('pDENTE47_3').AsString := ColorToString(gbx47_3.Color);
        DM.sqlAux.ParamByName('pDENTE47_4').AsString := ColorToString(gbx47_4.Color);
        DM.sqlAux.ParamByName('pDENTE47_5').AsString := ColorToString(gbx47_5.Color);
        DM.sqlAux.ParamByName('pDENTE47_6').AsString := ColorToString(gbx47_6.Color);
        DM.sqlAux.ParamByName('pDENTE47_7').AsString := ColorToString(gbx47_7.Color);
        DM.sqlAux.ParamByName('pDENTE47_8').AsString := ColorToString(gbx47_8.Color);
        DM.sqlAux.ParamByName('pDENTE47_9').AsString := ColorToString(gbx47_9.Color);
        DM.sqlAux.ParamByName('pDENTE48_1').AsString := ColorToString(gbx48_1.Color);
        DM.sqlAux.ParamByName('pDENTE48_2').AsString := ColorToString(gbx48_2.Color);
        DM.sqlAux.ParamByName('pDENTE48_3').AsString := ColorToString(gbx48_3.Color);
        DM.sqlAux.ParamByName('pDENTE48_4').AsString := ColorToString(gbx48_4.Color);
        DM.sqlAux.ParamByName('pDENTE48_5').AsString := ColorToString(gbx48_5.Color);
        DM.sqlAux.ParamByName('pDENTE48_6').AsString := ColorToString(gbx48_6.Color);
        DM.sqlAux.ParamByName('pDENTE48_7').AsString := ColorToString(gbx48_7.Color);
        DM.sqlAux.ParamByName('pDENTE48_8').AsString := ColorToString(gbx48_8.Color);
        DM.sqlAux.ParamByName('pDENTE48_9').AsString := ColorToString(gbx48_9.Color);
      end;

      DM.CONEXAO.StartTransaction(DM.TRANSACAO);
      DM.sqlAux.Close;
      DM.sqlAux.ExecSQL;
      DM.CONEXAO.Commit(DM.TRANSACAO);
      Afirmacao('Confirmação', 'Registro '+vMsg+' com sucesso!');

      if DM.sdsLegenda.RecordCount = 0 then begin
        InsertUpdateDelete2(0);
      end
      else begin
        InsertUpdateDelete2(1);
      end;

    except
      on Exc:Exception do
        begin
          DM.CONEXAO.Rollback(DM.TRANSACAO);
          Informacao('Atenção!', 'Ocorreu um erro no gravação ao banco de dados: ' + Exc.Message);
          Exit;
        end;
    end;
end;

procedure TfrmOdontograma.rbt10Click(Sender: TObject);
begin
    dblLeg1.Enabled := False;
    dblLeg2.Enabled := False;
    dblLeg3.Enabled := False;
    dblLeg4.Enabled := False;
    dblLeg5.Enabled := False;
    dblLeg6.Enabled := False;
    dblLeg7.Enabled := False;
    dblLeg8.Enabled := False;
    dblLeg9.Enabled := False;
    dblLeg10.Enabled := True;
    dblLeg11.Enabled := False;
    dblLeg12.Enabled := False;
    dblLeg13.Enabled := False;
    dblLeg14.Enabled := False;
    dblLeg15.Enabled := False;

    clbLegenda1.Enabled := false;
    clbLegenda2.Enabled := false;
    clbLegenda3.Enabled := false;
    clbLegenda4.Enabled := false;
    clbLegenda5.Enabled := false;
    clbLegenda6.Enabled := false;
    clbLegenda7.Enabled := false;
    clbLegenda8.Enabled := false;
    clbLegenda9.Enabled := false;
    clbLegenda10.Enabled := true;
    clbLegenda11.Enabled := false;
    clbLegenda12.Enabled := false;
    clbLegenda13.Enabled := false;
    clbLegenda14.Enabled := false;
    clbLegenda15.Enabled := false;
end;

procedure TfrmOdontograma.rbt11Click(Sender: TObject);
begin
    dblLeg1.Enabled := False;
    dblLeg2.Enabled := False;
    dblLeg3.Enabled := False;
    dblLeg4.Enabled := False;
    dblLeg5.Enabled := False;
    dblLeg6.Enabled := False;
    dblLeg7.Enabled := False;
    dblLeg8.Enabled := False;
    dblLeg9.Enabled := False;
    dblLeg10.Enabled := False;
    dblLeg11.Enabled := True;
    dblLeg12.Enabled := False;
    dblLeg13.Enabled := False;
    dblLeg14.Enabled := False;
    dblLeg15.Enabled := False;

    clbLegenda1.Enabled := false;
    clbLegenda2.Enabled := false;
    clbLegenda3.Enabled := false;
    clbLegenda4.Enabled := false;
    clbLegenda5.Enabled := false;
    clbLegenda6.Enabled := false;
    clbLegenda7.Enabled := false;
    clbLegenda8.Enabled := false;
    clbLegenda9.Enabled := false;
    clbLegenda10.Enabled := false;
    clbLegenda11.Enabled := true;
    clbLegenda12.Enabled := false;
    clbLegenda13.Enabled := false;
    clbLegenda14.Enabled := false;
    clbLegenda15.Enabled := false;
end;

procedure TfrmOdontograma.rbt12Click(Sender: TObject);
begin
    dblLeg1.Enabled := False;
    dblLeg2.Enabled := False;
    dblLeg3.Enabled := False;
    dblLeg4.Enabled := False;
    dblLeg5.Enabled := False;
    dblLeg6.Enabled := False;
    dblLeg7.Enabled := False;
    dblLeg8.Enabled := False;
    dblLeg9.Enabled := False;
    dblLeg10.Enabled := False;
    dblLeg11.Enabled := False;
    dblLeg12.Enabled := True;
    dblLeg13.Enabled := False;
    dblLeg14.Enabled := False;
    dblLeg15.Enabled := False;

    clbLegenda1.Enabled := false;
    clbLegenda2.Enabled := false;
    clbLegenda3.Enabled := false;
    clbLegenda4.Enabled := false;
    clbLegenda5.Enabled := false;
    clbLegenda6.Enabled := false;
    clbLegenda7.Enabled := false;
    clbLegenda8.Enabled := false;
    clbLegenda9.Enabled := false;
    clbLegenda10.Enabled := false;
    clbLegenda11.Enabled := false;
    clbLegenda12.Enabled := true;
    clbLegenda13.Enabled := false;
    clbLegenda14.Enabled := false;
    clbLegenda15.Enabled := false;
end;

procedure TfrmOdontograma.rbt13Click(Sender: TObject);
begin
    dblLeg1.Enabled := False;
    dblLeg2.Enabled := False;
    dblLeg3.Enabled := False;
    dblLeg4.Enabled := False;
    dblLeg5.Enabled := False;
    dblLeg6.Enabled := False;
    dblLeg7.Enabled := False;
    dblLeg8.Enabled := False;
    dblLeg9.Enabled := False;
    dblLeg10.Enabled := False;
    dblLeg11.Enabled := False;
    dblLeg12.Enabled := False;
    dblLeg13.Enabled := True;
    dblLeg14.Enabled := False;
    dblLeg15.Enabled := False;

    clbLegenda1.Enabled := false;
    clbLegenda2.Enabled := false;
    clbLegenda3.Enabled := false;
    clbLegenda4.Enabled := false;
    clbLegenda5.Enabled := false;
    clbLegenda6.Enabled := false;
    clbLegenda7.Enabled := false;
    clbLegenda8.Enabled := false;
    clbLegenda9.Enabled := false;
    clbLegenda10.Enabled := false;
    clbLegenda11.Enabled := false;
    clbLegenda12.Enabled := false;
    clbLegenda13.Enabled := true;
    clbLegenda14.Enabled := false;
    clbLegenda15.Enabled := false;
end;

procedure TfrmOdontograma.rbt14Click(Sender: TObject);
begin
    dblLeg1.Enabled := False;
    dblLeg2.Enabled := False;
    dblLeg3.Enabled := False;
    dblLeg4.Enabled := False;
    dblLeg5.Enabled := False;
    dblLeg6.Enabled := False;
    dblLeg7.Enabled := False;
    dblLeg8.Enabled := False;
    dblLeg9.Enabled := False;
    dblLeg10.Enabled := False;
    dblLeg11.Enabled := False;
    dblLeg12.Enabled := False;
    dblLeg13.Enabled := False;
    dblLeg14.Enabled := True;
    dblLeg15.Enabled := False;

    clbLegenda1.Enabled := false;
    clbLegenda2.Enabled := false;
    clbLegenda3.Enabled := false;
    clbLegenda4.Enabled := false;
    clbLegenda5.Enabled := false;
    clbLegenda6.Enabled := false;
    clbLegenda7.Enabled := false;
    clbLegenda8.Enabled := false;
    clbLegenda9.Enabled := false;
    clbLegenda10.Enabled := false;
    clbLegenda11.Enabled := false;
    clbLegenda12.Enabled := false;
    clbLegenda13.Enabled := false;
    clbLegenda14.Enabled := true;
    clbLegenda15.Enabled := false;
end;

procedure TfrmOdontograma.rbt15Click(Sender: TObject);
begin
    dblLeg1.Enabled := False;
    dblLeg2.Enabled := False;
    dblLeg3.Enabled := False;
    dblLeg4.Enabled := False;
    dblLeg5.Enabled := False;
    dblLeg6.Enabled := False;
    dblLeg7.Enabled := False;
    dblLeg8.Enabled := False;
    dblLeg9.Enabled := False;
    dblLeg10.Enabled := False;
    dblLeg11.Enabled := False;
    dblLeg12.Enabled := False;
    dblLeg13.Enabled := False;
    dblLeg14.Enabled := False;
    dblLeg15.Enabled := True;

    clbLegenda1.Enabled := false;
    clbLegenda2.Enabled := false;
    clbLegenda3.Enabled := false;
    clbLegenda4.Enabled := false;
    clbLegenda5.Enabled := false;
    clbLegenda6.Enabled := false;
    clbLegenda7.Enabled := false;
    clbLegenda8.Enabled := false;
    clbLegenda9.Enabled := false;
    clbLegenda10.Enabled := false;
    clbLegenda11.Enabled := false;
    clbLegenda12.Enabled := false;
    clbLegenda13.Enabled := false;
    clbLegenda14.Enabled := false;
    clbLegenda15.Enabled := true;
end;

procedure TfrmOdontograma.rbt1Click(Sender: TObject);
begin
    dblLeg1.Enabled := True;
    dblLeg2.Enabled := False;
    dblLeg3.Enabled := False;
    dblLeg4.Enabled := False;
    dblLeg5.Enabled := False;
    dblLeg6.Enabled := False;
    dblLeg7.Enabled := False;
    dblLeg8.Enabled := False;
    dblLeg9.Enabled := False;
    dblLeg10.Enabled := False;
    dblLeg11.Enabled := False;
    dblLeg12.Enabled := False;
    dblLeg13.Enabled := False;
    dblLeg14.Enabled := False;
    dblLeg15.Enabled := False;

    clbLegenda1.Enabled := True;
    clbLegenda2.Enabled := false;
    clbLegenda3.Enabled := false;
    clbLegenda4.Enabled := false;
    clbLegenda5.Enabled := false;
    clbLegenda6.Enabled := false;
    clbLegenda7.Enabled := false;
    clbLegenda8.Enabled := false;
    clbLegenda9.Enabled := false;
    clbLegenda10.Enabled := false;
    clbLegenda11.Enabled := false;
    clbLegenda12.Enabled := false;
    clbLegenda13.Enabled := false;
    clbLegenda14.Enabled := false;
    clbLegenda15.Enabled := false;
end;

procedure TfrmOdontograma.rbt2Click(Sender: TObject);
begin
    dblLeg1.Enabled := False;
    dblLeg2.Enabled := True;
    dblLeg3.Enabled := False;
    dblLeg4.Enabled := False;
    dblLeg5.Enabled := False;
    dblLeg6.Enabled := False;
    dblLeg7.Enabled := False;
    dblLeg8.Enabled := False;
    dblLeg9.Enabled := False;
    dblLeg10.Enabled := False;
    dblLeg11.Enabled := False;
    dblLeg12.Enabled := False;
    dblLeg13.Enabled := False;
    dblLeg14.Enabled := False;
    dblLeg15.Enabled := False;

    clbLegenda1.Enabled := false;
    clbLegenda2.Enabled := True;
    clbLegenda3.Enabled := false;
    clbLegenda4.Enabled := false;
    clbLegenda5.Enabled := false;
    clbLegenda6.Enabled := false;
    clbLegenda7.Enabled := false;
    clbLegenda8.Enabled := false;
    clbLegenda9.Enabled := false;
    clbLegenda10.Enabled := false;
    clbLegenda11.Enabled := false;
    clbLegenda12.Enabled := false;
    clbLegenda13.Enabled := false;
    clbLegenda14.Enabled := false;
    clbLegenda15.Enabled := false;
end;

procedure TfrmOdontograma.rbt3Click(Sender: TObject);
begin
    dblLeg1.Enabled := False;
    dblLeg2.Enabled := False;
    dblLeg3.Enabled := True;
    dblLeg4.Enabled := False;
    dblLeg5.Enabled := False;
    dblLeg6.Enabled := False;
    dblLeg7.Enabled := False;
    dblLeg8.Enabled := False;
    dblLeg9.Enabled := False;
    dblLeg10.Enabled := False;
    dblLeg11.Enabled := False;
    dblLeg12.Enabled := False;
    dblLeg13.Enabled := False;
    dblLeg14.Enabled := False;
    dblLeg15.Enabled := False;

    clbLegenda1.Enabled := false;
    clbLegenda2.Enabled := false;
    clbLegenda3.Enabled := true;
    clbLegenda4.Enabled := false;
    clbLegenda5.Enabled := false;
    clbLegenda6.Enabled := false;
    clbLegenda7.Enabled := false;
    clbLegenda8.Enabled := false;
    clbLegenda9.Enabled := false;
    clbLegenda10.Enabled := false;
    clbLegenda11.Enabled := false;
    clbLegenda12.Enabled := false;
    clbLegenda13.Enabled := false;
    clbLegenda14.Enabled := false;
    clbLegenda15.Enabled := false;
end;

procedure TfrmOdontograma.rbt4Click(Sender: TObject);
begin
    dblLeg1.Enabled := False;
    dblLeg2.Enabled := False;
    dblLeg3.Enabled := False;
    dblLeg4.Enabled := True;
    dblLeg5.Enabled := False;
    dblLeg6.Enabled := False;
    dblLeg7.Enabled := False;
    dblLeg8.Enabled := False;
    dblLeg9.Enabled := False;
    dblLeg10.Enabled := False;
    dblLeg11.Enabled := False;
    dblLeg12.Enabled := False;
    dblLeg13.Enabled := False;
    dblLeg14.Enabled := False;
    dblLeg15.Enabled := False;

    clbLegenda1.Enabled := false;
    clbLegenda2.Enabled := false;
    clbLegenda3.Enabled := false;
    clbLegenda4.Enabled := true;
    clbLegenda5.Enabled := false;
    clbLegenda6.Enabled := false;
    clbLegenda7.Enabled := false;
    clbLegenda8.Enabled := false;
    clbLegenda9.Enabled := false;
    clbLegenda10.Enabled := false;
    clbLegenda11.Enabled := false;
    clbLegenda12.Enabled := false;
    clbLegenda13.Enabled := false;
    clbLegenda14.Enabled := false;
    clbLegenda15.Enabled := false;
end;

procedure TfrmOdontograma.rbt5Click(Sender: TObject);
begin
    dblLeg1.Enabled := False;
    dblLeg2.Enabled := False;
    dblLeg3.Enabled := False;
    dblLeg4.Enabled := False;
    dblLeg5.Enabled := True;
    dblLeg6.Enabled := False;
    dblLeg7.Enabled := False;
    dblLeg8.Enabled := False;
    dblLeg9.Enabled := False;
    dblLeg10.Enabled := False;
    dblLeg11.Enabled := False;
    dblLeg12.Enabled := False;
    dblLeg13.Enabled := False;
    dblLeg14.Enabled := False;
    dblLeg15.Enabled := False;

    clbLegenda1.Enabled := false;
    clbLegenda2.Enabled := false;
    clbLegenda3.Enabled := false;
    clbLegenda4.Enabled := false;
    clbLegenda5.Enabled := true;
    clbLegenda6.Enabled := false;
    clbLegenda7.Enabled := false;
    clbLegenda8.Enabled := false;
    clbLegenda9.Enabled := false;
    clbLegenda10.Enabled := false;
    clbLegenda11.Enabled := false;
    clbLegenda12.Enabled := false;
    clbLegenda13.Enabled := false;
    clbLegenda14.Enabled := false;
    clbLegenda15.Enabled := false;
end;

procedure TfrmOdontograma.rbt6Click(Sender: TObject);
begin
    dblLeg1.Enabled := False;
    dblLeg2.Enabled := False;
    dblLeg3.Enabled := False;
    dblLeg4.Enabled := False;
    dblLeg5.Enabled := False;
    dblLeg6.Enabled := True;
    dblLeg7.Enabled := False;
    dblLeg8.Enabled := False;
    dblLeg9.Enabled := False;
    dblLeg10.Enabled := False;
    dblLeg11.Enabled := False;
    dblLeg12.Enabled := False;
    dblLeg13.Enabled := False;
    dblLeg14.Enabled := False;
    dblLeg15.Enabled := False;

    clbLegenda1.Enabled := false;
    clbLegenda2.Enabled := false;
    clbLegenda3.Enabled := false;
    clbLegenda4.Enabled := false;
    clbLegenda5.Enabled := false;
    clbLegenda6.Enabled := true;
    clbLegenda7.Enabled := false;
    clbLegenda8.Enabled := false;
    clbLegenda9.Enabled := false;
    clbLegenda10.Enabled := false;
    clbLegenda11.Enabled := false;
    clbLegenda12.Enabled := false;
    clbLegenda13.Enabled := false;
    clbLegenda14.Enabled := false;
    clbLegenda15.Enabled := false;
end;

procedure TfrmOdontograma.rbt7Click(Sender: TObject);
begin
    dblLeg1.Enabled := False;
    dblLeg2.Enabled := False;
    dblLeg3.Enabled := False;
    dblLeg4.Enabled := False;
    dblLeg5.Enabled := False;
    dblLeg6.Enabled := False;
    dblLeg7.Enabled := True;
    dblLeg8.Enabled := False;
    dblLeg9.Enabled := False;
    dblLeg10.Enabled := False;
    dblLeg11.Enabled := False;
    dblLeg12.Enabled := False;
    dblLeg13.Enabled := False;
    dblLeg14.Enabled := False;
    dblLeg15.Enabled := False;

    clbLegenda1.Enabled := false;
    clbLegenda2.Enabled := false;
    clbLegenda3.Enabled := false;
    clbLegenda4.Enabled := false;
    clbLegenda5.Enabled := false;
    clbLegenda6.Enabled := false;
    clbLegenda7.Enabled := true;
    clbLegenda8.Enabled := false;
    clbLegenda9.Enabled := false;
    clbLegenda10.Enabled := false;
    clbLegenda11.Enabled := false;
    clbLegenda12.Enabled := false;
    clbLegenda13.Enabled := false;
    clbLegenda14.Enabled := false;
    clbLegenda15.Enabled := false;
end;

procedure TfrmOdontograma.rbt8Click(Sender: TObject);
begin
    dblLeg1.Enabled := False;
    dblLeg2.Enabled := False;
    dblLeg3.Enabled := False;
    dblLeg4.Enabled := False;
    dblLeg5.Enabled := False;
    dblLeg6.Enabled := False;
    dblLeg7.Enabled := False;
    dblLeg8.Enabled := True;
    dblLeg9.Enabled := False;
    dblLeg10.Enabled := False;
    dblLeg11.Enabled := False;
    dblLeg12.Enabled := False;
    dblLeg13.Enabled := False;
    dblLeg14.Enabled := False;
    dblLeg15.Enabled := False;

    clbLegenda1.Enabled := false;
    clbLegenda2.Enabled := false;
    clbLegenda3.Enabled := false;
    clbLegenda4.Enabled := false;
    clbLegenda5.Enabled := false;
    clbLegenda6.Enabled := false;
    clbLegenda7.Enabled := false;
    clbLegenda8.Enabled := true;
    clbLegenda9.Enabled := false;
    clbLegenda10.Enabled := false;
    clbLegenda11.Enabled := false;
    clbLegenda12.Enabled := false;
    clbLegenda13.Enabled := false;
    clbLegenda14.Enabled := false;
    clbLegenda15.Enabled := false;
end;

procedure TfrmOdontograma.rbt9Click(Sender: TObject);
begin
    dblLeg1.Enabled := False;
    dblLeg2.Enabled := False;
    dblLeg3.Enabled := False;
    dblLeg4.Enabled := False;
    dblLeg5.Enabled := False;
    dblLeg6.Enabled := False;
    dblLeg7.Enabled := False;
    dblLeg8.Enabled := False;
    dblLeg9.Enabled := True;
    dblLeg10.Enabled := False;
    dblLeg11.Enabled := False;
    dblLeg12.Enabled := False;
    dblLeg13.Enabled := False;
    dblLeg14.Enabled := False;
    dblLeg15.Enabled := False;

    clbLegenda1.Enabled := false;
    clbLegenda2.Enabled := false;
    clbLegenda3.Enabled := false;
    clbLegenda4.Enabled := false;
    clbLegenda5.Enabled := false;
    clbLegenda6.Enabled := false;
    clbLegenda7.Enabled := false;
    clbLegenda8.Enabled := false;
    clbLegenda9.Enabled := true;
    clbLegenda10.Enabled := false;
    clbLegenda11.Enabled := false;
    clbLegenda12.Enabled := false;
    clbLegenda13.Enabled := false;
    clbLegenda14.Enabled := false;
    clbLegenda15.Enabled := false;
end;

procedure TfrmOdontograma.InsertUpdateDelete2(pTipo : Integer);
var vSQL, vMensagem  : string;
begin
    case pTipo of
      0: // inserir
        begin
          vSQL := ' insert into ODO01 '+
                  ' (NU_CLIENTE, COR1, DESC1, COR2, DESC2, COR3, DESC3, '+
                  ' COR4, DESC4, COR5, DESC5, COR6, DESC6, COR7, DESC7, '+
                  ' COR8, DESC8, COR9, DESC9, COR10, DESC10, COR11, DESC11, '+
                  ' COR12, DESC12, COR13, DESC13, COR14, DESC14, COR15, DESC15) '+
                  ' VALUES '+
                  ' (:pNU_CLIENTE, :pCOR1, :pDESC1, :pCOR2, :pDESC2, :pCOR3, :pDESC3, '+
                  ' :pCOR4, :pDESC4, :pCOR5, :pDESC5, :pCOR6, :pDESC6, :pCOR7, :pDESC7, '+
                  ' :pCOR8, :pDESC8, :pCOR9, :pDESC9, :pCOR10, :pDESC10, :pCOR11, :pDESC11, '+
                  ' :pCOR12, :pDESC12, :pCOR13, :pDESC13, :pCOR14, :pDESC14, :pCOR15, :pDESC15)';

          vMensagem := 'incluida';
        end;

      1: // alterar
        begin
          vSQL := ' update ODO01 set '+
                  ' COR1   = :pCOR1, '+
                  ' DESC1  = :pDESC1, '+
                  ' COR2   = :pCOR2, '+
                  ' DESC2  = :pDESC2, '+
                  ' COR3   = :pCOR3, '+
                  ' DESC3  = :pDESC3, '+
                  ' COR4   = :pCOR4, '+
                  ' DESC4  = :pDESC4, '+
                  ' COR5   = :pCOR5, '+
                  ' DESC5  = :pDESC5, '+
                  ' COR6   = :pCOR6, '+
                  ' DESC6  = :pDESC6, '+
                  ' COR7   = :pCOR7, '+
                  ' DESC7  = :pDESC7, '+
                  ' COR8   = :pCOR8, '+
                  ' DESC8  = :pDESC8, '+
                  ' COR9   = :pCOR9, '+
                  ' DESC9  = :pDESC9, '+
                  ' COR10  = :pCOR10, '+
                  ' DESC10 = :pDESC10, '+
                  ' COR11  = :pCOR11, '+
                  ' DESC11 = :pDESC11, '+
                  ' COR12  = :pCOR12, '+
                  ' DESC12 = :pDESC12, '+
                  ' COR13  = :pCOR13, '+
                  ' DESC13 = :pDESC13, '+
                  ' COR14  = :pCOR14, '+
                  ' DESC14 = :pDESC14, '+
                  ' COR15  = :pCOR15, '+
                  ' DESC15 = :pDESC15 '+
                  ' where NU_CLIENTE = :pNU_CLIENTE';

          vMensagem := 'alterada';
        end;

      2: //apagar
        begin
          if Confirmacao('Confirmação', 'Deseja, realmente, excluir este registro?') then begin

            vSQL := 'delete from ODO01 '+
                    'where INDICE = :pINDICE';

            vMensagem := 'excluida';

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

          ParamByName('pNU_CLIENTE').AsInteger := DM.sdsClienteINDICE.AsInteger;

          // se for inserir ou alterar passa os parametros
          if pTipo in [0,1] then begin

            ParamByName('pCOR1').AsString   := ColorToString(clbLegenda1.Selected);
            if dblLeg1.KeyValue <> null then
              ParamByName('pDESC1').AsInteger := dblLeg1.KeyValue
            else
              ParamByName('pDESC1').AsInteger := 0;
            ParamByName('pCOR2').AsString   := ColorToString(clbLegenda2.Selected);
            if dblLeg2.KeyValue <> null then
              ParamByName('pDESC2').AsInteger := dblLeg2.KeyValue
            else
              ParamByName('pDESC2').AsInteger := 0;
            ParamByName('pCOR3').AsString   := ColorToString(clbLegenda3.Selected);
            if dblLeg3.KeyValue <> null then
              ParamByName('pDESC3').AsInteger := dblLeg3.KeyValue
            else
              ParamByName('pDESC3').AsInteger := 0;
            ParamByName('pCOR4').AsString   := ColorToString(clbLegenda4.Selected);
            if dblLeg4.KeyValue <> null then
              ParamByName('pDESC4').AsInteger := dblLeg4.KeyValue
            else
              ParamByName('pDESC4').AsInteger := 0;
            ParamByName('pCOR5').AsString   := ColorToString(clbLegenda5.Selected);
            if dblLeg5.KeyValue <> null then
              ParamByName('pDESC5').AsInteger := dblLeg5.KeyValue
            else
              ParamByName('pDESC5').AsInteger := 0;
            ParamByName('pCOR6').AsString   := ColorToString(clbLegenda6.Selected);
            if dblLeg6.KeyValue <> null then
              ParamByName('pDESC6').AsInteger := dblLeg6.KeyValue
            else
              ParamByName('pDESC6').AsInteger := 0;
            ParamByName('pCOR7').AsString   := ColorToString(clbLegenda7.Selected);
            if dblLeg7.KeyValue <> null then
              ParamByName('pDESC7').AsInteger := dblLeg7.KeyValue
            else
              ParamByName('pDESC7').AsInteger := 0;
            ParamByName('pCOR8').AsString   := ColorToString(clbLegenda8.Selected);
            if dblLeg8.KeyValue <> null then
              ParamByName('pDESC8').AsInteger := dblLeg8.KeyValue
            else
              ParamByName('pDESC8').AsInteger := 0;
            ParamByName('pCOR9').AsString   := ColorToString(clbLegenda9.Selected);
            if dblLeg9.KeyValue <> null then
              ParamByName('pDESC9').AsInteger := dblLeg9.KeyValue
            else
              ParamByName('pDESC9').AsInteger := 0;
            ParamByName('pCOR10').AsString  := ColorToString(clbLegenda10.Selected);
            if dblLeg10.KeyValue <> null then
              ParamByName('pDESC10').AsInteger := dblLeg10.KeyValue
            else
              ParamByName('pDESC10').AsInteger := 0;
            ParamByName('pCOR11').AsString  := ColorToString(clbLegenda11.Selected);
            if dblLeg11.KeyValue <> null then
              ParamByName('pDESC11').AsInteger := dblLeg11.KeyValue
            else
              ParamByName('pDESC11').AsInteger := 0;
            ParamByName('pCOR12').AsString  := ColorToString(clbLegenda12.Selected);
            if dblLeg12.KeyValue <> null then
              ParamByName('pDESC12').AsInteger := dblLeg12.KeyValue
            else
              ParamByName('pDESC12').AsInteger := 0;
            ParamByName('pCOR13').AsString  := ColorToString(clbLegenda13.Selected);
            if dblLeg13.KeyValue <> null then
              ParamByName('pDESC13').AsInteger := dblLeg13.KeyValue
            else
              ParamByName('pDESC13').AsInteger := 0;
            ParamByName('pCOR14').AsString  := ColorToString(clbLegenda14.Selected);
            if dblLeg14.KeyValue <> null then
              ParamByName('pDESC14').AsInteger := dblLeg14.KeyValue
            else
              ParamByName('pDESC14').AsInteger := 0;
            ParamByName('pCOR15').AsString  := ColorToString(clbLegenda15.Selected);
            if dblLeg15.KeyValue <> null then
              ParamByName('pDESC15').AsInteger := dblLeg15.KeyValue
            else
              ParamByName('pDESC15').AsInteger := 0;

            CONEXAO.StartTransaction(TRANSACAO);
            Close;
            ExecSQL;
            CONEXAO.Commit(TRANSACAO);
            Afirmacao('Confirmação', 'Legenda '+vMensagem+' com sucesso!');
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

procedure TfrmOdontograma.Retornar1Click(Sender: TObject);
begin
    Close;
end;

procedure TfrmOdontograma.sbtCadastrarClick(Sender: TObject);
begin
    if DM.sdsOdontograma.RecordCount = 0 then begin
      vTipo := 0;
      InsertUpdateDelete;
      ParametrosCad;
    end
    else begin
      vTipo := 1;
      InsertUpdateDelete;
      ParametrosCad;
    end;
end;

procedure TfrmOdontograma.sbtCadastrarMouseLeave(Sender: TObject);
begin
    sbtCadastrar.Caption := '';
end;

procedure TfrmOdontograma.sbtCadastrarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    sbtCadastrar.Caption := 'Cadastrar';
end;

procedure TfrmOdontograma.sbtCancelarClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmOdontograma.sbtCancelarMouseLeave(Sender: TObject);
begin
    sbtCancelar.Caption := '';
end;

procedure TfrmOdontograma.sbtCancelarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    sbtCancelar.Caption := 'Cancelar';
end;

function TfrmOdontograma.SelecinaLegenda : TColor;
begin
    if rbt1.Checked then
      Result := clbLegenda1.Selected;
    if rbt2.Checked then
      Result := clbLegenda2.Selected;
    if rbt3.Checked then
      Result := clbLegenda3.Selected;
    if rbt4.Checked then
      Result := clbLegenda4.Selected;
    if rbt5.Checked then
      Result := clbLegenda5.Selected;
    if rbt6.Checked then
      Result := clbLegenda6.Selected;
    if rbt7.Checked then
      Result := clbLegenda7.Selected;
    if rbt8.Checked then
      Result := clbLegenda8.Selected;
    if rbt9.Checked then
      Result := clbLegenda9.Selected;
    if rbt10.Checked then
      Result := clbLegenda10.Selected;
    if rbt11.Checked then
      Result := clbLegenda11.Selected;
    if rbt12.Checked then
      Result := clbLegenda12.Selected;
    if rbt13.Checked then
      Result := clbLegenda13.Selected;
    if rbt14.Checked then
      Result := clbLegenda14.Selected;
    if rbt15.Checked then
      Result := clbLegenda15.Selected;
end;

end.
