unit MainFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ComCtrls, Menus, StdCtrls, Buttons, ActnList,
  ExtCtrls, IdBaseComponent, IdAntiFreezeBase, IdAntiFreeze,UnitFormFactory,
  IdUDPClient, IdComponent, IdUDPBase, IdUDPServer,IdStack,IdSocketHandle,
  IdTCPConnection, IdTCPClient, IdHTTP, shellapi;

type
  TFormDevToolsMain = class(TForm)
    MainMenu1: TMainMenu;
    StatusBar1: TStatusBar;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    mnTools: TMenuItem;
    ActionList1: TActionList;
    TabControl1: TTabControl;
    Splitter1: TSplitter;
    windows_list: TMenuItem;
    tile1: TMenuItem;
    cascade1: TMenuItem;
    N6: TMenuItem;
    IdAntiFreeze1: TIdAntiFreeze;
    actUpdate: TAction;
    actAbout: TAction;
    actExit: TAction;
    Timer1: TTimer;
    edTab: TEdit;
    procedure TabControl1Change(Sender: TObject);
    procedure tile1Click(Sender: TObject);
    procedure cascade1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actExitExecute(Sender: TObject);
    procedure actAboutExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure idUdpSvrUDPRead(Sender: TObject; AData: TStream; ABinding: TIdSocketHandle);
    procedure StatusBar1DblClick(Sender: TObject);
    procedure TabControl1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure edTabKeyPress(Sender: TObject; var Key: Char);
    procedure edTabExit(Sender: TObject);
    procedure StatusBar1Click(Sender: TObject);
  private
    { Private declarations }
    //plugin : TBplPlugin;
    mFormLibs : TStringList;
    mVersion : string;
    mNewVersion : string;
    mNewVersionHint : string;
//    mFormFactory : IFormFactory;

    procedure CreateChildForm(Sender: TObject);
//    procedure LoadPlugins();
//    procedure UnloadPlugins();
    procedure InitFormFactory();
    procedure CloseAllChildForm();

    procedure GetLastestVersionInfo();
    function isNewVersion( newVer: string): boolean;
  public
    { Public declarations }
    m_sVersionUrl : string;
    function GetVersionString(FileName: string): string;
    function getVersionUrl():string;
    function getVersion():string;
  end;

var
  FormDevToolsMain: TFormDevToolsMain;
//function GetVersionString(FileName: string): string;
  //g_hostIp : string;
implementation

uses UnitAbout, BSC_version, UnitUpdate,StrUtils, UnitPublic;

//uses BplPlugin;

{$R *.dfm}
var
lpfnClient:   Pointer;

function HookClientProc(hWnd:   HWND;   uMsg:   UINT;   wParam:   WPARAM;   lParam:   LPARAM):   LRESULT;   stdcall;
var
  idx : integer;

begin
      case uMsg of
       WM_MDIDESTROY :
      begin
          idx := FormDevToolsMain.TabControl1.Tabs.IndexOfObject(findControl(wParam));
          if (idx >= 0 ) then
          begin
            FormDevToolsMain.TabControl1.Tabs.Delete(idx);
            FormDevToolsMain.edTab.visible := false;
          end;
      end;
      {
       WM_MDIACTIVATE :
      begin
      //showmessage(findControl(wParam).ClassName);
      //  idx := fmMain.TabControl1.Tabs.IndexOfObject(findControl(wParam));
      //  fmMain.TabControl1.tabIndex := idx;
      end;
      WM_MDINEXT:
      begin
      //  idx := fmMain.TabControl1.Tabs.IndexOfObject(findControl(wParam));
      //  fmMain.TabControl1.tabIndex := idx;
      end;
      }
      end;

      Result   :=   CallWindowProc(Pointer(lpfnClient),   hWnd,   uMsg,   wParam,   lParam) ;
      case uMsg of
      WM_MDIGETACTIVE :begin
      //showmessage(findControl(wParam).ClassName);
        idx := FormDevToolsMain.TabControl1.Tabs.IndexOfObject(findControl(Result));
        if idx >=0 then
            FormDevToolsMain.TabControl1.tabIndex := idx;
      end;
      end;
end;

function TFormDevToolsMain.getVersion():string;
begin
  result := mVersion;
end;

function TFormDevToolsMain.getVersionUrl():string;
begin
  result := m_sVersionUrl;
end;

procedure TFormDevToolsMain.TabControl1Change(Sender: TObject);
begin
    TForm(TabControl1.Tabs.Objects[TabControl1.TabIndex]).BringToFront;
    edTab.visible := false;
end;

procedure TFormDevToolsMain.tile1Click(Sender: TObject);
begin
    tile;
end;

procedure TFormDevToolsMain.cascade1Click(Sender: TObject);
begin
    cascade;
end;

procedure TFormDevToolsMain.FormCreate(Sender: TObject);
begin
    //g_hostIp := '10.1.1.68';
    m_sVersionUrl := 'http://10.1.0.195:8088/hdwiki/index.php?doc-view-513';
    mFormLibs := TStringList.create();
    InitFormFactory();

    lpfnClient   :=   Pointer(GetWindowLong(self.ClientHandle,   GWL_WNDPROC));
    SetWindowLong(self.ClientHandle,   GWL_WNDPROC,   LPARAM(@HookClientProc));
    mVersion := GetVersionString(application.ExeName);
    self.Caption := self.Caption +'[Ver:'+ mVersion+']';
    setVer(mVersion);

end;

procedure TFormDevToolsMain.CreateChildForm(Sender: TObject);
var
    idx : integer;
    fm : TForm;
    tabname : string;
begin

    idx := TMenuItem(Sender).Tag;
    gFormFactory.CreateChildForm(idx, fm);
    if fm <> nil then
    begin
        fm.Show;
        fm.WindowState := wsMaximized;
        tabname := fm.Caption;
        idx := TabControl1.Tabs.AddObject(tabname, fm as TObject);
        tabcontrol1.TabIndex := idx;
    end;
    edTab.visible := false;
end;

procedure TFormDevToolsMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    CloseAllChildForm();
end;


procedure TFormDevToolsMain.actExitExecute(Sender: TObject);
begin
    close;
end;

procedure TFormDevToolsMain.actAboutExecute(Sender: TObject);
var
    about : TFormAbout;
begin
    about := TFormAbout.create(self);
    about.Caption := about.Caption + '[版本:'+ mVersion+']';
end;

function TFormDevToolsMain.GetVersionString(FileName: string): string;
var
     VerInfoSize: DWORD;
     VerInfo: Pointer;
     VerValueSize: DWORD;
     Dummy: DWORD;
     VerValue: PVSFixedFileInfo;
begin
     Result := '';
     VerInfoSize := GetFileVersionInfoSize(PChar(FileName), Dummy);
     if VerInfoSize = 0 then Exit;
     GetMem(VerInfo, VerInfoSize);
     GetFileVersionInfo(PChar(FileName), 0, VerInfoSize, VerInfo);
     VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
     Result := IntToStr(VerValue^.dwFileVersionMS shr 16) + '.' +
     IntToStr(VerValue^.dwFileVersionMS and $FFFF) + '.' +
     IntToStr(VerValue^.dwFileVersionLS shr 16) ;{+ '.' +
     IntToStr(VerValue^.dwFileVersionLS and $FFFF); }
     if( (VerValue^.dwFileVersionLS and $FFFF)>0 ) then
     begin
       Result := Result+' beta '+ IntToStr(VerValue^.dwFileVersionLS and $FFFF);
     end;
     FreeMem(VerInfo);
end;

procedure TFormDevToolsMain.InitFormFactory();
var
    i : integer;
    mnItem : TMenuItem;
begin
    for i:=0 to gFormFactory.GetFormCount-1 do
    begin
        mnItem := TMenuItem.Create(self);
        mnItem.Caption := gFormFactory.GetFormName(i);
        mnItem.OnClick := CreateChildForm;
        mnItem.Tag := i;
        mnTools.Add(mnItem);
    end;
end;

procedure TFormDevToolsMain.CloseAllChildForm();
var
    idx : integer;
begin
    for idx := MDIChildCount-1 downto 0 do
    begin
        MDIChildren[idx].Close;
    end;
end;

procedure TFormDevToolsMain.actUpdateExecute(Sender: TObject);
begin
    GetLastestVersionInfo();
    FormUpdate.setVersion(mVersion,mNewVersion,mNewVersionHint);
    FormUpdate.ShowModal;
end;

procedure TFormDevToolsMain.Timer1Timer(Sender: TObject);
begin
    //查新版本
    timer1.Enabled:=false;
    GetLastestVersionInfo();
    //timer1.Interval := 1800000; //
    //timer1.Enabled:=true;
end;
function TFormDevToolsMain.isNewVersion( newVer: string): boolean;
var
  newV : TStringList;
  currV : TStringList;
  beta : boolean;
  mv : string ;
begin
  if ( newVer='') then
  begin
    result := false;
    exit;
  end;
  //判断版本是不是比当前版本更新
  mv := StringReplace(mVersion,' ','.',[rfReplaceAll]);
  newv := split(newVer,'.');
  currV := split(mv,'.');
  if pos('beta',mv)>0 then
    beta := true
  else
    beta := false;

  result := false;
  if ( strtoint(newV[0])>strtoint(currV[0]) ) or (strtoint(newV[1])>strtoint(currV[1])) or (strtoint(newV[2])>strtoint(currV[2])) then
  begin
    result := true ;
  end
  else if ( (pos(newVer,mv)>0) and beta ) then //相同版本号的beta版本
  begin
    result := true;
  end;

  //result := newVer > mVersion;

  newv.Free;
  currV.Free;
end;

procedure TFormDevToolsMain.GetLastestVersionInfo();
var
    buf, newVer : string;

    i ,j:integer;
    httpver : TIdHTTP;
    testUrl : string;
begin
    try

        httpver := TIdHttp.create(nil);
        buf := httpver.Get(m_sVersionUrl+ '-DevTools_'+stringReplace(StringReplace(mVersion,'.','_',[rfReplaceAll]),' ','_',[rfReplaceAll]));

        //testUrl := 'http://10.1.0.195:8088/hdwiki/index.php?doc-view-513';
        //testUrl := 'http://10.1.0.195:81/';
        //buf := httpver.Get(testUrl);

        httpver.Disconnect;
        httpver.Free;
    except
        statusbar1.Panels[0].text := '查询新版本失败';
        exit;
    end;

    i:=Pos('LatestVersion:',buf);
    buf := midbstr( buf,i,50);
    i:=pos('[',buf);
    j:=pos(']',buf);
    newVer := copy(trim(copy(buf,i+1,j-i-1)),2,10);
    mNewVersion := newVer;
    mNewVersionHint := '';
    formVerup.Memo1.Lines.Append('最新版本:'+newVer);
    if(  isNewVersion(newVer) ) then
    begin
        statusBar1.Font.Color := clRed;

        statusBar1.Panels[0].Text := '发现新版本:'+newVer;
        statusBar1.Panels[1].Text := '点击下载新版本：' + newVer;
        formVerup.Memo1.Lines.Append('点击下载新版本：' + newVer);
        mNewVersionHint := newVer;
        
    end;

end;


procedure TFormDevToolsMain.idUdpSvrUDPRead(Sender: TObject;
  AData: TStream; ABinding: TIdSocketHandle);
var
  DataStringStream: TStringStream;
  buf,verfile,hint : string;
  verStr , client: tstrings;

begin
  verStr := TStringList.create;
  client := tstringList.create;
  DataStringStream := TStringStream.Create('');
  try
    verfile:=copy(Application.ExeName,1,length(Application.ExeName)-4) +'.txt';
    if(FileExists(verfile))then
    begin
        verStr.LoadFromFile(verfile);
        hint := verStr.Strings[0];
    end;

    //logfile:=copy(Application.ExeName,1,length(Application.ExeName)-4) +'.log';
    try
      DataStringStream.CopyFrom(AData, AData.Size);
      //logStr.Add(DataStringStream.DataString);
      //logStr.SaveToFile(logfile);
      client.clear;
      client.append(timetostr(time));
      client.append(abinding.peerip);
      client.append(DataStringStream.DataString);
      formVerup.updateSGClient(client);
      buf := 'ver='+mVersion+'$hint='+hint+'$'; //'ver['+g_sVersion+'] hint['+FormVerUp.cb_Hint.Text+']';
      ABinding.SendTo(ABinding.PeerIP, ABinding.PeerPort, buf[1], length(buf));
    except
      statusbar1.Panels[0].Text := '发送失败';
    end;
  finally
    verStr.Free;
    DataStringStream.Free;
    client.free;
  end;

end;

procedure TFormDevToolsMain.StatusBar1DblClick(Sender: TObject);
begin
//    formVerup.ShowModal;
end;

procedure TFormDevToolsMain.TabControl1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  tabRect: TRect;
begin
  if (ssDouble in Shift) and (ssLeft in Shift) then
  begin
    edTab.Text := TabControl1.Tabs.Strings[TabControl1.TabIndex];

    tabRect := tabcontrol1.TabRect(tabcontrol1.TabIndex) ;
    edTab.Left := tabRect.Left;
    edTab.Width := tabRect.Right-tabRect.Left;
    edTab.Top := tabRect.Top;
    edTab.Height := tabRect.Bottom-tabRect.Top;

    edTab.Visible := true;
    edTab.SetFocus();
    //edTab.SelectAll();
  end
  else 
  begin
    edTab.visible := false;
  end;

end;

procedure TFormDevToolsMain.edTabKeyPress(Sender: TObject; var Key: Char);
begin
if ( key = #13 ) then
begin
TabControl1.Tabs.Strings[TabControl1.TabIndex] := edTab.Text;
edTab.Visible := false;
end ;

end;

procedure TFormDevToolsMain.edTabExit(Sender: TObject);
begin
 edTab.Visible := false;
end;

procedure TFormDevToolsMain.StatusBar1Click(Sender: TObject);
begin
  if mNewVersionHint<>'' then
  begin
    ShellExecute(Self.Handle,'open',PChar(FormDevToolsMain.getVersionUrl()),nil,nil,SW_SHOWNORMAL);
  end;
end;

end.
