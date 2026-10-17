object frmImagemHistorico: TfrmImagemHistorico
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Imagem do Hist'#243'rico'
  ClientHeight = 465
  ClientWidth = 737
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Imagem1: TImage
    Left = 0
    Top = 0
    Width = 737
    Height = 465
    Align = alClient
    Center = True
    Proportional = True
    Stretch = True
    ExplicitLeft = 8
    ExplicitTop = 20
    ExplicitWidth = 657
    ExplicitHeight = 424
  end
  object MainMenu1: TMainMenu
    object Fechar1: TMenuItem
      Caption = 'Fechar'
      OnClick = Fechar1Click
    end
  end
end
