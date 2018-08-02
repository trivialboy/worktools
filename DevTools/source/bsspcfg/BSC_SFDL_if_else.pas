unit BSC_SFDL_if_else;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  Tsfdl_if = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    ed_condition: TEdit;
    BitBtn1: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  sfdl_if: Tsfdl_if;

implementation

{$R *.dfm}

end.
