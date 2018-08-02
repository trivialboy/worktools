unit BSC_process_def;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  Tsfdl_process_def = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    ed_process_def: TEdit;
    BitBtn1: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  sfdl_process_def: Tsfdl_process_def;

implementation

{$R *.dfm}

end.
