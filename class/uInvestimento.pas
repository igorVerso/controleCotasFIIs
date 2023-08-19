unit uInvestimento;

interface

uses
  Datasnap.DBClient, uDB;

type TInvestimento = class

  private
    FCodigo: Integer;
    FNome: String;
    FPreco: Double;
    FQtd: Integer;
    FLucro: Double;
    FValorInvestido: Double;
    FLucroMensal: Double;
    FLucroAnual: Double;
    FCdsGridInvestimento: TClientDataSet;

    db: TDB;
  public
    destructor Destroy; override;

    property Codigo: Integer read FCodigo write FCodigo;
    property Nome: String read FNome write FNome;
    property Preco: Double read FPreco write FPreco;
    property Qtd: Integer read FQtd write FQtd;
    property Lucro: Double read FLucro write FLucro;
    property ValorInvestido: Double read FValorInvestido write FValorInvestido;
    property LucroMensal: Double read FLucroMensal write FLucroMensal;
    property LucroAnual: Double read FLucroAnual write FLucroAnual;

    property CdsGridInvestimento: TClientDataSet read FCdsGridInvestimento write FCdsGridInvestimento;

    constructor Create;

    procedure limparCampos;
    procedure criandoCamposCdsGridInvestimento;
    procedure visualizarDadosGridInvestimento;

    procedure inserirDados;
    procedure excluirDado;

    function proximoCodigo: Integer;
end;

implementation

uses
  Data.DB, System.SysUtils, FireDAC.Comp.Client;

{ TInvestimento }

constructor TInvestimento.Create;
begin
  db := TDB.Create;
  criandoCamposCdsGridInvestimento;
  limparCampos;
end;

procedure TInvestimento.criandoCamposCdsGridInvestimento;
begin
  FCdsGridInvestimento := TClientDataSet.Create(nil);
  FCdsGridInvestimento.FieldDefs.Add('codigo', ftInteger);
  FCdsGridInvestimento.FieldDefs.Add('nome', ftString, 200);
  FCdsGridInvestimento.FieldDefs.Add('preco', ftFloat);
  FCdsGridInvestimento.FieldDefs.Add('qtd', ftInteger);
  FCdsGridInvestimento.FieldDefs.Add('lucro', ftFloat);
  FCdsGridInvestimento.FieldDefs.Add('valorInvestido', ftFloat);
  FCdsGridInvestimento.FieldDefs.Add('lucroMensal', ftFloat);
  FCdsGridInvestimento.FieldDefs.Add('lucroAnual', ftFloat);
  FCdsGridInvestimento.CreateDataSet;
end;

destructor TInvestimento.Destroy;
begin
  FreeAndNil(db);
  FreeAndNil(FCdsGridInvestimento);
  inherited;
end;

procedure TInvestimento.excluirDado;
var
  query: TFDQuery;
begin
  query := TFDQuery.Create(nil);

  try
    query.Connection := db.Conexao;
    query.SQL.Text := 'DELETE FROM investimento WHERE codigo = ' + FCodigo.ToString;
    query.ExecSQL;

  finally
    query.Close;
    query.DisposeOf;
  end;
end;

procedure TInvestimento.inserirDados;
var
  query: TFDQuery;
  codProximo: Integer;
begin
  query := TFDQuery.Create(nil);

  try
    query.Connection := db.Conexao;
    query.SQL.Text := 'INSERT INTO investimento (codigo, nome, preco, qtd, lucro, valorInvestido, lucroMensal, lucroAnual) ' +
                      'VALUES (:pcodigo, :pnome, :ppreco, :pqtd, :plucro, :pvalorInvestido, :plucroMensal, :plucroAnual)';

    codProximo := proximoCodigo;
    query.ParamByName('pcodigo').AsInteger := codProximo;
    query.ParamByName('pnome').AsString := FNome;
    query.ParamByName('ppreco').AsFloat := FPreco;
    query.ParamByName('pqtd').AsInteger := FQtd;
    query.ParamByName('plucro').AsFloat := FLucro;
    query.ParamByName('pvalorInvestido').AsFloat := FValorInvestido;
    query.ParamByName('plucroMensal').AsFloat := FLucroMensal;
    query.ParamByName('plucroAnual').AsFloat := FLucroAnual;

    query.ExecSQL;

    FCdsGridInvestimento.Append;
    FCdsGridInvestimento.FieldByName('codigo').AsInteger := codProximo;
    FCdsGridInvestimento.FieldByName('nome').AsString := FNome;
    FCdsGridInvestimento.FieldByName('preco').AsFloat := FPreco;
    FCdsGridInvestimento.FieldByName('qtd').AsFloat := FQtd;
    FCdsGridInvestimento.FieldByName('lucro').AsFloat := FLucro;
    FCdsGridInvestimento.FieldByName('valorInvestido').AsFloat := FValorInvestido;
    FCdsGridInvestimento.FieldByName('lucroMensal').AsFloat := FLucroMensal;
    FCdsGridInvestimento.FieldByName('lucroAnual').AsFloat := FLucroAnual;
    FCdsGridInvestimento.Post;

  finally
    query.Close;
    query.DisposeOf;
  end;
end;

procedure TInvestimento.limparCampos;
begin
  FCodigo := 0;
  FNome := '';
  FPreco := 0;
  FQtd := 0;
  FLucro := 0;
  FValorInvestido := 0;
  FLucroMensal := 0;
  FLucroAnual := 0;
  FCdsGridInvestimento.EmptyDataSet;
end;

function TInvestimento.proximoCodigo: Integer;
var
  query: TFDQuery;
begin
  query := TFDQuery.Create(nil);

  try
    query.Connection := db.Conexao;
    query.SQL.Text := 'SELECT * FROM investimento';
    query.Open();

    Result := query.RecordCount + 1;
  finally
    query.Close;
    query.DisposeOf;
  end;
end;

procedure TInvestimento.visualizarDadosGridInvestimento;
var
  query: TFDQuery;
begin
  query := TFDQuery.Create(nil);

  try
    query.Connection := db.Conexao;
    query.SQL.Text := 'SELECT * FROM investimento';
    query.Open();

    query.First;
    while not query.Eof do
    begin
      FCdsGridInvestimento.Append;
      FCdsGridInvestimento.FieldByName('codigo').AsInteger := query.FieldByName('codigo').AsInteger;
      FCdsGridInvestimento.FieldByName('nome').AsString := query.FieldByName('nome').AsString;
      FCdsGridInvestimento.FieldByName('preco').AsFloat := query.FieldByName('preco').AsFloat;
      FCdsGridInvestimento.FieldByName('qtd').AsInteger := query.FieldByName('qtd').AsInteger;
      FCdsGridInvestimento.FieldByName('lucro').AsFloat := query.FieldByName('lucro').AsFloat;
      FCdsGridInvestimento.FieldByName('valorInvestido').AsFloat := query.FieldByName('valorInvestido').AsFloat;
      FCdsGridInvestimento.FieldByName('lucroMensal').AsFloat := query.FieldByName('lucroMensal').AsFloat;
      FCdsGridInvestimento.FieldByName('lucroAnual').AsFloat := query.FieldByName('lucroAnual').AsFloat;



      FCdsGridInvestimento.Post;
      query.Next;
    end;
  finally
    query.Close;
    query.DisposeOf;
  end;

end;

end.
