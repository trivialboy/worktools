unit BSC_prefabsql;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  TFormPrefabSql = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    MemoSQL: TRichEdit;
    BitBtn3: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrefabSql: TFormPrefabSql;

implementation

{$R *.dfm}

procedure TFormPrefabSql.BitBtn1Click(Sender: TObject);
begin
    ModalResult := mrOK;
end;

procedure TFormPrefabSql.BitBtn2Click(Sender: TObject);
begin
    MemoSQL.Clear;
end;

end.
