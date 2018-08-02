unit BSC_SFDL_process_step;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  Tsfdl_process_step = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    ed_process_step: TEdit;
    BitBtn1: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  sfdl_process_step: Tsfdl_process_step;

implementation

{$R *.dfm}

end.
