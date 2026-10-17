////////////////////////////////////////////////////////////////////////////////
// Fichier: UFoto.pas
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

Unit untFoto;

INTERFACE

Uses {gr32}graphics;

Type
    TFotoSize = (fs_small, fs_medium, fs_fullsize);

    ////////////////////////////////////////
    // Classe Foto FaceBook
    TFoto_FB = Class
        pid:String;
        src_small:String;
        src_big:String;

        localfilename:String;
        constructor create(pid:String);
        destructor Destroy;override;
        function Load(size:TFotoSize):TBitmap;
    end;

IMPLEMENTATION

Uses
    classes, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
    IdHTTP, {gdiload}GDIPAPI, GDIPOBJ;

////////////////////////////////////////
// Constructeur
Constructor TFoto_FB.create(pid:String);
Begin
    Inherited create;
    self.pid:=pid;
End;

////////////////////////////////////////
// Destructeur
destructor TFoto_FB.Destroy;
begin
    inherited;
end;

////////////////////////////////////////
// Function Load
function TFoto_FB.Load(size:TFotoSize):TBitmap;
var
    IdHTTP1: TIdHTTP;
    ms:TMemorystream;
begin
    IdHTTP1:=TIdHTTP.create;
    try
        ms:=TMemorystream.Create;
        try
            IdHTTP1.Get(self.src_small,ms);
            ms.Position:=0;
            result:=TBitmap.Create;
            //gdip_load.ReadImage(ms,result); //again, I use an external unit that uses gdi+
        finally
            ms.Free;
        end;
    finally
        IdHTTP1.Free;
    end;
end;

end.
