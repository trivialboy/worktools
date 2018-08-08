unit UnitHttp;

interface

uses
  Windows,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  IdBaseComponent, IdAntiFreezeBase, IdAntiFreeze, OleCtrls, SHDocVw,
   StdCtrls, Buttons, ExtCtrls, Controls, Classes,
   Messages, SysUtils, Variants,  Graphics,  Forms,
  ActiveX,  Spin,UnitFormFactory,
  ComCtrls,IdGlobal,iduri,inifiles,fileCtrl,Dialogs,UnitHeader;

type
  TFormHttpSender = class(TForm)
    Panel9: TPanel;
    pnl_req: TPanel;
    Panel12: TPanel;
    SpeedButton3: TSpeedButton;
    sbtnReqXml: TSpeedButton;
    pnl_req_text: TPanel;
    m_req1: TMemo;
    pnl_req_xml: TPanel;
    web_req: TWebBrowser;
    Splitter1: TSplitter;
    pnl_resp: TPanel;
    Panel13: TPanel;
    pnl_resp_xml: TPanel;
    web_resp: TWebBrowser;
    pnl_resp_text: TPanel;
    m_resp1: TMemo;
    IdAntiFreeze1: TIdAntiFreeze;
    Panel1: TPanel;
    cb_http: TComboBox;
    Panel3: TPanel;
    BitBtn31: TBitBtn;
    SpeedButton1: TSpeedButton;
    m_resp: TRichEdit;
    m_req: TRichEdit;
    cbMarkResp: TCheckBox;
    cb_urlencode: TCheckBox;
    cbUTF8encode: TCheckBox;
    cbContentType: TComboBox;
    StaticText2: TStaticText;
    cbUtf8Decode: TCheckBox;
    StaticText52: TStaticText;
    SpeedButton7: TSpeedButton;
    sbtnRespXml: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton8: TSpeedButton;
    edHttp: TEdit;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    StaticText1: TStaticText;
    lbedtTimeout: TLabeledEdit;
    btnLoadReq: TButton;
    btnSaveReq: TButton;
    ckbUseBiz: TCheckBox;
    cbBiz: TComboBox;
    OpenDialog1: TOpenDialog;
    lbBizName: TLabel;
    SaveDialog1: TSaveDialog;
    UpDown1: TUpDown;
    bbtnSetHeader: TSpeedButton;
    sbtnRespHtml: TSpeedButton;
    cbox_raw: TCheckBox;
    procedure BitBtn31Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure sbtnReqXmlClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure sbtnRespXmlClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure m_req1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure cb_urlencodeClick(Sender: TObject);

    
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure cb_httpChange(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Splitter1Moved(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure edHttpChange(Sender: TObject);
    procedure cb_httpDropDown(Sender: TObject);
    procedure cb_httpDblClick(Sender: TObject);
    procedure btnSaveReqClick(Sender: TObject);
    procedure btnLoadReqClick(Sender: TObject);
    procedure ckbUseBizClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure bbtnSetHeaderClick(Sender: TObject);
    procedure sbtnRespHtmlClick(Sender: TObject);



  private
    m_bManualResize : boolean;//是否手工调整过报文区大小
    m_sHttp : TStrings;  //http地址列表
    m_bizHttp : TStrings; //业务http地址列表
    m_commonHttp : TStrings; //通用http地址列表
    m_RequestHeaders,m_ResponseHeaders : string; //请求应答报文头

  FormHeader: TFormHeader;

    { Private declarations }
    procedure showInRichEdit(instr : string; richedt : TRichEdit );
    procedure xmlClick(Sender: TObject; pnl_xml,pnl_text : TPanel;web :TWebBrowser; edt : TRichEdit );
    procedure htmlClick(Sender: TObject; pnl_xml,pnl_text : TPanel;web :TWebBrowser; edt : TRichEdit );
//    procedure doEncode();
    procedure loadIniFile();
    procedure saveIniFile();
    function getRequestContent() : string;
    //procedure doMark(cbMark : TCheckBox; richedt : TRichEdit);
//    procedure doHttpExcept(http: TIdHTTP; e:Exception;var rspCode : integer  ; var rspContent : string);
  public
    { Public declarations }
    function CreateForm(caption : string):TForm;
  end;

//-------------- 子窗口创建者定义开始 ---------------//
IFormCreator_Http = class(TInterfacedObject, IFormCreator)
    function CreateForm():TForm;
end;
//------------ 子窗口创建者定义结束 -----------//


implementation

uses UnitPublic;

{$R *.dfm}
//-------------- 子窗口创建者实现开始 ---------------------//
function IFormCreator_Http.CreateForm():TForm;
begin
    Result := TFormHttpSender.Create(nil);
end;
//-------------- 子窗口创建者实现结束 ---------------------//


///////////////////////
function TFormHttpSender.CreateForm(caption : string):TForm;
begin
    Result := TFormHttpSender.Create(nil);
end;
function AnsiToUnicode(s:string):WideString;
var
lpWideChar:PWideChar;
len:Integer;
begin
len := ( Length(s) + 1 ) * 2;
GetMem(lpWideChar, len);
ZeroMemory(lpWideChar, len);

MultiByteToWideChar(CP_ACP,MB_PRECOMPOSED,
PChar(s), Length(s),lpWideChar, Len);

Result := lpWideChar;
FreeMem(lpWideChar);

end;


function TFormHttpSender.getRequestContent() : string;
var
  str : string;
  i : integer;
  ts : tstringlist ;
begin
  if cbox_raw.Checked then
  begin
    result := m_req.Text;
    exit;
  end;

  ts := tstringlist.create();
 // ts.Add( m_req.Text);
  //for i:=0 to m_req.Lines.Count-1 do
  ts.Text := m_req.Text;
  for i:=0 to ts.Count -1 do
  begin
    str := str + trim(ts.Strings[i]);
  end;
  ts.Destroy;
//  str := stringReplace(m_req.text,#13#10,'',[rfReplaceAll]);
  result := str;
end;



procedure TFormHttpSender.BitBtn31Click(Sender: TObject);
var
  resp : TStringStream;
  req : TStrings;
  FileName :string;
  ts: TStringList;
  strReq : string;
  ws,sendAddr : String;
  http: TIdHTTP;
  rscode : integer;
begin
  ws:='';

  cb_http.Text := trim(cb_http.text);
    if cb_http.Text ='' then
    begin
        showMessage('请输入连接地址!');
        exit;
    end;
    //发送BSSP命令,并显示返回结果
    req := TStringList.Create;
    resp := TStringStream.Create('GBK'); //TStringStream.Create('GB18030');
    try
        http := TIdHTTP.Create(nil);

        http.HTTPOptions := [];
        http.Request.ContentLength := 0;
        http.Request.UserAgent :='Mozilla/3.0 (compatible; Indy Library; DevTools ' + getVer() + ')';
        BitBtn31.Enabled := false;
        //try
            m_resp.Clear;
            web_resp.Navigate('about:blank');
            //strReq := stringReplace(m_req.text,#13#10,'',[rfReplaceAll]) ;
            strReq := getRequestContent();
            if cbutf8encode.Checked then
            begin
              strReq := UTF8Encode(strReq);
              //idHttp1.Request.ContentType := cbContentType.Text + ';charset=UTF-8';
              http.Request.ContentType := trim(cbContentType.Text) + ';charset=UTF-8';
            end
            else
            begin
              //idHttp1.Request.ContentType := cbContentType.Text;
              http.Request.ContentType := trim(cbContentType.Text);
            end;
            req.Add(strReq);

            Application.ProcessMessages;
            //IdHTTP1.ReadTimeout := strtoint(lbedttimeout.text)*1000;
            http.ReadTimeout := strtoint(lbedttimeout.text)*1000;
            //补充自定义header
            http.Request.CustomHeaders.Add(FormHeader.Memo1.Text);

            try
              if strReq='' then
              begin
                //ws := idhttp1.get(cb_http.Text );
                ws := http.get(cb_http.Text );
              end
              else
              begin
                //IdHTTP1.Post(cb_http.Text, req, resp);
                  http.Post(cb_http.Text, req, resp);
                  //http.Response.ResponseText
                  ws := resp.DataString;
              end;
            except
                  on e: EIdHTTPProtocolException do
                  begin

                    MessageBox(self.handle,   pansichar(e.Message),'HTTP 调用失败', MB_IConERROR + MB_OK );
                    ws := e.ErrorMessage;

                  end;
            end;


            if  cbUtf8Decode.checked then //and (pos('charset=UTF-8',idhttp1.Response.ContentType)>0)   then
              m_resp.text := DecodeUtf8Str(ws) 
            else
              m_resp.text := ws;

            if sbtnRespXml.Down then
              xmlClick(sbtnRespXml,  pnl_resp_xml,pnl_resp_text,web_resp, m_resp)
            else
              htmlClick(sbtnRespHtml,pnl_resp_xml,pnl_resp_text,web_resp, m_resp);

            //如果是新的地址，则增加到列表
          if ( cb_http.Items.IndexOf(cb_http.Text)=-1 ) then
          begin
               cb_http.Items.Add(cb_http.Text);
          end;
          if( m_commonHttp.IndexOf(cb_http.Text)=-1) then
          begin
            m_commonHttp.Add(cb_http.text);
          end;
          if( m_sHttp.IndexOf(cb_http.Text)=-1) then
          begin
            m_sHttp.Add(cb_http.text);
          end;
          if( m_bizHttp.IndexOf(cb_http.Text)=-1) then
          begin
            m_bizHttp.Add(cb_http.text);
          end;

          if ( cbContentType.Items.IndexOf(cbContentType.Text)=-1 ) then
          begin
               cbContentType.Items.Add(cbContentType.Text);
          end;

        //except
        //    m_resp.text := '发送失败';
        //end;
    finally
        m_RequestHeaders := http.Request.RawHeaders.Text;
        m_ResponseHeaders := http.Response.RawHeaders.Text;
        req.Free;
        resp.Free;
        http.Free;
        BitBtn31.Enabled := true;
    end;

end;

procedure TFormHttpSender.SpeedButton3Click(Sender: TObject);
begin
    M_REQ.Clear;
end;

procedure TFormHttpSender.sbtnReqXmlClick(Sender: TObject);
//var
//    FileName : string;
begin
    xmlClick(sender, pnl_req_xml,pnl_req_text,web_req, m_req);
    {
    if not sbtnReqXml.Down then
    begin
        //显示正常内容
        pnl_req_xml.Visible := false;
        pnl_req_text.visible := true;
        pnl_req_text.align := alClient;
    end
    else
    begin
        //显示xml内容
        pnl_req_text.visible := false;
        pnl_req_xml.Visible := true;
        pnl_req_xml.align := alClient;
        FileName := ExtractFilePath(Application.ExeName)+'bsccfg_req_tmp.xml';

        m_req.Lines.SaveToFile(FileName);
        web_req.Navigate(FileName);
    end;
    }
end;

procedure TFormHttpSender.SpeedButton2Click(Sender: TObject);
begin
    M_RESP.Clear;

end;

procedure TFormHttpSender.sbtnRespXmlClick(Sender: TObject);
//var
//    FileName : string;
    //ts : tstringList;
begin
    xmlClick(sender, pnl_resp_xml,pnl_resp_text,web_resp, m_resp);
//    procedure TFormHttpSender.xmlClick(Sender: TObject; pnl_xml,pnl_text : TPanel;web_resp :TWebBrowser; edt : TRichEdit );
    {
    if not sbtnRespXml.Down then
    begin
        //显示正常内容
        pnl_resp_xml.Visible := false;
        pnl_resp_text.visible := true;
        pnl_resp_text.align := alClient;
    end
    else
    begin
        //显示xml内容
        pnl_resp_text.visible := false;
        pnl_resp_xml.Visible := true;
        pnl_resp_xml.align := alClient;
        FileName := ExtractFilePath(Application.ExeName)+'bsccfg_resp_tmp.xml';
        ts := tstringList.Create;
        ts.Text := m_resp.Text;
        //m_resp.Lines.SaveToFile(FileName);
        ts.SaveToFile(FileName);
        web_resp.Navigate(FileName);

    end;
    }
end;

procedure TFormHttpSender.FormCreate(Sender: TObject);
begin
  web_req.Navigate('about:blank');
  web_resp.Navigate('about:blank');
    m_sHttp := TStringList.Create;
    m_bizHttp := TStringList.Create;
    m_commonHttp := TStringList.Create;

    FormHeader := TFormHeader.Create(nil);
end;

procedure TFormHttpSender.FormClose(Sender: TObject; var Action: TCloseAction);
var
    iniFile : string;
begin
  IF trim(edHttp.Text) = '' then
  begin
    //保存测试服务地址
    iniFile := copy(Application.ExeName,1,length(Application.ExeName)-4) +'.http';
    //cb_http.Items.SaveToFile(iniFile);
    m_commonHttp.SaveToFile(iniFile);
    saveIniFile();
  end;
  action := caFree;
end;

procedure TFormHttpSender.m_req1KeyPress(Sender: TObject; var Key: Char);
begin
    if( key = #1 ) then
        TMemo(sender).SelectAll;

end;

procedure TFormHttpSender.FormShow(Sender: TObject);
var
    iniFile : string;
//    t : integer;
  rootDir : string;
begin
    //取测试服务地址
    iniFile := copy(Application.ExeName,1,length(Application.ExeName)-4) +'.http';
    if ( FileExists(iniFile) ) then
    begin
        cb_http.Items.LoadFromFile(iniFile);
        cb_http.ItemIndex := 0;
        m_commonHttp.LoadFromFile(iniFile);
        m_sHttp.LoadFromFile(iniFile);
    end;

    loadIniFile();

    { DONE : 初始化时，加载已保存的业务报文，填充到下拉列表cbBiz }
    rootDir := ExtractFilePath(Application.ExeName)+'biz_dir\';
    cbBiz.Items := GetDirList(rootDir);
    cbBiz.ItemIndex := -1;
end;

procedure TFormHttpSender.SpeedButton1Click(Sender: TObject);
var
//    pos : integer;
    outStr : string;
begin
      formatXml('  ', m_req.Text, outStr);
    //m_req.Text := outStr;
    showInRichEdit(outStr, m_req);


end;

procedure TFormHttpSender.SpeedButton4Click(Sender: TObject);
var
    outStr : string;
begin
    m_resp.Text := trim(m_resp.Text);
    //m_resp.GetTextBuf()
    //if( m_resp.Text ='<')
      formatXml('  ', m_resp.Text, outStr);
    //m_resp.Text := outStr;
    showInRichEdit(outStr, m_resp);

end;
procedure TFormHttpSender.showInRichEdit(instr : string; richedt : TRichEdit );
var
  tstr : TStringList;
  i,s,sdt1,sdt2 : integer;
  attr : TTextAttributes;
begin
    //对于空节点标签标注为红色
    attr := richedt.DefAttributes;

    richedt.clear;
    //richedt.SetFocus;
    if not cbMarkResp.Checked then
    begin
      richedt.Text := instr;
      richedt.Font.Color := clWindowText;
    end
    else
    begin
    tstr := TStringList.Create();
    tstr.Text := instr;
    for i:=0 to tstr.Count-1 do
    begin
      s :=  pos('></',tstr[i] );
      if s = 0 then s := pos ('/>',tstr[i]);
      if (0 <> s) and (pos('<![CDATA[',tstr[i])=0 ) then
      begin
        sdt1 := richedt.SelStart ;
        richedt.Lines.Add(tstr[i]);
        sdt2 := richedt.SelStart;
        richedt.SelStart := sdt1;
        richedt.SelLength := length(tstr[i]);
        richedt.SelAttributes.Color := clred;
        //恢复
        richedt.SelStart := sdt2;
        richedt.SelLength := 0;
      end
      else
      begin

        richedt.Lines.Add(tstr[i]);
      end;
    end;

    tstr.Destroy();
    end;
    richedt.SelAttributes := attr;
end;

procedure TFormHttpSender.xmlClick(Sender: TObject; pnl_xml,pnl_text : TPanel;web :TWebBrowser; edt : TRichEdit );
var
    FileName : string;
    ts : tstringList;
begin

    if not TSpeedButton(Sender).Down then
    begin
        //显示正常内容
        pnl_xml.Visible := false;
        pnl_text.visible := true;
        pnl_text.align := alClient;
    end
    else
    begin
        //显示xml内容
        pnl_text.visible := false;
        pnl_xml.Visible := true;
        pnl_xml.align := alClient;
        FileName := ExtractFilePath(Application.ExeName)+TSpeedButton(Sender).name+'_http.xml';
        ts := tstringList.Create;
        ts.Text := edt.Text;
        //edt.Lines.SaveToFile(FileName);
        ts.SaveToFile(FileName);
        ts.Destroy;
        web.Navigate(FileName);

    end;
end;
procedure TFormHttpSender.htmlClick(Sender: TObject; pnl_xml,pnl_text : TPanel;web :TWebBrowser; edt : TRichEdit );
var
    FileName : string;
    ts : tstringList;
begin
    //保存为html文件进行展示
    if not TSpeedButton(Sender).Down then
    begin
        //显示正常内容
        pnl_xml.Visible := false;
        pnl_text.visible := true;
        pnl_text.align := alClient;
    end
    else
    begin
        //显示xml内容
        pnl_text.visible := false;
        pnl_xml.Visible := true;
        pnl_xml.align := alClient;
        FileName := ExtractFilePath(Application.ExeName)+TSpeedButton(Sender).name+'_html.html';
        ts := tstringList.Create;
        ts.Text := edt.Text;
        //edt.Lines.SaveToFile(FileName);
        ts.SaveToFile(FileName);
        ts.Destroy;
        web.Navigate(FileName);

    end;
end;
{
procedure TFormHttpSender.doMark(cbMark : TCheckBox; richedt : TRichEdit);
var
  str : string;
begin
  str := richedt.text ;
    if not cbMark.Checked then
    begin
      richedt.Text := str;
    end
    else
    begin
      showInRichEdit(str, richedt );
   end;
end;
 }



procedure TFormHttpSender.cb_urlencodeClick(Sender: TObject);
begin
  if cb_urlencode.Checked then
  begin
    m_req.text := TIdURI.ParamsEncode(m_req.text);
    cbContentType.Text := 'application/x-www-form-urlencoded';
  end
  else
  begin
    m_req.text := TIdURI.urldecode(m_req.text);
    cbContentType.Text := 'text/xml';
    cb_httpChange(nil);
  end;
end;





procedure TFormHttpSender.SpeedButton5Click(Sender: TObject);
begin
//showmessage('应答报文头:' + #13#10 + idhttp1.Response.RawHeaders.Text);
showmessage('应答报文头:' + #13#10 + m_ResponseHeaders);
end;

procedure TFormHttpSender.SpeedButton6Click(Sender: TObject);
begin
//showmessage('请求报文头:' + #13#10 + idhttp1.Request.RawHeaders.Text);
showmessage('请求报文头:' + #13#10 + m_RequestHeaders);

end;

procedure TFormHttpSender.cb_httpChange(Sender: TObject);
begin
  if pos('BSSP',cb_http.text)>0 then
  BEGIN
    //showmessage(cb_http.text);
    cbContentType.Text := 'application/x-www-form-urlencoded';
  end;
end;
procedure TFormHttpSender.saveIniFile();
var
  iniFile,str : string;
  myinifile : TiniFile;
begin
      iniFile := copy(Application.ExeName,1,length(Application.ExeName)-4) +'.ini';
      myinifile:=Tinifile.create(iniFile);
      str := trim(cbContentType.Text);
      myIniFile.WriteString('HTTP_SENDER','CONTENT_TYPE',str);
      str := trim(lbedtTimeOut.Text);
      myIniFile.WriteString('HTTP_SENDER','TIME_OUT',str);
      str := StringReplace(trim(FormHeader.Memo1.Text) ,#13#10,'\r\n',[rfReplaceAll]);
      myIniFile.WriteString('HTTP_SENDER','REQUEST_HEADER',str);
      myIniFile.WriteBool('HTTP_SENDER','SEND_RAW_DATA',cbox_raw.Checked );
      myIniFile.Free;

end;
procedure TFormHttpSender.loadIniFile();
var
    myIniFile : TIniFile;
    iniFile : string;
    str : string;
//    stm : tstringstream;
begin
      iniFile := copy(Application.ExeName,1,length(Application.ExeName)-4) +'.ini';
      myinifile:=Tinifile.create(iniFile);
      lbedtTimeOut.Text := myIniFile.ReadString('HTTP_SENDER','TIME_OUT','30');
      cbContentType.Text := myIniFile.ReadString('HTTP_SENDER','CONTENT_TYPE','application/x-www-form-urlencoded');
      str := trim(myIniFile.ReadString('HTTP_SENDER','REQUEST_HEADER',''));
      FormHeader.Memo1.Text := StringReplace(str,'\r\n',#13#10,[rfReplaceAll]);
      cbox_raw.Checked := myIniFile.ReadBool('HTTP_SENDER','SEND_RAW_DATA',false);
      myIniFile.Free;
end;

procedure TFormHttpSender.FormResize(Sender: TObject);
var
  t : integer;
begin
    if m_bManualResize = true then exit;
    t := (pnl_req.Width+pnl_resp.width) div 2;
    pnl_req.Width :=  t;
    //showmessage( inttostr(pnl_req.width) + ':' + inttostr( pnl_resp.width) +':'+inttostr(splitter1.left ));

end;

procedure TFormHttpSender.Splitter1Moved(Sender: TObject);
begin
  m_bManualResize := true;
end;

procedure TFormHttpSender.SpeedButton7Click(Sender: TObject);
var
    outStr : string;
begin
    outStr := formatJson('  ', m_req.Text);
    showInRichEdit(outStr, m_req);

end;

procedure TFormHttpSender.SpeedButton8Click(Sender: TObject);
var
    outStr : string;
begin
    outStr := formatJson('  ', m_resp.Text);
    showInRichEdit(outStr, m_resp);

end;

procedure TFormHttpSender.edHttpChange(Sender: TObject);
var
  i : integer;
  findStr : string;
  mapHttp : TStrings;
begin
  findStr := uppercase(trim(edHttp.text));
  if findStr ='' then
  begin
    //cb_http.items.Clear;
    cb_http.Items.Text := m_sHttp.Text;
    exit;
  end;

  mapHttp := TStringList.Create;
  try
    for i:=0 to m_sHttp.count-1 do
    begin
      if pos(findStr, uppercase(m_sHttp.Strings[i]) ) > 0  then
      begin
        mapHttp.Append(m_sHttp.Strings[i]);
      end;
    end ;
    cb_http.Text := '';
    //cb_http.items.Clear;
    cb_http.Items.Text := mapHttp.Text;
    cb_http.DropDownCount := 10;
    cb_http.DroppedDown := TRUE;
  finally
    mapHttp.Free;
  end;
end;

procedure TFormHttpSender.cb_httpDropDown(Sender: TObject);
begin
  SendMessage(cb_http.Handle,WM_SETCURSOR,0,0); //下拉后鼠标丢失，发消息用于显示鼠标
end;

procedure TFormHttpSender.cb_httpDblClick(Sender: TObject);
begin
  cb_http.DroppedDown := true;
end;

procedure TFormHttpSender.btnSaveReqClick(Sender: TObject);
var
  bizName ,addr,req,req2: string;
  saveRsp : boolean;
  rootDir, bizDir ,addrFile, reqFile, respFile : string;
  addrStr,  reqStr, respStr : TStrings;
  rtn,i : integer;
begin

  //用户自定义保存业务名(若当前已加载，默认自动以当前业务名填充）
  bizName := cbBiz.Text;
  if not inputQuery('请输入业务文件夹名称','业务文件夹：',bizName) then
  begin
    exit;
  end;
  if(bizName='') then
  begin
    showmessage('业务名称不能为空，保存失败！');
    exit;
  end;

  rootDir := ExtractFilePath(Application.ExeName)+'biz_dir\';
  bizDir := rootDir + bizName + '\';
  forceDirectories(bizDir);//创建目录
  req := bizName;
  try
    addrStr := TStringList.Create;
    //获取请求地址，保存，支持多条地址
    //如果文件存在,则先获取地址
    addrFile := bizDir+bizName+'.addr.txt';
    if fileExists(addrFile) then
    begin
      addrStr.LoadFromFile(addrFile);
    end;
    if (trim(cb_http.Text)<>'') and (pos(cb_http.Text,addrStr.Text)=0) then
    begin
      //地址未保存则补充到末尾
      addrStr.Append(cb_http.Text);
    end;
    addrStr.SaveToFile(addrFile);

    //获取请求报文，保存
    req := bizName;
    req2 := bizName;
    reqStr := TStringList.create;
    reqFile := bizDir+req+'.req';

   if lbBizName.Caption <> '[加载业务]' then
    savedialog1.FileName := lbBizName.Caption
   else
    saveDialog1.FileName := bizName;

   savedialog1.InitialDir := bizDir;
   if not savedialog1.Execute then
   begin
    exit;
   end;

   req := extractFileName(savedialog1.FileName);
   req := StringReplace(req,'.req','',[rfReplaceAll, rfIgnoreCase]);
    reqFile := bizDir+req+'.req';
    if m_req.text <> '' then
      reqStr.Text := m_req.Text;
    reqStr.SaveToFile(reqFile);

    //获取应答报文，保存到[RESPONSE]
    respStr := TStringList.create;
    respFile := bizDir+req+'.rsp' ;
    if m_resp.text <>'' then
    begin
      respStr.Text := m_resp.Text;
      respStr.SaveToFile(respFile);
    end;

    //业务保存到下拉框
    if cbBiz.Items.IndexOf(bizName)<0 then
    begin
      cbBiz.Items.Append(bizName);
      cbBiz.ItemIndex := cbBiz.Items.Count-1;
    end;

    //地址保存到业务地址
    if m_bizHttp.IndexOf(cb_http.Text)=-1 then
    begin
      m_bizHttp.Add(cb_http.Text);
    end;

    lbBizName.Caption := req;

  finally
    addrStr.free;
    reqStr.free;
    respStr.free;
  end;
end;

procedure TFormHttpSender.btnLoadReqClick(Sender: TObject);
var
  bizName ,rootDir,bizDir,addrFile,reqFile,respFile,req : string;
  reqStr,respStr : TStrings;
begin
  //根据下拉框所选业务，加载请求地址/请求报文/应答报文
  //获取下拉框的业务名称
  bizName := trim(cbBiz.Text);
  if bizName='' then
  begin
    ShowMessage('请选择需要加载的业务报文!');
    exit;
  end;

  rootDir := ExtractFilePath(Application.ExeName)+'biz_dir\';
  bizDir := rootDir + bizName +'\';

  //从业务目录获取文件，地址/请求报文/应答报文
  //读取地址文件，并填充到地址栏
  addrFile := bizDir+bizName+'.addr.txt';

  if FileExists(addrFile) then
  begin
    m_bizHttp.LoadFromFile(addrFile);
  end;

  openDialog1.FileName := '';
  opendialog1.InitialDir := bizDir;
  if  opendialog1.Execute = false then
  begin
    exit;
  end;
  req := ExtractFileName(openDialog1.FileName) ;
  if ExtractFileDir(addrFile) <> ExtractFileDir(openDialog1.FileName) then
  begin
    showMessage('不能变更业务目录，请重新选择。');
    exit ;
  end;

  bizName := stringReplace(req,'.req','',[rfReplaceAll, rfIgnoreCase]);
  try
   reqStr := TStringList.Create;
   respStr := TStringList.Create;
  //读取请求文件，并填充到请求报文区
  reqFile := bizDir+bizName+'.req';
  m_req.Clear;
  if FileExists(reqFile) then
  begin
    reqStr.LoadFromFile(reqFile);
    m_req.Text := reqStr.Text;
  end;
  xmlClick(sbtnReqXml, pnl_req_xml,pnl_req_text,web_req, m_req);


  //读取应答文件，并填充到应答报文区
  respFile := bizDir+bizName+'.rsp' ;
  m_resp.Clear;
  if FileExists(respFile) then
  begin
    respStr.LoadFromFile(respFile);
    m_resp.text := respStr.Text;
  end;
  xmlClick(sbtnRespXml, pnl_resp_xml,pnl_resp_text,web_resp, m_resp);
  htmlClick(sbtnRespHtml, pnl_resp_xml,pnl_resp_text,web_resp, m_resp);
  finally
    reqStr.Free;
    respStr.Free;
  end;
  ckbUseBiz.Enabled := true;
  ckbUseBiz.Checked := true;
  ckbUseBizClick(Sender);
  lbBizName.Caption := bizName;
end;

procedure TFormHttpSender.ckbUseBizClick(Sender: TObject);
begin
{ DONE : 选中则使用已保存的业务地址作为所选地址范围，未选中则使用公共的业务地址 }
  cb_http.Text := '';
  if ckbUseBiz.Checked then
  begin
    //选中，清空地址栏，将业务地址填充进去，同时要支持业务地址搜索功能
    cb_http.Items.Text := m_bizHttp.Text;
    m_sHttp.Text := m_bizHttp.Text;
  end
  else
  begin
    //未选中，清空地址栏，将公共地址填充进去，同时支持公共地址搜索功能
    cb_http.Items.Text := m_commonHttp.Text;
    m_sHttp.Text := m_commonHttp.Text;
  end;
  cb_http.ItemIndex := 0;
  edHttp.Text := '';
end;

procedure TFormHttpSender.FormDestroy(Sender: TObject);
begin
  if m_sHttp<>nil then
  begin
    m_sHttp.free;
    m_sHttp := nil;
  end;

  if m_bizHttp <>nil then
  begin
    m_bizHttp.Free;
    m_bizHttp := nil;
  end;

  if m_commonHttp <>nil then
  begin
    m_commonHttp.Free;
    m_commonHttp := nil;
  end;
  FormHeader.Free;
end;

procedure TFormHttpSender.bbtnSetHeaderClick(Sender: TObject);
begin
  FormHeader.ShowModal();
end;

procedure TFormHttpSender.sbtnRespHtmlClick(Sender: TObject);
begin
    htmlClick(sender, pnl_resp_xml,pnl_resp_text,web_resp, m_resp);

end;

initialization
  OleInitialize(nil);
  //注册工具类
  RegisteFormFactory('Http发送(&H)',IFormCreator_Http.create);
finalization
  OleUninitialize;

end.
