unit BSC_SFDL_error;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  Tsfdl_error = class(TForm)
    Panel1: TPanel;
    ed_errclass: TEdit;
    StaticText1: TStaticText;
    BitBtn1: TBitBtn;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    ed_errcode: TEdit;
    ed_errmsg: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  sfdl_error: Tsfdl_error;

implementation

{$R *.dfm}

end.
