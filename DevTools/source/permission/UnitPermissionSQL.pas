unit UnitPermissionSQL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TFormPermissionSQL = class(TForm)
    MemoSQL: TMemo;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MemoSQLKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPermissionSQL: TFormPermissionSQL;

implementation

{$R *.dfm}

procedure TFormPermissionSQL.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TFormPermissionSQL.BitBtn1Click(Sender: TObject);
begin
  memosql.SelectAll;
  memosql.CopyToClipboard;

end;

procedure TFormPermissionSQL.MemoSQLKeyPress(Sender: TObject;
  var Key: Char);
begin
    if( key = #1 ) then
        TMemo(sender).SelectAll;

end;

end.
