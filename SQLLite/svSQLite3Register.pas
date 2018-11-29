unit svSQLite3Register;

interface

procedure Register;

implementation

uses
  Classes, svSQLiteTable3, svSQLite3Dataset;

procedure Register;
begin
  RegisterComponents('SQLite3',
    [TSQLiteDatabase, TSQLiteDataset, TSQLiteUpdateSQL]);
end;

end.
