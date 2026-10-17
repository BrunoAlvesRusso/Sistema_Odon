object frmAviso: TfrmAviso
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 604
  ClientWidth = 784
  Color = clWhite
  DoubleBuffered = True
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  GlassFrame.Enabled = True
  GlassFrame.SheetOfGlass = True
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblAniversariantes: TLabel
    Left = 18
    Top = 564
    Width = 240
    Height = 16
    AutoSize = False
    Caption = 'lblAniversariantes'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object lblAPagar: TLabel
    Left = 274
    Top = 564
    Width = 240
    Height = 16
    Alignment = taCenter
    AutoSize = False
    Caption = 'lblAPagar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblAReceber: TLabel
    Left = 527
    Top = 564
    Width = 240
    Height = 16
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'lblAReceber'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object GroupBox1: TGroupBox
    Left = 18
    Top = 8
    Width = 749
    Height = 173
    Caption = 'Aniversariantes do dia'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object dbgAniversario: TDBGrid
      Left = 2
      Top = 13
      Width = 744
      Height = 156
      DataSource = DM.dsrAniversarios
      DrawingStyle = gdsGradient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      PopupMenu = PopupMenu1
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Verdana'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Expanded = False
          FieldName = 'INDICE'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Caption = 'Nome do Cliente'
          Width = 700
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RG_IE'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'CPF_CNPJ'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DT_NASCIMENTO'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'SEXO'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'ESTADO_CIVIL'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'SITUACAO'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'UF'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'CEP'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'CIDADE'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'BAIRRO'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'TIPO_LOGRADOURO'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'LOGRADOURO'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'NUMERO'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'COMPLEMENTO'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'REFERENCIA'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'TELEFONE_FIXO'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'CELULAR'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'CELULAR2'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'FAX'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'EMAIL'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'RESPONSAVEL'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'PROCEDIMENTO'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DT_CADASTRO'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'OBSERVACAO'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DT_ULTIMA_CONSULTA'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'FOTO'
          Visible = False
        end>
    end
  end
  object GroupBox2: TGroupBox
    Left = 18
    Top = 192
    Width = 749
    Height = 173
    Caption = 'A Pagar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object dbgAPagar: TDBGrid
      Left = 2
      Top = 13
      Width = 744
      Height = 156
      DataSource = DM.dsrAPagar
      DrawingStyle = gdsGradient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Verdana'
      TitleFont.Style = [fsBold]
      OnTitleClick = dbgAPagarTitleClick
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
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Width = 300
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR'
          Title.Caption = 'Valor'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_VENCIMENTO'
          Title.Caption = 'Data Vencimento'
          Width = 121
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_PAGAMENTO'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'SITUACAO'
          Visible = False
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
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SITUACAO_1'
          Visible = False
        end>
    end
  end
  object GroupBox3: TGroupBox
    Left = 18
    Top = 376
    Width = 749
    Height = 173
    Caption = 'A Receber'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object dbgAReceber: TDBGrid
      Left = 2
      Top = 14
      Width = 744
      Height = 156
      DataSource = DM.drsAReceber
      DrawingStyle = gdsGradient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Verdana'
      TitleFont.Style = [fsBold]
      OnTitleClick = dbgAReceberTitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Caption = 'Nome'
          Width = 300
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_TOTAL'
          Title.Caption = 'Valor'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_ATENDIMENTO'
          Title.Caption = 'Data Atendimento'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_1'
          Title.Caption = 'Profissional'
          Width = 200
          Visible = True
        end>
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 744
    Top = 8
    object EnviarMensagem1: TMenuItem
      Caption = 'Enviar mensagem para este'
      Visible = False
      OnClick = EnviarMensagem1Click
    end
    object Enviarmensagemparatodos1: TMenuItem
      Caption = 'Enviar mensagem para todos'
      Visible = False
      OnClick = Enviarmensagemparatodos1Click
    end
  end
end
