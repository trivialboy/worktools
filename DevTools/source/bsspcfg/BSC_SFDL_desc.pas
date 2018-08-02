unit BSC_SFDL_desc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  Tsfdl_description = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    ed_description: TEdit;
    BitBtn1: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  sfdl_description: Tsfdl_description;

implementation

{$R *.dfm}

end.
