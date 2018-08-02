unit UnitReckon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ExtCtrls, StdCtrls, DB, ADODB, Buttons,UnitReckonHelp, UnitReckonSql,UnitFormFactory,
  ComCtrls, DBGrids, CheckLst,XMLDoc, xmldom, XMLIntf, msxmldom, MemDS,
  DBAccess, Ora;

type
  TFormReckonConfig = class(TForm)
    Panel1: TPanel;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    StaticText18: TStaticText;
    StaticText19: TStaticText;
    StaticText20: TStaticText;
    edDbUser: TEdit;
    edDbPass: TEdit;
    edSysId: TEdit;
    btnDbConn: TButton;
    btnQuery: TButton;
    StaticText21: TStaticText;
    btnDbDisconn: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    sgReckonCfg: TStringGrid;
    Panel2: TPanel;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    StaticText6: TStaticText;
    StaticText7: TStaticText;
    StaticText8: TStaticText;
    StaticText9: TStaticText;
    StaticText10: TStaticText;
    StaticText11: TStaticText;
    StaticText12: TStaticText;
    StaticText13: TStaticText;
    StaticText14: TStaticText;
    StaticText15: TStaticText;
    StaticText16: TStaticText;
    StaticText17: TStaticText;
    edSysfuncId: TEdit;
    edAcceptItem: TEdit;
    cbAcceptMode: TComboBox;
    cbAcceptItemType: TComboBox;
    cbReportType: TComboBox;
    edRequestSource: TEdit;
    cbFeeItemType: TComboBox;
    cbBookItemType: TComboBox;
    cbFirstItem: TComboBox;
    cbSecondItem: TComboBox;
    cbSubTotalType: TComboBox;
    cbRptDispFlag: TComboBox;
    cbSubTotalDispFlag: TComboBox;
    cbAmountSign: TComboBox;
    cbInvokeType: TComboBox;
    edInvokeContent: TEdit;
    Button4: TButton;
    Button5: TButton;
    Button7: TButton;
    edDispLevel: TEdit;
    bbtnHelp: TBitBtn;
    Panel3: TPanel;
    Button2: TButton;
    Button1: TButton;
    GroupBox4: TGroupBox;
    Panel4: TPanel;
    GroupBox2: TGroupBox;
    edSysfuncId1: TEdit;
    edSysfuncName: TEdit;
    cbSysfuncType: TComboBox;
    StaticText22: TStaticText;
    StaticText23: TStaticText;
    StaticText24: TStaticText;
    Button6: TButton;
    GroupBox3: TGroupBox;
    cbFeeFlag: TComboBox;
    cbReckonFlag: TComboBox;
    cbGoodsFlag: TComboBox;
    cbBillFlag: TComboBox;
    Button8: TButton;
    sgSysRule: TStringGrid;
    Button9: TButton;
    Button10: TButton;
    Splitter3: TSplitter;
    TabSheet5: TTabSheet;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    Splitter4: TSplitter;
    GroupBox8: TGroupBox;
    Splitter5: TSplitter;
    GroupBox9: TGroupBox;
    Panel5: TPanel;
    Button11: TButton;
    redSmsContent: TRichEdit;
    redSmsCfg: TRichEdit;
    Panel6: TPanel;
    Button12: TButton;
    Button13: TButton;
    cbDBTNS: TComboBox;
    Panel9: TPanel;
    StaticText32: TStaticText;
    edSysfuncId3: TEdit;
    StaticText34: TStaticText;
    StaticText31: TStaticText;
    ckbHomeCity: TCheckBox;
    cklbHomeCity: TCheckListBox;
    mmReqSrc: TMemo;
    StaticText25: TStaticText;
    ckbBrand: TCheckBox;
    cklbBrand: TCheckListBox;
    cklbIdenType: TCheckListBox;
    StaticText33: TStaticText;
    ckbIdenType: TCheckBox;
    Button14: TButton;
    Button3: TButton;
    sgIdenType: TStringGrid;
    Button15: TButton;
    Button16: TButton;
    XMLDocument1: TXMLDocument;
    ADOConnection1: TOraSession;
    ADOQuery1: TOraQuery;
    redSmsInfo: TRichEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure bbtnHelpClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button7Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnDbConnClick(Sender: TObject);
    procedure btnDbDisconnClick(Sender: TObject);
    procedure ADOConnection1_1AfterConnect(Sender: TObject);
    procedure ADOConnection1_1AfterDisconnect(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
    procedure sgReckonCfgClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure cbReportTypeChange(Sender: TObject);
    procedure cbFeeItemTypeChange(Sender: TObject);
    procedure cbFirstItemChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure edSysfuncId1Change(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure sgSysRuleSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure cbFeeFlagChange(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ckbHomeCityClick(Sender: TObject);
    procedure ckbIdenTypeClick(Sender: TObject);
    procedure ckbBrandClick(Sender: TObject);
    procedure cklbHomeCityClickCheck(Sender: TObject);
    procedure cklbIdenTypeClickCheck(Sender: TObject);
    procedure cklbBrandClickCheck(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
  private
    { Private declarations }
    m_tsAcceptMode : TStringList;
    m_tsAcceptItemType :tstrings;
    m_tsReportType : tstrings;
    m_tsDispFlag : tstrings;
    m_tsFeeItemType : tstrings;
    m_tsBookItemType : tstrings;
    m_tsFirstItem : tstrings;
    m_tsSecondItem : tstrings;
    m_tsSubTotalType : tstrings;
    m_tsAmountSign : tstrings;
    m_tsInvokeType : tstrings;
    m_tsBrand : tstrings;
    m_tsSysfuncType : TStrings;
    
    m_fmSql:TFormReckonSql;
    m_fmHelp : TFormReckonHelp;

    procedure EnableAllItems();
    procedure DisableAllItems();
    procedure setCB(cbItem : TComboBox; idx : integer; status : boolean);
    function isNull(str : string):boolean;
//    procedure setGridItem(cb : TComboBox; sg : TStringGrid; acol,arow:integer);
//    procedure serialGrid(sg : TStringGrid);
    //结帐配置查询
    procedure queryReckonConfig(sysfunc:string);
    //业务功能配置查询
    procedure queryBizConfig(sysfunc:string);
    //受理校验配置查询
    procedure queryCheckConfig(sysfunc:string);
    //单据配置查询
    procedure queryBillConfig(sysfunc:string);
    //短信配置查询
    procedure querySmsConfig(sysfunc:string);
  public
    { Public declarations }
  end;

//var
//  FormReckonConfig: TFormReckonConfig;

//-------------- 子窗口创建者定义开始 ---------------//
IFormCreator_ReckonReportConfig = class(TInterfacedObject, IFormCreator)
    function CreateForm():TForm;
end;
//------------ 子窗口创建者定义结束 -----------//

implementation

uses UnitPublic;



{$R *.dfm}
//-------------- 子窗口创建者实现开始 ---------------------//
function IFormCreator_ReckonReportConfig.CreateForm():TForm;
begin
    Result := TFormReckonConfig.Create(nil);
end;
//-------------- 子窗口创建者实现结束 ---------------------//

procedure TFormReckonConfig.FormCreate(Sender: TObject);
var
    i : integer;
    str,iniFile : string;
begin
    pagecontrol1.ActivePageIndex := 0;

    //取数据库连接名
    iniFile := copy(Application.ExeName,1,length(Application.ExeName)-4) +'.tns2';
    if ( FileExists(iniFile) ) then
    begin
        cbDBTns.Items.LoadFromFile(iniFile);
        cbDBTns.ItemIndex := 0;
    end;

    ckbHomeCityClick(sender);
    ckbIdenTypeClick(sender);
    ckbBrandClick(sender);

    with sgReckonCfg do
    begin
        cells[0,0]  := '报表类型';
        cells[1,0]  := '受理模式';
        cells[2,0]  := '受理项目类别';
        cells[3,0]  := '受理项目编码';
        cells[4,0]  := '数据来源';
        cells[5,0]  := '费用类型';
        cells[6,0]  := '收支类型';
        cells[7,0]  := '一级项目';
        cells[8,0]  := '二级项目';
        cells[9,0]  := '汇总类别';
        cells[10,0] := '明细记录显示';
        cells[11,0] := '汇总记录显示';
        cells[12,0] := '显示等级';
        cells[13,0] := '金额显示正负值';
        cells[14,0] := '调用类型';
        cells[15,0] := '调用内容';
        cells[16,0] := '系统功能标识';
    end;
    with sgSysRule do
    begin
        cells[0,0]  := '序号';
        cells[1,0]  := '功能编码';
        cells[2,0]  := '受理来源';
        cells[3,0]  := '费用标志';
        cells[4,0]  := '轧帐标志';
        cells[5,0]  := '货品标志';
        cells[6,0]  := '免填单打印标志';
    end;
    serialGrid(sgSysRule);

    with sgIdenType do
    begin
        cells[0,0] := '序号';
        cells[1,0] := '功能编码';
        cells[2,0] := '地市编码';
        cells[3,0] := '受理来源';
        cells[4,0] := '认证方式';
        cells[5,0] := '品  牌';
    end;
    serialGrid(sgIdenType);

    m_fmSql := TFormReckonSql.Create(nil);
    m_fmHelp := TFormReckonHelp.Create(nil);

    //受理模式
    m_tsAcceptMode 			:= TStringList.Create;
    for i:=0 to cbAcceptMode.Items.Count-1 do
    begin
        str := cbAcceptMode.Items[i];
        str := trim(copy(str,0,pos(' ',str)));
        m_tsAcceptMode.Add(str);
    end;

    //受理项目类别
    m_tsAcceptItemType 	    := TStringList.Create;
    for i:=0 to cbAcceptItemType.Items.Count-1 do
    begin
        str := cbAcceptItemType.Items[i];
        str := trim(copy(str,0,pos(' ',str)));
        m_tsAcceptItemType.Add(str);
    end;

    m_tsReportType 			:= TStringList.Create;
    for i:=0 to cbReportType.Items.Count-1 do
    begin
        str := cbReportType.Items[i];
        str := trim(copy(str,0,pos(' ',str)));
        m_tsReportType.Add(str);
    end;

    m_tsDispFlag 			:= TStringList.Create;
    for i:=0 to cbRptDispFlag.Items.Count-1 do
    begin
        str := cbRptDispFlag.Items[i];
        str := trim(copy(str,0,pos(' ',str)));
        m_tsDispFlag.Add(str);
    end;

    m_tsFeeItemType 		:= TStringList.Create;
    for i:=0 to cbFeeItemType.Items.Count-1 do
    begin
        str := cbFeeItemType.Items[i];
        str := trim(copy(str,0,pos(' ',str)));
        m_tsFeeItemType.Add(str);
    end;

    m_tsBookItemType 		:= TStringList.Create;
    for i:=0 to cbBookItemType.Items.Count-1 do
    begin
        str := cbBookItemType.Items[i];
        str := trim(copy(str,0,pos(' ',str)));
        m_tsBookItemType.Add(str);
    end;
    m_tsFirstItem 			:= TStringList.Create;
    for i:=0 to cbFirstItem.Items.Count-1 do
    begin
        str := cbFirstItem.Items[i];
        str := trim(copy(str,0,pos(' ',str)));
        m_tsFirstItem.Add(str);
    end;
    
    m_tsSecondItem 			:= TStringList.Create;
    for i:=0 to cbSecondItem.Items.Count-1 do
    begin
        str := cbSecondItem.Items[i];
        str := trim(copy(str,0,pos(' ',str)));
        m_tsSecondItem.Add(str);
    end;
    m_tsSubTotalType 		:= TStringList.Create;
    for i:=0 to cbSubTotalType.Items.Count-1 do
    begin
        str := cbSubTotalType.Items[i];
        str := trim(copy(str,0,pos(' ',str)));
        m_tsSubTotalType.Add(str);
    end;

    m_tsAmountSign 			:= TStringList.Create;
    for i:=0 to cbAmountSign.Items.Count-1 do
    begin
        str := cbAmountSign.Items[i];
        str := trim(copy(str,0,pos(' ',str)));
        m_tsAmountSign.Add(str);
    end;

    m_tsInvokeType 			:= TStringList.Create;
    for i:=0 to cbInvokeType.Items.Count-1 do
    begin
        str := cbInvokeType.Items[i];
        str := trim(copy(str,0,pos(' ',str)));
        m_tsInvokeType.Add(str);
    end;

    m_tsBrand := TStringList.Create;
    for i:=0 to cklbBrand.Items.Count-1 do
    begin
        str := cklbBrand.Items[i];
        str := trim(copy(str,0,pos(' ',str)));
        m_tsBrand.Add(str);
    end;

    m_tsSysfuncType := TStringList.create;
    for i:=0 to cbSysfuncType.items.count-1 do
    begin
        str := cbSysfuncType.Items[i];
        str := trim(copy(str,0,pos(' ',str)));
        m_tsSysfuncType.Add(str);
    end;
end;

procedure TFormReckonConfig.FormDestroy(Sender: TObject);
begin
    m_fmSql.Free;
    m_fmHelp.Free;
    //
    m_tsAcceptMode.Free;
    m_tsAcceptItemType.Free;
    m_tsReportType.Free;
    m_tsDispFlag.Free;
    m_tsFeeItemType.Free;
    m_tsBookItemType.Free;
    m_tsFirstItem.Free;
    m_tsSecondItem.Free;
    m_tsSubTotalType.Free;
    m_tsAmountSign.Free;
    m_tsInvokeType.Free;

end;

procedure TFormReckonConfig.bbtnHelpClick(Sender: TObject);
begin
      m_fmHelp.Show;
end;

procedure TFormReckonConfig.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if adoConnection1.Connected then adoConnection1.Close;
    action := caFree;
end;

procedure TFormReckonConfig.Button7Click(Sender: TObject);
var
  i,idx : integer;
  sql:  string;
begin

    for i := 1 to sgReckonCfg.RowCount-1 do
    begin
        if(sgReckonCfg.Cells[0,i]='')then continue;
        idx := m_tsReportType.indexOf(sgReckonCfg.Cells[0,i]);
        sql := sql +'-----结帐配置---'+cbReportType.Items[idx]+'----------'+#13#10;
       sql := sql+'delete from biz.accept_reckon_cfg where sysfunc_id='+sgReckonCfg.cells[16,i]
            +' and reckon_report_type='+sgReckonCfg.Cells[0,i]
            +' and accept_mode='+ sgReckonCfg.Cells[1,i]
            +' and acceptitem_type='+sgReckonCfg.Cells[2,i]
            +' and request_source='+sgReckonCfg.Cells[4,i]
            +' and first_item='+sgReckonCfg.cells[7,i]
            +';';
       sql := sql+#13#10+'insert into biz.accept_reckon_cfg(sysfunc_id,reckon_report_type ,accept_mode ,acceptitem_type ,accept_item ,'+'request_source ,feeitem_type ,bookitem_type ,first_item ,second_item ,subtotal_type ,report_display_flag ,subtotal_display_flag ,display_level ,amount_sign ,invoke_type ,invoke_content )'
                +#13#10+' values('
				+#13#10+'  '+sgReckonCfg.Cells[16, i]+',--sysfunc_id'
				+#13#10+'  '+sgReckonCfg.Cells[ 0, i]+',--reckon_report_type   '
				+#13#10+'  '+sgReckonCfg.Cells[ 1, i]+',--accept_mode          '
				+#13#10+'  '+sgReckonCfg.Cells[ 2, i]+',--acceptitem_type      '
				+#13#10+'  '+sgReckonCfg.Cells[ 3, i]+',--accept_item          '
				+#13#10+'  '+sgReckonCfg.Cells[ 4, i]+',--request_source       '
				+#13#10+'  '+sgReckonCfg.Cells[ 5, i]+',--feeitem_type         '
				+#13#10+'  '+sgReckonCfg.Cells[ 6, i]+',--bookitem_type        '
				+#13#10+'  '+sgReckonCfg.Cells[ 7, i]+',--first_item           '
				+#13#10+'  '+sgReckonCfg.Cells[ 8, i]+',--second_item          '
				+#13#10+'  '+sgReckonCfg.Cells[ 9, i]+',--subtotal_type        '
				+#13#10+'  '+sgReckonCfg.Cells[10, i]+',--report_display_flag  '
				+#13#10+'  '+sgReckonCfg.Cells[11, i]+',--subtotal_display_flag'
				+#13#10+'  '+sgReckonCfg.Cells[12, i]+',--display_level        '
				+#13#10+'  '+sgReckonCfg.Cells[13, i]+',--amount_sign          '
				+#13#10+'  '+sgReckonCfg.Cells[14, i]+',--invoke_type          '
				+#13#10+'  '+''''+sgReckonCfg.Cells[15, i]+'''--invoke_content        '
                +#13#10+');'
                +#13#10;
    end;
    m_fmSql.mmSql.Text := m_fmSql.mmSql.Text + sql;
end;

procedure TFormReckonConfig.Button2Click(Sender: TObject);
begin
    close;
end;

procedure TFormReckonConfig.btnDbConnClick(Sender: TObject);
begin
//    AdoConnection1.ConnectionString := 'Provider=OraOLEDB.Oracle.1;Persist Security Info=True;Data Source='+cbDbTns.Text;
//    AdoConnection1.Open(edDbUser.Text, edDbPass.Text);
     adoConnection1.ConnectString := edDbUser.Text +'/'+edDbPass.Text+'@'+cbdbtns.text; //'biz/biz@10.1.0.220:1521:kf';
     adoconnection1.Open;
end;

procedure TFormReckonConfig.btnDbDisconnClick(Sender: TObject);
begin
    AdoConnection1.Close;

end;

procedure TFormReckonConfig.ADOConnection1_1AfterConnect(Sender: TObject);
begin
    btnDbDisconn.Enabled := true;
    btnDbConn.Enabled := false;
    btnQuery.Enabled := true;
end;

procedure TFormReckonConfig.ADOConnection1_1AfterDisconnect(Sender: TObject);
begin
    btnDbDisconn.Enabled := false;
    btnDbConn.Enabled := true;
    btnQuery.Enabled := false;
end;
procedure TFormReckonConfig.queryReckonConfig(sysfunc:string);
var
    i,j : integer;
begin
    sgReckonCfg.RowCount := 2;
    for j:=0 to sgReckonCfg.ColCount-1 do
    begin
        sgReckonCfg.Cells[j,1] := '';
    end;

    adoQuery1.Close;
    adoQuery1.SQL.clear;
    adoQuery1.SQL.Add('select * from accept_reckon_cfg where sysfunc_id='+sysfunc+' order by reckon_report_type,accept_mode,acceptitem_type');
    adoQuery1.Open;
    i := 1;
    while not adoQuery1.Eof do
    begin
        sgReckonCfg.Cells[ 0, i] := adoQuery1.FieldByName('reckon_report_type').AsString;
        sgReckonCfg.Cells[ 1, i] := adoQuery1.FieldByName('accept_mode').AsString;
        sgReckonCfg.Cells[ 2, i] := adoQuery1.FieldByName('acceptitem_type').AsString;
        sgReckonCfg.Cells[ 3, i] := adoQuery1.FieldByName('accept_item').AsString;
        sgReckonCfg.Cells[ 4, i] := adoQuery1.FieldByName('request_source').AsString;
        sgReckonCfg.Cells[ 5, i] := adoQuery1.FieldByName('feeitem_type').AsString;
        sgReckonCfg.Cells[ 6, i] := adoQuery1.FieldByName('bookitem_type').AsString;
        sgReckonCfg.Cells[ 7, i] := adoQuery1.FieldByName('first_item').AsString;
        sgReckonCfg.Cells[ 8, i] := adoQuery1.FieldByName('second_item').AsString;
        sgReckonCfg.Cells[ 9, i] := adoQuery1.FieldByName('subtotal_type').AsString;
        sgReckonCfg.Cells[10, i] := adoQuery1.FieldByName('report_display_flag').AsString;
        sgReckonCfg.Cells[11, i] := adoQuery1.FieldByName('subtotal_display_flag').AsString;
        sgReckonCfg.Cells[12, i] := adoQuery1.FieldByName('display_level').AsString;
        sgReckonCfg.Cells[13, i] := adoQuery1.FieldByName('amount_sign').AsString;
        sgReckonCfg.Cells[14, i] := adoQuery1.FieldByName('invoke_type').AsString;
        sgReckonCfg.Cells[15, i] := adoQuery1.FieldByName('invoke_content').AsString;
        sgReckonCfg.Cells[16, i] := adoQuery1.FieldByName('sysfunc_id').AsString;

        adoQuery1.Next;
        i := i+1;
        sgReckonCfg.RowCount := sgReckonCfg.RowCount+1;
        for j:=0 to sgReckonCfg.ColCount-1 do
        begin
            sgReckonCfg.Cells[j,sgReckonCfg.RowCount-1] := '';
        end;
    end;
    adoQuery1.Close;
end;
procedure TFormReckonConfig.queryBizConfig(sysfunc:string);
var
    row : integer;
begin
    //功能定义
    adoQuery1.close;
    adoQuery1.sql.clear;
    adoQuery1.SQL.add('select * from accept_sysfunc_def where sysfunc_id='+sysfunc);
    adoQuery1.open;
    if not adoQuery1.eof then
    with adoQuery1 do
    begin
        edsysfuncid1.Text := fieldByName('sysfunc_id').asString;
        edsysfuncname.Text := fieldByName('name').asString;
        cbSysfuncType.ItemIndex := m_tsSysFuncType.IndexOf( fieldByName('accept_type').asString);
    end;
    //业务规则
    adoQuery1.close;
    adoQuery1.sql.clear;
    adoQuery1.SQL.add('select * from accept_sysfunc_rule where sysfunc_id='+sysfunc);
    adoQuery1.open;
    sgSysRule.RowCount := 2;
    sgSysRule.Rows[1].Text := '';
    while not adoQuery1.Eof do
    begin
        row := sgSysRule.RowCount-1;
        with adoQuery1 do
        begin
            sgSysRule.Cells[1,row] := fieldByName('sysfunc_id').asString;
            sgSysRule.Cells[2,row] := fieldByName('request_source').asString;
            sgSysRule.Cells[3,row] := fieldByName('fee_flag').asString;
            sgSysRule.Cells[4,row] := fieldByName('reckon_flag').asString;
            sgSysRule.Cells[5,row] := fieldByName('goods_flag').asString;
            sgSysRule.Cells[6,row] := fieldByName('freebill_flag').asString;

            sgSysRule.RowCount := sgSysRule.RowCount+1;
            sgSysRule.Rows[row+1].Text := '';
        end;
        adoQuery1.Next;
    end;
    serialGrid(sgSysRule);

    //认证方式查询
    adoQuery1.Close;
    adoQuery1.SQL.Clear;
    adoQuery1.SQL.Add('select sysfunc_id,home_city,identify_type,request_source,brand_id ');
    adoQuery1.SQL.add(' from accept_identify_type_cfg where sysfunc_id='+sysfunc);
    adoQuery1.Open;
    sgIdenType.RowCount := 2;
    sgIdenType.Rows[1].Text := '';
    while not adoQuery1.eof do
    begin
        row := sgIdenType.RowCount-1;
        with adoQuery1 do
        begin
            sgIdenType.cells[1,row] := fieldByName('sysfunc_id').AsString;
            sgIdenType.cells[2,row] := fieldByName('home_city').AsString;
            sgIdenType.cells[3,row] := fieldByName('request_source').AsString;
            sgIdenType.cells[4,row] := fieldByName('identify_type').AsString;
            sgIdenType.cells[5,row] := fieldByName('brand_id').AsString;
        end;
        adoQuery1.Next;
        sgIdenType.RowCount := sgIdenType.RowCount+1;
        sgIdenType.rows[row+1].text := '';
    end;
    serialGrid(sgIdenType);
    
    adoQuery1.close;
end;

procedure TFormReckonConfig.queryCheckConfig(sysfunc:string);
begin
end;

procedure TFormReckonConfig.queryBillConfig(sysfunc:string);
begin
end;
procedure TFormReckonConfig.querySmsConfig(sysfunc:string);
begin
end;

procedure TFormReckonConfig.btnQueryClick(Sender: TObject);
begin
    if( trim(edSysid.Text) = '')then
    begin
        showmessage('请指定系统功能编码sysfunc_id');
        edSysId.SetFocus;
        exit;
    end;
    case pagecontrol1.ActivePageIndex of
    0:
        //业务功能配置查询
        queryBizConfig(edSysid.Text);
    1:
        //结帐配置查询
        queryReckonConfig(edSysid.Text);
    2:
        //短信配置查询
        querySmsConfig(edSysid.Text);
    3:
        //受理校验配置查询
        queryCheckConfig(edSysid.Text);
    4:
        //单据配置查询
        queryBillConfig(edSysid.Text);
    else
    end;



end;

procedure TFormReckonConfig.sgReckonCfgClick(Sender: TObject);
var
  i : integer;
begin
{
cbReportType
cbAcceptMode
cbAcceptItemType
edAcceptItem
edRequestSource
cbFeeItemType
cbBookItemType
cbFirstItem
cbSecondItem
cbSubTotalTyp
cbRptDispFlag
cbSubTotalDispFlag
edDispLevel
cbAmountSign
cbInvokeType
edInvokeContent
edSysfuncId
}
    if( sgReckonCfg.Row > 0 ) then
    begin
        cbReportType.itemindex := m_tsReportType.IndexOf(     sgReckonCfg.cells[ 0 , sgReckonCfg.row] );
		cbReportType.text := cbReportType.items[ cbReportType.itemIndex];
        cbAcceptMode.itemIndex := m_tsAcceptMode.IndexOf(     sgReckonCfg.cells[ 1 , sgReckonCfg.row] );
		cbAcceptMode.text := cbAcceptMode.items[cbAcceptMode.itemIndex ];
        cbAcceptItemType.itemindex := m_tsAcceptItemType.IndexOf( sgReckonCfg.cells[ 2 , sgReckonCfg.row] );
		cbAcceptItemType.text := cbAcceptItemType.items[ cbAcceptItemType.itemIndex ];
		edAcceptItem.text         :=                                 sgReckonCfg.cells[ 3 , sgReckonCfg.row] ;
		edRequestSource.text      :=                                 sgReckonCfg.cells[ 4 , sgReckonCfg.row] ;
        cbFeeItemType.itemIndex :=m_tsFeeItemType.IndexOf(    sgReckonCfg.cells[ 5 , sgReckonCfg.row] );
		cbFeeItemType.text := cbFeeItemType.items[ cbFeeItemType.itemIndex];
        cbBookItemType.itemIndex := m_tsBookItemType.IndexOf(   sgReckonCfg.cells[ 6 , sgReckonCfg.row] );
		cbBookItemType.text := cbBookItemType.items[ cbBookItemType.itemIndex];
        cbFirstItem.itemIndex := m_tsFirstItem.IndexOf(      sgReckonCfg.cells[ 7 , sgReckonCfg.row] );
        if(cbFirstItem.itemIndex=-1)then
            cbFirstItem.text := sgReckonCfg.cells[ 7 , sgReckonCfg.row]
        else
    		cbFirstItem.text := cbFirstItem.Items[ cbFirstItem.itemIndex];
        cbSecondItem.itemIndex :=m_tsSecondItem.IndexOf(     sgReckonCfg.cells[ 8 , sgReckonCfg.row] );
		cbSecondItem.text := cbSecondItem.Items[ cbSecondItem.itemIndex];
        cbSubTotalType.itemIndex := m_tsSubTotalType.IndexOf(   sgReckonCfg.cells[ 9 , sgReckonCfg.row] );
		cbSubTotalType.text := cbSubTotalType.items[ cbSubTotalType.itemIndex];
        cbRptDispFlag.itemIndex := m_tsDispFlag.IndexOf(       sgReckonCfg.cells[ 10, sgReckonCfg.row] );
		cbRptDispFlag.text := cbRptDispFlag.Items[ cbRptdispFlag.itemIndex];
        cbSubTotalDispFlag.itemIndex :=m_tsDispFlag.IndexOf(       sgReckonCfg.cells[ 11, sgReckonCfg.row] );
		cbSubTotalDispFlag.text := cbSubTotalDispFlag.Items[ cbSubTotalDispFlag.itemIndex];
		edDispLevel.text          :=                                 sgReckonCfg.cells[ 12, sgReckonCfg.row] ;
        cbAmountSign.itemIndex :=m_tsAmountSign.IndexOf(     sgReckonCfg.cells[ 13, sgReckonCfg.row] );
		cbAmountSign.text := cbAmountSign.items[ cbAmountSign.itemIndex];
        cbInvokeType.itemIndex :=  m_tsInvokeType.IndexOf(     sgReckonCfg.cells[ 14, sgReckonCfg.row] );
		cbInvokeType.text := cbInvokeType.Items[cbInvokeType.itemIndex];
		edInvokeContent.text      :=                                 sgReckonCfg.cells[ 15, sgReckonCfg.row] ;
		edSysfuncId.text          :=                                 sgReckonCfg.cells[ 16, sgReckonCfg.row] ;
    end;
end;

procedure TFormReckonConfig.Button4Click(Sender: TObject);
var
  i : integer;
begin
    //校验值是否都填了
	if(cbReportType.itemIndex < 0 ) then begin showmessage('请完整填写参数值');cbReportType.SetFocus; exit; end;
	if(cbAcceptMode.itemIndex < 0 )  then begin showmessage('请完整填写参数值'); cbAcceptMode.setfocus;exit; end;
	if(cbAcceptItemType.itemIndex < 0 )  then begin showmessage('请完整填写参数值');cbAcceptItemType.SetFocus; exit; end;
	if(edAcceptItem.text ='') then begin showmessage('请完整填写参数值'); edAcceptItem.SetFocus;exit; end;
	if(edRequestSource.text='') then begin showmessage('请完整填写参数值');edRequestSource.SetFocus; exit; end;
	if(cbFeeItemType.itemIndex < 0 )  then begin showmessage('请完整填写参数值');cbFeeItemType.SetFocus; exit; end;
	if(cbBookItemType.itemIndex < 0 )  then begin showmessage('请完整填写参数值');cbBookItemType.SetFocus; exit; end;
	if(cbFirstItem.text='' )  then begin showmessage('请完整填写参数值'); cbFirstItem.SetFocus; exit; end;
	if(cbSecondItem.itemIndex < 0 )  then begin showmessage('请完整填写参数值'); cbSecondItem.setfocus; exit; end;
	if(cbSubTotalType.itemIndex < 0 )  then begin showmessage('请完整填写参数值');cbSubTotalType.setfocus; exit; end;
	if(cbRptDispFlag.itemIndex < 0 )  then begin showmessage('请完整填写参数值');cbRptDispFlag.setfocus; exit; end;
	if(cbSubTotalDispFlag.itemIndex < 0 )  then begin showmessage('请完整填写参数值');cbSubTotalDispFlag.setfocus; exit; end;
	//if(edDispLevel.text='') then begin showmessage('请完整填写参数值');edDispLevel.setfocus; exit; end;
	if(cbAmountSign.itemIndex < 0 )  then begin showmessage('请完整填写参数值');cbAmountSign.setfocus; exit; end;
	if(cbInvokeType.itemIndex < 0 )  then begin showmessage('请完整填写参数值');cbInvokeType.setfocus; exit; end;
	//if(edInvokeContent.text='') then begin showmessage('请完整填写参数值'); exit; end;
	if(edSysfuncId.text='') then begin showmessage('请填写功能标识');edSysfuncId.setfocus; exit; end;

    if(sgReckonCfg.Cells[0,sgReckonCfg.RowCount-1]<>'')then
    begin
        sgReckonCfg.RowCount := sgReckonCfg.RowCount+1;
        for i := 0 to sgReckonCfg.ColCount-1 do
            sgReckonCfg.Cells[i,sgReckonCfg.RowCount-1] := '';
    end;
    i := sgReckonCfg.RowCount-1;

	sgReckonCfg.Cells[ 0, i] := m_tsReportType.Strings[cbReportType.itemIndex];
	sgReckonCfg.Cells[ 1, i] := m_tsAcceptMode.Strings[cbAcceptMode.itemIndex];
	sgReckonCfg.Cells[ 2, i] := m_tsAcceptItemType.Strings[cbAcceptItemType.itemIndex];
	sgReckonCfg.Cells[ 3, i] := edAcceptItem.text;
	sgReckonCfg.Cells[ 4, i] := edRequestSource.text;
	sgReckonCfg.Cells[ 5, i] := m_tsFeeItemType.strings[cbFeeItemType.itemIndex];
	sgReckonCfg.Cells[ 6, i] := m_tsBookItemType.strings[cbBookItemType.itemIndex];
    cbFirstItem.text := cbFirstItem.text+' ';
	sgReckonCfg.Cells[ 7, i] := trim(copy(cbFirstItem.text,0,pos(' ',cbFirstItem.Text))); //m_tsFirstItem.strings[cbFirstItem.itemIndex];
	sgReckonCfg.Cells[ 8, i] := m_tsSecondItem.strings[cbSecondItem.itemIndex];
	sgReckonCfg.Cells[ 9, i] := m_tsSubTotalType.strings[cbSubTotalType.itemIndex];
	sgReckonCfg.Cells[10, i] := m_tsDispFlag.strings[cbRptDispFlag.itemIndex];
	sgReckonCfg.Cells[11, i] := m_tsDispFlag.strings[cbSubTotalDispFlag.itemIndex];
	sgReckonCfg.Cells[12, i] := edDispLevel.text;
	sgReckonCfg.Cells[13, i] := m_tsAmountSign.strings[cbAmountSign.itemIndex];
	sgReckonCfg.Cells[14, i] := m_tsInvokeType.strings[cbInvokeType.itemIndex];
	sgReckonCfg.Cells[15, i] := edInvokeContent.text;
	sgReckonCfg.Cells[16, i] := edSysfuncId.text;
end;

procedure TFormReckonConfig.Button5Click(Sender: TObject);
var
    i : integer;
begin
    with sgReckonCfg do
    begin
        if (row<1) then exit;

        for i:= row to RowCount-2 do
        begin
            Rows[i] := Rows[i+1];
        end;

        if RowCount > 2 then
        begin
            RowCount := RowCount - 1;
        end
        else
        begin
            //设置缺省值
        for i := 0 to sgReckonCfg.ColCount-1 do
            sgReckonCfg.Cells[i,sgReckonCfg.RowCount-1] := '';
        end;
    end;
end;
procedure TFormReckonConfig.setCB(cbItem : TComboBox; idx : integer; status : boolean);
begin
    cbItem.ItemIndex := idx;
    cbItem.Text := cbItem.items[cbItem.ItemIndex];
    cbItem.enabled := status;
end;

procedure TFormReckonConfig.cbReportTypeChange(Sender: TObject);
var
    rptType : integer;
begin
    //不同的报表类型需要配置不同的项目
    EnableAllItems();
    rptType := strtoint(m_tsReportType.strings[cbReportType.itemindex]);
    edDispLevel.Enabled := false; //自动生成值
    //结帐报表类别
    case rptType of
        10   ://营业日结帐报表
        begin
            setCB(cbBookItemType,0,false);
            setCB(cbSecondItem,0,false);
            edRequestSource.Enabled := true;
            setCB(cbFeeItemType,-1,true);
            setCB(cbSubTotalType,1,true);
            setCB(cbSubTotalDispFlag,0,true);
            edDispLevel.text := '50';
        end;
        11   ://营业日报主报表
        begin
            setCB(cbBookItemType,0,true);
            edRequestSource.Enabled := false;
            edRequestSource.text := '0';
            setCB(cbFeeItemType,0,false);
            setCB(cbSecondItem,0,true);
            setCB(cbSubTotalType,0,false);
            setCB(cbSubTotalDispFlag,0,false);
            edDispLevel.text := '0';
        end;
        12..18   ://辅表
        begin
            setCB(cbBookItemType,0,false);
            edRequestSource.Enabled := false;
            edRequestSource.text := '0';
            setCB(cbFeeItemType,0,false);
            setCB(cbSecondItem,0,false);
            setCB(cbSubTotalType,0,false);
            setCB(cbSubTotalDispFlag,0,false);
            edDispLevel.text := '-1';
            //edDispLevel.Enabled := false;
        end;
        else
            DisableAllItems();
    end;

end;

procedure TFormReckonConfig.EnableAllItems();
begin
	cbReportType.enabled := true;
	cbAcceptMode.enabled := true;
	cbAcceptItemType.enabled := true;
	edAcceptItem.enabled := true;
	edRequestSource.enabled := true;
	cbFeeItemType.enabled := true;
	cbBookItemType.enabled := true;
	cbFirstItem.enabled := true;
	cbSecondItem.enabled := true;
	cbSubTotalType.enabled := true;
	cbRptDispFlag.enabled := true;
	cbSubTotalDispFlag.enabled := true;
	edDispLevel.enabled := true;
	cbAmountSign.enabled := true;
	cbInvokeType.enabled := true;
	edInvokeContent.enabled := true;
	edSysfuncId.enabled := true;
end;
procedure TFormReckonConfig.DisableAllItems();
begin
	cbReportType.enabled := false;
	cbAcceptMode.enabled := false;
	cbAcceptItemType.enabled := false;
	edAcceptItem.enabled := false;
	edRequestSource.enabled := false;
	cbFeeItemType.enabled := false;
	cbBookItemType.enabled := false;
	cbFirstItem.enabled := false;
	cbSecondItem.enabled := false;
	cbSubTotalType.enabled := false;
	cbRptDispFlag.enabled := false;
	cbSubTotalDispFlag.enabled := false;
	edDispLevel.enabled := false;
	cbAmountSign.enabled := false;
	cbInvokeType.enabled := false;
	edInvokeContent.enabled := false;
	edSysfuncId.enabled := false;
end;

procedure TFormReckonConfig.cbFeeItemTypeChange(Sender: TObject);
var
    feeType : integer;
begin
    feeType := strtoint(m_tsFeeItemType.strings[cbFeeItemType.itemindex]);
    //rptType := strtoint(m_tsReportType.strings[cbReportType.itemindex]);
    case feeType of
        0 :
            edDispLevel.text := '50';
        11:
            edDispLevel.text := '10';
        12:
            edDispLevel.text := '1';
    //else
       // edDispLevel.text := '50';
    end;

end;

procedure TFormReckonConfig.cbFirstItemChange(Sender: TObject);
var
    rptType : integer;
    first : string;
begin
    if(cbReportType.itemindex<0)then
    begin
        showmessage('请选择报表类型');
        cbReportType.setFocus;
        exit;
    end;
    rptType := strtoint(m_tsReportType.strings[cbReportType.itemindex]);
    case rptType of
        11:
        begin
            first := cbFirstItem.Text ;
            first := trim(copy(first,0,pos(' ',first)));
            if(first='')then first := cbFirstItem.text;
            if(first<>'')then
            begin
            first := copy(first,length(first),1);  
            edDispLevel.text := inttostr(strtoint(first)*4);
            end;
        end;
    else
        ;
    end;
end;

procedure TFormReckonConfig.Button1Click(Sender: TObject);
begin
    m_fmSql.show;

end;
function TFormReckonConfig.isNull(str : string):boolean;
begin
    result := false;
    if str='' then
    begin
        showmessage('请填写完整参数');
        result := true;
    end;
end;

procedure TFormReckonConfig.Button6Click(Sender: TObject);
var
  sql:  string;
  at : string;
begin
    if isNull(edSysfuncId1.Text) or isNull(edSysfuncName.Text) then exit;
    at := trim(copy(cbSysfuncType.Text,1,pos(' ',cbSysfuncType.Text)));

    sql := '--业务功能定义'#13#10;
    sql := sql+'delete from biz.accept_sysfunc_def where sysfunc_id='+edSysfuncId1.Text+' ;';
    sql := sql+#13#10+'insert into biz.accept_sysfunc_def(sysfunc_id,name ,accept_type)'
                +#13#10+' values('+edSysfuncId1.text+','''+edSysfuncName.Text+''','+at+');'
                +#13#10;
    m_fmSql.mmSql.text := m_fmSql.mmsql.text + sql;

end;

procedure TFormReckonConfig.edSysfuncId1Change(Sender: TObject);
begin
//    edSysfuncId2.Text := edSysfuncId1.Text;
    edSysfuncId3.Text := edSysfuncId1.Text;
    //sgSysRule.Cells[1,1] := edSysfuncId1.Text;
    setText2SG(sgSysRule, 1,edSysfuncId1.Text );
end;

procedure TFormReckonConfig.Button8Click(Sender: TObject);
var
  sql:  string;
//  at : string;
  i : integer;
begin
//    if isNull(edSysfuncId2.Text) or isNull(edReqSrc.Text) then exit;
    //at := trim(copy(cbSysfuncType.Text,1,pos(' ',cbSysfuncType.Text)));
    sql := '--业务受理规则'#13#10;

    for i := 1 to sgSysRule.RowCount-1 do
    begin
        if( (sgSysRule.cells[1,i]='') or (sgSysRule.cells[2,i]='')) then continue;
        sql := sql+'delete from biz.accept_sysfunc_rule where sysfunc_id='+sgSysRule.cells[1,i]+' and request_source='+sgSysRule.cells[2,i]+' ;'
                +#13#10+'insert into biz.accept_sysfunc_rule(sysfunc_id,request_source ,fee_flag,reckon_flag,goods_flag,freebill_flag)'
                +#13#10+' values('+sgSysRule.cells[1,i]+','+sgSysRule.cells[2,i]+','+sgSysRule.cells[3,i]+','+sgSysRule.cells[4,i]+','+sgSysRule.cells[5,i]+','+sgSysRule.cells[6,i]+');'
                +#13#10;
    end;
    m_fmSql.mmSql.text := m_fmSql.mmsql.text + sql;

end;

procedure TFormReckonConfig.sgSysRuleSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
    cbReckonFlag.Hide;
    cbFeeFlag.Hide;
    cbGoodsFlag.Hide;
    cbBillFlag.Hide;
    case acol of
       3 : // 费用
       begin
        setGridItem(cbFeeFlag, TStringGrid(sender), acol, arow);
       end;
       4: //轧帐
       begin
        setGridItem(cbReckonFlag, TStringGrid(sender), acol, arow);
       end;
       5: //货品
        setGridItem(cbGoodsFlag, TStringGrid(sender), acol, arow);
       6: //免填单
        setGridItem(cbBillFlag, TStringGrid(sender), acol, arow);
    end;

end;

procedure TFormReckonConfig.cbFeeFlagChange(Sender: TObject);
begin
    if( sgSysRule.col <1) or (sgSysRule.row<1) then exit;
    sgSysRule.Cells[sgSysRule.col,sgSysRule.row] := inttostr(TComboBox(Sender).ItemIndex);
end;

procedure TFormReckonConfig.Button9Click(Sender: TObject);
var
    i:integer;
begin
    i := sgSysRule.RowCount;
    sgSysRule.RowCount := sgSysRule.RowCount+1;
    sgSysRule.Rows[i].Text := '';
    serialGrid(sgSysRule);
    sgSysRule.Cells[1,i] := sgSysRule.cells[1,1];
end;

procedure TFormReckonConfig.Button3Click(Sender: TObject);
var
  sql:  string;
  i : integer;
begin
    if( trim(sgIdenType.cells[1,1])='') then exit;
    sql := '--业务认证方式';
    for i :=1 to sgIdenType.RowCount-1 do
    begin
      with sgIdenType do
      begin
        if(cells[1,i]='')then continue;
		sql := sql+#13#10+'delete from biz.ACCEPT_IDENTIFY_TYPE_CFG where sysfunc_id='+cells[1,i]+' and home_city='+cells[2,i]+' and identify_type='+cells[4,i]+' and request_source='+cells[3,i]+' and brand_id='+cells[5,i]+';'
        +#13#10;
        sql := sql+'insert into biz.ACCEPT_IDENTIFY_TYPE_CFG (SYSFUNC_ID, HOME_CITY, IDENTIFY_TYPE, REQUEST_SOURCE, BRAND_ID, CREATE_TIME, MODIFY_TIME, OPERATOR_ID)'
		    +#13#10+'values ('+cells[1,i]+', '+cells[2,i]+', '+cells[4,i]+', '+cells[3,i]+', '+cells[5,i]+', sysdate, sysdate, 9999999);'
		    +#13#10;
      end;
    end;
    m_fmSql.mmSql.text := m_fmSql.mmsql.text + sql;
end;

procedure TFormReckonConfig.ckbHomeCityClick(Sender: TObject);
var
    i : integer;
begin
    for i := 0 to cklbHomeCity.count-1 do
        cklbHomeCity.Checked[i] := ckbHomeCity.Checked;
end;

procedure TFormReckonConfig.ckbIdenTypeClick(Sender: TObject);
var
    i : integer;
begin
    for i := 0 to cklbIdenType.count-1 do
        cklbIdenType.Checked[i] := ckbIdenType.Checked;
end;

procedure TFormReckonConfig.ckbBrandClick(Sender: TObject);
var
    i : integer;
begin
    for i := 0 to cklbBrand.count-1 do
        cklbBrand.Checked[i] := ckbBrand.Checked;
end;

procedure TFormReckonConfig.cklbHomeCityClickCheck(Sender: TObject);
begin
//    ckbHomeCity.Checked := false;
end;

procedure TFormReckonConfig.cklbIdenTypeClickCheck(Sender: TObject);
begin
//    ckbIdenType.Checked := false;
end;

procedure TFormReckonConfig.cklbBrandClickCheck(Sender: TObject);
begin
//    ckbBrand.Checked := false;
end;

procedure TFormReckonConfig.Button14Click(Sender: TObject);
var
    i,j,k,l, row: integer;

begin
    if isNull(edSysfuncId3.Text) then exit;

    if(sgIdenType.Cells[1,sgIdenType.RowCount-1]<>'')then
    begin
        sgIdenType.RowCount := sgIdenType.RowCount+1;
        sgIdenType.Rows[sgIdenType.RowCount-1].text := '';
    end;

    for i:=0 to cklbHomeCity.Count-1 do
    begin
        if( not cklbHomeCity.Checked[i]) then continue;
        for j:=0 to cklbIdenType.Count-1 do
        begin
            if( not cklbIdenType.checked[j]) then continue;
            for k:=0 to cklbBrand.Count-1 do
            begin
                if(not cklbBrand.Checked[k]) then continue;
                for l:=0 to mmReqSrc.Lines.Count-1 do
                begin
                    if(trim(mmReqSrc.Lines.Strings[l])='')then continue;
                    row := sgIdenType.Rowcount-1;
                    sgIdenType.cells[1,row] := trim(edSysfuncId3.Text);
                    sgIdenType.cells[2,row] := trim(copy(cklbHomeCity.items[i],0,pos(' ',cklbHomeCity.items[i]))); //home_city
                    sgIdenType.cells[3,row] := trim(mmReqSrc.Lines.Strings[l]); //req_src
                    sgIdenType.cells[4,row] := trim(copy(cklbIdenType.items[j],0,pos(' ',cklbIdenType.items[j]))); //iden_type
                    sgIdenType.cells[5,row] := trim(copy(cklbBrand.items[k],0,pos(' ',cklbBrand.items[k]))); //brand
                    sgIdenType.RowCount:=sgIdenType.RowCount+1;
                    //row := row+1;
                    sgIdenType.Rows[row+1].text := '';
                end;
            end;
        end;
    end;

    serialGrid(sgIdenType);
end;

procedure TFormReckonConfig.Button15Click(Sender: TObject);
begin
    sgIdenType.RowCount := 2;
    sgIdenType.rows[1].Text := '';
end;

procedure TFormReckonConfig.Button10Click(Sender: TObject);
begin
    deleteRow(sgSysRule);
    serialGrid(sgSysRule);
end;

procedure TFormReckonConfig.Button16Click(Sender: TObject);
begin
    deleteRow(sgIdenType);
    serialGrid(sgIdenType);
end;

procedure TFormReckonConfig.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
{
    if MessageDlg('确定要关闭?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
        canClose:=false;
}
end;

procedure TFormReckonConfig.Button11Click(Sender: TObject);
begin
  redSmsContent.Text := transformXml(redSmsInfo.Text,redSmsCfg.Text);
end;

procedure TFormReckonConfig.Button12Click(Sender: TObject);
var
    outStr : string;
    tab : string;
begin
 tab := '  ';
 formatXml(tab, redsmscfg.Text, outStr);
 redsmscfg.text := outstr;
end;

initialization
//注册工具类
  RegisteFormFactory('业务配置(&Z)',IFormCreator_ReckonReportConfig.create);

end.
