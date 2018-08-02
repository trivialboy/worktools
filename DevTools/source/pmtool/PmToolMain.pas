unit PmToolMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,  DB, MemDS, DBAccess, Ora, ComCtrls, StdCtrls,
  ExtCtrls, Grids, DBGrids,  Buttons, UnitFormFactory;

type
  TFormPMTool = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    StatusBar1: TStatusBar;
    oraQuery1: TOraQuery;
    GroupBox1: TGroupBox;
    cbHolder1: TComboBox;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    cbGroup1: TComboBox;
    RadioGroup1: TRadioGroup;
    cbNew1: TCheckBox;
    cbReqconfirmed1: TCheckBox;
    cbopen1: TCheckBox;
    BitBtn1: TBitBtn;
    edPrjId1: TLabeledEdit;
    cbfixed1: TCheckBox;
    cbreopen1: TCheckBox;
    cbstested1: TCheckBox;
    cbtested1: TCheckBox;
    cbreleased1: TCheckBox;
    cbclosed1: TCheckBox;
    DateTimePicker1: TDateTimePicker;
    edPlan: TRichEdit;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    lbedProject: TLabeledEdit;
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    cbHolder2: TComboBox;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    cbGroup2: TComboBox;
    DateTimePicker2: TDateTimePicker;
    cbReleaseTime1: TCheckBox;
    sgrid_query: TStringGrid;
    bbtn_checkout: TBitBtn;
    bbtn_opendir: TBitBtn;
    BitBtn4: TBitBtn;
    oraQa: TOraSession;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

//var
//  FormPMTool: TFormPMTool;
//-------------- �Ӵ��ڴ����߶��忪ʼ ---------------//
IFormCreator_PMTOOL = class(TInterfacedObject, IFormCreator)
    function CreateForm():TForm;
end;
//------------ �Ӵ��ڴ����߶������ -----------//

implementation

{$R *.dfm}
//-------------- �Ӵ��ڴ�����ʵ�ֿ�ʼ ---------------------//
function IFormCreator_PMTOOL.CreateForm():TForm;
begin
    Result := TFormPMTool.Create(nil);
end;
//-------------- �Ӵ��ڴ�����ʵ�ֽ��� ---------------------//


//////////////////////

procedure TFormPMTool.BitBtn1Click(Sender: TObject);
var
  strCond : string;
  sStatus : string;
  vRow:integer;
begin
  try
        oraQuery1.Close;
        oraQuery1.SQL.Clear;
        oraQuery1.SQL.Add('select '+
'bg_user_04||''-''||bg_user_17||''-''||bg_summary ��������, '+
'bg_responsible ��Ŀ������,'+
'bg_user_12 ������,'+
'BG_USER_07 �ͻ���������,'+
'bg_user_58 ���뿪ʼʱ��,'+
'BG_USER_13 �ƻ��ύʱ��,'+
'BG_USER_14 �ƻ�����ʱ��,'+
'BG_STATUS ״̬,'+
'BG_DESCRIPTION ��������,'+
'BG_DEV_COMMENTS ע��,'+
'BG_USER_35 ������Ա,'+
'BG_USER_36 ������Ա '+
'from ��֯����_REQTRACK_DB.BUG ');
        strCond := ' where 1=1 ';
       if cbHolder1.ItemIndex >0 then
       begin
           strCond := strCond+'and bg_responsible='''+cbHolder1.Text+''' ';
       end;
       if cbgroup1.ItemIndex > 0 then
       begin
           strCond := strCond+'and bg_user_12='''+cbgroup1.Text+''' ';
       end;
       sStatus := '';
       if cbNew1.Checked then
           sStatus := sStatus+',''new''';
       if cbReqconfirmed1.Checked then
           sStatus := sStatus+',''reqconfirmed''';
       if cbOpen1.Checked then
           sStatus := sStatus+',''open''';
       if cbFixed1.Checked then
           sStatus := sStatus+',''fixed''';
       if cbReopen1.Checked then
           sStatus := sStatus+',''reopen''';
       if cbstested1.Checked then
           sStatus := sStatus+',''s-tested''';
       if cbtested1.Checked then
           sStatus := sStatus+',''tested''';
       if cbreleased1.Checked then
           sStatus := sStatus+',''released''';
       if cbclosed1.Checked then
           sStatus := sStatus+',''closed''';

       if sStatus <> '' then
           strCond := strCond+ ' and lower(bg_status) in ( ''1'' '+ sStatus +') ';
       oraQuery1.SQL.Append(strCond + ' order by bg_user_04,bg_user_17 ' );

       sgrid_query.rowCount := 2;

       oraQuery1.Open;
       while not oraQuery1.Eof do
       begin
         with sgrid_query do
         begin
           vRow := rowCount-1;
           cells[0,vRow] := oraQuery1.fieldbyName('��������').asString;
           cells[1,vRow] := oraQuery1.fieldbyName('��Ŀ������').asString;
           cells[2,vRow] := oraQuery1.fieldbyName('������').asString;
           cells[3,vRow] := oraQuery1.fieldbyName('�ͻ���������').asString;
           cells[4,vRow] := oraQuery1.fieldbyName('���뿪ʼʱ��').asString;
           cells[5,vRow] := oraQuery1.fieldbyName('�ƻ��ύʱ��').asString;
           cells[6,vRow] := oraQuery1.fieldbyName('�ƻ�����ʱ��').asString;
           cells[7,vRow] := oraQuery1.fieldbyName('״̬').asString;
           cells[8,vRow] := oraQuery1.fieldbyName('������Ա').asString;
           cells[9,vRow] := oraQuery1.fieldbyName('������Ա').asString;
           //cells[10,row] := oraQuery1.fieldbyName('').asString;
           //cells[11,row] := oraQuery1.fieldbyName('').asString;
           rowcount := rowcount+1;
         end;
         oraQuery1.next;
       end;
  finally
        oraQuery1.Close;
  end;

end;

procedure TFormPMTool.BitBtn4Click(Sender: TObject);
begin
oraqa.open;
end;

procedure TFormPMTool.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    oraqa.Close;
    action := caFree;

end;

///////////////////////////////
initialization
  //ע�Ṥ����
  //RegisteFormFactory('PM����(&M)',IFormCreator_PMTOOL.create);

end.
