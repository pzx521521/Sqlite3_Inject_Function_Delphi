program SqliteInjectFunction;

uses
  Forms,
  svSQLite3 in 'SQLLite\svSQLite3.pas',
  svSQLite3Dataset in 'SQLLite\svSQLite3Dataset.pas',
  svSQLite3Register in 'SQLLite\svSQLite3Register.pas',
  svSQLiteTable3 in 'SQLLite\svSQLiteTable3.pas',
  svSQLiteVirtualTable3 in 'SQLLite\svSQLiteVirtualTable3.pas',
  uSqLite in 'uSqLite.pas',
  ufrmMain in 'ufrmMain.pas' {FrmMian};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMian, FrmMian);
  Application.Run;
end.
