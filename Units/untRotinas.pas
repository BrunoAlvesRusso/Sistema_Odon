unit untRotinas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.RibbonLunaStyleActnCtrls,
  Vcl.Ribbon, Vcl.ImgList, Vcl.ComCtrls, Vcl.Buttons, Vcl.ToolWin, Vcl.ActnMan,
  Vcl.ActnCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, Data.SQLExpr, Data.Db, SimpleDS,
  IdBaseComponent, IdComponent, // Units Genéricas do Indy
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, // Objeto SSL
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP, // Objeto SMTP
  IdMessage, IdText, // Objeto de Mensagem
  IdAttachmentFile, // Objeto de Arquivos Anexos}
  Jpeg, ClipBrd, Winapi.TlHelp32;

  procedure CriaForm(pClassForm: TComponentClass; pform: TForm; pAlterar: Boolean);
  procedure Afirmacao(pTitulo, pMensagem: string);
  procedure Informacao(pTitulo, pMensagem: string);
  function Confirmacao(pTitulo, pMensagem: string): Boolean;
  function ValidaPeriodo(pDtIni, pDtFim: string): Boolean;
  procedure ApenasNumeros(var Key: Char);
  function InverteData(Data:String):string;
  function LoginSenha(Login, Senha: string):Boolean;
  function Permissao(Login, Senha: string):Boolean;
  function EnviarEmail(aHost : String; aPort : Integer; aLogin, aSenha,aListaEmail, aAssunto, aCorpo, aAnexo  : string; aAuth, aAuthSSL : Boolean) : Boolean;
  procedure RedimensionarImagem(Imagem: TGraphic; Largura, Alto: Integer);
  function JpgToBmp(Arquivo: string): string;
  function JpgToBmp2(Arquivo: string): string;
  function AsciiToInt(Caracter: Char): Integer;
  Function Criptografa(texto:string;chave:integer):String;
  Function DesCriptografa(texto:string;chave:integer):String;
  procedure QualityResizeBitmap(bmpOrig, bmpDest: TBitmap; newWidth, newHeight: Integer);
  function AjustarImagem(ImgW, ImgH, nW, nH: Integer): TRect;
  function GetVersion:String;
  function ProcessoExiste(exeFileName: string): Boolean;

  var pSDS: TSimpleDataSet;
      gAlterar, gAgenda, gEncaixe : Boolean;
      pNumeroAgenda: Integer;
      pNomeAgenda, gLogin, gSenha, gUsuario, gFoto : string;

implementation

{ Rotinas }

uses untDM, untCadCliente;

// Cria e abre formulários
procedure CriaForm(pClassForm: TComponentClass; pform: TForm; pAlterar: Boolean);
begin
  Application.CreateForm(pClassForm, pform);
  try
    if pAlterar then
      gAlterar := true;
    Tform(pform).ShowModal;
  finally
    FreeAndNil(Tform(pform));
  end;
end;



// Afirmação
procedure Afirmacao(pTitulo, pMensagem: string);
begin
    Application.MessageBox(pchar(pMensagem), pchar(pTitulo), MB_OK + MB_ICONINFORMATION);
end;



// Informação
procedure Informacao(pTitulo, pMensagem: string);
begin
    Application.MessageBox(pchar(pMensagem), pchar(pTitulo), MB_OK + MB_ICONWARNING);
end;



// Confirmação
function Confirmacao(pTitulo, pMensagem: string): Boolean;
begin
    Result := Application.MessageBox(pchar(pMensagem), pchar(pTitulo), MB_YESNO + MB_ICONQUESTION +MB_DEFBUTTON2) = ID_YES;
end;



// Valida periodo
function ValidaPeriodo(pDtIni, pDtFim: string): Boolean;
begin
    try
      StrToDate(pDtIni);
    except
      begin
        Informacao('Atenção', 'Erro na conversão da data inicial.');
        Result := False;
        Exit;
      end;
    end;

    try
      StrToDate(pDtFim);
    except
      begin
        Informacao('Atenção', 'Erro na conversão da data final.');
        Result := False;
        Exit;
      end;
    end;

    if StrToDate(pDtIni) > StrToDate(pDtFim)  then begin
      Informacao('Atenção', 'Data inicial superior a data final.');
      Result := False;
      Exit;
    end;

    Result := True;
end;



// Coloca apenas números
procedure ApenasNumeros(var Key: Char);
begin
    if not (key in ['0'..'9', #8, #13]) then
      key := #0;
end;



// Inverter Data
function InverteData(Data:String):string;
begin
  result := FormatDateTime('yyyy',strtoDate(Data))+'.'+
            FormatDateTime('mm',strtodate(Data))+'.'+
            FormatDateTime('dd',strtodate(Data));
end;



// Função para Envio de e-mail
function EnviarEmail(aHost : String; aPort : Integer; aLogin, aSenha, aListaEmail, aAssunto, aCorpo, aAnexo  : string; aAuth, aAuthSSL : Boolean) : Boolean;
var
    AuthSSL   : TIdSSLIOHandlerSocketOpenSSL;
    IdSMTP    : TIdSMTP;
    IdMessage : TIdMessage;
    IdText    : TIdText;
    i, j      : Integer;
    Lista     : TStringList;
    html      : TStrings;
begin
  Result    := False;
  IdSMTP    := TIdSMTP.Create(nil);
  IdMessage := TIdMessage.Create(nil);

  try
    IdSMTP.Host     := aHost;
    IdSMTP.Port     := aPort;
    IdSMTP.AuthType := satDefault;
    IdSMTP.Username := aLogin;
    IdSMTP.Password := aSenha;

    if aAuthSSL then begin
      AuthSSL                   := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
      IdSMTP.IOHandler          := AuthSSL;
      IdSMTP.UseTLS             := utUseImplicitTLS;
      AuthSSL.SSLOptions.Method := sslvSSLv3;
      AuthSSL.SSLOptions.Mode   := sslmClient;
    end;

    if aAuth then
      IdSMTP.AuthType := satDefault
    else
      IdSMTP.AuthType := satNone;

    try
    	IdSMTP.Connect;

    	IdMessage.From.Address               := aLogin;
    	IdMessage.Recipients.EMailAddresses  := aListaEmail;
    	IdMessage.Subject                    := aAssunto;
      IdMessage.ContentType := 'multipart/mixed';

      html := TStringList.Create();
      with html do begin
        Add('<html>');
        Add('<head>');
        Add('</head>');
        Add('<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />');
        Add('<body>');
        Add('Data/Hora: ' + FormatDateTime('dd/MM/yyyy HH:mm:ss', Now));
        Add('<br><br>' + aCorpo);
        Add('<br><br></body>');
        Add('</html>');
      end;

      IdText := TIdText.Create(IdMessage.MessageParts, html);
      IdText.ContentType := 'text/html';

      if Trim(aAnexo) <> '' then begin
        Lista := TStringList.Create;
        j := ExtractStrings([','],[' '],PChar(aAnexo),Lista);
        for i := 0 to j - 1 do
          TIdAttachmentFile.Create(IdText.MessageParts, Lista[i]);

        IdSMTP.Send(IdMessage);
      end
      else IdSMTP.Send(IdMessage);

      Result:= True;

      Informacao('Enviado', 'E-mail(s) enviado(s) com sucesso.');
    except
      begin
        Result := False;
        Informacao('Enviado', 'Ocorreu um erro no envio. Verifique se todos os e-mails estão corretos.');
      end;
    end;

  finally
    IdSMTP.Disconnect;
    FreeAndNil(IdSMTP);
    FreeAndNil(IdMessage);
    html.Free();
    if AuthSSL <> nil then
    FreeAndNil(AuthSSL);
  end;


{  //Uses
   IdBaseComponent, IdComponent, // Units Genéricas do Indy
   IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, // Objeto SSL
   IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP, // Objeto SMTP
   IdMessage, , IdText // Objeto de Mensagem
   IdAttachmentFile // Objeto de Arquivos Anexos}


{ //Chamando a Função EnviarEmail

  EnviarEmail('smtp.mgnettecnologia.com.br',   // host
               25,                             // porta (25 é padrão)
               Login,                          // e-mail do remetente
               Senha,                          // senha do remetente
               Destinatario,                   // e-mail(s) do(s) destinatario(s) (se superior a 1 usar ";", sem as aspas, entre eles)
               Assunto,                        // assunto
               Mensagem,                       // mensagem
               Anxo,                           // anexo(s)
               True,                           // padrão
               True                            // padrão
               );}
end;



//Função para criptografar e descriptografar uma string
//funcao que retorno o código ASCII dos caracteres
function AsciiToInt(Caracter: Char): Integer;
var
  i: Integer;
begin
  i := 32;
  while i < 255 do begin
    if Chr(i) = Caracter then
      Break;
    i := i + 1;
  end;
  Result := i;
end;



{ Esta funcao tem como objetivo criptografar uma string utilizando o código ASCII de cada caracter e
somando a esse código o valor da CHAVE}
Function Criptografa(texto:string;chave:integer):String;
var
  cont:integer;
  retorno:string;
begin
  if (trim(texto)=EmptyStr) or (chave=0) then begin
    result:=texto;
  end else begin
    retorno:='';
    for cont:=1 to length(texto) do begin
      retorno:=retorno+chr(asciitoint(texto[cont])+chave);
    end;
    result:=retorno;
  end;
end;



{Esta funcao é semelhante a funcao de Criptografia mais com o objetivo de descriptografar a string }
Function DesCriptografa(texto:string;chave:integer):String;
var
  cont:integer;
  retorno:string;
begin
  if (trim(texto)=EmptyStr) or (chave=0) then begin
    result:=texto;
  end else begin
    retorno:='';
    for cont:=1 to length(texto) do begin
      retorno:=retorno+chr(asciitoint(texto[cont])-chave);
    end;
    result:=retorno;
  end;
end;



// Permissão
function Permissao(Login, Senha: string):Boolean;
var sdsTemp : TSimpleDataSet;
begin
    sdsTemp := TSimpleDataSet.Create(nil);
    sdsTemp.Connection := DM.CONEXAO;

    with sdsTemp do begin
      Close;
      DataSet.CommandText := ' select * from USU00 '+
                             ' where LOGIN = '+ QuotedStr(Login)+
                             ' and SENHA = '+ QuotedStr(Senha);
      Open;
    end;

    if sdsTemp.FieldByName('PERMISSAO').AsInteger <> 1 then
      Result := True
    else
      Result := False;
end;



// Login e Senha
function LoginSenha(Login, Senha: string):Boolean;
var sdsTemp : TSimpleDataSet;
begin
    sdsTemp := TSimpleDataSet.Create(nil);
    sdsTemp.Connection := DM.CONEXAO;

    with sdsTemp do begin
      Close;
      DataSet.CommandText := ' select * from USU00 '+
                             ' where LOGIN = '+ QuotedStr(Login)+
                             ' and SENHA = '+ QuotedStr(Senha);
      Open;
    end;

    if sdsTemp.RecordCount = 0 then begin
      Informacao('Atenção','Login ou senha incorreto.');
      Result := False;
    end
    else begin
      gUsuario := sdsTemp.FieldByName('NOME').AsString;
      Result := True;
    end;
end;



// Redimensiona imagens
procedure RedimensionarImagem(Imagem: TGraphic; Largura, Alto: Integer);
var
  Bitmap: TBitmap;
  Rect:TRect;
begin
  Bitmap:= TBitmap.Create;
  try
    Bitmap.Width:= Largura;
    Bitmap.Height:= Alto;

    if  (Largura/Imagem.Width) <> (Alto/Imagem.Height) then  begin
      Alto:= Trunc((Largura*Imagem.Height)/Imagem.Width);
    end
    else begin
      Largura:= Trunc((Imagem.Width*Alto)/Imagem.Height);
    end;

    // Nova posição
    Rect.Left := ((Bitmap.Width - Largura) div 2);
    Rect.Top := ((Bitmap.Height - Alto) div 2);
    Rect.Right:= Rect.Left + Largura;
    Rect.Bottom := Rect.Top + Alto;

    // Cor de fundo da imagem
    Bitmap.Canvas.Brush.Color := clWhite;
    // copiar
    Bitmap.Canvas.FillRect(Bitmap.Canvas.ClipRect);
    Bitmap.Canvas.StretchDraw(Rect,Imagem);
    Imagem.Assign(Bitmap);
  finally
    Bitmap.Free;
  end;
end;

// Ajusta resolução de modo que caiba dentro da resolução desejada
function AjustarImagem(ImgW, ImgH, nW, nH: Integer): TRect;
var
   xySpct: Double;
begin
   if ((ImgW > 0) and (ImgH > 0)) and ((ImgW > nW) or (ImgH > nH)) then
    begin
       xySpct := ImgW / ImgH;
       if ImgW > ImgH then
        begin
           ImgW := nW;
           ImgH := Trunc(nW / xySpct);
           if ImgH > nH then
            begin
               ImgH := nH;
               ImgW := Trunc(nH * xySpct);
            end;
        end
       else
        begin
           ImgH := nH;
           ImgW := Trunc(nH * xySpct);
           if ImgW > nW then
            begin
               ImgW := nW;
               ImgH := Trunc(nW / xySpct);
            end;
        end;
    end;
   with Result do
    begin
       Left := 0;
       Top := 0;
       Right := ImgW;
       Bottom := ImgH;
   end;
end;


// Converte JPG em BMP
function JpgToBmp(Arquivo: string): string;
var
   fRect: TRect;
   ObjBmp: TBitmap;
   ObjJpg: TJPEGImage;
   cArq : String;
   F1   : TMemoryStream;
   arq : string;
begin
    cArq := '';
    try
      F1  := TMemoryStream.Create();
      ObjJpg := TJPegImage.Create();
      ObjJpg.LoadFromFile(Arquivo);
      ObjBmp := TBitmap.Create;  // cria bitmap para trabalhar com a imagem
              // AjustarImagem: ajusta resolução de modo que caiba dentro da resolução desejada
      fRect := AjustarImagem(ObjJpg.Width, ObjJpg.Height, 120, 130);
      ObjJpg.Scale := jsFullSize;                // qualidade maxima.
      ObjBmp.Width := fRect.Right;
      ObjBmp.Height := fRect.Bottom;
      ObjBmp.Canvas.FillRect(fRect);             // seta nova resolução
      ObjBmp.Canvas.StretchDraw(fRect, ObjJpg);  // ajusta imagem a nova resolução
      cArq := ChangeFileExt(Arquivo, '_'+FormatDateTime('hhmmss', GetTime)+'.bmp');
      ObjJpg.Assign(ObjBmp);                     // carrega bitmap no jpg
      ObjBmp.SaveToFile(cArq);
      F1.LoadFromFile(cArq);
      DM.sdsCliente.LoadFromStream(F1);
    finally
      //DeleteFile(pChar(cArq));
      ObjBmp.Free;
      F1.Free;
      ObjJpg.Free;
    end;

    Result := cArq;
end;



function JpgToBmp2(Arquivo: string): string;
var Bmp  : TBitmap;
    JPeg : TJPegImage;
    cArq : String;
    F1   : TMemoryStream;
begin
  cArq := '';
  JPeg := TJPegImage.Create();
  JPeg.CompressionQuality := 50;
  JPeg.Compress;
  try
    F1  := TMemoryStream.Create();
    Bmp := TBitmap.Create;
    Jpeg.LoadFromFile(Arquivo);
    try
      Bmp.Assign(JPeg);
      Bmp.SaveToFile(ChangeFileExt(Arquivo, '.Bmp'));
      cArq := ChangeFileExt(Arquivo, '.Bmp');
      F1.LoadFromFile(cArq);
      DM.sdsCliente.LoadFromStream(F1);
    finally
      //DeleteFile(pChar(cArq));
      Bmp.Free;
      F1.Free;
    end;
  finally
    JPeg.Free;
  end;
  Result := cArq;
end;



// reduzir tamanho de imagem
procedure QualityResizeBitmap(bmpOrig, bmpDest: TBitmap; newWidth, newHeight: Integer);
var
   xIni, xFin, yIni, yFin, xSalt, ySalt: Double;
   X, Y, pX, pY, tpX: Integer;
   R, G, B: Integer;
   pxColor: TColor;
begin
   bmpDest.Width  := newWidth;
   bmpDest.Height := newHeight;

   xSalt := bmpOrig.Width / newWidth;
   ySalt := bmpOrig.Height / newHeight;

   yFin := 0;
   for Y := 0 to pred(newHeight) do
   begin
      yIni := yFin;
      yFin := yIni + ySalt;
      if yFin >= bmpOrig.Height then
         yFin := pred(bmpOrig.Height);

      xFin := 0;
      for X := 0 to pred(newWidth) do
      begin
         xIni := xFin;
         xFin := xIni + xSalt;
         if xFin >= bmpOrig.Width then
            xFin := pred(bmpOrig.Width);

         R := 0;
         G := 0;
         B := 0;
         tpX := 0;

         for pY := Round(yIni) to Round(yFin) do
            for pX := Round(xIni) to Round(xFin) do
            begin
               Inc(tpX);
               pxColor := ColorToRGB(bmpOrig.Canvas.Pixels[pX, pY]);
               R := R + GetRValue(pxColor);
               G := G + GetGValue(pxColor);
               B := B + GetBValue(pxColor);
            end;

         bmpDest.Canvas.Pixels[X,Y] := RGB(Round(R/tpX),Round(G/tpX),Round(B/tpX));
      end;
   end;
end;



function GetVersion:String;
var VerInfoSise: DWORD;
    VerInfo: Pointer;
    VerValueSize: DWORD;
    VerValue: PVSFixedFileInfo;
    Dummy: DWORD;
begin
    VerInfoSise := GetFileVersionInfoSize(pchar(ParamStr(0)), Dummy);
    GetMem(VerInfo, VerInfoSise);
    GetFileVersionInfo(pchar(ParamStr(0)), 0, VerInfoSise, VerInfo);
    VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);

    with VerValue ^ do begin
      Result := 'Versão: ';
      Result := Result + IntToStr(dwFileVersionMS shr 16);
      Result := Result + '.' + IntToStr(dwFileVersionMS and $FFFF);
      Result := Result + '.' + IntToStr(dwFileVersionLS shr 16);
      Result := Result + '.' + IntToStr(dwFileVersionLS and $FFFF);
    end;
    FreeMem(VerInfo, VerInfoSise);
end;



function ProcessoExiste(exeFileName: string): Boolean;
const PROCESS_TERMINATE=$0001;

var ContinueLoop: BOOL;
    FSnapshotHandle: THandle;
    FProcessEntry32: TProcessEntry32;
begin
    FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
    FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
    ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);
    Result := False;
    while Integer(ContinueLoop) <> 0 do begin
      if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) = UpperCase(exeFileName)) or
         (UpperCase(FProcessEntry32.szExeFile) = UpperCase(exeFileName))) then begin
        Result := True;
      end;
      ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
    end;
    CloseHandle(FSnapshotHandle);
end;

end.
