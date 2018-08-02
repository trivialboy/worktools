unit GenerageStep;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, CheckLst, Buttons, ExtCtrls, xmldom,
  XMLIntf, msxmldom, XMLDoc, UnitFormFactory;

type
  TFormGenStep = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    Splitter1: TSplitter;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    clbox1: TCheckListBox;
    xmldoc: TXMLDocument;
    StaticText1: TStaticText;
    BitBtn1: TBitBtn;
    Button1: TButton;
    red1: TRichEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure showProgram(node : IXMLNode);
    procedure loadStep();
    procedure addProgram(name : string; step:tstrings);
  public
    { Public declarations }
  end;

//var
//  FormGenStep: TFormGenStep;

//-------------- 子窗口创建者定义开始 ---------------//
IFormCreator_GenStep = class(TInterfacedObject, IFormCreator)
    function CreateForm():TForm;
end;
//------------ 子窗口创建者定义结束 -----------//

implementation

{$R *.dfm}
//-------------- 子窗口创建者实现开始 ---------------------//
function IFormCreator_GenStep.CreateForm():TForm;
begin
    Result := TFormGenStep.Create(nil);
end;
//-------------- 子窗口创建者实现结束 ---------------------//


///////////////////////
procedure TFormGenStep.loadStep;
var
   nodeList : IXMLNodeList;
//   node : IXMLNode;
   i : integer;
begin
    try
        xmldoc.LoadFromFile(ExtractFilePath(Application.ExeName)+'step_list.xml');
        nodeList := xmldoc.ChildNodes.Nodes['step_list'].ChildNodes;
        for i:=0 to nodeList.Count-1 do
        begin
            //处理分组层级bmg、uig、csg and so on
            if(nodeList.Nodes[i].NodeType=ntElement) and (nodeList.Nodes[i].NodeName='program') then
            begin
                //showmessage(nodeList.Nodes[i].NodeName);
                showProgram(nodeList.Nodes[i]);
            end;
        end;
    except
        showMessage('读取上线步骤配置文件step_list.xml失败，请确认文件是否在程序目录下存在，且格式正确！');
    end;
end;

procedure TFormGenStep.showProgram(node : IXMLNode);
var
//    nodeList : IXMLNodeList;
    item,child : IXmlNode;
    prog_name : string;
    prog_step : Tstrings;

begin
    if (not node.HasChildNodes) then exit;
    item := node.ChildNodes.FindNode('name') ;
    if(item=nil)then exit;
    if( item.HasChildNodes ) then
    begin
        child := item.ChildNodes.First;
        //showmessage(child.NodeValue);
        prog_name := child.NodeValue;
    end;

    //显示步骤内容
    item := node.ChildNodes.FindNode('step');
    if(item=nil)then exit;
    if( item.HasChildNodes ) then
    begin
        child := item.ChildNodes.First;
        //showmessage(child.NodeValue );
        prog_step := TStringList.Create;  //没有释放，可能会丢失内存
        prog_step.Add(child.NodeValue);
    //    prog_step := child.NodeValue;
        addProgram(prog_name, prog_step);
    end;
end;

procedure TFormGenStep.addProgram(name : string; step:tstrings);
begin
    clbox1.AddItem(name ,step);
end;

procedure TFormGenStep.FormShow(Sender: TObject);
begin
    loadStep();
end;

procedure TFormGenStep.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    action := caFree;
end;
procedure TFormGenStep.BitBtn2Click(Sender: TObject);
var
    i : integer;
begin
    red1.Clear;
//memo1.Clear;
    for i:=0 to clbox1.Count-1 do
    begin
        if clbox1.Checked[i] then
        begin
            //showmessage(clbox1.Items.Strings[i]+#13#10+TStrings(clbox1.items.objects[i]).Text);
            red1.Lines.Append(TStrings(clbox1.items.objects[i]).Text);
            //memo1.Lines.Append(TStrings(clbox1.items.objects[i]).Text);
        end;
    end;

end;

procedure TFormGenStep.BitBtn3Click(Sender: TObject);
begin
  red1.SelectAll;
  red1.CopyToClipboard;
//memo1.SelectAll;
//memo1.CopyToClipboard;
end;

procedure TFormGenStep.BitBtn1Click(Sender: TObject);
begin
    close;
end;

procedure TFormGenStep.Button1Click(Sender: TObject);
begin
    red1.Clear;
    red1.Lines.Add('<?xml version="1.0" encoding="GBK"?>'
+#13#10+'<step_list>'
+#13#10+'  <!--上线步骤样例-->'
+#13#10+'  <program>'
+#13#10+'    <name>数据库脚本</name>'
+#13#10+'    <step><![CDATA[数据库脚本上线步骤'
+#13#10+'1)登陆bkdata数据库'
+#13#10+'2)执行以下脚本'
+#13#10+'xxxxxx.sql'
+#13#10+'3)执行统一合并的bssp脚本，参见《BOSS系统BSSP配置脚本统一上线文档.doc》。'
+#13#10+']]></step>'
+#13#10+'  </program>'
+#13#10+'  <program>'
+#13#10+'    <name>程序2</name>'
+#13#10+'    <step><![CDATA[程序2上线步骤'
+#13#10+'1)步骤1'
+#13#10+'2)步骤2]]>'
+#13#10+'    </step>'
+#13#10+'  </program>'
+#13#10+'  <program>'
+#13#10+'    <name>程序3</name>'
+#13#10+'    <step><![CDATA[程序3上线步骤'
+#13#10+'1)步骤1'
+#13#10+'2)步骤2'
+#13#10+'3)步骤3]]>'
+#13#10+'    </step>'
+#13#10+'  </program>'
+#13#10+'</step_list>'
);
end;

initialization
  //注册工具类
  RegisteFormFactory('上线步骤生成(&S)',IFormCreator_GenStep.create);
end.
