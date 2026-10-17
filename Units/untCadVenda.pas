unit untCadVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, Vcl.ComCtrls,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, SQLExpr;

type
  TfrmCadVenda = class(TForm)
    gbxVendas: TGroupBox;
    edtCodigo: TEdit;
    lblQuantidade: TLabel;
    edtQuantidade: TEdit;
    edtProduto: TEdit;
    MainMenu1: TMainMenu;
    lblProduto: TLabel;
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    LabelTotal: TLabel;
    lblReal: TLabel;
    lblTotal: TLabel;
    DBGrid1: TDBGrid;
    sbtPesquisar: TSpeedButton;
    FinalizarVenda1: TMenuItem;
    NovaVenda2: TMenuItem;
    CancelarVenda1: TMenuItem;
    FinalizarVenda2: TMenuItem;
    Sair1: TMenuItem;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure Sair1Click(Sender: TObject);
    procedure sbtPesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    gValor, gTotal : Double;
    gNumeroVenda : Integer;
    procedure InsertUpdateDelete(pTipo : Integer);
  end;

var
  frmCadVenda: TfrmCadVenda;

implementation

{$R *.dfm}

uses untRotinas, untConProduto, untDM;

procedure TfrmCadVenda.edtCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var a: Char;
begin
    if key = VK_UP then begin
      edtQuantidade.Clear;
      edtQuantidade.Text := edtCodigo.Text;
      edtCodigo.Clear;
    end;
end;

procedure TfrmCadVenda.edtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
{    ApenasNumeros(key);
    if key = #13 then begin
      with DM do begin

        try
          TRANSACAO.TransactionID := DM.NewTransactionID;
          TRANSACAO.IsolationLevel := xilREPEATABLEREAD;

          with sdsProduto do begin
            Close;
            DataSet.CommandText := ' select * from PRO00 '+
                                   ' where COD_BARRA = '+QuotedStr(edtCodigo.Text);
            Open;
          end;

          CONEXAO.StartTransaction(TRANSACAO);
          CONEXAO.Commit(DM.TRANSACAO);
        except
          begin
            CONEXAO.Rollback(TRANSACAO);
            Application.MessageBox('Falha na conexão com o banco!', 'Atenção!', MB_ICONERROR + MB_OK);
            Exit;
          end;
        end;

        if sdsProduto.RecordCount = 0 then begin
          Informacao('Atenção', 'Nenhum produto encontrado com este código de barras!');
          edtProduto.Clear;
          edtCodigo.Clear;
          Exit;
        end;

        edtProduto.Text := sdsProdutoDESCRICAO.AsString;
        gValor := sdsProdutoVALOR.AsFloat * StrToFloat(edtQuantidade.Text);

        InsertUpdateDelete(0);

        edtCodigo.Clear;
          gTotal := gTotal + gValor;

        lblTotal.Caption := FormatFloat('###,###,##0.00', gTotal);

      end;
    end; // fim with DM
                          }
end;

procedure TfrmCadVenda.InsertUpdateDelete(pTipo : Integer);
var vSQL  : string;
begin
    case pTipo of
      0: // inserir
        begin
          vSQL := 'insert into VEN00 '+
                  '(DATA_VENDA, VALOR, COD_PRODUTO, QUANTIDADE, NUM_VENDA) '+
                  'VALUES '+
                  '(:pDATA_VENDA, :pVALOR, :pCOD_PRODUTO, :pQUANTIDADE, :pNUM_VENDA)';
        end;

      2: //apagar
        begin
          if Confirmacao('Confirmação', 'Deseja, realmente, excluir este registro?') then begin

            vSQL := 'delete from VEN00 '+
                    'where INDICE = :pINDICE';
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

          if pTipo in [1,2] then
              ParamByName('pINDICE').AsInteger := DM.sdsVendaINDICE.AsInteger;

          // se for inserir ou alterar passa os parametros
          if pTipo in [0,1] then begin

            ParamByName('pDATA_VENDA').AsDate     := Date;
            ParamByName('pVALOR').AsFloat         := gValor * StrToFloat(edtQuantidade.Text);
            ParamByName('pCOD_PRODUTO').AsInteger := sdsProdutoINDICE.AsInteger;
            ParamByName('pQUANTIDADE').AsInteger  := StrToInt(edtQuantidade.Text);
            ParamByName('pNUM_VENDA').AsInteger   := gNumeroVenda + 1;

            CONEXAO.StartTransaction(TRANSACAO);
            Close;
            ExecSQL;
            CONEXAO.Commit(TRANSACAO);
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



    with DM do begin

      try
        TRANSACAO.TransactionID := DM.NewTransactionID;
        TRANSACAO.IsolationLevel := xilREPEATABLEREAD;

        with sdsVenda do begin
          Close;
          DataSet.CommandText := ' select * from VEN00 a '+
                                 ' inner join PRO00 b on b.indice = a.cod_produto '+
                                 ' where a.NUM_VENDA = ' + IntToStr(gNumeroVenda + 1);
          Open;
        end;

        CONEXAO.StartTransaction(TRANSACAO);
        CONEXAO.Commit(DM.TRANSACAO);
      except
        begin
          CONEXAO.Rollback(TRANSACAO);
          Application.MessageBox('Falha na conexão com o banco!', 'Atenção!', MB_ICONERROR + MB_OK);
          Exit;
        end;
      end;

    end; // fim with DM
end;

procedure TfrmCadVenda.edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
begin
    ApenasNumeros(key);
end;

procedure TfrmCadVenda.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #27 then
      Close;
end;

procedure TfrmCadVenda.FormShow(Sender: TObject);
begin
    gTotal := 0;
    with DM do begin

      try
        TRANSACAO.TransactionID := DM.NewTransactionID;
        TRANSACAO.IsolationLevel := xilREPEATABLEREAD;

        with sdsVenda do begin
          Close;
          DataSet.CommandText := ' select * from VEN00 a '+
                                 ' inner join PRO00 b on b.indice = a.cod_produto ';
          Open;
        end;

        CONEXAO.StartTransaction(TRANSACAO);
        CONEXAO.Commit(DM.TRANSACAO);
      except
        begin
          CONEXAO.Rollback(TRANSACAO);
          Application.MessageBox('Falha na conexão com o banco!', 'Atenção!', MB_ICONERROR + MB_OK);
          Exit;
        end;
      end;

      if sdsVenda.RecordCount = 0 then
        gNumeroVenda := 0
      else
        gNumeroVenda := sdsVenda.RecordCount;

      sdsVenda.Close;
    end; // fim with DM
end;

procedure TfrmCadVenda.Sair1Click(Sender: TObject);
begin
    Close;
end;

procedure TfrmCadVenda.sbtPesquisarClick(Sender: TObject);
begin
 {   frmConProduto := TfrmConProduto.Create(Application);
    with frmConProduto do begin
      sbtAlterar.Visible := False;
      sbtExcluir.Visible := False;
      sbtSelecionar.Visible := True;
      ShowModal;
      edtProduto.Text := DM.sdsProdutoDESCRICAO.AsString;
      edtCodigo.Text  := DM.sdsProdutoCOD_BARRA.AsString;
      Free;
    end;
    frmConProduto := nil;
    edtCodigo.SetFocus;}
end;

end.
