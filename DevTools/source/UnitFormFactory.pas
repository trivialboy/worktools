unit UnitFormFactory;

interface

uses SysUtils,Forms,windows,Classes;

type
//窗口创建者接口
IFormCreator = interface(IInterface)
    function CreateForm():TForm; //创建窗口
end;

//代理类
TAgent = class(TObject)
  private
    mCreator  : IFormCreator;
    mCount    : integer;
    mFormName : string;
  public
    constructor Create(cpt : string; m : IFormCreator);
    procedure CreateForm( var fm : TForm);
    //function GetFormName();
end;

IFormFactory = class( TObject )
    private
        mFormList : TStringList; //窗口类列表
    public
        constructor Create;
        procedure Free;
        //已注册的窗口类个数
        function GetFormCount():integer;
        //取指定窗口类名称
        function GetFormName(idx : integer):string;

        //注册子窗口类
        function RegisteForm(formName : string; fmCreator : IFormCreator):boolean;

        //创建子窗口
        function CreateChildForm(formIdx : integer; var fm: TForm):boolean;

    end;

//注册工厂方法
procedure RegisteFormFactory(formName : string; fmCreator : IFormCreator);

var
    gFormFactory : IFormFactory;

implementation

uses UnitHttp;
////工厂方法注册
procedure RegisteFormFactory(formName : string; fmCreator : IFormCreator);
begin
    if gFormFactory= nil then
        gFormFactory := IFormFactory.Create;
    gFormFactory.RegisteForm(formName, fmCreator);
end;

/////////代理类实现//////

constructor TAgent.Create(cpt : string; m:IFormCreator);
begin
    mCount    := 0;
    mCreator  := m;
    mFormName := cpt;
end;


procedure TAgent.CreateForm( var fm : TForm);
begin
    fm := mCreator.CreateForm();
    fm.FormStyle := fsMDIChild;
    if mCount >0 then
        fm.Caption := mFormName+'['+inttostr(mCount)+']'
    else
        fm.Caption := mFormName;
    mCount := mCount + 1;
end;

///////工厂类实现////////////
constructor IFormFactory.Create();
begin
    mFormList := TStringList.Create();

    //mFormList.AddObject('HttpSender',TAgent.Create(IFormCreator_Http.Create) );
end;

procedure IFormFactory.Free();
begin
    mFormList.Free;
end;

function IFormFactory.RegisteForm(formName : string; fmCreator : IFormCreator):boolean;
begin
    mFormList.AddObject(formName, TAgent.Create(formName, fmCreator));
    Result := true;
end;


function IFormFactory.CreateChildForm( formIdx :integer; var fm:TForm):boolean;
var
    fa : TAgent; 
    fc : IFormCreator;
begin
    fm := nil;
    Result := true;
    if(formIdx >= 0) and (formIdx < mFormList.Count ) then
    begin
        fa := mFormList.Objects[formIdx] as TAgent;
        fa.CreateForm(fm);
    end;

end;

function IFormFactory.GetFormCount():integer;
begin
    Result := mFormList.Count;
end;

function IFormFactory.GetFormName(idx : integer):string;
begin
    Result := mFormList.Strings[idx];
end;

initialization

finalization
    gFormFactory.free;
end.
