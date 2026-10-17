object DMReport: TDMReport
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsNone
  ClientHeight = 539
  ClientWidth = 347
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object frxCliente: TfrxDBDataset
    UserName = 'frxDBCliente'
    CloseDataSource = False
    DataSet = DM.sdsCliente
    BCDToCurrency = False
    Left = 104
    Top = 64
  end
  object frxRptCliente: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41604.814496643500000000
    ReportOptions.LastChange = 42908.936583865740000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 40
    Top = 64
    Datasets = <
      item
        DataSet = frxCliente
        DataSetName = 'frxDBCliente'
      end
      item
        DataSet = frxGerenciador
        DataSetName = 'frxDBGerenciador'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Cliente: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 90.708720000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          Left = 396.850650000000000000
          Top = 34.015770000000000000
          Width = 249.448980000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Relat'#243'rio de Clientes')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 211.653680000000000000
        Width = 1046.929810000000000000
        DataSet = frxCliente
        DataSetName = 'frxDBCliente'
        RowCount = 0
        object frxDBClienteNOME: TfrxMemoView
          Left = 11.338590000000000000
          Width = 264.567100000000000000
          Height = 18.897650000000000000
          DataField = 'NOME'
          DataSet = frxCliente
          DataSetName = 'frxDBCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBCliente."NOME"]')
          ParentFont = False
        end
        object frxDBClienteCIDADE: TfrxMemoView
          Left = 283.173470000000000000
          Width = 154.960730000000000000
          Height = 18.897650000000000000
          DataField = 'CIDADE'
          DataSet = frxCliente
          DataSetName = 'frxDBCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBCliente."CIDADE"]')
          ParentFont = False
        end
        object frxDBClienteLOGRADOURO: TfrxMemoView
          Left = 642.228820000000000000
          Width = 204.094620000000000000
          Height = 18.897650000000000000
          DataField = 'LOGRADOURO'
          DataSet = frxCliente
          DataSetName = 'frxDBCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBCliente."LOGRADOURO"]')
          ParentFont = False
        end
        object frxDBClienteBAIRRO: TfrxMemoView
          Left = 445.693260000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          DataField = 'BAIRRO'
          DataSet = frxCliente
          DataSetName = 'frxDBCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBCliente."BAIRRO"]')
          ParentFont = False
        end
        object frxDBClienteNUMERO: TfrxMemoView
          Left = 853.882500000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          DataField = 'NUMERO'
          DataSet = frxCliente
          DataSetName = 'frxDBCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBCliente."NUMERO"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 914.646260000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DataField = 'TELEFONE_FIXO'
          DataSet = frxCliente
          DataSetName = 'frxDBCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBCliente."TELEFONE_FIXO"]')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 170.078850000000000000
        Width = 1046.929810000000000000
        object Gradient1: TfrxGradientView
          Width = 1046.929810000000000000
          Height = 18.897650000000000000
          Style = gsVertical
          Color = clSilver
        end
        object Memo2: TfrxMemoView
          Left = 11.338590000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Nome')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 283.173470000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cidade')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 447.252320000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Bairro')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 642.228820000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Rua')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 855.441560000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'N'#186)
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 914.646260000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Telefone')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 291.023810000000000000
        Width = 1046.929810000000000000
        object Gradient2: TfrxGradientView
          Width = 1046.929810000000000000
          Height = 18.897650000000000000
          Style = gsVertical
          Color = clSilver
        end
        object Memo9: TfrxMemoView
          Left = 15.118120000000000000
          Top = 1.000000000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            '[Page]')
        end
        object Memo10: TfrxMemoView
          Left = 869.291900000000000000
          Top = 1.000000000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'dd '#39'de'#39' mmmm '#39'de'#39' yyyy'
          DisplayFormat.Kind = fkDateTime
          Memo.UTF8W = (
            '[Date]')
        end
      end
    end
  end
  object frxGradientObject1: TfrxGradientObject
    Left = 40
    Top = 8
  end
  object frxFornecedor: TfrxDBDataset
    UserName = 'frxDBFornecedor'
    CloseDataSource = False
    DataSet = DM.sdsFornecedor
    BCDToCurrency = False
    Left = 104
    Top = 112
  end
  object frxRptFornecedor: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41604.814496643500000000
    ReportOptions.LastChange = 42908.936223171290000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 40
    Top = 112
    Datasets = <
      item
        DataSet = frxFornecedor
        DataSetName = 'frxDBFornecedor'
      end
      item
        DataSet = frxGerenciador
        DataSetName = 'frxDBGerenciador'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Cliente: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 89.149660000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          Left = 362.834880000000000000
          Top = 30.236240000000000000
          Width = 313.700990000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Relat'#243'rio de Fornecedores')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 211.653680000000000000
        Width = 1046.929810000000000000
        DataSet = frxFornecedor
        DataSetName = 'frxDBFornecedor'
        RowCount = 0
        object frxDBClienteNOME: TfrxMemoView
          Left = 11.338590000000000000
          Width = 306.141930000000000000
          Height = 18.897650000000000000
          DataField = 'RAZAO_SOCIAL'
          DataSet = frxFornecedor
          DataSetName = 'frxDBFornecedor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBFornecedor."RAZAO_SOCIAL"]')
          ParentFont = False
        end
        object frxDBClienteCIDADE: TfrxMemoView
          Left = 332.307360000000000000
          Width = 279.685220000000000000
          Height = 18.897650000000000000
          DataField = 'NOME_FANTASIA'
          DataSet = frxFornecedor
          DataSetName = 'frxDBFornecedor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBFornecedor."NOME_FANTASIA"]')
          ParentFont = False
        end
        object frxDBClienteLOGRADOURO: TfrxMemoView
          Left = 881.362710000000000000
          Width = 154.960730000000000000
          Height = 18.897650000000000000
          DataField = 'TELEFONE_FIXO'
          DataSet = frxFornecedor
          DataSetName = 'frxDBFornecedor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBFornecedor."TELEFONE_FIXO"]')
          ParentFont = False
        end
        object frxDBClienteBAIRRO: TfrxMemoView
          Left = 631.709030000000000000
          Width = 230.551330000000000000
          Height = 18.897650000000000000
          DataField = 'CIDADE'
          DataSet = frxFornecedor
          DataSetName = 'frxDBFornecedor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBFornecedor."CIDADE"]')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 170.078850000000000000
        Width = 1046.929810000000000000
        object Gradient1: TfrxGradientView
          Width = 1046.929810000000000000
          Height = 18.897650000000000000
          Style = gsVertical
          Color = clSilver
        end
        object Memo2: TfrxMemoView
          Left = 11.338590000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Raz'#227'o Social')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 332.307360000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Nome Fantasia')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 633.268090000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cidade')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 881.362710000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Telefone')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 291.023810000000000000
        Width = 1046.929810000000000000
        object Gradient2: TfrxGradientView
          Width = 1046.929810000000000000
          Height = 18.897650000000000000
          Style = gsVertical
          Color = clSilver
        end
        object Memo9: TfrxMemoView
          Left = 15.118120000000000000
          Top = 1.000000000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            '[Page]')
        end
        object Memo10: TfrxMemoView
          Left = 869.291900000000000000
          Top = 1.000000000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'dd '#39'de'#39' mmmm '#39'de'#39' yyyy'
          DisplayFormat.Kind = fkDateTime
          Memo.UTF8W = (
            '[Date]')
        end
      end
    end
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    Left = 104
    Top = 8
  end
  object frxFuncionario: TfrxDBDataset
    UserName = 'frxDBFuncionario'
    CloseDataSource = False
    DataSet = DM.sdsFuncionario
    BCDToCurrency = False
    Left = 104
    Top = 160
  end
  object frxRptFuncionario: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41604.814496643500000000
    ReportOptions.LastChange = 42908.935897662040000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 40
    Top = 160
    Datasets = <
      item
        DataSet = frxFuncionario
        DataSetName = 'frxDBFuncionario'
      end
      item
        DataSet = frxGerenciador
        DataSetName = 'frxDBGerenciador'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Cliente: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 90.708720000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          Left = 370.393940000000000000
          Top = 30.236240000000000000
          Width = 306.141930000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Relat'#243'rio de Funcion'#225'rios')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 211.653680000000000000
        Width = 1046.929810000000000000
        DataSet = frxFuncionario
        DataSetName = 'frxDBFuncionario'
        RowCount = 0
        object frxDBClienteNOME: TfrxMemoView
          Left = 11.338590000000000000
          Width = 264.567100000000000000
          Height = 18.897650000000000000
          DataField = 'NOME'
          DataSet = frxFuncionario
          DataSetName = 'frxDBFuncionario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBFuncionario."NOME"]')
          ParentFont = False
        end
        object frxDBClienteCIDADE: TfrxMemoView
          Left = 283.173470000000000000
          Width = 154.960730000000000000
          Height = 18.897650000000000000
          DataField = 'CIDADE'
          DataSet = frxFuncionario
          DataSetName = 'frxDBFuncionario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBFuncionario."CIDADE"]')
          ParentFont = False
        end
        object frxDBClienteLOGRADOURO: TfrxMemoView
          Left = 642.228820000000000000
          Width = 204.094620000000000000
          Height = 18.897650000000000000
          DataField = 'LOGRADOURO'
          DataSet = frxFuncionario
          DataSetName = 'frxDBFuncionario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBFuncionario."LOGRADOURO"]')
          ParentFont = False
        end
        object frxDBClienteBAIRRO: TfrxMemoView
          Left = 445.693260000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          DataField = 'BAIRRO'
          DataSet = frxFuncionario
          DataSetName = 'frxDBFuncionario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBFuncionario."BAIRRO"]')
          ParentFont = False
        end
        object frxDBClienteNUMERO: TfrxMemoView
          Left = 853.882500000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          DataField = 'NUMERO'
          DataSet = frxFuncionario
          DataSetName = 'frxDBFuncionario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBFuncionario."NUMERO"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 914.646260000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DataField = 'TELEFONE_FIXO'
          DataSet = frxFuncionario
          DataSetName = 'frxDBFuncionario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBFuncionario."TELEFONE_FIXO"]')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 170.078850000000000000
        Width = 1046.929810000000000000
        object Gradient1: TfrxGradientView
          Width = 1046.929810000000000000
          Height = 18.897650000000000000
          Style = gsVertical
          Color = clSilver
        end
        object Memo2: TfrxMemoView
          Left = 11.338590000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Nome')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 283.173470000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cidade')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 447.252320000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Bairro')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 642.228820000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Rua')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 855.441560000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'N'#186)
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 914.646260000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Telefone')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 291.023810000000000000
        Width = 1046.929810000000000000
        object Gradient2: TfrxGradientView
          Width = 1046.929810000000000000
          Height = 18.897650000000000000
          Style = gsVertical
          Color = clSilver
        end
        object Memo9: TfrxMemoView
          Left = 15.118120000000000000
          Top = 1.000000000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            '[Page]')
        end
        object Memo10: TfrxMemoView
          Left = 869.291900000000000000
          Top = 1.000000000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'dd '#39'de'#39' mmmm '#39'de'#39' yyyy'
          DisplayFormat.Kind = fkDateTime
          Memo.UTF8W = (
            '[Date]')
        end
      end
    end
  end
  object frxProduto: TfrxDBDataset
    UserName = 'frxDBProduto'
    CloseDataSource = False
    DataSet = DM.sdsProduto
    BCDToCurrency = False
    Left = 104
    Top = 208
  end
  object frxRptProduto: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41604.814496643500000000
    ReportOptions.LastChange = 42908.934109629630000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 40
    Top = 208
    Datasets = <
      item
        DataSet = frxGerenciador
        DataSetName = 'frxDBGerenciador'
      end
      item
        DataSet = frxProduto
        DataSetName = 'frxDBProduto'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Cliente: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 90.708720000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 231.330860000000000000
          Top = 30.236240000000000000
          Width = 257.008040000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Relat'#243'rio de Produtos')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 211.653680000000000000
        Width = 718.110700000000000000
        DataSet = frxProduto
        DataSetName = 'frxDBProduto'
        RowCount = 0
        object frxDBClienteNOME: TfrxMemoView
          Left = 11.338590000000000000
          Width = 275.905690000000000000
          Height = 18.897650000000000000
          DataField = 'DESCRICAO'
          DataSet = frxProduto
          DataSetName = 'frxDBProduto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBProduto."DESCRICAO"]')
          ParentFont = False
        end
        object frxDBClienteCIDADE: TfrxMemoView
          Left = 294.512060000000000000
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          DataField = 'NOME_FANTASIA'
          DataSet = frxProduto
          DataSetName = 'frxDBProduto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBProduto."NOME_FANTASIA"]')
          ParentFont = False
        end
        object frxDBClienteLOGRADOURO: TfrxMemoView
          Left = 616.016080000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          DataField = 'VALOR'
          DataSet = frxProduto
          DataSetName = 'frxDBProduto'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'R$ ###,###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBProduto."VALOR"]')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 170.078850000000000000
        Width = 718.110700000000000000
        object Gradient1: TfrxGradientView
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Style = gsVertical
          Color = clSilver
        end
        object Memo2: TfrxMemoView
          Left = 11.338590000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Descri'#231#227'o')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 294.512060000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Fornecedor')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 614.795610000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Valor')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 291.023810000000000000
        Width = 718.110700000000000000
        object Gradient2: TfrxGradientView
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Style = gsVertical
          Color = clSilver
        end
        object Memo9: TfrxMemoView
          Left = 15.118120000000000000
          Top = 1.000000000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            '[Page]')
        end
        object Memo10: TfrxMemoView
          Left = 536.693260000000000000
          Top = 1.000000000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'dd '#39'de'#39' mmmm '#39'de'#39' yyyy'
          DisplayFormat.Kind = fkDateTime
          Memo.UTF8W = (
            '[Date]')
        end
      end
    end
  end
  object frxAgenda: TfrxDBDataset
    UserName = 'frxDBAgenda'
    CloseDataSource = False
    FieldAliases.Strings = (
      'INDICE=INDICE'
      'NU_COLABORADOR=NU_COLABORADOR'
      'CLIENTE=CLIENTE'
      'DATA=DATA'
      'HORA=HORA'
      'SITUACAO=SITUACAO'
      'INDICE_1=INDICE_1'
      'NOME=NOME'
      'SITUACAO_1=SITUACAO_1'
      'ENCAIXE=ENCAIXE'
      'NU_CLIENTE=NU_CLIENTE'
      'OBS=OBS')
    DataSet = DM.sdsAgenda
    BCDToCurrency = False
    Left = 104
    Top = 256
  end
  object frxRptAgenda: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41604.814496643500000000
    ReportOptions.LastChange = 42908.934590127310000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 40
    Top = 256
    Datasets = <
      item
        DataSet = frxAgenda
        DataSetName = 'frxDBAgenda'
      end
      item
        DataSet = frxGerenciador
        DataSetName = 'frxDBGerenciador'
      end>
    Variables = <
      item
        Name = ' Vari'#225'veis'
        Value = Null
      end
      item
        Name = 'Calendario'
        Value = Null
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Cliente: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 83.149660000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 311.700990000000000000
          Top = 26.456710000000000000
          Width = 94.488250000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Agenda')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 272.126160000000000000
        Width = 718.110700000000000000
        DataSet = frxAgenda
        DataSetName = 'frxDBAgenda'
        RowCount = 0
        object frxDBAgendaSITUACAO: TfrxMemoView
          Left = 551.811380000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          DataField = 'SITUACAO'
          DataSet = frxAgenda
          DataSetName = 'frxDBAgenda'
          Memo.UTF8W = (
            '[frxDBAgenda."SITUACAO"]')
        end
        object frxDBAgendaCLIENTE: TfrxMemoView
          Left = 108.606370000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataField = 'CLIENTE'
          DataSet = frxAgenda
          DataSetName = 'frxDBAgenda'
          Memo.UTF8W = (
            '[frxDBAgenda."CLIENTE"]')
        end
        object frxDBAgendaHORA: TfrxMemoView
          Left = 11.338590000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'HORA'
          DataSet = frxAgenda
          DataSetName = 'frxDBAgenda'
          Memo.UTF8W = (
            '[frxDBAgenda."HORA"]')
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 351.496290000000000000
        Width = 718.110700000000000000
        object Gradient2: TfrxGradientView
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Style = gsVertical
          Color = clSilver
        end
        object Memo9: TfrxMemoView
          Left = 15.118120000000000000
          Top = 1.000000000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            '[Page]')
        end
        object Memo10: TfrxMemoView
          Left = 536.693260000000000000
          Top = 1.000000000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'dd '#39'de'#39' mmmm '#39'de'#39' yyyy'
          DisplayFormat.Kind = fkDateTime
          Memo.UTF8W = (
            '[Date]')
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        Height = 86.929190000000000000
        Top = 162.519790000000000000
        Width = 718.110700000000000000
        object Memo3: TfrxMemoView
          Left = 310.921460000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[Calendario]')
          ParentFont = False
        end
        object Gradient1: TfrxGradientView
          Top = 68.031539999999970000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Style = gsVertical
          Color = clSilver
        end
        object Memo2: TfrxMemoView
          Left = 11.338590000000000000
          Top = 68.031539999999970000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Hora')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 109.315090000000000000
          Top = 68.031539999999970000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cliente')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 550.543600000000000000
          Top = 68.031539999999970000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Situa'#231#227'o')
          ParentFont = False
        end
        object frxDBAgendaNOME: TfrxMemoView
          Left = 11.338590000000000000
          Top = 41.574829999999990000
          Width = 574.488560000000000000
          Height = 18.897650000000000000
          DataField = 'NOME'
          DataSet = frxAgenda
          DataSetName = 'frxDBAgenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBAgenda."NOME"]')
          ParentFont = False
        end
      end
    end
  end
  object frxRptMovimentacao: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41604.814496643500000000
    ReportOptions.LastChange = 42908.935165289350000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 40
    Top = 304
    Datasets = <
      item
        DataSet = frxGerenciador
        DataSetName = 'frxDBGerenciador'
      end
      item
        DataSet = frxMovimentacao
        DataSetName = 'frxDBMovimentacao'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Cliente: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 102.047310000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          Left = 363.055350000000000000
          Top = 41.574830000000000000
          Width = 317.480520000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Relat'#243'rio de Movimenta'#231#227'o')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 222.992270000000000000
        Width = 1046.929810000000000000
        DataSet = frxMovimentacao
        DataSetName = 'frxDBMovimentacao'
        RowCount = 0
        object frxDBClienteNOME: TfrxMemoView
          Left = 11.338590000000000000
          Width = 264.567100000000000000
          Height = 18.897650000000000000
          DataField = 'NOME'
          DataSet = frxMovimentacao
          DataSetName = 'frxDBMovimentacao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBMovimentacao."NOME"]')
          ParentFont = False
        end
        object frxDBClienteCIDADE: TfrxMemoView
          Left = 283.173470000000000000
          Width = 154.960730000000000000
          Height = 18.897650000000000000
          DataField = 'SITUACAO'
          DataSet = frxMovimentacao
          DataSetName = 'frxDBMovimentacao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBMovimentacao."SITUACAO"]')
          ParentFont = False
        end
        object frxDBClienteLOGRADOURO: TfrxMemoView
          Left = 736.937540000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataField = 'DT_ATENDIMENTO'
          DataSet = frxMovimentacao
          DataSetName = 'frxDBMovimentacao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBMovimentacao."DT_ATENDIMENTO"]')
          ParentFont = False
        end
        object frxDBClienteBAIRRO: TfrxMemoView
          Left = 445.693260000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          DataSet = frxMovimentacao
          DataSetName = 'frxDBMovimentacao'
          DisplayFormat.FormatStr = 'R$ ###,###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBMovimentacao."VALOR_TOTAL"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 893.748610000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          DataField = 'NOME_1'
          DataSet = frxMovimentacao
          DataSetName = 'frxDBMovimentacao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBMovimentacao."NOME_1"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 536.693260000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          DataField = 'VALOR_PAGO'
          DataSet = frxMovimentacao
          DataSetName = 'frxDBMovimentacao'
          DisplayFormat.FormatStr = 'R$ ###,###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBMovimentacao."VALOR_PAGO"]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 627.401980000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          DataField = 'VALOR_PENDENTE'
          DataSet = frxMovimentacao
          DataSetName = 'frxDBMovimentacao'
          DisplayFormat.FormatStr = 'R$ ###,###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBMovimentacao."VALOR_PENDENTE"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 816.378480000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataField = 'DT_PAGAMENTO'
          DataSet = frxMovimentacao
          DataSetName = 'frxDBMovimentacao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBMovimentacao."DT_PAGAMENTO"]')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 181.417440000000000000
        Width = 1046.929810000000000000
        object Gradient1: TfrxGradientView
          Width = 1046.929810000000000000
          Height = 18.897650000000000000
          Style = gsVertical
          Color = clSilver
        end
        object Memo2: TfrxMemoView
          Left = 11.338590000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Nome Cliente')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 283.173470000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Situa'#231#227'o')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 447.252320000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Valor Total')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 739.717070000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Dt. Atend.')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 893.748610000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Profissional')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 536.693260000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Valor Pago')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 627.401980000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Valor Pendente')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 820.378480000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Dt. Pagto')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 302.362400000000000000
        Width = 1046.929810000000000000
        object Gradient2: TfrxGradientView
          Width = 1046.929810000000000000
          Height = 18.897650000000000000
          Style = gsVertical
          Color = clSilver
        end
        object Memo9: TfrxMemoView
          Left = 15.118120000000000000
          Top = 1.000000000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            '[Page]')
        end
        object Memo10: TfrxMemoView
          Left = 869.291900000000000000
          Top = 1.000000000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'dd '#39'de'#39' mmmm '#39'de'#39' yyyy'
          DisplayFormat.Kind = fkDateTime
          Memo.UTF8W = (
            '[Date]')
        end
      end
    end
  end
  object frxMovimentacao: TfrxDBDataset
    UserName = 'frxDBMovimentacao'
    CloseDataSource = False
    DataSet = DM.sdsDebito
    BCDToCurrency = False
    Left = 104
    Top = 304
  end
  object frxRptDespesas: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41604.814496643500000000
    ReportOptions.LastChange = 42908.937041851850000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 40
    Top = 352
    Datasets = <
      item
        DataSet = frxAPagar
        DataSetName = 'frxDBAPagar'
      end
      item
        DataSet = frxGerenciador
        DataSetName = 'frxDBGerenciador'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Cliente: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 86.929190000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 229.771800000000000000
          Top = 26.456710000000000000
          Width = 260.787570000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Relat'#243'rio de Despesas')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Height = 18.897650000000000000
        ParentFont = False
        Top = 207.874150000000000000
        Width = 718.110700000000000000
        DataSet = frxAPagar
        DataSetName = 'frxDBAPagar'
        RowCount = 0
        object frxDBClienteNOME: TfrxMemoView
          Left = 11.338590000000000000
          Width = 249.448980000000000000
          Height = 18.897650000000000000
          DataField = 'DESCRICAO'
          DataSet = frxAPagar
          DataSetName = 'frxDBAPagar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBAPagar."DESCRICAO"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBClienteLOGRADOURO: TfrxMemoView
          Left = 343.134200000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataField = 'DT_VENCIMENTO'
          DataSet = frxAPagar
          DataSetName = 'frxDBAPagar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBAPagar."DT_VENCIMENTO"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBClienteBAIRRO: TfrxMemoView
          Left = 266.645950000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataField = 'VALOR'
          DataSet = frxAPagar
          DataSetName = 'frxDBAPagar'
          DisplayFormat.FormatStr = 'R$ ###,###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBAPagar."VALOR"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo3: TfrxMemoView
          Left = 496.945270000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'SITUACAO'
          DataSet = frxAPagar
          DataSetName = 'frxDBAPagar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBAPagar."SITUACAO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo8: TfrxMemoView
          Left = 420.575140000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataField = 'DT_PAGAMENTO'
          DataSet = frxAPagar
          DataSetName = 'frxDBAPagar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBAPagar."DT_PAGAMENTO"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBAPagarNOME: TfrxMemoView
          Left = 582.047620000000000000
          Width = 132.283549999999000000
          Height = 18.897650000000000000
          DataField = 'NOME'
          DataSet = frxAPagar
          DataSetName = 'frxDBAPagar'
          Memo.UTF8W = (
            '[frxDBAPagar."NOME"]')
          WordWrap = False
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 166.299320000000000000
        Width = 718.110700000000000000
        object Gradient1: TfrxGradientView
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Style = gsVertical
          Color = clSilver
        end
        object Memo2: TfrxMemoView
          Left = 11.338590000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Descri'#231#227'o')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 267.764070000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Valor')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 343.913730000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Dt. Vencto')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 495.945270000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Situa'#231#227'o')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 420.575140000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Dt. Pagto')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 582.047620000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Profissional')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 287.244280000000000000
        Width = 718.110700000000000000
        object Gradient2: TfrxGradientView
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Style = gsVertical
          Color = clSilver
        end
        object Memo9: TfrxMemoView
          Left = 15.118120000000000000
          Top = 1.000000000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            '[Page]')
        end
        object Memo10: TfrxMemoView
          Left = 532.913730000000000000
          Top = 1.000000000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'dd '#39'de'#39' mmmm '#39'de'#39' yyyy'
          DisplayFormat.Kind = fkDateTime
          Memo.UTF8W = (
            '[Date]')
        end
      end
    end
  end
  object frxAPagar: TfrxDBDataset
    UserName = 'frxDBAPagar'
    CloseDataSource = False
    DataSet = DM.sdsAPagar
    BCDToCurrency = False
    Left = 104
    Top = 352
  end
  object frxRptAReceber: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41604.814496643500000000
    ReportOptions.LastChange = 42908.937655509260000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 40
    Top = 400
    Datasets = <
      item
        DataSet = frxAReceber
        DataSetName = 'frxDBAReceber'
      end
      item
        DataSet = frxGerenciador
        DataSetName = 'frxDBGerenciador'
      end>
    Variables = <
      item
        Name = ' New Category1'
        Value = Null
      end
      item
        Name = 'Total'
        Value = Null
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Cliente: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 90.708720000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 180.637910000000000000
          Top = 30.236240000000000000
          Width = 355.275820000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Relat'#243'rio de Contas a Receber')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 211.653680000000000000
        Width = 718.110700000000000000
        DataSet = frxAReceber
        DataSetName = 'frxDBAReceber'
        RowCount = 0
        object frxDBClienteNOME: TfrxMemoView
          Left = 11.338590000000000000
          Width = 317.480520000000000000
          Height = 18.897650000000000000
          DataField = 'NOME'
          DataSet = frxAReceber
          DataSetName = 'frxDBAReceber'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBAReceber."NOME"]')
          ParentFont = False
        end
        object frxDBClienteLOGRADOURO: TfrxMemoView
          Left = 446.134200000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataField = 'DT_ATENDIMENTO'
          DataSet = frxAReceber
          DataSetName = 'frxDBAReceber'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBAReceber."DT_ATENDIMENTO"]')
          ParentFont = False
        end
        object frxDBClienteBAIRRO: TfrxMemoView
          Left = 336.086890000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          DataField = 'VALOR_TOTAL'
          DataSet = frxAReceber
          DataSetName = 'frxDBAReceber'
          DisplayFormat.FormatStr = 'R$ ###,###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBAReceber."VALOR_TOTAL"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 530.913730000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          DataField = 'NOME_1'
          DataSet = frxAReceber
          DataSetName = 'frxDBAReceber'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBAReceber."NOME_1"]')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 170.078850000000000000
        Width = 718.110700000000000000
        object Gradient1: TfrxGradientView
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Style = gsVertical
          Color = clSilver
        end
        object Memo2: TfrxMemoView
          Left = 11.338590000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Nome Cliente')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 337.645950000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Valor Total')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 444.913730000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Dt. Atendto')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 530.913730000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Profissional')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 400.630180000000000000
        Width = 718.110700000000000000
        object Gradient2: TfrxGradientView
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Style = gsVertical
          Color = clSilver
        end
        object Memo9: TfrxMemoView
          Left = 15.118120000000000000
          Top = 1.000000000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            '[Page]')
        end
        object Memo10: TfrxMemoView
          Left = 532.913730000000000000
          Top = 1.000000000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'dd '#39'de'#39' mmmm '#39'de'#39' yyyy'
          DisplayFormat.Kind = fkDateTime
          Memo.UTF8W = (
            '[Date]')
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Height = 86.929190000000000000
        Top = 253.228510000000000000
        Width = 718.110700000000000000
        object Memo5: TfrxMemoView
          Left = 449.764070000000000000
          Top = 41.574829999999990000
          Width = 249.448980000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'R$ ###,###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Total:[Total]')
          ParentFont = False
        end
      end
    end
  end
  object frxAReceber: TfrxDBDataset
    UserName = 'frxDBAReceber'
    CloseDataSource = False
    DataSet = DM.sdsAReceber
    BCDToCurrency = False
    Left = 104
    Top = 400
  end
  object frxRptBalanco: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41604.814496643500000000
    ReportOptions.LastChange = 42908.938526967590000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 40
    Top = 448
    Datasets = <
      item
        DataSet = frxGerenciador
        DataSetName = 'frxDBGerenciador'
      end>
    Variables = <
      item
        Name = ' New Category1'
        Value = Null
      end
      item
        Name = 'Total'
        Value = Null
      end
      item
        Name = 'Data'
        Value = Null
      end
      item
        Name = 'Agendamentos'
        Value = Null
      end
      item
        Name = 'Atendimentos'
        Value = Null
      end
      item
        Name = 'NaoCompareceram'
        Value = Null
      end
      item
        Name = 'Gasto'
        Value = Null
      end
      item
        Name = 'Recebido'
        Value = Null
      end
      item
        Name = 'Receber'
        Value = Null
      end
      item
        Name = 'Pagar'
        Value = Null
      end
      item
        Name = 'Periodo'
        Value = Null
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Cliente: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Height = 393.071120000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 309.141930000000000000
          Top = 26.456710000000000000
          Width = 102.047310000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Balan'#231'o')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 15.118120000000000000
          Top = 151.692950000000000000
          Width = 257.008040000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Agendamentos: [Agendamentos]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 15.118120000000000000
          Top = 193.267780000000000000
          Width = 257.008040000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Atendimentos: [Atendimentos]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 15.118120000000000000
          Top = 234.842610000000000000
          Width = 257.008040000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'N'#227'o Compareceram: [NaoCompareceram]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 359.055350000000000000
          Top = 193.267780000000000000
          Width = 257.008040000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'R$ ###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Valor Total Gasto: [Gasto]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 359.055350000000000000
          Top = 151.692950000000000000
          Width = 257.008040000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'R$ ###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Valor Total Recebido: [Recebido]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 359.055350000000000000
          Top = 234.842610000000000000
          Width = 257.008040000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'R$ ###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Valor Total a Receber: [Receber]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 359.055350000000000000
          Top = 276.417440000000000000
          Width = 257.008040000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'R$ ###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Valor Total a Pagar: [Pagar]')
          ParentFont = False
        end
        object Gradient1: TfrxGradientView
          Top = 95.000000000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Style = gsVertical
          Color = clSilver
        end
        object Memo12: TfrxMemoView
          Top = 95.000000000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[Periodo]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 359.055350000000000000
          Top = 317.992270000000000000
          Width = 257.008040000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'R$ ###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Valor Total Salarial Pago: [SalarioPago]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 359.055350000000000000
          Top = 359.567100000000000000
          Width = 257.008040000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'R$ ###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Valor Total: [Total]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 472.441250000000000000
        Width = 718.110700000000000000
        object Gradient2: TfrxGradientView
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Style = gsVertical
          Color = clSilver
        end
        object Memo9: TfrxMemoView
          Left = 15.118120000000000000
          Top = 1.000000000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            '[Page]')
        end
        object Memo10: TfrxMemoView
          Left = 532.913730000000000000
          Top = 1.000000000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'dd '#39'de'#39' mmmm '#39'de'#39' yyyy'
          DisplayFormat.Kind = fkDateTime
          Memo.UTF8W = (
            '[Date]')
        end
      end
    end
  end
  object frxRptFechaCaixa: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41604.814496643500000000
    ReportOptions.LastChange = 42908.939175671290000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 40
    Top = 496
    Datasets = <
      item
        DataSet = frxAPagar
        DataSetName = 'frxDBAPagar'
      end
      item
        DataSet = frxFechaCaixa
        DataSetName = 'frxDBFechaCaixa'
      end
      item
        DataSet = frxGerenciador
        DataSetName = 'frxDBGerenciador'
      end>
    Variables = <
      item
        Name = ' New Category1'
        Value = Null
      end
      item
        Name = 'Total'
        Value = ''
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Cliente: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 90.708720000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 161.740260000000000000
          Top = 30.236240000000000000
          Width = 396.850650000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Relat'#243'rio de Fechamento de Caixa')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 211.653680000000000000
        Width = 718.110700000000000000
        DataSet = frxFechaCaixa
        DataSetName = 'frxDBFechaCaixa'
        RowCount = 0
        object frxDBClienteNOME: TfrxMemoView
          Left = 11.338590000000000000
          Width = 317.480520000000000000
          Height = 18.897650000000000000
          DataField = 'NOME'
          DataSet = frxFechaCaixa
          DataSetName = 'frxDBFechaCaixa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBFechaCaixa."NOME"]')
          ParentFont = False
        end
        object frxDBClienteLOGRADOURO: TfrxMemoView
          Left = 638.890230000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataField = 'DATA'
          DataSet = frxFechaCaixa
          DataSetName = 'frxDBFechaCaixa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBFechaCaixa."DATA"]')
          ParentFont = False
        end
        object frxDBClienteBAIRRO: TfrxMemoView
          Left = 528.842920000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          DataField = 'VALOR'
          DataSet = frxFechaCaixa
          DataSetName = 'frxDBFechaCaixa'
          DisplayFormat.FormatStr = 'R$ ###,###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBFechaCaixa."VALOR"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 341.937230000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          DataField = 'NOME_1'
          DataSet = frxFechaCaixa
          DataSetName = 'frxDBFechaCaixa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBFechaCaixa."NOME_1"]')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 253.228510000000000000
        Width = 718.110700000000000000
        object Gradient1: TfrxGradientView
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Style = gsVertical
          Color = clSilver
        end
        object Memo2: TfrxMemoView
          Left = 11.338590000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Nome Cliente')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 530.401980000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Valor Total')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 637.669760000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Dt. Atendto')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 341.937230000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Profissional')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 487.559370000000000000
        Width = 718.110700000000000000
        object Gradient2: TfrxGradientView
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Style = gsVertical
          Color = clSilver
        end
        object Memo9: TfrxMemoView
          Left = 15.118120000000000000
          Top = 1.000000000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            '[Page]')
        end
        object Memo10: TfrxMemoView
          Left = 532.913730000000000000
          Top = 1.000000000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'dd '#39'de'#39' mmmm '#39'de'#39' yyyy'
          DisplayFormat.Kind = fkDateTime
          Memo.UTF8W = (
            '[Date]')
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Height = 90.708720000000000000
        Top = 336.378170000000000000
        Width = 718.110700000000000000
        object Memo5: TfrxMemoView
          Left = 449.764070000000000000
          Top = 41.574829999999990000
          Width = 249.448980000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'R$ ###,###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Total:[Total]')
          ParentFont = False
        end
      end
      object MasterData2: TfrxMasterData
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 294.803340000000000000
        Width = 718.110700000000000000
        DataSet = frxFechaCaixa
        DataSetName = 'frxDBFechaCaixa'
        RowCount = 0
        object Memo8: TfrxMemoView
          Left = 11.338590000000000000
          Width = 317.480520000000000000
          Height = 18.897650000000000000
          DataField = 'NOME_1'
          DataSet = frxFechaCaixa
          DataSetName = 'frxDBFechaCaixa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBFechaCaixa."NOME_1"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 638.890230000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataField = 'DATA'
          DataSet = frxAPagar
          DataSetName = 'frxDBAPagar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBAPagar."DATA"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 528.842920000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          DataField = 'VALOR'
          DataSet = frxAPagar
          DataSetName = 'frxDBAPagar'
          DisplayFormat.FormatStr = 'R$ ###,###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBAPagar."VALOR"]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 341.937230000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          DataField = 'NOME'
          DataSet = frxFechaCaixa
          DataSetName = 'frxDBFechaCaixa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBFechaCaixa."NOME"]')
          ParentFont = False
        end
      end
      object Header2: TfrxHeader
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 170.078850000000000000
        Width = 718.110700000000000000
        object Gradient3: TfrxGradientView
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Style = gsVertical
          Color = clSilver
        end
        object Memo14: TfrxMemoView
          Left = 11.338590000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Nome Cliente')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 530.401980000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Valor Total')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 637.669760000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Dt. Atendto')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 341.937230000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Profissional')
          ParentFont = False
        end
      end
    end
  end
  object frxFechaCaixa: TfrxDBDataset
    UserName = 'frxDBFechaCaixa'
    CloseDataSource = False
    DataSet = DM.sdsFechaCaixa
    BCDToCurrency = False
    Left = 104
    Top = 496
  end
  object frxRptCaixa: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41604.814496643500000000
    ReportOptions.LastChange = 41627.825932488400000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 192
    Top = 64
    Datasets = <
      item
        DataSet = frxCaixa
        DataSetName = 'frxDBCaixa'
      end>
    Variables = <
      item
        Name = ' Var'#225'veis'
        Value = Null
      end
      item
        Name = 'Total'
        Value = Null
      end
      item
        Name = 'Cliente'
        Value = Null
      end
      item
        Name = 'Profissional'
        Value = Null
      end
      item
        Name = 'DtPagto'
        Value = Null
      end
      item
        Name = 'Pago'
        Value = Null
      end
      item
        Name = 'Pendente'
        Value = Null
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Cliente: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Height = 128.504020000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Shape1: TfrxShapeView
          Width = 718.110700000000000000
          Height = 128.504020000000000000
        end
        object Memo1: TfrxMemoView
          Left = 11.338590000000000000
          Top = 7.559059999999999000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cliente:')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 11.338590000000000000
          Top = 44.913420000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Valor Total:')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 173.858380000000000000
          Top = 64.267780000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Dt. Pagamento:')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 11.338590000000000000
          Top = 26.236240000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Profissional:')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 173.858380000000000000
          Top = 44.913420000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Valor Pago:')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 60.472480000000000000
          Top = 7.559059999999999000
          Width = 268.346630000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Memo.UTF8W = (
            '[Cliente]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 86.929190000000000000
          Top = 26.236240000000000000
          Width = 241.889920000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Memo.UTF8W = (
            '[Profissional]')
          ParentFont = False
        end
        object frxDBCaixaVALOR_TOTAL: TfrxMemoView
          Left = 83.149660000000000000
          Top = 44.913420000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          DataSet = frxCaixa
          DataSetName = 'frxDBCaixa'
          DisplayFormat.FormatStr = 'R$ ###,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Memo.UTF8W = (
            '[Total]')
          ParentFont = False
        end
        object frxDBCaixaVALOR_PAGO: TfrxMemoView
          Left = 245.669450000000000000
          Top = 44.913420000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          DataSet = frxCaixa
          DataSetName = 'frxDBCaixa'
          DisplayFormat.FormatStr = 'R$ ###,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Memo.UTF8W = (
            '[Pago]')
          ParentFont = False
        end
        object frxDBCaixaDT_PAGAMENTO: TfrxMemoView
          Left = 261.637910000000000000
          Top = 64.267780000000000000
          Width = 63.181200000000000000
          Height = 18.897650000000000000
          DataSet = frxCaixa
          DataSetName = 'frxDBCaixa'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Memo.UTF8W = (
            '[DtPagto]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 11.338590000000000000
          Top = 64.149660000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Dt. Atendimento:')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 103.118120000000000000
          Top = 64.149660000000000000
          Width = 63.181200000000000000
          Height = 18.897650000000000000
          DataSet = frxCaixa
          DataSetName = 'frxDBCaixa'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Memo.UTF8W = (
            '[DtAtendimento]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 128.504020000000000000
          Top = 105.724490000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Assinatura')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = 34.015770000000000000
          Top = 105.724490000000000000
          Width = 257.008040000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line2: TfrxLineView
          Left = 359.055350000000000000
          Height = 128.504020000000000000
          Color = clBlack
          Diagonal = True
        end
        object Memo13: TfrxMemoView
          Left = 374.173470000000000000
          Top = 7.559059999999999000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cliente:')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 374.173470000000000000
          Top = 44.913420000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Valor Total:')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 536.693260000000000000
          Top = 64.267780000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Dt. Pagamento:')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 374.173470000000000000
          Top = 26.236240000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Profissional:')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 536.693260000000000000
          Top = 44.913420000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Valor Pago:')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 423.307360000000000000
          Top = 7.559059999999999000
          Width = 268.346630000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Memo.UTF8W = (
            '[Cliente]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 449.764070000000000000
          Top = 26.236240000000000000
          Width = 241.889920000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Memo.UTF8W = (
            '[Profissional]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 445.984540000000000000
          Top = 44.913420000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          DataSet = frxCaixa
          DataSetName = 'frxDBCaixa'
          DisplayFormat.FormatStr = 'R$ ###,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Memo.UTF8W = (
            '[Total]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 608.504330000000000000
          Top = 44.913420000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          DataSet = frxCaixa
          DataSetName = 'frxDBCaixa'
          DisplayFormat.FormatStr = 'R$ ###,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Memo.UTF8W = (
            '[Pago]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 625.472790000000000000
          Top = 64.267780000000000000
          Width = 63.181200000000000000
          Height = 18.897650000000000000
          DataSet = frxCaixa
          DataSetName = 'frxDBCaixa'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Memo.UTF8W = (
            '[DtPagto]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 374.173470000000000000
          Top = 64.149660000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Dt. Atendimento:')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 465.953000000000000000
          Top = 64.149660000000000000
          Width = 63.181200000000000000
          Height = 18.897650000000000000
          DataSet = frxCaixa
          DataSetName = 'frxDBCaixa'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Memo.UTF8W = (
            '[DtAtendimento]')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 491.338900000000000000
          Top = 105.724490000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Assinatura')
          ParentFont = False
        end
        object Line3: TfrxLineView
          Left = 396.850650000000000000
          Top = 105.724490000000000000
          Width = 257.008040000000000000
          Color = clBlack
          Diagonal = True
        end
      end
    end
  end
  object frxCaixa: TfrxDBDataset
    UserName = 'frxDBCaixa'
    CloseDataSource = False
    DataSet = DM.sdsCaixa
    BCDToCurrency = False
    Left = 256
    Top = 64
  end
  object frxRptCaixaTodos: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41604.814496643500000000
    ReportOptions.LastChange = 41629.829297476850000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 192
    Top = 112
    Datasets = <
      item
        DataSet = frxCaixaTodos
        DataSetName = 'frxDBCaixaTodos'
      end
      item
        DataSet = frxCliente
        DataSetName = 'frxDBCliente'
      end
      item
        DataSet = frxFornecedor
        DataSetName = 'frxDBFornecedor'
      end>
    Variables = <
      item
        Name = ' Var'#225'veis'
        Value = Null
      end
      item
        Name = 'Total'
        Value = Null
      end
      item
        Name = 'Cliente'
        Value = Null
      end
      item
        Name = 'Profissional'
        Value = Null
      end
      item
        Name = 'DtPagto'
        Value = Null
      end
      item
        Name = 'Pago'
        Value = Null
      end
      item
        Name = 'Pendente'
        Value = Null
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Cliente: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 132.283550000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        DataSet = frxCaixaTodos
        DataSetName = 'frxDBCaixaTodos'
        RowCount = 0
        object Shape1: TfrxShapeView
          Width = 718.110700000000000000
          Height = 128.504020000000000000
        end
        object Memo1: TfrxMemoView
          Left = 11.338590000000000000
          Top = 7.559059999999999000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cliente:')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 11.338590000000000000
          Top = 44.913420000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Valor Total:')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 173.858380000000000000
          Top = 64.267780000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Dt. Pagamento:')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 11.338590000000000000
          Top = 26.236240000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Profissional:')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 173.858380000000000000
          Top = 44.913420000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Valor Pago:')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 60.472480000000000000
          Top = 7.559059999999999000
          Width = 268.346630000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Memo.UTF8W = (
            '[Cliente]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 86.929190000000000000
          Top = 26.236240000000000000
          Width = 241.889920000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Memo.UTF8W = (
            '[Profissional]')
          ParentFont = False
        end
        object frxDBCaixaVALOR_TOTAL: TfrxMemoView
          Left = 83.149660000000000000
          Top = 44.913420000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          DataSet = frxCaixaTodos
          DataSetName = 'frxDBCaixaTodos'
          DisplayFormat.FormatStr = 'R$ ###,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Memo.UTF8W = (
            '[Total]')
          ParentFont = False
        end
        object frxDBCaixaVALOR_PAGO: TfrxMemoView
          Left = 245.669450000000000000
          Top = 44.913420000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          DataSet = frxCaixaTodos
          DataSetName = 'frxDBCaixaTodos'
          DisplayFormat.FormatStr = 'R$ ###,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Memo.UTF8W = (
            '[Pago]')
          ParentFont = False
        end
        object frxDBCaixaDT_PAGAMENTO: TfrxMemoView
          Left = 261.637910000000000000
          Top = 64.267780000000000000
          Width = 63.181200000000000000
          Height = 18.897650000000000000
          DataSet = frxCaixaTodos
          DataSetName = 'frxDBCaixaTodos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Memo.UTF8W = (
            '[DtPagto]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 11.338590000000000000
          Top = 64.149660000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Dt. Atendimento:')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 103.118120000000000000
          Top = 64.149660000000000000
          Width = 63.181200000000000000
          Height = 18.897650000000000000
          DataSet = frxCaixaTodos
          DataSetName = 'frxDBCaixaTodos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Memo.UTF8W = (
            '[DtAtendimento]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 128.504020000000000000
          Top = 105.724490000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Assinatura')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = 34.015770000000000000
          Top = 105.724490000000000000
          Width = 257.008040000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line2: TfrxLineView
          Left = 359.055350000000000000
          Height = 128.504020000000000000
          Color = clBlack
          Diagonal = True
        end
        object Memo13: TfrxMemoView
          Left = 374.173470000000000000
          Top = 7.559059999999999000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cliente:')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 374.173470000000000000
          Top = 44.913420000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Valor Total:')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 536.693260000000000000
          Top = 64.267780000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Dt. Pagamento:')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 374.173470000000000000
          Top = 26.236240000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Profissional:')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 536.693260000000000000
          Top = 44.913420000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Valor Pago:')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 423.307360000000000000
          Top = 7.559059999999999000
          Width = 268.346630000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Memo.UTF8W = (
            '[Cliente]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 449.764070000000000000
          Top = 26.236240000000000000
          Width = 241.889920000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Memo.UTF8W = (
            '[Profissional]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 445.984540000000000000
          Top = 44.913420000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          DataSet = frxCaixaTodos
          DataSetName = 'frxDBCaixaTodos'
          DisplayFormat.FormatStr = 'R$ ###,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Memo.UTF8W = (
            '[Total]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 608.504330000000000000
          Top = 44.913420000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          DataSet = frxCaixaTodos
          DataSetName = 'frxDBCaixaTodos'
          DisplayFormat.FormatStr = 'R$ ###,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Memo.UTF8W = (
            '[Pago]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 625.472790000000000000
          Top = 64.267780000000000000
          Width = 63.181200000000000000
          Height = 18.897650000000000000
          DataSet = frxCaixaTodos
          DataSetName = 'frxDBCaixaTodos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Memo.UTF8W = (
            '[DtPagto]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 374.173470000000000000
          Top = 64.149660000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Dt. Atendimento:')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 465.953000000000000000
          Top = 64.149660000000000000
          Width = 63.181200000000000000
          Height = 18.897650000000000000
          DataSet = frxCaixaTodos
          DataSetName = 'frxDBCaixaTodos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Memo.UTF8W = (
            '[DtAtendimento]')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 491.338900000000000000
          Top = 105.724490000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Assinatura')
          ParentFont = False
        end
        object Line3: TfrxLineView
          Left = 396.850650000000000000
          Top = 105.724490000000000000
          Width = 257.008040000000000000
          Color = clBlack
          Diagonal = True
        end
      end
    end
  end
  object frxCaixaTodos: TfrxDBDataset
    UserName = 'frxDBCaixaTodos'
    CloseDataSource = False
    DataSet = DM.sdsCaixa
    BCDToCurrency = False
    Left = 256
    Top = 112
  end
  object frxRptMarcados: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41961.928572476900000000
    ReportOptions.LastChange = 42908.940175393520000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 192
    Top = 160
    Datasets = <
      item
        DataSet = frxGerenciador
        DataSetName = 'frxDBGerenciador'
      end
      item
        DataSet = frxMarcados
        DataSetName = 'frxDBMarcados'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 90.708720000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          Left = 313.700990000000000000
          Top = 30.236240000000000000
          Width = 94.488250000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Agenda')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 268.346630000000000000
        Width = 718.110700000000000000
        DataSet = frxMarcados
        DataSetName = 'frxDBMarcados'
        RowCount = 0
        object frxDBMarcadosDATA: TfrxMemoView
          Left = 15.118120000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'DATA'
          DataSet = frxMarcados
          DataSetName = 'frxDBMarcados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBMarcados."DATA"]')
          ParentFont = False
        end
        object frxDBMarcadosHORA: TfrxMemoView
          Left = 102.047310000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'HORA'
          DataSet = frxMarcados
          DataSetName = 'frxDBMarcados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBMarcados."HORA"]')
          ParentFont = False
        end
        object frxDBMarcadosNOME: TfrxMemoView
          Left = 192.756030000000000000
          Width = 351.496290000000000000
          Height = 18.897650000000000000
          DataField = 'NOME'
          DataSet = frxMarcados
          DataSetName = 'frxDBMarcados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBMarcados."NOME"]')
          ParentFont = False
        end
        object frxDBMarcadosSITUACAO: TfrxMemoView
          Left = 589.606680000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          DataField = 'SITUACAO'
          DataSet = frxMarcados
          DataSetName = 'frxDBMarcados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBMarcados."SITUACAO"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 351.496290000000000000
        Width = 718.110700000000000000
        object Gradient2: TfrxGradientView
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Style = gsVertical
          Color = clSilver
        end
        object Memo1: TfrxMemoView
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[Page#]')
        end
        object Date1: TfrxMemoView
          Align = baRight
          Left = 472.441250000000000000
          Width = 245.669450000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'dd '#39'de'#39' mmmm '#39'de'#39' yyyy'
          DisplayFormat.Kind = fkDateTime
          HAlign = haRight
          Memo.UTF8W = (
            '[Date]')
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        Height = 75.370130000000000000
        Top = 170.078850000000000000
        Width = 718.110700000000000000
        object Gradient1: TfrxGradientView
          Top = 56.472479999999990000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Style = gsVertical
          Color = clSilver
        end
        object frxDBMarcadosCLIENTE: TfrxMemoView
          Left = 83.149660000000000000
          Top = 18.897650000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataField = 'CLIENTE'
          DataSet = frxMarcados
          DataSetName = 'frxDBMarcados'
          Memo.UTF8W = (
            '[frxDBMarcados."CLIENTE"]')
        end
        object Memo3: TfrxMemoView
          Left = 15.118120000000000000
          Top = 18.897650000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Paciente:')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 15.118120000000000000
          Top = 56.472479999999990000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Data')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 102.047310000000000000
          Top = 56.472479999999990000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Hora')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 192.756030000000000000
          Top = 56.472479999999990000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Nome')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 589.606680000000000000
          Top = 56.472479999999990000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Situa'#231#227'o')
          ParentFont = False
        end
      end
    end
  end
  object frxMarcados: TfrxDBDataset
    UserName = 'frxDBMarcados'
    CloseDataSource = False
    FieldAliases.Strings = (
      'INDICE=INDICE'
      'NU_COLABORADOR=NU_COLABORADOR'
      'CLIENTE=CLIENTE'
      'DATA=DATA'
      'HORA=HORA'
      'SITUACAO=SITUACAO'
      'ENCAIXE=ENCAIXE'
      'NU_CLIENTE=NU_CLIENTE'
      'INDICE_1=INDICE_1'
      'NOME=NOME'
      'SITUACAO_1=SITUACAO_1')
    DataSet = DM.sdsAgendados
    BCDToCurrency = False
    Left = 256
    Top = 160
  end
  object frxGerenciador: TfrxDBDataset
    UserName = 'frxDBGerenciador'
    CloseDataSource = False
    DataSet = DM.sdsGerenciador
    BCDToCurrency = False
    Left = 256
    Top = 208
  end
end
