////////////////////////////////////////////////////////////////////////////////
// Fichier: UAlbum.pas
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

Unit untAlbuns;

INTERFACE

Type
    ////////////////////////////////////////
    // Classe Album
    TAlbum = Class
        aid: String;
        name: String;
        constructor create(aid: String);
    end;

IMPLEMENTATION

////////////////////////////////////////
// Constructeur
Constructor TAlbum.create(aid: String);
begin
    inherited create;
    self.aid := aid;
end;

end.
