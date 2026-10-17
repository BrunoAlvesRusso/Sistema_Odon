unit untAgenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.Menus,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Samples.Spin, Vcl.Buttons, sqlExpr,
  SimpleDS, Vcl.DBCtrls, DateUtils;

type
  TfrmAgenda = class(TForm)
    MainMenu1: TMainMenu;
    Fechar1: TMenuItem;
    dbgAgenda: TDBGrid;
    Calendario: TMonthCalendar;
    PopupMenu1: TPopupMenu;
    Excluir1: TMenuItem;
    Alterar1: TMenuItem;
    StatusBar1: TStatusBar;
    cbxProfissional: TGroupBox;
    Configurar1: TMenuItem;
    dblProfissional: TDBLookupComboBox;
    dbgAgendamento: TDBGrid;
    ImprimirCtrlP1: TMenuItem;
    Timer1: TTimer;
    GroupBox1: TGroupBox;
    sbtPesquisar: TSpeedButton;
    edtPesquisar: TEdit;
    ckbAberto: TCheckBox;
    ckbHoje: TCheckBox;
    ImprimirHorriosMarcados1: TMenuItem;
    ImprimirAgenda1: TMenuItem;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Fechar1Click(Sender: TObject);
    procedure CalendarioClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Excluir1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblProfissionalClick(Sender: TObject);
    procedure Configurar1Click(Sender: TObject);
    procedure dbgAgendaDblClick(Sender: TObject);
    procedure Alterar1Click(Sender: TObject);
    procedure dbgAgendaCellClick(Column: TColumn);
    procedure dbgAgendamentoDblClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure sbtPesquisarClick(Sender: TObject);
    procedure edtPesquisarKeyPress(Sender: TObject; var Key: Char);
    procedure ckbAbertoClick(Sender: TObject);
    procedure ImprimirAgenda1Click(Sender: TObject);
    procedure ImprimirHorriosMarcados1Click(Sender: TObject);
    procedure dbgAgendamentoTitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure InsertUpdateDelete(pTipo : Integer);
  end;

var
  frmAgenda: TfrmAgenda;

implementation

{$R *.dfm}

uses untDM, untRotinas, untConCliente, untCadAgenda, untEncaixe, untDMReport;

procedure TfrmAgenda.Alterar1Click(Sender: TObject);
begin
    gEncaixe := True;
    CriaForm(TfrmCadAgenda, frmCadAgenda, False);
    gEncaixe := False;
end;

procedure TfrmAgenda.CalendarioClick(Sender: TObject);
var sql, DiaSemana : string;
    i, intervalo : Integer;
    sdsTemp : TSimpleDataSet;
    hrIni: TTime;
    hrFim: TTime;
begin
    // consulta horários pré definidos
    sdsTemp := TSimpleDataSet.Create(nil);
    sdsTemp.Connection := DM.CONEXAO;

    DiaSemana := FormatDateTime('DDDD', Calendario.Date);

    with sdsTemp do begin
      Close;
      DataSet.CommandText := ' select * from enc00 a '+
                             ' where a.nu_colaborador = '+IntToStr(DM.sdsProfissionalINDICE.AsInteger)+
                             ' and a.dia_semana = '+QuotedStr(DiaSemana);
      Open;
    end;

    hrIni := sdsTemp.FieldByName('HR_INICIO').AsDateTime;
    hrFim := sdsTemp.FieldByName('HR_FIM').AsDateTime;
    intervalo := sdsTemp.FieldByName('INTERVALO').AsInteger;

    sql := ' select * from age00 a '+
           ' inner join col00 b on a.nu_colaborador = b.indice '+
           ' where a.DATA = :pDATA '+
           ' and a.NU_COLABORADOR = :pNU_COLABORADOR ';
    sql := sql + ' order by a.HORA ';
    with DM.sdsAgenda do begin
      Close;
      DataSet.CommandText := sql;
      DataSet.ParamByName('pDATA').AsDate := Calendario.Date;
      DataSet.ParamByName('pNU_COLABORADOR').AsInteger := dblProfissional.KeyValue;
      Open;
    end;

    if (DM.sdsAgenda.RecordCount = 0) and (intervalo <> 0) then begin
      while hrIni <= hrFim do begin
          with DM do begin

            try
              TRANSACAO.TransactionID  := NewTransactionID;
              TRANSACAO.IsolationLevel := xilREPEATABLEREAD;

              with sqlAux do begin

                SQL.Clear;
                CommandText := 'insert into AGE00 '+
                               '(NU_COLABORADOR, DATA, HORA) '+
                               'VALUES '+
                               '(:pNU_COLABORADOR, :pDATA, :pHORA)';

                ParamByName('pDATA').AsDate              := Calendario.Date;
                ParamByName('pHORA').AsTime              := hrIni;
                ParamByName('pNU_COLABORADOR').AsInteger := sdsTemp.FieldByName('NU_COLABORADOR').AsInteger;

                CONEXAO.StartTransaction(TRANSACAO);
                Close;
                ExecSQL;
                CONEXAO.Commit(TRANSACAO);
                sdsAgenda.Close;
                sdsAgenda.Open;
              end; // fim with sqlAux
            except
              on Exc:Exception do
                begin
                  CONEXAO.Rollback(TRANSACAO);
                  Informacao('Atenção!', 'Ocorreu um erro na gravação ao banco de dados: ' + Exc.Message);
                  Exit;
                end;
            end;

          end; // fim with DM

          hrIni := IncMinute(hrIni, intervalo);

      end; // fim while
    end; // fim if

    sql := ' select * from age00 a '+
           ' inner join col00 b on a.nu_colaborador = b.indice '+
           ' where a.DATA = :pDATA ';

    if dblProfissional.KeyValue <> Null then
      sql := sql + ' and a.NU_COLABORADOR = :pNU_COLABORADOR ';

    sql := sql + ' order by a.HORA ';

    with DM.sdsAgenda do begin
      Close;
      DataSet.CommandText := sql;
      DataSet.ParamByName('pDATA').AsDate := Calendario.Date;

      if dblProfissional.KeyValue <> Null then
        DataSet.ParamByName('pNU_COLABORADOR').AsInteger := dblProfissional.KeyValue;

      Open;
    end;

    if ((Trim(DM.sdsAgendaCLIENTE.AsString) <> '') or (DM.sdsAgendaENCAIXE.AsString = 'S')) and
        (DM.sdsAgendaSITUACAO.AsString = 'ABERTO') then
    begin
      DM.sdsAgendados.Close;
      DM.sdsAgendados.DataSet.CommandText := ' select * from age00 a '+
                                             ' inner join col00 b on a.nu_colaborador = b.indice '+
                                             ' where a.NU_CLIENTE = '+ IntToStr(DM.sdsAgendaNU_CLIENTE.AsInteger)+
                                             ' and a.SITUACAO = '+QuotedStr('ABERTO')+
                                             ' and a.DATA >= '+QuotedStr(InverteData(DateToStr(Date)))+
                                             ' order by a.DATA';
      DM.sdsAgendados.Open;
    end
    else
      DM.sdsAgendados.Close;
end;

procedure TfrmAgenda.ckbAbertoClick(Sender: TObject);
begin
    edtPesquisar.SetFocus;
end;

procedure TfrmAgenda.Configurar1Click(Sender: TObject);
begin
    CriaForm(TfrmEncaixe, frmEncaixe, False);
end;

procedure TfrmAgenda.dbgAgendaCellClick(Column: TColumn);
begin
    if ((Trim(DM.sdsAgendaCLIENTE.AsString) <> '') or (DM.sdsAgendaENCAIXE.AsString = 'S')) and
        (DM.sdsAgendaSITUACAO.AsString = 'ABERTO') then
    begin
      Excluir1.Enabled := True;
      DM.sdsAgendados.Close;
      DM.sdsAgendados.DataSet.CommandText := ' select * from age00 a '+
                                             ' inner join col00 b on a.nu_colaborador = b.indice '+
                                             ' where a.NU_CLIENTE = '+ IntToStr(DM.sdsAgendaNU_CLIENTE.AsInteger)+
                                             ' and a.SITUACAO = '+QuotedStr('ABERTO')+
                                             ' and a.DATA >= '+QuotedStr(InverteData(DateToStr(Date)))+
                                             ' order by a.DATA';
      DM.sdsAgendados.Open;
    end
    else
    begin
      Excluir1.Enabled := False;
      DM.sdsAgendados.Close;
    end;
end;

procedure TfrmAgenda.dbgAgendaDblClick(Sender: TObject);
begin
    gAlterar := True;
    if DM.sdsAgendaSITUACAO.AsString = 'CONCLUÍDO' then begin
      Informacao('Atenção', 'Esta consulta não pode ser alterada pois já foi concluída.');
      Exit;
    end;
    Timer1.Enabled := False;
    frmCadAgenda := TfrmCadAgenda.Create(Application);
    frmCadAgenda.edtCliente.Text := DM.sdsAgendaCLIENTE.AsString;
    pNumeroAgenda := DM.sdsClienteINDICE.AsInteger;
    frmCadAgenda.dtpData.Date := DM.sdsAgendaDATA.AsDateTime;
    frmCadAgenda.dtpHora.Time := DM.sdsAgendaHORA.AsDateTime;
    frmCadAgenda.dblProfissional.KeyValue := DM.sdsAgendaNU_COLABORADOR.AsInteger;
    frmCadAgenda.memObservacao.Text := DM.sdsAgendaOBS.AsString;
    frmCadAgenda.ShowModal;
    frmCadAgenda.Free;
    frmCadAgenda := nil;
    Timer1.Enabled := True;
    DM.sdsAgendados.Close;
    gAlterar := False;
end;

procedure TfrmAgenda.dbgAgendamentoDblClick(Sender: TObject);
begin
    Calendario.Date := DM.sdsAgendadosDATA.AsDateTime;
    CalendarioClick(Sender);
end;

procedure TfrmAgenda.dbgAgendamentoTitleClick(Column: TColumn);
begin
    DM.sdsAgendados.IndexFieldNames := Column.FieldName;
end;

procedure TfrmAgenda.dblProfissionalClick(Sender: TObject);
begin
    CalendarioClick(Sender);
end;

procedure TfrmAgenda.edtPesquisarKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #13 then
      sbtPesquisar.Click;
end;

procedure TfrmAgenda.Excluir1Click(Sender: TObject);
begin
    if (Trim(DM.sdsAgendaCLIENTE.AsString) <> '') and (DM.sdsAgendaSITUACAO.AsString = 'ABERTO') then begin
      InsertUpdateDelete(2);
      CalendarioClick(Sender);
    end;
end;

procedure TfrmAgenda.Fechar1Click(Sender: TObject);
begin
    Close;
end;

procedure TfrmAgenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    DM.sdsProfissional.Close;
    DM.sdsAgendados.Close;
    gAgenda := False;
end;

procedure TfrmAgenda.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #27 then
      Close;
end;

procedure TfrmAgenda.FormShow(Sender: TObject);
begin
    DM.sdsProfissional.Close;
    DM.sdsProfissional.Open;
    dblProfissional.KeyValue := DM.sdsProfissionalINDICE.AsInteger;
    gEncaixe := False;
    Calendario.Date := Date;
    CalendarioClick(Sender);
    gAlterar := False;

    if Permissao(gLogin, gSenha) then begin
      Configurar1.Visible := True;
    end
    else begin
      Configurar1.Visible := False;
    end;
end;

procedure TfrmAgenda.ImprimirAgenda1Click(Sender: TObject);
begin
    DMReport.frxRptAgenda.Variables.Variables['Calendario'] := QuotedStr(FormatDateTime('dd/mm/yyyy', Calendario.Date));
    DMReport.frxRptAgenda.ShowReport;
end;

procedure TfrmAgenda.ImprimirHorriosMarcados1Click(Sender: TObject);
begin
    //DMReport.frxRptAgenda.Variables.Variables['Calendario'] := QuotedStr(FormatDateTime('dd/mm/yyyy', Calendario.Date));
    DMReport.frxRptMarcados.ShowReport;
end;

procedure TfrmAgenda.InsertUpdateDelete(pTipo : Integer);
var vSQL, vMensagem  : string;
begin
    case pTipo of
      0: // inserir
        begin
          vSQL := 'insert into AGE00 '+
                  '(NU_CLIENTE, NU_COLABORADOR, DATA, HORA) '+
                  'VALUES '+
                  '(:pNU_CLIENTE, :pNU_COLABORADOR, :pDATA, :pHORA)';

          vMensagem := 'incluido';
        end;

      1: // alterar
        begin

        end;

      2: //apagar
        begin
          if Confirmacao('Confirmação', 'Deseja, realmente, excluir este registro?') then begin
            if DM.sdsAgendaENCAIXE.AsString = 'S' then begin
              vSQL := ' delete from age00 '+
                      ' where INDICE = :pINDICE';
            end
            else begin
              vSQL := ' update age00 set CLIENTE = NULL '+
                      ', SITUACAO = NULL '+
                      ', OBS = NULL '+
                      ', NU_CLIENTE = NULL '+
                      ' where INDICE = :pINDICE';
            end;

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
              ParamByName('pINDICE').AsInteger := DM.sdsAgendaINDICE.AsInteger;

          // se for inserir ou alterar passa os parametros
          if pTipo in [0,1] then begin

            if pTipo = 0 then begin
              ParamByName('pDATA').AsDate             := Calendario.Date;
              ParamByName('pNU_COLABORADOR').AsInteger := dblProfissional.KeyValue;
            end;

            ParamByName('pNU_CLIENTE').AsInteger := pNumeroAgenda;

            CONEXAO.StartTransaction(TRANSACAO);
            Close;
            ExecSQL;
            CONEXAO.Commit(TRANSACAO);
            sdsAgenda.Close;
            sdsAgenda.Open;
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
            Informacao('Atenção!', 'Ocorreu um erro na gravação ao banco de dados: ' + Exc.Message);
            Exit;
          end;
      end;

    end; // fim with DM
end;

procedure TfrmAgenda.sbtPesquisarClick(Sender: TObject);
begin
    if Trim(edtPesquisar.Text) <> '' then begin
      DM.sdsAgendados.Close;
      DM.sdsAgendados.DataSet.CommandText := ' select * from age00 a '+
                                             ' inner join col00 b on a.nu_colaborador = b.indice '+
                                             ' where a.CLIENTE like '+ QuotedStr('%'+edtPesquisar.Text+'%')+
                                             ' and a.CLIENTE <> '+QuotedStr('NÃO AGENDAR');
      if ckbAberto.Checked then begin
        DM.sdsAgendados.DataSet.CommandText := DM.sdsAgendados.DataSet.CommandText +
                                               ' and a.SITUACAO = '+QuotedStr('ABERTO');
      end;

      if ckbHoje.Checked then begin
        DM.sdsAgendados.DataSet.CommandText := DM.sdsAgendados.DataSet.CommandText +
                                               ' and a.DATA >= '+QuotedStr(InverteData(DateToStr(Date)));
      end;

      DM.sdsAgendados.DataSet.CommandText := DM.sdsAgendados.DataSet.CommandText + ' order by a.DATA';
      DM.sdsAgendados.Open;
    end;
end;

procedure TfrmAgenda.Timer1Timer(Sender: TObject);
begin
    CalendarioClick(Sender);
end;

end.
