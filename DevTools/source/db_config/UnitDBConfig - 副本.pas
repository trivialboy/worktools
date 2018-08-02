unit UnitDBConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  UnitFormFactory,   ActiveX,   RegExpr, IniFiles, UnitPublic, StrUtils,
  Dialogs, StdCtrls, DB, MemDS, DBAccess, Ora, CheckLst, Mask, FileCtrl,
  ComCtrls, ShellCtrls, ExtCtrls,  ShellApi;


type

  TMyObject = class(TObject)
    FFieldName: String;
    FFieldValue: String;
    FFieldType: TFieldType;
    //FImes: TList;
  protected
    procedure   SetFieldName( const S: String);
    procedure   SetFieldValue( const V: String);
    procedure   SetFieldType( const T: TFieldType);
  public
    constructor Create(); virtual;
    destructor  Destroy; virtual;
    property    FieldName: String read FFieldName write SetFieldName;
    property    FieldValue: String read FFieldValue write SetFieldValue;
    property    FieldType: TFieldType read FFieldType write SetFieldType;
    { Public declarations }
  end;


  TDbConfig = class(TForm)
    OraSession: TOraSession;
    OraQuery: TOraQuery;
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    mePassword: TMaskEdit;
    btConnect: TButton;
    edtUser: TEdit;
    cbOracleSID: TComboBox;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    clbFields: TCheckListBox;
    Panel7: TPanel;
    btStart: TButton;
    Label6: TLabel;
    edtPath: TEdit;
    btFilePath: TButton;
    lvTables: TListView;
    edtTable: TEdit;
    ButtonPrev: TButton;
    ButtonNext: TButton;
    Label7: TLabel;
    edtWhere: TEdit;
    Label9: TLabel;
    edtInfo: TEdit;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Label8: TLabel;
    btOpenDir: TButton;

    procedure btConnectClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btFilePathClick(Sender: TObject);
    procedure btStartClick(Sender: TObject);
    procedure lvTablesSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure ButtonPrevClick(Sender: TObject);
    procedure ButtonNextClick(Sender: TObject);
    procedure clbFieldsClick(Sender: TObject);
    procedure edtTableKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtTableExit(Sender: TObject);
    procedure btOpenDirClick(Sender: TObject);
  protected
    m_nFileNumber:Integer;
    m_nRecordNumber:Integer;
  private
    procedure   GetUserTables();
    procedure   GetTableFields(const strTable:string);
    function    GetTableSelectFields(var strFields:string ):boolean;
    function    NormalCreateFile(const RecordList : TList;const TableComment : TList):boolean;
    function    BlobCreateFile(const RecordList : TList;const TableComment : TList):boolean;
    function    GetFieldValue(const Value:string):string;
    procedure   ProcessMove(Button: TUDBtnType);
    procedure   ClearListView();
    function    HasBlob(const TableName : String):Boolean;
    procedure   ClearListBox();
    function    GetFieldComment(const FieldName:string;const TableComment : TList):string;
    procedure   WriteLongStr(const FileHandle : TextFile; const Data:String);
    procedure   SaveServer();
    { Private declarations }
  public
    { Public declarations }
  end;

    //-------------- 子窗口创建者定义开始 ---------------//
  IFormCreator_DbConfig = class(TInterfacedObject, IFormCreator)
    public
      function CreateForm():TForm;
  end;
//------------ 子窗口创建者定义结束 -----------//


//var
//  DbConfig: TDbConfig;

implementation

{$R *.dfm}

function IsMatch(const AInputString : string; const Expression:string): boolean;
var
    RegExpr: TRegExpr;
begin
    RegExpr :=  TRegExpr.create;
    try
        RegExpr.Expression := Expression;//'^\[TAG\](.*)';
        result := RegExpr.Exec(AInputString);
    finally
      RegExpr.Free;
    end;
end;


//-------------- 子窗口创建者实现开始 ---------------------//
function IFormCreator_DbConfig.CreateForm():TForm;
begin
    Result := TDbConfig.Create(nil);
end;
//-------------- 子窗口创建者实现结束 ---------------------//


constructor TMyObject.Create();
begin
    inherited Create();
   // FImes := TList.Create;
end;

destructor TMyObject.Destroy;
begin
    //FImes.Free;
    //FImes := nil;
end;


procedure   TMyObject.SetFieldName( const S: String);
begin
    FFieldName := S;
end;

procedure   TMyObject.SetFieldValue( const V: String);
begin
    FFieldValue := V;
end;

procedure   TMyObject.SetFieldType( const T: TFieldType);
begin
    FFieldType := T;
end;







procedure   TDbConfig.ClearListView();
var
    ListItem : TListItem;
    nIndex : integer;
begin
    for  nIndex:=0 to lvTables.Items.Count do
    begin
        ListItem := lvTables.Items[nIndex];
        if(ListItem<>nil)then
        begin
            ListItem.Free;
        end;
    end;
    lvTables.Items.Clear;
    edtTable.Text := '';
end;


procedure   TDbConfig.GetUserTables();
var
    ListItem : TListItem;
begin
    ClearListView();
    lvTables.Items.BeginUpdate;
    OraQuery.SQL.Clear();
    OraQuery.SQL.Add('select table_name from user_tables order by table_name');
    OraQuery.Open;
    while not OraQuery.Eof do
    begin
        ListItem := lvTables.Items.Add;
        ListItem.Caption:=OraQuery.FieldByName('table_name').AsString;
        //ListItem.SubItems.Add(OraQuery.FieldByName('table_name').AsString);
        OraQuery.Next;
        Application.ProcessMessages();
    end;
    lvTables.Items.EndUpdate;
    OraQuery.Close;
end;


procedure TDbConfig.btConnectClick(Sender: TObject);
begin
    if (cbOracleSID.text = '') or  (edtUser.text = '') or (mePassword.text = '') then
    begin
        showmessage('数据库连接信息不能为空');
        exit;
    end;
    if not OraSession.Connected then
    begin
      try
        //adoConn.ConnectString := 'bssp/bssp@10.1.0.220:1521:kf';
        btConnect.Enabled := false;
        OraSession.ConnectString := edtUser.text + '/' + mePassword.text + '@' +cbOracleSID.Text;// 'bssp/bssp@10.1.0.220:1521:kf';
        OraSession.Open;
        //OraSession.Connect;

        GetUserTables();

        btConnect.Enabled := true;
        btConnect.Caption := '断开';
        btStart.Enabled := true;
        edtTable.Enabled := true;
        SaveServer();
      except
        on e : Exception do
        begin
            showmessage('连接数据库失败'+#13#10+e.Message);
            btStart.Enabled := false;
            btConnect.Enabled := true;
            edtTable.Enabled := false;
        end;
      end;
    end
    else if  OraSession.Connected then
    begin
      try
        //OraSession.Disconnect;
        OraSession.Close;
        ClearListView();
        ClearListBox();
        btConnect.Caption := '连接';
        btStart.Enabled := false;
        edtTable.Enabled := false;
      except
        on e : Exception do
        begin
            showmessage('断开数据库失败'+#13#10+e.Message);
            btStart.Enabled := true;
        end;
      end;
    end;

end;

procedure TDbConfig.FormCreate(Sender: TObject);
var
    IniFileName : string;
    IniFile: TIniFile;
    I,nCountSvr:Integer;
    S:String;
begin
    edtPath.Text := ExtractFilePath(application.ExeName);
    btStart.Enabled := false;
    lvTables.Items.Clear();
    clbFields.Items.Clear();
    ButtonNext.Enabled :=false;
    ButtonPrev.Enabled :=false;
    m_nFileNumber:=0;
    m_nRecordNumber:=0;
    edtTable.Enabled := False;
    
    IniFileName := copy(Application.ExeName,1,length(Application.ExeName)-4) +'.ini';
    IniFile:= Tinifile.create(IniFileName);
    edtPath.Text := IniFile.ReadString('DB_CONFIG','SAVE_PATH','');
    nCountSvr := IniFile.ReadInteger('DB_CONFIG','SERVER_COUNT',0);
    for I:=1 to nCountSvr do
    begin
        S := Format('SERVER_%d',[nCountSvr-I+1]);
        S := IniFile.ReadString('DB_CONFIG',S,'');
        if (Trim(S)<>'') then
        begin
            cbOracleSID.Items.Add(S);
        end;
    end;
    cbOracleSID.ItemIndex := 0;

    IniFile.Free;
end;

procedure TDbConfig.SaveServer();
var
    IniFileName:string;
    IniFile:TInifile;
    nCountSvr:Integer;
    S:String;    
begin
    if(cbOracleSID.ItemIndex >=0) then exit;
    try
        IniFileName := copy(Application.ExeName,1,length(Application.ExeName)-4) +'.ini';
        IniFile:= TInifile.create(IniFileName);
        try
            nCountSvr := IniFile.ReadInteger('DB_CONFIG','SERVER_COUNT',0);
            S := Format('SERVER_%d',[nCountSvr+1]);
            IniFile.WriteString('DB_CONFIG', S, cbOracleSID.Text);
            IniFile.WriteInteger('DB_CONFIG','SERVER_COUNT',nCountSvr+1);
        finally
            IniFile.Free;
        end;
    except
        on e:exception do
        begin
            ShowMessage('exception:'+e.Message);
        end;
    end;
end;


procedure TDbConfig.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    if (OraSession.Connected) then
        OraSession.Close;
    action := caFree;
end;


////////////////////
procedure  TDbConfig.GetTableFields(const strTable:string);
var
    strSql:string;
begin
    if(strTable = '') then
    begin
        exit;
    end; 
    OraQuery.SQL.Clear;
    strSql := 'select column_name from user_tab_columns where table_name=upper(''' +  strTable
                + ''') order by column_name';
    OraQuery.SQL.Add(strSql);
    OraQuery.Open;
    while not OraQuery.Eof do
    begin
        clbFields.Items.Add(trim(OraQuery.FieldByName('column_name').AsString));
        OraQuery.Next;
    end;
    OraQuery.close;
    ButtonPrev.Enabled := false;
    ButtonNext.Enabled := false;
end;



/////////////////////////
procedure TDbConfig.btFilePathClick(Sender: TObject);
var
    strDirectory: string;
begin
    if (SelectDirectory('选择要保存的目录:', '', strDirectory)) then
    begin
        edtPath.Text :=  strDirectory;
    end;
end;

///////////////////////////
function TDbConfig.GetTableSelectFields(var strFields:string ):boolean;
var
    nIndex:integer;
begin
    result := false;
    for nIndex := 0 to clbFields.Items.Count - 1 do
    begin
        if (clbFields.Checked[nIndex])  then
        begin
            if(strFields = '') then
                strFields := clbFields.items[nIndex]
            else
                strFields := strFields + ',' +  clbFields.items[nIndex];
            result := true;
        end
    end;
end;

function  TDbConfig.GetFieldValue(const Value:string):string;
begin
    result:=trim(stringReplace(value,'''','''''',[rfReplaceAll]));
end;


function  TDbConfig.HasBlob(const TableName : String):Boolean;
var
    nIndex:integer;
    strSQL:String;
begin
    Result := False;
    strSQL := Format('select * from %s where  rownum <=1',[TableName]);
    OraQuery.SQL.Clear;
    OraQuery.SQL.Add(strSQL);
    OraQuery.Open; 
    try
        while (not OraQuery.Eof) do
        begin
            for  nIndex:=0  to  OraQuery.FieldCount-1 do
            begin
                if(OraQuery.Fields[nIndex].IsBlob)then
                begin
                    Result:=True;
                    exit;
                end;
            end;
            break;
        end;
    finally
        OraQuery.Close;
    end;
end;

function TDbConfig.GetFieldComment(const FieldName:string;const TableComment : TList):string;
var
    nLine:Integer;
    Obj:TMyObject;
begin
    Result :='';
    for nLine :=0 to   TableComment.Count-1 do
    begin
        Obj := TableComment[nLine];
        if(Obj.FieldName=FieldName)then
        begin
            Result := Obj.FieldValue;
            exit;
        end;
    end;
end;


///////////////////////////
function TDbConfig.BlobCreateFile(const RecordList : TList;const TableComment : TList):boolean;
var
    FileName:string;
    FullName:String;
    strPath:String;
    FileHandle : TextFile;
    nIndex:integer;
    FieldValue:string;
    FieldName:string;
    FieldType:TFieldType;
    strSQL:string;
    strWhere : string;
    strFieldLine:String;
    strValueLine:string;
    MyObject :TMyObject;
    ClobValue:String;
    strValue:string;
    strClob:string;
    nMaxTmpl:integer;
    nPos:integer;
    Field:TField;
    strSuffixe_CLOB:String;
    StrSuffixe_LOB:string;
    strPrefixion_TEMP : String;
    strTable:string;
    strUser:string;
begin
//ccs.batch_config.menu_functionid-13648.function_id-33.sql
    strTable := LowerCase(edtTable.Text);
    strUser := LowerCase(edtUser.Text);
// xx_CLOB.sql
    strSuffixe_CLOB := 'CLOB';
    StrSuffixe_LOB := 'LOB';
    strPrefixion_TEMP := 'T';
    nIndex:=0;
    //strWhere := edtWhere.Text;
    while(nIndex<RecordList.Count)do
    begin
        MyObject := RecordList[nIndex];

        if(strWhere = '') then
            strWhere := MyObject.FieldName
        else
            strWhere := strWhere + ' and ' + MyObject.FieldName;

        if(MyObject.FFieldType = ftString) then
            strWhere := strWhere + '=''' + MyObject.FieldValue + ''''
        else
            strWhere := strWhere + '=' + MyObject.FieldValue;

        if(MyObject.FieldValue='')then
            FieldValue := FieldValue + LowerCase(MyObject.FieldName) + '.'
        else
            FieldValue := FieldValue + LowerCase(MyObject.FieldName) + '-' + MyObject.FieldValue + '.';

        inc(nIndex);
    end;

    strPath := Format('%s.%s',[strUser,strTable]);
    if(edtPath.Text[length(edtPath.Text)]='\') then
        strPath := stringreplace(edtPath.Text,'/','\',[rfReplaceAll]) + strPath
    else
        strPath := stringreplace(edtPath.Text,'/','\',[rfReplaceAll]) + '\' + strPath;

    strPath := LowerCase(strPath);
    
    if not DirectoryExists(strPath) then
    begin
        if(not CreateDir(strPath)) then
        begin
            ShowMessage('CreateDir false');
            Result := false;
            exit;
        end;
    end;


    FieldValue := MidStr(FieldValue,1,Length(FieldValue) -1);
    FileName := format('%s.%s.%s_%s.sql',[strUser,strTable, FieldValue,strSuffixe_CLOB]);
    FullName := strPath + '\' +  FileName;
    if FileExists(FullName) then
    begin
        if(not DeleteFile(FullName)) then
        begin
            ShowMessage('DeleteFile false');
            result := false;
            exit;
        end;
    end;

    try
        AssignFile(FileHandle, FullName);
        Rewrite(FileHandle);

        strClob := Format('--%s,建立时间:%s--'+#13#10+#13#10+#13#10
                        +'--自动生成临时表%s_%s--',
                        [FileName,FormatDateTime('yyyy-MM-dd hh:nn:ss', Date+Time),strPrefixion_TEMP, strTable]);
        Writeln(FileHandle,strClob);


        strClob := Format('DECLARE'+#13#10
	    		        +'  v_count     number(10);'+#13#10
	     		        +'BEGIN'+#13#10
	                    +'select count(*) into v_count from user_tables  where table_name=upper(''%s_%s'');'+#13#10
	                    +'if v_count = 0 then'+#13#10
	                    +'  EXECUTE IMMEDIATE ''create table %s_%s as select * from %s.%s_%s where 1=2'';'+#13#10
 	                    +'end if;'+#13#10
 	                    +'end;'+#13#10
 	                    +'/'+#13#10
                        ,[strPrefixion_TEMP, strTable, strPrefixion_TEMP, strTable, strUser, strTable,StrSuffixe_LOB]);
        Writeln(FileHandle,strClob);
        Writeln(FileHandle,chr(13)+chr(10));



        strFieldLine := Format('--删除临时表中关于本文件要操作的记录--'+#13#10
                            +'delete from %s_%s where %s;',[strPrefixion_TEMP, strTable, strWhere]);
        Writeln(FileHandle,strFieldLine);
        Writeln(FileHandle,chr(13)+chr(10));


        strSQL := Format('select * from %s where  %s',[strTable, strWhere]);
        OraQuery.SQL.Clear;
        OraQuery.SQL.Add(strSQL);
        OraQuery.Open;

        OraQuery.First;
        while not OraQuery.Eof do
        begin
            Inc(m_nRecordNumber);
            //1 --head;
            strFieldLine := Format('insert into %s_%s (',[strPrefixion_TEMP, strTable]);
            strValueLine := 'values ('+#13#10;
            //2---mid
            for  nIndex:=0 to  clbFields.Count-1 do
            begin
                FieldName := clbFields.Items[nIndex];
                Field := OraQuery.FindField(FieldName);
                FieldValue := Field.AsString;
                if(Field.IsNull)and(not Field.IsBlob)then
                begin
                    strValueLine := strValueLine + ' null';
                end
                else
                begin
                    FieldType := Field.DataType;
                    case  FieldType of
                        ftString:
                        begin
                            strValueLine := strValueLine + '''' + GetFieldValue(FieldValue) + '''';
                        end;
                        ftSmallint,ftInteger,ftWord,ftFloat:
                        begin
                            strValueLine := strValueLine + FieldValue;
                        end;
                        ftDate, ftTime, ftDateTime:
                        begin
                            //DateTime := OraQuery.FieldByName(OraQuery.Fields[nIndex].FieldName).AsDateTime;
                            if  IsMatch(FieldValue,'\d{4}/\d{1,2}/\d{1,2}\s\d{1,2}:\d{1,2}:\d{1,2}') then
                                strValueLine := strValueLine + 'to_date('''+FieldValue+''',''yyyy/mm/dd hh24:mi:ss'')'
                            else if IsMatch(FieldValue,'\d{4}/\d{1,2}/\d{1,2}') then
                            begin
                                strValueLine := strValueLine + 'to_date('''+FieldValue+''',''yyyy/mm/dd'')';
                            end;
                        end;
                        ftOraClob:
                        begin
                            strValueLine := strValueLine + 'EMPTY_CLOB()';
                        end;
                        ftBlob,ftOraBlob:
                        begin
                            strValueLine := strValueLine + 'EMPTY_BLOB()';
                        end;
                        else
                        begin
                            showmessage('开发中...');
                        end;
                    end;
                end;
                strFieldLine := strFieldLine +  FieldName;
                //////////////////
                if (nIndex = OraQuery.FieldCount-1)  then
                begin
                    strFieldLine := strFieldLine + ')';
                    strValueLine := strValueLine + Format('        --%s,%s'+#13#10+') RETURNING rowid  INTO ROW_ID;',[FieldName, GetFieldComment(FieldName,TableComment)]);
                end
                else
                begin
                    strFieldLine := strFieldLine + ', ';
                    strValueLine := strValueLine + Format(',        --%s,%s'+#13#10,[FieldName, GetFieldComment(FieldName,TableComment)]);
                end;
            end;
            //biz用户下表 ACCEPT_BILL_DEF
            //clob
            nMaxTmpl := 32767;
            strClob := Format('--在临时表中生成一条记录信息--'+#13#10
                        +'DECLARE'+#13#10
	    	            +'  LOB             CLOB;'+#13#10
	    	            +'  BLOB_OBJ        BLOB;'+#13#10
		    	        +'  LOBVARCHAR	    VARCHAR2(%d);'+#13#10
			            +'  LOBLENGTH	    BINARY_INTEGER;'+#13#10
                        +'  POS 		    BINARY_INTEGER;'+#13#10
    			        +'  QUERY_STRING 	VARCHAR2(1000);'+#13#10
    				    +'  ROW_ID 	        VARCHAR2(64);'+#13#10
	    			    +'BEGIN',[nMaxTmpl]);
            Writeln(FileHandle,strClob);

            Writeln(FileHandle,strFieldLine);
            Writeln(FileHandle,strValueLine);

            for  nIndex:=0 to  clbFields.Count-1 do
            begin
                FieldName := clbFields.Items[nIndex];
                Field := OraQuery.FindField(FieldName);
                if (Field.IsBlob) then
                begin
                    FieldValue := Field.AsString;
                    FieldType := Field.DataType;
                    
                    strClob := Format('QUERY_STRING :=''select %s from %s_%s where rowid=:ROW_ID for update''; ',[FieldName, strPrefixion_TEMP, strTable]);
                    Writeln(FileHandle,strClob);

                        //分割大于lobvarchar上限的脚本
                    nPos := 1;
                    ClobValue := AnsiReplaceText(trim(FieldValue),#10,#13#10);
                    while true do
                    begin
                        strValue := my_copy(ClobValue, nPos, nMaxTmpl);
                        if( nPos = 1 )then
                            strClob := Format('POS := 1;'+#13#10
                                    +'LOBVARCHAR :=''%s'';'+#13#10
					                +'if (LOBVARCHAR is null) then'+#13#10
 					                +'  update %s_%s set %s=null where rowid=ROW_ID;'+#13#10
					                +'else'+#13#10
					                +'  LOBLENGTH := LENGTH( LOBVARCHAR );'+#13#10
					                +'  EXECUTE IMMEDIATE QUERY_STRING INTO LOB USING ROW_ID;'+#13#10
					                +'  DBMS_LOB.WRITE(LOB, LOBLENGTH, POS, LOBVARCHAR );'+#13#10
     				                +'end if;' +#13#10
                                    ,[AnsiReplaceText(AnsiReplaceText(strValue,'''',''''''),'&','&''||'''),strPrefixion_TEMP, strTable, FieldName])
                        else
                        begin
                            if(length(strValue)=0)then break;
                            if(FieldType = ftOraClob)then
                                strClob := Format('POS := POS+LOBLENGTH;'+#13#10
                                    +'LOBVARCHAR :=''%s'';'+#13#10
					                +'if (LOBVARCHAR is not null) then'+#13#10
					                +'  LOBLENGTH := LENGTH( LOBVARCHAR );'+#13#10
					                +'  EXECUTE IMMEDIATE QUERY_STRING INTO LOB USING ROW_ID;'+#13#10
					                +'  DBMS_LOB.WRITE(LOB, LOBLENGTH, POS, LOBVARCHAR );'+#13#10
     				                +'end if;' +#13#10
                                    ,[AnsiReplaceText(AnsiReplaceText(strValue,'''',''''''),'&','&''||''')])
                            else
                                strClob := Format('POS := POS+LOBLENGTH;'+#13#10
                                    +'LOBVARCHAR :=''%s'';'+#13#10
					                +'if (LOBVARCHAR is not null) then'+#13#10
					                +'  LOBLENGTH := LENGTH( LOBVARCHAR );'+#13#10
					                +'  EXECUTE IMMEDIATE QUERY_STRING INTO BLOB_OBJ USING ROW_ID;'+#13#10
					                +'  DBMS_LOB.WRITE(BLOB_OBJ, LOBLENGTH, POS, LOBVARCHAR );'+#13#10
     				                +'end if;' +#13#10
                                    ,[AnsiReplaceText(AnsiReplaceText(strValue,'''',''''''),'&','&''||''')])

                        end;
                        Writeln(FileHandle,strClob);
                        if(length(strValue) < nMaxTmpl)or(Length(ClobValue)<=nMaxTmpl)then break;
                        nPos := nPos + length(strValue);
                    end;
                    //分割完毕
                end;
            end;
            strClob := 'END;'+#13#10+'/'+#13#10;
            Writeln(FileHandle,strClob);
            OraQuery.Next;
        end;

        strFieldLine := Format('--临时表数据导入到用户模式表中--'+ #13#10
                        +'delete from %s.%s_%s where %s;',[strUser, strTable,StrSuffixe_LOB, strWhere]);
        Writeln(FileHandle,strFieldLine);
        strFieldLine := Format('insert into %s.%s_%s select * from %s_%s where %s;',
                    [strUser, strTable, StrSuffixe_LOB, strPrefixion_TEMP, strTable, strWhere]);
        Writeln(FileHandle,strFieldLine);
        strFieldLine := Format('delete from %s_%s where %s;',[strPrefixion_TEMP, strTable, strWhere]);
        Writeln(FileHandle,strFieldLine);

        CloseFile(FileHandle);
        OraQuery.Close;
    except
        result := false;
        showmessage('写文件失败！');
        exit;
    end;
    result := true;
end;


function PosRight(const SubStr, S: string): Integer;
var
    I,X: Integer;
    LenSubStr: Integer;
begin
    LenSubStr := Length(SubStr);
    I := Length(S) - LenSubStr + 1;
    while I >0 do
    begin
        if S[I] = SubStr[1] then
        begin
            X := 1;
            while (X < LenSubStr) and (S[I + X] = SubStr[X + 1]) do
                Inc(X);
            if (X = LenSubStr) then
            begin
                Result := I;
                exit;
            end;
        end;
        Dec(I);
    end;
    Result := 0;
end;


procedure TDbConfig.WriteLongStr(const FileHandle : TextFile;const Data:String);
var
    strFieldLine:string;
    MAX_LENGTH:Integer;
    strInput:String;
begin
    MAX_LENGTH := 128;
    strInput := Data;
    while(Length(strInput)>0)do
    begin
        if(Length(strInput)>MAX_LENGTH)then
        begin
            strFieldLine := MidStr(strInput,1,MAX_LENGTH);
            strFieldLine := MidStr(strInput,1,PosRight(',', strFieldLine));
            strInput := MidStr(strInput,Length(strFieldLine)+1,Length(strInput)-Length(strFieldLine));
        end
        else
        begin
            strFieldLine := strInput;
            strInput := '';
        end;
        Writeln(FileHandle,strFieldLine);
    end;
end;


////////////////////////////
function TDbConfig.NormalCreateFile(const RecordList : TList;const TableComment : TList):boolean;
var
    FileName:String;
    strPath:String;
    FullName:String;
    FileHandle : TextFile;
    nIndex:integer;
    FieldValue:string;
    FieldName:string;
    Field:TField;
    FieldType:TFieldType;
    strSQL:string;
    strWhere : string;
    strFieldLine:String;
    strValueLine:string;
    MyObject :TMyObject;
    strTable:string;
    strUser:string;
begin
//ccs.batch_config.menu_functionid-13648.function_id-33.sql
    strTable := LowerCase(edtTable.Text);
    strUser := LowerCase(edtUser.Text);
    nIndex:=0;
    //strWhere := edtWhere.Text;
    while(nIndex<RecordList.Count)do
    begin
        MyObject := RecordList[nIndex];

        if not (MyObject.FieldValue='') then
        begin
            if(strWhere = '') then
                strWhere := MyObject.FieldName
            else
                strWhere := strWhere + ' and ' + MyObject.FieldName;

            if(MyObject.FFieldType = ftString) then
                strWhere := strWhere + '=''' + MyObject.FieldValue + ''''
            else
                strWhere := strWhere + '=' + MyObject.FieldValue;
        end;
        
        if(MyObject.FieldValue='')then
            FieldValue := FieldValue + LowerCase(MyObject.FieldName) + '.'
        else
            FieldValue := FieldValue + LowerCase(MyObject.FieldName) + '-' + MyObject.FieldValue + '.';

        inc(nIndex);
    end;

    strPath := Format('%s.%s',[strUser,strTable]);
    if(edtPath.Text[length(edtPath.Text)]='\') then
        strPath := stringreplace(edtPath.Text,'/','\',[rfReplaceAll]) + strPath
    else
        strPath := stringreplace(edtPath.Text,'/','\',[rfReplaceAll]) + '\' + strPath;

    strPath := LowerCase(strPath);
    
    if not DirectoryExists(strPath) then
    begin
        if(not CreateDir(strPath)) then
        begin
            ShowMessage('CreateDir false');
            result := false;
            exit;
        end;
    end;

    FileName := Format('%s.%s.%ssql',[strUser,strTable, FieldValue]);
    FullName := strPath + '\' +  FileName;
    if FileExists(FullName) then
    begin
        if(not DeleteFile(FullName)) then
        begin
            ShowMessage('DeleteFile false');
            result := false;
            exit;
        end;
    end;

    result := true;
    AssignFile(FileHandle, FullName);
    Rewrite(FileHandle);
    try
        try
            strFieldLine := Format('--%s,建立时间:%s--'+#13#10+#13#10,
                        [FileName,FormatDateTime('yyyy-MM-dd hh:nn:ss', Date+Time)]);
            Writeln(FileHandle,strFieldLine);

            strFieldLine := Format('--%s.%s--'+#13#10,
                        [strUser, strTable]);
            Writeln(FileHandle,strFieldLine);

            strFieldLine := Format('delete from %s.%s where %s;',[strUser, strTable,strWhere]);
            Writeln(FileHandle,strFieldLine);
            Writeln(FileHandle,chr(13)+chr(10));

            OraQuery.SQL.Clear;
            strSQL := format('select * from %s where  %s ',[strTable, strWhere]);
            OraQuery.SQL.Add(strSQL);
            if(edtInfo.Text<>'')then
            begin
                OraQuery.SQL.Append(edtInfo.Text);
            end;
            OraQuery.Open;
            OraQuery.First;
            while not OraQuery.Eof do
            begin
                Inc(m_nRecordNumber);
                //1 --head;
                strFieldLine := Format('insert into %s.%s (',[strUser, strTable]);
                strValueLine := 'values ('+#13#10;
                //2---mid
                for  nIndex:=0 to  clbFields.Count-1 do
                begin
                    FieldName := clbFields.Items[nIndex];
                    Field := OraQuery.FindField(FieldName);
                    if(Field.IsNull) then
                    begin
                        strValueLine := strValueLine + ' null';
                    end
                    else
                    begin
                        FieldValue := Field.AsString;
                        FieldType := Field.DataType;
                        case  FieldType of
                            ftString:
                            begin
                                strValueLine := strValueLine + '''' + GetFieldValue(FieldValue) + '''';
                            end;
                            ftSmallint,ftInteger,ftWord,ftFloat:
                            begin
                                strValueLine := strValueLine + FieldValue;
                            end;
                            ftDate, ftTime, ftDateTime:
                            begin
                                //DateTime := OraQuery.FieldByName(OraQuery.Fields[nIndex].FieldName).AsDateTime;
                                if  IsMatch(FieldValue,'\d{4}/\d{1,2}/\d{1,2}\s\d{1,2}:\d{1,2}:\d{1,2}') then
                                    strValueLine := strValueLine + 'to_date('''+FieldValue+''',''yyyy/mm/dd hh24:mi:ss'')'
                                else if IsMatch(FieldValue,'\d{4}/\d{1,2}/\d{1,2}') then
                                begin
                                    strValueLine := strValueLine + 'to_date('''+FieldValue+''',''yyyy/mm/dd'')';
                                end;
                            end;
                            else
                            begin
                                showmessage('开发中...');
                            end;
                        end;
                    end;
                    strFieldLine := strFieldLine +  FieldName;
                    //////////////////
                    if (nIndex = clbFields.Count-1)  then
                    begin
                        strFieldLine := strFieldLine + ')';
                        strValueLine := strValueLine + Format('        --%s,%s'+#13#10+');',[FieldName, GetFieldComment(FieldName,TableComment)]);
                    end
                    else
                    begin
                        strFieldLine := strFieldLine + ', ';
                        strValueLine := strValueLine + Format(',        --%s,%s'+#13#10,[FieldName, GetFieldComment(FieldName,TableComment)]);
                    end;
                end;

                //Writeln(FileHandle,strFieldLine);
                WriteLongStr(FileHandle,strFieldLine);
                Writeln(FileHandle,strValueLine);
                Writeln(FileHandle,'');
                OraQuery.Next;
            end;
            OraQuery.Close;
        except
            on  e:Exception do
            begin
                showmessage('查询数据库出错:'+#13#10+e.Message);
                result := false;
            end;
        end;
    finally
        CloseFile(FileHandle);
    end; 
end;


//////////////////////////
procedure TDbConfig.btStartClick(Sender: TObject);
var
    strSql:string;
    strFields:string;
    TableSelected:TList;
    RecordsSelected:TList;
    MyObj:TMyObject;
    nRow,nIndex:integer;
    FiledName:string;
    n:integer;
    bHasClob:boolean;
    IniFileName:string;
    IniFile:TInifile;
    TableComment:TList;
    strInfo:String;
begin
    if (edtPath.Text='') or (not DirectoryExists(edtPath.Text)) then
    begin
        showmessage('请选择保存目录！');
        exit;
    end;

    if(edtTable.Text='') then
    begin
        showmessage('请选择数据表信息！');
        exit;
    end;

    if not GetTableSelectFields(strFields) then
    begin
        showmessage('请选择数据表的主域信息！');
        exit;
    end;

    TableSelected := TList.Create;
    TableComment :=  TList.Create;
    try
        /////
        OraQuery.SQL.Clear;
        if(edtWhere.Text = '') then
            strSql := Format('select %s from %s  group by %s',[strFields, edtTable.Text, strFields])
        else
            strSql := Format('select %s from %s where %s group by %s',[strFields, edtTable.Text, edtWhere.Text, strFields]);
        OraQuery.SQL.Add(strSql);
        try
            OraQuery.Open;
            while not OraQuery.Eof do
            begin
                RecordsSelected := TList.Create;
                for nRow := 0 to OraQuery.FieldCount-1 do
                begin
                    MyObj := TMyObject.Create;
                    FiledName := OraQuery.Fields[nRow].FieldName;
                    MyObj.FieldName := FiledName;
                    MyObj.FieldValue := OraQuery.FieldByName(FiledName).AsString;
                    MyObj.FieldType :=  OraQuery.Fields[nRow].DataType;
                    RecordsSelected.Add(MyObj);
                end;
                TableSelected.Add(RecordsSelected);
                OraQuery.Next;
            end;
            OraQuery.close;
        except
            ShowMessage('表限制语句有误');
            exit;
        end;
        //////
        OraQuery.SQL.Clear;
        strSql := Format('select * from user_col_comments where table_name=upper(''%s'')',[edtTable.Text]);
        OraQuery.SQL.Add(strSql);
        OraQuery.Open;
        while not OraQuery.Eof do
        begin
            MyObj := TMyObject.Create;
            MyObj.FieldName := OraQuery.FieldByName('COLUMN_NAME').AsString;
            MyObj.FieldValue := OraQuery.FieldByName('COMMENTS').AsString;
            TableComment.Add(MyObj);
            OraQuery.Next;
        end;
        OraQuery.close;

        m_nFileNumber:=0;
        m_nRecordNumber:=0;
        /////
        bHasClob := HasBlob(edtTable.Text);
        for  nIndex:=0 to TableSelected.Count-1 do
        begin
            RecordsSelected := TableSelected[nIndex];
            if RecordsSelected <> nil then
            begin
                if (bHasClob) then
                begin
                    if (not BlobCreateFile(RecordsSelected,TableComment)) then
                    begin
                        showmessage('操作失败！');
                        exit;
                    end;
                end
                else if (not NormalCreateFile(RecordsSelected,TableComment)) then
                begin
                    showmessage('操作失败！');
                    exit;
                end;
                Application.ProcessMessages;
            end;
        end;

        IniFileName := copy(Application.ExeName,1,length(Application.ExeName)-4) +'.ini';
        IniFile:= TInifile.create(IniFileName);
        IniFile.WriteString('DB_CONFIG','SAVE_PATH',edtPath.Text);
        IniFile.Free;

        m_nFileNumber :=  TableSelected.Count;
        strInfo := Format('成功处理数据记录数: %d'+#13#10
                        + '成功生成文件数:  %d'+#13#10,[m_nRecordNumber, m_nFileNumber]);
        Application.MessageBox(PChar(strInfo), '操作成功',MB_OK);
    finally
        ///
        for  nIndex:=0 to TableSelected.Count-1 do
        begin
            RecordsSelected := TableSelected[nIndex];
            for  n:=0 to RecordsSelected.Count - 1 do
            begin
                MyObj := RecordsSelected[n];
                MyObj.Free;
            end;
            RecordsSelected.Clear;
            RecordsSelected.Free;
        end;
        TableSelected.Free;
        /////
        for  nIndex:=0 to TableComment.Count-1 do
        begin
            MyObj := TableComment[nIndex];
            MyObj.Free;
        end;
        TableComment.Clear;
        TableComment.Free;
    end;
end;

procedure TDbConfig.ClearListBox();
begin
    clbFields.Items.Clear;
end;

procedure TDbConfig.lvTablesSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
    if (Item <> nil) and (Selected) then
    begin
        edtTable.Text := Item.Caption;
        edtTable.SelStart := Length(edtTable.Text);
        ClearListBox();
        GetTableFields(Item.Caption);
    end;
end;


procedure TDbConfig.ProcessMove(Button: TUDBtnType);
var
    nIndex:integer;
    nIndexNew:integer;
begin
    nIndex := clbFields.ItemIndex;
    if(Button = btPrev) then
        nIndexNew:=nIndex-1
    else
        nIndexNew:=nIndex+1;

    clbFields.Items.Exchange(nIndex, nIndexNew);

    clbFieldsClick(nil);
end;




procedure TDbConfig.ButtonPrevClick(Sender: TObject);
begin
    if(clbFields.Count<=0) or (clbFields.ItemIndex<=0)then
    begin
        exit;
    end;
    ProcessMove(btPrev);
end;


procedure TDbConfig.ButtonNextClick(Sender: TObject);
begin
    if(clbFields.Count<=0) or (clbFields.ItemIndex>=clbFields.Count-1)then
    begin
        exit;
    end;
    ProcessMove(btNext);
end;

procedure TDbConfig.clbFieldsClick(Sender: TObject);
begin
    ButtonNext.Enabled :=true;
    ButtonPrev.Enabled :=true;

    if(clbFields.ItemIndex=0) then
    begin
        ButtonPrev.Enabled :=false;
    end;

    if(clbFields.ItemIndex=clbFields.Count-1) then
    begin
        ButtonNext.Enabled :=false;
    end;
end;

procedure TDbConfig.edtTableKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
    ListItem:TListItem;
begin
    if(VK_RETURN = Key)then
    begin
        {FindCaption 方法
        此方法的调用可以搜索并返回一个TListItem 类型的项。FindCaption 方法中有5 个参数，功能如下。
        StartIndex：Integer 类型，用于指定开始搜索的起始位置。
        Value：String 类型，指定要搜索的项的标题符合的内容。
        Partial：Boolean 类型，取True 值，查找标题开头为Value 参数指定的项；取False 值，查找标题与Value 参数指定的内容相同的项。
        Inclusive：Boolean 类型，取True 值，被StartIndex 指定的项是第1 个被选中的；取False 值，开始查找的位置从StartIndex 拟定的下一个位置开始。
        Warp：Boolean 类型，取True 值，搜索将从开始找到最后；取False 值，搜索从StartIndex 位开始查找，找到最后。
        FindCaption 方法返回的是第1 个被找到的符合条件的项，如果没找到符合条件的，则返回列表中的第1 项。}
        ListItem := lvTables.FindCaption(0,edtTable.Text,  true, false, true);
        if(ListItem = nil)then
        begin
            ClearListBox();
            lvTables.Selected := ListItem;
            edtTable.Text := '';
        end
        else
        begin
            edtTable.Text :=ListItem.Caption;
            edtTable.SelStart := Length(edtTable.Text);
            lvTables.Selected := ListItem;
            lvTables.Selected.MakeVisible(true);
        end;
    end;
end;

procedure TDbConfig.edtTableExit(Sender: TObject);
var
    ListItem:TListItem;
begin
    ListItem := lvTables.FindCaption(0,edtTable.Text,  false, false, true);
    if(ListItem = nil)then
    begin
        ClearListBox();
        edtTable.Text := '';
        lvTables.Selected := ListItem;
    end
    else
    begin
        edtTable.Text :=ListItem.Caption;
        edtTable.SelStart := Length(edtTable.Text);
        lvTables.Selected := ListItem;
        lvTables.Selected.MakeVisible(true);
    end;
end;


procedure TDbConfig.btOpenDirClick(Sender: TObject);
begin
  if DirectoryExists(edtPath.Text) then
  begin
        ShellExecute(application.handle, 'explore', pansichar(edtPath.Text), NIL, NIL, SW_SHOW);
  end
  else
  begin
    showMessage('目录不存在:'+edtPath.Text);
  end;

end;

initialization
  OleInitialize(nil);
  //注册工具类
  RegisteFormFactory('db_config配置导出',IFormCreator_DbConfig.create);
finalization
  OleUninitialize;


end.
