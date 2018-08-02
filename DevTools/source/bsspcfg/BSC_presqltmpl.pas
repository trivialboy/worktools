unit BSC_presqltmpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids;

type
  TFormPreSqlOutTempl = class(TForm)
    Panel1: TPanel;
    MemoPreSqlTempl: TMemo;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    StaticText1: TStaticText;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
    sg_sqlout : TStringGrid;
  public
    { Public declarations }
    procedure SetSqlOutSG(sg : TStringGrid);
  end;

var
  FormPreSqlOutTempl: TFormPreSqlOutTempl;

implementation

uses BSC_config;

{$R *.dfm}

procedure TFormPreSqlOutTempl.SetSqlOutSG(sg:TStringGrid);
begin
    sg_sqlout := sg;
end;

procedure TFormPreSqlOutTempl.BitBtn1Click(Sender: TObject);
begin
  memoPreSqlTempl.Text := trim(MemoPreSqlTempl.text);
  if(MemoPreSqlTempl.text = '')  then
    MemoPreSqlTempl.Text := ' '; //¿Õ¸ñ
  close;
end;

procedure TFormPreSqlOutTempl.BitBtn2Click(Sender: TObject);
begin
    MemoPreSqlTempl.Clear;
end;

procedure TFormPreSqlOutTempl.BitBtn3Click(Sender: TObject);
var
    i : integer;
    str: string;
begin
    str := '';

    for i := 1 to sg_sqlout.RowCount-1 do
    begin
        str := str+':'+sg_sqlout.cells[2,i]+'.'+sg_sqlout.cells[0,i]+',';
    end;
    if( length(str)>0 ) then
    begin
        MemoPreSqlTempl.text := copy(str,1,length(str)-1);
    end;
end;

end.
