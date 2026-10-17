unit untEncaixe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Samples.Spin, Vcl.ComCtrls, Vcl.Buttons, SQLExpr, SimpleDS,
  Vcl.ExtCtrls, DateUtils;

type
  TfrmEncaixe = class(TForm)
    MainMenu1: TMainMenu;
    FecharEsc1: TMenuItem;
    gbxProfissionais: TGroupBox;
    dbgProfissionais: TDBGrid;
    gbxHorarios: TGroupBox;
    gbxIntervalo: TGroupBox;
    lblHora: TLabel;
    lblMinuto: TLabel;
    sedIntervalo: TSpinEdit;
    Label1: TLabel;
    dtpInicio: TDateTimePicker;
    dtpFim: TDateTimePicker;
    sbtCadastrar: TSpeedButton;
    sbtCancelar: TSpeedButton;
    rgpDiaSemana: TRadioGroup;
    stgHorario: TStringGrid;
    procedure FecharEsc1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure sbtCadastrarClick(Sender: TObject);
    procedure sbtCancelarMouseLeave(Sender: TObject);
    procedure sbtCancelarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbtCadastrarMouseLeave(Sender: TObject);
    procedure sbtCadastrarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure dbgProfissionaisCellClick(Column: TColumn);
    procedure rgpDiaSemanaClick(Sender: TObject);
    procedure sbtCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure InsertUpdateDelete(pTipo: Integer; pDiaSemana: string);
  end;

var
  frmEncaixe: TfrmEncaixe;

implementation

{$R *.dfm}

uses untDM, untRotinas;

procedure TfrmEncaixe.dbgProfissionaisCellClick(Column: TColumn);
var i, intervalo : Integer;
    hrIni, hrFim: TTime;
    dia_semana : string;
    sdsTemp : TSimpleDataSet;
begin
    case rgpDiaSemana.ItemIndex of
      0: // Domingo
         dia_semana := 'domingo';
      1: // Segunda-Feira
         dia_semana := 'segunda-feira';
      2: // Terça-Feira
         dia_semana := 'terça-feira';
      3: // Quartra-Feira
         dia_semana := 'quarta-feira';
      4: // Quinta-Feira
         dia_semana := 'quinta-feira';
      5: // Sexta-Feira
         dia_semana := 'sexta-feira';
      6: // Sábado-Feira
         dia_semana := 'sábado';
    end;

    sdsTemp := TSimpleDataSet.Create(nil);
    sdsTemp.Connection := DM.CONEXAO;
    with sdsTemp do begin
      Close;
      DataSet.CommandText := ' select * from enc00 a '+
                             ' where a.nu_colaborador = :pNU_COLABORADOR '+
                             ' and a.dia_semana = :pDIA_SEMANA ';
      DataSet.ParamByName('pNU_COLABORADOR').AsInteger := DM.sdsProfissionalINDICE.AsInteger;
      DataSet.ParamByName('pDIA_SEMANA').AsString      := dia_semana;
      Open;
    end;

    if sdsTemp.RecordCount > 0 then begin
      hrIni := sdsTemp.FieldByName('HR_INICIO').AsDateTime;
      hrFim := sdsTemp.FieldByName('HR_FIM').AsDateTime;
      intervalo := sdsTemp.FieldByName('INTERVALO').AsInteger;

      i := 0;
      while hrIni <= hrFim do begin
        stgHorario.RowCount := i + 1;
        Inc(i);
        stgHorario.Cells[0,i] := FormatDateTime('hh:mm', hrIni);
        hrIni := IncMinute(hrIni, intervalo);
      end;
    end
    else begin
      with stgHorario do begin
        for i := 0 to RowCount -1 do
          Rows[i].Clear;
        RowCount := 1;
      end;
    end;

end;

procedure TfrmEncaixe.FecharEsc1Click(Sender: TObject);
begin
    Close;
end;

procedure TfrmEncaixe.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #27 then
      Close;
end;

procedure TfrmEncaixe.FormShow(Sender: TObject);
begin
    DM.sdsProfissional.Close;
    DM.sdsProfissional.Open;
    dbgProfissionaisCellClick(nil);
end;

procedure TfrmEncaixe.InsertUpdateDelete(pTipo: Integer; pDiaSemana: string);
var vSQL, vMensagem  : string;
begin
    case pTipo of
      0: // inserir
        begin
          vSQL := 'insert into ENC00 '+
                  '(NU_COLABORADOR, HR_INICIO, HR_FIM, INTERVALO, DIA_SEMANA) '+
                  'VALUES '+
                  '(:pNU_COLABORADOR, :pHR_INICIO, :pHR_FIM, :pINTERVALO, :pDIA_SEMANA)';

          vMensagem := 'incluido';
        end;

      1: // alterar
        begin
          vSQL := ' update ENC00 set '+
                  ' NU_COLABORADOR = :pNU_COLABORADOR, '+
                  ' HR_INICIO      = :pHR_INICIO, '+
                  ' HR_FIM         = :pHR_FIM, '+
                  ' INTERVALO      = :pINTERVALO, '+
                  ' DIA_SEMANA     = :pDIA_SEMANA '+
                  ' where INDICE   = :pINDICE';

          vMensagem := 'alterado';
        end;

      2: //apagar
        begin
          if Confirmacao('Confirmação', 'Deseja, realmente, excluir este registro?') then begin

            vSQL := 'delete from ENC00 '+
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
              ParamByName('pINDICE').AsInteger := DM.sdsEncaixeINDICE.AsInteger;

          // se for inserir ou alterar passa os parametros
          if pTipo in [0,1] then begin

            ParamByName('pHR_INICIO').AsTime         := dtpInicio.Time;
            ParamByName('pHR_FIM').AsTime            := dtpFim.Time;
            ParamByName('pNU_COLABORADOR').AsInteger := DM.sdsProfissionalINDICE.AsInteger;
            ParamByName('pINTERVALO').AsInteger      := StrToInt(sedIntervalo.Text);
            ParamByName('pDIA_SEMANA').AsString      := pDiaSemana;

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

procedure TfrmEncaixe.rgpDiaSemanaClick(Sender: TObject);
begin
    dbgProfissionaisCellClick(nil);
end;

procedure TfrmEncaixe.sbtCadastrarClick(Sender: TObject);
var dia_semana: string;
    i : Integer;
begin
    case rgpDiaSemana.ItemIndex of
      0: // Domingo
         dia_semana := 'domingo';
      1: // Segunda-Feira
         dia_semana := 'segunda-feira';
      2: // Terça-Feira
         dia_semana := 'terça-feira';
      3: // Quartra-Feira
         dia_semana := 'quarta-feira';
      4: // Quinta-Feira
         dia_semana := 'quinta-feira';
      5: // Sexta-Feira
         dia_semana := 'sexta-feira';
      6: // Sábado-Feira
         dia_semana := 'sábado';
    end;

    with DM.sdsEncaixe do begin
      Close;
      DataSet.CommandText := ' select * from ENC00 '+
                             ' where NU_COLABORADOR = :pNU_COLABORADOR '+
                             ' and DIA_SEMANA = :pDIA_SEMANA ';
      DataSet.ParamByName('pNU_COLABORADOR').AsInteger := DM.sdsProfissionalINDICE.AsInteger;
      DataSet.ParamByName('pDIA_SEMANA').AsString      := dia_semana;
      Open;
    end;

    if DM.sdsEncaixe.RecordCount = 0 then
      i := 0
    else i := 1;

    case rgpDiaSemana.ItemIndex of
      0: // Domingo
         InsertUpdateDelete(i, 'domingo');
      1: // Segunda-Feira
         InsertUpdateDelete(i, 'segunda-feira');
      2: // Terça-Feira
         InsertUpdateDelete(i, 'terça-feira');
      3: // Quartra-Feira
         InsertUpdateDelete(i, 'quarta-feira');
      4: // Quinta-Feira
         InsertUpdateDelete(i, 'quinta-feira');
      5: // Sexta-Feira
         InsertUpdateDelete(i, 'sexta-feira');
      6: // Sábado-Feira
         InsertUpdateDelete(i, 'sábado');
    end;

    dbgProfissionaisCellClick(nil);
end;

procedure TfrmEncaixe.sbtCadastrarMouseLeave(Sender: TObject);
begin
    sbtCadastrar.Caption := '';
end;

procedure TfrmEncaixe.sbtCadastrarMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
    sbtCadastrar.Caption := 'Cadastrar';
end;

procedure TfrmEncaixe.sbtCancelarClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmEncaixe.sbtCancelarMouseLeave(Sender: TObject);
begin
    sbtCancelar.Caption := '';
end;

procedure TfrmEncaixe.sbtCancelarMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
    sbtCancelar.Caption := 'Cancelar';
end;

end.
