unit uSqLite;

interface
uses
  svSQLiteTable3, svSQLite3, Generics.Collections, IniFiles;
type
  TSqliteDB = class
  private
    FFileName: string;
    FSqliteDatabase: TSQLiteDatabase;
    FSqliteFunctions: TSQLiteFunctions;
  public
    constructor Create(AFileName: string);
    destructor Destroy; override;
    procedure GetTable(sSql: string);
    procedure OnlyExcuteSql(sSql: string);
  end;
implementation
uses
  Classes,  Types, StrUtils, SysUtils, Dialogs;
var
  ConvertConfig: TIniFile;
  ConvertConfigDic: TDictionary<string,string>;
procedure onetest(sqlite3_context: Psqlite3_context; ArgIndex: Integer;
  ArgValue: PPsqlite3_value);
VAR
  theStr: string;
begin
  theStr := TSQLiteFunctions.ValueAsString(ArgValue^);
  // 解密并返回
  theStr := (theStr + theStr);
  TSQLiteFunctions.ResultAsString(sqlite3_context, theStr);
end;

function replaceConfigText(str: string; aConfigDic: TDictionary<string,string>): string;
var
  sKey : string;
begin
  Result := str;
  for  sKey in aConfigDic.Keys do
    Result := ReplaceStr(Result, sKey, aConfigDic[sKey]);
end;


procedure twotest(sqlite3_context: Psqlite3_context; ArgIndex: Integer;
  ArgValue: PPsqlite3_value);
VAR
  param1, param2: string;
  result: string;
begin
  with TSQLiteFunctions do
  begin
    param1 :=  ValueAsString(GetArrayElement(ArgValue, 0));
    // 解密并返回
    param2 := ValueAsString(GetArrayElement(ArgValue, 1));;
    result := param1 +  param2;
    TSQLiteFunctions.ResultAsString(sqlite3_context, result);
  end;
end;


constructor TSqliteDB.Create(AFileName: string);
begin
  FFileName := AFileName;
  FSqliteDatabase := TSQLiteDatabase.Create(FFileName);
  FSqliteFunctions := TSQLiteFunctions.Create(FSqliteDatabase);
  FSqliteFunctions.AddScalarFunction('testone', 1, onetest);
  FSqliteFunctions.AddScalarFunction('testtwo', 2, twotest);
end;

destructor TSqliteDB.Destroy;
begin
  FSqliteFunctions.Free;
  FSqliteDatabase.Free;
  inherited;
end;

procedure TSqliteDB.OnlyExcuteSql(sSql: string);
begin
  FSqliteDatabase.ExecSQL(sSql);
end;

procedure TSqliteDB.GetTable(sSql: string);
var
  Table: TSQLiteTable;
begin
  Table := FSqliteDatabase.GetTable(sSql);
  if Table.Count = 0 then
    Exit;
  while not Table.Eof do
  begin

    Table.Next;
  end;
end;


end.
