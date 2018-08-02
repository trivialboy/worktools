unit UnitDBConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Math,
  UnitFormFactory,   ActiveX,   RegExpr, IniFiles, UnitPublic, StrUtils, ShlObj,
  Dialogs, DB, MemDS, DBAccess, Ora, StdCtrls, CheckLst, ComCtrls, Mask, ShellAPI,
  ExtCtrls, FileCtrl, ShellCtrls,SyncObjs, DAScript, OraScript;


type
  TLogRow = class(TObject)
    FFileName: String;
    FRowID: String;
    FSql: String;
    FMoreIndex:integer;
  protected
    procedure   SetFileName( const F: String);
    procedure   SetRowID( const R: String);
    procedure   SetSql( const S: String);
    procedure   SetMoreIndex( const I: Integer);

  public
    constructor Create(); virtual;
    destructor  Destroy; virtual;
    property    FileName: String read FFileName write SetFileName;
    property    RowID: String read FRowID write SetRowID;
    property    Sql: String read FSql write SetSql;
    property    MoreIndex: integer read FMoreIndex write SetMoreIndex;

  end;

type
  TMyObject = class(TObject)
    FFieldName: String;
    FFieldValue: String;
    FFieldType: TFieldType;
    FIsNull: Boolean;
    //FImes: TList;
  protected
    procedure   SetFieldName( const S: String);
    procedure   SetFieldValue( const V: String);
    procedure   SetFieldType( const T: TFieldType);
    procedure   SetNull( const B: Boolean);
  public
    constructor Create(); virtual;
    destructor  Destroy; virtual;
    property    FieldName: String read FFieldName write SetFieldName;
    property    FieldValue: String read FFieldValue write SetFieldValue;
    property    FieldType: TFieldType read FFieldType write SetFieldType;
    property    IsNull: Boolean read FIsNull write SetNull;

    { Public declarations }
  end;




  TDbConfig = class(TForm)
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
    Panel7: TPanel;
    edtTable: TEdit;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    ButtonPrev: TButton;
    ButtonNext: TButton;
    Panel8: TPanel;
    tmResult: TMemo;
    Panel9: TPanel;
    Label8: TLabel;
    edtWhere: TEdit;
    edtInfo: TEdit;
    Label9: TLabel;
    GroupBox2: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    edtAlias: TEdit;
    edtTableAlias: TEdit;
    chkClob: TCheckBox;
    Label6: TLabel;
    btFilePath: TButton;
    Button1: TButton;
    btStart: TButton;
    btnResult: TButton;
    Panel10: TPanel;
    lvUserTables: TListView;
    Panel11: TPanel;
    lvTables: TListView;
    Splitter3: TSplitter;
    Panel12: TPanel;
    mmoSql: TMemo;
    Panel13: TPanel;
    clbFields: TCheckListBox;
    Splitter4: TSplitter;
    Panel14: TPanel;
    chkDefine: TCheckBox;
    chkOpt: TCheckBox;
    edtNumber: TEdit;
    UpDown1: TUpDown;
    OraSession: TOraSession;
    Button2: TButton;
    cbbPath: TComboBox;
    edtViewLob: TEdit;
    lbl1: TLabel;
    ButtonDele: TButton;
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
    procedure edtPathKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure btnResultClick(Sender: TObject);
    procedure lvUserTablesSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure Button2Click(Sender: TObject);
    procedure edtTableChange(Sender: TObject);
    procedure edtTableEnter(Sender: TObject);
    procedure ButtonDeleClick(Sender: TObject);
  protected
    m_nFileNumber:Integer;
    m_nMaxCount:Integer;
    m_nRecordNumber:Integer;
    m_strIniFileName:String;
    m_bProcessIng:Boolean;
    m_strRealTable:String;
    m_listTableRowID:TStringList;
    m_listRow:TList;
    m_HandleLog : TFileStream;
    m_strOrderValue:String;
    m_bTableNameChange:Boolean;

  private
    procedure   GetUserTables();
    procedure   GetTableFields(const strTable:string);
    function    GetTableSelectFields():string;
    function    NormalCreateFile(const RecordList : TList;const TableComment : TList):boolean;
    function    BlobCreateFile(const RecordList : TList;const TableComment : TList):boolean;
    function    GetFieldValue(const Value:string):string;
    procedure   ProcessMove(Button: TUDBtnType);
    procedure   ClearListView();
    function    HasBlob(const TableName : String):Boolean;
    procedure   ClearListBox();
    function    GetFieldComment(const FieldName:string;const TableComment : TList):string;
    procedure   WriteLongStr(const FileHandle : TextFile; const Data:String);

    procedure   SavePaths();
    procedure   LoadPaths();

    procedure   SaveServer();
    procedure   LoadServer();
    procedure   SaveTables();
    procedure   LoadTables();
    function    LoadTableFields():Boolean;
    procedure   SaveTableFields();
    procedure   ClearUserListView();
    procedure   SaveTableFDef();
    procedure   LoadTableFDef();
    procedure   LoadAliasUser();
    procedure   SaveAliasUser();
    procedure   LoadAliasTable();
    procedure   SaveAliasTable();
    
    function    GetGroupSqlList(var ResultList:TStringList;var SpecialList:TStringList):Boolean;
    function    GetGroupListBySQL(const strSql: String; var ResultList:TList):Boolean;

    function    OptFieldData(const nField:Integer; const cTable:byte; var strWhere:String; var strGroupby:String):Boolean;
    function    GetOptimizeSql(var ResultList:TStringList):Boolean;

    procedure   GetCreateFileWhere(const RecordList : TList; var strWhere:String; var FieldValue:String);
    function    DeletePathFile(const strUser:String; const strTable:String; const strFile:String; var strFullFile:String;const bClob:Boolean=false):Boolean;
    procedure   GetTableComment(var TableComment:TList);
    function    CheckTableFields():boolean;

    procedure   GenerateFile(const strGroupSql:String; const SpecialList:TStringList=nil);
    function    CreateTempTable(const strTable:String;var strTempTable:String):boolean;
    function    DropTempTable(const strTempTable:String):boolean;
    function    ExecuteSql(const strExecuteSql:String):boolean;
    function    GetOrderString():String;
    function    IsReject(const RecordsSelected:TList; const SpecialList:TStringList):Boolean;
    function    IsBetween(const strName, strValue:String; const RecordsSelected:TList):Boolean;
    function    GetRealGroupSql(const strGroupSql:String):String;
    Function    GetRealWhere(const strWhere:String; const cTable:byte):String;
    function    AddRowID(const strRowID,strFile,strSql:String):Boolean;
    procedure   LogDebug(const strData:String);
    function    CreateSpecialRecord(const strLine:String;var Records:TList):Boolean;
    function    CheckSpecialList(const SpecialList:TStringList):Boolean;
    function    CheckSpecialRecord(const ListSmall,ListBig:TList):Boolean;
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


function strSplit(const str,subStr:string;var List:TStringList):boolean;
var
    nPos:Integer;
    strTemp:String;
    strData:String;
begin
    result:=false;
    strData := str;
    while (strData<>'') do
    begin
        nPos := PosEx(subStr,strData);
        //nPos2 := PosEx(#13#10,strData);
        //nPos := math.Min(nPos1,nPos2);
        if(nPos =0)then break;
        strTemp := trim(Midstr(strData, 1, nPos-1));
        if(strTemp <>'')then List.Add(strTemp);
        strData := trim(Midstr(strData,nPos+length(subStr),length(strData)-nPos-length(subStr)+1));
    end;
    if(trim(strData)<>'') then List.Add(trim(strData));
    result := true;
end;

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

constructor TLogRow.Create();
begin
    inherited Create();
end;

destructor TLogRow.Destroy;
begin
end;


procedure   TLogRow.SetFileName( const F: String);
begin
    FFileName := F;
end;

procedure   TLogRow.SetRowID( const R: String);
begin
    FRowID := R;
end;

procedure   TLogRow.SetSql( const S: String);
begin
    FSql := S;
end;


procedure   TLogRow.SetMoreIndex( const I: Integer);
begin
    FMoreIndex := I;
end;



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

procedure   TMyObject.SetNull( const B: Boolean);
begin
    FIsNull := B;
end;






procedure   TDbConfig.ClearUserListView();
var
    ListItem : TListItem;
    nIndex : integer;
begin
    for  nIndex:=0 to lvUserTables.Items.Count do
    begin
        ListItem := lvUserTables.Items[nIndex];
        if(ListItem<>nil)then
        begin
            ListItem.Free;
        end;
    end;
    lvUserTables.Items.Clear;
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
        btnResult.Enabled := True;
        edtTable.Enabled := true;
        SaveServer();

        LoadTables();
                
      except
        on e : Exception do
        begin
            showmessage('连接数据库失败'+#13#10+e.Message);
            btStart.Enabled := false;
             btnResult.Enabled := False;
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
        btnResult.Enabled := False;
        edtTable.Enabled := false;
      except
        on e : Exception do
        begin
            showmessage('断开数据库失败'+#13#10+e.Message);
            btStart.Enabled := true;
            btnResult.Enabled := True;
        end;
      end;
    end;

end;

procedure TDbConfig.FormCreate(Sender: TObject);
var
    strLogFile:String;
begin
    cbbPath.Text := ExtractFilePath(application.ExeName);
    cbbPath.Text := '';
    btStart.Enabled := false;
    lvTables.Items.Clear();
    clbFields.Items.Clear();
    ButtonNext.Enabled :=false;
    ButtonPrev.Enabled :=false;
    ButtonDele.Enabled :=false;
    m_nFileNumber:=0;
    m_nRecordNumber:=0;
    edtTable.Enabled := False;
    tmResult.Visible:=True;
    btnResult.Enabled := False;
    m_strIniFileName := copy(Application.ExeName,1,length(Application.ExeName)-4) +'.ini';
    mmoSql.Lines.Clear;
    LoadServer();
//    LoadTableFields();
    LoadPaths();
    m_bProcessIng := False;
    m_nMaxCount :=0;
    m_listTableRowID := TStringList.Create;
    m_listTableRowID.CaseSensitive := True;
    m_listRow := TList.Create;

    strLogFile :=copy(Application.ExeName,1,length(Application.ExeName)-4) +'.log';
    m_HandleLog := TFileStream.Create(strLogFile,fmShareDenyNone);
    m_bTableNameChange := False;

end;


procedure TDbConfig.LoadAliasUser();
var
    IniFile:TInifile;
    H:String;
    strTmp:String;
begin
    IniFile:= Tinifile.create(m_strIniFileName);
    try
        H := cbOracleSID.text + '_' + edtUser.text + '_' + edtTable.Text + '_';
        strTmp := IniFile.ReadString('DB_CONFIG',H+'ALIAS_USER','');
        edtAlias.text := strTmp;
    finally
        IniFile.Free;
    end;
end;

procedure TDbConfig.SaveAliasUser();
var
    IniFile:TInifile;
    H:String;
begin
    try
        IniFile:= TInifile.create(m_strIniFileName);
        try
            H := cbOracleSID.text + '_' + edtUser.text + '_' + edtTable.Text + '_';
            IniFile.WriteString('DB_CONFIG', H+'ALIAS_USER', edtAlias.Text);
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


procedure TDbConfig.LoadAliasTable();
var
    IniFile:TInifile;
    H:String;
    S,strTmp:String;
    nCountSvr:integer;
begin
    IniFile:= Tinifile.create(m_strIniFileName);
    try
        H := cbOracleSID.text + '_' + edtUser.text + '_' + edtTable.Text+'_';
        edtTableAlias.text := IniFile.ReadString('DB_CONFIG',H+'ALIAS_TABLE','');
        edtInfo.text := IniFile.ReadString('DB_CONFIG',H+'ORDER','');
        edtWhere.text := IniFile.ReadString('DB_CONFIG',H+'WHERE','');
        edtViewLob.text := IniFile.ReadString('DB_CONFIG',H+'ALIAS_LOBVIEW','');

        strTmp := IniFile.ReadString('DB_CONFIG',H+'PATH','');
        if(cbbPath.Items.IndexOf(strTmp)<0)then
        begin
            if(strTmp<>'')then
            begin
                cbbPath.ItemIndex := cbbPath.Items.Add(strTmp);
                nCountSvr := IniFile.ReadInteger('DB_CONFIG','PATH_COUNT',0);
                S := Format('PATH_%d',[nCountSvr+1]);
                IniFile.WriteString('DB_CONFIG', S, cbbPath.Text);
                IniFile.WriteInteger('DB_CONFIG','PATH_COUNT',nCountSvr+1);
                IniFile.WriteInteger('DB_CONFIG','CURRENT_PATHINDEX',nCountSvr);
            end
            else
            begin
                cbbPath.Text := '';
            end;
        end
        else
        begin
            cbbPath.ItemIndex := cbbPath.Items.IndexOf(strTmp);
        end;
    finally
        IniFile.Free;
    end;
end;

procedure TDbConfig.SaveAliasTable();
var
    IniFile:TInifile;
    H:String;
begin
    try
        IniFile:= TInifile.create(m_strIniFileName);
        try
            H := cbOracleSID.text + '_' + edtUser.text + '_'+ edtTable.Text+'_';
            IniFile.WriteString('DB_CONFIG', H+'ALIAS_TABLE', edtTableAlias.Text);
            IniFile.WriteString('DB_CONFIG', H+'ORDER', edtInfo.Text);
            IniFile.WriteString('DB_CONFIG', H+'WHERE', edtWhere.Text);
            IniFile.WriteString('DB_CONFIG', H+'PATH', cbbPath.Text);
            IniFile.WriteString('DB_CONFIG', H+'ALIAS_LOBVIEW', edtViewLob.Text); 
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




procedure TDbConfig.LoadServer();
var
    IniFile:TInifile;
    nCountSvr:Integer;
    S:String;
    I:Integer;
begin
    IniFile:= Tinifile.create(m_strIniFileName);
    try
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
        cbOracleSID.ItemIndex := IniFile.ReadInteger('DB_CONFIG','CURRENT_INDEX',0);

    finally
        IniFile.Free;
    end;
end;

procedure TDbConfig.SaveServer();
var
    IniFile:TInifile;
    nCountSvr:Integer;
    S:String;
begin
    try
        IniFile:= TInifile.create(m_strIniFileName);
        try
            if(cbOracleSID.ItemIndex<0) then
            begin
                nCountSvr := IniFile.ReadInteger('DB_CONFIG','SERVER_COUNT',0);
                S := Format('SERVER_%d',[nCountSvr+1]);
                IniFile.WriteString('DB_CONFIG', S, cbOracleSID.Text);
                IniFile.WriteInteger('DB_CONFIG','SERVER_COUNT',nCountSvr+1);
                IniFile.WriteInteger('DB_CONFIG','CURRENT_INDEX',nCountSvr);
            end
            else
            begin
                IniFile.WriteInteger('DB_CONFIG','CURRENT_INDEX',cbOracleSID.ItemIndex);
            end;
            
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


procedure TDbConfig.LoadPaths();
var
    IniFile:TInifile;
    nCountSvr:Integer;
    S:String;
    I:Integer;
begin
    IniFile:= Tinifile.create(m_strIniFileName);
    try
        nCountSvr := IniFile.ReadInteger('DB_CONFIG','PATH_COUNT',0);
        if(nCountSvr>0)then
        begin
            for I:=1 to nCountSvr do
            begin
                S := Format('PATH_%d',[nCountSvr-I+1]);
                S := IniFile.ReadString('DB_CONFIG',S,'');
                if (Trim(S)<>'') then
                begin
                    if(cbbPath.Items.IndexOf(S)<0)then
                        cbbPath.Items.Add(S);
                end;
            end;
            cbbPath.ItemIndex := IniFile.ReadInteger('DB_CONFIG','CURRENT_PATHINDEX',0);
        end;
    finally
        IniFile.Free;
    end;
end;

procedure TDbConfig.SavePaths();
var
    IniFile:TInifile;
    nCountSvr:Integer;
    S:String;
begin
    try
        IniFile:= TInifile.create(m_strIniFileName);
        try
            if(cbbPath.ItemIndex<0)and(cbbPath.Items.IndexOf(cbbPath.Text)<0) then
            begin
                nCountSvr := IniFile.ReadInteger('DB_CONFIG','PATH_COUNT',0);
                S := Format('PATH_%d',[nCountSvr+1]);
                IniFile.WriteString('DB_CONFIG', S, cbbPath.Text);
                IniFile.WriteInteger('DB_CONFIG','PATH_COUNT',nCountSvr+1);
                IniFile.WriteInteger('DB_CONFIG','CURRENT_PATHINDEX',nCountSvr);
            end
            else
            begin
                IniFile.WriteInteger('DB_CONFIG','CURRENT_PATHINDEX',cbbPath.ItemIndex);
            end;
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




function TDbConfig.LoadTableFields():Boolean;
var
    IniFile:TInifile;
    nCount:Integer;
    S:String;
    I:Integer;
    ListItem:TListItem;
    H:String;
    B:Boolean;
    nItemIndex:Integer;
begin
    Result:=False;
    clbFields.Items.Clear;
    IniFile:= Tinifile.create(m_strIniFileName);
    try
        H:= cbOracleSID.Text +'_' + edtUser.Text+ '_' + edtTable.Text + '_';
        nCount := IniFile.ReadInteger('DB_CONFIG',H+'FIELD_COUNT',0);
        if(nCount=0)then
            exit;


        for I:=1 to nCount do
        begin
            S := Format(H+'FIELD_%d_NAME',[I]);
            S := IniFile.ReadString('DB_CONFIG',S,'');
            nItemIndex := clbFields.Items.Add(S);
            S := Format(H+'FIELD_%d_CHECKED',[I]);
            B := IniFile.ReadBool('DB_CONFIG',S,False);
            clbFields.Checked[nItemIndex] := B;
        end;
    finally
        IniFile.Free;
    end;
    Result:=True;
end;


procedure TDbConfig.SaveTableFields();
var
    IniFile:TInifile;
    I:Integer;
    S:String;
    H:String;
begin
    try
        IniFile:= TInifile.create(m_strIniFileName);
        try
            H:= cbOracleSID.Text +'_' + edtUser.Text+ '_' + edtTable.Text + '_';
            IniFile.WriteInteger('DB_CONFIG',H+'FIELD_COUNT',clbFields.Count);
            for I:=1 to clbFields.Count do
            begin
                S := Format(H+'FIELD_%d_NAME',[I]);
                IniFile.WriteString('DB_CONFIG', S, clbFields.Items[I-1]);
                S := Format(H+'FIELD_%d_CHECKED',[I]);
                IniFile.WriteBool('DB_CONFIG', S, clbFields.Checked[I-1]);
            end;
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

procedure TDbConfig.LoadTableFDef();
var
    IniFile:TInifile;
    nCount:Integer;
    S:String;
    I:Integer;
    ListItem:TListItem;
    H:String;
    B:Boolean;
begin
    mmoSql.Lines.Clear;
    IniFile:= Tinifile.create(m_strIniFileName);
    try
        H:= cbOracleSID.Text +'_' + edtUser.Text+ '_' + edtTable.Text + '_';
        chkDefine.Checked := IniFile.ReadBool('DB_CONFIG',H+'FDEF_CHECKED', False);
        chkOpt.Checked := IniFile.ReadBool('DB_CONFIG',H+'FOPT_CHECKED', False);
        if(chkDefine.Checked) then
        begin
            nCount := IniFile.ReadInteger('DB_CONFIG',H+'FDEF_COUNT',0);
            if(nCount=0)then
                exit;

            for I:=1 to nCount do
            begin
                S := Format(H+'FDEF_%d',[I]);
                S := IniFile.ReadString('DB_CONFIG',S,'');
                mmoSql.Lines.Add(S);
            end;
        end;
        if(chkOpt.Checked) then
        begin
            edtNumber.text := Format('%d',[IniFile.ReadInteger('DB_CONFIG',H+'FOPT_NUMBER',0)]);
        end; 
    finally
        IniFile.Free;
    end;
end;



procedure TDbConfig.SaveTableFDef();
var
    IniFile:TInifile;
    I:Integer;
    S:String;
    H:String;
begin
    try
        IniFile:= TInifile.create(m_strIniFileName);
        try
            H:= cbOracleSID.Text +'_' + edtUser.Text+ '_' + edtTable.Text + '_';
            IniFile.WriteBool('DB_CONFIG',H+'FDEF_CHECKED',chkDefine.Checked);
            IniFile.WriteBool('DB_CONFIG',H+'FOPT_CHECKED',chkOpt.Checked);
            if(chkDefine.Checked)then
            begin
                IniFile.WriteInteger('DB_CONFIG',H+'FDEF_COUNT',mmoSql.Lines.Count);
                for I:=1 to mmoSql.Lines.Count do
                begin
                    S := Format(H+'FDEF_%d',[I]);
                    if (Trim(S)<>'') then IniFile.WriteString('DB_CONFIG', S, mmoSql.Lines[I-1]);
                end;
            end;
            if(chkOpt.Checked)then
            begin
                IniFile.WriteInteger('DB_CONFIG',H+'FOPT_NUMBER',strtoint(edtNumber.text));
            end; 
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




procedure TDbConfig.LoadTables();
var
    IniFile:TInifile;
    nCount:Integer;
    S:String;
    I:Integer;
    ListItem:TListItem;
    H:String;
begin
    IniFile:= Tinifile.create(m_strIniFileName);
    try
        ClearUserListView();

        H:= cbOracleSID.Text +'_' + edtUser.Text+ '_';
        nCount := IniFile.ReadInteger('DB_CONFIG',H+'TABLE_COUNT',0);
        if(nCount=0)then exit;

        lvUserTables.Items.BeginUpdate;
        for I:=1 to nCount do
        begin
            S := Format(H+'TABLE_%d',[I]);
            S := IniFile.ReadString('DB_CONFIG',S,'');
            if (Trim(S)<>'') then
            begin
                ListItem := lvUserTables.Items.Add;
                ListItem.Caption:=S;
            end;
        end;
        lvUserTables.Items.EndUpdate;
        lvUserTables.ItemIndex := IniFile.ReadInteger('DB_CONFIG',H+'CURRENT_TABLES',0)-1;
    finally
        IniFile.Free;
    end;
end;

procedure TDbConfig.SaveTables();
var
    IniFile:TInifile;
    nCount:Integer;
    S:String;
    ListItem:TListItem;
    H:String;
begin
    try
        IniFile:= TInifile.create(m_strIniFileName);
        try
            ListItem := lvUserTables.FindCaption(0,edtTable.Text,  false, false, true);
            H:= cbOracleSID.Text +'_' + edtUser.Text+ '_';
            if(ListItem=nil) then
            begin
                nCount := IniFile.ReadInteger('DB_CONFIG', H+'TABLE_COUNT',0);
                S := Format(H+'TABLE_%d',[nCount+1]);
                IniFile.WriteString('DB_CONFIG', S, edtTable.Text);
                IniFile.WriteInteger('DB_CONFIG',H+'TABLE_COUNT',nCount+1);
                IniFile.WriteInteger('DB_CONFIG',H+'CURRENT_TABLE',nCount+1);
            end
            else
            begin
                IniFile.WriteInteger('DB_CONFIG',H+'CURRENT_TABLE',lvUserTables.ItemIndex+1);
            end;
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

procedure TDbConfig.LogDebug(const strData:String);
begin
    m_HandleLog.Write(Pointer(strData)^,length(strData));
end;


procedure TDbConfig.FormClose(Sender: TObject; var Action: TCloseAction);
var
    nIndex:integer;
    LogRow:TLogRow;
begin
    FreeAndNil(m_listTableRowID);
    for  nIndex :=0 to m_ListRow.Count-1 do
    begin
        LogRow := m_listRow[nIndex];
        if(LogRow<>nil)then FreeAndNil(LogRow);
    end;
    m_ListRow.Clear;
    FreeAndNil(m_ListRow);
    FreeAndNil(m_HandleLog);
    if (OraSession.Connected) then
        OraSession.Close;
    action := caFree;

end;


////////////////////
procedure  TDbConfig.GetTableFields(const strTable:string);
var
    strSql:string;
    strFieldName:string;
    nIndex:Integer;
begin
    if(strTable = '') then
    begin
        exit;
    end;
    //clbFields.Items.Clear;
    OraQuery.SQL.Clear;
    strSql := 'select column_name from user_tab_columns where table_name=upper(''' +  strTable
                + ''') order by column_name';
    OraQuery.SQL.Add(strSql);
    OraQuery.Open;
    while not OraQuery.Eof do
    begin
        strFieldName :=trim(OraQuery.FieldByName('column_name').AsString);
        nIndex :=  clbFields.Items.IndexOf(strFieldName);
        if(nIndex<0)then
        begin
            clbFields.Items.Add(strFieldName);
        end;
        //clbFields.Items.Add(trim(OraQuery.FieldByName('column_name').AsString));
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
    //if SelectDirectory(strDirectory, [sdAllowCreate, sdPerformCreate, sdPrompt], 1000) then
    begin
        cbbPath.Text :=  strDirectory;
    end;    
end;

///////////////////////////
function TDbConfig.CheckTableFields():boolean;
var
    nIndex:integer;
begin
    result := false;
    for nIndex := 0 to clbFields.Items.Count - 1 do
    begin
        if (clbFields.Checked[nIndex])  then
        begin
            result := true;
            exit;
        end
    end;
end;


///////////////////////////
function TDbConfig.GetTableSelectFields():string;
var
    nIndex:integer;
begin
    result := '';
    for nIndex := 0 to clbFields.Items.Count - 1 do
    begin
        if (clbFields.Checked[nIndex])  then
        begin
            if(result = '') then
                result := clbFields.items[nIndex]
            else
                result := result + ',' +  clbFields.items[nIndex];
        end
    end;
end;

function  TDbConfig.GetFieldValue(const Value:string):string;
begin
    result:=stringReplace(value,'''','''''',[rfReplaceAll]);
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
            Result := stringReplace(Obj.FieldValue,#13#10,'',[rfReplaceAll]);
            Result := stringReplace(Result,#13,'',[rfReplaceAll]);
            Result := stringReplace(Result,#10,'',[rfReplaceAll]);
            exit;
        end;
    end;
end;




function  TDbConfig.DeletePathFile(const strUser:String; const strTable:String; const strFile:String; var strFullFile:String;const bClob:Boolean=false ):Boolean;
var
    strPath:String;
    SearchRec:TSearchRec;
    ResFind:Integer;
    strSearchFull, strSearchPath:String;
    lstFileName:TStringList;
    nIndex:Integer;
    j:integer;
    strExt:String;
    strTmp:String;
begin
    strPath := Format('%s.%s',[strUser,strTable]);
    if(cbbPath.Text[length(cbbPath.Text)]='\') then
        strPath := stringreplace(cbbPath.Text,'/','\',[rfReplaceAll]) + strPath
    else
        strPath := stringreplace(cbbPath.Text,'/','\',[rfReplaceAll]) + '\' + strPath;

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

    strFullFile := strPath + '\' +  strFile;
    if FileExists(strFullFile) then
    begin
        if(not DeleteFile(strFullFile)) then
        begin
            ShowMessage('删除文件失败:'+#13#10+strSearchFull);
            result := false;
            exit;
        end;
    end;

    strTmp := MidStr(strFile,1, length(strFile)-length('.sql'));
    if(bClob)then
    begin
        strExt := '_CLOB';
        strTmp := MidStr(strTmp,1, length(strTmp)-length(strExt));
    end;

    lstFileName := split(strTmp,'.');
    for nIndex := 2 to lstFileName.Count-1 do
    begin
        strSearchPath := strPath + '\';
        for j:= 0 to   nIndex do
        begin
            strSearchPath := strSearchPath + lstFileName[j] + '.';
        end;
        
        if(nIndex = lstFileName.Count-1) then
        begin
            strSearchPath := strSearchPath + '*' + strExt + '.sql';
        end
        else
        begin
            strSearchPath := MidStr(strSearchPath,1,length(strSearchPath)-1);
            strSearchPath := strSearchPath + strExt + '.sql';
        end;
        //strSearchPath := strPath + '\' + ChangeFileExt(strFile,'.*.sql');
        ResFind := FindFirst(strSearchPath, faAnyFile, SearchRec);
        while ResFind = 0 do
        begin
            //ProcessSearchRec(SearchRec);
            strSearchFull := strPath + '\' +  SearchRec.Name;
            if(not DeleteFile(strSearchFull)) then
                ShowMessage('删除文件失败[请查看分类是否存在错误]:'+#13#10+strSearchFull)
            else
                ShowMessage('删除文件[请查看分类是否存在错误]:'+#13#10+strSearchFull);
            ResFind := FindNext(SearchRec);
        end;
        FindClose(SearchRec);
    end;
    FreeAndNil(lstFileName);
    
    Result := True;
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
    bHasClob:Boolean;
    BlobField:TBlobField;
    nCount:Integer;
    strOrderby:String;
    strViewLOB:String;
begin
//ccs.batch_config.menu_functionid-13648.function_id-33.sql
    strTable := LowerCase(edtTable.Text);
    if(edtTableAlias.Text<>'') then
    begin
        strTable := LowerCase(trim(edtTableAlias.Text));
    end;    
    strUser := LowerCase(edtUser.Text);
    if(edtAlias.Text<>'') then
    begin
        strUser := LowerCase(trim(edtAlias.Text));
    end;
    
// xx_CLOB.sql
    strSuffixe_CLOB := 'CLOB';
    StrSuffixe_LOB := 'LOB';
    strPrefixion_TEMP := 'T';

    GetCreateFileWhere(RecordList, strWhere, FieldValue);

    FileName := format('%s.%s.%s_%s.sql',[strUser,strTable, FieldValue,strSuffixe_CLOB]);
    if(not DeletePathFile(strUser, strTable, FileName, FullName,true)) then exit;


    strViewLOB := Format('%s_%s',[strTable,StrSuffixe_LOB]);
    if(edtViewLob.Text<>'')then
    begin
        strViewLOB := edtViewLob.Text;
    end;

    if(length(strViewLOB)>32)then
    begin
        ShowMessage('LOB视图名长度超过32，请重设LOB视图别名。');
        exit;
    end;


    try
        if(edtWhere.Text<>'')then
            strSQL := Format('select * from %s where  %s and %s ',[m_strRealTable, strWhere, Trim(edtWhere.Text)])
        else
            strSQL := Format('select * from %s where  %s ',[m_strRealTable, strWhere]);

        OraQuery.SQL.Clear;
        OraQuery.SQL.Add(strSQL);

        if(edtInfo.Text<>'')then
        begin
            OraQuery.SQL.Append(edtInfo.Text);
        end
        else
        begin
            if(m_strOrderValue<>'')then OraQuery.SQL.Append(m_strOrderValue);
        end;

        OraQuery.Open;
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
                            +'  EXECUTE IMMEDIATE ''create table %s_%s as select * from %s.%s where 1=2'';'+#13#10
                            +'end if;'+#13#10
                            +'end;'+#13#10
                            +'/'+#13#10
                            ,[strPrefixion_TEMP, strTable, strPrefixion_TEMP, strTable, strUser, strViewLOB]);
            Writeln(FileHandle,strClob);
            Writeln(FileHandle,chr(13)+chr(10));



            strFieldLine := Format('--删除临时表中关于本文件要操作的记录--'+#13#10
                                +'delete from %s_%s where %s;',[strPrefixion_TEMP, strTable, strWhere]);
            Writeln(FileHandle,strFieldLine);
            Writeln(FileHandle,chr(13)+chr(10));


            OraQuery.First;
            while not OraQuery.Eof do
            begin
                Inc(m_nRecordNumber);
                inc(nCount);
                //1 --head;
                strFieldLine := Format('insert into %s_%s (',[strPrefixion_TEMP, strTable]);
                strValueLine := 'values ('+#13#10;
                //2---mid
                bHasClob := False;
                for  nIndex:=0 to  clbFields.Count-1 do
                begin
                    FieldName := clbFields.Items[nIndex];
                    Field := OraQuery.FindField(FieldName);
                    FieldValue := Field.AsString;
                    if(Field.IsNull)and((not Field.IsBlob)or(chkClob.Checked))then
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
                                bHasClob := True;
                            end;
                            ftBlob,ftOraBlob:
                            begin
                                strValueLine := strValueLine + 'EMPTY_BLOB()';
                                bHasClob := True;
                            end;
                            else
                            begin
                                showmessage('开发中...');
                            end;
                        end;
                    end;
                    strFieldLine := strFieldLine +  FieldName;
                    //////////////////
                    if (nIndex = clbFields.Count-1) then
                    begin
                        strFieldLine := strFieldLine + ')';
                        if(bHasClob)  then
                            strValueLine := strValueLine + Format('        --%s,%s'+#13#10+') RETURNING rowid  INTO ROW_ID;',[FieldName, GetFieldComment(FieldName,TableComment)])
                        else
                            strValueLine := strValueLine + Format('        --%s,%s'+#13#10+');',[FieldName, GetFieldComment(FieldName,TableComment)]);
                    end
                    else
                    begin
                        strFieldLine := strFieldLine + ', ';
                        strValueLine := strValueLine + Format(',        --%s,%s'+#13#10,[FieldName, GetFieldComment(FieldName,TableComment)]);
                    end;
                end;
                if(not bHasClob)then
                begin
                    Writeln(FileHandle,strFieldLine);
                    Writeln(FileHandle,strValueLine);
                    Writeln(FileHandle,'');
                    OraQuery.Next;
                    continue;
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
                    FieldType := Field.DataType; //TBlobField ---ftOraBlob
                    if(Field.IsBlob)and(FieldType=ftOraClob) then
                    begin
                        FieldValue := Field.AsString;

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
                            +'delete from %s.%s where %s;',[strUser, strViewLOB, strWhere]);
            Writeln(FileHandle,strFieldLine);
            strFieldLine := Format('insert into %s.%s select * from %s_%s where %s;',
                        [strUser, strViewLOB, strPrefixion_TEMP, strTable, strWhere]);
            Writeln(FileHandle,strFieldLine);
            strFieldLine := Format('delete from %s_%s where %s;',[strPrefixion_TEMP, strTable, strWhere]);
            Writeln(FileHandle,strFieldLine);
            strFieldLine := Format('文件名:%s,记录数:%d',[FileName, nCount]);
            tmResult.Lines.Add(strFieldLine);
            LogDebug(strFieldLine);
            if(nCount>m_nMaxCount) then m_nMaxCount := nCount;
            inc(m_nFileNumber);
          finally
              CloseFile(FileHandle);
              OraQuery.Close;
          end;
        result := true;
    except
        result := false;
        showmessage('写文件失败！');
        exit;
    end;
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

procedure   TDbConfig.GetCreateFileWhere(const RecordList : TList; var strWhere:String; var FieldValue:String);
var
    nIndex:integer;
    MyObject :TMyObject;
begin
    nIndex:=0;
    //strWhere := edtWhere.Text;
    while(nIndex<RecordList.Count)do
    begin
        MyObject := RecordList[nIndex];

        if(strWhere = '') then
            strWhere := MyObject.FieldName
        else
            strWhere := strWhere + ' and ' + MyObject.FieldName;

        if(MyObject.IsNull)then
        begin
            strWhere := strWhere + ' is null '; 
        end
        else
        begin
            if(MyObject.FFieldType = ftString) then
                strWhere := strWhere + '=''' + MyObject.FieldValue + ''''
            else
                strWhere := strWhere + '=' + MyObject.FieldValue;
        end;
        
        if(MyObject.IsNull)then
            FieldValue := FieldValue + LowerCase(MyObject.FieldName) + '-null.'
        else
            FieldValue := FieldValue + LowerCase(MyObject.FieldName) + '-' + MyObject.FieldValue + '.';

        inc(nIndex);
    end;
    FieldValue := MidStr(FieldValue,1,Length(FieldValue) -1);
end;


function TDbConfig.GetOrderString():String;
var
    nIndex:Integer;
    //nNumber:Integer;
    nPos:Integer;
    Field:TField;
    strSql:String;
begin

    OraQuery.SQL.Clear;
    strSql := 'select * from ' + m_strRealTable +' where rownum<2';
    OraQuery.SQL.Add(strSql);
    OraQuery.Open;
    while not OraQuery.Eof do
    begin
        for  nIndex:=0 to  clbFields.Count-1 do
        begin
            Field := OraQuery.FindField(clbFields.Items[nIndex]);
            //nPos :=PosEx(clbFields.Items[nIndex],strWhere);
            if(Field<>nil) and (not Field.IsBlob)then//or(not clbFields.Checked[nIndex]) then
            begin
                Result := Result + clbFields.Items[nIndex] + ',';
            end;
        end;
        break;
    end;
    OraQuery.close;
    if(Result<>'') then Result := ' order by ' + MidStr(Result,1,Length(Result)-1);
end;


function TDbConfig.AddRowID(const strRowID,strFile,strSql:String):Boolean;
var
    pLogRow:TLogRow;
    i,nIndex:Integer;
    S:String;
begin
    S:=format('"%s","%s","%s"',[strRowID,strFile,strSql]);
    LogDebug(S);
    exit;
    
    if(PosEx(strRowID,m_listTableRowID.GetText)>0)then
    begin
        showMessage(strRowID);
        {for i :=0 to m_listRow.Count-1 do
        begin
            pLogRow :=  m_listRow[i];
            if(pLogRow<>nil)and(pLogRow.MoreIndex = nIndex)then
            begin
                S:=Format('原先存在一条已处理的记录:rowid[%s],filename[%s],sql[%s]',[pLogRow.RowID,
                            pLogRow.FileName,pLogRow.Sql]);
                ShowMessage(S);

                S:=Format('本次要处理的记录:rowid[%s],filename[%s],sql[%s]',[strRowID,strFile,strSql]);
                ShowMessage(S);

                exit;
            end;
        end;}
    end
    else
    begin
        nIndex := m_listTableRowID.Add(':'+strRowID);
        {pLogRow:=TLogRow.Create;
        pLogRow.RowID := strRowID;
        pLogRow.Sql := strSql;
        pLogRow.FileName := strFile;
        pLogRow.MoreIndex := nIndex;
        m_listRow.Add(pLogRow); }
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
    strDeleteSql:String;
    nCount:Integer;
    strOrderby:String;
    strRowKeyID:String;

begin
//ccs.batch_config.menu_functionid-13648.function_id-33.sql
    strTable := LowerCase(trim(edtTable.Text));
    if(edtTableAlias.Text<>'') then
    begin
        strTable := LowerCase(trim(edtTableAlias.Text));
    end;
    strUser := LowerCase(trim(edtUser.Text));
    if(edtAlias.Text<>'') then
    begin
        strUser := LowerCase(trim(edtAlias.Text));
    end;

    GetCreateFileWhere(RecordList, strWhere, FieldValue);

    FileName := Format('%s.%s.%s.sql',[strUser,strTable, FieldValue]);
    if(not DeletePathFile(strUser, strTable, FileName, FullName))then exit;

    result := true;
    try
        OraQuery.SQL.Clear;
        if(edtWhere.Text<>'')then
            strSQL := format('select ROWID, A.* from %s A where  %s and %s ',[m_strRealTable, strWhere, edtWhere.Text])
        else
            strSQL := format('select ROWID, A.* from %s A where  %s ',[m_strRealTable, strWhere]);

        OraQuery.SQL.Add(strSQL);
        if(edtInfo.Text<>'')then
        begin
            OraQuery.SQL.Append(edtInfo.Text);
        end
        else
        begin
            if(m_strOrderValue<>'')then OraQuery.SQL.Append(m_strOrderValue);
        end;

        OraQuery.Open;
        if(OraQuery.RecordCount=0)then
        begin
            result := false;
            exit;
        end;
        
        AssignFile(FileHandle, FullName);
        Rewrite(FileHandle);
        try
            strFieldLine := Format('--%s,建立时间:%s--'+#13#10+#13#10,
                        [FileName,FormatDateTime('yyyy-MM-dd hh:nn:ss', Date+Time)]);
            Writeln(FileHandle,strFieldLine);

            strFieldLine := Format('--%s.%s--'+#13#10,[strUser, strTable]);
            Writeln(FileHandle,strFieldLine);

            strFieldLine := Format('delete from %s.%s where %s;',[strUser, strTable,strWhere]);
            Writeln(FileHandle,strFieldLine);
            Writeln(FileHandle,chr(13)+chr(10));

            nCount :=0;
            while not OraQuery.Eof do
            begin
                Field := OraQuery.FindField('ROWID');
                if(Field<>nil) then
                begin
                    AddRowID(Field.AsString, FileName, strSQL);
                end;
                
                inc(nCount);
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
            if (nCount>m_nMaxCount) then m_nMaxCount:= nCount;
            inc(m_nFileNumber);
        finally
            OraQuery.Close;
            CloseFile(FileHandle);
            strFieldLine := Format('文件名:%s,记录数:%d',[FileName, nCount]);
            tmResult.Lines.Add(strFieldLine);
        end;
    except
        on  e:Exception do
        begin
            showmessage('查询数据库出错:'+#13#10+e.Message);
            result := false;
        end;
    end;
end;





function TDbConfig.GetGroupListBySQL(const strSql: String; var ResultList:TList):Boolean;
var
    MyObj:TMyObject;
    RecordsSelected:TList;
    nRow:Integer;
begin
    Result := False;
    /////
    OraQuery.SQL.Clear;
    OraQuery.SQL.Add(strSql);
    try
        OraQuery.Open;
        try
            while not OraQuery.Eof do
            begin
                RecordsSelected := TList.Create;
                for nRow := 0 to OraQuery.FieldCount-1 do
                begin
                    MyObj := TMyObject.Create;
                    MyObj.FieldName := OraQuery.Fields[nRow].FieldName;
                    MyObj.FieldType :=  OraQuery.Fields[nRow].DataType;
                    MyObj.IsNull := OraQuery.Fields[nRow].IsNull;
                    if(not MyObj.IsNull)then
                    begin
                        MyObj.FieldValue := OraQuery.FieldByName(MyObj.FieldName).AsString;
                    end;
                    RecordsSelected.Add(MyObj);
                end;
                ResultList.Add(RecordsSelected);
                OraQuery.Next;
            end;
        finally
            OraQuery.close;
        end;
    except
        ShowMessage('表限制语句有误');
        exit;
    end;
    Result := True;
end;


function TDbConfig.OptFieldData(const nField:Integer; const cTable:byte; var strWhere:String; var strGroupby:String):Boolean;
var
    nIndex:Integer;
    cTable_1:char;
    cTable_2:char;
    cTable_3:char;
    nNumber:Integer;
    strVar_1:String;
    strvar_2:String;
begin
    //但是有的时候，Oracle会认为NULL是相同的，比如在GROUP BY和DISTINCT操作中。
    //这个时候，Oracle会认为所有的NULL都是一类的. 
    //Oracle里如何判断NULL
    //(VAR1 IS NULL AND VAR2 IS NULL OR VAR1 IS NOT NULL AND VAR2 IS NOT NULL AND VAR1 = VAR2) 
    Result:=False;
    strGroupby := '';
    strWhere := '';
    cTable_1 := char(cTable+1);
    cTable_2 := char(cTable+2);

    nNumber :=0;
    for nIndex:= 0 to clbFields.Items.Count - 1 do
    begin
        if (clbFields.Checked[nIndex])and(nNumber<nField)  then
        begin
            inc(nNumber);
            strGroupby := strGroupby + cTable_1 + '.' + clbFields.items[nIndex] + ',';

            if(nNumber<nField) then
            begin
                strVar_1 := cTable_1 + '.' + clbFields.items[nIndex];
                strVar_2 := cTable_2 + '.' + clbFields.items[nIndex];
                strWhere := strWhere + Format('(%s is null and %s is null or %s is not null and %s is not null and %s=%s)',
                [strVar_1, strVar_2, strVar_1, strVar_2, strVar_1, strVar_2]);
                strWhere := strWhere + ' and ';
            end;
        end;
    end;
    strGroupby := Midstr(strGroupby,1, length(strGroupby)-1);
    if(strWhere<>'')then strWhere := Midstr(strWhere,1, length(strWhere)-5);
    Result := True;
end;


Function   TDbConfig.GetRealWhere(const strWhere:String; const cTable:byte):String;
var
    ListAnd, sList:TStringList;
    strName, strValue, strAnd:String;
    j:Integer;
begin
    result:='';
    sList := TStringList.Create;
    try
        strSplit(strWhere, 'and', sList);
        for j:=0 to sList.Count-1 do
        begin
            strAnd := trim(sList[j]);
            ListAnd := split(strAnd,'=');
            if(ListAnd.Count<=1) then continue;
            strName := trim(ListAnd[0]);
            strValue := trim(ListAnd[1]);
            FreeAndNil(ListAnd);
            result := result + char(cTable) + '.' + strName + '=' + strValue + ' and ';
        end;
        if(result<>'')then result := MidStr(result, 1, length(result)-5);
    finally
        FreeAndNil(sList);
    end;    
end;


function  TDbConfig.GetOptimizeSql(var ResultList:TStringList):Boolean;
var
    nIndex:Integer;
    strFields:String;
    strAliasFields:String;
    strSql:String;
    strSqlRest:String;
    strWhere:String;
    cTable:byte;
    nField:Integer;
    strGroupby:String;
    nMaxNumber:Integer;
begin
    Result:= False;
    cTable := byte('A')-1;
    nField :=0;
    nMaxNumber :=0;
    for nIndex := 0 to clbFields.Items.Count - 1 do
    begin
        if (clbFields.Checked[nIndex])  then
        begin
            inc(nMaxNumber);
        end
    end;

    for nIndex := 0 to clbFields.Items.Count - 1 do
    begin
        if (clbFields.Checked[nIndex])  then
        begin
            inc(nField);

            OptFieldData(nField, cTable, strWhere, strGroupby);
            if(nField=1)then
            begin
                if(edtWhere.Text <> '') then
                begin
                    strSql := Format('select %s from %s %s where %s group by %s having count(1)<=%d',
                        [strGroupby, m_strRealTable, char(cTable+1), GetRealWhere(edtWhere.Text,cTable+1), strGroupby, strtoint(edtNumber.Text)]);

                    strSqlRest := Format('select %s from %s %s where %s group by %s having count(1)>%d',
                        [strGroupby, m_strRealTable, char(cTable+1), GetRealWhere(edtWhere.text,cTable+1), strGroupby, strtoint(edtNumber.Text)]);
                end
                else
                begin
                    strSql := Format('select %s from %s %s group by %s having count(1)<=%d',
                        [strGroupby, m_strRealTable, char(cTable+1),strGroupby, strtoint(edtNumber.Text)]);

                    strSqlRest := Format('select %s from %s %s group by %s having count(1)>%d',
                        [strGroupby, m_strRealTable, char(cTable+1),strGroupby, strtoint(edtNumber.Text)]);
                end;

                cTable := cTable+1;
            end
            else if(nField = nMaxNumber)then
            begin
                strSql := Format('select %s from %s %s, (%s) %s where %s group by %s',
                    [strGroupby, m_strRealTable, char(cTable+1),strSqlRest, char(cTable+2), strWhere, strGroupby]);
            end
            else
            begin
                strSql := Format('select %s from %s %s, (%s) %s where %s group by %s having count(1)<=%d',
                    [strGroupby, m_strRealTable, char(cTable+1),strSqlRest, char(cTable+2), strWhere, strGroupby, strtoint(edtNumber.Text)]);

                strSqlRest := Format('select %s from %s %s, (%s) %s where %s group by %s having count(1)>%d',
                    [strGroupby, m_strRealTable, char(cTable+1),strSqlRest, char(cTable+2), strWhere, strGroupby, strtoint(edtNumber.Text)]);

                cTable := cTable+2;
            end;
            ResultList.Add(strSql);
            Result := True;
        end
    end; 
end;

function  TDbConfig.CreateSpecialRecord(const strLine:String;var Records:TList):Boolean;
var
    nPos1,nPos2,j:Integer;
    strAnd, strWhere:string;
    Myobj:TMyObject;
    ListAnd,sList:TStringList;
begin
    result:=false;
    nPos1 := PosEx('where', strLine);
    nPos2 := PosEx('group', strLine);
    if(nPos1=0)or(nPos2=0) then exit;

    nPos1 := nPos1+length('where');
    strWhere := Midstr(strLine, nPos1, nPos2-nPos1);

    sList := TStringList.Create;
    try
        strSplit(strWhere, 'and', sList);
        for j:=0 to sList.Count-1 do
        begin
            strAnd := trim(sList[j]);
            if(strAnd = '') then break;

            ListAnd := split(strAnd,'=');
            try
                if(ListAnd.Count<2) then
                begin
                    ShowMessage('现只支持where and ,其它复杂的SQL暂不支持！'+#13#10+strAnd);
                    exit;
                end;
                Myobj :=  TMyObject.Create;
                Myobj.FieldName := trim(ListAnd[0]);
                Myobj.FieldValue := trim(ListAnd[1]);
                Records.Add(Myobj);
            finally
                FreeAndNil(ListAnd);
            end;
        end;
    finally
        FreeAndNil(sList);
    end;
    result :=true;
end;

function  TDbConfig.CheckSpecialRecord(const ListSmall,ListBig:TList):Boolean;
var
    Myobj,MyObj1:TMyObject;
    nIndex,n,j:Integer;
begin
    result := true;
    for nIndex :=0 to  ListSmall.Count-1 do
    begin
        Myobj := ListSmall[nIndex];
        for n:=0 to  ListBig.Count-1 do
        begin
            MyObj1 := ListBig[n];
            if((trim(MyObj1.FieldName) = trim(MyObj.FieldName))
                and (trim(MyObj1.FieldValue) = trim(MyObj.FieldValue)))then
            begin
                break;
            end
            else if(n=ListBig.Count-1) then
            begin
                result := false;
                exit;
            end;
        end;
    end;
end;


function  TDbConfig.CheckSpecialList(const SpecialList:TStringList):Boolean;
var
    nIndex,n,j:Integer;
    strLine,strLine1:String;
    ListOne,ListCurrent:TList;
    Myobj:TMyObject;
    bRes:Boolean;
    sTip:String;
begin
    result :=false;
    for nIndex:=0 to SpecialList.Count-1 do
    begin
        strLine := SpecialList.Strings[nIndex];
        strLine := stringReplace(strLine,#13#10,' ',[rfReplaceAll]);
        if(trim(strLine)='')then continue;
        ListCurrent := TList.Create;
        try
            if(not CreateSpecialRecord(strLine, ListCurrent)) then exit;
            for n:=nIndex+1 to  SpecialList.Count-1 do
            begin
                strLine1 := SpecialList.Strings[n];
                strLine1 := stringReplace(strLine1,#13#10,' ',[rfReplaceAll]);
                if(trim(strLine1)='')then continue;
                ListOne := TList.Create;
                try
                    if(not CreateSpecialRecord(strLine1, ListOne))then exit;
                    if(ListCurrent.Count <=ListOne.Count)then
                        bRes := CheckSpecialRecord(ListCurrent, ListOne)
                    else
                        bRes := CheckSpecialRecord(ListOne, ListCurrent);
                    if(bRes)then
                    begin
                        sTip := Format('这2条配置存在冲突:'+#13#10
                                        + '记录1[%s]'+#13#10
                                        +'记录2[%s]',[strLine,strLine1]);
                        ShowMessage(sTip);
                        exit;
                    end;
                finally
                    for j:=0 to ListOne.Count-1 do
                    begin
                        MyObj := ListOne[j];
                        FreeAndNil(MyObj);
                    end;
                    ListOne.Clear;
                    FreeAndNil(ListOne);
                end;
            end;
        finally
            for j:=0 to ListCurrent.Count-1 do
            begin
                MyObj := ListCurrent[j];
                FreeAndNil(MyObj);
            end;
            ListCurrent.Clear;
            FreeAndNil(ListCurrent);
        end;
    end;
    result :=true;
end;

function TDbConfig.GetGroupSqlList(var ResultList:TStringList;var SpecialList:TStringList):Boolean;
var
    strSql:String;
    nIndex:Integer;
    strFields:String;
    strText:AnsiString;
    //pszData:PChar;   StrAlloc,zeromemory,StrPCopy,
    nLen:Integer;
    nCurrent:Integer;
    t:String;
    //TCaption = type string;
begin
    Result := False;
    if(chkDefine.Checked) then
    begin
        strSplit(mmoSql.Text, ';', SpecialList);
        Result := CheckSpecialList(SpecialList);
        if(not Result)then exit;
    end;
    if(chkOpt.Checked) then
    begin
        GetOptimizeSql(ResultList);
    end
    else
    begin
        strFields := GetTableSelectFields();
        if(edtWhere.Text = '') then
            strSql := Format('select %s from %s  group by %s',[strFields, m_strRealTable, strFields])
        else
            strSql := Format('select %s from %s where %s group by %s',[strFields, m_strRealTable, edtWhere.Text, strFields]);
        ResultList.Add(strSql);
    end;
    Result := True;
end;

procedure  TDbConfig.GetTableComment(var TableComment:TList);
var
    strSql:String;
    MyObj:TMyObject;
    Query:TOraQuery;
begin
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
end;


function   TDbConfig.IsBetween(const strName, strValue:String; const RecordsSelected:TList):Boolean;
var
    nIndex:Integer;
    MyObject:TMyObject;
begin
    Result := False;
    for nIndex := 0 to RecordsSelected.Count-1 do
    begin
        MyObject := RecordsSelected[nIndex];
        if(MyObject = nil) then continue;
        if(LowerCase(strName) = LowerCase(MyObject.FieldName)) and
            (LowerCase(strValue) = LowerCase(MyObject.FieldValue))then
        begin
            Result := True;
            exit;
        end;
    end; 
end;


//////////////////////
function  TDbConfig.IsReject(const RecordsSelected:TList; const SpecialList:TStringList):Boolean;
var
    nIndex,j:Integer;
    strSql:String;
    strWhere : String;
    nPos1,nPos2:Integer;
    ListAnd, sList:TStringList;
    strAnd:String;
    strName, strValue:String;
begin
    result:=false;
    if(SpecialList = nil)or(RecordsSelected=nil)or(SpecialList.Count=0)or(RecordsSelected.Count=0) then
    begin
        result:=false;
        exit;
    end;

    for nIndex := 0 to SpecialList.Count-1 do
    begin
        strSql := LowerCase(SpecialList.Strings[nIndex]);
        strSql := stringReplace(strSql,#13#10,' ',[rfReplaceAll]);
        if(trim(strSql)='')then continue;

        nPos1 := PosEx('where', strSql);
        nPos2 := PosEx('group', strSql);
        if(nPos1=0)or(nPos2=0) then continue;

        nPos1 := nPos1+length('where');
        strWhere := Midstr(strSql, nPos1, nPos2-nPos1);

        sList := TStringList.Create;
        try
            strSplit(strWhere, 'and', sList);
            for j:=0 to sList.Count-1 do
            begin
                strAnd := trim(sList[j]);
                if(strAnd = '') then break;

                ListAnd := split(strAnd,'=');
                try
                    if(ListAnd.Count<2) then break;
                    strName := trim(ListAnd[0]);
                    strValue := trim(ListAnd[1]);
                finally
                    FreeAndNil(ListAnd);
                end;

                if(IsBetween(strName, strValue, RecordsSelected))then
                begin
                    if(j=sList.Count-1)then
                    begin
                        result := true;
                        exit;
                    end
                    else
                    begin
                        continue;
                    end;
                end
                else
                    break;
            end;
        finally
            FreeAndNil(sList);
        end;
    end;
    result := False;
end;

//////////////////////////
procedure TDbConfig.GenerateFile(const strGroupSql:String; const SpecialList:TStringList);
var
    strFields:string;
    TableSelected:TList;
    RecordsSelected:TList;
    MyObj:TMyObject;
    nRow,nIndex:integer;
    FiledName:string;
    n:integer;
    bHasClob:boolean;
    TableComment:TList;
begin
    TableSelected := TList.Create;
    TableComment :=  TList.Create;
    m_bProcessIng := true;
    try
        GetGroupListBySQL(strGroupSql, TableSelected);
        if(TableSelected.Count=0) then exit;

        GetTableComment(TableComment);
        /////
        bHasClob := HasBlob(edtTable.Text);
        //////
        tmResult.Lines.Clear;
        for  nIndex:=0 to TableSelected.Count-1 do
        begin
            RecordsSelected := TableSelected[nIndex];
            if RecordsSelected <> nil then
            begin
                if(SpecialList <>nil) and (IsReject(RecordsSelected, SpecialList)) then
                begin
                    continue;
                end;

                if (bHasClob) then
                begin
                    BlobCreateFile(RecordsSelected,TableComment);
                    Application.ProcessMessages;
                end
                else
                begin
                    {if(chkThread.Checked)then
                    begin
                        while (m_ThreadsRunning>60) do
                        begin
                            Application.ProcessMessages;
                            sleep(100);
                        end;
                        FileThread := TFileThread.Create(self, RecordsSelected, TStringList(clbFields.Items));
                        InterlockedIncrement(m_ThreadsRunning);
                    end
                    else}
                    NormalCreateFile(RecordsSelected,TableComment);
                    Application.ProcessMessages;
                end;
            end;
        end;
       
    finally
        ///
        for  nIndex:=0 to TableSelected.Count-1 do
        begin
            RecordsSelected := TableSelected[nIndex];
            for  n:=0 to RecordsSelected.Count - 1 do
            begin
                MyObj := RecordsSelected[n];
                FreeAndNil(MyObj);
            end;
            RecordsSelected.Clear;
            FreeAndNil(RecordsSelected);
        end;
        FreeAndNil(TableSelected);
        /////
        for  nIndex:=0 to TableComment.Count-1 do
        begin
            MyObj := TableComment[nIndex];
            FreeAndNil(MyObj);
        end;
        TableComment.Clear;
        FreeAndNil(TableComment);
        m_bProcessIng := False;
    end;
end;

function TDbConfig.GetRealGroupSql(const strGroupSql:String):String;
var
    nPos1,nPos2:Integer;
    strSql:String;
begin
    nPos1 := PosEx('from', strGroupSql);
    nPos2 := PosEx('where', strGroupSql);
    if(nPos1=0)or(nPos2=0) then exit;
    strSql := Midstr(strGroupSql, 1, nPos1+length('from')) + '  ' + m_strRealTable + '  ' +
        MidStr(strGroupSql, nPos2, length(strGroupSql)-nPos2+1);
    result := stringReplace(strSql,#13#10,' ',[rfReplaceAll]);
end;


//////////////////////////
procedure TDbConfig.btStartClick(Sender: TObject);
var
    strGroupSql:string;
    StringList:TStringList;
    SpecialList:TStringList;
    nIndex:Integer;
    strTempTable:String;
    strInfo:String;
begin
    if(m_bProcessIng)then
    begin
        showmessage('正在处理中。。。。。。！');
        exit;
    end;

    if (cbbPath.Text='') or (not DirectoryExists(cbbPath.Text)) then
    begin
        showmessage('请选择保存目录！');
        exit;
    end;

    if(edtTable.Text='') then
    begin
        showmessage('请选择数据表信息！');
        exit;
    end;

    if(chkOpt.Checked)and(strtoint(edtNumber.text)<=0)then
    begin
        showmessage('请输入表主域逐级分类优化小等于记录数！');
        exit;
    end;


    if(chkDefine.Checked)and(mmoSql.Lines.Count=0)then
    begin
        showmessage('请输入自定义SQL信息！');
        exit;
    end;

    if (not CheckTableFields()) then
    begin
        showmessage('请选择数据表的主域信息！');
        exit;
    end;
    

    m_strRealTable := edtTable.Text;

    m_strOrderValue := self.GetOrderString();
    {if(chkThread.Checked)then
    begin
        CreateTempTable(edtTable.Text, strTempTable);
        m_strRealTable := strTempTable;
    end;}

    m_nFileNumber:=0;
    m_nRecordNumber:=0;
    m_nMaxCount :=0;
    StringList := TStringList.Create;
    SpecialList := TStringList.Create;
    try
        if(not GetGroupSqlList(StringList, SpecialList))then
        begin
            exit;
        end;
        
        for nIndex:= 0 to StringList.Count-1 do
        begin
            strGroupSql := StringList.Strings[nIndex];
            if(trim(strGroupSql)<>'')then
            begin
                GenerateFile(strGroupSql, SpecialList);
            end;
        end;
        for nIndex:= 0 to SpecialList.Count-1 do
        begin
            strGroupSql := GetRealGroupSql(SpecialList.Strings[nIndex]);
            if(trim(strGroupSql)<>'')then
            begin
                GenerateFile(strGroupSql);
            end;
        end;
        
        SaveAliasUser();
        SaveTables();
        LoadTables();

        SaveTableFields();
        SaveTableFDef();
        SaveAliasTable();

        SavePaths();

        strInfo := Format('成功处理数据记录数: %d'+#13#10
                        + '成功生成文件数:  %d'+#13#10
                        + '文件最大记录数:  %d'+#13#10,
                        [m_nRecordNumber, m_nFileNumber, m_nMaxCount]);
        Application.MessageBox(PChar(strInfo), '操作成功',MB_OK);
        
    finally
        FreeAndNil(StringList);
        FreeAndNil(SpecialList);
        {if(chkThread.Checked)then DropTempTable(strTempTable)};
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

        LoadTableFields();
        GetTableFields(Item.Caption);

        LoadTableFDef();
        LoadAliasTable();
        LoadAliasUser();
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
var
    s : string;
    i: integer;
begin
    ButtonNext.Enabled :=true;
    ButtonPrev.Enabled :=true;
    ButtonDele.Enabled :=true;
    if(clbFields.ItemIndex=0) then
    begin
        ButtonPrev.Enabled :=false;
    end;

    if(clbFields.ItemIndex=clbFields.Count-1) then
    begin
        ButtonNext.Enabled :=false;
    end;
    if clbFields.Checked[clbFields.ItemIndex] = true then
    begin
    //将所选项自动上移，直到遇到已选项
    for i:= 0 to clbFields.ItemIndex-1 do
    begin
      if clbFields.Checked[i] = true then continue;
      //clbFields.Items.Exchange(i, clbFields.ItemIndex);
      s := clbFields.items[clbFields.ItemIndex];
      clbFields.items.Delete(clbFields.ItemIndex);
      clbFields.Items.Insert(i,s);
      clbfields.Checked[i] := true;
      
      break;
    end;
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
            edtNumber.Text := '';
            chkOpt.Checked := False;
            chkDefine.Checked := False;
            mmoSql.Lines.Clear;
        end
        else
        begin
            edtTable.Text :=ListItem.Caption;
            edtTable.SelStart := Length(edtTable.Text);
            lvTables.Selected := ListItem;
            lvTables.Selected.MakeVisible(true);
        end;
        m_bTableNameChange := False;
    end;
end;

procedure TDbConfig.edtTableExit(Sender: TObject);
var
    ListItem:TListItem;
begin
    if(not m_bTableNameChange)then exit;
    m_bTableNameChange := False;
    ListItem := lvTables.FindCaption(0,edtTable.Text,  false, false, true);
    if(ListItem = nil)then
    begin
        ClearListBox();
        edtTable.Text := '';
        lvTables.Selected := ListItem;
        edtNumber.Text := '';
        chkOpt.Checked := False;
        chkDefine.Checked := False;
        mmoSql.Lines.Clear;
    end
    else
    begin
        edtTable.Text :=ListItem.Caption;
        edtTable.SelStart := Length(edtTable.Text);
        lvTables.Selected := ListItem;
        lvTables.Selected.MakeVisible(true);
    end;
end;


procedure TDbConfig.edtPathKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if(VK_RETURN = Key)and(cbbPath.Text<>'')and(DirectoryExists(cbbPath.Text))then
    begin
        ShellExecute(Application.Handle, nil,'explorer', pchar('/select, '+cbbPath.Text),nil,SW_SHOW);
    end;
end;

procedure TDbConfig.Button1Click(Sender: TObject);
begin
    if(cbbPath.Text<>'')and(DirectoryExists(cbbPath.Text))then ShellExecute(Application.Handle, nil,'explorer', pchar('/select, '+cbbPath.Text),nil,SW_SHOW);
end;

procedure TDbConfig.btnResultClick(Sender: TObject);
begin
    if(not tmResult.Visible)then
    begin
        btnResult.Caption := '隐藏结果';
        tmResult.Visible:=True;
    end
    else
    begin
        btnResult.Caption := '结果显示';
        tmResult.Visible:=False;
    end;

end;


procedure TDbConfig.lvUserTablesSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
    if (Item <> nil) and (Selected) then
    begin
        edtTable.Text := Item.Caption;
        edtTable.SelStart := Length(edtTable.Text);

        LoadTableFields();
        GetTableFields(Item.Caption);

        LoadTableFDef();
        LoadAliasTable();
        LoadAliasUser();
    end;
end;

function TDbConfig.CreateTempTable(const strTable:String;var strTempTable:String):boolean;
var
    S:String;
    I:Integer;
    RI:Integer;
begin
    result := false;
    try
        for I:=1 to 100 do
        begin
            OraQuery.SQL.Clear();
            strTempTable := Format('%s_%d',[strTable,I]);
            S := Format('select table_name from user_tables where table_name=upper(''%s'')',[strTempTable]);
            OraQuery.SQL.Add(S);
            OraQuery.Open;
            RI:=OraQuery.RecordCount;
            OraQuery.Close;
            if(RI=0) then break;
        end;
        OraQuery.SQL.Clear;
        OraQuery.SQL.Text := Format('DECLARE'+#13#10
	    		        +'  v_count     number(10);'+#13#10
	     		        +'BEGIN'+#13#10
	                    +'select count(*) into v_count from user_tables  where table_name=upper(''%s'');'+#13#10
	                    +'if v_count = 0 then'+#13#10
	                    +'  EXECUTE IMMEDIATE ''create table %s as select * from %s'';'+#13#10
 	                    +'end if;'+#13#10
 	                    +'end;'+#13#10
                        ,[strTempTable, strTempTable, strTable]);
        OraQuery.Execute;
        OraQuery.Close;
        result := true;
    except
        result := false;
        exit;
    end; 
end;


function TDbConfig.DropTempTable(const strTempTable:String):boolean;
begin
    result := false;
    try
        OraQuery.SQL.Clear;
        OraQuery.SQL.Text := Format('DECLARE'+#13#10
	    		        +'  v_count     number(10);'+#13#10
	     		        +'BEGIN'+#13#10
	                    +'select count(*) into v_count from user_tables  where table_name=upper(''%s'');'+#13#10
	                    +'if v_count = 1 then'+#13#10
	                    +'  EXECUTE IMMEDIATE ''drop table %s'';'+#13#10
 	                    +'end if;'+#13#10
 	                    +'end;'+#13#10
                        ,[strTempTable, strTempTable]);
        OraQuery.Execute;
        OraQuery.close;
        result := true;
    except
        result := false;
        exit;
    end; 
end;

function TDbConfig.ExecuteSql(const strExecuteSql:String):boolean;
var
    Execute:TOraQuery;
begin
    result := false;
    Execute :=TOraQuery.Create(nil);
    try
        try
            Execute.Connection := OraSession;
            Execute.SQL.Clear;
            Execute.SQL.Text := strExecuteSql;
            Execute.Execute;
            Execute.Close;
            result := true;
        except
            result := false;
            exit;
        end;
    finally
        FreeAndNil(Execute);
    end;
    result := true;
end;




procedure TDbConfig.Button2Click(Sender: TObject);
begin
    if(edtTable.Text = '') then
    begin
        ShowMessage('请选择要导出的表');
        exit;
    end;
    SaveAliasUser();
    SaveAliasTable();

    SaveTables();
    LoadTables();

    SaveTableFields();
    SaveTableFDef();

    SavePaths();
end;

procedure TDbConfig.edtTableChange(Sender: TObject);
begin
    m_bTableNameChange := True;
end;

procedure TDbConfig.edtTableEnter(Sender: TObject);
begin
    m_bTableNameChange := False;
end;

procedure TDbConfig.ButtonDeleClick(Sender: TObject);
begin
    clbFields.DeleteSelected();
end;

initialization
  OleInitialize(nil);
  //注册工具类
  RegisteFormFactory('db_config配置导出',IFormCreator_DbConfig.create);


finalization
  OleUninitialize;


end.
