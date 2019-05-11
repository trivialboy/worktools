unit UnitTestData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MemDS, DBAccess, Ora, StdCtrls, ExtCtrls, Buttons,
  UnitFormFactory, ComCtrls,IniFiles,UnitTestDataDesc;

type

COL_TYPE = (ORA_CHAR,ORA_DATE,ORA_NUMBER,ORA_VARCHAR2);
//数据表字段属性
CTableCol = class
    colName : string;    //列名
    colType : COL_TYPE;  //类型
    colTypeName : string ; // 类型名称
    colLen  : integer;   //长度
    isKey : boolean;
  private
  public
end;
//用户数据表
CUserTable = class
    sTableName : string;   //表名
    sKeyColumns : TStringList;         //关键字段
//    sKeyValues : TStringList;    //关键字段对应内部变量名
    nColsCnt : integer;    //字段个数
    arrColumns : array of CTableCol;   //字段明细(数组)
    sGetFieldsStr,sInsFieldsStr  : string; // select, insert 字段串
    sGetCondition,sDelCondition : string; // select, delete 条件
    sInsertFunc : string; // insert 函数
    nTabSeq : integer; //同名表序号，第一个为0
    sProcName : string ; //脚本过程名称，多个同名表有多个过程名
  private
    procedure setKey(str : string; m_KeyColumnName : TStringList);//分解并设置关键字段含义
    procedure genInsertFunc(); //构造insert函数
  public
  end;
//用户关键信息
CUserInfo = class
    nHomeCity : integer; // 地市
    sMsisdn : string; //号码
    sUserId : string; //用户标识
    sCustomerId : string; //客户标识
    sMtvAccount : string;
    sItvAccount : string;
    sBroadbandAccount : string;
    sKeyValues : TStringList; //内部变量名对应值
    sKeyType : TStringList; //内部变量类型
  private
  public
  end;
//用户信息组(可能存在多个用户数据)
CUsers = class
    nUserCnt : integer; //
    arrUserInfo : array of CUserInfo;
  private
  public
  end;

  TFormTestData = class(TForm)
    oraConn: TOraSession;
    oraQry: TOraQuery;
    Panel1: TPanel;
    MemoExport: TMemo;
    Panel2: TPanel;
    GroupBox2: TGroupBox;
    StaticText42: TStaticText;
    CB_TNS_NAME: TComboBox;
    bbtnDbOpen: TBitBtn;
    bbtnDbClose: TBitBtn;
    ledDbUser: TLabeledEdit;
    ledDbPass: TLabeledEdit;
    Panel3: TPanel;
    bbtExport: TBitBtn;
    BitBtn1: TBitBtn;
    Panel4: TPanel;
    memoTables: TMemo;
    Panel5: TPanel;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText2: TStaticText;
    stextSqlFile: TStaticText;
    lbedtMsisdn: TLabeledEdit;
    StatusBar1: TStatusBar;
    StaticText5: TStaticText;
    cbAccountType: TComboBox;
    Label1: TLabel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    SpeedButton1: TSpeedButton;
    procedure bbtnDbOpenClick(Sender: TObject);
    procedure bbtnDbCloseClick(Sender: TObject);
    procedure bbtExportClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MemoExportKeyPress(Sender: TObject; var Key: Char);
    procedure memoTablesKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

  private
    { Private declarations }
    m_users : CUsers;   // 本次采集的用户核心信息
    m_tables : TStringList ; // 本次采集的表集合
    m_KeyColumnName : TStringList; //系统支持的内部变量名称
    m_sqlFile : string; //加载的sql脚本名称
    FormTestDataDesc: TFormTestDataDesc;

    procedure initVar();
    procedure setButton4DBOpen();
    procedure setButton4DBClose();
    procedure getTableInfo( tab : CUserTable);
    function buildSQL(userInfo:CUserInfo; tab : CUserTable):string;
    procedure getUserInfo();
    procedure exportSQL();
    procedure prepareTargetTables();
    procedure getMsisdnUserInfo();
    procedure getMtvUserInfo();
    procedure getItvUserInfo();
    procedure getBroadbandUserInfo();
    procedure getBaseUserInfo(account : string);
    procedure setTableSeq(var table : CUserTable);
  public
    { Public declarations }
  end;



//-------------- 子窗口创建者定义开始 ---------------//
IFormCreator_TestUnit = class(TInterfacedObject, IFormCreator)
    function CreateForm():TForm;
end;
//------------ 子窗口创建者定义结束 -----------//

implementation
uses UnitPublic;


{$R *.dfm}
//-------------- 子窗口创建者实现开始 ---------------------//
function IFormCreator_TestUnit.CreateForm():TForm;
begin
    Result := TFormTestData.Create(nil);
end;
//-------------- 子窗口创建者实现结束 ---------------------//


procedure CUserTable.genInsertFunc();
var
  str, funcStr: string;
  i,j : integer;
  col : CTableCol;
begin
  //
  funcStr := 'PROCEDURE in_'+self.sProcName +'(';
  //字段参数
  str := '@';
  for i :=0 to self.sKeyColumns.Count -1 do
  begin
    str := str+','+self.sKeyColumns.Names[i];
    for j :=0 to self.nColsCnt-1 do
    begin
      col := self.arrColumns[j];
      if col.colName = self.sKeyColumns.Names[i] then
      begin
        str := str+ ' '+col.colTypeName ;
      end;
    end;
  end;

  for i :=0 to self.nColsCnt-1 do
  begin
    col := self.arrColumns[i];
    if col.isKey then continue;
    str := str+','+col.colName + ' '+col.colTypeName ;
  end;

  str := stringReplace(str, '@,','',[rfReplaceAll]);
  funcStr := funcStr + str +') is'+#13#10;
  funcStr := funcStr + '  BEGIN'+#13#10;
  funcStr := funcStr + '    INSERT INTO '+self.sTableName+'(';
  //insert 语句
  str := '@';
  for i :=0 to self.sKeyColumns.Count -1 do
  begin
    str := str+','+self.sKeyColumns.Names[i];
  end;

  for i :=0 to self.nColsCnt-1 do
  begin
    col := self.arrColumns[i];
    if col.isKey then continue;
    str := str+','+col.colName ;
  end;
  str := stringReplace(str, '@,','',[rfReplaceAll]);
  funcStr := funcStr + str+ ')'+#13#10+'    VALUES( '+str+');'+#13#10;
  funcStr := funcStr + '  END;'#13#10;

  self.sInsertFunc := funcStr;

end;

procedure CUserTable.setKey(str:string; m_KeyColumnName : TStringList);
var
  strList, str2: TStringList;
  i,idx : integer;
  s, key : string;
  found : boolean;
begin
  self.sKeyColumns := TStringList.create;
  strList := split(str,',');
  if((str='') or (strList.Count=0)) then
  begin    //无设置, 默认为 home_city=vHomeCity, user_id=vUserId
    self.sKeyColumns.Values['HOME_CITY'] := 'vHomeCity';
    self.sKeyColumns.Values['USER_ID'] := 'vUserId';
  end
  else
  begin
    for i :=0 to strList.Count-1 do
    begin
      str2 := split(strList[i],'=');
      if str2.count<2 then
      begin
        s := self.sTableName+'['+strList[i]+']';
        strList.Free;
        str2.Free;
        raise exception.Create( s+' "关键字段=内部变量" 设置错误 ');
      end;
      found := false;
      for idx :=0 to  m_KeyColumnName.Count -1 do
      begin
      if uppercase(m_KeyColumnName[idx]) = uppercase(str2[1]) then
      begin
        found := true;
        key := m_KeyColumnName[idx];
        break;
      end;
      end;
      if not found then
      begin
        s := self.sTableName+'['+str2[0]+'='+str2[1]+']';
        strList.Free;
        str2.Free;
        raise exception.Create(s+' 字段对应内部属性设置错误');
      end;
      self.sKeyColumns.Values[uppercase(trim(str2[0]))] := key;

      str2.Free;
    end;
  end;
  strList.Free;
end;

procedure TFormTestData.setButton4DBOpen();
begin
      bbtnDbOpen.enabled := false;
      bbtnDbClose.enabled := true;
      bbtExport.enabled := true;
end;
procedure TFormTestData.setButton4DBClose();
begin
      bbtnDbOpen.enabled := true;
      bbtnDbClose.enabled := false;
      bbtExport.enabled := false;
end;


procedure TFormTestData.bbtnDbOpenClick(Sender: TObject);
begin
    if cb_tns_name.text = '' then
    begin
        showmessage('数据库TNS名称不能为空');
        exit;
    end;
    if not oraConn.Connected then
    begin
      try
      setButton4DBOpen();
        oraConn.ConnectString := ledDbUser.text + '/' + ledDbPass.text + '@' +cb_tns_name.Text;
        oraConn.Open;
        if ( cb_TNS_Name.Items.IndexOf(cb_TNS_Name.Text)=-1 ) then
        begin
            cb_TNS_Name.Items.Add(cb_TNS_Name.Text);
        end;
      except
        on e : Exception do
        begin
          showmessage('连接数据库失败'+#13#10+e.Message);
          setButton4DBClose();
        end;
      end;
    end;

end;

procedure TFormTestData.bbtnDbCloseClick(Sender: TObject);
begin
  try
    if oraCOnn.Connected then
    begin
        oraCOnn.Close;
    end;
  except
  end;
  setButton4DBClose();

end;
procedure TFormTestData.getTableInfo( tab : CUserTable);
var
  col : CTableCol;
  cnt,idx : integer;
  colType, colName : string;
  newColName : string;
  isKey : boolean;
begin
  {根据输入的表, 采集表结构等信息}
  try
    //获取表字段名称/类型/长度

    oraQry.SQL.clear;
    oraQry.SQL.SetText('select COLUMN_NAME,DATA_TYPE,DATA_LENGTH from USER_TAB_COLS where table_name=:vName order by column_name ');
    oraQry.ParamByName('vName').AsString := upperCase(tab.sTableName);
    oraQry.Open;
    cnt := 0;
    tab.sGetFieldsStr := '@';
    tab.sInsFieldsStr := '@';
    //tab.sKeyColumns.Sort;
    //isKey := false;
    while not oraQry.Eof do
    begin
      colName := oraQry.FieldByName('COLUMN_NAME').AsString;
      isKey := false;
      for idx :=0 to tab.sKeyColumns.Count -1 do
      begin
        newColName := tab.sKeyColumns.names[idx];
        if uppercase(newColName) = uppercase(colName) then
        begin
         isKey := true;
         break;
        end;
      end;

      cnt := cnt+1;
      SetLength(tab.arrColumns, cnt);
      col := CTableCol.Create;
      col.isKey := isKey;
      col.colName := oraQry.FieldByName('COLUMN_NAME').AsString;
      newColName := col.colName;
      colType := oraQry.FieldByName('DATA_TYPE').asString;
      if colType='CHAR' then
      begin
        col.colType := ORA_CHAR;
        col.colTypeName := 'CHAR';
      end
      else if colType='NUMBER' then
      begin
        col.colType := ORA_NUMBER;
        col.colTypeName := 'NUMBER';
      end
      else if colType='DATE' then
      begin
        col.colType := ORA_DATE;
        col.colTypeName := 'DATE';
        newColName := 'to_char('+col.colName+',''yyyymmddhh24miss'') as '+ col.colName;
      end
      else if (colType='VARCHAR2') or (colType='CLOB') then
      begin
        col.colType := ORA_VARCHAR2;
        col.colTypeName := 'VARCHAR2';
      end;

      col.colLen := oraQry.FieldByName('DATA_LENGTH').AsInteger;
      tab.arrColumns[cnt-1] := col;
      tab.sGetFieldsStr := tab.sGetFieldsStr + ',' + newColName ;
      if not isKey then
      begin
        //关键字段特殊处理 ,此处只处理非关键字段
        tab.sInsFieldsStr := tab.sInsFieldsStr + ',' + col.colName ;
      end;
      oraQry.Next;
    end;
    tab.nColsCnt := cnt;
    if cnt=0 then
      raise exception.Create(tab.sTableName+'表不存在');

  except
    oraQry.Close;
  end;
  oraQry.Close;
  tab.sGetFieldsStr := stringReplace(tab.sGetFieldsStr, '@,','',[rfReplaceAll]);
  tab.sInsFieldsStr := stringReplace(tab.sInsFieldsStr, '@,','',[rfReplaceAll]);

  // 构造delete/insert/select语句模板
  tab.genInsertFunc();
end;

procedure TFormTestData.getUserInfo();
begin
  case  cbAccountType.ItemIndex of
    0 : begin
      getMsisdnUserInfo();
    end;
    1 : begin
      getMtvUserInfo();
    end;
    2 : begin
      getBroadbandUserInfo();
    end;
    3 : begin
      getItvUserInfo();
    end;
    else begin
      showmessage('必须选择一种账号类型');
      exit;
    end;
  end;

end;

procedure  TFormTestData.getBaseUserInfo(account : string);
var
  i,j :integer;
  userInfo: CUserInfo;
  col : CTableCol;
begin
  if m_users <> nil then
  begin
    m_users.Free;
    m_users := nil;
  end;
  m_users := CUsers.Create;

  oraQry.ParamByName('vAccount').asString := account;
  oraQry.Open;
  i := 0;

  while not oraQry.Eof do
  begin
    i:=i+1;
    setLength(m_users.arrUserInfo,i);
    userInfo := CUserInfo.Create;
    userInfo.sKeyValues := TStringList.Create;
    userInfo.sKeyType := TStringList.Create;
    userInfo.nHomeCity := oraQry.FieldByName('home_city').asInteger;
    userInfo.sMsisdn := oraQry.FieldByName('msisdn').asString;
    userInfo.sMtvAccount := oraQry.FieldByName('mtv_account').AsString;
    userInfo.sItvAccount := oraQry.FieldByName('itv_account').AsString;
    userInfo.sBroadbandAccount := oraQry.FieldByName('broadband_account').AsString;

    for j:=0 to m_KeyColumnName.count-1 do
    begin
      col := m_KeyColumnName.Objects[j] as CTableCol ;
      userInfo.sKeyValues.Values[ m_KeyColumnName[j] ] := oraQry.FieldByName(col.colName).asString;
      userInfo.sKeyType.Values[ m_KeyColumnName[j] ] := col.colTypeName +'('+inttostr(col.colLen)+')';
    end;
    m_users.arrUserInfo[i-1] := userInfo;
    oraQry.Next;
  end;
  oraQry.Close;
  m_users.nUserCnt := i;
  if (i=0) then
  begin
    raise exception.Create(account+'用户/账号不存在');
  end;
end;
procedure TFormTestData.getMsisdnUserInfo();
var
  account : string;

begin
{根据输入的用户号码, 获取基本关键资料, home_city ,user_id, customer_id 等, 用于后续提取用户数据查询条件 }
//  m_users := CUsers.Create;
  account := lbedtMsisdn.Text;
  statusbar1.Panels[1].Text := account;
  self.Refresh;

//  sqlSelect := 'select home_city,user_id,msisdn,customer_id,imsi,'''' MTV_USER_ID,'''' MTV_ACCOUNT, '''' ITV_ACCOUNT, '''' ITV_USER_ID, '''' BROADBAND_ACCOUNT, '''' BROADBAND_USER_ID from users where msisdn=:vMsisdn';
  oraQry.SQL.Clear;
  oraQry.SQL.Add('select A.home_city,A.user_id,A.msisdn,A.customer_id,A.imsi');
  oraQry.SQL.Add(','''' MTV_USER_ID,'''' MTV_ACCOUNT, '''' ITV_ACCOUNT, '''' ITV_USER_ID, '''' BROADBAND_ACCOUNT, '''' BROADBAND_USER_ID, c.user_id AGGREGATION_UID');
  oraQry.SQL.Add(' from users a,user_aggregation c where a.msisdn=:vAccount and a.user_id=c.payment_user_id(+)');
  getBaseUserInfo(account);

{  oraQry.Open;
  i := 0;

  while not oraQry.Eof do
  begin
    i:=i+1;
    setLength(m_users.arrUserInfo,i);
    userInfo := CUserInfo.Create;
    userInfo.sKeyValues := TStringList.Create;
    userInfo.sKeyType := TStringList.Create;
    userInfo.nHomeCity := oraQry.FieldByName('home_city').asInteger;
    userInfo.sMsisdn := oraQry.FieldByName('msisdn').asString;

    for j:=0 to m_KeyColumnName.count-1 do
    begin
      col := m_KeyColumnName.Objects[j] as CTableCol ;
      userInfo.sKeyValues.Values[ m_KeyColumnName[j] ] := oraQry.FieldByName(col.colName).asString;
      userInfo.sKeyType.Values[ m_KeyColumnName[j] ] := col.colTypeName +'('+inttostr(col.colLen)+')';
    end;
    m_users.arrUserInfo[i-1] := userInfo;
    oraQry.Next;
  end;
  oraQry.Close;
  m_users.nUserCnt := i;
  if (i=0) then
  begin
    raise exception.Create(msisdn+'用户不存在');
  end;
}
end;
procedure TFormTestData.getMtvUserInfo();
var
  account : string;

begin
{根据输入的用户号码, 获取基本关键资料, home_city ,user_id, customer_id 等, 用于后续提取用户数据查询条件 }
//  m_users := CUsers.Create;
  account := lbedtMsisdn.Text;
  statusbar1.Panels[1].Text := account;
  self.Refresh;

//  sqlSelect := 'select a.home_city,a.user_id mtv_user_id,a.user_name mtv_account,b.user_id,b.msisdn,b.customer_id,b.imsi, '''' ITV_ACCOUNT, '''' ITV_USER_ID, '''' BROADBAND_ACCOUNT, '''' BROADBAND_USER_ID from mtv_users a,users b where a.user_name=:vAccount and a.payment_user_id=b.user_id';
  oraQry.SQL.Clear;
  oraQry.SQL.Add('select a.home_city,a.user_id mtv_user_id,a.user_name mtv_account,b.user_id,b.msisdn,b.customer_id,b.imsi');
  oraQry.SQL.Add(', '''' ITV_ACCOUNT, '''' ITV_USER_ID, '''' BROADBAND_ACCOUNT, '''' BROADBAND_USER_ID, c.user_id AGGREGATION_UID');
  oraQry.SQL.Add('from mtv_users a,users b ,user_aggregation c where a.user_name=:vAccount and a.payment_user_id=b.user_id and b.user_id=c.payment_user_id(+)');
  getBaseUserInfo(account);

{  oraQry.ParamByName('vAccount').asString := account;
  oraQry.Open;
  i := 0;

  while not oraQry.Eof do
  begin
    i:=i+1;
    setLength(m_users.arrUserInfo,i);
    userInfo := CUserInfo.Create;
    userInfo.sKeyValues := TStringList.Create;
    userInfo.sKeyType := TStringList.Create;
    userInfo.nHomeCity := oraQry.FieldByName('home_city').asInteger;
    userInfo.sMsisdn := oraQry.FieldByName('msisdn').asString;
    userInfo.sMtvAccount := oraQry.FieldByName('mtv_account').AsString;
    userInfo.sItvAccount := oraQry.FieldByName('itv_account').AsString;
    userInfo.sBroadbandAccount := oraQry.FieldByName('broadband_account').AsString;


    for j:=0 to m_KeyColumnName.count-1 do
    begin
      col := m_KeyColumnName.Objects[j] as CTableCol ;
      userInfo.sKeyValues.Values[ m_KeyColumnName[j] ] := oraQry.FieldByName(col.colName).asString;
      userInfo.sKeyType.Values[ m_KeyColumnName[j] ] := col.colTypeName +'('+inttostr(col.colLen)+')';
    end;
    m_users.arrUserInfo[i-1] := userInfo;
    oraQry.Next;
  end;
  oraQry.Close;
  m_users.nUserCnt := i;
  if (i=0) then
  begin
    raise exception.Create(account+'用户/账号不存在');
  end;
}
end;
procedure TFormTestData.getItvUserInfo();
var
  account : string;

begin
{根据输入的用户号码, 获取基本关键资料, home_city ,user_id, customer_id 等, 用于后续提取用户数据查询条件 }
//  m_users := CUsers.Create;
  account := lbedtMsisdn.Text;
  statusbar1.Panels[1].Text := account;
  self.Refresh;

  //sqlSelect := 'select a.home_city,a.user_id itv_user_id,a.user_name itv_account,b.user_id,b.msisdn,b.customer_id,b.imsi from itv_users a,users b where a.user_name=:vAccount and a.payment_user_id=b.user_id';
  oraQry.SQL.Clear;
  oraQry.SQL.Add('select a.home_city,a.user_id itv_user_id,a.user_name itv_account,b.user_id,b.msisdn,b.customer_id,b.imsi');
  oraQry.SQL.Add(', '''' MTV_ACCOUNT, '''' MTV_USER_ID, d.user_name BROADBAND_ACCOUNT, d.user_id BROADBAND_USER_ID, c.USER_ID AGGREGATION_UID');
  oraQry.SQL.Add('from itv_users a,users b,user_aggregation c, broadband_users d ');
  oraQry.SQL.Add(' where a.user_name=:vAccount and a.payment_user_id=b.user_id and b.user_id=c.payment_user_id(+) and a.broadband_user_id=d.user_id(+) ');
  getBaseUserInfo(account);

{  oraQry.ParamByName('vAccount').asString := account;
  oraQry.Open;
  i := 0;

  while not oraQry.Eof do
  begin
    i:=i+1;
    setLength(m_users.arrUserInfo,i);
    userInfo := CUserInfo.Create;
    userInfo.sKeyValues := TStringList.Create;
    userInfo.sKeyType := TStringList.Create;
    userInfo.nHomeCity := oraQry.FieldByName('home_city').asInteger;
    userInfo.sMsisdn := oraQry.FieldByName('msisdn').asString;
    userInfo.sMtvAccount := oraQry.FieldByName('mtv_account').AsString;
    userInfo.sItvAccount := oraQry.FieldByName('itv_account').AsString;
    userInfo.sBroadbandAccount := oraQry.FieldByName('broadband_account').AsString;


    for j:=0 to m_KeyColumnName.count-1 do
    begin
      col := m_KeyColumnName.Objects[j] as CTableCol ;
      userInfo.sKeyValues.Values[ m_KeyColumnName[j] ] := oraQry.FieldByName(col.colName).asString;
      userInfo.sKeyType.Values[ m_KeyColumnName[j] ] := col.colTypeName +'('+inttostr(col.colLen)+')';
    end;
    m_users.arrUserInfo[i-1] := userInfo;
    oraQry.Next;
  end;
  oraQry.Close;
  m_users.nUserCnt := i;
  if (i=0) then
  begin
    raise exception.Create(account+'用户/账号不存在');
  end;
}
end;
procedure TFormTestData.getBroadbandUserInfo();
var
  account : string;

begin
{根据输入的用户号码, 获取基本关键资料, home_city ,user_id, customer_id 等, 用于后续提取用户数据查询条件 }
//  m_users := CUsers.Create;
  account := lbedtMsisdn.Text;
  statusbar1.Panels[1].Text := account;
  self.Refresh;

  //sqlSelect := 'select home_city,user_id,msisdn,customer_id,imsi from users where msisdn=:vMsisdn';
  oraQry.SQL.Clear;
  oraQry.SQL.Add('select a.home_city,a.user_id broadband_user_id,a.user_name broadband_account,b.user_id,b.msisdn,b.customer_id,b.imsi');
  oraQry.SQL.Add(', '''' MTV_ACCOUNT, '''' MTV_USER_ID, '''' ITV_ACCOUNT, '''' ITV_USER_ID, c.USER_ID AGGREGATION_UID');
  oraQry.SQL.Add('from broadband_users a,users b ,user_aggregation c where a.user_name=:vAccount and a.payment_user_id=b.user_id and b.user_id=c.payment_user_id(+)');
  getBaseUserInfo(account);

{
  oraQry.ParamByName('vAccount').asString := account;
  oraQry.Open;
  i := 0;

  while not oraQry.Eof do
  begin
    i:=i+1;
    setLength(m_users.arrUserInfo,i);
    userInfo := CUserInfo.Create;
    userInfo.sKeyValues := TStringList.Create;
    userInfo.sKeyType := TStringList.Create;
    userInfo.nHomeCity := oraQry.FieldByName('home_city').asInteger;
    userInfo.sMsisdn := oraQry.FieldByName('msisdn').asString;
    userInfo.sMtvAccount := oraQry.FieldByName('mtv_account').AsString;
    userInfo.sItvAccount := oraQry.FieldByName('itv_account').AsString;
    userInfo.sBroadbandAccount := oraQry.FieldByName('broadband_account').AsString;

    for j:=0 to m_KeyColumnName.count-1 do
    begin
      col := m_KeyColumnName.Objects[j] as CTableCol ;
      userInfo.sKeyValues.Values[ m_KeyColumnName[j] ] := oraQry.FieldByName(col.colName).asString;
      userInfo.sKeyType.Values[ m_KeyColumnName[j] ] := col.colTypeName +'('+inttostr(col.colLen)+')';
    end;
    m_users.arrUserInfo[i-1] := userInfo;
    oraQry.Next;
  end;
  oraQry.Close;
  m_users.nUserCnt := i;
  if (i=0) then
  begin
    raise exception.Create(account+'用户不存在');
  end;
}
end;

function TFormTestData.buildSQL(userInfo:CUserInfo; tab: CUserTable):string;
var
  sqlInsert : string;
  sqlDelete : string;
  sqlSelect : string;
  value, newVal, strValue : string;
  i : integer;
  outstr : string;
  insField, insValue : string;

begin
{构造所需表的delete/insert语句, 用于初始环境准备}
//tab.sFieldsStr :=' home_city,user_id,msisdn';
  insField := '@';
  insValue := '@';
  for i :=0 to tab.sKeyColumns.Count -1 do
  begin
    insField := insField + ',' + tab.sKeyColumns.Names[i];
    insValue := insValue + ',' + tab.sKeyColumns.Values[tab.sKeyColumns.Names[i]];
  end;
  insField := stringReplace(insField,'@,','',[rfReplaceAll]);
  insValue := stringReplace(insValue,'@,','',[rfReplaceAll]);


  sqlSelect := 'SELECT @vFIELDS FROM @vTABLE_NAME WHERE @vSELECT_WHERE';
  sqlDelete := 'DELETE FROM @vTABLE_NAME WHERE @vDELETE_WHERE;';
  sqlInsert := 'in_@vPROC_NAME ( @vVALUES );';

  sqlSelect := stringReplace(sqlSelect,'@vTABLE_NAME',tab.sTableName,[rfReplaceAll]);
  sqlSelect := stringReplace(sqlSelect,'@vFIELDS',tab.sGetFieldsStr,[rfReplaceAll]);
  sqlSelect := stringReplace(sqlSelect,'@vSELECT_WHERE',tab.sGetCondition,[rfReplaceAll]);

  sqlDelete := stringReplace(sqlDelete,'@vTABLE_NAME',tab.sTableName,[rfReplaceAll]);
  sqlDelete := stringReplace(sqlDelete,'@vDELETE_WHERE',tab.sDelCondition,[rfReplaceAll]);

  sqlInsert := stringReplace(sqlInsert,'@vPROC_NAME',tab.sProcName,[rfReplaceAll]);
  //sqlInsert := stringReplace(sqlInsert,'@vFIELDS',insField+','+tab.sInsFieldsStr,[rfReplaceAll]);

  outstr := sqlDelete+#13#10;

  oraQry.SQL.clear;
  oraQry.SQL.Add(sqlSelect);

  //设置参数
  for i :=0 to tab.sKeyColumns.Count -1 do
  begin
    value := tab.sKeyColumns.values[tab.sKeyColumns.Names[i]];
    oraQry.ParamByName(value).AsString := userInfo.sKeyValues.Values[value];
  end;

//  cnt := 0 ;
  oraQry.Open;
  while not oraQry.Eof do
  begin
    {
    cnt := cnt+1;
    if cnt>40 then
    begin
      showMessage('大于40');
      break;
    end;
    }
    strValue := '@';
    for i :=0 to tab.nColsCnt-1 do
    begin
      if tab.arrColumns[i].isKey then continue;
      value := oraQry.FieldByName(tab.arrColumns[i].colName).asString;
      //转换值格式
      case tab.arrColumns[i].colType of
        ORA_VARCHAR2: begin
          newVal := ''''+value+'''';
        end;
        ORA_NUMBER: begin
          newVal := value;
        end;
        ORA_DATE: begin
          newVal := 'to_date('''+value+''',''yyyymmddhh24miss'')';
        end;
        ORA_CHAR: begin
          newVal := ''''+value+'''';
        end;
        else
          newVal := value;
      end;
      if value = '' then newVal:='null';
      strValue := strValue + ','+newVal;
    end;
    strValue := insValue+','+stringReplace(strValue,'@,','',[rfReplaceAll]);
    outstr := outstr+ stringReplace(sqlInsert,'@vVALUES',strValue,[rfReplaceAll])+#13#10;
    oraQry.Next;
  end;
  oraQry.Close;

  result := outstr;
end;
procedure TFormTestData.setTableSeq(var table : CUserTable);
var
  n,i,cnt : integer;
begin
  cnt := 1;
  n := m_tables.IndexOf(table.sTableName);
  if n>=0 then
  begin
    for i:=n to m_tables.Count-1 do
    begin
      if( m_tables[i] = table.sTableName ) then
      begin
        cnt := cnt + 1;
      end;
    end;
  end;
  table.nTabSeq := cnt;
  table.sProcName:=stringReplace(table.sTableName, '_','',[rfReplaceAll]);
  if cnt>1 then
  begin
    table.sProcName:=table.sProcName + inttostr(cnt);
  end;
end;

procedure TFormTestData.prepareTargetTables();
var
  table : CUserTable;
  strList, comment : TStringList;
  str : string;
  j,i : integer;
begin
{根据输入的表范围, 整理并设置相关属性, 例如校验表是否存在, 数据的查找关键字段设置}
    
    m_tables := TStringList.create;
    for j :=0 to memoTables.lines.count-1 do
    begin
      str := trim(memoTables.Lines[j]);
      if str='' then continue;
      if copy(str,1,1)='#' then
      begin
        //保留备注并输出
        comment := TStringList.Create;
        comment.Add(str);
        m_tables.AddObject('#',comment as TObject);
        continue;
      end;

      table := CUserTable.Create;
      strList := split(str,':');
      if(strList.Count>0) then
        table.sTableName := uppercase(trim(strList.Strings[0]));
      if(strList.Count>1) then
      begin
        table.setKey( strList.Strings[1],m_KeyColumnName );
      end
      else
      begin
        table.setKey('',m_KeyColumnName);
      end;
      strList.free;
      statusbar1.Panels[1].Text := table.sTableName; //备注信息输出
      self.Refresh;
      str := '@';
      for i :=0 to table.sKeyColumns.count -1 do
      begin
        str := str + ' and ' +table.sKeyColumns.Names[i] +'= :'+table.sKeyColumns.values[table.sKeyColumns.Names[i]];
      end;
      str := stringReplace(str,'@ and','',[rfReplaceAll]);
      table.sGetCondition := str;
      table.sDelCondition := stringReplace(str,':','',[rfReplaceAll]);
      //table.nTabSeq := 0;
      setTableSeq(table);
      try
        //取表结构
        getTableInfo(table);
        m_tables.AddObject(table.sTableName,table as TObject);
      except
      end;

    end;

end;

procedure TFormTestData.bbtExportClick(Sender: TObject);
begin
{导出用户初始化数据SQL的入口}

  memoExport.Lines.Clear;
  bbtExport.Enabled := false;
  try
    statusbar1.Panels[0].Text := '表结构分析';
    self.Refresh;
    prepareTargetTables(); //待导出表准备

    statusbar1.Panels[0].Text := '取用户信息';
    self.Refresh;
    getUserInfo();   //取用户基本信息

    statusbar1.Panels[0].Text := '生成SQL';
    self.Refresh;
    exportSQL(); //生成导出SQL
  finally
  bbtExport.Enabled := true;
  end;
end;

procedure TFormTestData.exportSql();
var
  userInfo : CUserInfo;
  tab : CUserTable;
  i,j : integer;
  value, strValue : string;
  vName,vType,vValue : string;
  comment : TStringList;
begin
  {生成SQL}
  memoExport.Clear;
  for i := 0 to m_users.nUserCnt-1 do
  begin
    if i>0 then memoExport.Lines.Add('----------------------跨用户数据分割线---------------------'+#13#10);
    userInfo := m_users.arrUserInfo[i];
    value:='';
    strValue := '';
    for j :=0 to userInfo.sKeyValues.Count -1 do
    begin
     vName := userInfo.sKeyValues.names[j];
     vType := userInfo.sKeyType.Values[userInfo.sKeyValues.names[j]];
     vValue := userInfo.sKeyValues.Values[userInfo.sKeyValues.names[j]];
     value := value + '  '+vName+' '+vType+';'+#13#10;
     if pos('VARCHAR',vType)>0 then
     begin
       vValue := '''' + vValue + '''';
     end;
     strValue := strValue + '  '+vName + ' := '+vValue+';'+#13#10;
     {
     value := value + '  '+userInfo.sKeyValues.names[j]+' '+userInfo.sKeyType.Values[userInfo.sKeyValues.names[j]]+';'+#13#10;
     strValue := strValue + '  '+userInfo.sKeyValues.names[j] + ' := '+userInfo.sKeyValues.Values[userInfo.sKeyValues.names[j]]+';'+#13#10;
     }
    end;
    memoExport.Lines.Add('DECLARE');
    memoExport.Lines.Add(value);  //变量声明
    statusbar1.Panels[1].Text := '表函数声明';
    self.Refresh;
    
    for j :=0 to m_tables.Count-1 do
    begin
      //构造导出语句
      if m_tables[j]='#' then continue;
      tab := m_tables.objects[j] as CUserTable;
      memoExport.Lines.Add ('  '+tab.sInsertFunc);
      memoExport.Refresh;
    end;
    memoExport.Lines.Add('BEGIN');
    memoExport.Lines.Add(strValue); // 变量赋值
//    memoExport.Lines.Add('-------------------------------------');
    for j :=0 to m_tables.Count-1 do
    begin
      //构造导出语句
      if m_tables[j]='#' then
      begin
        comment := m_tables.Objects[j] as TStringList;
        memoExport.Lines.Add('--' + comment.Strings[0]);
        continue;
      end;
      tab := m_tables.objects[j] as CUserTable;
      statusbar1.Panels[1].Text := '数据 '+ tab.sTableName;
      self.Refresh;
      memoExport.Lines.Add('------------- '+ tab.sTableName +' -----------------');
      memoExport.Lines.Add( buildSQL(userInfo, tab) );
      memoExport.Refresh;

    end;
    memoExport.Lines.Add('END;'+#13#10);

  end;
end;

procedure TFormTestData.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  iniFile,str : string;
  myinifile : TiniFile;
begin
  try
    if oraConn.Connected then oraConn.Close;
  except
  end;

  iniFile := copy(Application.ExeName,1,length(Application.ExeName)-4) +'.ini';
  myinifile:=Tinifile.create(iniFile);
  try
    //数据库连接串
    str := StringReplace(cb_tns_name.Items.Text,#13#10,';',[rfReplaceAll]);
    myIniFile.WriteString('TEST_DATA','TNS',str);

    //脚本文件
    str := m_sqlFile;
    myIniFile.WriteString('TEST_DATA','SQL_FILE',str);
    //账号类型
    str := inttostr(cbAccountType.ItemIndex);
    myIniFile.WriteString('TEST_DATA','ACCOUNT_TYPE',str);
    //账号
    myIniFile.WriteString('TEST_DATA','ACCOUNT',lbedtMsisdn.Text);

  finally
    myIniFile.Free;
  end;



  m_KeyColumnName.Free;
  m_tables.Free;
  m_users.Free;

  action := caFree;
end;



procedure TFormTestData.MemoExportKeyPress(Sender: TObject; var Key: Char);
begin
    if( key = #1 ) then
        TMemo(sender).SelectAll;

end;

procedure TFormTestData.memoTablesKeyPress(Sender: TObject; var Key: Char);
begin
    if( key = #1 ) then
        TMemo(sender).SelectAll;

end;
procedure TFormTestData.initVar();
var
  col : CTableCol;
begin
//初始化内部参数变量
  if m_KeyColumnName=nil then
    m_KeyColumnName := TStringList.Create;
  //设置内部参数变量名
  m_KeyColumnName.Clear;

  col := CTableCol.Create;
  col.colName := 'HOME_CITY';
  col.colType := ORA_NUMBER;
  col.colTypeName := 'NUMBER';
  col.colLen := 3;
  m_KeyColumnName.AddObject('vHomeCity',col);

  col := CTableCol.Create;
  col.colName := 'MSISDN';
  col.colType := ORA_NUMBER;
  col.colTypeName := 'NUMBER';
  col.colLen := 15;
  m_KeyColumnName.AddObject('vMsisdn',col);

  col := CTableCol.Create;
  col.colName := 'USER_ID';
  col.colType := ORA_NUMBER;
  col.colTypeName := 'NUMBER';
  col.colLen := 15;
  m_KeyColumnName.AddObject('vUserId',col);

  col := CTableCol.Create;
  col.colName := 'CUSTOMER_ID';
  col.colType := ORA_NUMBER;
  col.colTypeName := 'NUMBER';
  col.colLen := 15;
  m_KeyColumnName.AddObject('vCustomerId',col);

  col := CTableCol.Create;
  col.colName := 'IMSI';
  col.colType := ORA_NUMBER;
  col.colTypeName := 'NUMBER';
  col.colLen := 15;
  m_KeyColumnName.AddObject('vImsi',col);

  col := CTableCol.Create;
  col.colName := 'MTV_ACCOUNT';
  col.colType := ORA_VARCHAR2;
  col.colTypeName := 'VARCHAR2';
  col.colLen := 15;
  m_KeyColumnName.AddObject('vMtvAcct',col);

  col := CTableCol.Create;
  col.colName := 'MTV_USER_ID';
  col.colType := ORA_NUMBER;
  col.colTypeName := 'NUMBER';
  col.colLen := 15;
  m_KeyColumnName.AddObject('vMtvUid',col);

  col := CTableCol.Create;
  col.colName := 'ITV_ACCOUNT';
  col.colType := ORA_VARCHAR2;
  col.colTypeName := 'VARCHAR2';
  col.colLen := 32;
  m_KeyColumnName.AddObject('vItvAcct',col);

  col := CTableCol.Create;
  col.colName := 'ITV_USER_ID';
  col.colType := ORA_NUMBER;
  col.colTypeName := 'NUMBER';
  col.colLen := 15;
  m_KeyColumnName.AddObject('vItvUid',col);

  col := CTableCol.Create;
  col.colName := 'BROADBAND_ACCOUNT';
  col.colType := ORA_VARCHAR2;
  col.colTypeName := 'VARCHAR2';
  col.colLen := 32;
  m_KeyColumnName.AddObject('vBroadbandAcct',col);

  col := CTableCol.Create;
  col.colName := 'BROADBAND_USER_ID';
  col.colType := ORA_NUMBER;
  col.colTypeName := 'NUMBER';
  col.colLen := 15;
  m_KeyColumnName.AddObject('vBroadbandUid',col);

  col := CTableCol.Create;
  col.colName := 'AGGREGATION_UID';
  col.colType := ORA_NUMBER;
  col.colTypeName := 'NUMBER';
  col.colLen := 15;
  m_KeyColumnName.AddObject('vAggregationUid',col);

  m_KeyColumnName.Sort;
end;

procedure TFormTestData.FormShow(Sender: TObject);
var
  iniFile,str : string;
  myIniFile : TIniFile;
  stm : TStringStream;
begin

  initVar(); //初始化内部变量

  //取数据库连接名
  iniFile := copy(Application.ExeName,1,length(Application.ExeName)-4) +'.ini';
  myinifile:=Tinifile.create(iniFile);
  str := trim(myIniFile.ReadString('TEST_DATA','TNS',''));
  if str<>'' then
  begin
    str := StringReplace(str,';',#13#10,[rfReplaceAll]);
    stm := TStringStream.Create(str);
    cb_tns_name.Items.LoadFromStream(stm);
    //cb_tns_name.ItemIndex := cb_tns_name.Items.Count-1;
    stm.FREE;
  end;

  //加载最近使用的脚本
  str := trim(myIniFile.ReadString('TEST_DATA','SQL_FILE',''));
  if str<>'' then
  begin
    memoTables.Lines.LoadFromFile(str);
    m_sqlFile:=str;
    stextSqlFile.Caption := '用户表：' + ExtractFileName(m_sqlFile);
    OpenDialog1.InitialDir := extractFilePath(m_sqlFile);
  end;

  //账号类型
  cbAccountType.ItemIndex := myIniFile.ReadInteger('TEST_DATA','ACCOUNT_TYPE',0);
  //账号
  lbedtMsisdn.Text := myIniFile.ReadString('TEST_DATA','ACCOUNT','13809567226');

end;

procedure TFormTestData.BitBtn1Click(Sender: TObject);
begin
  MemoExport.SelectAll;
  MemoExport.CopyToClipboard;

end;

procedure TFormTestData.BitBtn3Click(Sender: TObject);
begin
    if m_sqlFile<>'' then
    begin
      //OpenDialog1.InitialDir := ExtractFilePath(m_sqlFile);
      OpenDialog1.FileName := m_sqlFile;
    end;
    if OpenDialog1.Execute then
    begin
      m_sqlFile := OpenDialog1.FileName;

      memoTables.Lines.LoadFromFile(m_sqlFile);
      sTextSqlFile.Caption := '用户表：' + ExtractFileName(m_sqlFile);
    end;

end;

procedure TFormTestData.BitBtn2Click(Sender: TObject);
begin
    if m_sqlFile<>'' then
    begin
      //saveDialog1.InitialDir := ExtractFilePath(m_sqlFile);
      SaveDialog1.FileName := m_sqlFile;
    end;

    if SaveDialog1.Execute then
    begin
      m_sqlFile := SaveDialog1.FileName;

      memoTables.Lines.SaveToFile(m_sqlFile);
      sTextSqlFile.Caption := '用户表：' + ExtractFileName(m_sqlFile);
    end;

end;

procedure TFormTestData.FormCreate(Sender: TObject);
begin
  FormTestDataDesc := TFormTestDataDesc.Create(nil);
end;

procedure TFormTestData.SpeedButton1Click(Sender: TObject);
begin
  FormTestDataDesc.Show();
end;

procedure TFormTestData.FormDestroy(Sender: TObject);
begin
  FormTestDataDesc.Free;
end;

initialization
  /////////////注册工具类
  RegisteFormFactory('用户数据导出(&X)',IFormCreator_TestUnit.create);

end.
