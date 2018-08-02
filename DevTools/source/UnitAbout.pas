unit UnitAbout;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, ShellApi;

type
  TFormAbout = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    StaticText1: TStaticText;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Label1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

//var
//  FormAbout: TFormAbout;

implementation

{$R *.dfm}

procedure TFormAbout.Button1Click(Sender: TObject);
begin
    close;
end;

procedure TFormAbout.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    action := caFree;
end;

procedure TFormAbout.Label1Click(Sender: TObject);
begin
    ShellExecute(Self.Handle,'Open',PChar('mailto:huangwt@fmcc.boss'),nil,nil,SW_SHOWNORMAL);
end;

end.
