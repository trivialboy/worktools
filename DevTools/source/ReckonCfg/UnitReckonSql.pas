unit UnitReckonSql;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls;

type
  TFormReckonSql = class(TForm)
    mmSql: TRichEdit;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormReckonSql: TFormReckonSql;

implementation

{$R *.dfm}

procedure TFormReckonSql.Button1Click(Sender: TObject);
begin
    mmSql.Clear;
end;

procedure TFormReckonSql.Button2Click(Sender: TObject);
begin
  mmSql.SelectAll;
  mmSql.CopyToClipboard; 
end;

procedure TFormReckonSql.Button3Click(Sender: TObject);
begin
close;
end;

end.
