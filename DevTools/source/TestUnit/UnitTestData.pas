unit UnitTestData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MemDS, DBAccess, Ora, StdCtrls, ExtCtrls, Buttons,
  UnitFormFactory, ComCtrls,IniFiles;

type

COL_TYPE = (ORA_CHAR,ORA_DATE,ORA_NUMBER,ORA_VARCHAR2);
//���ݱ��ֶ�����
CTableCol = class
    colName : string;    //����
    colType : COL_TYPE;  //����
    colTypeName : string ; // ��������
    colLen  : integer;   //����
    isKey : boolean;
  private
  public
end;
//�û����ݱ�
CUserTable = class
    sTableName : string;   //����
    sKeyColumns : TStringList;         //�ؼ��ֶ�
//    sKeyValues : TStringList;    //�ؼ��ֶζ�Ӧ�ڲ�������
    nColsCnt : integer;    //�ֶθ���
    arrColumns : array of CTableCol;   //�ֶ���ϸ(����)
    sGetFieldsStr,sInsFieldsStr  : string; // select, insert �ֶδ�
    sGetCondition,sDelCondition : string; // select, delete ����
    sInsertFunc : string; // insert ����
  private
    procedure setKey(str : string; m_KeyColumnName : TStringList);//�ֽⲢ���ùؼ��ֶκ���
    procedure genInsertFunc(); //����insert����
  public
  end;
//�û��ؼ���Ϣ
CUserInfo = class
    nHomeCity : integer; // ����
    sMsisdn : string; //����
    sUserId : string; //�û���ʶ
    sCustomerId : string; //�ͻ���ʶ
    sKeyValues : TStringList; //�ڲ���������Ӧֵ
    sKeyType : TStringList; //�ڲ���������
  private
  public
  end;
//�û���Ϣ��(���ܴ��ڶ���û�����)
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
    StaticText1: TStaticText;
    lbedtMsisdn: TLabeledEdit;
    StatusBar1: TStatusBar;
    StaticText5: TStaticText;
    procedure bbtnDbOpenClick(Sender: TObject);
    procedure bbtnDbCloseClick(Sender: TObject);
    procedure bbtExportClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MemoExportKeyPress(Sender: TObject; var Key: Char);
    procedure memoTablesKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);

  private
    { Private declarations }
    m_users : CUsers;   // ���βɼ����û�������Ϣ
    m_tables : TStringList ; // ���βɼ��ı���
    m_KeyColumnName : TStringList; //ϵͳ֧�ֵ��ڲ���������
    procedure setButton4DBOpen();
    procedure setButton4DBClose();
    procedure getTableInfo( tab : CUserTable);
    function buildSQL(userInfo:CUserInfo; tab : CUserTable):string;
    procedure getUserInfo();
    procedure exportSQL();
    procedure prepareTargetTables();

  public
    { Public declarations }
  end;



//-------------- �Ӵ��ڴ����߶��忪ʼ ---------------//
IFormCreator_TestUnit = class(TInterfacedObject, IFormCreator)
    function CreateForm():TForm;
end;
//------------ �Ӵ��ڴ����߶������ -----------//

implementation
uses UnitPublic;


{$R *.dfm}
//-------------- �Ӵ��ڴ�����ʵ�ֿ�ʼ ---------------------//
function IFormCreator_TestUnit.CreateForm():TForm;
begin
    Result := TFormTestData.Create(nil);
end;
//-------------- �Ӵ��ڴ�����ʵ�ֽ��� ---------------------//


procedure CUserTable.genInsertFunc();
var
  str, funcStr: string;
  i,j : integer;
  col : CTableCol;
begin
  //
  funcStr := 'PROCEDURE in_'+stringReplace(self.sTableName, '_','',[rfReplaceAll]) +'(';
  //�ֶβ���
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
  //insert ���
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
  begin    //������, Ĭ��Ϊ home_city=vHomeCity, user_id=vUserId
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
        raise exception.Create( s+' "�ؼ��ֶ�=�ڲ�����" ���ô��� ');
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
        raise exception.Create(s+' �ֶζ�Ӧ�ڲ��������ô���');
      end;
      self.sKeyColumns.Values[uppercase(trim(str2[0]))] := key;

    end;
    str2.Free;
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
        showmessage('���ݿ�TNS���Ʋ���Ϊ��');
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
          showmessage('�������ݿ�ʧ��'+#13#10+e.Message);
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
  bbtnDbOpen.enabled := true;
  bbtnDbClose.enabled := false;

end;
procedure TFormTestData.getTableInfo( tab : CUserTable);
var
  col : CTableCol;
  cnt,idx : integer;
  colType, colName : string;
  newColName : string;
  isKey : boolean;
begin
  {��������ı�, �ɼ���ṹ����Ϣ}
  try
    //��ȡ���ֶ�����/����/����

    oraQry.SQL.clear;
    oraQry.SQL.SetText('select COLUMN_NAME,DATA_TYPE,DATA_LENGTH from USER_TAB_COLS where table_name=:vName order by column_name ');
    oraQry.ParamByName('vName').AsString := upperCase(tab.sTableName);
    oraQry.Open;
    cnt := 0;
    tab.sGetFieldsStr := '@';
    tab.sInsFieldsStr := '@';
    //tab.sKeyColumns.Sort;
    isKey := false;
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
        //�ؼ��ֶ����⴦�� ,�˴�ֻ����ǹؼ��ֶ�
        tab.sInsFieldsStr := tab.sInsFieldsStr + ',' + col.colName ;
      end;
      oraQry.Next;
    end;
    tab.nColsCnt := cnt;
    if cnt=0 then
      raise exception.Create(tab.sTableName+'������');

  except
    oraQry.Close;
  end;
  oraQry.Close;
  tab.sGetFieldsStr := stringReplace(tab.sGetFieldsStr, '@,','',[rfReplaceAll]);
  tab.sInsFieldsStr := stringReplace(tab.sInsFieldsStr, '@,','',[rfReplaceAll]);

  // ����delete/insert/select���ģ��
  tab.genInsertFunc();
end;
procedure TFormTestData.getUserInfo();
var
  sqlSelect,msisdn : string;
  userInfo: CUserInfo;
  i ,j: integer;
  col : CTableCol;
begin
{����������û�����, ��ȡ�����ؼ�����, home_city ,user_id, customer_id ��, ���ں�����ȡ�û����ݲ�ѯ���� }
  m_users := CUsers.Create;
  msisdn := lbedtMsisdn.Text;
  statusbar1.Panels[1].Text := msisdn;
  self.Refresh;

  sqlSelect := 'select home_city,user_id,msisdn,customer_id,imsi from users where msisdn=:vMsisdn';
  oraQry.SQL.SetText(pchar(sqlSelect));
  oraQry.ParamByName('vMsisdn').asString := msisdn;
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
    raise exception.Create(msisdn+'�û�������');
  end;

end;

function TFormTestData.buildSQL(userInfo:CUserInfo; tab: CUserTable):string;
var
  sqlInsert : string;
  sqlDelete : string;
  sqlSelect : string;
  value, newVal, strValue : string;
  i,cnt : integer;
  outstr : string;
  insField, insValue : string;

begin
{����������delete/insert���, ���ڳ�ʼ����׼��}
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
  sqlInsert := 'in_@vTABLE_NAME ( @vVALUES );';

  sqlSelect := stringReplace(sqlSelect,'@vTABLE_NAME',tab.sTableName,[rfReplaceAll]);
  sqlSelect := stringReplace(sqlSelect,'@vFIELDS',tab.sGetFieldsStr,[rfReplaceAll]);
  sqlSelect := stringReplace(sqlSelect,'@vSELECT_WHERE',tab.sGetCondition,[rfReplaceAll]);

  sqlDelete := stringReplace(sqlDelete,'@vTABLE_NAME',tab.sTableName,[rfReplaceAll]);
  sqlDelete := stringReplace(sqlDelete,'@vDELETE_WHERE',tab.sDelCondition,[rfReplaceAll]);

  sqlInsert := stringReplace(sqlInsert,'@vTABLE_NAME',stringReplace(tab.sTableName, '_','',[rfReplaceAll]),[rfReplaceAll]);
  //sqlInsert := stringReplace(sqlInsert,'@vFIELDS',insField+','+tab.sInsFieldsStr,[rfReplaceAll]);

  outstr := sqlDelete+#13#10;

  oraQry.SQL.clear;
  oraQry.SQL.SetText(pchar(sqlSelect));

  //���ò���
  for i :=0 to tab.sKeyColumns.Count -1 do
  begin
    value := tab.sKeyColumns.values[tab.sKeyColumns.Names[i]];
    oraQry.ParamByName(value).AsString := userInfo.sKeyValues.Values[value];
  end;

  cnt := 0 ;
  oraQry.Open;
  while not oraQry.Eof do
  begin
    {
    cnt := cnt+1;
    if cnt>40 then
    begin
      showMessage('����40');
      break;
    end;
    }
    strValue := '@';
    for i :=0 to tab.nColsCnt-1 do
    begin
      if tab.arrColumns[i].isKey then continue;
      value := oraQry.FieldByName(tab.arrColumns[i].colName).asString;
      //ת��ֵ��ʽ
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
procedure TFormTestData.prepareTargetTables();
var
  table : CUserTable;
  strList : TStringList;
  str : string;
  j,i : integer;
begin
{��������ı�Χ, ���������������, ����У����Ƿ����, ���ݵĲ��ҹؼ��ֶ�����}
    
    m_tables := TStringList.create;
    for j :=0 to memoTables.lines.count-1 do
    begin
      str := trim(memoTables.Lines[j]);
      if str='' then continue;
      if copy(str,1,1)='#' then continue;

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
      statusbar1.Panels[1].Text := table.sTableName; //��ע��Ϣ���
      self.Refresh;
      str := '@';
      for i :=0 to table.sKeyColumns.count -1 do
      begin
        str := str + ' and ' +table.sKeyColumns.Names[i] +'= :'+table.sKeyColumns.values[table.sKeyColumns.Names[i]];
      end;
      str := stringReplace(str,'@ and','',[rfReplaceAll]);
      table.sGetCondition := str;
      table.sDelCondition := stringReplace(str,':','',[rfReplaceAll]);
      try
        //ȡ��ṹ
        getTableInfo(table);
        m_tables.AddObject(table.sTableName,table as TObject);
      except
      end;

    end;

end;

procedure TFormTestData.bbtExportClick(Sender: TObject);
var
  msisdn : string;
begin
{�����û���ʼ������SQL�����}
  memoExport.Lines.Clear;
  bbtExport.Enabled := false;
  try
    statusbar1.Panels[0].Text := '��ṹ����';
    self.Refresh;
    prepareTargetTables(); //��������׼��
    statusbar1.Panels[0].Text := 'ȡ�û���Ϣ';
    self.Refresh;
    getUserInfo();   //ȡ�û�������Ϣ
    statusbar1.Panels[0].Text := '����SQL';
    self.Refresh;
    exportSql(); //���ɵ���SQL
  finally
  bbtExport.Enabled := true;
  end;
end;

procedure TFormTestData.exportSql();
var
  userInfo : CUserInfo;
  tab : CUserTable;
  i,j : integer;
  value, strValue , strFunc: string;
begin
  {����SQL}
  for i := 0 to m_users.nUserCnt-1 do
  begin
    memoExport.Clear;

    userInfo := m_users.arrUserInfo[i];
    value:='';

    for j :=0 to userInfo.sKeyValues.Count -1 do
    begin
     value := value + '  '+userInfo.sKeyValues.names[j]+' '+userInfo.sKeyType.Values[userInfo.sKeyValues.names[j]]+';'+#13#10;
     strValue := strValue + '  '+userInfo.sKeyValues.names[j] + ' := '+userInfo.sKeyValues.Values[userInfo.sKeyValues.names[j]]+';'+#13#10;
    end;
    memoExport.Lines.Add('DECLARE');
    memoExport.Lines.Add(value);  //��������
    statusbar1.Panels[1].Text := '��������';
    self.Refresh;
    
    for j :=0 to m_tables.Count-1 do
    begin
      //���쵼�����
      tab := m_tables.objects[j] as CUserTable;
      memoExport.Lines.Add ('  '+tab.sInsertFunc);
      memoExport.Refresh;
    end;
    memoExport.Lines.Add('BEGIN');
    memoExport.Lines.Add(strValue); // ������ֵ
    for j :=0 to m_tables.Count-1 do
    begin
      //���쵼�����
      tab := m_tables.objects[j] as CUserTable;
      statusbar1.Panels[1].Text := '���� '+ tab.sTableName;
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
  i : integer;
  iniFile,str : string;
  myinifile : TiniFile;
begin
  try
    if oraConn.Connected then oraConn.Close;
  except
  end;
  try
    iniFile := copy(Application.ExeName,1,length(Application.ExeName)-4) +'.ini';
    myinifile:=Tinifile.create(iniFile);
    str := StringReplace(cb_tns_name.Items.Text,#13#10,';',[rfReplaceAll]);
    myIniFile.WriteString('TEST_DATA','TNS',str);
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

procedure TFormTestData.FormShow(Sender: TObject);
var
  col : CTableCol;
  iniFile,str : string;
  myIniFile : TIniFile;
  stm : TStringStream;
begin
  if m_KeyColumnName=nil then
    m_KeyColumnName := TStringList.Create;
  //�����ڲ�����������
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

  m_KeyColumnName.Sort;


  //ȡ���ݿ�������
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

end;

procedure TFormTestData.BitBtn1Click(Sender: TObject);
begin
  MemoExport.SelectAll;
  MemoExport.CopyToClipboard;

end;

initialization
  /////////////ע�Ṥ����
  RegisteFormFactory('�û����ݵ���(&X)',IFormCreator_TestUnit.create);

end.
