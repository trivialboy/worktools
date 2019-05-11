unit UnitPermission;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, Buttons, CheckLst,UnitFormFactory, unitPublic,
  UnitPermissionSQL;

type
  TFormPermission = class(TForm)
    GroupBox1: TGroupBox;
    lbedtProjDesc: TLabeledEdit;
    StaticText1: TStaticText;
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    StaticText2: TStaticText;
    memoSysfuncId: TMemo;
    RadioGroup1: TRadioGroup;
    rbtnBop: TRadioButton;
    rbtnCsp: TRadioButton;
    rbtnUig: TRadioButton;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    sgUig: TStringGrid;
    StaticText3: TStaticText;
    bbtnGenScript: TBitBtn;
    clboxPortal: TCheckListBox;
    Splitter1: TSplitter;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    MemoTmpl: TMemo;
    StaticText4: TStaticText;
    Splitter2: TSplitter;
    rbtnIop: TRadioButton;
    memoFunBop: TMemo;
    memoFunUig: TMemo;
    memoFunIop: TMemo;
    memoFunCsp: TMemo;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure rbtnBopClick(Sender: TObject);
    procedure rbtnCspClick(Sender: TObject);
    procedure rbtnUigClick(Sender: TObject);
    procedure bbtnGenScriptClick(Sender: TObject);
    procedure memoSysfuncIdKeyPress(Sender: TObject; var Key: Char);
    procedure rbtnIopClick(Sender: TObject);
  private
    { Private declarations }
    FormPermissionSQL : TFormPermissionSQL;
    bopList,cspList,uigList,iopList : TStringList;
    scriptTmpl : TStringList;
    procedure selectFromList( sl: TStringList); //根据列表中的数据选中门户选项
    function strIn(str : string; strArr : TStringList) : boolean;  //判断str是否在列表strArr中
    function genSQL() : string;   //生成脚本
    function genProjDesc(const tmpl :string) : string;
    function genSysfuncId(const tmpl :string; itemList : TStringList) : string;
    function genPortalId(const tmpl :string; itemList : TStringList) : string;
    function genVerifyCode(const tmpl :string; itemList : TStringList) : string;
    function genDate(const tmpl :string ) : string;    
  public
    { Public declarations }
  end;

//var
//  FormPermission: TFormPermission;
//-------------- 子窗口创建者定义开始 ---------------//

IFormCreator_Permission = class(TInterfacedObject, IFormCreator)
    function CreateForm():TForm;
end;
//------------ 子窗口创建者定义结束 -----------//

implementation

uses MainFrame;

{$R *.dfm}
//-------------- 子窗口创建者实现开始 ---------------------//
function IFormCreator_Permission.CreateForm():TForm;
begin
    Result := TFormPermission.Create(nil);
end;
//-------------- 子窗口创建者实现结束 ---------------------//

procedure TFormPermission.FormShow(Sender: TObject);
begin
  with sgUig  do
  begin
    cells[0,0] := 'Verify_Code';
    cells[1,0] := 'Partiton_Key';
    cells[2,0] := 'Portal_Id';
    cells[3,0] := 'Login_Type';
    cells[4,0] := 'Home_City';
    cells[4,1] := '590';
  end ;
end;

procedure TFormPermission.FormCreate(Sender: TObject);
begin
//FormPermission := TFormPermission.create(nil);
  bopList := TStringList.create;
  bopList.Add('100012');
  cspList := TStringList.create;
  cspList.Add('100004');
  uigList := TStringList.Create;
  uigList.Add('200005');
  iopList := TStringList.Create;
  iopList.Add('101710');

  FormPermissionSQL := TFormPermissionSQL.create(nil);
  scriptTmpl := TStringList.Create;

end;

procedure TFormPermission.FormDestroy(Sender: TObject);
begin
//    FormPermission.free;
  bopList.Free;
  cspList.Free;
  uigList.Free;
  iopList.Free;
  scriptTmpl.Free;
  FormPermissionSQL.free;
end;

procedure TFormPermission.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    //saveIniFile();
    action := caFree;
end;

procedure TFormPermission.BitBtn1Click(Sender: TObject);
var
  i: integer;
begin
  sguig.RowCount :=  sguig.RowCount+1 ;
    with sguig do
    begin
      cells[ 0, sguig.RowCount-1] := '';  //verify_code
      cells[ 1, sguig.RowCount-1] := '';  //partition_key
      cells[ 2, sguig.RowCount-1] := '';  //portal_id
      cells[ 3, sguig.RowCount-1] := '';  //login_type
      cells[ 4, sguig.RowCount-1] := '590';  //home_city
    end;
end;

procedure TFormPermission.BitBtn2Click(Sender: TObject);
var
  i : integer;
begin
  if  sguig.RowCount >1 then
  begin
    if sgUig.rowcount > 2 then
    begin
      sguig.RowCount :=  sguig.RowCount-1;
    end
    else
    begin
      with sguig do
      begin
        cells[ 0, sguig.RowCount-1] := '';  //verify_code
        cells[ 1, sguig.RowCount-1] := '';  //partition_key
        cells[ 2, sguig.RowCount-1] := '';  //portal_id
        cells[ 3, sguig.RowCount-1] := '';  //login_type
        cells[ 4, sguig.RowCount-1] := '590';  //home_city
      end;
    end;
  end;

end;
function getPortalId( s : String) : String;
var
  s1 : TstringList;
begin
  s1 := split(s,' '); 
  if copy(s1[0],0,1) <> '-' then
  begin
    result := s1[0];
  end
  else
  begin
    result := '';
  end;

end;
function TFormPermission.strIn(str : string; strArr : TStringList) : boolean;
var
  i : integer;
begin
  result := false;
  for i:=0 to strArr.count-1 do
  begin
    if str = strArr[i] then
    begin
      result := true;
      break;
    end;
  end;
end;

procedure TFormPermission.selectFromList( sl : TStringList );
var
  i : integer;
  s : string;
begin
  for  i:=0 to clboxportal.items.count-1 do
  begin
    s := clboxPortal.Items[i];
    if strIn(getPortalId(s) ,sl) = true then
    begin
      clboxPortal.checked[i] := true;
    end
    else
    begin
      clboxPortal.checked[i] := false;
    end;

  end;
end;

procedure TFormPermission.rbtnBopClick(Sender: TObject);
begin
  selectFromList(bopList);
end;

procedure TFormPermission.rbtnCspClick(Sender: TObject);
begin
  selectFromList(cspList);
end;

procedure TFormPermission.rbtnUigClick(Sender: TObject);
begin
    selectFromList(UigList);
end;
function TFormPermission.genProjDesc(const tmpl :string) : string;
var
  projStr : string;
begin
  result := tmpl;
  //取项目备注
  projStr := trim(lbedtProjDesc.Text);
  if projStr= '' then
  begin
    lbedtProjDesc.SetFocus;
    raise exception.Create('项目备注不能为空');
  end;
  result := stringReplace(result,'{$PROJECT_DESC$}',projStr,[rfReplaceAll]);

end;
function TFormPermission.genSysfuncId(const tmpl :string; itemList : TStringList) : string;
var
  i : integer;
  funcTmpl, str,func : string;
begin
  result := tmpl;
  funcTmpl := 'addItem({$FUNC_ID$});';
  //取功能号
  itemList.AddStrings( memoSysfuncId.Lines );
  if itemList.Count=0 then
  begin
    memoSysfuncId.SetFocus;
    raise exception.Create('功能号不能为空');
  end;
  for i :=0 to itemList.Count -1 do
  begin
    func := trim(itemList[i]);
    if func='' then
      continue;
    str := str + stringReplace(funcTmpl,'{$FUNC_ID$}',func,[rfReplaceAll]) + #13#10 + '  ';
  end;
  if str='' then str:='null;'+#13#10;
  result := stringReplace(tmpl,'{$INSERT_TMP_SYSFUNC_ID$}',str,[rfReplaceAll]);
end;

function TFormPermission.genPortalId(const tmpl :string; itemList : TStringList) : string;
var
  i : integer;
  str : string;
  portalTmpl : string;
  csp,uig,bop,iop:boolean;
begin
  result := tmpl;
  str := '';

  //取门户
  for i:=0 to clboxPortal.Count-1 do
  begin
    if clboxPortal.Checked[i] then
    begin
      if copy(clboxPortal.Items[i],0,1) = '-' then continue;
      itemList.Add( getPortalId(clboxPortal.Items[i]));
    end;
  end;
  if itemList.Count = 0 then
  begin
    clboxPortal.SetFocus;
    raise exception.Create('门户必须选择');
  end;
  //识别门户分类
  for i:=0 to itemList.count-1 do
  begin
     if strIn(itemList[i],uigList) then   //接口门户
     begin
      uig := true;
      str := str+'addUigPortal('+itemList[i]+');' +#13#10;
     end
     else if strIn(itemList[i],cspList) then //csp门户
     begin
      csp := true;
      str := str+'addCspPortal('+itemList[i]+');' +#13#10;
     end
     else if strIn(itemList[i],iopList) then //iop门户
     begin
      iop := true;
      str := str+'addIopPortal('+itemList[i]+');' +#13#10;
     end
     else //bop门户 是缺省的
     begin
      bop := true;
      str := str+'addBopPortal('+itemList[i]+');' +#13#10;
     end;
     str := str + '  ';
  end;
  if str='' then str:='null;'+#13#10;

  result := stringReplace(tmpl,'{$INSERT_TMP_OP_ROLE$}',str,[rfReplaceAll]);

  if bop then
    str := memoFunBop.Lines.Text
  else
    str := '';
  result := stringReplace(result,'{$fun_addBopPortal$}',str,[rfReplaceAll]);

  if iop then
    str := memoFunIop.Lines.Text
  else
    str := '';
  result := stringReplace(result,'{$fun_addIopPortal$}',str,[rfReplaceAll]);

  if uig then
    str := memoFunUig.Lines.Text
  else
    str := '';
  result := stringReplace(result,'{$fun_addUigPortal$}',str,[rfReplaceAll]);

  if csp then
    str := memoFunCsp.Lines.Text
  else
    str := '';
  result := stringReplace(result,'{$fun_addCspPortal$}',str,[rfReplaceAll]);

end;
function TFormPermission.genVerifyCode(const tmpl :string; itemList : TStringList) : string;
var
  str : string;
  i : integer;
begin
  result := tmpl;

  str := '';
  //取接口校验码
  for i:=1 to  sgUig.RowCount-1 do
  begin
    if sgUig.Cells[0,i]='' then continue;
    str := str + 'addEnv(' + sgUig.Cells[0,i]+','+sgUig.cells[1,i]+','+sgUig.cells[2,i]+','+sgUig.Cells[3,i]+','+sgUig.cells[4,i]+');'+#13#10 + '  ';
  end;
  if str='' then str:='null;'+#13#10;
  result := stringReplace(tmpl,'{$INSERT_OPERATOR_ACCESS_ENV$}',str,[rfReplaceAll]);
end;
function TFormPermission.genDate(const tmpl :string ) : string;
var
  str : string;
begin
  str := FormatDateTime('yyyy-MM-dd hh:nn:ss', Date+Time);
  result := stringReplace(tmpl,'{$NOW_DATE$}',str,[rfReplaceAll]);
end;
function TFormPermission.genSQL() : string;
var
  funcList,portalList,verifyList : TStringList;
  i : integer;
  projStr , script : string;
begin
  result := '';
  funcList := TStringList.Create;
  portalList := TStringList.Create;
  verifyList := TStringList.create;
  result := memoTmpl.Text;
  try
    result := genDate(result);
    result := genProjDesc(result);
    result := genSysfuncId(result,funcList);
    result := genPortalId(result,portalList);
    result := genVerifyCode(result,verifyList);
  finally
    funcList.Free;
    portalList.Free;
    verifyList.Free;
  end;
end;
procedure TFormPermission.bbtnGenScriptClick(Sender: TObject);
var
  script : string;
begin
  try
    script := stringReplace(genSQL(),'{$VERSION$}',FormDevToolsMain.getVersion(),[rfReplaceAll]);
    FormPermissionSQL.MemoSQL.Clear;
    formpermissionsql.MemoSQL.Text := script;
    FormPermissionSQL.ShowModal;
  except
    on e : Exception do
    begin
      showmessage('生成脚本失败:'+e.Message);
    end;
  end;

end;

procedure TFormPermission.memoSysfuncIdKeyPress(Sender: TObject;
  var Key: Char);
begin
    if( key = #1 ) then
        TMemo(sender).SelectAll;

end;

procedure TFormPermission.rbtnIopClick(Sender: TObject);
begin
  selectFromList(iopList);
end;

initialization
  /////////////注册工具类
  RegisteFormFactory('权限配置脚本(&P)',IFormCreator_Permission.create);

end.
