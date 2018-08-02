unit UnitBatch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFormCvsBatch = class(TForm)
    Panel1: TPanel;
    Memo1: TMemo;
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure Memo1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    m_strMemo: string;
  public
    { Public declarations }
  end;

var
  FormCvsBatch: TFormCvsBatch;

implementation

{$R *.dfm}

procedure TFormCvsBatch.btnOkClick(Sender: TObject);
var
  i : integer;
begin
 // ½«¿ÕÐÐÉ¾³ý
 for i := memo1.Lines.Count-1 downto 0 do
 begin
 if trim(memo1.Lines.Strings[i])='' then memo1.Lines.Delete(i);
 end;
close;
end;

procedure TFormCvsBatch.btnCancelClick(Sender: TObject);
begin
  memo1.Text := m_strMemo;
close;
end;

procedure TFormCvsBatch.Memo1KeyPress(Sender: TObject; var Key: Char);
begin
    if( key = #1 ) then
        TMemo(sender).SelectAll;

end;

procedure TFormCvsBatch.FormShow(Sender: TObject);
begin
    m_strMemo := memo1.Text;
end;

end.
