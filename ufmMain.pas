unit ufmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Datasnap.DBClient, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.Imaging.pngimage, Vcl.StdCtrls, Data.SqlExpr,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.Client,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, uInvestimento;

type
  TfmMain = class(TForm)
    pnMain: TPanel;
    pnAdicionaCota: TPanel;
    edNome: TEdit;
    lbNome: TLabel;
    lbPreco: TLabel;
    edPreco: TEdit;
    lbQtd: TLabel;
    edQtd: TEdit;
    lbLucroCota: TLabel;
    edLucroCota: TEdit;
    imAdiciona: TImage;
    dbGridInvestimento: TDBGrid;
    dsGridInvestimento: TDataSource;
    pnLixeiraLateral: TPanel;
    imLixeira: TImage;
    lbLixeira: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure imAdicionaClick(Sender: TObject);
    procedure imLixeiraClick(Sender: TObject);
    procedure edExitMoeda(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
    investimento: TInvestimento;

    procedure limparEdites;
    function verificaDados: Boolean;
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;

implementation

uses
  System.SysUtils;

{$R *.dfm}

procedure TfmMain.edExitMoeda(Sender: TObject);
begin
  if TEdit(Sender).Text = EmptyStr then
  begin
    TEdit(Sender).Text := '0,00';
  end;
  TEdit(Sender).Text := StringReplace(TEdit(Sender).Text, '.', ',', [rfReplaceAll, rfIgnoreCase]);
  TEdit(Sender).Text := FormatFloat(',0.00', StrToFloat(TEdit(Sender).Text));
end;

procedure TfmMain.FormCreate(Sender: TObject);
begin
  investimento := TInvestimento.Create;
  dsGridInvestimento.DataSet := investimento.CdsGridInvestimento;
  investimento.visualizarDadosGridInvestimento;
end;

procedure TfmMain.FormResize(Sender: TObject);
var
  i:integer;
begin
  for i :=0 to dbGridInvestimento.Columns.Count - 1 do
  begin
    dbGridInvestimento.Columns[i].width := Round(Width / dbGridInvestimento.Columns.Count - 67) + dbGridInvestimento.Canvas.TextWidth(dbGridInvestimento.Columns[i].Title.Caption);
  end;
end;

procedure TfmMain.imAdicionaClick(Sender: TObject);
begin
  if not(verificaDados) then Exit;

  investimento.Nome := edNome.Text;
  investimento.Preco := StrtoFloat(edPreco.Text);
  investimento.qtd := StrtoInt(edQtd.Text);
  investimento.Lucro := StrtoFloat(edLucroCota.Text);
  investimento.ValorInvestido := StrToFloat(Format('%.2f', [investimento.Preco * investimento.Qtd]));
  investimento.LucroMensal := StrToFloat(Format('%.2f', [investimento.Lucro * investimento.Qtd]));
  investimento.LucroAnual := StrToFloat(Format('%.2f', [investimento.LucroMensal * 12]));
  investimento.inserirDados;
  limparEdites;
end;

procedure TfmMain.imLixeiraClick(Sender: TObject);
begin
  if investimento.CdsGridInvestimento.IsEmpty then
  begin
    ShowMessage('Grid de investimento está vazio!!');
    Exit;
  end;
  investimento.Codigo := dsGridInvestimento.DataSet.FieldByName('codigo').AsInteger;
  investimento.excluirDado;
  investimento.CdsGridInvestimento.EmptyDataSet;
  investimento.visualizarDadosGridInvestimento;
end;

procedure TfmMain.limparEdites;
begin
  edNome.Text := '';
  edPreco.Text := '';
  edQtd.Text := '';
  edLucroCota.Text := '';
end;

function TfmMain.verificaDados;
begin
  Result := False;
  if edNome.Text = EmptyStr then
  begin
    ShowMessage('Ajuste o campo nome!');
    Exit;
  end
  else if edPreco.Text = EmptyStr then
  begin
    ShowMessage('Ajuste o campo preco!');
    Exit;
  end
  else if edQtd.Text = EmptyStr then
  begin
    ShowMessage('Ajuste o campo quantidade da cota!');
    Exit;
  end;
  Result := True;
end;

end.
