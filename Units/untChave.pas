unit untChave;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Data.DBXFirebird, Data.DB, Data.SqlExpr, Data.FMTBcd, Datasnap.DBClient,
  SimpleDS;

type
  TfrmChave = class(TForm)
    Label1: TLabel;
    edtChave: TEdit;
    btnAtivar: TSpeedButton;
    lblOk: TLabel;
    lblNo: TLabel;
    sbtFechar: TSpeedButton;
    procedure btnAtivarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbtFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    TRANSACAO:TTransactionDesc;
    function NewTransactionID: LongWord;
  end;

var
  frmChave: TfrmChave;

implementation

{$R *.dfm}

uses untDM;

procedure TfrmChave.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    sbtFecharClick(Sender);
end;

procedure TfrmChave.FormCreate(Sender: TObject);
begin
{    try
      with DM.CONEXAO do
        begin
          Close;
          Params.Clear;
          if FileExists('E:\DXE7\SistemaOdon\Banco\caminho_bd.ini') then
          begin
            Params.LoadFromFile('E:\DXE7\SistemaOdon\Banco\caminho_bd.ini');
             Open;
          end
          else
          begin
            Application.MessageBox('Caminho da base de dados não corresponde.','Atenção', MB_OK + MB_ICONWARNING);
            Application.Terminate;
          end;

        end;
    except
      Application.MessageBox('Erro ao tentar conectar-se ao banco.','Atenção', MB_OK + MB_ICONWARNING);
      Application.Terminate;
    end;}
end;

function TfrmChave.NewTransactionID: LongWord;
var
  lGUID: TGUID;
begin
  //CreateGUID(lGUID);
  //Result := lGUID.D1;
end;

procedure TfrmChave.sbtFecharClick(Sender: TObject);
begin
    if lblOk.Visible then
      Close
    else Application.Terminate;
end;

function Crypt(Action, Src: String): String;
Label Fim;
var KeyLen : Integer;
	KeyPos : Integer;
	OffSet : Integer;
	Dest, Key : String;
	SrcPos : Integer;
	SrcAsc : Integer;
	TmpSrcAsc : Integer;
	Range : Integer;
begin
	if (Src = '') Then
	begin
		Result:= '';
		Goto Fim;
	end;
	Key := 'YUQL23KL23DF90WI5E1JAS467NMCXXL6JAOAUWWMCL0AOMM4A4VZYW9KHJUI2347EJHJKDF3424SKL K3LAKDJSL9RTIKJ';
	Dest := '';
	KeyLen := Length(Key);
  KeyPos := 0;
	SrcPos := 0;
	SrcAsc := 0;
	Range := 256;
	if (Action = UpperCase('C')) then
	begin
		Randomize;
		OffSet := Random(Range);
		Dest := Format('%1.2x',[OffSet]);
		for SrcPos := 1 to Length(Src) do
		begin
			Application.ProcessMessages;
			SrcAsc := (Ord(Src[SrcPos]) + OffSet) Mod 255;
			if KeyPos < KeyLen then
        KeyPos := KeyPos + 1
      else KeyPos := 1;

			SrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
			Dest := Dest + Format('%1.2x',[SrcAsc]);
			OffSet := SrcAsc;
		end;
	end
  Else if (Action = UpperCase('D')) then
	begin
		OffSet := StrToInt('$'+ copy(Src,1,2));
		SrcPos := 3;
		repeat
			SrcAsc := StrToInt('$'+ copy(Src,SrcPos,2));
			if (KeyPos < KeyLen) Then
        KeyPos := KeyPos + 1
      else KeyPos := 1;
			TmpSrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
			if TmpSrcAsc <= OffSet then
        TmpSrcAsc := 255 + TmpSrcAsc - OffSet
			else TmpSrcAsc := TmpSrcAsc - OffSet;
			Dest := Dest + Chr(TmpSrcAsc);
			OffSet := SrcAsc;
			SrcPos := SrcPos + 2;
		until (SrcPos >= Length(Src));
	end;
	Result:= Dest;
Fim:
end;

procedure TfrmChave.btnAtivarClick(Sender: TObject);
begin
    try
      DM.TRANSACAO.TransactionID  := DM.NewTransactionID;
      DM.TRANSACAO.IsolationLevel := xilREADCOMMITTED;

      DM.sdsGerenciador.Close;
      DM.sdsGerenciador.DataSet.CommandText := ' select * from GER00 ';

      DM.CONEXAO.StartTransaction(DM.TRANSACAO);
      DM.sdsGerenciador.Open;
      DM.CONEXAO.Commit(DM.TRANSACAO);
    except
      on Exc:Exception do
        begin
          DM.CONEXAO.Rollback(TRANSACAO);
          Application.MessageBox('Atenção!', pchar('Ocorreu um erro no gravação ao banco de dados: ' + Exc.Message), MB_OK + MB_ICONWARNING);
          Exit;
        end;
    end;

    //if Crypt('D', sdsConsultaCHAVE.AsString) = Trim(edtChave.Text) then
    //begin
      try
        DM.TRANSACAO.TransactionID  := DM.NewTransactionID;
        DM.TRANSACAO.IsolationLevel := xilREADCOMMITTED;
        DM.sqlAux.CommandText := ' update GER00 set '+
                                 ' DT_IMPLANTACAO = :pDT_IMPLANTACAO, '+
                                 ' DT_RENOVACAO = :pDT_RENOVACAO, '+
                                 ' SISTEMA_ATIVO = :pSISTEMA_ATIVO, '+
                                 ' CHAVE = :pCHAVE, '+
                                 ' PERIODO_ATIVO = :pPERIODO_ATIVO ';

        if DateToStr(DM.sdsGerenciadorDT_IMPLANTACAO.AsDateTime) = '30/12/1899' then
          DM.sqlAux.ParamByName('pDT_IMPLANTACAO').AsDate := Date
        else
          DM.sqlAux.ParamByName('pDT_IMPLANTACAO').AsDate := DM.sdsGerenciadorDT_IMPLANTACAO.AsDateTime;

        if DateToStr(DM.sdsGerenciadorDT_RENOVACAO.AsDateTime) = '30/12/1899' then
          DM.sqlAux.ParamByName('pDT_RENOVACAO').AsDate := Date
        else
          DM.sqlAux.ParamByName('pDT_RENOVACAO').AsDate := StrToDate(Copy(Crypt('D', edtChave.Text), 1, 10));

        DM.sqlAux.ParamByName('pSISTEMA_ATIVO').AsString  := 'S';
        DM.sqlAux.ParamByName('pCHAVE').AsString          := Trim(edtChave.Text);
        DM.sqlAux.ParamByName('pPERIODO_ATIVO').AsString  := Copy(Crypt('D', edtChave.Text), 12, 4);

        DM.CONEXAO.StartTransaction(DM.TRANSACAO);
        DM.sqlAux.ExecSQL;
        DM.CONEXAO.Commit(DM.TRANSACAO);

        if Copy(Crypt('D', edtChave.Text), 12, 4) = '0' then
        begin
          lblNo.Visible := True;
          lblOk.Visible := False;
        end
        else
        begin
          lblOk.Visible := True;
          lblNo.Visible := False;
        end;
      except
        on Exc:Exception do
          begin
            lblNo.Visible := True;
            lblOk.Visible := False;

            DM.CONEXAO.Rollback(TRANSACAO);
            Application.MessageBox('Chave de ativação inválida!', 'Atenção!', MB_OK + MB_ICONWARNING);
            Exit;
          end;
      end;
    {end
    else
    begin
        Application.MessageBox('Atenção!', 'Chave de ativação inválida!', MB_OK + MB_ICONWARNING);
            Exit;
    end;              }
end;

end.
