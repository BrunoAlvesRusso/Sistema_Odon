object frmCadAgenda: TfrmCadAgenda
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Agendamento'
  ClientHeight = 197
  ClientWidth = 607
  Color = clWhite
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sbtCliente: TSpeedButton
    Left = 14
    Top = 18
    Width = 83
    Height = 35
    Caption = 'Cliente'
    OnClick = sbtClienteClick
  end
  object sbtSalvar: TSpeedButton
    Left = 479
    Top = 151
    Width = 114
    Height = 33
    Caption = 'Salvar'
    OnClick = sbtSalvarClick
  end
  object lblProfissional: TLabel
    Left = 221
    Top = 66
    Width = 65
    Height = 13
    Caption = 'Profissional'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 144
    Top = 66
    Width = 42
    Height = 13
    Caption = 'Hor'#225'rio'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 14
    Top = 66
    Width = 27
    Height = 13
    Caption = 'Data'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 106
    Top = 18
    Width = 40
    Height = 13
    Caption = 'Cliente'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 479
    Top = 66
    Width = 49
    Height = 13
    Caption = 'Situa'#231#227'o'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 14
    Top = 112
    Width = 56
    Height = 13
    Caption = 'Descri'#231#227'o'
  end
  object edtCliente: TEdit
    Left = 106
    Top = 32
    Width = 487
    Height = 21
    Enabled = False
    TabOrder = 0
  end
  object dtpHora: TDateTimePicker
    Left = 144
    Top = 80
    Width = 65
    Height = 21
    Date = 41572.782976655090000000
    Format = 'HH:mm'
    Time = 41572.782976655090000000
    DateFormat = dfLong
    Enabled = False
    Kind = dtkTime
    TabOrder = 3
  end
  object dtpData: TDateTimePicker
    Left = 14
    Top = 80
    Width = 114
    Height = 21
    Date = 41572.784062592590000000
    Time = 41572.784062592590000000
    Enabled = False
    TabOrder = 2
  end
  object dblProfissional: TDBLookupComboBox
    Left = 221
    Top = 80
    Width = 252
    Height = 21
    Enabled = False
    KeyField = 'INDICE'
    ListField = 'NOME'
    ListSource = DM.dsrProfissional
    TabOrder = 4
  end
  object cbxSituacao: TComboBox
    Left = 479
    Top = 80
    Width = 114
    Height = 21
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 1
    Text = 'ABERTO'
    Items.Strings = (
      'ABERTO'
      'CONCLU'#205'DO')
  end
  object memObservacao: TMemo
    Left = 14
    Top = 127
    Width = 459
    Height = 57
    CharCase = ecUpperCase
    MaxLength = 200
    ScrollBars = ssVertical
    TabOrder = 5
  end
  object ckbNaoAgendar: TCheckBox
    Left = 502
    Top = 13
    Width = 89
    Height = 17
    Caption = 'N'#227'o Agendar'
    TabOrder = 6
    OnClick = ckbNaoAgendarClick
  end
end
