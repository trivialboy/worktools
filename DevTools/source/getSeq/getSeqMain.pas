unit getSeqMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, DB, MemDS, DBAccess, Ora, Buttons, ExtCtrls,
  UnitFormFactory, inifiles;

type
  TFormGetSeq = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    oseDev: TOraSession;
    oseTest: TOraSession;
    oseHuigui: TOraSession;
    oqryDev: TOraQuery;
    memoOutput: TMemo;
    cboxBssp: TComboBox;
    StaticText1: TStaticText;
    rdgroupBssp: TRadioGroup;
    bbtnBsspGen: TBitBtn;
    oraStoredProcDev: TOraStoredProc;
    OraStoredProcTest: TOraStoredProc;
    OraStoredProcHuigui: TOraStoredProc;
    GroupBox1: TGroupBox;
    cboxDev: TCheckBox;
    cboxTest: TCheckBox;
    cboxHuigui: TCheckBox;
    StaticText4: TStaticText;
    Button1: TButton;
    Panel1: TPanel;
    edTag: TEdit;
    ckboxTag: TCheckBox;
    Button2: TButton;
    Panel2: TPanel;
    GroupBox4: TGroupBox;
    cboxPortal: TComboBox;
    bbtnPortalGen: TBitBtn;
    bbtnPortalCopy: TBitBtn;
    StaticText2: TStaticText;
    UpDown1: TUpDown;
    lbedPortalAmount: TLabeledEdit;
    GroupBox5: TGroupBox;
    cboxSysfunc: TComboBox;
    bbtnFuncGen: TBitBtn;
    bbtnFuncCopy: TBitBtn;
    StaticText3: TStaticText;
    lbedSysfuncAmount: TLabeledEdit;
    UpDown2: TUpDown;
    StaticText6: TStaticText;
    GroupBox6: TGroupBox;
    ckboxBssp: TCheckBox;
    edBsspTag: TEdit;
    StaticText5: TStaticText;
    lbedBsspAmount: TLabeledEdit;
    UpDown3: TUpDown;
    bbtnBsspCopy: TBitBtn;
    procedure bbtnPortalGenClick(Sender: TObject);
    procedure bbtnPortalCopyClick(Sender: TObject);
    procedure bbtnFuncCopyClick(Sender: TObject);
    procedure bbtnFuncGenClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure memoSysfuncKeyPress(Sender: TObject; var Key: Char);
    procedure memoPortalKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure bbtnBsspCopyClick(Sender: TObject);
    procedure bbtnBsspGenClick(Sender: TObject);
    procedure memoOutputKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure rdgroupBsspClick(Sender: TObject);
  private
    { Private declarations }
    sOraBsspDev, sOraBsspTest, sOraBsspHuigui : string;
    sOraFuncDev, sOraFuncTest, sOraFuncHuigui : string;

    function getOneId( idType,idStart,strTag : string; oSession : TOraSession ) : string;
    function checkId( idType,id : string; oStoreProc: TOraStoredProc;oSession : TOraSession ) : boolean;
    procedure genId( idType,idStart,strTag : string; amount : integer; var memo : TMemo  );
    function verifyId( idType,idStart,strId : string ) : integer;
    //procedure showId( idType,idStart,strTag : string; amount : integer; var memo : TMemo );
    procedure setBadId( idType,idStart,strId  : string; oSession : TOraSession );
    function getBsspIdType():string;
    procedure DBConnect(idType : string);
    procedure initTypeList(idType : string; cbox : TComboBox );
    procedure copyResult();
  public
    { Public declarations }
  end;

//var
//  FormGetSeq: TFormGetSeq;
//-------------- 子窗口创建者定义开始 ---------------//
IFormCreator_GENSEQ = class(TInterfacedObject, IFormCreator)
    function CreateForm():TForm;
end;
//------------ 子窗口创建者定义结束 -----------//

implementation

{$R *.dfm}

//-------------- 子窗口创建者实现开始 ---------------------//
function IFormCreator_GENSEQ.CreateForm():TForm;
begin
    Result := TFormGetSeq.Create(nil);
end;
//-------------- 子窗口创建者实现结束 ---------------------//
procedure TFormGetSeq.DBConnect(idType : string);
begin
  oseDev.close;
  oseTest.close;
  oseHuigui.Close;
  
  if idType='BSSP' then
  begin
    oseDev.ConnectString    := sOraBsspDev;
    oseTest.ConnectString   := sOraBsspTest;
    oseHuigui.ConnectString := sOraBsspHuigui;
  end
  else if idType='FUNC' then
  begin
    oseDev.ConnectString    := sOraFuncDev;
    oseTest.ConnectString   := sOraFuncTest;
    oseHuigui.ConnectString := sOraFuncHuigui;
  end;

  oseDev.open;
  if cboxTest.Checked then oseTest.open;
  if cboxHuigui.Checked then  oseHuigui.open;

end;

procedure TFormGetSeq.setBadId( idType,idStart,strId  : string; oSession : TOraSession );
begin
//DONE: 调用sql存储过程, 获取一个编码
//DevTools_UpdatePreUseIDtoUsed(TABLE_NAME,MAIN_TYPE,PRE_USE_ID); --更新状态为已使用的过程
  //oSession.Open;
  with oraStoredProcdev do
  begin
    StoredProcName := 'DevTools_UpdatePreUseIDtoUsed';
    Prepare;
    ParamByName('vTABLE_NAME').AsString := idType;
    ParamByName('vMAIN_TYPE').AsString := idStart;
    ParamByName('PRE_USE_ID').AsString := strId;
    Execute;
  end;
  //oSession.Close;
end;

function TFormGetSeq.getOneId( idType,idStart,strTag : string ; oSession : TOraSession) : string;
var
  preUseId : string;
begin
  //DONE: 设置为不可用的编码
  //DevTools_GetPreUseID(TABLE_NAME,MAIN_TYPE,USE_PEOPLE,PRE_USE_ID);
  //oSession.Open;
  with oraStoredProcdev do
  begin
    StoredProcName := 'DevTools_GetPreUseID';
    Prepare;
    ParamByName('vTABLE_NAME').AsString := idType;
    ParamByName('vMAIN_TYPE').AsString := idStart;
    ParamByName('vUSE_PEOPLE').AsString := strTag;
    ParamByName('PRE_USE_ID').ParamType := ptOutput;
    Execute;
    preUseId := ParamByName('PRE_USE_ID').AsString ;
  end;
  //oSession.Close;
  //result := idType+'_'+id+'('+tag+')';   // 临时返还值
  result := preUseId;
end;

function TFormGetSeq.checkId( idType,id : string; oStoreProc: TOraStoredProc; oSession : TOraSession ) : boolean;
var
  check_result : integer;
begin
  //DONE: 调用sql存储过程, 校验编码是否可用, 需要在 开发/测试/回归环境 查询确认

  //devtools_CheckPreUseID(TABLE_NAME,PRE_USE_ID,RESULT);
  //oSession.Open;
  with oStoreProc do
  begin
    StoredProcName := 'devtools_CheckPreUseID';
    Prepare;
    ParamByName('TABLE_NAME').AsString := idType;
    ParamByName('PRE_USE_ID').AsString := id;
    ParamByName('RESULT').ParamType := ptOutput;
    Execute;
    check_result := ParamByName('RESULT').AsInteger ;
    close;
  end;
  if check_result = 0 then
    result := true
  else
    result := false;
  //oSession.Close;
end;

function TFormGetSeq.verifyId( idType,idStart,strId : string ) : integer;
var
  checkResult : integer;
begin
    checkResult := 1;
    if cboxDev.Checked then
      if checkId(idType,strId,oraStoredProcDev,oseDev )=false then checkResult:=0;
    if cboxTest.Checked then
      if (checkResult = 1) and (checkId(idType,strId,oraStoredProcTest,oseTest)=false) then  checkResult:=0;
    if cboxHuigui.Checked then
      if (checkResult = 1) and (checkId(idType,strId,oraStoredProcHuigui,oseHuigui)=false) then  checkResult:=0;
    if checkResult = 0 then
    begin
      setBadId(idType,idStart,strId,oseDev);
    end;
    result := checkResult;
end;

procedure TFormGetSeq.genId( idType,idStart,strTag : string; amount : integer;var memo : TMemo  );
var
  strId : string;
  count, checkResult,limit : integer;
begin
  limit := 200;

  count := amount;
  memo.Lines.Clear;
  //DONE: 生成指定类型的编码,并进行校验

  // 先查询已预占的ID数据, 若不足再申请新的ID
  oqryDev.Close;
  oqryDev.SQL.Text := 'select id from devtools_common_id_map where table_name=:v1 and main_type=:v2 and status=2 and use_people=:v3 and rownum<=:v4';
  oqryDev.ParamByName('v1').AsString := idType;
  oqryDev.ParamByName('v2').AsString := idStart;
  oqryDev.ParamByName('v3').AsString := strTag;
  oqryDev.ParamByName('v4').AsInteger := amount;
  oqryDev.Open;
  while not oqryDev.Eof do
  begin
    strId := oqryDev.fieldByName('id').AsString;
    checkResult := verifyId(idType,idStart,strId);
    if checkResult = 1 then
    begin
      memo.Lines.Add(strId);
      count := count-1;
    end;
    oqryDev.Next;
  end;
  oqryDev.Close;


  //若不足,再申请新的ID   : 待分配ID池不足的时候, 需要手工(或定时任务)扩充
  while (limit>0) and (count>0) do
  begin
    limit := limit -1; // 控制总循环次数,不能循环太多次
    strId := getOneId(idType,idStart,strTag,oseDev);  //生成1条
    if strId = '' then
    begin
      showmessage('取编码失败');
      break;  // 取不到数据, 跳出
    end;
    // 在开发,测试,回归环境校验
    checkResult := verifyId(idType,idStart,strId);
    if checkResult = 0 then
    begin
      continue;
    end;
    memo.Lines.Add(strId);
    count := count-1;
  end;

  if count>0 then
    showmessage('本次ID分配完成 '+inttostr(amount-count)+'/'+inttostr(amount)+' 编码, 不足部分建议联系管理员补充基准库数据!');

end;


procedure TFormGetSeq.bbtnPortalGenClick(Sender: TObject);
var
 tag : string;  //个人标签
 idType, idStart : string; //类型, 起始编码
 amount : integer; //数量
 pos1, pos2: integer;
begin

  //DONE:生成 PORTAL FUNCTION 编码
  idType := 'PORTAL_FUNCTION_ID';

  if ckboxTag.Checked then
  begin
    tag := trim(edTag.text);
    if tag='' then
    begin
      showmessage('个人标签不能为空,建议填写个人姓名等个性化内容且保持不变!');
      exit;
    end;
  end;

  //数量
  amount := strtoint(lbedPortalAmount.text);
  if (amount<=0) or (amount>50) then
  begin
    showmessage('数量需要大于0且小于50!');
    exit;
  end;

  //挑出号头
  pos1 :=  pos(':', cboxportal.Text );
  if pos1>0 then pos1 := pos1+1;
  pos2 := pos('%',  cboxportal.Text );
  idStart :=  copy( cboxportal.Text, pos1, pos2-pos1 );
  if (idStart='') or (strtoint(idStart)=0)  then
  begin
    showmessage('错误的起始编码,请重新选择或填写!');
    exit;
  end;

  //调用存储过程获取数据
  // 参数: 个人标签 tag, 类型 idType, 起始编码 idStart , 数量
  genId(idType,idStart,tag,amount,memoOutput);

  //memo展示获取的编码
  //showId(idType,idStart,tag,amount,memoPortal);
end;

procedure TFormGetSeq.bbtnPortalCopyClick(Sender: TObject);
begin
  copyResult();
end;

procedure TFormGetSeq.bbtnFuncGenClick(Sender: TObject);
var
 tag : string;  //个人标签
 idType, idStart : string; //类型, 起始编码
 amount : integer; //数量
 pos1, pos2: integer;
begin
  
  //DONE:生成 SYSTEM FUNCTION 编码
  idType := 'SYSTEM_FUNCTION_ID';

  if ckboxTag.Checked then
  begin
    tag := trim(edTag.text);
    if tag='' then
    begin
      showmessage('个人标签不能为空,建议填写个人姓名等个性化内容且保持不变!');
      exit;
    end;
  end;

  //数量
  amount := strtoint(lbedSysfuncAmount.text);
  if ( amount<=0) or (amount>50 ) then
  begin
    showmessage('数量需要大于0且小于50!');
    exit;
  end;
  //挑出号头
  pos1 :=  pos(':', cboxsysfunc.Text );
  if pos1>0 then pos1 := pos1+1;
  pos2 := pos('%',  cboxsysfunc.Text );
  idStart :=  copy( cboxsysfunc.Text, pos1, pos2-pos1 );
  if (idStart='') or (strtoint(idStart)=0)  then
  begin
    showmessage('错误的起始编码,请重新选择或填写!');
    exit;
  end;

  //调用存储过程获取数据
  // 参数: 个人标签 tag, 类型 idType, 起始编码 idStart , 数量 amount
  genId(idType,idStart,tag,amount,memoOutput);

  //memo展示获取的编码
  //showId(idType,idStart,tag,amount,memoSysfunc);
end;

procedure TFormGetSeq.bbtnFuncCopyClick(Sender: TObject);
begin
  copyResult();
end;

procedure TFormGetSeq.FormClose(Sender: TObject; var Action: TCloseAction);
var
  iniFile : string;
  myinifile : TiniFile;
begin
        ACTION := caFree;

      iniFile := copy(Application.ExeName,1,length(Application.ExeName)-4) +'.ini';
      myinifile:=Tinifile.create(iniFile);

      myIniFile.WriteString('GEN_ID','PORTAL_TAG',edtag.Text);
      myIniFile.WriteString('GEN_ID','SYSFUNC_TAG',edtag.Text);
      myIniFile.WriteString('GEN_ID','BSSP_TAG',edbssptag.text);

      myIniFile.WriteString('GEN_ID','ORA_BSSP_DEV',sOraBsspDev);
      myIniFile.WriteString('GEN_ID','ORA_BSSP_TEST',sOraBsspTest);
      myIniFile.WriteString('GEN_ID','ORA_BSSP_HUIGUI',sOraBsspHuigui);

      myIniFile.WriteString('GEN_ID','ORA_FUNC_DEV',sOraFuncDev);
      myIniFile.WriteString('GEN_ID','ORA_FUNC_TEST',sOraFuncDev);
      myIniFile.WriteString('GEN_ID','ORA_FUNC_HUIGUI',sOraFuncDev);

      myIniFile.Free;
      try
        oseDev.Close;
      except
        //do nothing
      end;

      try
        oseTest.Close;
      except
        //do nothing
      end;

      try
        oseHuigui.close;
      except
        //do nothing
      end;
      
end;

procedure TFormGetSeq.memoSysfuncKeyPress(Sender: TObject; var Key: Char);
begin
    if( key = #1 ) then
        TMemo(sender).SelectAll;

end;

procedure TFormGetSeq.memoPortalKeyPress(Sender: TObject; var Key: Char);
begin
    if( key = #1 ) then
        TMemo(sender).SelectAll;

end;

procedure TFormGetSeq.FormShow(Sender: TObject);
var
    iniFile : string;
    myinifile : TIniFile;
begin
  pagecontrol1.ActivePageIndex := 0;
  iniFile := copy(Application.ExeName,1,length(Application.ExeName)-4) +'.ini';
  myinifile:=Tinifile.create(iniFile);
  try
    //edtag.Text := myIniFile.ReadString('GEN_ID','PORTAL_TAG','');
    edtag.Text := myIniFile.ReadString('GEN_ID','SYSFUNC_TAG','');
    edbssptag.Text := myIniFile.ReadString('GEN_ID','BSSP_TAG','');

    sOraBsspDev    := myIniFile.ReadString('GEN_ID','ORA_BSSP_DEV','bssp/bssp@10.1.0.220:1521:kf');
    sOraBsspTest   := myIniFile.ReadString('GEN_ID','ORA_BSSP_TEST','bssp/bssp@10.46.158.22:1521:wjjs');
    sOraBsspHuigui := myIniFile.ReadString('GEN_ID','ORA_BSSP_HUIGUI','bssp/bssp@10.46.158.21:1521:arcdb');

    sOraFuncDev    := myIniFile.ReadString('GEN_ID','ORA_FUNC_DEV','bopsys/bopsys@10.1.0.220:1521:kf');
    sOraFuncTest   := myIniFile.ReadString('GEN_ID','ORA_FUNC_TEST','bopsys/bopsys@10.1.0.220:1521:kf');
    sOraFuncHuigui := myIniFile.ReadString('GEN_ID','ORA_FUNC_HUIGUI','bopsys/bopsys@10.1.0.220:1521:kf');

  finally
    myIniFile.Free;
  end;


end;

procedure TFormGetSeq.bbtnBsspCopyClick(Sender: TObject);
begin
  copyResult();
end;
function TFormGetSeq.getBsspIdType():string;
var
  idType : string;
begin
  case rdgroupbssp.ItemIndex of
    0: idType := 'BSSP.BSSP_BUSINESS';
    1: idType := 'BSSP.BSSP_PROCESS';
    2: idType := 'BSSP.BSSP_SERVICE';
  end;
  result := idType;
end;

procedure TFormGetSeq.bbtnBsspGenClick(Sender: TObject);
var
 tag : string;  //个人标签
 idType, idStart : string; //类型, 起始编码
 amount : integer; //数量
 pos1, pos2: integer;
begin
  
  //DONE: 生成bssp编码
  idType := getBsspIdType();


  if ckboxBssp.Checked then
  begin
    tag := trim(edBsspTag.text);
    if tag='' then
    begin
      showmessage('个人标签不能为空,建议填写个人姓名等个性化内容且保持不变!');
      exit;
    end;
  end;

  //数量
  amount := strtoint(lbedBsspAmount.text);
  if ( amount<=0) or (amount>50 ) then
  begin
    showmessage('数量需要大于0且小于50!');
    exit;
  end;
  //挑出号头
  pos1 :=  pos(':', cboxBssp.Text );
  if pos1>0 then pos1 := pos1+1;
  pos2 := pos('%',  cboxBssp.Text );
  idStart :=  copy( cboxBssp.Text, pos1, pos2-pos1 );
  if (idStart='') or (strtoint(idStart)=0)   then
  begin
    showmessage('错误的起始编码,请重新选择或填写!');
    exit;
  end;

  //调用存储过程获取数据
  // 参数: 个人标签 tag, 类型 idType, 起始编码 idStart , 数量 amount
  genId(idType,idStart,tag,amount,memoOutput);

end;

procedure TFormGetSeq.memoOutputKeyPress(Sender: TObject; var Key: Char);
begin
    if( key = #1 ) then
        TMemo(sender).SelectAll;

end;

procedure TFormGetSeq.initTypeList(idType : string; cbox : TComboBox );
var
  str : string;
begin
  cbox.Clear;
  oqryDev.Close;
  oqryDev.SQL.Text := 'select type_name,id_type from devtools_id_type_config where table_name='''+idType+''' order by seq_id asc ';
  oqryDev.Open;
  while not oqryDev.Eof do
  begin
    str := oqryDev.fieldbyName('type_name').AsString +':'+oqryDev.fieldbyName('id_type').asstring+'%';
    cbox.Items.Add(str);
    oqryDev.Next;
  end;
  oqryDev.Close;
end;

procedure TFormGetSeq.Button1Click(Sender: TObject);
var
  idType : string;
begin
  bbtnPortalGen.Enabled := false;
  bbtnPortalCopy.Enabled := false;
  bbtnFuncGen.Enabled := false;
  bbtnFuncCopy.Enabled := false;

  DBConnect('BSSP');
  idType := getBsspIdType();
  initTypeList(idType,cboxBssp);

  bbtnBsspGen.Enabled := true;
  bbtnBsspCopy.Enabled := true;
  rdgroupBssp.Enabled := true;
end;

procedure TFormGetSeq.Button2Click(Sender: TObject);
var
  idType : string;
begin
  bbtnBsspGen.Enabled := false;
  bbtnBsspCopy.Enabled := false;
  rdgroupBssp.Enabled := false;

  DBConnect('FUNC');
  idType := 'PORTAL_FUNCTION_ID';
  initTypeList(idType,cboxPortal);
  idType := 'SYSTEM_FUNCTION_ID';
  initTypeList(idType,cboxSysfunc);

  bbtnPortalGen.Enabled := true;
  bbtnPortalCopy.Enabled := true;
  bbtnFuncGen.Enabled := true;
  bbtnFuncCopy.Enabled := true;
end;

procedure TFormGetSeq.rdgroupBsspClick(Sender: TObject);
VAR
  idType : string;
begin
  idType := getBsspIdType();
  initTypeList(idType,cboxBssp);
end;

procedure TFormGetSeq.copyResult();
begin
  memoOutput.SelectAll;
  memoOutput.CopyToClipboard;

end;


initialization
///////////////////////////////
  //注册工具类
  RegisteFormFactory('ID分配(&F)',IFormCreator_GENSEQ.create);

end.
