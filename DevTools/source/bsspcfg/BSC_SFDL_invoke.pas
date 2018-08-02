unit BSC_SFDL_invoke;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  Tsfdl_invoke = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    ed_invoke_id: TEdit;
    Label2: TLabel;
    cb_invoke_type: TComboBox;
    Label3: TLabel;
    cb_invoke_exception: TComboBox;
    Label4: TLabel;
    cb_invoke_flag: TComboBox;
    BitBtn1: TBitBtn;
    StaticText1: TStaticText;
    ed_name: TEdit;
    StaticText2: TStaticText;
    cb_record_accept_detail: TCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  sfdl_invoke: Tsfdl_invoke;

implementation

{$R *.dfm}

end.
