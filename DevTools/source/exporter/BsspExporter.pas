unit BsspExporter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, Buttons, ComCtrls,StrUtils,FileCtrl,UnitFormFactory,
  ExtCtrls,iniFiles, MemDS, DBAccess, Ora;

type
  TFormBsspExporter = class(TForm)
    GroupBox2: TGroupBox;
    StaticText1: TStaticText;
    btnDbConn: TButton;
    btnDbDisconn: TButton;
    StatusBar1: TStatusBar;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox6: TGroupBox;
    SpeedButton1: TSpeedButton;
    edExportDir: TEdit;
    btnGetAll: TButton;
    btStop: TButton;
    GroupBox1: TGroupBox;
    mmBusiness: TMemo;
    btnGet1: TButton;
    StaticText5: TStaticText;
    GroupBox3: TGroupBox;
    mmProcess: TMemo;
    StaticText4: TStaticText;
    btnGet2: TButton;
    GroupBox5: TGroupBox;
    mmService: TMemo;
    StaticText7: TStaticText;
    btnGet4: TButton;
    Panel1: TPanel;
    Memo1: TMemo;
    GroupBox7: TGroupBox;
    edPreFix: TEdit;
    cbPreFix: TCheckBox;
    cbDBTns: TComboBox;
    cb_procTmpl: TCheckBox;
    ADOConnection1: TOraSession;
    adoQuery1: TOraQuery;
    ADOQuery2: TOraQuery;
    ADOQuery3: TOraQuery;
    ledDbUser: TLabeledEdit;
    ledDbPass: TLabeledEdit;
    procedure btnDbConnClick(Sender: TObject);
    procedure ADOConnection1_1AfterConnect(Sender: TObject);
    procedure ADOConnection1_1AfterDisconnect(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnGet1Click(Sender: TObject);
    procedure btnDbDisconnClick(Sender: TObject);
    procedure btnGet2Click(Sender: TObject);
    procedure cbPreFixClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
//    procedure btnGet3Click(Sender: TObject);
    procedure btnGet4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnGetAllClick(Sender: TObject);
    procedure edPreFixChange(Sender: TObject);
    procedure btStopClick(Sender: TObject);
  private
    { Private declarations }
    m_prefix_user : string;
    m_stop_get : boolean;
    procedure genBusiness();
    procedure genProcess();
//    procedure genPrefabSql();
    procedure genService();
  public
    { Public declarations }
  end;

//var
//  FormBsspExporter: TFormBsspExporter;
//-------------- 子窗口创建者定义开始 ---------------//
IFormCreator_BSSPExporter = class(TInterfacedObject, IFormCreator)
    function CreateForm():TForm;
end;
//------------ 子窗口创建者定义结束 -----------//

implementation

uses UnitPublic;

{$R *.dfm}
//-------------- 子窗口创建者实现开始 ---------------------//
function IFormCreator_BSSPExporter.CreateForm():TForm;
begin
    Result := TFormBsspExporter.Create(nil);
end;
//-------------- 子窗口创建者实现结束 ---------------------//


///////////////////////
procedure TFormBsspExporter.btnDbConnClick(Sender: TObject);
begin
    //connect to DataBase
    //AdoConnection1.ConnectionString := 'Provider=OraOLEDB.Oracle.1;Persist Security Info=True;Data Source='+cbDbTns.Text;
//AdoConnection1.ConnectionString := 'Provider=MSDAORA.1;Password=bssp;User ID=bssp;Persist Security Info=True;Data Source='+cbDbTns.Text;
    //AdoConnection1.Open(edDbUser.Text, edDbPass.Text);
    adoconnection1.ConnectString := ledDbUser.text + '/' + ledDbPass.text + '@' +cbDbtns.Text;// 'bssp/bssp@10.1.0.220:1521:kf';
    adoconnection1.Open;
end;

procedure TFormBsspExporter.ADOConnection1_1AfterConnect(Sender: TObject);
begin
    btnDbDisconn.Enabled := true;
    btnDbConn.Enabled := false;
    cbDbTns.Enabled := false;
    ledDbUser.Enabled := false;
    ledDbPass.Enabled := false;
    

    btnGetAll.Enabled := true;
    btnGet1.Enabled := btnGetall.Enabled;
    btnGet2.Enabled := btnGetall.Enabled;
//    btnGet3.Enabled := btnGetall.Enabled;
    btnGet4.Enabled := btnGetall.Enabled;
end;

procedure TFormBsspExporter.ADOConnection1_1AfterDisconnect(Sender: TObject);
begin
    btnDbDisconn.Enabled := false;
    btnDbConn.Enabled := true;
    cbDbTns.Enabled := true;
    ledDbUser.Enabled := true;
    ledDbPass.Enabled := true;

    btnGetAll.Enabled := false;
    btnGet1.Enabled := btnGetall.Enabled;
    btnGet2.Enabled := btnGetall.Enabled;
//    btnGet3.Enabled := btnGetall.Enabled;
    btnGet4.Enabled := btnGetall.Enabled;
end;

procedure TFormBsspExporter.SpeedButton1Click(Sender: TObject);
var
  dir : string;
  iniFile : string;
  myinifile : TiniFile;
begin
    dir := edExportDir.Text;
    if( SelectDirectory(dir, [sdAllowCreate, sdPerformCreate, sdPrompt], 0 ))then
    begin
      edExportDir.Text := dir;
      //保存目录
      iniFile := copy(Application.ExeName,1,length(Application.ExeName)-4) +'.ini';
      myinifile:=Tinifile.create(iniFile);
      myIniFile.WriteString('BSSP_EXPORT','DIR',dir);
      myIniFile.Free;
    end;
end;

procedure TFormBsspExporter.btnGet1Click(Sender: TObject);
begin
    m_stop_get := false;
    btStop.Enabled := true;
    genBusiness();
end;

procedure TFormBsspExporter.genBusiness();
var
    Str : TStrings;
    str1,str2,str3: string;
    business_id,business_name : string;
    file_name : string;
begin
    cbPreFixClick(nil);

    statusbar1.Panels[0].Text := 'generate BUSINESS file(s)...';
    Application.ProcessMessages;

    Str := TStringList.Create;
    try
    mmBusiness.Lines.Text := trim(mmBusiness.Lines.Text);
    with adoQuery1 do
    begin
        adoQuery1.Close;
        SQL.Clear;
        SQL.Add('select business_id, show_name,group_id, TYPE,lifecycle, status, to_char(inure_date,''yyyymmdd'') inure_date, to_char(expire_date,''yyyymmdd'') expire_date,to_char(create_date,''yyyymmdd'') create_date, to_char(modify_date,''yyyymmdd'') modify_date, description ');
        SQL.Add(' from bssp_business ');
        //SQL.Add(' from bssp_business_prod ');    // 20100909 为导出临时表配置而修改的特别版本

        if(mmBusiness.Lines.Text)<>''then
        begin
            SQL.Add(' WHERE '+mmBusiness.Lines.Text);
        end;
        adoQuery1.Open;
        while not adoQuery1.Eof do
        begin
            if(m_stop_get) then break;
            //取业务定义
            business_id := FieldByName('business_id').AsString;
            business_name := FieldByName('show_name').AsString;

            statusbar1.Panels[1].text := business_id+' '+business_name;
            statusbar1.Panels[2].text := inttostr(adoquery1.RecNo)+'/'+inttostr(adoquery1.RecordCount);
            application.ProcessMessages;

            str1 :='------'+FieldByName('business_id').AsString+' '+FieldByName('show_name').AsString +'--------' + #13#10;
            str1 := str1+'------bssp_business-------'+#13#10
                +'delete from '+m_prefix_user +'bssp_business where business_id='+FieldByName('business_id').AsString +';'+ #13#10
                + 'insert into '+m_prefix_user+'bssp_business (business_id, show_name,group_id, TYPE,lifecycle, status, inure_date, expire_date,create_date, modify_date, description)' +#13#10
                + 'values(' +#13#10
                + FieldByName('business_id').AsString+',                       --business_id ' +#13#10
                + ''''+FieldByName('show_name').AsString+''',                  --show_name ' +#13#10
                + FieldByName('group_id').AsString+',                               --group_id ' +#13#10
                + FieldByName('type').AsString +',                                   --type 业务类型 1 交易业务 2 普通查询 3 数据字典查询 4 预制SQL 5 转发查询 6 文件业务 7 登录' +#13#10
                + ''''+FieldByName('lifecycle').AsString+''',                         --lifecycle 生命周期(CRONTAB格式)' +#13#10
                + FieldByName('status').AsString+',                                   --status 状态 1	正常 2	停用 3	注销' +#13#10
                + 'to_date('''+FieldByName('inure_date').AsString+''',''yyyymmdd''),      --inure_date ' +#13#10
                + 'to_date('''+FieldByName('expire_date').AsString+''',''yyyymmdd''),     --expire_date ' +#13#10
                + 'to_date('''+FieldByName('create_date').AsString+''',''yyyymmdd''),     --create_date ' +#13#10
                + 'SYSDATE,                                --modify_date' +#13#10
                + ''''+FieldByName('description').AsString+'''             --description'+#13#10
                + ');' +#13#10;
            str.Add(str1);
               
            //取业务-来源关系

            adoQuery2.Close;
            adoQuery2.SQL.Clear;
            adoQuery2.SQL.Add('select business_id, request_source, lifecycle, need_verify, status, nvl(need_fuzzy,0) need_fuzzy, to_char(inure_date,''yyyymmdd'') inure_date,'+' to_char(expire_date,''yyyymmdd'') expire_date,to_char(create_date,''yyyymmdd'') create_date,to_char(modify_date, ''yyyymmdd'') modify_date, DESCRIPTION ');
            adoQuery2.SQL.Add(' from bssp_business_request_relation ');
            //adoQuery2.SQL.Add(' from bssp_business_request_r_prod ');   // 20100909 为导出临时表配置而修改的特别版本


            adoQuery2.SQL.Add(' where business_id='+business_id+' order by request_source');
            adoQuery2.Open;
            str.Add('--------bssp_business_request_relation--------');
            while not adoQuery2.Eof do
            begin
            str2 := 'DELETE FROM '+m_prefix_user+'bssp_business_request_relation WHERE business_id='+business_id+' AND request_source='+adoQuery2.FieldByName('request_source').AsString+';' ;
    			  str2 := str2 + #13#10 +	 'INSERT INTO '+m_prefix_user+'bssp_business_request_relation( business_id, request_source, lifecycle, need_verify, status, need_fuzzy, inure_date, expire_date,  create_date,  modify_date, DESCRIPTION) '+#13#10
    				+ 'VALUES('+#13#10
    				+ adoQuery2.FieldByName('business_id').AsString+',                      --business_id'+#13#10
    				+ adoQuery2.FieldByName('request_source').AsString+',                             --request_source'+#13#10
    				+ ''''+adoQuery2.FieldByName('lifecycle').AsString+''',                        --lifecycle 生命周期(CRONTAB格式)'+#13#10
    				+ adoQuery2.FieldByName('need_verify').AsString+',                                  --need_verify 是否需要安全校验 0 不需要 1 需要'+#13#10
    				+ adoQuery2.FieldByName('status').AsString+',                                  --status 状态 1	正常 2	停用 3	注销'+#13#10
    				+ adoQuery2.FieldByName('need_fuzzy').AsString+',                               --need_fuzzy 模糊化 0 否 1 是'+#13#10
    				+ 'to_date('''+adoQuery2.FieldByName('inure_date').AsString+''',''yyyymmdd''),     --inure_date'+#13#10
    				+ 'to_date('''+adoQuery2.FieldByName('expire_date').AsString+''',''yyyymmdd''),     --expire_date'+#13#10
    				+ 'to_date('''+adoQuery2.FieldByName('create_date').AsString+''',''yyyymmdd''),     --create_date'+#13#10
    				+ 'SYSDATE,                               --modify_date'+#13#10
    				+ '''' + adoQuery2.FieldByName('description').AsString +'''                  --description'+#13#10
    				+ ');'+#13#10;

                str.Add(str2);
                adoQuery2.Next;
            end;
            adoQuery2.Close;

            //取业务-过程关系
            adoQuery2.Close;
            adoQuery2.SQL.Clear;
            adoQuery2.SQL.Add('select business_id, process_id, seq, status, to_char(create_date,''yyyymmdd'') create_date, to_char(modify_date,''yyyymmdd'') modify_date, DESCRIPTION ');
            adoQuery2.SQL.Add(' from bssp_business_process_relation ');
            //adoQuery2.SQL.Add(' from bssp_business_process_r_prod ');  // 20100909 为导出临时表配置而修改的特别版本

            adoQuery2.SQL.Add(' where business_id='+business_id+' order by seq');
            adoQuery2.Open;
            str.Add('--------bssp_business_process_relation--------');
            str.Add('DELETE FROM '+m_prefix_user+'bssp_business_process_relation WHERE business_id='+business_id+';');
            while not adoQuery2.Eof do
            begin
			// 'DELETE FROM '+m_prefix_user+'bssp_business_process_relation WHERE business_id='+business_id+' and process_id='+adoQuery2.FieldByName('process_id').AsString+';'+#13#10
			str3 :=	 'INSERT INTO '+m_prefix_user+'bssp_business_process_relation( business_id, process_id, seq, status, create_date, modify_date, DESCRIPTION)'+#13#10
				+ 'VALUES('+#13#10
				+ adoQuery2.FieldByName('business_id').AsString+',              --business_id'+#13#10
				+ adoQuery2.FieldByName('process_id').AsString +',               --process_id'+#13#10
				+ adoQuery2.FieldByName('seq').AsString+',                          --seq'+#13#10
				+ adoQuery2.FieldByName('status').AsString+',                          --status 状态 1	正常 3	注销'+#13#10
				+ 'to_date('''+adoQuery2.FieldByName('create_date').AsString+''',''yyyymmdd''),  --create_date'+#13#10
				+ 'SYSDATE,                       --modify_date'+#13#10
				+ ''''+adoQuery2.FieldByName('description').AsString+'''      --description'+#13#10
				+ ');'+#13#10;

                str.Add(str3);
                adoQuery2.Next;
            end;
            adoQuery2.Close;

            //取业务组关系
            //BSSP_Business_Group
            
            adoQuery1.Next;
            ForceDirectories(edExportDir.Text+'\business\');
            file_name := edExportDir.Text+'\business\bssp_business_'+business_id+'.sql';
            str.SaveToFile(file_name);
            str.Clear;
        end;
    end;
    statusbar1.Panels[0].Text := 'generate BUSINESS file(s)...Done';
    finally
        str.Free;
    end;
end;

procedure TFormBsspExporter.btnDbDisconnClick(Sender: TObject);
begin
  try
    AdoConnection1.Close;
  except
  end;
end;

procedure TFormBsspExporter.btnGet2Click(Sender: TObject);
begin
    btStop.Enabled := true;
    m_stop_get := false;
    genProcess();
end;

procedure TFormBsspExporter.genProcess();
var
    str,strTmpl : tstrings;
    str1: string;
    process_id,process_code : string;
    file_name : string;
    pr_template,tmpstr : string;
    i,max_tmpl : integer;
begin
    max_tmpl := 32000;

    cbPreFixClick(nil);

    statusbar1.Panels[0].Text := 'generate PROCESS file(s)...';
    Application.ProcessMessages;

    Str := TStringList.Create;
    strTmpl := TStringList.create;
    try
    mmProcess.Lines.Text := trim(mmProcess.Lines.Text);
    with adoQuery1 do
    begin
        adoQuery1.close;
        SQL.Clear;
        SQL.Add('select process_id,process_code,show_name,group_id,TYPE,status,to_char(create_date,''yyyymmdd'') create_date,to_char(modify_date, ''yyyymmdd'') modify_date,DESCRIPTION');
        SQL.Add(' from bssp_process ');
        if(mmProcess.Lines.Text)<>''then
        begin
            adoQuery1.SQL.Add(' WHERE '+mmProcess.Lines.Text);
        end;
        adoQuery1.Open;
        while not adoQuery1.Eof do
        begin
            if(m_stop_get) then break;

            //取过程定义
            process_id := FieldByName('process_id').AsString;
            process_code := FieldByName('process_code').AsString;

            statusbar1.Panels[1].text := process_id+' '+process_code;
            statusbar1.Panels[2].text := inttostr(adoquery1.RecNo)+'/'+inttostr(adoquery1.RecordCount);
            application.ProcessMessages;

            str1 :=  '------'+process_id+' '+process_code+' '+FieldByName('show_name').AsString+'------' + #13#10;
            str1 := str1+'--------bssp_process--------'+#13#10
                + 'delete from '+m_prefix_user+'bssp_process where process_id='+process_id +' and process_code in ('''+FieldByName('process_code').AsString +''','''+process_id+''');'+ #13#10
                + 'insert into '+m_prefix_user+'bssp_process (process_id,process_code,show_name,group_id,TYPE,status,create_date,modify_date,DESCRIPTION)'+#13#10
                + 'values('+#13#10
			    + FieldByName('process_id').AsString+',        --process_id'+#13#10
    			+ ''''+FieldByName('process_code').AsString+''',        --process_code'+#13#10
	    		+ ''''+FieldByName('show_name').AsString+''',       --show_name'+#13#10
		    	+ FieldByName('group_id').AsString+',        --group_id'+#13#10
			    + FieldByName('type').AsString+',       --type,1正常,2转发(预制SQL使用)'+#13#10
    			+ FieldByName('status').AsString+',       --status 状态 1正常 2停用 3注销'+#13#10
	    		+ 'to_date('''+FieldByName('create_date').AsString+''',''yyyymmdd''),   --create_date'+#13#10
		    	+ 'SYSDATE,        --modify_date'+#13#10
			    + ''''+FieldByName('description').AsString+'''     --description'+#13#10
                + ');'+#13#10;
            str.Add(str1);

            //取过程-服务关系
            adoQuery2.Close;
            adoQuery2.SQL.Clear;
            adoQuery2.SQL.Add('select process_id, service_id, status, DESCRIPTION ');
            adoQuery2.SQL.Add(' from bssp_process_service_relation ');
            adoQuery2.SQL.Add(' where process_id='+process_id);
            adoQuery2.Open;
            str.Add('--------bssp_process_service_relation--------'+#13#10);
            str.Add('DELETE FROM '+m_prefix_user+'bssp_process_service_relation WHERE process_id='+process_id+';');
            while not adoQuery2.Eof do
            begin
			str1 :=  'INSERT INTO '+m_prefix_user+'bssp_process_service_relation( process_id, service_id, status, DESCRIPTION)'+#13#10
				+ 'VALUES('+#13#10
				+ adoQuery2.FieldByName('process_id').AsString +',               --process_id'+#13#10
				+ adoQuery2.FieldByName('service_id').AsString+',                --service_id'+#13#10
				+ adoQuery2.FieldByName('status').AsString+',                    --status 状态 1	正常 3	注销'+#13#10
				+ ''''+adoQuery2.FieldByName('description').AsString+'''      --description'+#13#10
				+ ');'+#13#10;

                str.Add(str1);
                adoQuery2.Next;
            end;
            adoQuery2.Close;

            //取过程参数
            adoQuery2.close;
            adoQuery2.sql.clear;
            adoQuery2.sql.add('select process_param_id,process_id,param_name,parent_name,parent_param_id,inout_flag,option_flag,description,dict_type,CLASS ');
            adoQuery2.sql.add(' from bssp_process_param');
            adoQuery2.sql.add(' where process_id='+process_id+' order by process_param_id');
            adoQuery2.Open;
            str.Add('--------bssp_process_param--------');
            str1 := 'DELETE FROM '+m_prefix_user+'bssp_process_param where process_id='+process_id+';'+#13#10;
            while not adoQuery2.Eof do
            begin
				str1 := str1+'INSERT INTO '+m_prefix_user+'bssp_process_param(process_param_id,process_id,param_name,parent_name,parent_param_id,inout_flag,option_flag,description,dict_type,CLASS)'+#13#10
					+'VALUES('+#13#10
					+adoQuery2.FieldByName('process_param_id').AsString+',         --process_param_id'+#13#10
					+adoQuery2.FieldByName('process_id').AsString+',         --process_id'+#13#10
					+''''+adoQuery2.FieldByName('param_name').AsString+''',          --param_name'+#13#10
					+''''+adoQuery2.FieldByName('parent_name').AsString+''',            --parent_name'+#13#10
					+adoQuery2.FieldByName('parent_param_id').AsString+',            --parent_param_id 父节点标识 0 为顶级'+#13#10
					+adoQuery2.FieldByName('inout_flag').AsString+',            --inout_flag 输入输出标志 0 输出 1 输入 2 输入输出'+#13#10
					+adoQuery2.FieldByName('option_flag').AsString+',            --option_flag 可选标志 1--0...1; 2--1; 3--0...n; 4--1...n'+#13#10
					+''''+adoQuery2.FieldByName('description').AsString+''',         --DESCRIPTION'+#13#10
					+''''+adoQuery2.FieldByName('dict_type').AsString+''',         --dict_type'+#13#10
					+''''+adoQuery2.FieldByName('class').AsString+'''         --CLASS'+#13#10
					+');'+#13#10;
                adoQuery2.next;
            end;
            str.Add(str1);
            adoQuery2.close;

            //取过程模板
            adoQuery2.Close;
            adoQuery2.SQL.Clear;
            adoQuery2.SQL.Add('select process_id ,tx_type,sync_mode,open_trace,invoke_mode,link_url,pr_template ');
            adoQuery2.SQL.Add(' from bssp_process_template ');
            adoQuery2.SQL.Add(' where process_id='+process_id);
            adoQuery2.Open;
            str.Add('--------bssp_process_template--------');
            if not adoQuery2.Eof then
            begin
    			str1 := 'DECLARE'+#13#10
	    			+'  LOB 	CLOB;'+#13#10
		    		+'  LOBVARCHAR	VARCHAR2('+inttostr(max_tmpl+100)+');'+#13#10
			    	+'  LOBLENGTH	BINARY_INTEGER;'+#13#10
				    +'  POS 		BINARY_INTEGER;'+#13#10
    				+'  QUERY_STRING 	VARCHAR2(1000);'+#13#10
	    			+'BEGIN'+#13#10;
				str1 := str1+'DELETE FROM '+m_prefix_user+'bssp_process_template WHERE process_id='+process_id+';'+#13#10
					+'INSERT INTO '+m_prefix_user+'bssp_process_template( process_id, tx_type, pr_template, sync_mode, link_url,open_trace, invoke_mode)'+#13#10
					+'VALUES('+#13#10
					+adoQuery2.FieldByName('process_id').AsString+',     --process_id '+#13#10
					+adoQuery2.FieldByName('tx_type').AsString+',     --tx_type 事务类型 1 TE 2 TUXEDO 3 DB'+#13#10
					+'empty_clob(),      --pr_template SFDL定义的过程规则模板'+#13#10
					+adoQuery2.FieldByName('sync_mode').AsString+',     --sync_mode 同步模式 1 同步 2 异步(单步等) 3 异步(全部等)'+#13#10
					+''''+adoQuery2.FieldByName('link_url').AsString+''',      --link_url 链接URL地址(转发过程用)'+#13#10
					+adoQuery2.FieldByName('open_trace').AsString+',     --open_trace 是否打开流水 0 不打开 1 打开'+#13#10
					+''''+adoQuery2.FieldByName('invoke_mode').AsString+'''     --invoke_mode 调用模式(转发用) 1 Tuxedo 2 TE 3 HTTP 4 FCGI 5 DLL'+#13#10
					+');'+#13#10+#13#10
					+'QUERY_STRING :=''select pr_template from '+m_prefix_user+'bssp_process_template where process_id='+process_id+' for update''; '+#13#10;

                //分割大于lobvarchar上限的脚本
                i := 1;
                pr_template := AnsiReplaceText(trim(adoQuery2.FieldByName('pr_template').AsString),#10,#13#10)+' ';
                while true do
                begin
                  tmpstr := my_copy(pr_template,i,max_tmpl);
                  if(length(tmpstr)<=0)then break;
                  if( i<=1 )then
				    str1 := str1 +'POS := 1;'+#13#10
                  else
                    str1 := str1 +'POS := POS+LOBLENGTH;'+#13#10 ;
                  str1 := str1
					+'LOBVARCHAR :='''+AnsiReplaceText(AnsiReplaceText(tmpstr,'''',''''''),'&','&''||''')+''';'+#13#10
					+'LOBLENGTH := LENGTH( LOBVARCHAR );'+#13#10
					+'EXECUTE IMMEDIATE QUERY_STRING INTO LOB ;'+#13#10
					+'DBMS_LOB.WRITE(LOB, LOBLENGTH, POS, LOBVARCHAR );'+#13#10#13#10;

                  i := i+length(tmpstr);
                end;
                //分割完毕
    			str1 := str1 +'END;'+#13#10+'/'+#13#10;
            //替换为生产环境地址
            //str1 := StringReplace(str1, '10.1.1.106', '10.46.34.232',[rfReplaceAll]);
            //str1 := StringReplace(str1, '10.46.6.183', '10.46.34.232',[rfReplaceAll]);

            if(cb_procTmpl.Checked)then
            begin
                strTmpl.add(str1);
            end
            else
                str.Add(str1);
            end;
            adoQuery2.Close;

            //保存到文件
            ForceDirectories(edExportDir.Text+'\process\');
            file_name := edExportDir.Text+'\process\bssp_process_'+process_code+'.sql';

            str.SaveToFile(file_name);
            str.Clear;

            if(cb_procTmpl.Checked)then
            begin
                //保存过程模版脚本到单独文件
                file_name := edExportDir.Text+'\process\bssp_process_'+process_code+'_clob.sql';
                strTmpl.SaveToFile(file_name);
                strTmpl.Clear;
            end;

            //下一个过程
            adoQuery1.Next;

        end;
        statusbar1.Panels[0].Text := 'generate PROCESS file(s)...Done';
    end;
    finally
        str.Free;
        strTmpl.Free;
    end;
end;

procedure TFormBsspExporter.cbPreFixClick(Sender: TObject);
begin
    edPreFix.Enabled := cbPreFix.Checked;
    if( edPreFix.Enabled) and ( trim(edPreFix.Text)<>'') then
    begin
        m_prefix_user := edPreFix.Text+'.';
    end
    else
        m_prefix_user := '';
end;



procedure TFormBsspExporter.FormClose(Sender: TObject; var Action: TCloseAction);
VAR
  iniFile,sql : string;
  myinifile : TiniFile;
begin
  try
    if adoConnection1.Connected then adoConnection1.Close;
  except
  end;
      //保存查询条件
      iniFile := copy(Application.ExeName,1,length(Application.ExeName)-4) +'.ini';
      myinifile:=Tinifile.create(iniFile);
      sql := mmBusiness.Text;
      myIniFile.WriteString('BSSP_EXPORT','BUSINESS_SQL',sql);
      sql := mmProcess.Text;
      myIniFile.WriteString('BSSP_EXPORT','PROCESS_SQL',sql);
      sql := mmService.Text;
      myIniFile.WriteString('BSSP_EXPORT','SERVICE_SQL',sql);
      myIniFile.Free;


    action := caFree;
end;
{
procedure TFormBsspExporter.btnGet3Click(Sender: TObject);
begin
    btStop.Enabled := true;
    m_stop_get := false;
    genPrefabSql();

end;
}
{
procedure TFormBsspExporter.genPrefabSql();
//var
//    str : tstrings;
//    str1: string;
//    sql_id,sql_name : string;
//    file_name : string;
begin

    cbPreFixClick(nil);

    statusbar1.Panels[0].Text := 'generate PREFAB SQL file(s)...';
    Application.ProcessMessages;

    Str := TStringList.Create;
    try
    mmPrefabSql.Lines.Text := trim(mmPrefabSql.Lines.Text);
    with adoQuery1 do
    begin
        adoQuery1.close;
        SQL.Clear;
        SQL.Add('select SQL_ID, SQL_NAME, GROUP_ID, SUBSYSTEM_ID, SQL_TYPE, OUT_TEMPLATE, to_char(CREATE_DATE,''yyyymmdd'') create_date, to_char(modify_date,''yyyymmdd'') MODIFY_DATE, DESCRIPTION ');
        SQL.Add(' from bssp_prefab_sql ');
        if(mmPrefabSql.Lines.Text)<>''then
        begin
            SQL.Add(' WHERE '+mmPrefabSql.Lines.Text);
        end;
        adoQuery1.Open;
        while not adoQuery1.Eof do
        begin
            if(m_stop_get) then break;
            //prefab_sql
            sql_id := FieldByName('sql_id').AsString;
            sql_name := FieldByName('sql_name').AsString;

            statusbar1.panels[1].Text := sql_id+' '+sql_name;
            statusbar1.Panels[2].text := inttostr(adoquery1.RecNo)+'/'+inttostr(adoquery1.RecordCount);
            application.ProcessMessages;

            str1 :=  '------'+sql_id+' '+sql_name+'------' + #13#10
			    + 'DELETE FROM '+m_prefix_user+'bssp_prefab_sql WHERE sql_id='+sql_id+';'+#13#10
				+'INSERT INTO '+m_prefix_user+'bssp_prefab_sql( SQL_ID, SQL_NAME, GROUP_ID, SUBSYSTEM_ID, SQL_TYPE, OUT_TEMPLATE, CREATE_DATE, MODIFY_DATE, DESCRIPTION ) '+#13#10
				+'VALUES ('+#13#10
				+adoQuery1.FieldByName('sql_id').AsString+',      --SQL_ID 唯一确定预制SQL的标识(对应服务请求报文中的order_type)'+#13#10
				+''''+adoQuery1.FieldByName('SQL_NAME').AsString+''',     --SQL_NAME 标识语句作用的名称(对应业务请求报文中的process_code)'+#13#10
				+adoQuery1.FieldByName('GROUP_ID').AsString+',      --GROUP_ID 标识SQL归属管理组'+#13#10
				+adoQuery1.FieldByName('SUBSYSTEM_ID').AsString+',    --SUBSYSTEM_ID 子系统标识，1－营业，2－帐务，3－计费	'+#13#10
				+adoQuery1.FieldByName('SQL_TYPE').AsString+',   --SQL_TYPE	SQL语句类型，1－select，2－update，3－delete，4－insert'+#13#10
				+''''+adoQuery1.FieldByName('OUT_TEMPLATE').AsString+''','+#13#10
				+'                 --OUT_TEMPLATE	输出模板 :1.1,:1.2;<credit_level_info>:2.1,:2.2</credit_level_info>'+#13#10
				+'to_date('''+adoQuery1.FieldByName('CREATE_DATE').AsString+''',''yyyymmdd''),                 --CREATE_DATE  创建时间'+#13#10
				+'sysdate,                 --MODIFY_DATE	修改时间'+#13#10
				+''''+adoQuery1.FieldByName('DESCRIPTION').AsString+'''       --DESCRIPTION	描述'+#13#10
				+');'+#13#10;
            str.Add(str1);

            //prefab_sql_statement
            adoQuery2.Close;
            adoQuery2.SQL.Clear;
            adoQuery2.SQL.Add('select SQL_ID, STATEMENT_SEQ, SQL_STATEMENT, TIMEOUT, MAX_ROWS, MAX_FILE_ROWS ');
            adoQuery2.SQL.Add(' from bssp_prefab_sql_statement ');
            adoQuery2.SQL.Add(' where sql_id='+sql_id);
            adoQuery2.SQL.add(' order by statement_seq asc ');
            adoQuery2.Open;
            while not adoQuery2.Eof do
            begin
				str1 := 'DELETE FROM '+m_prefix_user+'bssp_prefab_sql_statement WHERE sql_id= '+sql_id+' and STATEMENT_SEQ='+adoQuery2.FieldByName('STATEMENT_SEQ').AsString+';'+#13#10
					+'INSERT INTO '+m_prefix_user+'bssp_prefab_sql_statement( SQL_ID, STATEMENT_SEQ, SQL_STATEMENT, TIMEOUT, MAX_ROWS, MAX_FILE_ROWS)'+#13#10
					+'VALUES('+#13#10
					+adoQuery2.FieldByName('SQL_ID').AsString+',      --SQL_ID'+#13#10
					+adoQuery2.FieldByName('STATEMENT_SEQ').AsString+',             --STATEMENT_SEQ	语句序号，一个sql_id可以对应多条SQL语句。'+#13#10
					+''''+trim(AnsiReplaceText(adoQuery2.FieldByName('SQL_STATEMENT').AsString,'''',''''''))+' '','+#13#10
					+'                 --SQL_STATEMENT'+#13#10
					+''''+adoQuery2.FieldByName('TIMEOUT').AsString+''', -- TIMEOUT'+#13#10
					+''''+adoQuery2.FieldByName('MAX_ROWS').AsString+''', -- MAX_ROWS'+#13#10
					+''''+adoQuery2.FieldByName('MAX_ROWS').AsString+''' -- MAX_ROWS'+#13#10
					+');'+#13#10;
                str.Add(str1);
                adoQuery2.Next;
            end;
            adoQuery2.Close;

            //prefab_sql_in_param
            adoQuery2.Close;
            adoQuery2.SQL.Clear;
            adoQuery2.SQL.Add('select SQL_ID, SEQ, PARAM_NAME, DATA_TYPE, DATA_LENGTH, COLUMN_NAME, CAN_EMPTY, to_char(create_date, ''yyyymmdd'') CREATE_DATE, to_char(modify_date, ''yyyymmdd'') MODIFY_DATE, DESCRIPTION');
            adoQuery2.SQL.Add(' from bssp_prefab_sql_in_param ');
            adoQuery2.SQL.Add(' where sql_id='+sql_id);
            adoQuery2.SQL.Add(' order by seq asc ');
            adoQuery2.Open;
            while not adoQuery2.Eof do
            begin
				str1 := 'DELETE FROM '+m_prefix_user+'bssp_prefab_sql_in_param WHERE sql_id='+sql_id+' and seq='+adoQuery2.FieldByName('SEQ').AsString+';'+#13#10
					+'INSERT INTO '+m_prefix_user+'bssp_prefab_sql_in_param(SQL_ID, SEQ, PARAM_NAME, DATA_TYPE, DATA_LENGTH, COLUMN_NAME, CAN_EMPTY, CREATE_DATE, MODIFY_DATE, DESCRIPTION )'+#13#10
					+'VALUES('+#13#10
					+adoQuery2.FieldByName('SQL_ID').AsString+',              --SQL_ID'+#13#10
					+adoQuery2.FieldByName('SEQ').AsString+',              --SEQ 输入参数序号'+#13#10
					+''''+adoQuery2.FieldByName('PARAM_NAME').AsString+''',  --PARAM_NAME	输入参数名，根据这个字段来解析请求报文中的输入参数'+#13#10
					+adoQuery2.FieldByName('DATA_TYPE').AsString+',               --DATA_TYPE	参数类型（1－number，2－long，3－varchar2，9－in条件，10－like条件）'+#13#10
					+adoQuery2.FieldByName('DATA_LENGTH').AsString+',               --DATA_LENGTH	输入参数长度'+#13#10
					+''''+adoQuery2.FieldByName('COLUMN_NAME').AsString+''',      --COLUMN_NAME	字段名（当data_type＝9的时候使用，其他类型可以不配）'+#13#10
					+adoQuery2.FieldByName('CAN_EMPTY').AsString+',                --CAN_EMPTY	字段能否为空（0－否 1－是）'+#13#10
					+'to_date('''+adoQuery2.FieldByName('CREATE_DATE').AsString+''',''yyyymmdd''),                --CREATE_DATE'+#13#10
					+'SYSDATE,                   --MODIFY_DATE'+#13#10
					+''''+adoQuery2.FieldByName('DESCRIPTION').AsString+'''             --DESCRIPTION	 描述'+#13#10
					+');'+#13#10;

                str.Add(str1);
                adoQuery2.Next;
            end;
            adoQuery2.Close;

            //prefab_sql_out_param
            adoQuery2.close;
            adoQuery2.sql.clear;
            adoQuery2.sql.add('select sql_id, statement_seq,param_seq,param_name, data_type, data_length, can_empty, to_char(create_date,''yyyymmdd'') create_date, to_char(modify_date,''yyyymmdd'') modify_date, DESCRIPTION,  dict_type,  CLASS, need_replace');
            adoQuery2.sql.add(' from bssp_prefab_sql_out_param');
            adoQuery2.sql.add(' where sql_id='+sql_id);
            adoQuery2.sql.Add(' order by statement_seq asc, param_seq asc ');
            adoQuery2.Open;
            str1 := 'DELETE FROM '+m_prefix_user+'bssp_prefab_sql_out_param WHERE sql_id='+sql_id+' and statement_seq='+adoQuery2.FieldByName('statement_seq').AsString+';'+#13#10;
            while not adoQuery2.Eof do
            begin
				str1 := str1 +'INSERT INTO '+m_prefix_user+'bssp_prefab_sql_out_param(sql_id, statement_seq,param_seq,param_name, data_type, data_length, can_empty, create_date, modify_date, DESCRIPTION, dict_type, CLASS, need_replace)'+#13#10
					+'VALUES('+#13#10
					+adoQuery2.FieldByName('sql_id').AsString+',          --sql_id'+#13#10
					+adoQuery2.FieldByName('statement_seq').AsString+',                 --statement_seq 语句序号'+#13#10
					+adoQuery2.FieldByName('param_seq').AsString+',                 --param_seq 输出参数序号'+#13#10
					+''''+adoQuery2.FieldByName('param_name').AsString+''',         --param_name 为输出参数（应答报文中的节点名）'+#13#10
					+adoQuery2.FieldByName('data_type').AsString+',                 --data_type 参数类型（1－number，2－long，3－varchar2）'+#13#10
					+adoQuery2.FieldByName('data_length').AsString+',                --data_length 参数长度'+#13#10
					+adoQuery2.FieldByName('can_empty').AsString+',                 --can_empty 字段能否为空（0－否 1－是）'+#13#10
					+'to_date('''+adoQuery2.FieldByName('create_date').AsString+''',''yyyymmdd''),           --create_date'+#13#10
					+'sysdate,              --modify_date'+#13#10
					+''''+adoQuery2.FieldByName('description').AsString+''',      --description'+#13#10
					+''''+adoQuery2.FieldByName('dict_type').AsString+''',              --dict_type'+#13#10
					+''''+adoQuery2.FieldByName('class').AsString+''',               --class  dict_type和class分别为字典类型和字典类别，这两项用于翻译对应的输出参数，'+#13#10
					+'                              --如有配置，将在同级节点下增加param_name＋"_name"的节点，内存该输出参数的翻译值。'+#13#10
					+''''+adoQuery2.FieldByName('need_replace').AsString+'''              --need_replace 是否需要对该字段的内容进行转义,0或NULL：不进行转义 1：进行转义，'+#13#10
					+'                          --如果字段配置需要转义,并且字段类型是varchar2，则在生成返回报文时用CDATA将内容包起来'+#13#10
					+');'+#13#10;

                str.Add(str1);
                adoQuery2.next;
            end;
            adoQuery2.close;

            //bssp_service


            //保存到文件
            ForceDirectories(edExportDir.Text+'\PrefabSql\');
            file_name := edExportDir.Text+'\PrefabSql\'+sql_id+'_'+sql_name+'.sql';
            str.SaveToFile(file_name);
            str.Clear;

            //下一个过程
            adoQuery1.Next;

        end;
        statusbar1.Panels[0].Text := 'generate PREFAB SQL file(s)...Done';
    end;
    finally
        str.Free;

    end;

end;
}
procedure TFormBsspExporter.btnGet4Click(Sender: TObject);
begin
    btStop.Enabled := true;
    m_stop_get := false;
    genService();

end;

procedure TFormBsspExporter.genService();
var
    str : tstrings;
    str1: string;
    service_id,service_name : string;
    file_name : string;
    sql_id,sql_name : string;
    smt_seq:integer;
begin
    cbPreFixClick(nil);

    statusbar1.Panels[0].Text := 'generate SERVICE file(s)...';
    Application.ProcessMessages;

    Str := TStringList.Create;
    try
    mmService.Lines.Text := trim(mmService.Lines.Text);
    with adoQuery1 do
    begin
        adoQuery1.close;
        SQL.Clear;
        SQL.Add('select service_id, service_name, show_name, invoke_mode, data_format, group_id, call_name, TIMEOUT, status,to_char(create_date,''yyyymmdd'') create_date, bak_call_name, to_char(modify_date,''yyyymmdd'') modify_date, DESCRIPTION, system_id ');
        SQL.Add(' from bssp_service ');
        if(trim(mmService.Lines.Text))<>''then
        begin
            SQL.Add(' WHERE '+mmService.Lines.Text);
        end;
        adoQuery1.Open;
        while not adoQuery1.Eof do
        begin
            if(m_stop_get) then break;

            //bssp_service
            service_id := FieldByName('service_id').AsString;
            service_name := FieldByName('service_name').AsString;

            statusbar1.Panels[1].text := service_id +' '+service_name;
            statusbar1.Panels[2].text := inttostr(adoquery1.RecNo)+'/'+inttostr(adoquery1.RecordCount);
            application.ProcessMessages;

            str1 :=  '------'+service_id+' '+service_name+'------' + #13#10    ;
            str1 := str1+'--------bssp_service--------'+#13#10
			    +'DELETE FROM '+m_prefix_user+'bssp_service WHERE service_id='+service_id+' and service_name in (''' +service_id+''','''+ adoQuery1.FieldByName('service_name').AsString +''');'+#13#10
				+'INSERT INTO '+m_prefix_user+'bssp_service(service_id, service_name, show_name, invoke_mode, data_format, group_id, call_name, TIMEOUT, status, create_date, bak_call_name, modify_date, DESCRIPTION, system_id)'+#13#10
				+'VALUES('+#13#10
				+adoQuery1.FieldByName('service_id').AsString+',          --service_id'+#13#10
				+''''+adoQuery1.FieldByName('service_name').AsString+''',        --service_name'+#13#10
				+''''+adoQuery1.FieldByName('show_name').AsString+''',        --show_name'+#13#10
				+adoQuery1.FieldByName('invoke_mode').AsString+',         --invoke_mode 调用模式 (1 Tuxedo 2 TE 3 HTTP 4 FCGI 5 DLL)'+#13#10
				+adoQuery1.FieldByName('data_format').AsString+',            --data_format 数据格式 (1 服务类XML 2 配置查询类XML 3 FML)'+#13#10
				+adoQuery1.FieldByName('group_id').AsString+',                    --group_id'+#13#10
				+''''+adoQuery1.FieldByName('call_name').AsString+''',            --call_name'+#13#10
				+''''+adoQuery1.FieldByName('timeout').AsString+''',               --timeout'+#13#10
				+adoQuery1.FieldByName('status').AsString+',            --status 状态 (1 正常 3 注销)'+#13#10
				+'to_date('''+adoQuery1.FieldByName('create_date').AsString+''',''yyyymmdd''),    --create_date'+#13#10
				+''''+adoQuery1.FieldByName('bak_call_name').AsString+''',          --bak_call_name'+#13#10
				+'sysdate,                  --modify_date'+#13#10
				+''''+adoQuery1.FieldByName('description').AsString+''','+#13#10
				+'                  --description'+#13#10
				+adoQuery1.FieldByName('system_id').AsString+' --system_id 子系统代码'+#13#10
				+');'+#13#10;
            //替换为生产环境地址
            //str1 := StringReplace(str1, '10.1.1.106', '10.46.34.232',[rfReplaceAll]);
            //str1 := StringReplace(str1, '10.46.6.183', '10.46.34.232',[rfReplaceAll]);

            str.Add(str1);

            //取bssp_service_param  服务参数配置

            adoQuery3.Close;
            adoQuery3.SQL.Clear;
            adoQuery3.SQL.Add('select SERVICE_PARAM_ID,SERVICE_ID,PARAM_NAME,PARENT_NAME,PARENT_PARAM_ID,GROUP_FLAG,INOUT_FLAG,OPTION_FLAG,DESCRIPTION ');
            adoQuery3.SQL.Add(' from bssp_service_param WHERE service_id='+adoQuery1.FieldByName('service_id').AsString);

            adoQuery3.Open;
            str1 :=  '--------bssp_service_param----------' + #13#10
		    	    +'DELETE FROM '+m_prefix_user+'bssp_service_param WHERE service_id='+service_id+';'+#13#10;
            while not adoQuery3.Eof do
            begin
                if(m_stop_get) then break;
                str1 := str1+'INSERT INTO '+m_prefix_user+'bssp_service_param(SERVICE_PARAM_ID,SERVICE_ID,PARAM_NAME,PARENT_NAME,PARENT_PARAM_ID,GROUP_FLAG,INOUT_FLAG,OPTION_FLAG,DESCRIPTION)'+#13#10
				    +'VALUES('+#13#10
                    +adoQuery3.fieldByName('service_param_id').AsString+#13#10
                    +adoQuery3.fieldByName('SERVICE_ID').AsString+#13#10
                    +''''+adoQuery3.fieldByName('PARAM_NAME').AsString+''''+#13#10
                    +''''+adoQuery3.fieldByName('PARENT_NAME').AsString+''''+#13#10
                    +adoQuery3.fieldByName('PARENT_PARAM_ID').AsString+#13#10
                    +adoQuery3.fieldByName('GROUP_FLAG').AsString+#13#10
                    +adoQuery3.fieldByName('INOUT_FLAG').AsString+#13#10
                    +adoQuery3.fieldByName('OPTION_FLAG').AsString+#13#10
                    +''''+adoQuery3.fieldByName('DESCRIPTION').AsString+''''+#13#10
                    +');'+#13#10;
                adoQuery3.Next;
            end;
            str.Add(str1);


            //bssp_batch.bssp_service
            {
            adoQuery3.Close;
            adoQuery3.SQL.Clear;
            adoQuery3.SQL.Add('select service_id, service_name, show_name, invoke_mode, data_format, group_id, call_name, TIMEOUT, status,to_char(create_date,''yyyymmdd'') create_date, bak_call_name, to_char(modify_date,''yyyymmdd'') modify_date, DESCRIPTION, system_id ');
            adoQuery3.SQL.Add(' from bssp_batch.bssp_service WHERE service_id='+adoQuery1.FieldByName('service_id').AsString);

            adoQuery3.Open;
            str1 :=  '--------bssp_batch.bssp_service--------' + #13#10
			    +'DELETE FROM bssp_batch.bssp_service WHERE service_id='+service_id+';'+#13#10
				+'INSERT INTO bssp_batch.bssp_service(service_id, service_name, show_name, invoke_mode, data_format, group_id, call_name, TIMEOUT, status, create_date, bak_call_name, modify_date, DESCRIPTION, system_id)'+#13#10
				+'VALUES('+#13#10
				+adoQuery3.FieldByName('service_id').AsString+',          --service_id'+#13#10
				+''''+adoQuery3.FieldByName('service_name').AsString+''',        --service_name'+#13#10
				+''''+adoQuery3.FieldByName('show_name').AsString+''',        --show_name'+#13#10
				+adoQuery3.FieldByName('invoke_mode').AsString+',         --invoke_mode 调用模式 (1 Tuxedo 2 TE 3 HTTP 4 FCGI 5 DLL)'+#13#10
				+adoQuery3.FieldByName('data_format').AsString+',            --data_format 数据格式 (1 服务类XML 2 配置查询类XML 3 FML)'+#13#10
				+adoQuery3.FieldByName('group_id').AsString+',                    --group_id'+#13#10
				+''''+adoQuery3.FieldByName('call_name').AsString+''',            --call_name'+#13#10
				+''''+adoQuery3.FieldByName('timeout').AsString+''',               --timeout'+#13#10
				+adoQuery3.FieldByName('status').AsString+',            --status 状态 (1 正常 3 注销)'+#13#10
				+'to_date('''+adoQuery3.FieldByName('create_date').AsString+''',''yyyymmdd''),    --create_date'+#13#10
				+''''+adoQuery3.FieldByName('bak_call_name').AsString+''',          --bak_call_name'+#13#10
				+'sysdate,                  --modify_date'+#13#10
				+''''+adoQuery3.FieldByName('description').AsString+''','+#13#10
				+'                  --description'+#13#10
				+adoQuery3.FieldByName('system_id').AsString+' --system_id 子系统代码'+#13#10
				+');'+#13#10;
            //替换为生产环境地址
            str1 := StringReplace(str1, '10.1.1.106', '10.46.34.232',[rfReplaceAll]);
            str1 := StringReplace(str1, '10.46.6.183', '10.46.34.232',[rfReplaceAll]);

            str.Add(str1);
            }
            //取bssp_service_param  服务参数配置
            {
            adoQuery3.Close;
            adoQuery3.SQL.Clear;
            adoQuery3.SQL.Add('select SERVICE_PARAM_ID,SERVICE_ID,PARAM_NAME,PARENT_NAME,PARENT_PARAM_ID,GROUP_FLAG,INOUT_FLAG,OPTION_FLAG,DESCRIPTION ');
            adoQuery3.SQL.Add(' from bssp_batch.bssp_service_param WHERE service_id='+adoQuery1.FieldByName('service_id').AsString);

            adoQuery3.Open;
            str1 :=  '------------------' + #13#10
		    	    +'DELETE FROM bssp_batch.bssp_service_param WHERE service_id='+service_id+';'+#13#10;
            while not adoQuery3.Eof do
            begin
                if(m_stop_get) then break;
                str1 := str1+'INSERT INTO bssp_batch.bssp_service_param(SERVICE_PARAM_ID,SERVICE_ID,PARAM_NAME,PARENT_NAME,PARENT_PARAM_ID,GROUP_FLAG,INOUT_FLAG,OPTION_FLAG,DESCRIPTION)'+#13#10
				    +'VALUES('+#13#10
                    +adoQuery3.fieldByName('service_param_id').AsString+#13#10
                    +adoQuery3.fieldByName('SERVICE_ID').AsString+#13#10
                    +''''+adoQuery3.fieldByName('PARAM_NAME').AsString+''''+#13#10
                    +''''+adoQuery3.fieldByName('PARENT_NAME').AsString+''''+#13#10
                    +adoQuery3.fieldByName('PARENT_PARAM_ID').AsString+#13#10
                    +adoQuery3.fieldByName('GROUP_FLAG').AsString+#13#10
                    +adoQuery3.fieldByName('INOUT_FLAG').AsString+#13#10
                    +adoQuery3.fieldByName('OPTION_FLAG').AsString+#13#10
                    +''''+adoQuery3.fieldByName('DESCRIPTION').AsString+''''+#13#10
                    +');'+#13#10;
                adoQuery3.Next;
            end;
            str.Add(str1);
            }
            //取对应的预置查询
        adoQuery3.Close;
        adoQuery3.SQL.Clear;
        adoQuery3.SQL.Add('select SQL_ID, SQL_NAME, GROUP_ID, SUBSYSTEM_ID, SQL_TYPE, OUT_TEMPLATE, to_char(CREATE_DATE,''yyyymmdd'') create_date, to_char(modify_date,''yyyymmdd'') MODIFY_DATE, DESCRIPTION, nvl(db_type,1) db_type ');
        adoQuery3.SQL.Add(' from bssp_prefab_sql WHERE sql_id='+adoQuery1.FieldByName('service_id').AsString);

        adoQuery3.Open;
        while not adoQuery3.Eof do
        begin
            if(m_stop_get) then break;
            //prefab_sql
            sql_id := adoQuery3.FieldByName('sql_id').AsString;
            sql_name := adoQuery3.FieldByName('sql_name').AsString;

            //statusbar1.panels[1].Text := sql_id+' '+sql_name;
            //statusbar1.Panels[2].text := inttostr(adoQuery3.RecNo)+'/'+inttostr(adoQuery3.RecordCount);
            //application.ProcessMessages;

            str1 :=  '------'+sql_id+' '+sql_name+'------' + #13#10 ;
            str1 := str1+'--------bssp_prefab_sql--------'+#13#10
			    + 'DELETE FROM '+m_prefix_user+'bssp_prefab_sql WHERE sql_id='+sql_id+' and sql_name='''+adoQuery3.FieldByName('SQL_NAME').AsString+''';'+#13#10
				+'INSERT INTO '+m_prefix_user+'bssp_prefab_sql( SQL_ID, SQL_NAME, GROUP_ID, SUBSYSTEM_ID, SQL_TYPE, OUT_TEMPLATE, CREATE_DATE, MODIFY_DATE, DESCRIPTION,DB_TYPE ) '+#13#10
				+'VALUES ('+#13#10
				+adoQuery3.FieldByName('sql_id').AsString+',      --SQL_ID'+#13#10
				+''''+adoQuery3.FieldByName('SQL_NAME').AsString+''',     --SQL_NAME'+#13#10
				+adoQuery3.FieldByName('GROUP_ID').AsString+',      --GROUP_ID'+#13#10
				+adoQuery3.FieldByName('SUBSYSTEM_ID').AsString+',    --SUBSYSTEM_ID 子系统标识，1－营业，2－帐务，3－计费	'+#13#10
				+adoQuery3.FieldByName('SQL_TYPE').AsString+',   --SQL_TYPE	SQL语句类型，1－select，2－update，3－delete，4－insert'+#13#10
				+''''+adoQuery3.FieldByName('OUT_TEMPLATE').AsString+''','+#13#10
				+'           --OUT_TEMPLATE	输出模板 :1.1,:1.2;<credit_level_info>:2.1,:2.2</credit_level_info>'+#13#10
				+'to_date('''+adoQuery3.FieldByName('CREATE_DATE').AsString+''',''yyyymmdd''),     --CREATE_DATE '+#13#10
				+'sysdate,                 --MODIFY_DATE'+#13#10
				+''''+adoQuery3.FieldByName('DESCRIPTION').AsString+''',   --DESCRIPTION	'+#13#10
				+''''+adoQuery3.FieldByName('DB_TYPE').AsString+'''  --DB_TYPE 数据库标识, 0 TT内存库, 1 Oracle库, 2 先TT后Oracle '+#13#10
				+');'+#13#10;
            str.Add(str1);

            //prefab_sql_statement
            adoQuery2.Close;
            adoQuery2.SQL.Clear;
            adoQuery2.SQL.Add('select SQL_ID, STATEMENT_SEQ, SQL_STATEMENT, TIMEOUT, MAX_ROWS, MAX_FILE_ROWS ');
            adoQuery2.SQL.Add(' from bssp_prefab_sql_statement ');
            adoQuery2.SQL.Add(' where sql_id='+sql_id);
            adoQuery2.SQL.add(' order by statement_seq asc ');
            adoQuery2.Open;
            str.Add('--------bssp_prefab_sql_statement--------');
            str1:='';
            while not adoQuery2.Eof do
            begin
    			str1 := str1 + 'DELETE FROM '+m_prefix_user+'bssp_prefab_sql_statement WHERE sql_id='+sql_id+' and STATEMENT_SEQ='+adoQuery2.FieldByName('STATEMENT_SEQ').AsString+';'+#13#10
                    +'INSERT INTO '+m_prefix_user+'bssp_prefab_sql_statement( SQL_ID, STATEMENT_SEQ, SQL_STATEMENT, TIMEOUT, MAX_ROWS, MAX_FILE_ROWS)'+#13#10
					+'VALUES('+#13#10
					+adoQuery2.FieldByName('SQL_ID').AsString+',      --SQL_ID'+#13#10
					+adoQuery2.FieldByName('STATEMENT_SEQ').AsString+',             --STATEMENT_SEQ'+#13#10
                    +''''+AnsiReplaceText(trim(AnsiReplaceText(adoQuery2.FieldByName('SQL_STATEMENT').AsString,'''','''''')),'&','&''||''') +' '','+#13#10
					//+''''+trim(AnsiReplaceText(adoQuery2.FieldByName('SQL_STATEMENT').AsString,'''',''''''))+' '','+#13#10
					+'                 --SQL_STATEMENT'+#13#10
					+''''+adoQuery2.FieldByName('TIMEOUT').AsString+''', -- TIMEOUT'+#13#10
					+''''+adoQuery2.FieldByName('MAX_ROWS').AsString+''', -- MAX_ROWS'+#13#10
					+''''+adoQuery2.FieldByName('MAX_FILE_ROWS').AsString+''' -- MAX_FILE_ROWS'+#13#10
					+');'+#13#10;
                adoQuery2.Next;
            end;
            str.Add(str1);
            adoQuery2.Close;

            //prefab_sql_in_param
            adoQuery2.Close;
            adoQuery2.SQL.Clear;
            adoQuery2.SQL.Add('select SQL_ID, SEQ, PARAM_NAME, DATA_TYPE, DATA_LENGTH, COLUMN_NAME, CAN_EMPTY, to_char(create_date, ''yyyymmdd'') CREATE_DATE, to_char(modify_date, ''yyyymmdd'') MODIFY_DATE, DESCRIPTION');
            adoQuery2.SQL.Add(' from bssp_prefab_sql_in_param ');
            adoQuery2.SQL.Add(' where sql_id='+sql_id);
            adoQuery2.SQL.Add(' order by seq asc ');
            adoQuery2.Open;
            str.Add('--------bssp_prefab_sql_in_param--------');
    		str1 := 'DELETE FROM '+m_prefix_user+'bssp_prefab_sql_in_param WHERE sql_id='+sql_id+';'+#13#10;
            while not adoQuery2.Eof do
            begin
				 str1:= str1+'INSERT INTO '+m_prefix_user+'bssp_prefab_sql_in_param(SQL_ID, SEQ, PARAM_NAME, DATA_TYPE, DATA_LENGTH, COLUMN_NAME, CAN_EMPTY, CREATE_DATE, MODIFY_DATE, DESCRIPTION )'+#13#10
					+'VALUES('+#13#10
					+adoQuery2.FieldByName('SQL_ID').AsString+',              --SQL_ID'+#13#10
					+adoQuery2.FieldByName('SEQ').AsString+',              --SEQ '+#13#10
					+''''+adoQuery2.FieldByName('PARAM_NAME').AsString+''',  --PARAM_NAME'+#13#10
					+adoQuery2.FieldByName('DATA_TYPE').AsString+',               --DATA_TYPE	参数类型（1－number，2－long，3－varchar2，9－in条件，10－like条件）'+#13#10
					+adoQuery2.FieldByName('DATA_LENGTH').AsString+',               --DATA_LENGTH'+#13#10
					+''''+adoQuery2.FieldByName('COLUMN_NAME').AsString+''',      --COLUMN_NAME	字段名（当data_type＝9的时候使用，其他类型可以不配）'+#13#10
					+adoQuery2.FieldByName('CAN_EMPTY').AsString+',                --CAN_EMPTY	字段能否为空（0－否 1－是）'+#13#10
					+'to_date('''+adoQuery2.FieldByName('CREATE_DATE').AsString+''',''yyyymmdd''),     --CREATE_DATE'+#13#10
					+'SYSDATE,                   --MODIFY_DATE'+#13#10
					+''''+adoQuery2.FieldByName('DESCRIPTION').AsString+'''             --DESCRIPTION'+#13#10
					+');'+#13#10;

                adoQuery2.Next;
            end;
            str.Add(str1);
            adoQuery2.Close;

            //prefab_sql_out_param
            adoQuery2.close;
            adoQuery2.sql.clear;
            adoQuery2.sql.add('select sql_id, statement_seq,param_seq,param_name, data_type, data_length, can_empty, to_char(create_date,''yyyymmdd'') create_date, to_char(modify_date,''yyyymmdd'') modify_date, DESCRIPTION,  dict_type,  CLASS, need_replace');
            adoQuery2.sql.add(' from bssp_prefab_sql_out_param');
            adoQuery2.sql.add(' where sql_id='+sql_id);
            adoQuery2.sql.Add(' order by statement_seq asc, param_seq asc ');
            adoQuery2.Open;
            str.Add('--------bssp_prefab_sql_out_param--------');
            //str1 := 'DELETE FROM '+m_prefix_user+'bssp_prefab_sql_out_param WHERE sql_id='+sql_id+' and statement_seq='+adoQuery2.FieldByName('statement_seq').AsString+';'+#13#10;
            smt_seq := -1;
            str1 := '';
            while not adoQuery2.Eof do
            begin
                if( smt_seq <> adoQuery2.FieldByName('statement_seq').AsInteger )then
                begin
                    str1 := str1+#13#10+'DELETE FROM '+m_prefix_user+'bssp_prefab_sql_out_param WHERE sql_id='+sql_id+' and statement_seq='+adoQuery2.FieldByName('statement_seq').AsString+';'+#13#10;
                    smt_seq := adoQuery2.FieldByName('statement_seq').AsInteger;
                end;
				str1 := str1+'INSERT INTO '+m_prefix_user+'bssp_prefab_sql_out_param(sql_id, statement_seq,param_seq,param_name, data_type, data_length, can_empty, create_date, modify_date, DESCRIPTION, dict_type, CLASS, need_replace)'+#13#10
					+'VALUES('+#13#10
					+adoQuery2.FieldByName('sql_id').AsString+',          --sql_id'+#13#10
					+adoQuery2.FieldByName('statement_seq').AsString+',                 --statement_seq 语句序号'+#13#10
					+adoQuery2.FieldByName('param_seq').AsString+',                 --param_seq'+#13#10
					+''''+adoQuery2.FieldByName('param_name').AsString+''',         --param_name'+#13#10
					+adoQuery2.FieldByName('data_type').AsString+',                 --data_type 参数类型（1－number，2－long，3－varchar2）'+#13#10
					+adoQuery2.FieldByName('data_length').AsString+',                --data_length'+#13#10
					+adoQuery2.FieldByName('can_empty').AsString+',                 --can_empty 能否为空（0－否 1－是）'+#13#10
					+'to_date('''+adoQuery2.FieldByName('create_date').AsString+''',''yyyymmdd''),           --create_date'+#13#10
					+'sysdate,              --modify_date'+#13#10
					+''''+adoQuery2.FieldByName('description').AsString+''',      --description'+#13#10
					+''''+adoQuery2.FieldByName('dict_type').AsString+''',              --dict_type'+#13#10
					+''''+adoQuery2.FieldByName('class').AsString+''',               --class'+#13#10
					+''''+adoQuery2.FieldByName('need_replace').AsString+'''              --need_replace 是否需要进行转义,0或NULL：不进行转义 1：进行转义，'+#13#10
					+');'+#13#10;

                adoQuery2.next;
            end;
            str.Add(str1);
            adoQuery2.close;

            //下一个sql
            adoQuery3.Next;

        end;

            //保存到文件
            ForceDirectories(edExportDir.Text+'\service\');
            file_name := edExportDir.Text+'\service\bssp_service_'+service_name+'.sql';
            str.SaveToFile(file_name);
            str.Clear;

            //下一个过程
            adoQuery1.Next;

        end;
        statusbar1.Panels[0].Text := 'generate SERVICE file(s)...Done';
    end;
    finally
        str.Free;

    end;

end;

procedure TFormBsspExporter.FormShow(Sender: TObject);
var
    myIniFile : TIniFile;
    iniFile : string;
begin
    iniFile := copy(Application.ExeName,1,length(Application.ExeName)-4) +'.ini';
    myinifile:=Tinifile.create(iniFile);
    edExportDir.Text := myIniFile.ReadString('BSSP_EXPORT','DIR','');
    if edExportDir.Text= '' then
      edExportDir.Text := ExtractFilePath(Application.ExeName);
    mmBusiness.Text :=  myIniFile.ReadString('BSSP_EXPORT','BUSINESS_SQL','1=2');
    mmProcess.Text :=  myIniFile.ReadString('BSSP_EXPORT','PROCESS_SQL','1=2');
    mmService.Text :=  myIniFile.ReadString('BSSP_EXPORT','SERVICE_SQL','1=2');
    myIniFile.Free;

    //取数据库连接名
    iniFile := copy(Application.ExeName,1,length(Application.ExeName)-4) +'.tns2';
    if ( FileExists(iniFile) ) then
    begin
        cbDBtns.Items.LoadFromFile(iniFile);
        cbDBtns.ItemIndex := 0;
    end;
end;

procedure TFormBsspExporter.btnGetAllClick(Sender: TObject);
begin
    btStop.Enabled := true;
    m_stop_get := false;
    genBusiness();
    if(m_stop_get) then exit;
    genProcess();
    //if(m_stop_get) then exit;
    //genPrefabSql();
    if(m_stop_get) then exit;
    genService();
    btStop.Enabled := false;
    m_stop_get := true;
end;

procedure TFormBsspExporter.edPreFixChange(Sender: TObject);
begin
    if( edPreFix.Enabled) and ( trim(edPreFix.Text)<>'') then
    begin
        m_prefix_user := edPreFix.Text+'.';
    end
    else
        m_prefix_user := '';
end;

procedure TFormBsspExporter.btStopClick(Sender: TObject);
begin
    m_stop_get := true;
    btStop.Enabled := false;
end;

//注册工具类
initialization
  RegisteFormFactory('BSSP导出(&E)',IFormCreator_BSSPExporter.create);

end.
