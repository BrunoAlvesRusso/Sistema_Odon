////////////////////////////////////////////////////////////////////////////////
// Fichier: UFaceBook.pas
// SiteWeb: https://forums.embarcadero.com/message.jspa?messageID=219789
////////////////////////////////////////////////////////////////////////////////

{
    Ce Code n'est pas de moi, je l'ai trouver dans un forum d'embarcadero
    à l'adresse : https://forums.embarcadero.com/message.jspa?messageID=219789

    Je commence à programmer un composant OpenSource pour ce connecter sur
    FaceBook. Tout le monde qui est intéressé, Venez sur mon site à l'adresse
    http://gcsoft.herobo.com/

    PS: Cette source Utilise NativeXml et Graphics32
}

Unit untFaceBook;

INTERFACE

Uses
    Classes, IdHash, IdHashMessageDigest, iwNativeXml, SysUtils,
    IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

const
    RESTURL = 'http://api.new.facebook.com/restserver.php';

Type
    ////////////////////////////////////////
    // Classe FaceBook
    TFaceBook = Class
    private
        IdHTTP1: TIdHTTP;
        FAPikey:String;
        FSecretkey:String;

        FToken:String;
        Fsessionkey:String;
        Fuserid:String;

        function md5( Plaintext: string): string;
        function Signa(L:TStringlist;SECRET_KEY:String):String;
        function GetvalueFromXml(response:String;key:String):String;
        function _FindFirstTag(xmlDoc:TNativeXML;elem:TXmlNode;const key: String): TXmlNode;

    public
        function Login(api_key,secret_key:String):String;
        procedure GetSession();
        procedure GetAlbums(LAlbums:TList);
        procedure GetFotos(albumid:String;Lfotos:TList);
        function GetFriends():String;

        constructor create;
        destructor destroy;override;
        property Token:String read FToken;
        property userid:String read Fuserid;
        property sessionkey:String read Fsessionkey;
    end;

IMPLEMENTATION

uses untAlbuns, untFoto;

////////////////////////////////////////
// Procedure Get Fotos From XML
Procedure GetFotosFromXML(response:String;L:TList);
var
    xmlDoc:TNativeXml;
    elem,elem2:TXmlNode;
    L2:TList;
    foto:TFoto_FB;
    i:Integer;
begin
    xmlDoc := TNativeXML.Create;
    xmldoc.ReadFromString(response);
    try
        elem:=xmldoc.root;
        L2:=TList.create;
        elem.FindNodes('photo',L2);
        for i := 0 to L2.Count - 1 do begin
            elem2:=L2[i];
            //foto:=TFoto_FB.create(elem2.NodeByName('pid').ValueAsWidestring);
            foto:=TFoto_FB.create(elem2.NodeByName('pid').ValueAsString);
            foto.src_small:=elem2.NodeByName('src_small').ValueAsString;
            foto.src_big:=elem2.NodeByName('src_big').ValueAsString;
            L.Add(foto);
        end;
    finally
        xmldoc.free;
    end;
end;

////////////////////////////////////////
// Procedure Get Albums From XML
procedure GetAlbumsFromXML(response:String;L:TList);
var
    xmlDoc:TNativeXml;
    elem,elem2:TXmlNode;
    L2:TList;
    album:TAlbum;
    i:Integer;
begin
    xmlDoc := TNativeXML.Create;
    xmldoc.ReadFromString(response);
    try
        elem:=xmldoc.root;
        L2:=TList.create;
        elem.FindNodes('album',L2);
        for i := 0 to L2.Count - 1 do begin
            elem2:=L2[i];
            album:=TAlbum.create(elem2.NodeByName('aid').ValueAsString);
            album.name:=elem2.NodeByName('name').ValueAsString;
            L.Add(album);
        end;
    finally
        xmldoc.free;
    end;
end;

////////////////////////////////////////
// Destructeur
destructor TFaceBook.destroy;
begin
    idhttp1.Free;
    inherited;
end;

////////////////////////////////////////
// Constructeur
constructor TFaceBook.create;
begin
    inherited;
    FToken:='';
    Fsessionkey:='';
    Fuserid:='';
    IdHTTP1:=TIdHTTP.Create(nil);
end;

////////////////////////////////////////
// Fonction Find First Tag
function TFaceBook._FindFirstTag(xmlDoc:TNativeXML;elem:TXmlNode;const key: String): TXmlNode;
var b:Boolean ;
begin
    if (elem.Name=key) then begin
        result:=elem;
        exit;
    end;

    if (elem.NodeCount>0) then Result:=elem.Nodes[0]
    else Result:=nil;

    b := false;
    while (not b) and (result<>nil) do begin
        b := UpperCase(result.name) = UpperCase(key);
        if not b then begin
            if (result.IndexInParent<result.Parent.NodeCount-1) then
                Result:=result.Parent.Nodes[result.IndexInParent+1]
            else Result := nil;
        end;
    end;

    if not b then result := nil;
end;

////////////////////////////////////////
// Fonction Get Value from XML
function TFaceBook.GetvalueFromXml(response:String;key:String):String;
var
    xmlDoc:TNativeXml;
    elem,elem2:TXmlNode;
begin
    result:='';
    xmlDoc := TNativeXML.Create;
    xmldoc.ReadFromString(response);
    try
        elem:=xmldoc.root;
        if (elem<>nil) then begin
            elem2:=_FindFirstTag(xmldoc,elem,key);
            if (elem2<>nil) then result:=elem2.ValueAsString;
        end;
    finally
        xmldoc.free;
    end;
end;

////////////////////////////////////////
// Fonction MD5
function TFaceBook.md5( Plaintext: string): string;
var FHash : TIdHashMessageDigest5;
begin
    FHash := TIdHashMessageDigest5.Create;
    result := lowercase(FHash.HashStringAsHex(Plaintext));
    Fhash.free;
end;

////////////////////////////////////////
// Fonction Signa
function TfaceBook.Signa(L:TStringlist;SECRET_KEY:String):String;
var
    i:Integer;
    str:String;
begin
    //keysort
    result:='';
    str:='';
    for i := 0 to L.Count - 1 do begin
        str:=L[i];
        result:=result+str;
    end;

    result:=md5(result+secret_key);
end;

////////////////////////////////////////
// Fonction Login
function TFacebook.Login(api_key,secret_key:String):String;
    function Paramsrequest(L:TStringlist):String;
    var i:Integer;
    begin
        result:='';
        for i := 0 to L.Count - 1 do begin
            if (i>0) then result:=result+'&';
            result:=result+L[i];
        end;
    end;
var
    L:TStringlist;
    response:String;
    str:String;
begin
    self.FAPikey:=api_key;
    self.FSecretkey:=secret_key;

    L:=TStringlist.Create;
    try
        L.Add('api_key='+API_KEY);
        L.Add('method=auth.createToken');
        L.Add('v=1.0');
        L.Add('sig='+Signa(L,SECRET_KEY));
        response:=IdHTTP1.Post(RESTURL,L);
    finally
        L.Free;
    end;

    FToken:=GetvalueFromXml(response,'auth_createToken_response');

    L:=TStringlist.Create;
    L.Add('return_session=0');
    L.Add('api_key='+API_KEY);
    L.Add('auth_token='+FToken);
    result:='http://login.facebook.com/login.php?'+Paramsrequest(L);
    L.Free;
end;

////////////////////////////////////////
// Procedure Get Session
procedure TFaceBook.GetSession();
var
    L:TStringlist;
    L2:TStringList;
    str:String;
    response:String;
begin
    L:=TStringlist.Create;
    try
        L.Add('api_key='+FAPIKEY);
        L.Add('auth_token='+token);
        // L.Add('generate_session_secret=0');
        L.Add('method=auth.getSession');
        L.Add('v=1.0');
        L.Add('sig='+Signa(L,FSECRETKEY));
        response:=IdHTTP1.Post(RESTURL,L);
    finally
        L.Free;
    end;

    Fsessionkey:=GetvalueFromXml(response,'session_key');
    Fuserid:=GetvalueFromXml(response,'uid');
end;

////////////////////////////////////////
// Procedure Get Albums
procedure TFaceBook.GetAlbums(LAlbums:TList);
var
    L:TStringlist;
    L2:TStringList;
    str:String;
    response:String;
begin
    if (FSessionkey='') then GetSession();

    L:=TStringlist.Create;
    try
        L.Add('api_key='+FAPIKEY);
        L.Add('call_id=1');
        L.Add('method=Photos.getAlbums');
        L.Add('session_key='+sessionkey);
        L.Add('uid='+userid);
        L.Add('v=1.0');
        L.Add('sig='+Signa(L,FSECRETKEY));
        response:=IdHTTP1.Post(RESTURL,L);
    finally
        L.Free;
    end;

    GetAlbumsFromXML(response,LAlbums);
end;

////////////////////////////////////////
// Fonction Get Friends
function TFaceBook.GetFriends():String;
var
    L:TStringlist;
    L2:TStringList;
    str:String;
    response:String;
begin
    if (FSessionkey='') then GetSession();

    L:=TStringlist.Create;
    try
        L.Add('api_key='+FAPIKEY);
        L.Add('call_id=1');
        L.Add('method=Friends.get');
        L.Add('session_key='+sessionkey);
        L.Add('v=1.0');
        L.Add('sig='+Signa(L,FSECRETKEY));
        result:=IdHTTP1.Post(RESTURL,L);
    finally
        L.Free;
    end;
end;

////////////////////////////////////////
// procedure Get fotos
procedure TFaceBook.GetFotos(albumid:String;Lfotos:TList);
var
    L:TStringlist;
    str:String;
    response:String;
begin
    if (FSessionkey='') then GetSession();

    L:=TStringlist.Create;
    try
        L.Add('aid='+albumid);
        L.Add('api_key='+FAPIKEY);
        L.Add('call_id=1');
        L.Add('method=Photos.get');
        L.Add('session_key='+sessionkey);
        L.Add('v=1.0');
        L.Add('sig='+Signa(L,FSECRETKEY));
        response:=IdHTTP1.Post(RESTURL,L);
    finally
        L.Free;
    end;

    GetfotosFromXML(response,Lfotos);
end;

end.
