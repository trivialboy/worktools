unit UnitHeader;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFormHeader = class(TForm)
    Memo1: TMemo;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    headStr : string;
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

procedure TFormHeader.FormShow(Sender: TObject);
begin
    headStr := memo1.Text;
end;

procedure TFormHeader.BitBtn1Click(Sender: TObject);
begin
  memo1.Text := headStr;
end;

procedure TFormHeader.BitBtn2Click(Sender: TObject);
begin
  //去掉头尾多余的回车换行,校验格式是否 key:value 样式
  memo1.Text := trim(memo1.Text)
end;

end.
