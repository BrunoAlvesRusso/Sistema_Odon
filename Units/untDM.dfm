object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 560
  Width = 969
  object CONEXAO: TSQLConnection
    ConnectionName = 'FBConnection'
    DriverName = 'Firebird'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Firebird'
      'Database=C:\SistemaOdon\Banco\PROJETO_FULL.FDB'
      'RoleName=RoleName'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=3'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'IsolationLevel=ReadCommitted'
      'Trim Char=False')
    Left = 32
    Top = 8
  end
  object sqlAux: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = CONEXAO
    Left = 96
    Top = 8
  end
  object sdsCliente: TSimpleDataSet
    Aggregates = <>
    Connection = CONEXAO
    DataSet.CommandText = 'select * from CLI00'#13#10'order by NOME'
    DataSet.MaxBlobSize = 1
    DataSet.Params = <>
    Params = <>
    Left = 32
    Top = 64
    object sdsClienteINDICE: TIntegerField
      FieldName = 'INDICE'
      Required = True
    end
    object sdsClienteNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object sdsClienteRESPONSAVEL: TStringField
      FieldName = 'RESPONSAVEL'
      Size = 50
    end
    object sdsClienteRG_IE: TStringField
      FieldName = 'RG_IE'
      Size = 15
    end
    object sdsClienteCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
      Size = 14
    end
    object sdsClienteDT_NASCIMENTO: TDateField
      FieldName = 'DT_NASCIMENTO'
    end
    object sdsClienteSEXO: TStringField
      FieldName = 'SEXO'
      FixedChar = True
      Size = 1
    end
    object sdsClienteESTADO_CIVIL: TStringField
      FieldName = 'ESTADO_CIVIL'
    end
    object sdsClienteSITUACAO: TStringField
      FieldName = 'SITUACAO'
    end
    object sdsClienteUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object sdsClienteCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object sdsClienteCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object sdsClienteBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object sdsClienteTIPO_LOGRADOURO: TStringField
      FieldName = 'TIPO_LOGRADOURO'
    end
    object sdsClienteLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 40
    end
    object sdsClienteNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 10
    end
    object sdsClienteCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
    end
    object sdsClienteREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 30
    end
    object sdsClienteTELEFONE_FIXO: TStringField
      FieldName = 'TELEFONE_FIXO'
      Size = 11
    end
    object sdsClienteCELULAR: TStringField
      FieldName = 'CELULAR'
      Size = 11
    end
    object sdsClienteCELULAR2: TStringField
      FieldName = 'CELULAR2'
      Size = 11
    end
    object sdsClienteFAX: TStringField
      FieldName = 'FAX'
      Size = 11
    end
    object sdsClienteEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 40
    end
    object sdsClienteRESP_ANTERIOR: TStringField
      FieldName = 'RESP_ANTERIOR'
      Size = 50
    end
    object sdsClientePROCED_ANTERIOR: TStringField
      FieldName = 'PROCED_ANTERIOR'
      Size = 255
    end
    object sdsClienteENCAMINHADO_PARA: TStringField
      FieldName = 'ENCAMINHADO_PARA'
      Size = 50
    end
    object sdsClienteULTIMO_PROCED: TStringField
      FieldName = 'ULTIMO_PROCED'
      Size = 255
    end
    object sdsClienteDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
    end
    object sdsClienteOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 200
    end
    object sdsClienteDT_ULTIMA_CONSULTA: TDateField
      FieldName = 'DT_ULTIMA_CONSULTA'
    end
    object sdsClienteDT_PROX_CONSULTA: TDateField
      FieldName = 'DT_PROX_CONSULTA'
    end
  end
  object dsrCliente: TDataSource
    DataSet = sdsCliente
    Left = 96
    Top = 64
  end
  object sdsFornecedor: TSimpleDataSet
    Aggregates = <>
    Connection = CONEXAO
    DataSet.CommandText = 'select * from FOR00'#13#10'where SITUACAO = '#39'ATIVO'#39
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 32
    Top = 112
    object sdsFornecedorINDICE: TIntegerField
      FieldName = 'INDICE'
      Required = True
    end
    object sdsFornecedorRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Size = 50
    end
    object sdsFornecedorNOME_FANTASIA: TStringField
      FieldName = 'NOME_FANTASIA'
      Size = 50
    end
    object sdsFornecedorSITUACAO: TStringField
      FieldName = 'SITUACAO'
    end
    object sdsFornecedorIE: TStringField
      FieldName = 'IE'
      Size = 15
    end
    object sdsFornecedorCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object sdsFornecedorUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object sdsFornecedorCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object sdsFornecedorCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object sdsFornecedorBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object sdsFornecedorTIPO_LOGRADOURO: TStringField
      FieldName = 'TIPO_LOGRADOURO'
    end
    object sdsFornecedorLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 40
    end
    object sdsFornecedorNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 10
    end
    object sdsFornecedorCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
    end
    object sdsFornecedorREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 30
    end
    object sdsFornecedorTELEFONE_FIXO: TStringField
      FieldName = 'TELEFONE_FIXO'
      Size = 11
    end
    object sdsFornecedorCELULAR: TStringField
      FieldName = 'CELULAR'
      Size = 11
    end
    object sdsFornecedorCELULAR2: TStringField
      FieldName = 'CELULAR2'
      Size = 11
    end
    object sdsFornecedorFAX: TStringField
      FieldName = 'FAX'
      Size = 11
    end
    object sdsFornecedorEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 40
    end
    object sdsFornecedorOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 200
    end
  end
  object dsrFornecedor: TDataSource
    DataSet = sdsFornecedor
    Left = 96
    Top = 112
  end
  object sdsFuncionario: TSimpleDataSet
    Aggregates = <>
    Connection = CONEXAO
    DataSet.CommandText = 'select * from FUN00'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 32
    Top = 160
    object sdsFuncionarioINDICE: TIntegerField
      FieldName = 'INDICE'
      Required = True
    end
    object sdsFuncionarioNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object sdsFuncionarioDT_NASCIMENTO: TDateField
      FieldName = 'DT_NASCIMENTO'
    end
    object sdsFuncionarioSITUACAO: TStringField
      FieldName = 'SITUACAO'
    end
    object sdsFuncionarioSEXO: TStringField
      FieldName = 'SEXO'
      FixedChar = True
      Size = 1
    end
    object sdsFuncionarioUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object sdsFuncionarioCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object sdsFuncionarioCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object sdsFuncionarioBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object sdsFuncionarioTIPO_LOGRADOURO: TStringField
      FieldName = 'TIPO_LOGRADOURO'
    end
    object sdsFuncionarioLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 40
    end
    object sdsFuncionarioNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 10
    end
    object sdsFuncionarioCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
    end
    object sdsFuncionarioREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 30
    end
    object sdsFuncionarioTELEFONE_FIXO: TStringField
      FieldName = 'TELEFONE_FIXO'
      Size = 11
    end
    object sdsFuncionarioCELULAR: TStringField
      FieldName = 'CELULAR'
      Size = 11
    end
    object sdsFuncionarioCELULAR2: TStringField
      FieldName = 'CELULAR2'
      Size = 11
    end
    object sdsFuncionarioFAX: TStringField
      FieldName = 'FAX'
      Size = 11
    end
    object sdsFuncionarioEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 40
    end
    object sdsFuncionarioOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 200
    end
  end
  object dsrFuncionario: TDataSource
    DataSet = sdsFuncionario
    Left = 96
    Top = 160
  end
  object sdsProduto: TSimpleDataSet
    Aggregates = <>
    Connection = CONEXAO
    DataSet.CommandText = 
      'select * from PRO00 a'#13#10'left join FOR00 b on b.INDICE = a.NU_FORN' +
      'ECEDOR'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 32
    Top = 208
    object sdsProdutoINDICE: TIntegerField
      FieldName = 'INDICE'
      Required = True
    end
    object sdsProdutoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object sdsProdutoNU_FORNECEDOR: TIntegerField
      FieldName = 'NU_FORNECEDOR'
    end
    object sdsProdutoVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 18
      Size = 2
    end
    object sdsProdutoESTOQUE: TFMTBCDField
      FieldName = 'ESTOQUE'
      Precision = 18
      Size = 2
    end
    object sdsProdutoINDICE_1: TIntegerField
      FieldName = 'INDICE_1'
    end
    object sdsProdutoRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Size = 50
    end
    object sdsProdutoNOME_FANTASIA: TStringField
      FieldName = 'NOME_FANTASIA'
      Size = 50
    end
    object sdsProdutoSITUACAO: TStringField
      FieldName = 'SITUACAO'
    end
    object sdsProdutoIE: TStringField
      FieldName = 'IE'
      Size = 15
    end
    object sdsProdutoCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object sdsProdutoUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object sdsProdutoCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object sdsProdutoCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object sdsProdutoBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object sdsProdutoTIPO_LOGRADOURO: TStringField
      FieldName = 'TIPO_LOGRADOURO'
    end
    object sdsProdutoLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 40
    end
    object sdsProdutoNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 10
    end
    object sdsProdutoCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
    end
    object sdsProdutoREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 30
    end
    object sdsProdutoTELEFONE_FIXO: TStringField
      FieldName = 'TELEFONE_FIXO'
      Size = 11
    end
    object sdsProdutoCELULAR: TStringField
      FieldName = 'CELULAR'
      Size = 11
    end
    object sdsProdutoCELULAR2: TStringField
      FieldName = 'CELULAR2'
      Size = 11
    end
    object sdsProdutoFAX: TStringField
      FieldName = 'FAX'
      Size = 11
    end
    object sdsProdutoEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 40
    end
    object sdsProdutoOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 200
    end
  end
  object dsrProduto: TDataSource
    DataSet = sdsProduto
    Left = 96
    Top = 208
  end
  object sdsVenda: TSimpleDataSet
    Aggregates = <>
    Connection = CONEXAO
    DataSet.CommandText = 
      'select * from VEN00 a'#13#10'inner join PRO00 b on b.indice = a.cod_pr' +
      'oduto'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 32
    Top = 256
    object sdsVendaINDICE: TIntegerField
      FieldName = 'INDICE'
      Required = True
    end
    object sdsVendaCOD_BARRA: TIntegerField
      FieldName = 'COD_BARRA'
    end
    object sdsVendaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object sdsVendaVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 18
      Size = 2
    end
    object sdsVendaDATA_VENDA: TDateField
      FieldName = 'DATA_VENDA'
      Visible = False
    end
    object sdsVendaCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Visible = False
    end
    object sdsVendaEST_MINIMO: TIntegerField
      FieldName = 'EST_MINIMO'
      Visible = False
    end
    object sdsVendaEST_MAXIMO: TIntegerField
      FieldName = 'EST_MAXIMO'
      Visible = False
    end
    object sdsVendaEST_ATUAL: TIntegerField
      FieldName = 'EST_ATUAL'
      Visible = False
    end
    object sdsVendaTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Visible = False
      Size = 2
    end
    object sdsVendaNU_FORNECEDOR: TIntegerField
      FieldName = 'NU_FORNECEDOR'
      Visible = False
    end
    object sdsVendaVALOR_BRUTO: TFMTBCDField
      FieldName = 'VALOR_BRUTO'
      Visible = False
      Precision = 18
      Size = 2
    end
    object sdsVendaVALOR_LIQUIDO: TFMTBCDField
      FieldName = 'VALOR_LIQUIDO'
      Visible = False
      Precision = 18
      Size = 2
    end
    object sdsVendaPORCENTAGEM: TFMTBCDField
      FieldName = 'PORCENTAGEM'
      Visible = False
      Precision = 18
      Size = 2
    end
    object sdsVendaQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
    end
    object sdsVendaNUM_VENDA: TIntegerField
      FieldName = 'NUM_VENDA'
    end
  end
  object dsrVenda: TDataSource
    DataSet = sdsVenda
    Left = 96
    Top = 256
  end
  object sdsAgenda: TSimpleDataSet
    Aggregates = <>
    Connection = CONEXAO
    DataSet.CommandText = 
      'select * from age00 a'#13#10'inner join col00 b on a.nu_colaborador = ' +
      'b.indice'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 32
    Top = 304
    object sdsAgendaINDICE: TIntegerField
      FieldName = 'INDICE'
      Required = True
    end
    object sdsAgendaNU_COLABORADOR: TIntegerField
      FieldName = 'NU_COLABORADOR'
    end
    object sdsAgendaCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Size = 50
    end
    object sdsAgendaDATA: TDateField
      FieldName = 'DATA'
    end
    object sdsAgendaHORA: TTimeField
      FieldName = 'HORA'
      DisplayFormat = 'hh:mm'
    end
    object sdsAgendaSITUACAO: TStringField
      FieldName = 'SITUACAO'
    end
    object sdsAgendaINDICE_1: TIntegerField
      FieldName = 'INDICE_1'
      Required = True
    end
    object sdsAgendaNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object sdsAgendaSITUACAO_1: TStringField
      FieldName = 'SITUACAO_1'
      FixedChar = True
      Size = 1
    end
    object sdsAgendaENCAIXE: TStringField
      FieldName = 'ENCAIXE'
      FixedChar = True
      Size = 1
    end
    object sdsAgendaNU_CLIENTE: TIntegerField
      FieldName = 'NU_CLIENTE'
    end
    object sdsAgendaOBS: TStringField
      FieldName = 'OBS'
      Size = 200
    end
  end
  object dsrAgenda: TDataSource
    DataSet = sdsAgenda
    Left = 96
    Top = 304
  end
  object sdsProfissional: TSimpleDataSet
    Aggregates = <>
    Connection = CONEXAO
    DataSet.CommandText = 'select * from COL00'#13#10'where SITUACAO = '#39'S'#39#13#10'order by NOME'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 32
    Top = 352
    object sdsProfissionalINDICE: TIntegerField
      FieldName = 'INDICE'
      Required = True
    end
    object sdsProfissionalNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object sdsProfissionalSITUACAO: TStringField
      FieldName = 'SITUACAO'
      FixedChar = True
      Size = 1
    end
    object sdsProfissionalCRO: TStringField
      FieldName = 'CRO'
      Size = 10
    end
  end
  object dsrProfissional: TDataSource
    DataSet = sdsProfissional
    Left = 96
    Top = 352
  end
  object sdsEncaixe: TSimpleDataSet
    Aggregates = <>
    Connection = CONEXAO
    DataSet.CommandText = 'select * from ENC00'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 32
    Top = 400
    object sdsEncaixeINDICE: TIntegerField
      FieldName = 'INDICE'
      Required = True
    end
    object sdsEncaixeNU_COLABORADOR: TIntegerField
      FieldName = 'NU_COLABORADOR'
    end
    object sdsEncaixeHR_INICIO: TTimeField
      FieldName = 'HR_INICIO'
      DisplayFormat = 'hh:mm'
    end
    object sdsEncaixeHR_FIM: TTimeField
      FieldName = 'HR_FIM'
      DisplayFormat = 'hh:mm'
    end
    object sdsEncaixeINTERVALO: TIntegerField
      FieldName = 'INTERVALO'
    end
    object sdsEncaixeDIA_SEMANA: TStringField
      FieldName = 'DIA_SEMANA'
    end
  end
  object dsrEncaixe: TDataSource
    DataSet = sdsEncaixe
    Left = 96
    Top = 400
  end
  object sdsAniversarios: TSimpleDataSet
    Aggregates = <>
    Connection = CONEXAO
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 192
    Top = 64
  end
  object dsrAniversarios: TDataSource
    DataSet = sdsAniversarios
    Left = 256
    Top = 64
  end
  object sdsDebito: TSimpleDataSet
    Aggregates = <>
    Connection = CONEXAO
    DataSet.CommandText = 
      'select * from cxa00 a'#13#10'left join cli00 b on a.nu_cliente = b.ind' +
      'ice'#13#10'left join col00 c on a.nu_colaborador = c.indice'
    DataSet.MaxBlobSize = 1
    DataSet.Params = <>
    Params = <>
    Left = 32
    Top = 496
    object sdsDebitoINDICE: TIntegerField
      FieldName = 'INDICE'
      Required = True
    end
    object sdsDebitoNU_COLABORADOR: TIntegerField
      FieldName = 'NU_COLABORADOR'
    end
    object sdsDebitoNU_CLIENTE: TIntegerField
      FieldName = 'NU_CLIENTE'
    end
    object sdsDebitoVALOR_TOTAL: TFMTBCDField
      FieldName = 'VALOR_TOTAL'
      Precision = 18
      Size = 2
    end
    object sdsDebitoVALOR_PAGO: TFMTBCDField
      FieldName = 'VALOR_PAGO'
      Precision = 18
      Size = 2
    end
    object sdsDebitoVALOR_PENDENTE: TFMTBCDField
      FieldName = 'VALOR_PENDENTE'
      Precision = 18
      Size = 2
    end
    object sdsDebitoTRANSACAO: TStringField
      FieldName = 'TRANSACAO'
      FixedChar = True
      Size = 1
    end
    object sdsDebitoSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 10
    end
    object sdsDebitoDT_PAGAMENTO: TDateField
      FieldName = 'DT_PAGAMENTO'
    end
    object sdsDebitoDT_ATENDIMENTO: TDateField
      FieldName = 'DT_ATENDIMENTO'
    end
    object sdsDebitoSITUACAO_FINANC_COL: TStringField
      FieldName = 'SITUACAO_FINANC_COL'
      Size = 10
    end
    object sdsDebitoPAGO_POR: TStringField
      FieldName = 'PAGO_POR'
      Size = 80
    end
    object sdsDebitoRECEBIDO_POR: TStringField
      FieldName = 'RECEBIDO_POR'
      Size = 80
    end
    object sdsDebitoINDICE_1: TIntegerField
      FieldName = 'INDICE_1'
    end
    object sdsDebitoNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object sdsDebitoRESPONSAVEL: TStringField
      FieldName = 'RESPONSAVEL'
      Size = 50
    end
    object sdsDebitoRG_IE: TStringField
      FieldName = 'RG_IE'
      Size = 15
    end
    object sdsDebitoCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
      Size = 14
    end
    object sdsDebitoDT_NASCIMENTO: TDateField
      FieldName = 'DT_NASCIMENTO'
    end
    object sdsDebitoSEXO: TStringField
      FieldName = 'SEXO'
      FixedChar = True
      Size = 1
    end
    object sdsDebitoESTADO_CIVIL: TStringField
      FieldName = 'ESTADO_CIVIL'
    end
    object sdsDebitoSITUACAO_1: TStringField
      FieldName = 'SITUACAO_1'
    end
    object sdsDebitoUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object sdsDebitoCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object sdsDebitoCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object sdsDebitoBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object sdsDebitoTIPO_LOGRADOURO: TStringField
      FieldName = 'TIPO_LOGRADOURO'
    end
    object sdsDebitoLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 40
    end
    object sdsDebitoNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 10
    end
    object sdsDebitoCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
    end
    object sdsDebitoREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 30
    end
    object sdsDebitoTELEFONE_FIXO: TStringField
      FieldName = 'TELEFONE_FIXO'
      Size = 11
    end
    object sdsDebitoCELULAR: TStringField
      FieldName = 'CELULAR'
      Size = 11
    end
    object sdsDebitoCELULAR2: TStringField
      FieldName = 'CELULAR2'
      Size = 11
    end
    object sdsDebitoFAX: TStringField
      FieldName = 'FAX'
      Size = 11
    end
    object sdsDebitoEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 40
    end
    object sdsDebitoRESP_ANTERIOR: TStringField
      FieldName = 'RESP_ANTERIOR'
      Size = 50
    end
    object sdsDebitoPROCED_ANTERIOR: TStringField
      FieldName = 'PROCED_ANTERIOR'
      Size = 255
    end
    object sdsDebitoENCAMINHADO_PARA: TStringField
      FieldName = 'ENCAMINHADO_PARA'
      Size = 50
    end
    object sdsDebitoULTIMO_PROCED: TStringField
      FieldName = 'ULTIMO_PROCED'
      Size = 255
    end
    object sdsDebitoDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
    end
    object sdsDebitoOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 200
    end
    object sdsDebitoDT_ULTIMA_CONSULTA: TDateField
      FieldName = 'DT_ULTIMA_CONSULTA'
    end
    object sdsDebitoDT_PROX_CONSULTA: TDateField
      FieldName = 'DT_PROX_CONSULTA'
    end
    object sdsDebitoINDICE_2: TIntegerField
      FieldName = 'INDICE_2'
    end
    object sdsDebitoNOME_1: TStringField
      FieldName = 'NOME_1'
      Size = 50
    end
    object sdsDebitoSITUACAO_2: TStringField
      FieldName = 'SITUACAO_2'
      FixedChar = True
      Size = 1
    end
    object sdsDebitoCRO: TStringField
      FieldName = 'CRO'
      Size = 10
    end
  end
  object dsrDebito: TDataSource
    DataSet = sdsDebito
    Left = 96
    Top = 496
  end
  object sdsCaixa: TSimpleDataSet
    Aggregates = <>
    Connection = CONEXAO
    DataSet.CommandText = 'select * from CXA00 a'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 32
    Top = 448
    object sdsCaixaINDICE: TIntegerField
      FieldName = 'INDICE'
      Required = True
    end
    object sdsCaixaNU_COLABORADOR: TIntegerField
      FieldName = 'NU_COLABORADOR'
    end
    object sdsCaixaNU_CLIENTE: TIntegerField
      FieldName = 'NU_CLIENTE'
    end
    object sdsCaixaVALOR_TOTAL: TFMTBCDField
      FieldName = 'VALOR_TOTAL'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object sdsCaixaVALOR_PAGO: TFMTBCDField
      FieldName = 'VALOR_PAGO'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object sdsCaixaVALOR_PENDENTE: TFMTBCDField
      FieldName = 'VALOR_PENDENTE'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object sdsCaixaTRANSACAO: TStringField
      FieldName = 'TRANSACAO'
      FixedChar = True
      Size = 1
    end
    object sdsCaixaSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 10
    end
    object sdsCaixaDT_PAGAMENTO: TDateField
      FieldName = 'DT_PAGAMENTO'
    end
    object sdsCaixaDT_ATENDIMENTO: TDateField
      FieldName = 'DT_ATENDIMENTO'
    end
    object sdsCaixaSITUACAO_FINANC_COL: TStringField
      FieldName = 'SITUACAO_FINANC_COL'
      Size = 10
    end
    object sdsCaixaPAGO_POR: TStringField
      FieldName = 'PAGO_POR'
      Size = 60
    end
    object sdsCaixaRECEBIDO_POR: TStringField
      FieldName = 'RECEBIDO_POR'
      Size = 60
    end
  end
  object dsrCaixa: TDataSource
    DataSet = sdsCaixa
    Left = 96
    Top = 448
  end
  object sdsAReceber: TSimpleDataSet
    Aggregates = <>
    Connection = CONEXAO
    DataSet.CommandText = 
      'select b.nome, a.valor_total, a.dt_atendimento, c.nome from cxa0' +
      '0 a'#13#10'left join cli00 b on a.nu_cliente = b.indice'#13#10'left join col' +
      '00 c on a.nu_colaborador = c.indice'#13#10'where a.situacao = '#39'PENDENT' +
      'E'#39
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 192
    Top = 160
    object sdsAReceberNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object sdsAReceberVALOR_TOTAL: TFMTBCDField
      FieldName = 'VALOR_TOTAL'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object sdsAReceberDT_ATENDIMENTO: TDateField
      FieldName = 'DT_ATENDIMENTO'
    end
    object sdsAReceberNOME_1: TStringField
      FieldName = 'NOME_1'
      Size = 50
    end
  end
  object drsAReceber: TDataSource
    DataSet = sdsAReceber
    Left = 256
    Top = 160
  end
  object sdsAPagar: TSimpleDataSet
    Aggregates = <>
    Connection = CONEXAO
    DataSet.CommandText = 
      'select * from des00 a'#13#10'inner join col00 b on a.nu_colaborador = ' +
      'b.indice'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 192
    Top = 112
    object sdsAPagarINDICE: TIntegerField
      FieldName = 'INDICE'
      Required = True
    end
    object sdsAPagarNU_COLABORADOR: TIntegerField
      FieldName = 'NU_COLABORADOR'
    end
    object sdsAPagarDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object sdsAPagarVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object sdsAPagarDT_VENCIMENTO: TDateField
      FieldName = 'DT_VENCIMENTO'
    end
    object sdsAPagarDT_PAGAMENTO: TDateField
      FieldName = 'DT_PAGAMENTO'
    end
    object sdsAPagarSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 10
    end
    object sdsAPagarINDICE_1: TIntegerField
      FieldName = 'INDICE_1'
    end
    object sdsAPagarNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object sdsAPagarSITUACAO_1: TStringField
      FieldName = 'SITUACAO_1'
      FixedChar = True
      Size = 1
    end
  end
  object dsrAPagar: TDataSource
    DataSet = sdsAPagar
    Left = 256
    Top = 112
  end
  object sdsBalanco: TSimpleDataSet
    Aggregates = <>
    Connection = CONEXAO
    DataSet.CommandText = 'select * from DES00'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 192
    Top = 208
    object IntegerField1: TIntegerField
      FieldName = 'INDICE'
      Required = True
    end
    object StringField1: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object FMTBCDField1: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object DateField1: TDateField
      FieldName = 'DT_VENCIMENTO'
    end
    object DateField2: TDateField
      FieldName = 'DT_PAGAMENTO'
    end
    object StringField2: TStringField
      FieldName = 'SITUACAO'
      Size = 10
    end
  end
  object dsrBalanco: TDataSource
    DataSet = sdsBalanco
    Left = 256
    Top = 208
  end
  object sdsLogin: TSimpleDataSet
    Aggregates = <>
    Connection = CONEXAO
    DataSet.CommandText = 
      'select indice, nome, login, '#13#10' case '#13#10' when permissao = 1 then '#13 +
      #10#39'Usu'#225'rio'#39#13#10' else '#39'Administrativo'#39' '#13#10' end as Permissao from USU0' +
      '0'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 192
    Top = 256
    object sdsLoginNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object sdsLoginLOGIN: TStringField
      FieldName = 'LOGIN'
    end
    object sdsLoginPERMISSAO: TStringField
      FieldName = 'PERMISSAO'
      Required = True
      FixedChar = True
      Size = 14
    end
    object sdsLoginINDICE: TIntegerField
      FieldName = 'INDICE'
      Required = True
    end
  end
  object dsrLogin: TDataSource
    DataSet = sdsLogin
    Left = 256
    Top = 256
  end
  object sdsGerenciador: TSimpleDataSet
    Aggregates = <>
    Connection = CONEXAO
    DataSet.CommandText = 'select * from GER00'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 192
    Top = 8
    object sdsGerenciadorINDICE: TIntegerField
      FieldName = 'INDICE'
      Required = True
    end
    object sdsGerenciadorDT_IMPLANTACAO: TDateField
      FieldName = 'DT_IMPLANTACAO'
    end
    object sdsGerenciadorDT_RENOVACAO: TDateField
      FieldName = 'DT_RENOVACAO'
    end
    object sdsGerenciadorSISTEMA_ATIVO: TStringField
      FieldName = 'SISTEMA_ATIVO'
      FixedChar = True
      Size = 1
    end
    object sdsGerenciadorPERIODO_ATIVO: TIntegerField
      FieldName = 'PERIODO_ATIVO'
    end
    object sdsGerenciadorCAMINHO_BASE: TStringField
      FieldName = 'CAMINHO_BASE'
      Size = 500
    end
    object sdsGerenciadorCAMINHO_BACKUP: TStringField
      FieldName = 'CAMINHO_BACKUP'
      Size = 500
    end
    object sdsGerenciadorRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Size = 50
    end
    object sdsGerenciadorNOME_FANTASIA: TStringField
      FieldName = 'NOME_FANTASIA'
      Size = 50
    end
    object sdsGerenciadorIE: TStringField
      FieldName = 'IE'
      Size = 15
    end
    object sdsGerenciadorCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object sdsGerenciadorUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object sdsGerenciadorCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object sdsGerenciadorCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object sdsGerenciadorBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object sdsGerenciadorTIPO_LOGRADOURO: TStringField
      FieldName = 'TIPO_LOGRADOURO'
    end
    object sdsGerenciadorLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 40
    end
    object sdsGerenciadorNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 10
    end
    object sdsGerenciadorCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
    end
    object sdsGerenciadorTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 11
    end
    object sdsGerenciadorFAX: TStringField
      FieldName = 'FAX'
      Size = 11
    end
    object sdsGerenciadorLOGO: TStringField
      FieldName = 'LOGO'
      Size = 200
    end
    object sdsGerenciadorCHAVE: TStringField
      FieldName = 'CHAVE'
      Size = 50
    end
    object sdsGerenciadorVERSAO: TStringField
      FieldName = 'VERSAO'
    end
  end
  object dsrGerenciador: TDataSource
    DataSet = sdsGerenciador
    Left = 256
    Top = 8
  end
  object sdsEmail: TSimpleDataSet
    Aggregates = <>
    Connection = CONEXAO
    DataSet.CommandText = 'select * from EMA00'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 192
    Top = 304
    object sdsEmailINDICE: TIntegerField
      FieldName = 'INDICE'
      Required = True
    end
    object sdsEmailSMTP: TStringField
      FieldName = 'SMTP'
      Size = 50
    end
    object sdsEmailPORTA: TIntegerField
      FieldName = 'PORTA'
    end
    object sdsEmailLOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 50
    end
    object sdsEmailSENHA: TStringField
      FieldName = 'SENHA'
      Size = 50
    end
    object sdsEmailASSUNTO: TStringField
      FieldName = 'ASSUNTO'
      Size = 50
    end
    object sdsEmailMENSAGEM: TStringField
      FieldName = 'MENSAGEM'
      Size = 1000
    end
  end
  object dsrEmail: TDataSource
    DataSet = sdsEmail
    Left = 256
    Top = 304
  end
  object sdsAgendados: TSimpleDataSet
    Aggregates = <>
    Connection = CONEXAO
    DataSet.CommandText = 
      'select * from age00 a'#13#10'inner join col00 b on a.nu_colaborador = ' +
      'b.indice'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 192
    Top = 352
    object sdsAgendadosINDICE: TIntegerField
      FieldName = 'INDICE'
      Required = True
    end
    object sdsAgendadosNU_COLABORADOR: TIntegerField
      FieldName = 'NU_COLABORADOR'
    end
    object sdsAgendadosCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Size = 50
    end
    object sdsAgendadosDATA: TDateField
      FieldName = 'DATA'
    end
    object sdsAgendadosHORA: TTimeField
      FieldName = 'HORA'
      DisplayFormat = 'hh:mm'
    end
    object sdsAgendadosSITUACAO: TStringField
      FieldName = 'SITUACAO'
    end
    object sdsAgendadosENCAIXE: TStringField
      FieldName = 'ENCAIXE'
      FixedChar = True
      Size = 1
    end
    object sdsAgendadosNU_CLIENTE: TIntegerField
      FieldName = 'NU_CLIENTE'
    end
    object sdsAgendadosINDICE_1: TIntegerField
      FieldName = 'INDICE_1'
      Required = True
    end
    object sdsAgendadosNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object sdsAgendadosSITUACAO_1: TStringField
      FieldName = 'SITUACAO_1'
      FixedChar = True
      Size = 1
    end
  end
  object dsrAgendados: TDataSource
    DataSet = sdsAgendados
    Left = 256
    Top = 352
  end
  object sdsPermissao: TSimpleDataSet
    Aggregates = <>
    Connection = CONEXAO
    DataSet.CommandText = 'select * from BLO00'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 192
    Top = 400
    object sdsPermissaoINDICE: TIntegerField
      FieldName = 'INDICE'
      Required = True
    end
    object sdsPermissaoCAMPO: TStringField
      FieldName = 'CAMPO'
      Size = 50
    end
    object sdsPermissaoSITUACAO: TStringField
      FieldName = 'SITUACAO'
      FixedChar = True
      Size = 1
    end
  end
  object dtsPermissao: TDataSource
    DataSet = sdsPermissao
    Left = 256
    Top = 400
  end
  object sdsFechaCaixa: TSimpleDataSet
    Aggregates = <>
    Connection = CONEXAO
    DataSet.CommandText = 
      'select b.indice, c.nome, d.indice,  d.nome, Valor, Data, b.situa' +
      'cao_financ_col from'#13#10'(select a.indice, a.nu_colaborador, a.nu_cl' +
      'iente, sum(a.valor_pago + iif (a.valor_pendente > 0, 0, a.valor_' +
      'pendente)) as Valor,'#13#10' a.dt_pagamento as Data, a.situacao_financ' +
      '_col, a.situacao from cxa00 a'#13#10'group by a.nu_cliente, a.nu_colab' +
      'orador, a.dt_pagamento, a.situacao_financ_col, a.situacao, a.ind' +
      'ice) b'#13#10'inner join cli00 c on b.nu_cliente = c.indice'#13#10'inner joi' +
      'n col00 d on b.nu_colaborador = d.indice'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 192
    Top = 448
    object sdsFechaCaixaNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object sdsFechaCaixaNOME_1: TStringField
      FieldName = 'NOME_1'
      Size = 50
    end
    object sdsFechaCaixaVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object sdsFechaCaixaDATA: TDateField
      FieldName = 'DATA'
    end
    object sdsFechaCaixaINDICE: TIntegerField
      FieldName = 'INDICE'
    end
    object sdsFechaCaixaINDICE_1: TIntegerField
      FieldName = 'INDICE_1'
    end
    object sdsFechaCaixaSITUACAO_FINANC_COL: TStringField
      FieldName = 'SITUACAO_FINANC_COL'
      Size = 10
    end
  end
  object dsrFechaCaixa: TDataSource
    DataSet = sdsFechaCaixa
    Left = 256
    Top = 448
  end
  object sdsRemetenteCliente: TSimpleDataSet
    Aggregates = <>
    Connection = CONEXAO
    DataSet.CommandText = 'select NOME, EMAIL from CLI00'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 192
    Top = 496
    object sdsRemetenteClienteNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object sdsRemetenteClienteEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 40
    end
  end
  object dsrRemetenteCliente: TDataSource
    DataSet = sdsRemetenteCliente
    Left = 256
    Top = 496
  end
  object sdsHistorico: TSimpleDataSet
    Aggregates = <>
    Connection = CONEXAO
    DataSet.CommandText = 'select * from his00 a'#13#10'order by a.data'
    DataSet.MaxBlobSize = 1
    DataSet.Params = <>
    Params = <>
    Left = 352
    Top = 112
    object sdsHistoricoINDICE: TIntegerField
      FieldName = 'INDICE'
      Required = True
    end
    object sdsHistoricoNU_CLIENTE: TIntegerField
      FieldName = 'NU_CLIENTE'
    end
    object sdsHistoricoDATA: TDateField
      FieldName = 'DATA'
    end
    object sdsHistoricoFOTO: TStringField
      FieldName = 'FOTO'
      Size = 300
    end
  end
  object dsrHistorico: TDataSource
    DataSet = sdsHistorico
    Left = 416
    Top = 112
  end
  object sdsRetiradas: TSimpleDataSet
    Aggregates = <>
    Connection = CONEXAO
    DataSet.CommandText = 'select * from cxa00 a'#13#10'where a.transacao = '#39'S'#39
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 352
    Top = 256
    object sdsRetiradasINDICE: TIntegerField
      FieldName = 'INDICE'
      Required = True
    end
    object sdsRetiradasNU_COLABORADOR: TIntegerField
      FieldName = 'NU_COLABORADOR'
    end
    object sdsRetiradasNU_CLIENTE: TIntegerField
      FieldName = 'NU_CLIENTE'
    end
    object sdsRetiradasVALOR_TOTAL: TFMTBCDField
      FieldName = 'VALOR_TOTAL'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object sdsRetiradasVALOR_PAGO: TFMTBCDField
      FieldName = 'VALOR_PAGO'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object sdsRetiradasVALOR_PENDENTE: TFMTBCDField
      FieldName = 'VALOR_PENDENTE'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object sdsRetiradasTRANSACAO: TStringField
      FieldName = 'TRANSACAO'
      FixedChar = True
      Size = 1
    end
    object sdsRetiradasSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 10
    end
    object sdsRetiradasDT_PAGAMENTO: TDateField
      FieldName = 'DT_PAGAMENTO'
    end
    object sdsRetiradasDT_ATENDIMENTO: TDateField
      FieldName = 'DT_ATENDIMENTO'
    end
    object sdsRetiradasSITUACAO_FINANC_COL: TStringField
      FieldName = 'SITUACAO_FINANC_COL'
      Size = 10
    end
  end
  object dtsRetiradas: TDataSource
    DataSet = sdsRetiradas
    Left = 416
    Top = 256
  end
  object sdsSomaMovimentacao: TSimpleDataSet
    Aggregates = <>
    Connection = CONEXAO
    DataSet.CommandText = 
      'select sum(a.valor_pago + iif (a.valor_pendente > 0, 0, a.valor_' +
      'pendente)) as Pago from cxa00 a '#13#10'left join cli00 b on a.nu_clie' +
      'nte = b.indice'#13#10'left join col00 c on a.nu_colaborador = c.indice'
    DataSet.MaxBlobSize = 1
    DataSet.Params = <>
    Params = <>
    Left = 352
    Top = 160
    object sdsSomaMovimentacaoPAGO: TFMTBCDField
      FieldName = 'PAGO'
      Precision = 18
      Size = 2
    end
  end
  object dtsSomaMovimentacao: TDataSource
    DataSet = sdsSomaMovimentacao
    Left = 416
    Top = 160
  end
  object sdsOdontograma: TSimpleDataSet
    Aggregates = <>
    Connection = CONEXAO
    DataSet.CommandText = 'select * from ODO00'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 352
    Top = 8
    object sdsOdontogramaINDICE: TIntegerField
      FieldName = 'INDICE'
      Required = True
    end
    object sdsOdontogramaNU_CLIENTE: TIntegerField
      FieldName = 'NU_CLIENTE'
    end
    object sdsOdontogramaDENTE18_1: TStringField
      FieldName = 'DENTE18_1'
      Size = 50
    end
    object sdsOdontogramaDENTE18_2: TStringField
      FieldName = 'DENTE18_2'
      Size = 50
    end
    object sdsOdontogramaDENTE18_3: TStringField
      FieldName = 'DENTE18_3'
      Size = 50
    end
    object sdsOdontogramaDENTE18_4: TStringField
      FieldName = 'DENTE18_4'
      Size = 50
    end
    object sdsOdontogramaDENTE18_5: TStringField
      FieldName = 'DENTE18_5'
      Size = 50
    end
    object sdsOdontogramaDENTE18_6: TStringField
      FieldName = 'DENTE18_6'
      Size = 50
    end
    object sdsOdontogramaDENTE18_7: TStringField
      FieldName = 'DENTE18_7'
      Size = 50
    end
    object sdsOdontogramaDENTE18_8: TStringField
      FieldName = 'DENTE18_8'
      Size = 50
    end
    object sdsOdontogramaDENTE18_9: TStringField
      FieldName = 'DENTE18_9'
      Size = 50
    end
    object sdsOdontogramaDENTE17_1: TStringField
      FieldName = 'DENTE17_1'
      Size = 50
    end
    object sdsOdontogramaDENTE17_2: TStringField
      FieldName = 'DENTE17_2'
      Size = 50
    end
    object sdsOdontogramaDENTE17_3: TStringField
      FieldName = 'DENTE17_3'
      Size = 50
    end
    object sdsOdontogramaDENTE17_4: TStringField
      FieldName = 'DENTE17_4'
      Size = 50
    end
    object sdsOdontogramaDENTE17_5: TStringField
      FieldName = 'DENTE17_5'
      Size = 50
    end
    object sdsOdontogramaDENTE17_6: TStringField
      FieldName = 'DENTE17_6'
      Size = 50
    end
    object sdsOdontogramaDENTE17_7: TStringField
      FieldName = 'DENTE17_7'
      Size = 50
    end
    object sdsOdontogramaDENTE17_8: TStringField
      FieldName = 'DENTE17_8'
      Size = 50
    end
    object sdsOdontogramaDENTE17_9: TStringField
      FieldName = 'DENTE17_9'
      Size = 50
    end
    object sdsOdontogramaDENTE16_1: TStringField
      FieldName = 'DENTE16_1'
      Size = 50
    end
    object sdsOdontogramaDENTE16_2: TStringField
      FieldName = 'DENTE16_2'
      Size = 50
    end
    object sdsOdontogramaDENTE16_3: TStringField
      FieldName = 'DENTE16_3'
      Size = 50
    end
    object sdsOdontogramaDENTE16_4: TStringField
      FieldName = 'DENTE16_4'
      Size = 50
    end
    object sdsOdontogramaDENTE16_5: TStringField
      FieldName = 'DENTE16_5'
      Size = 50
    end
    object sdsOdontogramaDENTE16_6: TStringField
      FieldName = 'DENTE16_6'
      Size = 50
    end
    object sdsOdontogramaDENTE16_7: TStringField
      FieldName = 'DENTE16_7'
      Size = 50
    end
    object sdsOdontogramaDENTE16_8: TStringField
      FieldName = 'DENTE16_8'
      Size = 50
    end
    object sdsOdontogramaDENTE16_9: TStringField
      FieldName = 'DENTE16_9'
      Size = 50
    end
    object sdsOdontogramaDENTE15_1: TStringField
      FieldName = 'DENTE15_1'
      Size = 50
    end
    object sdsOdontogramaDENTE15_2: TStringField
      FieldName = 'DENTE15_2'
      Size = 50
    end
    object sdsOdontogramaDENTE15_3: TStringField
      FieldName = 'DENTE15_3'
      Size = 50
    end
    object sdsOdontogramaDENTE15_4: TStringField
      FieldName = 'DENTE15_4'
      Size = 50
    end
    object sdsOdontogramaDENTE15_5: TStringField
      FieldName = 'DENTE15_5'
      Size = 50
    end
    object sdsOdontogramaDENTE15_6: TStringField
      FieldName = 'DENTE15_6'
      Size = 50
    end
    object sdsOdontogramaDENTE15_7: TStringField
      FieldName = 'DENTE15_7'
      Size = 50
    end
    object sdsOdontogramaDENTE15_8: TStringField
      FieldName = 'DENTE15_8'
      Size = 50
    end
    object sdsOdontogramaDENTE15_9: TStringField
      FieldName = 'DENTE15_9'
      Size = 50
    end
    object sdsOdontogramaDENTE14_1: TStringField
      FieldName = 'DENTE14_1'
      Size = 50
    end
    object sdsOdontogramaDENTE14_2: TStringField
      FieldName = 'DENTE14_2'
      Size = 50
    end
    object sdsOdontogramaDENTE14_3: TStringField
      FieldName = 'DENTE14_3'
      Size = 50
    end
    object sdsOdontogramaDENTE14_4: TStringField
      FieldName = 'DENTE14_4'
      Size = 50
    end
    object sdsOdontogramaDENTE14_5: TStringField
      FieldName = 'DENTE14_5'
      Size = 50
    end
    object sdsOdontogramaDENTE14_6: TStringField
      FieldName = 'DENTE14_6'
      Size = 50
    end
    object sdsOdontogramaDENTE14_7: TStringField
      FieldName = 'DENTE14_7'
      Size = 50
    end
    object sdsOdontogramaDENTE14_8: TStringField
      FieldName = 'DENTE14_8'
      Size = 50
    end
    object sdsOdontogramaDENTE14_9: TStringField
      FieldName = 'DENTE14_9'
      Size = 50
    end
    object sdsOdontogramaDENTE13_1: TStringField
      FieldName = 'DENTE13_1'
      Size = 50
    end
    object sdsOdontogramaDENTE13_2: TStringField
      FieldName = 'DENTE13_2'
      Size = 50
    end
    object sdsOdontogramaDENTE13_3: TStringField
      FieldName = 'DENTE13_3'
      Size = 50
    end
    object sdsOdontogramaDENTE13_4: TStringField
      FieldName = 'DENTE13_4'
      Size = 50
    end
    object sdsOdontogramaDENTE13_5: TStringField
      FieldName = 'DENTE13_5'
      Size = 50
    end
    object sdsOdontogramaDENTE13_6: TStringField
      FieldName = 'DENTE13_6'
      Size = 50
    end
    object sdsOdontogramaDENTE13_7: TStringField
      FieldName = 'DENTE13_7'
      Size = 50
    end
    object sdsOdontogramaDENTE13_8: TStringField
      FieldName = 'DENTE13_8'
      Size = 50
    end
    object sdsOdontogramaDENTE13_9: TStringField
      FieldName = 'DENTE13_9'
      Size = 50
    end
    object sdsOdontogramaDENTE12_1: TStringField
      FieldName = 'DENTE12_1'
      Size = 50
    end
    object sdsOdontogramaDENTE12_2: TStringField
      FieldName = 'DENTE12_2'
      Size = 50
    end
    object sdsOdontogramaDENTE12_3: TStringField
      FieldName = 'DENTE12_3'
      Size = 50
    end
    object sdsOdontogramaDENTE12_4: TStringField
      FieldName = 'DENTE12_4'
      Size = 50
    end
    object sdsOdontogramaDENTE12_5: TStringField
      FieldName = 'DENTE12_5'
      Size = 50
    end
    object sdsOdontogramaDENTE12_6: TStringField
      FieldName = 'DENTE12_6'
      Size = 50
    end
    object sdsOdontogramaDENTE12_7: TStringField
      FieldName = 'DENTE12_7'
      Size = 50
    end
    object sdsOdontogramaDENTE12_8: TStringField
      FieldName = 'DENTE12_8'
      Size = 50
    end
    object sdsOdontogramaDENTE12_9: TStringField
      FieldName = 'DENTE12_9'
      Size = 50
    end
    object sdsOdontogramaDENTE11_1: TStringField
      FieldName = 'DENTE11_1'
      Size = 50
    end
    object sdsOdontogramaDENTE11_2: TStringField
      FieldName = 'DENTE11_2'
      Size = 50
    end
    object sdsOdontogramaDENTE11_3: TStringField
      FieldName = 'DENTE11_3'
      Size = 50
    end
    object sdsOdontogramaDENTE11_4: TStringField
      FieldName = 'DENTE11_4'
      Size = 50
    end
    object sdsOdontogramaDENTE11_5: TStringField
      FieldName = 'DENTE11_5'
      Size = 50
    end
    object sdsOdontogramaDENTE11_6: TStringField
      FieldName = 'DENTE11_6'
      Size = 50
    end
    object sdsOdontogramaDENTE11_7: TStringField
      FieldName = 'DENTE11_7'
      Size = 50
    end
    object sdsOdontogramaDENTE11_8: TStringField
      FieldName = 'DENTE11_8'
      Size = 50
    end
    object sdsOdontogramaDENTE11_9: TStringField
      FieldName = 'DENTE11_9'
      Size = 50
    end
    object sdsOdontogramaDENTE28_1: TStringField
      FieldName = 'DENTE28_1'
      Size = 50
    end
    object sdsOdontogramaDENTE28_2: TStringField
      FieldName = 'DENTE28_2'
      Size = 50
    end
    object sdsOdontogramaDENTE28_3: TStringField
      FieldName = 'DENTE28_3'
      Size = 50
    end
    object sdsOdontogramaDENTE28_4: TStringField
      FieldName = 'DENTE28_4'
      Size = 50
    end
    object sdsOdontogramaDENTE28_5: TStringField
      FieldName = 'DENTE28_5'
      Size = 50
    end
    object sdsOdontogramaDENTE28_6: TStringField
      FieldName = 'DENTE28_6'
      Size = 50
    end
    object sdsOdontogramaDENTE28_7: TStringField
      FieldName = 'DENTE28_7'
      Size = 50
    end
    object sdsOdontogramaDENTE28_8: TStringField
      FieldName = 'DENTE28_8'
      Size = 50
    end
    object sdsOdontogramaDENTE28_9: TStringField
      FieldName = 'DENTE28_9'
      Size = 50
    end
    object sdsOdontogramaDENTE27_1: TStringField
      FieldName = 'DENTE27_1'
      Size = 50
    end
    object sdsOdontogramaDENTE27_2: TStringField
      FieldName = 'DENTE27_2'
      Size = 50
    end
    object sdsOdontogramaDENTE27_3: TStringField
      FieldName = 'DENTE27_3'
      Size = 50
    end
    object sdsOdontogramaDENTE27_4: TStringField
      FieldName = 'DENTE27_4'
      Size = 50
    end
    object sdsOdontogramaDENTE27_5: TStringField
      FieldName = 'DENTE27_5'
      Size = 50
    end
    object sdsOdontogramaDENTE27_6: TStringField
      FieldName = 'DENTE27_6'
      Size = 50
    end
    object sdsOdontogramaDENTE27_7: TStringField
      FieldName = 'DENTE27_7'
      Size = 50
    end
    object sdsOdontogramaDENTE27_8: TStringField
      FieldName = 'DENTE27_8'
      Size = 50
    end
    object sdsOdontogramaDENTE27_9: TStringField
      FieldName = 'DENTE27_9'
      Size = 50
    end
    object sdsOdontogramaDENTE26_1: TStringField
      FieldName = 'DENTE26_1'
      Size = 50
    end
    object sdsOdontogramaDENTE26_2: TStringField
      FieldName = 'DENTE26_2'
      Size = 50
    end
    object sdsOdontogramaDENTE26_3: TStringField
      FieldName = 'DENTE26_3'
      Size = 50
    end
    object sdsOdontogramaDENTE26_4: TStringField
      FieldName = 'DENTE26_4'
      Size = 50
    end
    object sdsOdontogramaDENTE26_5: TStringField
      FieldName = 'DENTE26_5'
      Size = 50
    end
    object sdsOdontogramaDENTE26_6: TStringField
      FieldName = 'DENTE26_6'
      Size = 50
    end
    object sdsOdontogramaDENTE26_7: TStringField
      FieldName = 'DENTE26_7'
      Size = 50
    end
    object sdsOdontogramaDENTE26_8: TStringField
      FieldName = 'DENTE26_8'
      Size = 50
    end
    object sdsOdontogramaDENTE26_9: TStringField
      FieldName = 'DENTE26_9'
      Size = 50
    end
    object sdsOdontogramaDENTE25_1: TStringField
      FieldName = 'DENTE25_1'
      Size = 50
    end
    object sdsOdontogramaDENTE25_2: TStringField
      FieldName = 'DENTE25_2'
      Size = 50
    end
    object sdsOdontogramaDENTE25_3: TStringField
      FieldName = 'DENTE25_3'
      Size = 50
    end
    object sdsOdontogramaDENTE25_4: TStringField
      FieldName = 'DENTE25_4'
      Size = 50
    end
    object sdsOdontogramaDENTE25_5: TStringField
      FieldName = 'DENTE25_5'
      Size = 50
    end
    object sdsOdontogramaDENTE25_6: TStringField
      FieldName = 'DENTE25_6'
      Size = 50
    end
    object sdsOdontogramaDENTE25_7: TStringField
      FieldName = 'DENTE25_7'
      Size = 50
    end
    object sdsOdontogramaDENTE25_8: TStringField
      FieldName = 'DENTE25_8'
      Size = 50
    end
    object sdsOdontogramaDENTE25_9: TStringField
      FieldName = 'DENTE25_9'
      Size = 50
    end
    object sdsOdontogramaDENTE24_1: TStringField
      FieldName = 'DENTE24_1'
      Size = 50
    end
    object sdsOdontogramaDENTE24_2: TStringField
      FieldName = 'DENTE24_2'
      Size = 50
    end
    object sdsOdontogramaDENTE24_3: TStringField
      FieldName = 'DENTE24_3'
      Size = 50
    end
    object sdsOdontogramaDENTE24_4: TStringField
      FieldName = 'DENTE24_4'
      Size = 50
    end
    object sdsOdontogramaDENTE24_5: TStringField
      FieldName = 'DENTE24_5'
      Size = 50
    end
    object sdsOdontogramaDENTE24_6: TStringField
      FieldName = 'DENTE24_6'
      Size = 50
    end
    object sdsOdontogramaDENTE24_7: TStringField
      FieldName = 'DENTE24_7'
      Size = 50
    end
    object sdsOdontogramaDENTE24_8: TStringField
      FieldName = 'DENTE24_8'
      Size = 50
    end
    object sdsOdontogramaDENTE24_9: TStringField
      FieldName = 'DENTE24_9'
      Size = 50
    end
    object sdsOdontogramaDENTE23_1: TStringField
      FieldName = 'DENTE23_1'
      Size = 50
    end
    object sdsOdontogramaDENTE23_2: TStringField
      FieldName = 'DENTE23_2'
      Size = 50
    end
    object sdsOdontogramaDENTE23_3: TStringField
      FieldName = 'DENTE23_3'
      Size = 50
    end
    object sdsOdontogramaDENTE23_4: TStringField
      FieldName = 'DENTE23_4'
      Size = 50
    end
    object sdsOdontogramaDENTE23_5: TStringField
      FieldName = 'DENTE23_5'
      Size = 50
    end
    object sdsOdontogramaDENTE23_6: TStringField
      FieldName = 'DENTE23_6'
      Size = 50
    end
    object sdsOdontogramaDENTE23_7: TStringField
      FieldName = 'DENTE23_7'
      Size = 50
    end
    object sdsOdontogramaDENTE23_8: TStringField
      FieldName = 'DENTE23_8'
      Size = 50
    end
    object sdsOdontogramaDENTE23_9: TStringField
      FieldName = 'DENTE23_9'
      Size = 50
    end
    object sdsOdontogramaDENTE22_1: TStringField
      FieldName = 'DENTE22_1'
      Size = 50
    end
    object sdsOdontogramaDENTE22_2: TStringField
      FieldName = 'DENTE22_2'
      Size = 50
    end
    object sdsOdontogramaDENTE22_3: TStringField
      FieldName = 'DENTE22_3'
      Size = 50
    end
    object sdsOdontogramaDENTE22_4: TStringField
      FieldName = 'DENTE22_4'
      Size = 50
    end
    object sdsOdontogramaDENTE22_5: TStringField
      FieldName = 'DENTE22_5'
      Size = 50
    end
    object sdsOdontogramaDENTE22_6: TStringField
      FieldName = 'DENTE22_6'
      Size = 50
    end
    object sdsOdontogramaDENTE22_7: TStringField
      FieldName = 'DENTE22_7'
      Size = 50
    end
    object sdsOdontogramaDENTE22_8: TStringField
      FieldName = 'DENTE22_8'
      Size = 50
    end
    object sdsOdontogramaDENTE22_9: TStringField
      FieldName = 'DENTE22_9'
      Size = 50
    end
    object sdsOdontogramaDENTE21_1: TStringField
      FieldName = 'DENTE21_1'
      Size = 50
    end
    object sdsOdontogramaDENTE21_2: TStringField
      FieldName = 'DENTE21_2'
      Size = 50
    end
    object sdsOdontogramaDENTE21_3: TStringField
      FieldName = 'DENTE21_3'
      Size = 50
    end
    object sdsOdontogramaDENTE21_4: TStringField
      FieldName = 'DENTE21_4'
      Size = 50
    end
    object sdsOdontogramaDENTE21_5: TStringField
      FieldName = 'DENTE21_5'
      Size = 50
    end
    object sdsOdontogramaDENTE21_6: TStringField
      FieldName = 'DENTE21_6'
      Size = 50
    end
    object sdsOdontogramaDENTE21_7: TStringField
      FieldName = 'DENTE21_7'
      Size = 50
    end
    object sdsOdontogramaDENTE21_8: TStringField
      FieldName = 'DENTE21_8'
      Size = 50
    end
    object sdsOdontogramaDENTE21_9: TStringField
      FieldName = 'DENTE21_9'
      Size = 50
    end
    object sdsOdontogramaDENTE38_1: TStringField
      FieldName = 'DENTE38_1'
      Size = 50
    end
    object sdsOdontogramaDENTE38_2: TStringField
      FieldName = 'DENTE38_2'
      Size = 50
    end
    object sdsOdontogramaDENTE38_3: TStringField
      FieldName = 'DENTE38_3'
      Size = 50
    end
    object sdsOdontogramaDENTE38_4: TStringField
      FieldName = 'DENTE38_4'
      Size = 50
    end
    object sdsOdontogramaDENTE38_5: TStringField
      FieldName = 'DENTE38_5'
      Size = 50
    end
    object sdsOdontogramaDENTE38_6: TStringField
      FieldName = 'DENTE38_6'
      Size = 50
    end
    object sdsOdontogramaDENTE38_7: TStringField
      FieldName = 'DENTE38_7'
      Size = 50
    end
    object sdsOdontogramaDENTE38_8: TStringField
      FieldName = 'DENTE38_8'
      Size = 50
    end
    object sdsOdontogramaDENTE38_9: TStringField
      FieldName = 'DENTE38_9'
      Size = 50
    end
    object sdsOdontogramaDENTE37_1: TStringField
      FieldName = 'DENTE37_1'
      Size = 50
    end
    object sdsOdontogramaDENTE37_2: TStringField
      FieldName = 'DENTE37_2'
      Size = 50
    end
    object sdsOdontogramaDENTE37_3: TStringField
      FieldName = 'DENTE37_3'
      Size = 50
    end
    object sdsOdontogramaDENTE37_4: TStringField
      FieldName = 'DENTE37_4'
      Size = 50
    end
    object sdsOdontogramaDENTE37_5: TStringField
      FieldName = 'DENTE37_5'
      Size = 50
    end
    object sdsOdontogramaDENTE37_6: TStringField
      FieldName = 'DENTE37_6'
      Size = 50
    end
    object sdsOdontogramaDENTE37_7: TStringField
      FieldName = 'DENTE37_7'
      Size = 50
    end
    object sdsOdontogramaDENTE37_8: TStringField
      FieldName = 'DENTE37_8'
      Size = 50
    end
    object sdsOdontogramaDENTE37_9: TStringField
      FieldName = 'DENTE37_9'
      Size = 50
    end
    object sdsOdontogramaDENTE36_1: TStringField
      FieldName = 'DENTE36_1'
      Size = 50
    end
    object sdsOdontogramaDENTE36_2: TStringField
      FieldName = 'DENTE36_2'
      Size = 50
    end
    object sdsOdontogramaDENTE36_3: TStringField
      FieldName = 'DENTE36_3'
      Size = 50
    end
    object sdsOdontogramaDENTE36_4: TStringField
      FieldName = 'DENTE36_4'
      Size = 50
    end
    object sdsOdontogramaDENTE36_5: TStringField
      FieldName = 'DENTE36_5'
      Size = 50
    end
    object sdsOdontogramaDENTE36_6: TStringField
      FieldName = 'DENTE36_6'
      Size = 50
    end
    object sdsOdontogramaDENTE36_7: TStringField
      FieldName = 'DENTE36_7'
      Size = 50
    end
    object sdsOdontogramaDENTE36_8: TStringField
      FieldName = 'DENTE36_8'
      Size = 50
    end
    object sdsOdontogramaDENTE36_9: TStringField
      FieldName = 'DENTE36_9'
      Size = 50
    end
    object sdsOdontogramaDENTE35_1: TStringField
      FieldName = 'DENTE35_1'
      Size = 50
    end
    object sdsOdontogramaDENTE35_2: TStringField
      FieldName = 'DENTE35_2'
      Size = 50
    end
    object sdsOdontogramaDENTE35_3: TStringField
      FieldName = 'DENTE35_3'
      Size = 50
    end
    object sdsOdontogramaDENTE35_4: TStringField
      FieldName = 'DENTE35_4'
      Size = 50
    end
    object sdsOdontogramaDENTE35_5: TStringField
      FieldName = 'DENTE35_5'
      Size = 50
    end
    object sdsOdontogramaDENTE35_6: TStringField
      FieldName = 'DENTE35_6'
      Size = 50
    end
    object sdsOdontogramaDENTE35_7: TStringField
      FieldName = 'DENTE35_7'
      Size = 50
    end
    object sdsOdontogramaDENTE35_8: TStringField
      FieldName = 'DENTE35_8'
      Size = 50
    end
    object sdsOdontogramaDENTE35_9: TStringField
      FieldName = 'DENTE35_9'
      Size = 50
    end
    object sdsOdontogramaDENTE34_1: TStringField
      FieldName = 'DENTE34_1'
      Size = 50
    end
    object sdsOdontogramaDENTE34_2: TStringField
      FieldName = 'DENTE34_2'
      Size = 50
    end
    object sdsOdontogramaDENTE34_3: TStringField
      FieldName = 'DENTE34_3'
      Size = 50
    end
    object sdsOdontogramaDENTE34_4: TStringField
      FieldName = 'DENTE34_4'
      Size = 50
    end
    object sdsOdontogramaDENTE34_5: TStringField
      FieldName = 'DENTE34_5'
      Size = 50
    end
    object sdsOdontogramaDENTE34_6: TStringField
      FieldName = 'DENTE34_6'
      Size = 50
    end
    object sdsOdontogramaDENTE34_7: TStringField
      FieldName = 'DENTE34_7'
      Size = 50
    end
    object sdsOdontogramaDENTE34_8: TStringField
      FieldName = 'DENTE34_8'
      Size = 50
    end
    object sdsOdontogramaDENTE34_9: TStringField
      FieldName = 'DENTE34_9'
      Size = 50
    end
    object sdsOdontogramaDENTE33_1: TStringField
      FieldName = 'DENTE33_1'
      Size = 50
    end
    object sdsOdontogramaDENTE33_2: TStringField
      FieldName = 'DENTE33_2'
      Size = 50
    end
    object sdsOdontogramaDENTE33_3: TStringField
      FieldName = 'DENTE33_3'
      Size = 50
    end
    object sdsOdontogramaDENTE33_4: TStringField
      FieldName = 'DENTE33_4'
      Size = 50
    end
    object sdsOdontogramaDENTE33_5: TStringField
      FieldName = 'DENTE33_5'
      Size = 50
    end
    object sdsOdontogramaDENTE33_6: TStringField
      FieldName = 'DENTE33_6'
      Size = 50
    end
    object sdsOdontogramaDENTE33_7: TStringField
      FieldName = 'DENTE33_7'
      Size = 50
    end
    object sdsOdontogramaDENTE33_8: TStringField
      FieldName = 'DENTE33_8'
      Size = 50
    end
    object sdsOdontogramaDENTE33_9: TStringField
      FieldName = 'DENTE33_9'
      Size = 50
    end
    object sdsOdontogramaDENTE32_1: TStringField
      FieldName = 'DENTE32_1'
      Size = 50
    end
    object sdsOdontogramaDENTE32_2: TStringField
      FieldName = 'DENTE32_2'
      Size = 50
    end
    object sdsOdontogramaDENTE32_3: TStringField
      FieldName = 'DENTE32_3'
      Size = 50
    end
    object sdsOdontogramaDENTE32_4: TStringField
      FieldName = 'DENTE32_4'
      Size = 50
    end
    object sdsOdontogramaDENTE32_5: TStringField
      FieldName = 'DENTE32_5'
      Size = 50
    end
    object sdsOdontogramaDENTE32_6: TStringField
      FieldName = 'DENTE32_6'
      Size = 50
    end
    object sdsOdontogramaDENTE32_7: TStringField
      FieldName = 'DENTE32_7'
      Size = 50
    end
    object sdsOdontogramaDENTE32_8: TStringField
      FieldName = 'DENTE32_8'
      Size = 50
    end
    object sdsOdontogramaDENTE32_9: TStringField
      FieldName = 'DENTE32_9'
      Size = 50
    end
    object sdsOdontogramaDENTE31_1: TStringField
      FieldName = 'DENTE31_1'
      Size = 50
    end
    object sdsOdontogramaDENTE31_2: TStringField
      FieldName = 'DENTE31_2'
      Size = 50
    end
    object sdsOdontogramaDENTE31_3: TStringField
      FieldName = 'DENTE31_3'
      Size = 50
    end
    object sdsOdontogramaDENTE31_4: TStringField
      FieldName = 'DENTE31_4'
      Size = 50
    end
    object sdsOdontogramaDENTE31_5: TStringField
      FieldName = 'DENTE31_5'
      Size = 50
    end
    object sdsOdontogramaDENTE31_6: TStringField
      FieldName = 'DENTE31_6'
      Size = 50
    end
    object sdsOdontogramaDENTE31_7: TStringField
      FieldName = 'DENTE31_7'
      Size = 50
    end
    object sdsOdontogramaDENTE31_8: TStringField
      FieldName = 'DENTE31_8'
      Size = 50
    end
    object sdsOdontogramaDENTE31_9: TStringField
      FieldName = 'DENTE31_9'
      Size = 50
    end
    object sdsOdontogramaDENTE48_1: TStringField
      FieldName = 'DENTE48_1'
      Size = 50
    end
    object sdsOdontogramaDENTE48_2: TStringField
      FieldName = 'DENTE48_2'
      Size = 50
    end
    object sdsOdontogramaDENTE48_3: TStringField
      FieldName = 'DENTE48_3'
      Size = 50
    end
    object sdsOdontogramaDENTE48_4: TStringField
      FieldName = 'DENTE48_4'
      Size = 50
    end
    object sdsOdontogramaDENTE48_5: TStringField
      FieldName = 'DENTE48_5'
      Size = 50
    end
    object sdsOdontogramaDENTE48_6: TStringField
      FieldName = 'DENTE48_6'
      Size = 50
    end
    object sdsOdontogramaDENTE48_7: TStringField
      FieldName = 'DENTE48_7'
      Size = 50
    end
    object sdsOdontogramaDENTE48_8: TStringField
      FieldName = 'DENTE48_8'
      Size = 50
    end
    object sdsOdontogramaDENTE48_9: TStringField
      FieldName = 'DENTE48_9'
      Size = 50
    end
    object sdsOdontogramaDENTE47_1: TStringField
      FieldName = 'DENTE47_1'
      Size = 50
    end
    object sdsOdontogramaDENTE47_2: TStringField
      FieldName = 'DENTE47_2'
      Size = 50
    end
    object sdsOdontogramaDENTE47_3: TStringField
      FieldName = 'DENTE47_3'
      Size = 50
    end
    object sdsOdontogramaDENTE47_4: TStringField
      FieldName = 'DENTE47_4'
      Size = 50
    end
    object sdsOdontogramaDENTE47_5: TStringField
      FieldName = 'DENTE47_5'
      Size = 50
    end
    object sdsOdontogramaDENTE47_6: TStringField
      FieldName = 'DENTE47_6'
      Size = 50
    end
    object sdsOdontogramaDENTE47_7: TStringField
      FieldName = 'DENTE47_7'
      Size = 50
    end
    object sdsOdontogramaDENTE47_8: TStringField
      FieldName = 'DENTE47_8'
      Size = 50
    end
    object sdsOdontogramaDENTE47_9: TStringField
      FieldName = 'DENTE47_9'
      Size = 50
    end
    object sdsOdontogramaDENTE46_1: TStringField
      FieldName = 'DENTE46_1'
      Size = 50
    end
    object sdsOdontogramaDENTE46_2: TStringField
      FieldName = 'DENTE46_2'
      Size = 50
    end
    object sdsOdontogramaDENTE46_3: TStringField
      FieldName = 'DENTE46_3'
      Size = 50
    end
    object sdsOdontogramaDENTE46_4: TStringField
      FieldName = 'DENTE46_4'
      Size = 50
    end
    object sdsOdontogramaDENTE46_5: TStringField
      FieldName = 'DENTE46_5'
      Size = 50
    end
    object sdsOdontogramaDENTE46_6: TStringField
      FieldName = 'DENTE46_6'
      Size = 50
    end
    object sdsOdontogramaDENTE46_7: TStringField
      FieldName = 'DENTE46_7'
      Size = 50
    end
    object sdsOdontogramaDENTE46_8: TStringField
      FieldName = 'DENTE46_8'
      Size = 50
    end
    object sdsOdontogramaDENTE46_9: TStringField
      FieldName = 'DENTE46_9'
      Size = 50
    end
    object sdsOdontogramaDENTE45_1: TStringField
      FieldName = 'DENTE45_1'
      Size = 50
    end
    object sdsOdontogramaDENTE45_2: TStringField
      FieldName = 'DENTE45_2'
      Size = 50
    end
    object sdsOdontogramaDENTE45_3: TStringField
      FieldName = 'DENTE45_3'
      Size = 50
    end
    object sdsOdontogramaDENTE45_4: TStringField
      FieldName = 'DENTE45_4'
      Size = 50
    end
    object sdsOdontogramaDENTE45_5: TStringField
      FieldName = 'DENTE45_5'
      Size = 50
    end
    object sdsOdontogramaDENTE45_6: TStringField
      FieldName = 'DENTE45_6'
      Size = 50
    end
    object sdsOdontogramaDENTE45_7: TStringField
      FieldName = 'DENTE45_7'
      Size = 50
    end
    object sdsOdontogramaDENTE45_8: TStringField
      FieldName = 'DENTE45_8'
      Size = 50
    end
    object sdsOdontogramaDENTE45_9: TStringField
      FieldName = 'DENTE45_9'
      Size = 50
    end
    object sdsOdontogramaDENTE44_1: TStringField
      FieldName = 'DENTE44_1'
      Size = 50
    end
    object sdsOdontogramaDENTE44_2: TStringField
      FieldName = 'DENTE44_2'
      Size = 50
    end
    object sdsOdontogramaDENTE44_3: TStringField
      FieldName = 'DENTE44_3'
      Size = 50
    end
    object sdsOdontogramaDENTE44_4: TStringField
      FieldName = 'DENTE44_4'
      Size = 50
    end
    object sdsOdontogramaDENTE44_5: TStringField
      FieldName = 'DENTE44_5'
      Size = 50
    end
    object sdsOdontogramaDENTE44_6: TStringField
      FieldName = 'DENTE44_6'
      Size = 50
    end
    object sdsOdontogramaDENTE44_7: TStringField
      FieldName = 'DENTE44_7'
      Size = 50
    end
    object sdsOdontogramaDENTE44_8: TStringField
      FieldName = 'DENTE44_8'
      Size = 50
    end
    object sdsOdontogramaDENTE44_9: TStringField
      FieldName = 'DENTE44_9'
      Size = 50
    end
    object sdsOdontogramaDENTE43_1: TStringField
      FieldName = 'DENTE43_1'
      Size = 50
    end
    object sdsOdontogramaDENTE43_2: TStringField
      FieldName = 'DENTE43_2'
      Size = 50
    end
    object sdsOdontogramaDENTE43_3: TStringField
      FieldName = 'DENTE43_3'
      Size = 50
    end
    object sdsOdontogramaDENTE43_4: TStringField
      FieldName = 'DENTE43_4'
      Size = 50
    end
    object sdsOdontogramaDENTE43_5: TStringField
      FieldName = 'DENTE43_5'
      Size = 50
    end
    object sdsOdontogramaDENTE43_6: TStringField
      FieldName = 'DENTE43_6'
      Size = 50
    end
    object sdsOdontogramaDENTE43_7: TStringField
      FieldName = 'DENTE43_7'
      Size = 50
    end
    object sdsOdontogramaDENTE43_8: TStringField
      FieldName = 'DENTE43_8'
      Size = 50
    end
    object sdsOdontogramaDENTE43_9: TStringField
      FieldName = 'DENTE43_9'
      Size = 50
    end
    object sdsOdontogramaDENTE42_1: TStringField
      FieldName = 'DENTE42_1'
      Size = 50
    end
    object sdsOdontogramaDENTE42_2: TStringField
      FieldName = 'DENTE42_2'
      Size = 50
    end
    object sdsOdontogramaDENTE42_3: TStringField
      FieldName = 'DENTE42_3'
      Size = 50
    end
    object sdsOdontogramaDENTE42_4: TStringField
      FieldName = 'DENTE42_4'
      Size = 50
    end
    object sdsOdontogramaDENTE42_5: TStringField
      FieldName = 'DENTE42_5'
      Size = 50
    end
    object sdsOdontogramaDENTE42_6: TStringField
      FieldName = 'DENTE42_6'
      Size = 50
    end
    object sdsOdontogramaDENTE42_7: TStringField
      FieldName = 'DENTE42_7'
      Size = 50
    end
    object sdsOdontogramaDENTE42_8: TStringField
      FieldName = 'DENTE42_8'
      Size = 50
    end
    object sdsOdontogramaDENTE42_9: TStringField
      FieldName = 'DENTE42_9'
      Size = 50
    end
    object sdsOdontogramaDENTE41_1: TStringField
      FieldName = 'DENTE41_1'
      Size = 50
    end
    object sdsOdontogramaDENTE41_2: TStringField
      FieldName = 'DENTE41_2'
      Size = 50
    end
    object sdsOdontogramaDENTE41_3: TStringField
      FieldName = 'DENTE41_3'
      Size = 50
    end
    object sdsOdontogramaDENTE41_4: TStringField
      FieldName = 'DENTE41_4'
      Size = 50
    end
    object sdsOdontogramaDENTE41_5: TStringField
      FieldName = 'DENTE41_5'
      Size = 50
    end
    object sdsOdontogramaDENTE41_6: TStringField
      FieldName = 'DENTE41_6'
      Size = 50
    end
    object sdsOdontogramaDENTE41_7: TStringField
      FieldName = 'DENTE41_7'
      Size = 50
    end
    object sdsOdontogramaDENTE41_8: TStringField
      FieldName = 'DENTE41_8'
      Size = 50
    end
    object sdsOdontogramaDENTE41_9: TStringField
      FieldName = 'DENTE41_9'
      Size = 50
    end
  end
  object sdsLegenda: TSimpleDataSet
    Aggregates = <>
    Connection = CONEXAO
    DataSet.CommandText = 'select * from ODO01'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 352
    Top = 64
    object sdsLegendaINDICE: TIntegerField
      FieldName = 'INDICE'
      Required = True
    end
    object sdsLegendaNU_CLIENTE: TIntegerField
      FieldName = 'NU_CLIENTE'
    end
    object sdsLegendaCOR1: TStringField
      FieldName = 'COR1'
      Size = 50
    end
    object sdsLegendaDESC1: TIntegerField
      FieldName = 'DESC1'
    end
    object sdsLegendaCOR2: TStringField
      FieldName = 'COR2'
      Size = 50
    end
    object sdsLegendaDESC2: TIntegerField
      FieldName = 'DESC2'
    end
    object sdsLegendaCOR3: TStringField
      FieldName = 'COR3'
      Size = 50
    end
    object sdsLegendaDESC3: TIntegerField
      FieldName = 'DESC3'
    end
    object sdsLegendaCOR4: TStringField
      FieldName = 'COR4'
      Size = 50
    end
    object sdsLegendaDESC4: TIntegerField
      FieldName = 'DESC4'
    end
    object sdsLegendaCOR5: TStringField
      FieldName = 'COR5'
      Size = 50
    end
    object sdsLegendaDESC5: TIntegerField
      FieldName = 'DESC5'
    end
    object sdsLegendaCOR6: TStringField
      FieldName = 'COR6'
      Size = 50
    end
    object sdsLegendaDESC6: TIntegerField
      FieldName = 'DESC6'
    end
    object sdsLegendaCOR7: TStringField
      FieldName = 'COR7'
      Size = 50
    end
    object sdsLegendaDESC7: TIntegerField
      FieldName = 'DESC7'
    end
    object sdsLegendaCOR8: TStringField
      FieldName = 'COR8'
      Size = 50
    end
    object sdsLegendaDESC8: TIntegerField
      FieldName = 'DESC8'
    end
    object sdsLegendaCOR9: TStringField
      FieldName = 'COR9'
      Size = 50
    end
    object sdsLegendaDESC9: TIntegerField
      FieldName = 'DESC9'
    end
    object sdsLegendaCOR10: TStringField
      FieldName = 'COR10'
      Size = 50
    end
    object sdsLegendaDESC10: TIntegerField
      FieldName = 'DESC10'
    end
    object sdsLegendaCOR11: TStringField
      FieldName = 'COR11'
      Size = 50
    end
    object sdsLegendaDESC11: TIntegerField
      FieldName = 'DESC11'
    end
    object sdsLegendaCOR12: TStringField
      FieldName = 'COR12'
      Size = 50
    end
    object sdsLegendaDESC12: TIntegerField
      FieldName = 'DESC12'
    end
    object sdsLegendaCOR13: TStringField
      FieldName = 'COR13'
      Size = 50
    end
    object sdsLegendaDESC13: TIntegerField
      FieldName = 'DESC13'
    end
    object sdsLegendaCOR14: TStringField
      FieldName = 'COR14'
      Size = 50
    end
    object sdsLegendaDESC14: TIntegerField
      FieldName = 'DESC14'
    end
    object sdsLegendaCOR15: TStringField
      FieldName = 'COR15'
      Size = 50
    end
    object sdsLegendaDESC15: TIntegerField
      FieldName = 'DESC15'
    end
  end
  object sdsProcedimento: TSimpleDataSet
    Aggregates = <>
    Connection = CONEXAO
    DataSet.CommandText = 'select * from PCT00'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 352
    Top = 208
    object sdsProcedimentoINDICE: TIntegerField
      FieldName = 'INDICE'
      Required = True
    end
    object sdsProcedimentoPROCEDIMENTO: TStringField
      FieldName = 'PROCEDIMENTO'
      Size = 100
    end
    object sdsProcedimentoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 200
    end
  end
  object dtsProcedimento: TDataSource
    DataSet = sdsProcedimento
    Left = 416
    Top = 208
  end
  object dsrLegenda: TDataSource
    DataSet = sdsLegenda
    Left = 416
    Top = 64
  end
  object sdsLegenda01: TSimpleDataSet
    Aggregates = <>
    Connection = CONEXAO
    DataSet.CommandText = 'select * from PCT00'#13#10'order by PROCEDIMENTO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 512
    Top = 64
    object IntegerField3: TIntegerField
      FieldName = 'INDICE'
      Required = True
    end
    object StringField5: TStringField
      FieldName = 'PROCEDIMENTO'
      Size = 100
    end
    object StringField6: TStringField
      FieldName = 'DESCRICAO'
      Size = 200
    end
  end
  object drsLegenda01: TDataSource
    DataSet = sdsLegenda01
    Left = 576
    Top = 64
  end
  object sdsLegenda02: TSimpleDataSet
    Aggregates = <>
    Connection = CONEXAO
    DataSet.CommandText = 'select * from PCT00'#13#10'order by PROCEDIMENTO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 512
    Top = 112
    object IntegerField2: TIntegerField
      FieldName = 'INDICE'
      Required = True
    end
    object StringField3: TStringField
      FieldName = 'PROCEDIMENTO'
      Size = 100
    end
    object StringField4: TStringField
      FieldName = 'DESCRICAO'
      Size = 200
    end
  end
  object drsLegenda02: TDataSource
    DataSet = sdsLegenda02
    Left = 576
    Top = 112
  end
  object sdsLegenda03: TSimpleDataSet
    Aggregates = <>
    Connection = CONEXAO
    DataSet.CommandText = 'select * from PCT00'#13#10'order by PROCEDIMENTO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 512
    Top = 160
    object IntegerField4: TIntegerField
      FieldName = 'INDICE'
      Required = True
    end
    object StringField7: TStringField
      FieldName = 'PROCEDIMENTO'
      Size = 100
    end
    object StringField8: TStringField
      FieldName = 'DESCRICAO'
      Size = 200
    end
  end
  object drsLegenda03: TDataSource
    DataSet = sdsLegenda03
    Left = 576
    Top = 160
  end
  object sdsLegenda04: TSimpleDataSet
    Aggregates = <>
    Connection = CONEXAO
    DataSet.CommandText = 'select * from PCT00'#13#10'order by PROCEDIMENTO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 512
    Top = 208
    object IntegerField5: TIntegerField
      FieldName = 'INDICE'
      Required = True
    end
    object StringField9: TStringField
      FieldName = 'PROCEDIMENTO'
      Size = 100
    end
    object StringField10: TStringField
      FieldName = 'DESCRICAO'
      Size = 200
    end
  end
  object drsLegenda04: TDataSource
    DataSet = sdsLegenda04
    Left = 576
    Top = 208
  end
  object sdsLegenda05: TSimpleDataSet
    Aggregates = <>
    Connection = CONEXAO
    DataSet.CommandText = 'select * from PCT00'#13#10'order by PROCEDIMENTO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 512
    Top = 256
    object IntegerField6: TIntegerField
      FieldName = 'INDICE'
      Required = True
    end
    object StringField11: TStringField
      FieldName = 'PROCEDIMENTO'
      Size = 100
    end
    object StringField12: TStringField
      FieldName = 'DESCRICAO'
      Size = 200
    end
  end
  object drsLegenda05: TDataSource
    DataSet = sdsLegenda05
    Left = 576
    Top = 256
  end
  object sdsLegenda06: TSimpleDataSet
    Aggregates = <>
    Connection = CONEXAO
    DataSet.CommandText = 'select * from PCT00'#13#10'order by PROCEDIMENTO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 512
    Top = 304
    object IntegerField7: TIntegerField
      FieldName = 'INDICE'
      Required = True
    end
    object StringField13: TStringField
      FieldName = 'PROCEDIMENTO'
      Size = 100
    end
    object StringField14: TStringField
      FieldName = 'DESCRICAO'
      Size = 200
    end
  end
  object drsLegenda06: TDataSource
    DataSet = sdsLegenda06
    Left = 576
    Top = 304
  end
  object sdsLegenda07: TSimpleDataSet
    Aggregates = <>
    Connection = CONEXAO
    DataSet.CommandText = 'select * from PCT00'#13#10'order by PROCEDIMENTO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 512
    Top = 352
    object IntegerField8: TIntegerField
      FieldName = 'INDICE'
      Required = True
    end
    object StringField15: TStringField
      FieldName = 'PROCEDIMENTO'
      Size = 100
    end
    object StringField16: TStringField
      FieldName = 'DESCRICAO'
      Size = 200
    end
  end
  object drsLegenda07: TDataSource
    DataSet = sdsLegenda07
    Left = 576
    Top = 352
  end
  object sdsLegenda08: TSimpleDataSet
    Aggregates = <>
    Connection = CONEXAO
    DataSet.CommandText = 'select * from PCT00'#13#10'order by PROCEDIMENTO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 512
    Top = 400
    object IntegerField9: TIntegerField
      FieldName = 'INDICE'
      Required = True
    end
    object StringField17: TStringField
      FieldName = 'PROCEDIMENTO'
      Size = 100
    end
    object StringField18: TStringField
      FieldName = 'DESCRICAO'
      Size = 200
    end
  end
  object drsLegenda08: TDataSource
    DataSet = sdsLegenda08
    Left = 576
    Top = 400
  end
  object sdsLegenda09: TSimpleDataSet
    Aggregates = <>
    Connection = CONEXAO
    DataSet.CommandText = 'select * from PCT00'#13#10'order by PROCEDIMENTO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 656
    Top = 64
    object IntegerField10: TIntegerField
      FieldName = 'INDICE'
      Required = True
    end
    object StringField19: TStringField
      FieldName = 'PROCEDIMENTO'
      Size = 100
    end
    object StringField20: TStringField
      FieldName = 'DESCRICAO'
      Size = 200
    end
  end
  object drsLegenda09: TDataSource
    DataSet = sdsLegenda09
    Left = 720
    Top = 64
  end
  object sdsLegenda10: TSimpleDataSet
    Aggregates = <>
    Connection = CONEXAO
    DataSet.CommandText = 'select * from PCT00'#13#10'order by PROCEDIMENTO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 656
    Top = 112
    object IntegerField11: TIntegerField
      FieldName = 'INDICE'
      Required = True
    end
    object StringField21: TStringField
      FieldName = 'PROCEDIMENTO'
      Size = 100
    end
    object StringField22: TStringField
      FieldName = 'DESCRICAO'
      Size = 200
    end
  end
  object drsLegenda10: TDataSource
    DataSet = sdsLegenda10
    Left = 720
    Top = 112
  end
  object sdsLegenda11: TSimpleDataSet
    Aggregates = <>
    Connection = CONEXAO
    DataSet.CommandText = 'select * from PCT00'#13#10'order by PROCEDIMENTO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 656
    Top = 160
    object IntegerField12: TIntegerField
      FieldName = 'INDICE'
      Required = True
    end
    object StringField23: TStringField
      FieldName = 'PROCEDIMENTO'
      Size = 100
    end
    object StringField24: TStringField
      FieldName = 'DESCRICAO'
      Size = 200
    end
  end
  object drsLegenda11: TDataSource
    DataSet = sdsLegenda11
    Left = 720
    Top = 160
  end
  object sdsLegenda12: TSimpleDataSet
    Aggregates = <>
    Connection = CONEXAO
    DataSet.CommandText = 'select * from PCT00'#13#10'order by PROCEDIMENTO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 656
    Top = 208
    object IntegerField13: TIntegerField
      FieldName = 'INDICE'
      Required = True
    end
    object StringField25: TStringField
      FieldName = 'PROCEDIMENTO'
      Size = 100
    end
    object StringField26: TStringField
      FieldName = 'DESCRICAO'
      Size = 200
    end
  end
  object drsLegenda12: TDataSource
    DataSet = sdsLegenda12
    Left = 720
    Top = 208
  end
  object sdsLegenda13: TSimpleDataSet
    Aggregates = <>
    Connection = CONEXAO
    DataSet.CommandText = 'select * from PCT00'#13#10'order by PROCEDIMENTO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 656
    Top = 256
    object IntegerField14: TIntegerField
      FieldName = 'INDICE'
      Required = True
    end
    object StringField27: TStringField
      FieldName = 'PROCEDIMENTO'
      Size = 100
    end
    object StringField28: TStringField
      FieldName = 'DESCRICAO'
      Size = 200
    end
  end
  object drsLegenda13: TDataSource
    DataSet = sdsLegenda13
    Left = 720
    Top = 256
  end
  object sdsLegenda14: TSimpleDataSet
    Aggregates = <>
    Connection = CONEXAO
    DataSet.CommandText = 'select * from PCT00'#13#10'order by PROCEDIMENTO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 656
    Top = 304
    object IntegerField15: TIntegerField
      FieldName = 'INDICE'
      Required = True
    end
    object StringField29: TStringField
      FieldName = 'PROCEDIMENTO'
      Size = 100
    end
    object StringField30: TStringField
      FieldName = 'DESCRICAO'
      Size = 200
    end
  end
  object drsLegenda14: TDataSource
    DataSet = sdsLegenda14
    Left = 720
    Top = 304
  end
  object sdsLegenda15: TSimpleDataSet
    Aggregates = <>
    Connection = CONEXAO
    DataSet.CommandText = 'select * from PCT00'#13#10'order by PROCEDIMENTO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 656
    Top = 352
    object IntegerField16: TIntegerField
      FieldName = 'INDICE'
      Required = True
    end
    object StringField31: TStringField
      FieldName = 'PROCEDIMENTO'
      Size = 100
    end
    object StringField32: TStringField
      FieldName = 'DESCRICAO'
      Size = 200
    end
  end
  object drsLegenda15: TDataSource
    DataSet = sdsLegenda15
    Left = 720
    Top = 352
  end
  object sdsFoto: TSimpleDataSet
    Aggregates = <>
    Connection = CONEXAO
    DataSet.CommandText = 'select * from FOT00'
    DataSet.MaxBlobSize = 1
    DataSet.Params = <>
    Params = <>
    Left = 352
    Top = 304
    object sdsFotoINDICE: TIntegerField
      FieldName = 'INDICE'
      Required = True
    end
    object sdsFotoIMAGEM: TBlobField
      FieldName = 'IMAGEM'
      Size = 1
    end
    object sdsFotoNU_CLIENTE: TIntegerField
      FieldName = 'NU_CLIENTE'
    end
  end
  object dsrFoto: TDataSource
    DataSet = sdsFoto
    Left = 416
    Top = 304
  end
  object sdsAnamnese: TSimpleDataSet
    Aggregates = <>
    Connection = CONEXAO
    DataSet.CommandText = 'select * from ANA00'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 352
    Top = 352
    object sdsAnamneseINDICE: TIntegerField
      FieldName = 'INDICE'
      Required = True
    end
    object sdsAnamnesePERGUNTA1: TStringField
      FieldName = 'PERGUNTA1'
      Size = 255
    end
    object sdsAnamnesePERGUNTA2: TStringField
      FieldName = 'PERGUNTA2'
      Size = 255
    end
    object sdsAnamnesePERGUNTA3: TStringField
      FieldName = 'PERGUNTA3'
      Size = 255
    end
    object sdsAnamnesePERGUNTA4: TStringField
      FieldName = 'PERGUNTA4'
      Size = 255
    end
    object sdsAnamnesePERGUNTA5: TStringField
      FieldName = 'PERGUNTA5'
      Size = 255
    end
    object sdsAnamnesePERGUNTA6: TStringField
      FieldName = 'PERGUNTA6'
      Size = 255
    end
    object sdsAnamnesePERGUNTA7: TStringField
      FieldName = 'PERGUNTA7'
      Size = 255
    end
    object sdsAnamnesePERGUNTA8: TStringField
      FieldName = 'PERGUNTA8'
      Size = 255
    end
    object sdsAnamnesePERGUNTA9: TStringField
      FieldName = 'PERGUNTA9'
      Size = 255
    end
    object sdsAnamnesePERGUNTA10: TStringField
      FieldName = 'PERGUNTA10'
      Size = 255
    end
  end
  object dsrAnamnese: TDataSource
    DataSet = sdsAnamnese
    Left = 416
    Top = 352
  end
  object sdsAnamneseResp: TSimpleDataSet
    Aggregates = <>
    Connection = CONEXAO
    DataSet.CommandText = 'select * from ANA01'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 352
    Top = 400
    object sdsAnamneseRespINDICE: TIntegerField
      FieldName = 'INDICE'
      Required = True
    end
    object sdsAnamneseRespNU_CLIENTE: TIntegerField
      FieldName = 'NU_CLIENTE'
    end
    object sdsAnamneseRespRESPOSTA1: TStringField
      FieldName = 'RESPOSTA1'
      Size = 255
    end
    object sdsAnamneseRespRESPOSTA2: TStringField
      FieldName = 'RESPOSTA2'
      Size = 255
    end
    object sdsAnamneseRespRESPOSTA3: TStringField
      FieldName = 'RESPOSTA3'
      Size = 255
    end
    object sdsAnamneseRespRESPOSTA4: TStringField
      FieldName = 'RESPOSTA4'
      Size = 255
    end
    object sdsAnamneseRespRESPOSTA5: TStringField
      FieldName = 'RESPOSTA5'
      Size = 255
    end
    object sdsAnamneseRespRESPOSTA6: TStringField
      FieldName = 'RESPOSTA6'
      Size = 255
    end
    object sdsAnamneseRespRESPOSTA7: TStringField
      FieldName = 'RESPOSTA7'
      Size = 255
    end
    object sdsAnamneseRespRESPOSTA8: TStringField
      FieldName = 'RESPOSTA8'
      Size = 255
    end
    object sdsAnamneseRespRESPOSTA9: TStringField
      FieldName = 'RESPOSTA9'
      Size = 255
    end
    object sdsAnamneseRespRESPOSTA10: TStringField
      FieldName = 'RESPOSTA10'
      Size = 255
    end
  end
  object DataSource1: TDataSource
    DataSet = sdsAnamneseResp
    Left = 416
    Top = 400
  end
end
