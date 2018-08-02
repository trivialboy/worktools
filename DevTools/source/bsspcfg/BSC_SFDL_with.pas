unit BSC_SFDL_with;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  Tsfdl_with = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    ed_from: TEdit;
    ed_to: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  sfdl_with: Tsfdl_with;

implementation

{$R *.dfm}

end.
