unit UnitReckonHelp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFormReckonHelp = class(TForm)
    Memo1: TMemo;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormReckonHelp: TFormReckonHelp;

implementation

{$R *.dfm}

procedure TFormReckonHelp.BitBtn1Click(Sender: TObject);
begin
close;
end;

end.
