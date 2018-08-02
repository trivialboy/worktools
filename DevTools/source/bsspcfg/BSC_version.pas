unit BSC_version;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Grids;

type
  TFormVerUp = class(TForm)
    Panel1: TPanel;
    Memo1: TMemo;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    sgClient: TStringGrid;
    procedure Memo1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure updateSGClient(ts: tstrings);
  end;

var
  FormVerUp: TFormVerUp;

implementation

uses BSC_config;

{$R *.dfm}

procedure TFormVerUp.Memo1Change(Sender: TObject);
begin
    if( memo1.Lines.Count > 500 )  then
        memo1.Clear;
end;

procedure TFormVerUp.FormCreate(Sender: TObject);
//var
    //    tstringlist ts;
begin
//ts := tstringlist.create;

        sgClient.cells[0,0] := '序号';
        sgClient.cells[1,0] := 'IP地址';
        sgClient.cells[2,0] := '更新时间';
        sgClient.cells[3,0] := '内容';
        sgClient.cells[4,0] := '计数';

end;

procedure TFormVerUp.updateSGClient(ts: tstrings);
var
   i,idx,cnt : integer;
begin
//    formVerup.Memo1.Lines.Append('['+timetostr(Time)+']:['+ABinding.PeerIP+']:['+DataStringStream.DataString+']');
    formVerup.Memo1.Lines.Append('['+ts.strings[0]+']:['+ts.strings[1]+']:['+ts.strings[2]+']');
    idx := -1;
    for i := 1 to sgClient.RowCount-1 do
    begin
      if sgClient.cells[1,i] = ts.strings[1] then // ip
      begin
        idx := i;
        break;
      end;
    end;
    if idx < 0 then
    begin
        idx := sgclient.RowCount-1;
        sgclient.RowCount := sgclient.RowCount + 1;
        cnt := 0;
    end
    else
    begin
        cnt := strtoint(sgclient.cells[4,idx]);
    end;
        sgclient.Cells[0,idx] := inttostr(idx);
        sgclient.Cells[1,idx] := ts.strings[1];
        sgclient.Cells[2,idx] := ts.strings[0];
        sgclient.cells[3,idx] := ts.strings[2];
        sgclient.cells[4,idx] := inttostr(cnt+1);

end;

end.
