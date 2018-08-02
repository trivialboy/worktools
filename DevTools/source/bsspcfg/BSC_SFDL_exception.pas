unit BSC_SFDL_exception;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  Tsfdl_exception = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    ed_errmsg: TEdit;
    ed_errclass: TEdit;
    ed_errcode: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  sfdl_exception: Tsfdl_exception;

implementation

{$R *.dfm}

end.
