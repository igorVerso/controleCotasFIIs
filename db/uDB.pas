unit uDB;

interface

uses
  FireDAC.Comp.Client, Datasnap.DBClient;

type TDB = class

  private
    FConexao: TFDConnection;
    procedure createTableInvestment;

  public
    destructor Destroy; override;

    property Conexao: TFDConnection read FConexao write FConexao;

    constructor Create;

end;

implementation

uses
  System.SysUtils, Vcl.Dialogs;

{ TDB }

constructor TDB.Create;
begin
  FConexao := TFDConnection.Create(nil);

  FConexao.DriverName := 'SQLITE';
  FConexao.Params.Values['Database'] := System.SysUtils.GetCurrentDir + '\banco.db';

  try
    FConexao.Open;
    createTableInvestment;
  except
    ShowMessage('Erro ao conectar no banco Local');
  end;
end;

procedure TDB.createTableInvestment;
var
  query: TFDQuery;
begin
  query := TFDQuery.Create(nil);

  try
    query.Connection := Conexao;
    query.SQL.Text := 'CREATE TABLE IF NOT EXISTS investimento(codigo integer primarey key,' +
                                                              'nome varchar(200),'+
                                                              'preco double,' +
                                                              'qtd integer,' +
                                                              'lucro double,' +
                                                              'valorInvestido double,' +
                                                              'lucroMensal double,' +
                                                              'lucroAnual double)';
    query.ExecSQL;

  finally
    query.Close;
    query.DisposeOf;
  end;
end;

destructor TDB.Destroy;
begin
  FConexao.Close;
  FreeAndNil(FConexao);
  inherited;
end;

end.
