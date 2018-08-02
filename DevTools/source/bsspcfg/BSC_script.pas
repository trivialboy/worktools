unit BSC_script;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls;

type
  TFormScript = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    RichEditScript: TRichEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    bbtnExecute: TBitBtn;
    procedure FormResize(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormScript: TFormScript;

implementation

{$R *.dfm}

procedure TFormScript.FormResize(Sender: TObject);
begin
  RichEditScript.Repaint;
end;

procedure TFormScript.BitBtn2Click(Sender: TObject);
begin
  RichEditScript.Lines.Clear;
end;

procedure TFormScript.BitBtn3Click(Sender: TObject);
begin
  RichEditScript.SelectAll;
  RichEditScript.CopyToClipboard;
end;

end.
