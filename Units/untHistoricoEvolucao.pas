unit untHistoricoEvolucao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons, Vcl.StdCtrls, SQLExpr, Vcl.ExtDlgs, JPEG, db,
  Vcl.ExtCtrls;

type
  TfrmHistoricoEvolucao = class(TForm)
    MainMenu1: TMainMenu;
    FecharEsc1: TMenuItem;
    gbxHistorico: TGroupBox;
    DBGrid1: TDBGrid;
    lblFoto: TLabel;
    sbtFoto: TSpeedButton;
    sbtCadastrar: TSpeedButton;
    opdFoto: TOpenPictureDialog;
    PopupMenu1: TPopupMenu;
    Excluir1: TMenuItem;
    Imagem1: TImage;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FecharEsc1Click(Sender: TObject);
    procedure sbtCadastrarMouseLeave(Sender: TObject);
    procedure sbtCadastrarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbtCadastrarClick(Sender: TObject);
    procedure sbtFotoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Excluir1Click(Sender: TObject);
    procedure DBGrid1Enter(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Imagem1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    gNuCliente : Integer;
    gTelaCheia : Boolean;
    procedure InsertUpdateDelete(pTipo : Integer);
  end;

var
  frmHistoricoEvolucao: TfrmHistoricoEvolucao;

implementation

{$R *.dfm}

uses untRotinas, untDM, untCadCliente, untImagemHistorico;

procedure TfrmHistoricoEvolucao.DBGrid1CellClick(Column: TColumn);
begin
    if DM.sdsHistorico.RecordCount > 0 then
      Imagem1.Picture.LoadFromFile(DM.sdsHistoricoFOTO.AsString);
end;

procedure TfrmHistoricoEvolucao.DBGrid1Enter(Sender: TObject);
begin
    if DM.sdsHistorico.RecordCount > 0 then
      Imagem1.Picture.LoadFromFile(DM.sdsHistoricoFOTO.AsString);
end;

procedure TfrmHistoricoEvolucao.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if DM.sdsHistorico.RecordCount > 0 then
      Imagem1.Picture.LoadFromFile(DM.sdsHistoricoFOTO.AsString);
end;

procedure TfrmHistoricoEvolucao.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if DM.sdsHistorico.RecordCount > 0 then
      Imagem1.Picture.LoadFromFile(DM.sdsHistoricoFOTO.AsString);
end;

procedure TfrmHistoricoEvolucao.Excluir1Click(Sender: TObject);
begin
    InsertUpdateDelete(2);
    DM.sdsHistorico.Close;
    DM.sdsHistorico.DataSet.CommandText := ' select * from his00 a '+
                                           ' where a.nu_cliente = :pINDICE '+
                                           ' order by a.data';
    DM.sdsHistorico.DataSet.ParamByName('pINDICE').AsInteger := gNuCliente;
    DM.sdsHistorico.Open;
end;

procedure TfrmHistoricoEvolucao.FecharEsc1Click(Sender: TObject);
begin
    Close;
end;

procedure TfrmHistoricoEvolucao.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #27 then
      Close;
end;

procedure TfrmHistoricoEvolucao.FormShow(Sender: TObject);
begin
    gTelaCheia := False;
    DM.sdsHistorico.Close;
    DM.sdsHistorico.DataSet.CommandText := ' select * from his00 a '+
                                           ' where a.nu_cliente = :pINDICE '+
                                           ' order by a.data';
    DM.sdsHistorico.DataSet.ParamByName('pINDICE').AsInteger := gNuCliente;
    DM.sdsHistorico.Open;
end;

procedure TfrmHistoricoEvolucao.Imagem1DblClick(Sender: TObject);
begin
    frmImagemHistorico := TfrmImagemHistorico.Create(Application);
      if DM.sdsHistorico.RecordCount > 0 then
        frmImagemHistorico.Imagem1.Picture.LoadFromFile(DM.sdsHistoricoFOTO.AsString);
    frmImagemHistorico.Show;
end;

procedure TfrmHistoricoEvolucao.InsertUpdateDelete(pTipo : Integer);
var vSQL, vMensagem, vBmp  : string;
    vFoto: TFileStream;
    Diretorio : String;
	  Origem,
	  Destino :array[0..512] of Char;
begin
    case pTipo of
      0: // inserir
        begin
          vSQL := 'insert into HIS00 '+
                  '(NU_CLIENTE, DATA, FOTO) '+
                  'VALUES '+
                  '(:pNU_CLIENTE, :pDATA, :pFOTO)';

          vMensagem := 'incluido';
        end;

      1: // alterar
        begin
          vSQL := 'update HIS00 set '+
                  'NU_CLIENTE = :pNU_CLIENTE, '+
                  'DATA       = :pDATA, '+
                  'FOTO       = :pFOTO '+
                  'where INDICE  = :pINDICE';

          vMensagem := 'alterado';
        end;

      2: // apagar
        begin
          if Confirmacao('Confirmação', 'Deseja, realmente, excluir este registro?') then begin

            vSQL := 'delete from HIS00 '+
                    'where INDICE = :pINDICE';

            vMensagem := 'excluido';

          end
          else Exit;
        end;
    end;

    with DM do begin

      try
        TRANSACAO.TransactionID  := NewTransactionID;
        TRANSACAO.IsolationLevel := xilREADCOMMITTED;

        with sqlAux do begin

          SQL.Clear;
          CommandText := vSQL;

          if pTipo in [1,2] then
              ParamByName('pINDICE').AsInteger := DM.sdsHistoricoINDICE.AsInteger;

          // se for inserir ou alterar passa os parametros
          if pTipo in [0,1] then begin

            ParamByName('pNU_CLIENTE').AsInteger := gNuCliente;
            ParamByName('pDATA').AsDate          := Date;
            if opdFoto.FileName <> '' then begin

                 Diretorio := 'C:\SistemaODON\Imagens\Historico\'+ ExtractFileName(opdFoto.FileName);
                 //Verifica se o arquivo selecionado pelo OpenDialog1 já existe no diretório de destino
                 if FileExists(Diretorio) then
                 begin
                  if Confirmacao('Atenção', 'O arquivo ' + ExtractFileName(opdFoto.FileName) + ' já existe no destino. Deseja sobstitui-lo?') then
                  begin
                     //Apaga o arquivo no diretório de destino
                     //e depois salva o arquivo selecionado
                     DeleteFile(Diretorio);
                     StrPCopy(Origem, opdFoto.FileName);
                     StrPCopy(Destino, Diretorio);
                     CopyFile(Origem, Destino, True);
                     Exit;
                  end
                  else Exit;
                 end
                 else
                 begin
                  StrPCopy(Origem, opdFoto.FileName);
                  StrPCopy(Destino, Diretorio);
                  CopyFile(Origem, Destino, True);
                 end;

              ParamByName('pFOTO').AsString := Diretorio;
            end;

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

procedure TfrmHistoricoEvolucao.sbtCadastrarClick(Sender: TObject);
begin
    //if not gAlterar then begin
      InsertUpdateDelete(0);
    {  sbtCadastrar.Caption := 'Cadastrar';
    end
    else begin
      InsertUpdateDelete(1);
      gAlterar := False;
    end; }

    sbtCadastrar.Enabled := False;
    DM.sdsHistorico.Close;
    DM.sdsHistorico.DataSet.CommandText := ' select * from his00 a '+
                                           ' where a.nu_cliente = :pINDICE '+
                                           ' order by a.data';
    DM.sdsHistorico.DataSet.ParamByName('pINDICE').AsInteger := gNuCliente;
    DM.sdsHistorico.Open;
end;

procedure TfrmHistoricoEvolucao.sbtCadastrarMouseLeave(Sender: TObject);
begin
    sbtCadastrar.Caption := '';
end;

procedure TfrmHistoricoEvolucao.sbtCadastrarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    sbtCadastrar.Caption := 'Cadastrar';
end;

procedure TfrmHistoricoEvolucao.sbtFotoClick(Sender: TObject);
begin
    opdFoto.Filter := 'Jpg|*.jpg';
    if opdFoto.Execute then begin
      Imagem1.Picture.LoadFromFile(opdFoto.FileName);
    end;
    if opdFoto.FileName = '' then
      sbtCadastrar.Enabled := False
    else sbtCadastrar.Enabled := True;
end;

end.
