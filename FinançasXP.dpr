program FinançasXP;

uses
  Vcl.Forms,
  MidasLib,
  ufmMain in 'ufmMain.pas' {fmMain},
  uInvestimento in 'class\uInvestimento.pas',
  uDB in 'db\uDB.pas';

{$R *.res}

begin
  Application.Initialize;
  ReportMemoryLeaksOnShutdown := False;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfmMain, fmMain);
  Application.Run;
end.
