object frmHistorico: TfrmHistorico
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Hist'#243'rico de Consultas'
  ClientHeight = 476
  ClientWidth = 859
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poMainFormCenter
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object dbgHistorico: TDBGrid
    Left = 0
    Top = 0
    Width = 859
    Height = 457
    Align = alClient
    DataSource = DM.dsrAgenda
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'INDICE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NU_COLABORADOR'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CLIENTE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DATA'
        Title.Caption = 'Data'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HORA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'SITUACAO'
        Title.Caption = 'Situa'#231#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INDICE_1'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Profissional'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SITUACAO_1'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'ENCAIXE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NU_CLIENTE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'OBS'
        Title.Caption = 'Descri'#231#227'o'
        Width = 320
        Visible = True
      end>
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 457
    Width = 859
    Height = 19
    Panels = <
      item
        Alignment = taCenter
        Width = 50
      end>
  end
  object MainMenu1: TMainMenu
    Top = 65528
    object Sair1: TMenuItem
      Caption = 'Fechar (Esc)'
      OnClick = Sair1Click
    end
  end
end
