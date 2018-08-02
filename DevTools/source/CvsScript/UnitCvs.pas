unit UnitCvs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, CheckLst, inifiles,  ExtCtrls,
  UnitFormFactory, Menus,Clipbrd, ComCtrls,UnitBatch;

type
  TFormCvsTag = class(TForm)
    OpenDialog1: TOpenDialog;
    Panel1: TPanel;
    edFile: TEdit;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    Panel2: TPanel;
    cklBoxFile: TCheckListBox;
    SpeedButton2: TSpeedButton;
    Panel3: TPanel;
    OpenDialog2: TOpenDialog;
    PopupMenu1: TPopupMenu;
    C1: TMenuItem;
    cbSelectAll: TCheckBox;
    N1: TMenuItem;
    OpenDialog3: TOpenDialog;
    N2: TMenuItem;
    GroupBox1: TGroupBox;
    Button6: TButton;
    GroupBox2: TGroupBox;
    btnDo: TButton;
    abDel: TRadioButton;
    abCreate: TRadioButton;
    cbOverWrite: TCheckBox;
    cbCodePath: TComboBox;
    StaticText2: TStaticText;
    dtHis: TDateTimePicker;
    StaticText3: TStaticText;
    btnHis: TButton;
    GroupBox3: TGroupBox;
    BitBtn1: TBitBtn;
    btnLogin: TButton;
    ledPath: TLabeledEdit;
    SpeedButton3: TSpeedButton;
    ledCvsLocal: TLabeledEdit;
    SpeedButton4: TSpeedButton;
    GroupBox4: TGroupBox;
    MemoCvs: TMemo;
    StaticText1: TStaticText;
    cbShellSave: TCheckBox;
    btnMemo: TButton;
    lbTmSpan: TLabel;
    SaveDialog1: TSaveDialog;
    Panel4: TPanel;
    Button7: TButton;
    Button1: TButton;
    Button5: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    btnChkOut: TButton;
    btnUpdate: TButton;
    SpeedButton5: TSpeedButton;
    cbCvsSubDir: TComboBox;
    cbCvsDir: TComboBox;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    cbTag: TComboBox;
    labEditCvsName: TLabeledEdit;
    btnAutoDo: TButton;
    cbCvsRoot: TComboBox;
    StaticText6: TStaticText;
    procedure btnDoClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure abCreateClick(Sender: TObject);
    procedure abDelClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
//    procedure Timer1Timer(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure C1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure btnMemoClick(Sender: TObject);
    procedure MemoCvsKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton4Click(Sender: TObject);
    procedure cklBoxFileDblClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnHisClick(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure btnChkOutClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);


    procedure btnAutoDoClick(Sender: TObject);
    procedure cbCvsRootChange(Sender: TObject);
  private
    { Private declarations }
//    ReadOut,ReadIn   : THandle;
//    WriteOut,WriteIn   : THandle;
//    procedure InitConsole;
    FormCvsBatch : TFormCvsBatch;
    m_proj_max_count : integer ; //cvs��ǩ���� ,��Ŀ����Ŀ¼������������
    m_currTag : string; //��ǰTAG
    procedure loadFile(fileName:string);
    procedure saveIniFile();
    procedure loadIniFile();
    function isCvsHis(ts : TStringList): boolean;
    function isTag(str : string ): boolean;  //�����Ƿ�TAG��ǩ��
    procedure getCvsEnv(cmdstr :tstringlist);
    procedure execCvsScript(cmdstr :tstringlist);    
//    function  ReadFromPipe(Pipe: THandle): string;
 //   procedure WriteToPipe(Pipe: THandle; Value: string);
    function getCvsLogName():string;
    procedure dealTag(isAuto : boolean);
    procedure addNewTag(tag: string);
    procedure addCvsItems();
    procedure addNewItems(cb : TComboBox; txt : string=''); //��ӿؼ���ǰtext�����У���Ų����β
  public
    { Public declarations }
  end;

//-------------- �Ӵ��ڴ����߶��忪ʼ ---------------//
IFormCreator_CvsTag = class(TInterfacedObject, IFormCreator)
    function CreateForm():TForm;
end;
//------------ �Ӵ��ڴ����߶������ -----------//

implementation

uses  ShellApi,DateUtils,FileCtrl,
     RegExpr; // ����������ʽ�ؼ�

{$R *.dfm}
//-------------- �Ӵ��ڴ�����ʵ�ֿ�ʼ ---------------------//
function IFormCreator_CvsTag.CreateForm():TForm;
begin
    Result := TFormCvsTag.Create(nil);
end;
//-------------- �Ӵ��ڴ�����ʵ�ֽ��� ---------------------//
procedure TFormCvsTag.dealTag(isAuto : boolean);
var
  ts , cmdstr: tstringlist;
  j : integer;
  s,flag : string;
  tag, cvsroot,cvspath : string;

  bat_file,command,dir : string;

begin
      //��¼tag
      cvsroot := cbCvsRoot.Text;// ledcvsroot.text;
      cvspath := ledPath.text;
      if not isAuto then
      begin
        tag := cbTag.TEXT;
      end;

      cmdstr := tstringlist.create();
      cmdstr.Append('@set CVSROOT='+cvsroot);
      cmdstr.Append('@set PATH=%PATH%;'+ExtractFilePath(cvspath));
      ts := tstringlist.create();
      try
      if(abCreate.Checked and cbOverWrite.Checked) then
        flag := '-F'    // ������ͬ���ֱ�ǩ
      else if(abDel.Checked) then
        flag := '-d';   // ɾ����ǩ

      for j:=0 to cklBoxFile.Items.Count-1 do
      begin
        if isAuto and isTag(cklboxFile.Items[j]) then
        begin
          tag := m_currTag;
          cbTag.text := tag; //addNewTag(tag);
        end;
        if not cklboxfile.Checked[j] then
        begin
          continue;
        end;
        ts.Clear;
        ts.Delimiter := ' ';
        ts.DelimitedText := cklboxFile.Items[j];
        if(isCvsHis(ts)=false) then
        begin
          cklboxFile.Checked[j] := false;
          continue;
        end;

        if isAuto and (tag='') then
        begin
          showmessage('�ڴ����嵥֮ǰδ�ҵ���ǩ����,��ȷ�ϸ�ʽ��ȷ(����[TAG]BSC_54321_1_NAME). '#13#10'�Զ���������˳�!' );
          exit;
        end;
        
        // cvs rtag -r 1.2 -F BSC_1001_1_ABC Develop/Source/BSC/CCS/src/sc/abc.cpp
        s := 'cvs.exe rtag -r '+ts[5]+' '+flag+' '+tag+' '+ts[7]+'/'+ts[6];
        cmdstr.Append(s);

      end;
      // д��bat�ļ�,ִ��
      if (cbShellSave.Checked )  then
      begin
        dir := ExtractFilePath(edFile.Text);
      end
      else
      begin
        dir := ExtractFilePath(Application.ExeName);
      end;
      bat_file := dir+'cvs_script.bat';
      cmdstr.SaveToFile(bat_file);
      command := ' /C "'+bat_file+'"';
      ShellExecute(application.handle, 'open', 'cmd.exe', pansichar(command), pchar(ExtractFilePath(Application.ExeName)), SW_SHOWNA);

   finally
        ts.Free;
        cmdstr.free;
   end;
   addNewTag(tag);
end;
procedure TFormCvsTag.addNewTag(tag: string);
var
  s : string;
  idx : integer;
begin
  if tag='' then exit;
  addNewItems(cbTag);
end;

procedure TFormCvsTag.btnDoClick(Sender: TObject);
begin
  btnAutoDo.Enabled := false;
  btnDo.Enabled := false;
  dealTag(false);
  addCvsItems();

  btnAutoDo.Enabled := true;
  btnDo.Enabled := true;
end;

procedure TFormCvsTag.SpeedButton1Click(Sender: TObject);
var
  fileName : string;
  iniFile : string;
  myinifile : TiniFile;
begin
    //fileName := edFile.Text;
    if( edFile.Text <> '' )then OpenDialog1.FileName := edFile.Text;
    if OpenDialog1.Execute then
    begin
      edFile.Text := OpenDialog1.FileName;
      fileName := edFile.Text ;
      loadFIle(fileName);
      BTNDO.Enabled :=true;
      btnMemo.Enabled := true;
      //�����ļ���
      iniFile := copy(Application.ExeName,1,length(Application.ExeName)-4) +'.ini';
      myinifile:=Tinifile.create(iniFile);
      myIniFile.WriteString('BSSP_CVSTAG','FILE',fileName);
      myIniFile.Free;
    end;
end;

procedure TFormCvsTag.FormShow(Sender: TObject);
begin
  loadIniFile();
  dtHis.DateTime := Date;
end;

function TFormCvsTag.isCvsHis(ts : TStringList): boolean;
begin
  if (ts.count>=8) and (ts.count<=10)  then  // ��=10��Ϊ>=8, ����һЩ�嵥ĩβ2��������Ϣ��ɾ�����
  begin
    result := true;
  end
  else
  begin
    result := false;
  end;
end;
function TFormCvsTag.isTag(str : string): boolean;
var
    reg: TRegExpr;
    findStr : string;
begin
  result := false;
    reg :=  TRegExpr.create;
    m_currTag := '';
    try
      reg.Expression := '^\[TAG\](.*)';
      if reg.Exec(str) then
      begin
        m_currTag := stringreplace(reg.Match[1],' ', '',[]);
        if m_currTag <>'' then
        begin
          result := true;
        end;
      end;
    finally
      reg.Free;
    end;
end;

procedure TFormCvsTag.loadFile(fileName: string);
var
  ts : tstringlist;
  j : integer;
begin
   ts := tstringlist.create;
   cklboxfile.Clear;
   try
    cklboxfile.Items.LoadFromFile(filename);
    if(cbSelectAll.Checked) then
    begin
      for j:=0 to cklBoxFile.Items.Count-1 do
      begin
        ts.Clear;
        ts.Delimiter := ' ';
        ts.DelimitedText := cklboxFile.Items[j];
        if(isCvsHis(ts)) then
        begin
          cklboxFile.Checked[j] := true;
        end
        else
        begin
          cklboxFile.Checked[j] := false;
        end;
      end;
    end;
    finally
      ts.Free;
    end;
end;

procedure TFormCvsTag.SpeedButton2Click(Sender: TObject);
//var
//  iniFile : string;
//  myinifile : TiniFile;

begin
  if (edfile.Text <>'') then
  begin
   loadfile(edfile.text);
   btndo.Enabled := true;
   btnMemo.Enabled := true;
   //btnHis.Enabled := true;
  end;
//  timer1.Enabled := false;
end;

procedure TFormCvsTag.abCreateClick(Sender: TObject);
begin
    cbOverWrite.Enabled := true;
    cbOverWrite.Checked := true;
end;

procedure TFormCvsTag.abDelClick(Sender: TObject);
begin
    cbOverWrite.Checked := false;
    cbOverWrite.Enabled := false;

end;

procedure TFormCvsTag.Button3Click(Sender: TObject);
var
  j : integer;
begin
//ȫ��ѡ
      for j:=0 to cklBoxFile.Items.Count-1 do
      begin
          cklboxFile.Checked[j] := false;
      end;
end;

procedure TFormCvsTag.Button2Click(Sender: TObject);
var
  ts : tstringlist;
  j : integer;
begin
//ȫѡ
   ts := tstringlist.create;
   try
      for j:=0 to cklBoxFile.Items.Count-1 do
      begin
        ts.Clear;
        ts.Delimiter := ' ';
        ts.DelimitedText := cklboxFile.Items[j];
        if(isCvsHis(ts)) then
        begin
          cklboxFile.Checked[j] := true;
        end
        else
        begin
          cklboxFile.Checked[j] := false;
        end;
      end;
    finally
      ts.Free;
    end;
end;

procedure TFormCvsTag.Button4Click(Sender: TObject);
var
  ts : tstringlist;
  j : integer;
begin
//����ѡ��
   ts := tstringlist.create;
   try
      for j:=0 to cklBoxFile.Items.Count-1 do
      begin
        if cklboxFile.Checked[j] then
        begin
          cklboxFile.Checked[j] := false;
        end
        else
        begin
        ts.Clear;
        ts.Delimiter := ' ';
        ts.DelimitedText := cklboxFile.Items[j];

        if(isCvsHis(ts)) then
        begin
          cklboxFile.Checked[j] := true;
        end
        else
        begin
          cklboxFile.Checked[j] := false;
        end;
        end;
      end;
    finally
      ts.Free;
    end;

end;
 {
procedure TFormCvsTag.InitConsole;
var
    Security: TSecurityAttributes;
    start: TStartUpInfo;
    ProcessInfo: PROCESS_INFORMATION;
begin
    with Security do begin
      nlength := SizeOf(TSecurityAttributes);
      binherithandle := true;
      lpsecuritydescriptor := nil;
    end;

    Createpipe(ReadOut, WriteOut, @Security, 0);
    Createpipe(ReadIn, WriteIn, @Security, 0);

    with Security do begin
      nlength := SizeOf(TSecurityAttributes);
      binherithandle := true;
      lpsecuritydescriptor := nil;
    end;

    FillChar(Start, Sizeof(Start), #0);
    start.cb := SizeOf(start);
    start.hStdOutput := WriteOut;
    start.hStdInput := ReadIn;
    start.hStdError := WriteOut;
    start.dwFlags := STARTF_USESTDHANDLES +
      STARTF_USESHOWWINDOW;
    start.wShowWindow := SW_HIDE;

    CreateProcess(nil,
      PChar('cmd'),
      @Security,
      @Security,
      true,
      NORMAL_PRIORITY_CLASS,
      nil,
      nil,
      start,
      ProcessInfo);
end;


function TFormCvsTag.ReadFromPipe(Pipe: THandle): string;
const
 ReadBuffer = 2000;
var
    Buffer: PChar;
    BytesRead: DWord;
begin
    Result := '';
    if GetFileSize(Pipe, nil) = 0 then Exit;

    Buffer := AllocMem(ReadBuffer + 1);
    repeat
      BytesRead := 0;
      ReadFile(Pipe, Buffer[0],
        ReadBuffer, BytesRead, nil);
      if BytesRead > 0 then begin
        Buffer[BytesRead] := #0;
        OemToAnsi(Buffer, Buffer);
        Result := string(Buffer);
      end;
    until (BytesRead < ReadBuffer);
    FreeMem(Buffer);
end;

procedure TFormCvsTag.WriteToPipe(Pipe: THandle; Value: string);
var
    len: integer;
    BytesWrite: DWord;
    Buffer: PChar;
begin
    len := Length(Value) + 1;
    Buffer := PChar(Value + #10);
    WriteFile(Pipe, Buffer[0], len, BytesWrite, nil);
end;
}



//ע�Ṥ����
procedure TFormCvsTag.SpeedButton3Click(Sender: TObject);
//var
//  fileName : string;
//  iniFile : string;
//  myinifile : TiniFile;
begin
    OpenDialog2.FileName := ledPath.Text;
    if OpenDialog2.Execute then
    begin
      ledPath.Text := OpenDialog2.FileName;
    end;
end;

procedure TFormCvsTag.btnLoginClick(Sender: TObject);
var
  cmdstr : tstringlist;
//  j : integer;
//  flag : string;
   cvsroot,cvspath : string;
  bat_file,command,dir : string;
 // act : integer;
begin
   btnlogin.enabled := false;
      //��¼tag
      cvsroot := cbCvsRoot.text; //ledcvsroot.text;
      cvspath := ledPath.text;

      cmdstr := tstringlist.create();
   try
      cmdstr.Append('@set CVSROOT='+cvsroot);
      cmdstr.Append('@set PATH=%PATH%;'+ExtractFilePath(cvspath));
      cmdstr.Append('cvs login');
      cmdstr.Append('@pause');
      // д��bat�ļ�,ִ��
      if (cbShellSave.Checked )  then
      begin
        dir := ExtractFilePath(edFile.Text);
      end
      else
      begin
        dir := ExtractFilePath(Application.ExeName);
      end;
      bat_file := dir+'cvs_script.bat';
      cmdstr.SaveToFile(bat_file);
      //command := 'cmd.exe /C '+bat_file;
      //winexec(pchar(command),SW_SHOWNA );
      command := ' /C "'+bat_file+'"';
      ShellExecute(application.handle, 'open', 'cmd.exe', pansichar(command), pchar(ExtractFilePath(Application.ExeName)), SW_SHOWNA);

   finally
        cmdstr.free;
        btnlogin.enabled := true;
        //timer1.Enabled := false;
   end;
   getCvsLogName();
   addCvsItems();
end;

procedure TFormCvsTag.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    saveIniFile();
    action := caFree;
end;

procedure TFormCvsTag.C1Click(Sender: TObject);
var
  j :integer;
//  s : string;
begin
  for j:=0 to cklboxfile.Count-1 do
  begin
    if( cklboxfile.Selected[j] ) then
    begin
      Clipboard.Clear;
      Clipboard.AsText := cklboxfile.Items.Strings[j];
      break;
    end;
  end;
end;

procedure TFormCvsTag.N1Click(Sender: TObject);
var
  j :integer;
//  s : string;
begin
  for j:=0 to cklboxfile.Count-1 do
  begin
    if( cklboxfile.Selected[j] ) then
    begin
      //Clipboard.Clear;
      //Clipboard.AsText := cklboxfile.Items.Strings[j];
      cbTag.Text := cklboxfile.Items.Strings[j];
      break;
    end;
  end;
end;

procedure TFormCvsTag.btnMemoClick(Sender: TObject);
var
  ts , cmdstr: tstringlist;
  j : integer;
  s : string;
  cvsroot,cvspath,strmemo: string;
  dir : string;

  bat_file,command : string;

begin
      btnmemo.enabled := false;
      //��¼tag
      cvsroot := cbcvsroot.text;
      //tag := LEDtag.TEXT;
      cvspath := ledPath.text;

      cmdstr := tstringlist.create();
      cmdstr.Append('@set CVSROOT='+cvsroot);
      cmdstr.Append('@set PATH=%PATH%;'+ExtractFilePath(cvspath));
      cmdstr.Append('@setlocal EnableDelayedExpansion');
      cmdstr.Append('@set NewLine=^'+#13#10#13#10);

      ts := tstringlist.create();
      try
        //�л�����������·��
        s :=  copy(ledCvsLocal.text,1,1)+':';
        cmdstr.Append(s);
        dir := ledCvsLocal.Text;
        s := 'cd '+dir;
        cmdstr.append(s);

      for j:=0 to cklBoxFile.Items.Count-1 do
      begin
        if not cklboxfile.Checked[j] then
        begin
          continue
        end;
        ts.Clear;
        ts.Delimiter := ' ';
        ts.DelimitedText := cklboxFile.Items[j];
        if(isCvsHis(ts)) then
        begin
          // cvs admin -m1.2:a public_mgr.h
          strmemo := stringreplace(memocvs.text,#13#10,'!NewLine!',[rfReplaceAll]);
          //strmemo := memocvs.text;

          s := 'cvs.exe admin -m'+ts[5]+':"'+strmemo+'" '+ts[7]+'/'+ts[6];
          cmdstr.Append(s);
        end
        else
        begin
          cklboxFile.Checked[j] := false;
        end;
      end;
      // д��bat�ļ�,ִ��
      if (cbShellSave.Checked )  then
      begin
        dir := ExtractFilePath(edFile.Text);
      end
      else
      begin
        dir := ExtractFilePath(Application.ExeName);
      end;
      bat_file := dir+'cvs_script.bat';
      cmdstr.SaveToFile(bat_file);
      //command := 'cmd.exe /C '+bat_file;
      //winexec(pchar(command),SW_SHOWNA );
      command := ' /C "'+bat_file+'"';
      ShellExecute(application.handle, 'open', 'cmd.exe', pansichar(command), pchar(ExtractFilePath(Application.ExeName)), SW_SHOWNA);

   finally
        ts.Free;
        cmdstr.free;
        btnmemo.enabled := true;

   end;
   addCvsItems();

end;



procedure TFormCvsTag.MemoCvsKeyPress(Sender: TObject; var Key: Char);
begin
    if( key = #1 ) then
        TMemo(sender).SelectAll;

end;

procedure TFormCvsTag.SpeedButton4Click(Sender: TObject);
var
  dir : string;
begin
    dir := ledCvsLocal.Text;
    //if( SelectDirectory(dir, [sdAllowCreate, sdPerformCreate, sdPrompt], 0 ))then
    if( SelectDirectory('ѡ��Ҫ�����Ŀ¼:', '', dir))then
    begin
      ledCvsLocal.Text := dir;
    end;
end;
procedure TFormCvsTag.loadIniFile();
var
    myIniFile : TIniFile;
    iniFile : string;
    str : string;
    stm : tstringstream;
begin
      iniFile := copy(Application.ExeName,1,length(Application.ExeName)-4) +'.ini';
      myinifile:=Tinifile.create(iniFile);
      try
        edFile.Text := myIniFile.ReadString('BSSP_CVSTAG','FILE','');
        str := myIniFile.ReadString('BSSP_CVSTAG','TAG','');
        if str<>'' then
        begin
          str := StringReplace(str,'::',':',[rfReplaceAll]);
          str := trim(StringReplace(str,':',' ',[rfReplaceAll]));
          str := StringReplace(str,' ',#13#10,[rfReplaceAll]);
          stm := TStringStream.Create(str);
          cbTag.Items.LoadFromStream(stm);
          cbTag.ItemIndex := cbTag.Items.Count-1;
          stm.Free;
        end;
        //ledcvsroot.text
        str := myIniFile.ReadString('BSSP_CVSTAG','CVSROOT',':pserver:��½��@10.1.0.131:/home/cvsroot/BOSS1.5');
        if str<>'' then
        begin
          str := StringReplace(str,'::',':',[rfReplaceAll]);
          str := trim(StringReplace(str,';',' ',[rfReplaceAll]));
          str := StringReplace(str,' ',#13#10,[rfReplaceAll]);
          stm := TStringStream.Create(str);
          cbCvsRoot.Items.LoadFromStream(stm);
          cbCvsRoot.ItemIndex := cbCvsRoot.Items.Count-1;
          stm.Free;
        end;
        ledPath.text := myIniFile.ReadString('BSSP_CVSTAG','WINCVSPATH','c:\Program Files\WinCvs\cvsnt');
        str := myIniFile.ReadString('BSSP_CVSTAG','CVSMEMO','');
        str := StringReplace(str,'#13#10',#13#10,[rfReplaceAll]);
        memocvs.text := str;
        ledcvslocal.Text := myIniFile.ReadString('BSSP_CVSTAG','CVSLOCALPATH','D:\');
        cbSelectAll.Checked := myIniFile.ReadBool('BSSP_CVSTAG','SELECTALL',true);
        cbShellSave.Checked := myIniFile.ReadBool('BSSP_CVSTAG','SHELLSAVE',false);
        str := myIniFile.ReadString('BSSP_CVSTAG','CODEPATHLIST','');
        if str<>'' then
        begin
          str := StringReplace(str,'::',':',[rfReplaceAll]);
          str := trim(StringReplace(str,':',' ',[rfReplaceAll]));
          str := StringReplace(str,' ',#13#10,[rfReplaceAll]);
          stm := TStringStream.Create(str);
          cbCodePath.Items.LoadFromStream(stm);
          cbCodePath.ItemIndex := cbCodePath.Items.Count-1;
          stm.Free;
        end;

        //cvsĿ¼����Ŀ¼
        {
        str := myIniFile.ReadString('BSSP_CVSTAG','PROJ_DIR','Document/release');
        lbedtProjDir.Text := str;

        str := myIniFile.ReadString('BSSP_CVSTAG','PROJ_NAME','');
        edtProj.Text := str;
        }
        str := myIniFile.ReadString('BSSP_CVSTAG','PROJ_DIR_LIST','Document/release');
        if str<>'' then
        begin
          str := StringReplace(str,'::',':',[rfReplaceAll]);
          str := trim(StringReplace(str,':',' ',[rfReplaceAll]));
          str := StringReplace(str,' ',#13#10,[rfReplaceAll]);
          stm := TStringStream.Create(str);
          cbCvsDir.Items.LoadFromStream(stm);
          cbCvsDir.ItemIndex := cbCvsDir.Items.Count-1;
          stm.Free;
        end;

        str := myIniFile.ReadString('BSSP_CVSTAG','PROJ_NAME_LIST','');
        if str<>'' then
        begin
          str := StringReplace(str,'::',':',[rfReplaceAll]);
          str := trim(StringReplace(str,':',' ',[rfReplaceAll]));
          str := StringReplace(str,' ',#13#10,[rfReplaceAll]);
          stm := TStringStream.Create(str);
          cbCvsSubDir.Items.LoadFromStream(stm);
          cbCvsSubDir.ItemIndex := cbCvsSubDir.Items.Count-1;
          stm.Free;
        end;
        m_proj_max_count := myIniFile.ReadInteger('BSSP_CVSTAG','PROJ_MAX_COUNT',20);

        labEditCvsName.Text := myIniFile.ReadString('BSSP_CVSTAG','CVS_SOURCE_USER','');

      finally
        myIniFile.Free;
      end;
end;

procedure TFormCvsTag.saveIniFile();
var
  iniFile,str : string;
  myinifile : TiniFile;
begin
  try
      iniFile := copy(Application.ExeName,1,length(Application.ExeName)-4) +'.ini';
      myinifile:=Tinifile.create(iniFile);

      //myIniFile.WriteString('BSSP_CVSTAG','TAG',ledTag.text);
      str := StringReplace(cbTag.Items.GetText,#13#10,':',[rfReplaceAll]);
      myIniFile.WriteString('BSSP_CVSTAG','TAG',str);

      //myIniFile.WriteString('BSSP_CVSTAG','CVSROOT',ledcvsroot.text);
      str := StringReplace(cbCvsRoot.Items.GetText,#13#10,';',[rfReplaceAll]);
      myIniFile.WriteString('BSSP_CVSTAG','CVSROOT',str);

      myIniFile.WriteString('BSSP_CVSTAG','WINCVSPATH',ledPath.text);
      myIniFile.WriteBool('BSSP_CVSTAG','SHELLSAVE',cbShellSave.Checked);

      str := stringreplace(memocvs.text,#13#10,'#13#10',[rfReplaceAll]);
      myIniFile.WriteString('BSSP_CVSTAG','CVSMEMO',str);
      myIniFile.WriteString('BSSP_CVSTAG','CVSLOCALPATH',ledCvsLocal.Text);

      myIniFile.WriteString('BSSP_CVSTAG','FILE',edfile.text);
      myIniFile.WriteBool('BSSP_CVSTAG','SELECTALL',cbSelectAll.checked);

      str := StringReplace(cbCodePath.Items.GetText,#13#10,':',[rfReplaceAll]);
      myIniFile.WriteString('BSSP_CVSTAG','CODEPATHLIST',str);

      // cvsĿ¼����Ŀ¼�б�
      //str :=  lbedtProjDir.Text ;
      //myIniFile.WriteString('BSSP_CVSTAG','PROJ_DIR',str);

      //str := edtProj.Text;
      //myIniFile.WriteString('BSSP_CVSTAG','PROJ_NAME',str);
      str := StringReplace(cbCvsDir.Items.GetText,#13#10,':',[rfReplaceAll]);
      myIniFile.WriteString('BSSP_CVSTAG','PROJ_DIR_LIST',str);
      str := StringReplace(cbCvsSubDir.Items.GetText,#13#10,':',[rfReplaceAll]);
      myIniFile.WriteString('BSSP_CVSTAG','PROJ_NAME_LIST',str);

      str := StringReplace(labEditCvsName.Text,#13#10,':',[rfReplaceAll]);
      myIniFile.WriteString('BSSP_CVSTAG','CVS_SOURCE_USER',str);
  finally
      myIniFile.Free;
  end;
end;


procedure TFormCvsTag.cklBoxFileDblClick(Sender: TObject);
begin
        N1Click(Sender);
end;

procedure TFormCvsTag.N2Click(Sender: TObject);
var
  j :integer;
  s : string;
begin
  for j:=0 to cklboxfile.Count-1 do
  begin
    if( cklboxfile.Checked[j] ) then
    begin
      s := s+cklboxfile.Items.Strings[j]+#13#10;
    end;
  end;
  Clipboard.Clear;
  Clipboard.asText := s;
end;

procedure TFormCvsTag.Button1Click(Sender: TObject);
begin
  N2Click(Sender);
end;

procedure TFormCvsTag.BitBtn1Click(Sender: TObject);
begin
   showMessage('ʹ��˵��:'+#13#10
+'1)CVS��½:ֻ��Ҫ����һ�μ���(����ʹ��wincvs�����������,�������ٴε�½)'+#13#10
+'2)��ǩ����:����CVS�����嵥�еİ汾����,��ȷ�ϰ汾��ȷ'+#13#10
+'3)��ע����:��ѡ���ļ��ı�ע��Ϣ����Ϊָ������');
end;

function TFormCvsTag.getCvsLogName():string;
var
  p1 ,p2 : integer;
  rootString : string;
begin
  rootString := cbCvsRoot.Text;
    p1 := pos(':pserver:',rootString);
    p2 := pos('@',rootString);
    labEditCvsName.text := copy(rootString, p1+length(':pserver:'), p2-p1-length(':pserver:'));
    result := labEditCvsName.text;
end;


procedure TFormCvsTag.btnHisClick(Sender: TObject);
var
  ts , cmdstr: tstringlist;
//  j : integer;
  s : string;
  cvsroot,cvspath: string;
  dir : string;
  cvsname : string;
  bat_file,tmp_file,command : string;
  ShExecInfo : SHELLEXECUTEINFO  ;
  tm_begin,tm_end : TDateTime;
  tm_diff : Int64;
begin
    if cbCodePath.Text ='' then
    begin
        showMessage('������·��!');
        exit;
    end;

      btnmemo.enabled := false;
      //��¼tag
      cvsroot := cbcvsroot.text;
      //tag := LEDtag.TEXT;
      cvspath := ledPath.text;
      if labEditCvsName.Text = '' then
      begin
        getCvsLogName();
      end;
      cvsname := labEditCvsName.Text;
      cmdstr := tstringlist.create();
      cmdstr.Append('@set CVSROOT='+cvsroot);
      cmdstr.Append('@set PATH=%PATH%;'+ExtractFilePath(cvspath));
      cmdstr.Append('@setlocal EnableDelayedExpansion');
      cmdstr.Append('@set NewLine=^'+#13#10#13#10);

      //ts := tstringlist.create();
   try
      // д��bat�ļ�,ִ��
      if (cbShellSave.Checked )  then
      begin
        dir := ExtractFilePath(edFile.Text);
      end
      else
      begin
        dir := ExtractFilePath(Application.ExeName);
      end;
      bat_file := dir+'cvs_script.bat';
      tmp_file := 'cvs_his_tmp.txt';

      //cvs history -c -w -l -u huangwentao -D 2011-10-17 -p Develop/SourceCode/BSC/NG_CCS
      s := 'cvs.exe history -c -w -l -u '+cvsname+' -D '+FormatDateTime('yyyy-MM-dd',dtHis.date)+' -p '+cbCodePath.Text ;
      cmdstr.Append(s);
      cmdstr.SaveToFile(bat_file);

      //command := 'cmd.exe /C '+bat_file;
//      command := ' /C "'+bat_file+'" > "'+tmp_file+'"';

      command := ' /C "'+bat_file+'" > '+tmp_file;
      //showmessage(command);
      //ShellExecute(application.handle, 'open', 'cmd.exe', pansichar(command), pchar(ExtractFilePath(Application.ExeName)), SW_SHOWDEFAULT);
	// �����ȴ�
	ShExecInfo.cbSize := sizeof(SHELLEXECUTEINFO);
	ShExecInfo.fMask := SEE_MASK_NOCLOSEPROCESS;
	//ShExecInfo.hwnd := NIL;
	ShExecInfo.lpVerb := NIL;
	ShExecInfo.lpFile := 'cmd.exe';
	ShExecInfo.lpParameters := pansichar(command);
	ShExecInfo.lpDirectory := pchar(dir);
	ShExecInfo.nShow := SW_SHOW;
	ShExecInfo.hInstApp := application.handle;
	
	tm_begin := Time;
	
	ShellExecuteEx(@ShExecInfo);
	
	WaitForSingleObject(ShExecInfo.hProcess,INFINITE);
	//sleep(3000);
	tm_end := Time;
	tm_diff:= secondsBetween(tm_begin,tm_end);
	
	lbTmSpan.Caption := '��ȡ��ʱ:'+inttostr(tm_diff)+'��';

      loadfile(dir+tmp_file);

      //������µĵ�ַ�������ӵ��б�
      addNewItems(cbCodePath);
   finally
        //ts.Free;
        cmdstr.free;
        btnmemo.enabled := true;

   end;

end;

procedure TFormCvsTag.Button5Click(Sender: TObject);
begin
      ShellExecute(application.handle, 'explore', pansichar(ExtractFilePath(edFile.Text)), NIL, NIL, SW_SHOW);
end;

procedure TFormCvsTag.Button7Click(Sender: TObject);
var
  ts : tstringlist;
  j : integer;
  s,flag : string;
  tag, cvsroot,cvspath : string;

  file_name : string;

begin
  if savedialog1.Execute then
  begin
      ts := tstringlist.create();
      try
      for j:=0 to cklBoxFile.Items.Count-1 do
      begin
        if not cklboxfile.Checked[j] then
        begin
          continue
        end;
        ts.Append( cklBoxFile.Items.Strings[j] );

      end;
      // д���ļ�
      file_name := savedialog1.FileName;
      ts.SaveToFile(file_name);
      edFile.Text := file_name;
   finally
        ts.Free;
   end;
  end;
end;

procedure TFormCvsTag.btnChkOutClick(Sender: TObject);
var
  ts , cmdstr: tstringlist;
  j,idx : integer;
  s,flag : string;
  tag, cvsroot,cvspath : string;

  bat_file,command,dir : string;
  prjname : string;


  FUNCTION THRINK(const inStr : string):string;
  var
    outStr : string;
    reg: TRegExpr;
    projReg,replaceStr,findStr : TStringList;
    i : integer;
  begin
    outStr := trim(inStr);
    reg :=  TRegExpr.create;
    projReg := TStringList.Create;
    replaceStr := TStringList.create;
    findStr := TStringList.Create;

    // �ҳ�����  71234-1-�������� �����, �� -1- �滻Ϊ -- (ȥ������)
    projreg.Add('^(\d+)(-\d+-)(.*)');
    findStr.Add('2');   //��2��ƥ���Ϊ�滻��
    replaceStr.Add('--');

    // �ҳ�����  71234--��������  �����, ��ǰ��� -- �滻Ϊ -
    projreg.Add('^(\d+)(--)(.*)');
    findStr.Add('2');  //��2��ƥ���Ϊ�滻��
    replaceStr.Add('-');

    try
      for i :=0 to projreg.Count-1 do
      begin
        reg.Expression := projreg[i];

        while reg.Exec(outStr) do
        begin
          //showmessage();
          outStr := stringreplace(outStr, reg.Match[strtoint(findstr[i])], replaceStr[i],[]);

        end;

      end;
    finally
      reg.Free;
      projReg.Free;
      replaceStr.free;
      findStr.Free;
    end;
    //outStr := stringreplace(trim(inStr), '--','-',[rfReplaceAll]);
    result := outStr;
  end;

begin
    btnChkOut.enabled := false;
    //�����ĿĿ¼
    cmdstr := tstringlist.create();
    getCvsEnv(cmdstr);

    cvsroot := ledcvslocal.text;
    if (cbCvsSubDir.Text <> '[�б�]') then
    begin

    cbCvsSubDir.Text := trim(cbCvsSubDir.Text);
    try
        //cd D:\BOSS1.5\BOSS1.5CVS\
        s :=  copy(cvsroot,1,1)+':';
        cmdstr.Append(s);
        s := 'cd '+cvsroot;
        cmdstr.append(s);
        //cvs.exe checkout -P Document/release/48782-��������ccs.credit_charge�����ö����Ϣ������
        cbCvsSubDir.Text := THRINK(cbCvsSubDir.Text);
        s := 'cvs.exe checkout -P '+cbCvsDir.Text +'/"'+cbCvsSubDir.Text+'"';
        cmdstr.append( s );
      // д��bat�ļ�,ִ��
      execCvsScript(cmdstr);
   finally
        cmdstr.free;
        btnChkOut.enabled := true;
   end;
    end
    else
    begin
    try
      s :=  copy(cvsroot,1,1)+':';
      cmdstr.Append(s);
        //cd D:\BOSS1.5\BOSS1.5CVS\
      s := 'cd '+cvsroot;
      cmdstr.append(s);
      for idx := 0 to formcvsbatch.Memo1.Lines.Count do
      begin

        prjname := trim(formcvsbatch.Memo1.Lines.Strings[idx]); //stringreplace(trim(formcvsbatch.Memo1.Lines.Strings[idx]), '--','-',[rfReplaceAll]);
        if prjname = '' then break;
        //cvs.exe checkout -P Document/release/48782-��������ccs.credit_charge�����ö����Ϣ������
        s := 'cvs.exe checkout -P '+cbCvsDir.Text +'/"'+THRINK(prjname)+'"';
        cmdstr.append( s );
      end;
      // д��bat�ļ�,ִ��
      execCvsScript(cmdstr);
      finally
        cmdstr.free;
        btnChkOut.enabled := true;
    end;
    end;

    //������µ�Ŀ¼�������ӵ��б�, ���Ƹ�������20��
    addNewItems(cbCvsDir);
    if cbCvsDir.items.count>m_proj_max_count then cbCvsDir.Items.Delete(0);
    //������µ���Ŀ¼�������ӵ��б�, ���Ƹ�������20��
    addNewItems(cbCvsSubDir);
    if cbCvsSubDir.items.count>m_proj_max_count then cbCvsSubDir.Items.Delete(0);

    addCvsItems();

end;

procedure TFormCvsTag.getCvsEnv(cmdstr :tstringlist);
var
  cvsroot,cvspath : string;
begin
      cvsroot := cbcvsroot.text;
      cvspath := ledPath.text;

      cmdstr.Append('@set CVSROOT='+cvsroot);
      cmdstr.Append('@set PATH=%PATH%;'+ExtractFilePath(cvspath));
end;
procedure TFormCvsTag.execCvsScript(cmdstr :tstringlist);
var
  bat_file,command,dir : string;
begin
      // д��bat�ļ�,ִ��
      if (cbShellSave.Checked )  then
      begin
        dir := ExtractFilePath(edFile.Text);
      end
      else
      begin
        dir := ExtractFilePath(Application.ExeName);
      end;
      bat_file := dir+'cvs_script.bat';
      cmdstr.SaveToFile(bat_file);
      command := ' /C "'+bat_file+'"';
      ShellExecute(application.handle, 'open', 'cmd.exe', pansichar(command), pchar(ExtractFilePath(Application.ExeName)), SW_SHOWNA);

end;


procedure TFormCvsTag.btnUpdateClick(Sender: TObject);
var
  dir : string ;
begin
  dir := stringreplace(ledCvsLocal.Text+'\'+cbCvsDir.Text+'\'+cbCvsSubDir.text, '/','\',[rfReplaceAll]);
  dir := stringreplace(dir,'\\','\',[rfReplaceAll]);
  if FileExists(dir) then
  begin
        ShellExecute(handle,'open', pansichar(dir),  NIL, NIL, SW_SHOWNORMAL);
  end
  else if DirectoryExists(dir) then
  begin
        ShellExecute(application.handle, 'explore', pansichar(dir), NIL, NIL, SW_SHOW);
  end
  else
  begin
    showMessage('�ļ���Ŀ¼������:'+dir);
  end;
end;

procedure TFormCvsTag.SpeedButton5Click(Sender: TObject);
begin
  FormCvsBatch.ShowModal;
  //if formcvsbatch.Memo1.Lines.Count > 0 then edtproj.Text := '[�б�]';
  if formcvsbatch.Memo1.Lines.Count > 0 then cbCvsSubDir.Text := '[�б�]';
end;

procedure TFormCvsTag.FormCreate(Sender: TObject);
begin
FormCvsBatch := TFormCvsBatch.create(nil);
end;

procedure TFormCvsTag.FormDestroy(Sender: TObject);
begin
    FormCvsBatch.free;
end;

procedure TFormCvsTag.btnAutoDoClick(Sender: TObject);
begin
  //ʶ���嵥�ļ��� [TAG]��ͷ������Ϊtag��ǩ����,���������ļ���ǩ,ֱ��������һ��[TAG]
  btnAutoDo.Enabled := false;
  btnDo.Enabled := false;
  dealTag(true);
  addCvsItems();
  btnAutoDo.Enabled := true;
  btnDo.Enabled := true;
end;

procedure TFormCvsTag.addCvsItems();
begin
  addNewItems(cbCvsRoot);
end;

procedure TFormCvsTag.cbCvsRootChange(Sender: TObject);
begin
  getCvsLogName();
end;

procedure TFormCvsTag.addNewItems(cb : TComboBox; txt : string='');
var
  idx : integer;
begin
  if txt ='' then
    txt := trim(cb.Text);
  if txt='' then exit;
  if ( txt<>'' ) and (cb.Items.IndexOf(txt)=-1 ) then
  begin
    //������µ�·���������ӵ��б�
    cb.Items.Add(txt);
  end
  else
  begin
    //����Ѿ����ڣ��ŵ�ĩβ
    idx := cb.Items.IndexOf(txt);
    cb.Items.Delete(idx);
    cb.Items.Add(txt);
    cb.Text := txt;
  end;
end;

initialization
  /////////////ע�Ṥ����
  RegisteFormFactory('CVS��ǩ(&C)',IFormCreator_CvsTag.create);

end.
