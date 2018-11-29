// Added by hwf 2015-7-17 TODO:处理数据集的主从关系
unit usvSLDataset;

interface

uses
  Classes, svSQLite3Dataset, DB;

type
  TSLDataset = class(TSQLiteDataset)
  private
    FDataSource: TDataSource;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure SetSLMaster(AMasterDataset: TSQLiteDataset);
    procedure SetSLMasterFields(AMasterFields: string);

    property DataSource: TDataSource read FDataSource;
  end;

implementation

uses
  StrUtils, SysUtils;

{ TSLDataset }

constructor TSLDataset.Create(AOwner: TComponent);
begin
  inherited;
  FDataSource := TDataSource.Create(nil);
  FDataSource.DataSet := Self;
end;

destructor TSLDataset.Destroy;
begin
  FDataSource.Free;
  inherited;
end;

procedure TSLDataset.SetSLMaster(AMasterDataset: TSQLiteDataset);
begin
  if (AMasterDataset <> nil) and (AMasterDataset is TSLDataset) and
    ((AMasterDataset as TSLDataset).DataSource <> nil) then
  begin
    Self.MasterSource := (AMasterDataset as TSLDataset).DataSource;
  end;
end;

procedure TSLDataset.SetSLMasterFields(AMasterFields: string); // 形如：masterfield = indexfield
var
  sMaster, sIndexField: string;
  iPos: Integer;
begin
  if AMasterFields = '' then
    Exit;
  iPos := Pos('=', AMasterFields);
  if iPos <= 0 then
    Exit;
  sMaster := Copy(AMasterFields, 1, iPos - 1);
  sIndexField := Copy(AMasterFields, iPos + 1, Length(AMasterFields) - iPos);
  Self.IndexFieldNames := Trim(sIndexField);
  Self.MasterFields := Trim(sMaster);
end;

end.
