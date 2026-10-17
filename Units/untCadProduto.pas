unit untCadProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.ComCtrls, Vcl.Buttons, Data.SqlExpr, Vcl.Menus, Vcl.Samples.Spin;

type
  TfrmCadProduto = class(TForm)
    gbxCadProduto: TGroupBox;
    Label2: TLabel;
    dblFornecedor: TDBLookupComboBox;
    lblNome: TLabel;
    lblValorLíquido: TLabel;
    edtDescricao: TEdit;
    edtValor: TEdit;
    sbtCadastrar: TSpeedButton;
    sbtCancelar: TSpeedButton;
    MainMenu1: TMainMenu;
    FecharEsc1: TMenuItem;
    ConsultarF21: TMenuItem;
    Label1: TLabel;
    edtEstoque: TEdit;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtCancelarMouseLeave(Sender: TObject);
    procedure sbtCancelarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbtCadastrarMouseLeave(Sender: TObject);
    procedure sbtCadastrarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FecharEsc1Click(Sender: TObject);
    procedure sbtCancelarClick(Sender: TObject);
    procedure sbtCadastrarClick(Sender: TObject);
    procedure edtCodBarrasKeyPress(Sender: TObject; var Key: Char);
    procedure edtEstoqueKeyPress(Sender: TObject; var Key: Char);
    procedure ConsultarF21Click(Sender: TObject);
    procedure edtValorKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LimpaCampos;
    procedure InsertUpdateDelete(pTipo : Integer);
  end;

var
  frmCadProduto: TfrmCadProduto;

implementation

{$R *.dfm}

uses untDM, untRotinas, untConProduto;

procedure TfrmCadProduto.ConsultarF21Click(Sender: TObject);
begin
    frmConProduto := TfrmConProduto.Create(Application);
    frmConProduto.ShowModal;

    if gAlterar then begin
      edtDescricao.Text      := DM.sdsProdutoDESCRICAO.AsString;
      dblFornecedor.KeyValue := IntToStr(DM.sdsProdutoNU_FORNECEDOR.AsInteger);
      edtEstoque.Text        := FloatToStr(DM.sdsProdutoESTOQUE.AsFloat);
      edtValor.Text          := FormatFloat('###,###,##0.00', DM.sdsProdutoVALOR.AsFloat);
      sbtCadastrar.Caption := 'Alterar';
    end;

    frmConProduto.Free;
    frmConProduto := nil;
end;

procedure TfrmCadProduto.edtCodBarrasKeyPress(Sender: TObject; var Key: Char);
begin
    ApenasNumeros(key);
end;

procedure TfrmCadProduto.edtEstoqueKeyPress(Sender: TObject; var Key: Char);
begin
    if not (key in ['0'..'9',#8,#13,',']) then
      key := #0;
end;

procedure TfrmCadProduto.edtValorKeyPress(Sender: TObject; var Key: Char);
begin
    if not (key in ['0'..'9',#8,#13,',']) then
      key := #0;
end;

procedure TfrmCadProduto.FecharEsc1Click(Sender: TObject);
begin
    Close;
end;

procedure TfrmCadProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    DM.sdsFornecedor.Close;
end;

procedure TfrmCadProduto.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #27 then
      Close;
end;

procedure TfrmCadProduto.FormShow(Sender: TObject);
begin
    DM.sdsFornecedor.Close;
    DM.sdsFornecedor.DataSet.CommandText := ' select * from FOR00 '+
                                            ' where SITUACAO = '+QuotedStr('ATIVO');
    DM.sdsFornecedor.Open;

    gAlterar := False;
end;

procedure TfrmCadProduto.InsertUpdateDelete(pTipo : Integer);
var vSQL, vMensagem  : string;
begin
    case pTipo of
      0: // inserir
        begin
          vSQL := 'insert into PRO00 '+
                  '(DESCRICAO, NU_FORNECEDOR, VALOR, ESTOQUE) '+
                  'VALUES '+
                  '(:pDESCRICAO, :pNU_FORNECEDOR, :pVALOR, :pESTOQUE)';

          vMensagem := 'incluido';
        end;

      1: // alterar
        begin
          vSQL := 'update PRO00 set '+
                  'DESCRICAO     = :pDESCRICAO, '+
                  'NU_FORNECEDOR = :pNU_FORNECEDOR, '+
                  'VALOR         = :pVALOR '+
                  'ESTOQUE       = :pESTOQUE '+
                  'where INDICE  = :pINDICE';

          vMensagem := 'alterado';
        end;

      2: //apagar
        begin
          if Confirmacao('Confirmação', 'Deseja, realmente, excluir este registro?') then begin

            vSQL := 'delete from PRO00 '+
                    'where INDICE = :pINDICE';

            vMensagem := 'excluido';

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
              ParamByName('pINDICE').AsInteger := DM.sdsProdutoINDICE.AsInteger;

          // se for inserir ou alterar passa os parametros
          if pTipo in [0,1] then begin

            ParamByName('pDESCRICAO').AsString      := edtDescricao.Text;
            ParamByName('pNU_FORNECEDOR').AsInteger := dblFornecedor.KeyValue;
            ParamByName('pESTOQUE').AsFloat      := StrToFloat(trim(edtEstoque.Text));
            ParamByName('pVALOR').AsFloat           := StrToFloat(trim(edtValor.Text));

            CONEXAO.StartTransaction(TRANSACAO);
            Close;
            ExecSQL;
            CONEXAO.Commit(TRANSACAO);
            Afirmacao('Confirmação', 'Registro '+vMensagem+' com sucesso!');
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

procedure TfrmCadProduto.LimpaCampos;
begin
    edtEstoque.Clear;
    edtDescricao.Clear;
    dblFornecedor.KeyValue := null;
    edtValor.Clear;
    gAlterar := False;
end;

procedure TfrmCadProduto.sbtCadastrarClick(Sender: TObject);
begin
    if Trim(edtDescricao.Text) = '' then begin
      Application.MessageBox('Por favor, insira a descrição do produto.', 'Atenção', MB_OK + MB_ICONWARNING);
      edtDescricao.SetFocus;
      Exit;
    end;

    if dblFornecedor.KeyValue = Null then begin
      Application.MessageBox('Por favor, insira fornecedor.', 'Atenção', MB_OK + MB_ICONWARNING);
      dblFornecedor.SetFocus;
      Exit;
    end;

    if Trim(edtValor.Text) = '' then begin
      Application.MessageBox('Por favor, insira o valor do produto.', 'Atenção', MB_OK + MB_ICONWARNING);
      edtValor.SetFocus;
      Exit;
    end;

    if Trim(edtEstoque.Text) = '' then begin
      Application.MessageBox('Por favor, insira a quantidade de produtos.', 'Atenção', MB_OK + MB_ICONWARNING);
      edtEstoque.SetFocus;
      Exit;
    end;

    if not gAlterar then begin
      InsertUpdateDelete(0);
      sbtCadastrar.Caption := 'Cadastrar';
    end
    else begin
      InsertUpdateDelete(1);
      gAlterar := False;
      DM.sdsProduto.Close;
    end;
    edtDescricao.SetFocus;
    LimpaCampos;
end;

procedure TfrmCadProduto.sbtCadastrarMouseLeave(Sender: TObject);
begin
    sbtCadastrar.Caption := '';
end;

procedure TfrmCadProduto.sbtCadastrarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    if gAlterar then
      sbtCadastrar.Caption := 'Alterar'
    else
      sbtCadastrar.Caption := 'Cadastrar';
end;

procedure TfrmCadProduto.sbtCancelarClick(Sender: TObject);
begin
    LimpaCampos;
end;

procedure TfrmCadProduto.sbtCancelarMouseLeave(Sender: TObject);
begin
    sbtCancelar.Caption := '';
end;

procedure TfrmCadProduto.sbtCancelarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    sbtCancelar.Caption := 'Cancelar';
end;

end.
