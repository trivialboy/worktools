unit BSC_SFDL_transaction;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, Buttons, ExtCtrls;

type
  Tsfdl_transaction = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    sped_timeout: TSpinEdit;
    cb_type: TComboBox;
    StaticText4: TStaticText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  sfdl_transaction: Tsfdl_transaction;

implementation

{$R *.dfm}

end.
