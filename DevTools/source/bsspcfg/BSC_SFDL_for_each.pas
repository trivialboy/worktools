unit BSC_SFDL_for_each;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  Tsfdl_for_each = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    ed_for_index: TEdit;
    Label2: TLabel;
    ed_for_var: TEdit;
    BitBtn1: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  sfdl_for_each: Tsfdl_for_each;

implementation

{$R *.dfm}

end.
