unit UnitUpdate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ShellApi, ExtCtrls;


type
  TFormUpdate = class(TForm)
    Panel2: TPanel;
    memoNewVer: TMemo;
    Panel1: TPanel;
    Button1: TButton;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure lbEmailClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
  private
    { Private declarations }
    mVer : string;
    mNewVer : string;
    mNewHint : string;
  public
    { Public declarations }
    procedure setVersion(ver : string; newVer : string ; newVerHint : string );
  end;

var
  FormUpdate: TFormUpdate;

implementation

uses MainFrame;

{$R *.dfm}
procedure TFormUpdate.setVersion(ver : string; newVer : string ; newVerHint : string );
begin
  mVer := ver;
  mNewVer := newVer;
  mNewHint := newVerHint;
end;

procedure TFormUpdate.FormShow(Sender: TObject);
begin
    if( mNewVer > mVer ) then
    begin
        memoNewVer.Text := '����ǰ�İ汾: '+mVer+', �����°汾:'+mNewVer+', �뼰ʱ������';
    end
    else
    begin
        memoNewVer.Text := '����ǰ�İ汾:'+mVer+', ���°汾:'+mNewVer+', ����������';
    end;
    label1.Caption := '���ɷ������µ�ַ��ȡ���°汾��'#10'http://10.1.0.195:8088/hdwiki/index.php?doc-view-513'
end;

procedure TFormUpdate.lbEmailClick(Sender: TObject);
begin
    ShellExecute(Self.Handle,'Open',PChar('mailto:huangwt@fmcc.boss'),nil,nil,SW_SHOWNORMAL);
end;

procedure TFormUpdate.Button1Click(Sender: TObject);
begin
close;
end;

procedure TFormUpdate.Label1Click(Sender: TObject);
begin
    ShellExecute(Self.Handle,'open',PChar(FormDevToolsMain.getVersionUrl()),nil,nil,SW_SHOWNORMAL);
end;

end.
