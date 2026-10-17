unit untConUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Menus, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids;

type
  TfrmConsultaUsuario = class(TForm)
    stbBarra: TStatusBar;
    MainMenu1: TMainMenu;
    FecharEsc1: TMenuItem;
    Panel1: TPanel;
    gbxPesquisar: TGroupBox;
    Label1: TLabel;
    edtNome: TEdit;
    sbtExcluir: TSpeedButton;
    sbtCancelar: TSpeedButton;
    sbtAlterar: TSpeedButton;
    dbgUsuario: TDBGrid;
    sbtPesquisar: TSpeedButton;
    procedure FecharEsc1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure sbtPesquisarMouseLeave(Sender: TObject);
    procedure sbtPesquisarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbtExcluirMouseLeave(Sender: TObject);
    procedure sbtExcluirMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbtCancelarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbtCancelarMouseLeave(Sender: TObject);
    procedure sbtAlterarMouseLeave(Sender: TObject);
    procedure sbtAlterarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbtPesquisarClick(Sender: TObject);
    procedure sbtAlterarClick(Sender: TObject);
    procedure sbtExcluirClick(Sender: TObject);
    procedure sbtCancelarClick(Sender: TObject);
    procedure dbgUsuarioTitleClick(Column: TColumn);
    procedure edtNomeKeyPress(Sender: TObject; var Key: Char);
    procedure dbgUsuarioKeyPress(Sender: TObject; var Key: Char);
    procedure dbgUsuarioDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaUsuario: TfrmConsultaUsuario;

implementation

{$R *.dfm}

uses untDM, untRotinas, untCadUsuario;

procedure TfrmConsultaUsuario.dbgUsuarioDblClick(Sender: TObject);
begin
    sbtAlterar.Click;
end;

procedure TfrmConsultaUsuario.dbgUsuarioKeyPress(Sender: TObject;
  var Key: Char);
begin
    if key = #13 then
      sbtAlterar.Click;
end;

procedure TfrmConsultaUsuario.dbgUsuarioTitleClick(Column: TColumn);
begin
    DM.sdsProduto.IndexFieldNames := Column.FieldName;
end;

procedure TfrmConsultaUsuario.edtNomeKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #13 then
      sbtPesquisar.Click;
end;

procedure TfrmConsultaUsuario.FecharEsc1Click(Sender: TObject);
begin
    Close;
end;

procedure TfrmConsultaUsuario.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #27 then
      Close;
end;

procedure TfrmConsultaUsuario.FormShow(Sender: TObject);
begin
    edtNome.Clear;
    DM.sdsLogin.Close;
end;

procedure TfrmConsultaUsuario.sbtAlterarClick(Sender: TObject);
begin
    gAlterar := True;
    Close;
end;

procedure TfrmConsultaUsuario.sbtAlterarMouseLeave(Sender: TObject);
begin
    sbtAlterar.Caption := '';
end;

procedure TfrmConsultaUsuario.sbtAlterarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    sbtAlterar.Caption := 'Alterar';
end;

procedure TfrmConsultaUsuario.sbtCancelarClick(Sender: TObject);
begin
    edtNome.Clear;
    DM.sdsLogin.Close;
end;

procedure TfrmConsultaUsuario.sbtCancelarMouseLeave(Sender: TObject);
begin
    sbtCancelar.Caption := '';
end;

procedure TfrmConsultaUsuario.sbtCancelarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    sbtCancelar.Caption := 'Cancelar';
end;

procedure TfrmConsultaUsuario.sbtExcluirClick(Sender: TObject);
begin
    frmCadUsuario.InsertUpdateDelete(2);
    sbtPesquisar.Click;
end;

procedure TfrmConsultaUsuario.sbtExcluirMouseLeave(Sender: TObject);
begin
    sbtExcluir.Caption := '';
end;

procedure TfrmConsultaUsuario.sbtExcluirMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    sbtExcluir.Caption := 'Excluir';
end;

procedure TfrmConsultaUsuario.sbtPesquisarClick(Sender: TObject);
var vSQL : string;
begin
    vSQL := ' select indice, nome, login, '+
            ' case '+
            '   when permissao = 1 then '+QuotedStr('Usuário')+
            '   else '+QuotedStr('Administrativo')+
            ' end as Permissao from USU00 '+
            ' where not nome is null and permissao <> 3';

    if Trim(edtNome.Text) <> '' then
      vSQL := vSQL + ' and NOME like '+QuotedStr('%'+edtNome.Text+'%');


    vSQL := vSQL + ' order by NOME';

    with DM.sdsLogin do begin
      Close;
      DataSet.CommandText := vSQL;
      Open;
    end; // fim with DM

    stbBarra.Panels[0].Text := 'Encontrado(s) ' +IntToStr(DM.sdsLogin.RecordCount)+' registro(s)' ;

    if DM.sdsLogin.RecordCount > 0 then begin
      sbtAlterar.Enabled := True;
      sbtExcluir.Enabled := True;
    end
    else begin
      sbtAlterar.Enabled := False;
      sbtExcluir.Enabled := False;
    end;
end;

procedure TfrmConsultaUsuario.sbtPesquisarMouseLeave(Sender: TObject);
begin
    sbtPesquisar.Caption := '';
end;

procedure TfrmConsultaUsuario.sbtPesquisarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    sbtPesquisar.Caption := 'Pesquisar';
end;

end.
