unit BSC_SFDL_assign;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  Tsfdl_assign = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    cb_assign_ignore: TComboBox;
    Label2: TLabel;
    ed_assign_from: TEdit;
    Label3: TLabel;
    ed_assign_to: TEdit;
    BitBtn1: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  sfdl_assign: Tsfdl_assign;

implementation

{$R *.dfm}

end.
