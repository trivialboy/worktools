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
    m_bManualResize : boolean;//�Ƿ��ֹ���������������С
    m_sHttp : TStrings;  //http��ַ�б�
    m_bizHttp : TStrings; //ҵ��http��ַ�б�
    m_commonHttp : TStrings; //ͨ��http��ַ�б�
    m_RequestHeaders,m_ResponseHeaders : string; //����Ӧ����ͷ

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

//-------------- �Ӵ��ڴ����߶��忪ʼ ---------------//
IFormCreator_Http = class(TInterfacedObject, IFormCreator)
    function CreateForm():TForm;
end;
//------------ �Ӵ��ڴ����߶������ -----------//


implementation

uses UnitPublic;

{$R *.dfm}
//-------------- �Ӵ��ڴ�����ʵ�ֿ�ʼ ---------------------//
function IFormCreator_Http.CreateForm():TForm;
begin
    Result := TFormHttpSender.Create(nil);
end;
//-------------- �Ӵ��ڴ�����ʵ�ֽ��� ---------------------//


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
        showMessage('���������ӵ�ַ!');
        exit;
    end;
    //����BSSP����,����ʾ���ؽ��
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
            //�����Զ���header
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

                    MessageBox(self.handle,   pansichar(e.Message),'HTTP ����ʧ��', MB_IConERROR + MB_OK );
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

            //������µĵ�ַ�������ӵ��б�
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
        //    m_resp.text := '����ʧ��';
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
        //��ʾ��������
        pnl_req_xml.Visible := false;
        pnl_req_text.visible := true;
        pnl_req_text.align := alClient;
    end
    else
    begin
        //��ʾxml����
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
        //��ʾ��������
        pnl_resp_xml.Visible := false;
        pnl_resp_text.visible := true;
        pnl_resp_text.align := alClient;
    end
    else
    begin
        //��ʾxml����
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
    //������Է����ַ
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
    //ȡ���Է����ַ
    iniFile := copy(Application.ExeName,1,length(Application.ExeName)-4) +'.http';
    if ( FileExists(iniFile) ) then
    begin
        cb_http.Items.LoadFromFile(iniFile);
        cb_http.ItemIndex := 0;
        m_commonHttp.LoadFromFile(iniFile);
        m_sHttp.LoadFromFile(iniFile);
    end;

    loadIniFile();

    { DONE : ��ʼ��ʱ�������ѱ����ҵ���ģ���䵽�����б�cbBiz }
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
    //���ڿսڵ��ǩ��עΪ��ɫ
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
        //�ָ�
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
        //��ʾ��������
        pnl_xml.Visible := false;
        pnl_text.visible := true;
        pnl_text.align := alClient;
    end
    else
    begin
        //��ʾxml����
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
    //����Ϊhtml�ļ�����չʾ
    if not TSpeedButton(Sender).Down then
    begin
        //��ʾ��������
        pnl_xml.Visible := false;
        pnl_text.visible := true;
        pnl_text.align := alClient;
    end
    else
    begin
        //��ʾxml����
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
//showmessage('Ӧ����ͷ:' + #13#10 + idhttp1.Response.RawHeaders.Text);
showmessage('Ӧ����ͷ:' + #13#10 + m_ResponseHeaders);
end;

procedure TFormHttpSender.SpeedButton6Click(Sender: TObject);
begin
//showmessage('������ͷ:' + #13#10 + idhttp1.Request.RawHeaders.Text);
showmessage('������ͷ:' + #13#10 + m_RequestHeaders);

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
  SendMessage(cb_http.Handle,WM_SETCURSOR,0,0); //��������궪ʧ������Ϣ������ʾ���
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

  //�û��Զ��屣��ҵ����(����ǰ�Ѽ��أ�Ĭ���Զ��Ե�ǰҵ������䣩
  bizName := cbBiz.Text;
  if not inputQuery('������ҵ���ļ�������','ҵ���ļ��У�',bizName) then
  begin
    exit;
  end;
  if(bizName='') then
  begin
    showmessage('ҵ�����Ʋ���Ϊ�գ�����ʧ�ܣ�');
    exit;
  end;

  rootDir := ExtractFilePath(Application.ExeName)+'biz_dir\';
  bizDir := rootDir + bizName + '\';
  forceDirectories(bizDir);//����Ŀ¼
  req := bizName;
  try
    addrStr := TStringList.Create;
    //��ȡ�����ַ�����棬֧�ֶ�����ַ
    //����ļ�����,���Ȼ�ȡ��ַ
    addrFile := bizDir+bizName+'.addr.txt';
    if fileExists(addrFile) then
    begin
      addrStr.LoadFromFile(addrFile);
    end;
    if (trim(cb_http.Text)<>'') and (pos(cb_http.Text,addrStr.Text)=0) then
    begin
      //��ַδ�����򲹳䵽ĩβ
      addrStr.Append(cb_http.Text);
    end;
    addrStr.SaveToFile(addrFile);

    //��ȡ�����ģ�����
    req := bizName;
    req2 := bizName;
    reqStr := TStringList.create;
    reqFile := bizDir+req+'.req';

   if lbBizName.Caption <> '[����ҵ��]' then
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

    //��ȡӦ���ģ����浽[RESPONSE]
    respStr := TStringList.create;
    respFile := bizDir+req+'.rsp' ;
    if m_resp.text <>'' then
    begin
      respStr.Text := m_resp.Text;
      respStr.SaveToFile(respFile);
    end;

    //ҵ�񱣴浽������
    if cbBiz.Items.IndexOf(bizName)<0 then
    begin
      cbBiz.Items.Append(bizName);
      cbBiz.ItemIndex := cbBiz.Items.Count-1;
    end;

    //��ַ���浽ҵ���ַ
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
  //������������ѡҵ�񣬼��������ַ/������/Ӧ����
  //��ȡ�������ҵ������
  bizName := trim(cbBiz.Text);
  if bizName='' then
  begin
    ShowMessage('��ѡ����Ҫ���ص�ҵ����!');
    exit;
  end;

  rootDir := ExtractFilePath(Application.ExeName)+'biz_dir\';
  bizDir := rootDir + bizName +'\';

  //��ҵ��Ŀ¼��ȡ�ļ�����ַ/������/Ӧ����
  //��ȡ��ַ�ļ�������䵽��ַ��
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
    showMessage('���ܱ��ҵ��Ŀ¼��������ѡ��');
    exit ;
  end;

  bizName := stringReplace(req,'.req','',[rfReplaceAll, rfIgnoreCase]);
  try
   reqStr := TStringList.Create;
   respStr := TStringList.Create;
  //��ȡ�����ļ�������䵽��������
  reqFile := bizDir+bizName+'.req';
  m_req.Clear;
  if FileExists(reqFile) then
  begin
    reqStr.LoadFromFile(reqFile);
    m_req.Text := reqStr.Text;
  end;
  xmlClick(sbtnReqXml, pnl_req_xml,pnl_req_text,web_req, m_req);


  //��ȡӦ���ļ�������䵽Ӧ������
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
{ DONE : ѡ����ʹ���ѱ����ҵ���ַ��Ϊ��ѡ��ַ��Χ��δѡ����ʹ�ù�����ҵ���ַ }
  cb_http.Text := '';
  if ckbUseBiz.Checked then
  begin
    //ѡ�У���յ�ַ������ҵ���ַ����ȥ��ͬʱҪ֧��ҵ���ַ��������
    cb_http.Items.Text := m_bizHttp.Text;
    m_sHttp.Text := m_bizHttp.Text;
  end
  else
  begin
    //δѡ�У���յ�ַ������������ַ����ȥ��ͬʱ֧�ֹ�����ַ��������
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
  //ע�Ṥ����
  RegisteFormFactory('Http����(&H)',IFormCreator_Http.create);
finalization
  OleUninitialize;

end.
