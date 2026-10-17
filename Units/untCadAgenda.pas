unit untCadAgenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Buttons, Vcl.StdCtrls, SqlExpr,
  SimpleDS, Vcl.DBCtrls;

type
  TfrmCadAgenda = class(TForm)
    edtCliente: TEdit;
    sbtCliente: TSpeedButton;
    dtpHora: TDateTimePicker;
    dtpData: TDateTimePicker;
    sbtSalvar: TSpeedButton;
    lblProfissional: TLabel;
    dblProfissional: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cbxSituacao: TComboBox;
    Label4: TLabel;
    Label5: TLabel;
    memObservacao: TMemo;
    ckbNaoAgendar: TCheckBox;
    procedure sbtClienteClick(Sender: TObject);
    procedure sbtSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ckbNaoAgendarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadAgenda: TfrmCadAgenda;

implementation

{$R *.dfm}

uses untRotinas, untConCliente, untDM;

procedure TfrmCadAgenda.ckbNaoAgendarClick(Sender: TObject);
begin
    if ckbNaoAgendar.Checked then
    begin
      edtCliente.Text := 'NÃO AGENDAR';
      sbtCliente.Enabled := False;
    end
    else
    begin
      sbtCliente.Enabled := True;
      edtCliente.Clear;
    end;
end;

procedure TfrmCadAgenda.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #27 then
      Close;
end;

procedure TfrmCadAgenda.FormShow(Sender: TObject);
begin
    if DM.sdsAgendaSITUACAO.AsString = '' then begin
      cbxSituacao.ItemIndex := 0;
      cbxSituacao.Enabled   := False;
    end;

    if gEncaixe then begin
      dtpHora.Enabled          := True;
      dtpHora.Time             := DM.sdsAgendaHORA.AsDateTime;
      dtpData.Date             := DM.sdsAgendaDATA.AsDateTime;
      dblProfissional.KeyValue := DM.sdsAgendaNU_COLABORADOR.AsInteger;
      cbxSituacao.ItemIndex    := 0;
    end;

    if edtCliente.Text <> '' then
      pNumeroAgenda := DM.sdsAgendaNU_CLIENTE.AsInteger;
end;

procedure TfrmCadAgenda.sbtClienteClick(Sender: TObject);
begin
    gAgenda := True;
    CriaForm(TfrmConCliente, frmConCliente, False);
    edtCliente.Text := pNomeAgenda;
end;

procedure TfrmCadAgenda.sbtSalvarClick(Sender: TObject);
var sdsTemp : TSimpleDataSet;
    mensagem : string;
begin
    if Trim(edtCliente.Text) = '' then begin
      Informacao('Atenção!', 'Selecione um cliente.');
      sbtCliente.Click;
      Exit;
    end;

    if dblProfissional.KeyValue = Null then begin
      Informacao('Atenção!', 'Selecione um Profissional.');
      Exit;
    end;

    if (Trim(memObservacao.Text) = '') and (cbxSituacao.ItemIndex = 1)  then begin
      Informacao('Atenção!', 'Informe uma descrição.');
      memObservacao.SetFocus;
      Exit;
    end;

    // cria SimpleDataSet temporário
    sdsTemp := TSimpleDataSet.Create(nil);
    sdsTemp.Connection := DM.CONEXAO;

    with sdsTemp do begin
      Close;
      // consulta se há agendamento marcado para a data, hora e colaborador
      DataSet.CommandText := ' select * from age00 a '+
                             ' inner join col00 b on a.nu_colaborador = b.indice '+
                             ' where a.DATA = :pDATA and a.HORA = :pHORA and '+
                             ' a.NU_COLABORADOR = :pNU_COLABORADOR '+
                             ' order by HORA ';
      DataSet.ParamByName('pDATA').AsDate              := dtpData.Date;
      DataSet.ParamByName('pHORA').AsTime              := dtpHora.Time;
      DataSet.ParamByName('pNU_COLABORADOR').AsInteger := dblProfissional.KeyValue;
      Open;
    end;

    if (Trim(sdsTemp.FieldByName('CLIENTE').AsString) <> '') and (gEncaixe) then begin
      Informacao('Atenção!', 'Este horário já está reservado para '+
                  sdsTemp.FieldByName('CLIENTE').AsString+'.');
      Exit;
    end;


    // atendimento concluído
    if cbxSituacao.ItemIndex = 1 then begin

      // confirmação de atendimento para tabela de Caixa (CXA00)
      if Confirmacao('Atenção', 'Esta operação implicará na conclusão do agendamento '+#13+
                     'deste cliente, contabilizando sua consula.'+#13+
                     'Deseja continuar?') then begin

        with DM do begin

          try
            TRANSACAO.TransactionID  := NewTransactionID;
            TRANSACAO.IsolationLevel := xilREADCOMMITTED;

            with sqlAux do begin
              SQL.Clear;
              CommandText := ' insert into CXA00 '+
                             ' (NU_COLABORADOR, NU_CLIENTE, '+
                             ' SITUACAO, DT_ATENDIMENTO, TRANSACAO) '+
                             ' values '+
                             ' (:pNU_COLABORADOR, :pNU_CLIENTE, '+
                             ' :pSITUACAO, :pDT_ATENDIMENTO, :pTRANSACAO) ';

              ParamByName('pNU_COLABORADOR').AsInteger := dblProfissional.KeyValue;
              ParamByName('pNU_CLIENTE').AsInteger     := pNumeroAgenda;
              ParamByName('pDT_ATENDIMENTO').AsDate    := dtpData.Date;
              ParamByName('pSITUACAO').AsString        := 'PENDENTE';
              ParamByName('pTRANSACAO').AsString       := 'E';

              CONEXAO.StartTransaction(TRANSACAO);
              Close;
              ExecSQL;
              CONEXAO.Commit(TRANSACAO);
            end; // fim with sqlAux
          except
            on Exc:Exception do
              begin
                CONEXAO.Rollback(TRANSACAO);
                Informacao('Atenção!', 'Ocorreu um erro na gravação ao banco de dados: ' + Exc.Message);
                Exit;
              end;
          end;// fim try

        end;// fim with DM

      end
      else Exit;

    end; // fim atendimento concluído


    with DM do begin

      // grava a data da última consulta
      try
        TRANSACAO.TransactionID  := NewTransactionID;
        TRANSACAO.IsolationLevel := xilREADCOMMITTED;

        with sqlAux do begin
          SQL.Clear;
          CommandText := ' update CLI00 set '+
                         ' DT_ULTIMA_CONSULTA = :pDT_ULTIMA_CONSULTA '+
                         ' where INDICE = :pINDICE';

          ParamByName('pINDICE').AsInteger          := DM.sdsAgendaNU_CLIENTE.AsInteger;
          ParamByName('pDT_ULTIMA_CONSULTA').AsDate := DM.sdsAgendaDATA.AsDateTime;

          CONEXAO.StartTransaction(TRANSACAO);
          Close;
          ExecSQL;
          CONEXAO.Commit(TRANSACAO);
        end; // fim with sqlAux
      except
        on Exc:Exception do
          begin
            CONEXAO.Rollback(TRANSACAO);
            Informacao('Atenção!', 'Ocorreu um erro na gravação ao banco de dados: ' + Exc.Message);
            Exit;
          end;
      end;



      try
        TRANSACAO.TransactionID  := NewTransactionID;
        TRANSACAO.IsolationLevel := xilREPEATABLEREAD;

        with sqlAux do begin
          SQL.Clear;
          if not gEncaixe then begin
            CommandText := ' update AGE00 set '+
                           ' CLIENTE        = :pCLIENTE, '+
                           ' NU_CLIENTE     = :pNU_CLIENTE, '+
                           ' DATA           = :pDATA, '+
                           ' HORA           = :pHORA, '+
                           ' NU_COLABORADOR = :pNU_COLABORADOR, '+
                           ' OBS            = :pOBS, '+
                           ' SITUACAO       = :pSITUACAO '+
                           ' where INDICE   = :pINDICE';

            mensagem := 'alterado';

            ParamByName('pINDICE').AsInteger := DM.sdsAgendaINDICE.AsInteger;
          end
          else begin
            CommandText := ' insert into AGE00 '+
                           ' (CLIENTE, NU_CLIENTE, DATA, HORA, NU_COLABORADOR, OBS, SITUACAO, ENCAIXE) '+
                           ' values '+
                           ' (:pCLIENTE, :pNU_CLIENTE, :pDATA, :pHORA, :pNU_COLABORADOR, :pOBS, :pSITUACAO, :pENCAIXE)';
            ParamByName('pENCAIXE').AsString := 'S';
            mensagem := 'incluido';
          end;

          ParamByName('pCLIENTE').AsString         := edtCliente.Text;
          ParamByName('pNU_CLIENTE').AsInteger     := pNumeroAgenda;
          ParamByName('pDATA').AsDate              := dtpData.Date;
          ParamByName('pHORA').AsTime              := dtpHora.Time;
          ParamByName('pNU_COLABORADOR').AsInteger := dblProfissional.KeyValue;
          ParamByName('pOBS').AsString             := memObservacao.Text;
          ParamByName('pSITUACAO').AsString        := cbxSituacao.Text;

          CONEXAO.StartTransaction(TRANSACAO);
          Close;
          ExecSQL;
          CONEXAO.Commit(TRANSACAO);
          sdsAgenda.Close;
          sdsAgenda.Open;
          Afirmacao('Confirmação', 'Registro '+mensagem+' com sucesso!');
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

    sdsTemp.Free;
    Close;
end;

end.
