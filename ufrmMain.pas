unit ufrmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFrmMian = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    Memo2: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMian: TFrmMian;

implementation
uses
  uSqLite;
{$R *.dfm}

procedure TFrmMian.Button1Click(Sender: TObject);
begin
  with  TSqliteDB.Create('test.db') do
  try
    OnlyExcuteSql(Memo1.Lines[0]);
  finally
    Free;
  end;
end;

procedure TFrmMian.Button2Click(Sender: TObject);
begin
  with  TSqliteDB.Create('test.db') do
  try
    OnlyExcuteSql(Memo2.Lines[0]);
  finally
    Free;
  end;
end;

end.
