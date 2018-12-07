unit BSC_config;

interface

uses
  Windows, Messages , SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, StrUtils, Grids,
  IdBaseComponent, IdComponent, ActiveX, ADODB, DB, IdTCPConnection,
  IdTCPClient, IdHTTP,  IdSocketHandle,
  IdStack, IdAntiFreezeBase, IdAntiFreeze, Spin,  SHDocVw, 
 BSC_script, BSC_sfdl, BSC_prefabsql, BSC_presqltmpl, BSC_version,
  BSC_SFDL_transaction, BSC_process_def, BSC_SFDL_process_step,
  BSC_SFDL_assign, BSC_SFDL_invoke, BSC_SFDL_desc, BSC_SFDL_for_each,
  BSC_SFDL_exception, BSC_SFDL_if_else,UnitFormFactory,
  iniFiles,  DBAccess, Ora, MemDS;

type
  TFormBsspCfgMain = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    bbtnShowScript: TBitBtn;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    Panel2: TPanel;
    sg_sqlin: TStringGrid;
    cb_empty: TComboBox;
    cb_paramtype: TComboBox;
    Panel3: TPanel;
    sg_sqlout: TStringGrid;
    sg_proc: TStringGrid;
    Panel4: TPanel;
    StaticText28: TStaticText;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn20: TBitBtn;
    BitBtn21: TBitBtn;
    cb_inout: TComboBox;
    cb_procopt: TComboBox;
    TabSheet4: TTabSheet;
    bbtnGetProcessParam: TBitBtn;
    StaticText47: TStaticText;
    ed_process_id: TEdit;
    Panel7: TPanel;
    StaticText50: TStaticText;
    IdAntiFreeze1: TIdAntiFreeze;
    StatusBar1: TStatusBar;
    Splitter2: TSplitter;
    Panel11: TPanel;
    StaticText45: TStaticText;
    ed_sql_id: TEdit;
    StaticText46: TStaticText;
    bbtnGetSqlParam: TBitBtn;
    StaticText79: TStaticText;
    BitBtn12: TBitBtn;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    Panel14: TPanel;
    StaticText80: TStaticText;
    BitBtn16: TBitBtn;
    BitBtn17: TBitBtn;
    BitBtn18: TBitBtn;
    BitBtn19: TBitBtn;
    sped_sql_seq: TSpinEdit;
    cbProcSvcStatus: TComboBox;
    IdHTTP1: TIdHTTP;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    EditProcessID: TEdit;
    bbtnGetProcess: TBitBtn;
    Label3: TLabel;
    EditProcessCode: TEdit;
    Label4: TLabel;
    EditProcShowName: TEdit;
    Label5: TLabel;
    CBProcGroupID: TComboBox;
    Label6: TLabel;
    CBProcType: TComboBox;
    Label7: TLabel;
    CBProcStatus: TComboBox;
    Label8: TLabel;
    EditCTime: TEdit;
    Label9: TLabel;
    EditMTime: TEdit;
    Label10: TLabel;
    EditProcDesc: TEdit;
    PButtonClick: TButton;
    GroupBox4: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label16: TLabel;
    EditProcessID2: TEdit;
    CBTxType: TComboBox;
    BitBtn6: TBitBtn;
    CBSyncMode: TComboBox;
    CBOpenTrace: TComboBox;
    CBInvokeMode: TComboBox;
    CBLinkURL: TComboBox;
    PButtonClick2: TButton;
    GroupBox5: TGroupBox;
    Panel8: TPanel;
    BitBtn28: TBitBtn;
    BitBtn29: TBitBtn;
    BitBtn30: TBitBtn;
    BitBtn32: TBitBtn;
    sgProcSvc: TStringGrid;
    Panel17: TPanel;
    GroupBox6: TGroupBox;
    sgSqlStat: TStringGrid;
    bbtSqlStat: TBitBtn;
    Panel15: TPanel;
    BitBtn5: TBitBtn;
    BitBtn26: TBitBtn;
    PrefabSqlStateButtom: TButton;
    GroupBox7: TGroupBox;
    Label21: TLabel;
    EditSqlID: TEdit;
    Label22: TLabel;
    EditSqlName: TEdit;
    Label23: TLabel;
    CBSqlGroupID: TComboBox;
    Label24: TLabel;
    CBSubSysID: TComboBox;
    Label25: TLabel;
    CBSqlType: TComboBox;
    Label26: TLabel;
    BitBtnOutTempl: TBitBtn;
    Label27: TLabel;
    EditCTimeSql: TEdit;
    Label28: TLabel;
    EditMTimeSql: TEdit;
    Label29: TLabel;
    EditDescSql: TEdit;
    PrefabSqlButtonClick: TButton;
    bbtnGetSql: TBitBtn;
    GroupBox8: TGroupBox;
    StaticText55: TStaticText;
    EditServiceId: TEdit;
    bbtnGetService: TBitBtn;
    StaticText62: TStaticText;
    EditSevTimeOut: TEdit;
    StaticText68: TStaticText;
    StaticText56: TStaticText;
    EditServiceName: TEdit;
    StaticText63: TStaticText;
    CBSevStatus: TComboBox;
    StaticText57: TStaticText;
    EditSevShowName: TEdit;
    StaticText64: TStaticText;
    EditSevCreateDate: TEdit;
    StaticText58: TStaticText;
    CBSevInvokeMode: TComboBox;
    StaticText65: TStaticText;
    EditSevBakCallName: TEdit;
    StaticText59: TStaticText;
    CBSevDataType: TComboBox;
    StaticText66: TStaticText;
    EditSevModifyDate: TEdit;
    StaticText60: TStaticText;
    CBSevGroupId: TComboBox;
    StaticText67: TStaticText;
    EditSevDesc: TEdit;
    StaticText29: TStaticText;
    CBSystemID: TComboBox;
    StaticText61: TStaticText;
    cbCallName: TComboBox;
    BitBtn10: TBitBtn;
    GroupBox9: TGroupBox;
    StaticText30: TStaticText;
    StaticText39: TStaticText;
    StaticText31: TStaticText;
    StaticText41: TStaticText;
    StaticText32: TStaticText;
    StaticText40: TStaticText;
    StaticText33: TStaticText;
    StaticText37: TStaticText;
    Panel18: TPanel;
    StaticText34: TStaticText;
    Memo_req: TMemo;
    Memo_resp: TMemo;
    StaticText35: TStaticText;
    Panel19: TPanel;
    GroupBox2: TGroupBox;
    StaticText42: TStaticText;
    CB_TNS_NAME: TComboBox;
    bbtnDbOpen: TBitBtn;
    bbtnDbClose: TBitBtn;
    GroupBox10: TGroupBox;
    StaticText1: TStaticText;
    EditBusinessId: TEdit;
    bbtnGetBiz: TBitBtn;
    StaticText2: TStaticText;
    EditBizShowName: TEdit;
    StaticText3: TStaticText;
    CBBizGroupId: TComboBox;
    StaticText4: TStaticText;
    ComBoxBizType: TComboBox;
    StaticText5: TStaticText;
    EditBizLifeCycle: TEdit;
    ComBoxBizStatus: TComboBox;
    StaticText6: TStaticText;
    StaticText7: TStaticText;
    EditBizInureDate: TEdit;
    EditBizExpireDate: TEdit;
    StaticText8: TStaticText;
    StaticText9: TStaticText;
    EditBizDesc: TEdit;
    BitBtn1: TBitBtn;
    Panel16: TPanel;
    GroupBox11: TGroupBox;
    sgBizRequest: TStringGrid;
    Panel10: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    cbRequestSource: TComboBox;
    ComBoxVerify: TComboBox;
    ComBoxBizReqStatus: TComboBox;
    cbRequestSource_name: TComboBox;
    GroupBox12: TGroupBox;
    Panel12: TPanel;
    BitBtn25: TBitBtn;
    BitBtn27: TBitBtn;
    BitBtn4: TBitBtn;
    sgBizProcess: TStringGrid;
    cb_biz_status: TComboBox;
    ed_user: TEdit;
    cb_prefix: TCheckBox;
    bbtnGetLinkUrl: TBitBtn;
    bbtnGetCallName: TBitBtn;
    AdoConn: TOraSession;
    AdoQuery1: TOraQuery;
    ledDbUser: TLabeledEdit;
    ledDbPass: TLabeledEdit;
    bBtnRefresh: TBitBtn;
    bbtnResult: TBitBtn;
    memo_Business: TMemo;
    StaticText10: TStaticText;
    ed_machine: TEdit;
    memo_service: TMemo;
    memo_process: TMemo;
    memo_dict: TMemo;
    ed_taskid: TEdit;
    StaticText11: TStaticText;
    StaticText12: TStaticText;
    cboxDbType: TComboBox;
    Label1: TLabel;
    cbFuzzy: TComboBox;


    procedure BitBtn1Click(Sender: TObject);
    procedure EditBusinessIdChange(Sender: TObject);
//    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure bbtnShowScriptClick(Sender: TObject);
    procedure PButtonClickClick(Sender: TObject);
    procedure PButtonClick2Click(Sender: TObject);
    procedure EditProcessIDChange(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure PrefabSqlButtonClickClick(Sender: TObject);
    procedure BitBtnOutTemplClick(Sender: TObject);
    procedure EditSqlIDChange(Sender: TObject);
    procedure PrefabSqlStateButtomClick(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure bbtnGetBizClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sg_sqlinSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure cb_emptyChange(Sender: TObject);
    procedure cb_paramtypeChange(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure sg_sqlinEnter(Sender: TObject);
    procedure sg_sqloutEnter(Sender: TObject);
    procedure sg_sqloutSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure sg_procSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure cb_inoutChange(Sender: TObject);
    procedure cb_procoptChange(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure BitBtn21Click(Sender: TObject);
    procedure bbtnDbOpenClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnGetServiceClick(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn23Click(Sender: TObject);
    procedure BitBtn22Click(Sender: TObject);
    procedure bBtnRefreshClick(Sender: TObject);
    procedure bbtnDbCloseClick(Sender: TObject);
    procedure bbtnGetSqlParamClick(Sender: TObject);
    procedure bbtnGetProcessParamClick(Sender: TObject);
    procedure bbtnGetProcessClick(Sender: TObject);
    procedure bbtnGetSqlClick(Sender: TObject);
    procedure CB_TNS_NAMEChange(Sender: TObject);
    procedure ADOConn_1AfterDisconnect(Sender: TObject);
    procedure ADOConn_1AfterConnect(Sender: TObject);
//    procedure IdUDPSvrUDPRead(Sender: TObject; AData: TStream;
//      ABinding: TIdSocketHandle);
//    procedure stextUpdateDblClick(Sender: TObject);
//    procedure Timer1Timer(Sender: TObject);
//    procedure BitBtn31Click(Sender: TObject);
//    procedure SpeedButton3Click(Sender: TObject);
//    procedure SpeedButton2Click(Sender: TObject);
//    procedure sbtnRespXmlClick(Sender: TObject);
//    procedure sbtnReqXmlClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbRequestSourceChange(Sender: TObject);
    procedure m_reqKeyPress(Sender: TObject; var Key: Char);
    procedure EditSevShowNameChange(Sender: TObject);
    procedure EditBizShowNameChange(Sender: TObject);
    procedure EditProcShowNameChange(Sender: TObject);
    procedure sgBizProcessSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure cb_biz_statusChange(Sender: TObject);
    procedure sgBizProcessRowMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure BitBtn25Click(Sender: TObject);
    procedure BitBtn27Click(Sender: TObject);
    procedure BitBtn30Click(Sender: TObject);
    procedure BitBtn28Click(Sender: TObject);
    procedure BitBtn29Click(Sender: TObject);
    procedure sgProcSvcRowMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure sg_procRowMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure sg_sqlinRowMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure sg_sqloutRowMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure sgSqlStatRowMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure sgProcSvcSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure cbProcSvcStatusChange(Sender: TObject);
    procedure BitBtn32Click(Sender: TObject);
    procedure sgSqlStatClick(Sender: TObject);
    procedure cb_prefixClick(Sender: TObject);
//    procedure btnBtchProcessClick(Sender: TObject);
//    procedure btnBthBusinessClick(Sender: TObject);
//    procedure btnBtchSqlClick(Sender: TObject);
//    procedure btnBtchServiceClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure sgSqlStatSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure bbtSqlStatClick(Sender: TObject);
    procedure BitBtn26Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure sgBizRequestSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sgBizRequestRowMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ComBoxVerifyChange(Sender: TObject);
    procedure ComBoxBizReqStatusChange(Sender: TObject);
    procedure bbtnGetCallNameClick(Sender: TObject);
    procedure bbtnGetLinkUrlClick(Sender: TObject);
    procedure enableDBbtn();
    procedure disableDBbtn();
    procedure bbtnResultClick(Sender: TObject);
    procedure cbFuzzyChange(Sender: TObject);
  private
    { Private declarations }
  FormScript : TFormScript;
  FormSfdl : TFormSfdl;
  FormPrefabSql : TFormPrefabSql;
  FormPreSqlOutTempl : TFormPreSqlOutTempl;
  FormVerUp : TFormVerUp;
  {
  sfdl_transaction : Tsfdl_transaction;
  sfdl_process_def : Tsfdl_process_def;
  sfdl_process_step : Tsfdl_process_step;
  sfdl_assign : Tsfdl_assign;
  sfdl_invoke : Tsfdl_invoke;
  sfdl_description : Tsfdl_description;
  sfdl_for_each : Tsfdl_for_each;
  sfdl_exception : Tsfdl_exception;
  }
    strCaption : string;
    m_sg : ^TStringGrid;
//    g_sVersion : string;
//    g_sHwtAddr1,g_sHwtAddr2 : string;
//    g_iHwtPort : integer;
    m_sProcTmpl : string;
    m_prefix_user :string;

    m_procGroupList : TStringList;

    procedure setSqlInParamDefault(arow : integer);
    procedure setSequence(sg : TStringGrid );
    procedure setSqlOutParamDefault(arow : integer);
    procedure setProcParamDefault(arow : integer);
    procedure setBizProcParamDefault(arow : integer);
    procedure setProcSvcParamDefault(arow : integer);
    procedure setSqlStatParamDefault(arow : integer);
    procedure setBizRequestDefault(arow : integer);
    procedure setBizId2SG(acol : integer; sysfunc_id:string;sg: TStringGrid);
    //����BSSP����
    //procedure SendCmd();
    function getProcSvc(var idx: integer; var service_id,svc_desc : string) : boolean;
    function getRefreshText(me : Tmemo) : string;
    function getPrefabSql(serviceString : string):string;
    function checkPrefabParam(grid: TStringGrid; inout : integer):boolean; //Ԥ�ò�ѯ�������ͼ��
    //ɾ���ַ����еĻس������Լ�ǰ��ո�
    function trim2(str : string ):string ;

  public
    { Public declarations }
//    procedure reqVersion();
  end;

//var
//  FormMain: TFormMain;
//-------------- �Ӵ��ڴ����߶��忪ʼ ---------------//
IFormCreator_BSSPCFG = class(TInterfacedObject, IFormCreator)
    function CreateForm():TForm;
end;
//------------ �Ӵ��ڴ����߶������ -----------//


implementation

uses UnitPublic;


{$R *.dfm}
//-------------- �Ӵ��ڴ�����ʵ�ֿ�ʼ ---------------------//
function IFormCreator_BSSPCFG.CreateForm():TForm;
begin
    Result := TFormBsspCfgMain.Create(nil);
end;
//-------------- �Ӵ��ڴ�����ʵ�ֽ��� ---------------------//


//////////////////////
function TFormBsspCfgMain.trim2(str : string ):string ;
begin
  result:=trim(AnsiReplaceText(str,#13#10,' '));
end;

function TFormBsspCfgMain.checkPrefabParam(grid: TStringGrid; inout : integer ) : boolean;
var
  i, data_type , data_len : integer;
  function checkpara(data_type,data_len : integer):boolean;
  begin
    result := true;
        if data_len<=0 then
        begin
          MessageDlg('�������ô���: ���ȱ������0!', mtError, [mbOK], 0);
          result := false;
          exit;
        end;

        case data_type of
        1:  // number����
        begin
          if data_len>9 then
          begin
            MessageDlg('�������ô���: number���͵ĳ��ȱ�����1~9֮��,������������ͻ򳤶�!', mtError, [mbOK], 0);
            result := false;
          end;
        end;
        2: // long����
        begin
          if data_len>18 then
          begin
            MessageDlg('�������ô���: long���͵ĳ��ȱ�����1~18֮��,������������ͻ򳤶�!', mtError, [mbOK], 0);
            result := false;
          end;
        end;
        3: // varchar2
        begin
          if data_len>4000 then
          begin
            MessageDlg('�������ô���: varchar2���͵ĳ��ȱ�����1~4000֮��,������������ͻ򳤶�!', mtError, [mbOK], 0);
            result := false;
          end;
        end;
        else
          //  else
        end; // case
      end;
begin
  result := true;
  if inout = 1 then    //�������
  begin
      for i:= 1 to grid.RowCount-1 do
      begin
        if grid.cells[3,i]='' then continue;
        data_type := strtoint(grid.cells[3,i]); //  --DATA_TYPE	�������ͣ�1��number��2��long��3��varchar2��9��in������10��like������'
        data_len := strtoInt(grid.cells[4,i]); // --DATA_LENGTH	�����������'
        result := checkpara(data_type,data_len) ;
        if result = false then
        begin
          grid.SetFocus;
          exit;
        end;
      end;
  end
  else    //�������
  begin
      for i:= 1 to grid.RowCount-1 do
      begin
        if grid.cells[4,i]='' then continue;
        data_type := strtoint(grid.cells[4,i]); //  --DATA_TYPE	�������ͣ�1��number��2��long��3��varchar2��9��in������10��like������'
        data_len := strtoInt(grid.cells[5,i]); // --DATA_LENGTH	�����������'
        result := checkpara(data_type,data_len) ;
        if result = false then
        begin
          grid.SetFocus;
          exit;
        end;
      end;
  end;

end;

procedure TFormBsspCfgMain.BitBtn1Click(Sender: TObject);
var
  sTmplBusiness:  string;
begin
    //1.ҵ����
    sTmplBusiness := '---------ҵ����-----------'
            +chr(13)+chr(10)
            +'--ҵ���� business_id='+EditBusinessId.Text
            +chr(13)+chr(10)
            +'DELETE FROM '+m_prefix_user+'bssp_business WHERE business_id='+EditBusinessId.Text+'; '
            +chr(13)+chr(10)
            + 'INSERT INTO '+m_prefix_user+'bssp_business(business_id, show_name,group_id, TYPE,lifecycle, status, inure_date, expire_date,create_date, modify_date, DESCRIPTION)'
            +chr(13)+chr(10)
            + 'VALUES('
            +chr(13)+chr(10)
            + EditBusinessId.Text+',                       --business_id ҵ���ʶ(��������ĵ�������д)'
            +chr(13)+chr(10)
            + ''''+trim2(EditBizShowName.Text)+''',                  --show_name ��ʾ����'
            +chr(13)+chr(10)
            + CBBizGroupId.Text+',                               --group_id �������ʶ BSSP_Business_Group �ж���'
            +chr(13)+chr(10)
            + inttostr(ComBoxBizType.ItemIndex+1) +',                                   --type ҵ������ 1 ����ҵ�� 2 ��ͨ��ѯ 3 �����ֵ��ѯ 4 Ԥ��SQL 5 ת����ѯ 6 �ļ�ҵ�� 7 ��¼'
            +chr(13)+chr(10)
            + ''''+trim2(EditBizLifeCycle.Text)+''',                         --lifecycle ��������(CRONTAB��ʽ)'
            +chr(13)+chr(10)
            + inttostr(ComBoxBizStatus.ItemIndex+1)+',                                   --status ״̬ 1	���� 2	ͣ�� 3	ע��'
            +chr(13)+chr(10)
            + 'to_date('''+trim2(EditBizInureDate.Text)+''',''yyyymmdd''),      --inure_date ��Чʱ��'
            +chr(13)+chr(10)
            + 'to_date('''+trim2(EditBizExpireDate.Text)+''',''yyyymmdd''),      --expire_date ʧЧʱ��'
            +chr(13)+chr(10)
            + 'SYSDATE,                             --create_date ����ʱ��'
            +chr(13)+chr(10)
            + 'NULL,                                --modify_date �޸�ʱ��'
            +chr(13)+chr(10)
            + ''''+trim2(EditBizDesc.Text)+'''             --description ����'
            +chr(13)+chr(10)
            + ');'
            +chr(13)+chr(10);

  FormScript.RichEditScript.Lines.Append(sTmplBusiness);
  //FormScript.Show;

end;
{
procedure TFormBsspCfgMain.BitBtn3Click(Sender: TObject);
var
   sTmplBizReq : string;
begin
    //2.ҵ��-������Դ��ϵ
    sTmplBizReq   := '--ҵ��-������Դ��ϵ'
            +chr(13)+chr(10)
            +'DELETE FROM '+m_prefix_user+'bssp_business_request_relation WHERE business_id='+EditBusinessId2.Text+' AND request_source='+cbRequestSource.text+';'
            +chr(13)+chr(10)
            +'INSERT INTO '+m_prefix_user+'bssp_business_request_relation( business_id, request_source, lifecycle, need_verify, status, inure_date, expire_date, create_date, modify_date, DESCRIPTION) '
            +chr(13)+chr(10)
            +'VALUES('
            +chr(13)+chr(10)
            +EditBusinessId2.Text+',                      --business_id ҵ���ʶ(��������ĵ�������д)'
            +chr(13)+chr(10)
            +cbRequestSource.text+',                             --request_source ������Դ BSSP_Request_Source �ж���:'+cbRequestSource.Hint
            +chr(13)+chr(10)
            +''''+EditBizReqLifeCycle.Text+''',                        --lifecycle ��������(CRONTAB��ʽ)'
            +chr(13)+chr(10)
            +inttostr(ComBoxVerify.ItemIndex)+',                                  --need_verify �Ƿ���Ҫ��ȫУ�� 0 ����Ҫ 1 ��Ҫ'
            +chr(13)+chr(10)
            +inttostr(ComBoxBizReqStatus.ItemIndex+1)+',                                  --status ״̬ 1	���� 2	ͣ�� 3	ע��'
            +chr(13)+chr(10)
            +' to_date('''+EditBizReqInureDate.Text+''',''yyyymmdd''),     --inure_date ��Чʱ��'
            +chr(13)+chr(10)
            +' to_date('''+EditBizReqExpireDate.Text+''',''yyyymmdd''),     --expire_date ʧЧʱ��'
            +chr(13)+chr(10)
            +'SYSDATE,                            --create_date ����ʱ��'
            +chr(13)+chr(10)
            +'NULL,                               --modify_date �޸�ʱ��'
            +chr(13)+chr(10)
            +'''' + EditBizReqDesc.Text +'''                  --description ����'
            +chr(13)+chr(10)
            +');'
            +chr(13)+chr(10);
  FormScript.RichEditScript.Lines.Append(sTmplBizReq);
  //FormScript.Show;

end;
}
procedure TFormBsspCfgMain.BitBtn4Click(Sender: TObject);
var
   sTmplBizProc : string;
   i : integer;
begin
    //3.ҵ��-���̹�ϵ
    sTmplBizProc  := '--ҵ��-���̹�ϵ'
            +chr(13)+chr(10)
            +'DELETE FROM '+m_prefix_user+'bssp_business_process_relation WHERE business_id='+sgBizProcess.cells[1,1]+';'
            +chr(13)+chr(10);
    with sgBizProcess do
    begin
    for i := 1 to RowCount-1 do
    begin
        if trim( cells[2,i])='' then continue;
            sTmplBizProc := sTmplBizProc + 'INSERT INTO '+m_prefix_user+'bssp_business_process_relation( business_id, process_id, seq, status, create_date, modify_date, DESCRIPTION)'
            +chr(13)+chr(10)
            +'VALUES('
            +chr(13)+chr(10)
            +cells[1,i]+',              --business_id ҵ���ʶ(��������ĵ�������д)'
            +chr(13)+chr(10)
            +cells[2,i] +',               --process_id ���̱�ʶ'
            +chr(13)+chr(10)
            +cells[0,i]+',                          --seq ִ�д���'
            +chr(13)+chr(10)
            +cells[3,i]+',                          --status ״̬ 1	���� 3	ע��'
            +chr(13)+chr(10)
            +'SYSDATE,                    --create_date ����ʱ��'
            +chr(13)+chr(10)
            +'NULL,                       --modify_date �޸�ʱ��'
            +chr(13)+chr(10)
            +''''+trim2(cells[4,i])+'''      --description ����'
            +chr(13)+chr(10)
            +');'
            +chr(13)+chr(10);
    end;
    end;
  FormScript.RichEditScript.Lines.Append(sTmplBizProc);
  //FormScript.Show;
end;

procedure TFormBsspCfgMain.EditBusinessIdChange(Sender: TObject);
begin
  //EditBusinessId2.Text := EditBusinessId.Text;
  //EditBusinessId3.Text := EditBusinessId.Text;
  setBizId2SG(1,editBusinessId.text,sgBizProcess);
  setBizId2SG(1,editBusinessId.text,sgBizRequest);
//  sgBizProcess.Cells[1,1] := EditBusinessId.Text;
//  sgBizRequest.Cells[1,1] := editBusinessId.Text;
end;

procedure TFormBsspCfgMain.bbtnShowScriptClick(Sender: TObject);
begin
    FormScript.Show;
end;

procedure TFormBsspCfgMain.PButtonClickClick(Sender: TObject);
var
    sTmplProcess : string;
    v_CBProcGroupID :string;
    v_idx : integer;
begin
    v_CBProcGroupID :=  copy( CBProcGroupID.Text,1,6);
    v_idx := m_procGroupList.indexof(v_CBProcGroupID);
    if (v_idx < 0 ) then
    begin
      if MessageDlg('BSSP������Ҫ�����·��ඨ��,�Ƿ�����?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        cbProcGroupID.SetFocus;
        cbProcGroupID.DroppedDown := true;
        exit;
      end;
    end;

      sTmplProcess := '------------���̶���-----------'
                      +chr(13)+chr(10)
                      +'--���̶���'
                      +chr(13)+chr(10)
                      +'DELETE FROM '+m_prefix_user+'bssp_process WHERE process_id = '+EditProcessID.Text+ ' and process_code in (''' + EditProcessCode.Text +''','''+EditProcessID.Text+''');'
                      +chr(13)+chr(10)
                      +'INSERT INTO '+m_prefix_user+'bssp_process (process_id,process_code,show_name,group_id,TYPE,status,create_date,modify_date,DESCRIPTION)'
                      +chr(13)+chr(10)
                      +'VALUES'
                      +chr(13)+chr(10)
                      +'('
                      +chr(13)+chr(10)
                      +EditProcessID.Text+',        --process_id,���̱�ʶ'
                      +chr(13)+chr(10)
                      +''''+trim2(EditProcessCode.Text)+''',        --process_code,���̱���'
                      +chr(13)+chr(10)
                      +''''+trim2(EditProcShowName.Text)+''',       --show_name,��ʾ����'
                      +chr(13)+chr(10)
                      +v_CBProcGroupID+',        --group_id,���̹������'
                      +chr(13)+chr(10)
                      +inttostr(CBProcType.ItemIndex+1)+',       --type,1����,2ת��(Ԥ��SQLʹ��)'
                      +chr(13)+chr(10)
                      +inttostr(CBProcStatus.ItemIndex+1)+',       --status ״̬ 1���� 2ͣ�� 3ע��'
                      +chr(13)+chr(10)
                      +EditCTime.Text+',        --create_time,����ʱ��'
                      +chr(13)+chr(10)
                      +EditMTime.Text+',        --modify_time,�޸�ʱ��'
                      +chr(13)+chr(10)
                      +''''+trim2(EditProcDesc.Text)+'''     --description,��������'
                      +chr(13)+chr(10)
                      +');'
                      +chr(13)+chr(10);

  FormScript.RichEditScript.Lines.Append(sTmplProcess);

end;

procedure TFormBsspCfgMain.PButtonClick2Click(Sender: TObject);
var
    str1 : string;
    sPrefix,tmpstr,pr_template : string;
    max_tmpl, i:integer;
begin
    sPrefix := m_prefix_user;
    max_tmpl := 32767;
            str1 := '--����ģ�嶨��'+#13#10+'DECLARE'
                    +chr(13)+chr(10)
                    +'  LOB 	CLOB;'
                    +chr(13)+chr(10)
                    +'  LOBVARCHAR	VARCHAR2('+inttostr(max_tmpl)+');'
                    +chr(13)+chr(10)
                    +'  LOBLENGTH	BINARY_INTEGER;'
                    +chr(13)+chr(10)
                    +'  POS 		BINARY_INTEGER;'
                    +chr(13)+chr(10)
                    +'  QUERY_STRING 	VARCHAR2(1000);'
                    +chr(13)+chr(10)
                    +'BEGIN'
                    +chr(13)+chr(10)
                            +'DELETE FROM '+sPrefix+'bssp_process_template WHERE process_id='+EditProcessID2.Text+';'
                            +chr(13)+chr(10)
                            +'INSERT INTO '+sPrefix+'bssp_process_template( process_id, tx_type, pr_template, sync_mode, link_url,open_trace, invoke_mode)'
                            +chr(13)+chr(10)
                            +'VALUES('
                            +chr(13)+chr(10)
                            +EditProcessID2.Text+',     --process_id '
                            +chr(13)+chr(10)
                            +inttostr( CBTxType.ItemIndex+1 )+',     --tx_type �������� 1 TE 2 TUXEDO 3 DB'
                            +chr(13)+chr(10)
                            +'empty_clob(),      --pr_template SFDL����Ĺ��̹���ģ��'
                            +chr(13)+chr(10)
                            +inttostr(CBSyncMode.ItemIndex+1)+',     --sync_mode ͬ��ģʽ 1 ͬ�� 2 �첽(������) 3 �첽(ȫ����)'
                            +chr(13)+chr(10)
                            +''''+trim2(CBLinkURL.Text)+''',      --link_url ����URL��ַ(ת��������)'
                            +chr(13)+chr(10)
                            +inttostr(CBOpenTrace.ItemIndex)+',     --open_trace �Ƿ����ˮ 0 ���� 1 ��'
                            +chr(13)+chr(10)
                            +inttostr(CBInvokeMode.ItemIndex+1)+'     --invoke_mode ����ģʽ(ת����) 1 Tuxedo 2 TE 3 HTTP 4 FCGI 5 DLL'
                            +chr(13)+chr(10)
                            +');'
                            +chr(13)+chr(10)
                            +chr(13)+chr(10)
                            +'QUERY_STRING :=''select pr_template from '+sPrefix+'bssp_process_template where process_id='+EditProcessID2.Text+' for update''; '
                            +chr(13)+chr(10) ;
                //�ָ����lobvarchar���޵Ľű�
                i := 1;
                //pr_template := trim2(FormSfdl.RichEditSfdl.Text)+' ';
                pr_template := AnsiReplaceText(AnsiReplaceText(trim(FormSfdl.RichEditSfdl.Text),#13#10,#10),#10,#13#10)+' ';
                while (true) do
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
                //�ָ����
                str1:=str1 +'END;'+#13#10+'/'+#13#10;

    FormScript.RichEditScript.Lines.Append(str1);

end;


procedure TFormBsspCfgMain.EditProcessIDChange(Sender: TObject);
begin
    EditProcessID2.Text := EditProcessID.text;
    //EditProcessID3.Text := EditProcessID.Text;
    //sg_proc.cells[1,1] := EditProcessID.text;
    setBizId2SG(1,EditProcessID.text,sg_proc);
    ed_process_id.text := EditProcessID.text;
end;

procedure TFormBsspCfgMain.BitBtn6Click(Sender: TObject);
begin
    FormSfdl.Show;
end;

procedure TFormBsspCfgMain.PrefabSqlButtonClickClick(Sender: TObject);
var
    sTmplPrefabSql : string;
begin
    sTmplPrefabSql := '---------------Ԥ��SQL-------------'
                      +chr(13)+chr(10)
                      +'--����prefab_sql��'
                      +chr(13)+chr(10)
                      +'DELETE FROM '+m_prefix_user+'bssp_prefab_sql WHERE sql_id='+EditSqlID.Text+' and sql_name=''' + EditSqlName.Text +''';'
                      +chr(13)+chr(10)
                      +'INSERT INTO '+m_prefix_user+'bssp_prefab_sql( SQL_ID, SQL_NAME, GROUP_ID, SUBSYSTEM_ID, SQL_TYPE, OUT_TEMPLATE, CREATE_DATE, MODIFY_DATE, DESCRIPTION, DB_TYPE ) '
                      +chr(13)+chr(10)
                      +'VALUES ('
                      +chr(13)+chr(10)
                      +EditSqlID.Text+',      --SQL_IDΨһȷ��Ԥ��SQL�ı�ʶ(��Ӧ�����������е�order_type)'
                      +chr(13)+chr(10)
                      +''''+trim2(EditSqlName.Text)+''',     --SQL_NAME��ʶ������õ�����(��Ӧҵ���������е�process_code)'
                      +chr(13)+chr(10)
                      +CBSqlGroupID.Text+',      --GROUP_ID��ʶSQL����������'
                      +chr(13)+chr(10)
                      +inttostr(CBSubSysID.ItemIndex)+',    --SUBSYSTEM_ID��ϵͳ��ʶ��1��Ӫҵ��2������3���Ʒ�	'
                      +chr(13)+chr(10)
                      +inttostr(CBSqlType.ItemIndex+1)+',   --SQL_TYPE	SQL������ͣ�1��select��2��update��3��delete��4��insert'
                      +chr(13)+chr(10)
                      +''''+ FormPreSqlOutTempl.MemoPreSqlTempl.Text+''','
                      +chr(13)+chr(10)
                      +'         --OUT_TEMPLATE	���ģ�� :1.1,:1.2;;<credit_level_info>:2.1,:2.2</credit_level_info>'
                      +chr(13)+chr(10)
                      +EditCTimeSql.Text+',     --CREATE_TIME ����ʱ��'
                      +chr(13)+chr(10)
                      +EditMTimeSql.Text+',      --MODIFY_DATE �޸�ʱ��'
                      +chr(13)+chr(10)
                      +''''+trim2(EditDescSql.Text)+''',   --DESCRIPTION ����'
                      +chr(13)+chr(10)
                      +inttostr(cboxDbType.ItemIndex)+'   --DB_TYPE ���ݿ��ʶ, 0 TT�ڴ��, 1 Oracle��, 2 ��TT��Oracle'
                      +chr(13)+chr(10)
                      +');'
                      +chr(13)+chr(10);

    FormScript.RichEditScript.Lines.Append(sTmplPrefabSql);
end;

procedure TFormBsspCfgMain.BitBtnOutTemplClick(Sender: TObject);
begin
    FormPreSqlOutTempl.show;
    FormPreSqlOutTempl.SetSqlOutSG(sg_sqlout);
end;

procedure TFormBsspCfgMain.EditSqlIDChange(Sender: TObject);
begin
//    EditSqlID2.text := EditSqlID.text;
//    sg_sqlin.cells[1,1] := editsqlid.Text;
//    sg_sqlout.cells[1,1] := editsqlid.text;
    ed_sql_id.text := editSqlID.text;
//    sgSqlStat.Cells[1,1] := editsqlid.text;
    setBizId2SG(1,editsqlid.Text,sg_sqlin);
    setBizId2SG(1,editsqlid.Text,sg_sqlout);
    setBizId2SG(1,editsqlid.Text,sgSqlStat);
end;

procedure TFormBsspCfgMain.PrefabSqlStateButtomClick(Sender: TObject);
var
  sSql : string;
  i : integer;
begin
  sSql := '--����prefab_sql_statement��'
                      +chr(13)+chr(10) ;
  FormScript.RichEditScript.Lines.Append(sSql);
  for i := 1 to sgSqlStat.rowcount-1 do
  begin
    if trim2(sgSqlStat.cells[2,i])='' then continue;
    sSql := '';
    with sgSqlStat do
    begin
        sSql := 'DELETE FROM '+m_prefix_user+'bssp_prefab_sql_statement WHERE sql_id= '+sgSqlStat.cells[1,i]+' AND statement_seq='+cells[0,i]+';'+#13#10;
        sSql := sSql+'INSERT INTO '+m_prefix_user+'bssp_prefab_sql_statement( SQL_ID, STATEMENT_SEQ, SQL_STATEMENT, TIMEOUT, MAX_ROWS, MAX_FILE_ROWS)'
                      +chr(13)+chr(10)
                      +'VALUES('
                      +chr(13)+chr(10)
                      +cells[1,i]+',      --SQL_ID'
                      +chr(13)+chr(10)
                      +cells[0,i]+',             --STATEMENT_SEQ	�����ţ�һ��sql_id���Զ�Ӧ����SQL��䡣'
                      +chr(13)+chr(10)
                      +''''+trim(AnsiReplaceText(cells[2,i],'''',''''''))+' '','    //���ֻس����з�
                      +chr(13)+chr(10)
                      +'                 --SQL_STATEMENT'
                      +chr(13)+chr(10)
                      +''''+cells[3,i]+''', -- TIMEOUT'
                      +chr(13)+chr(10)
                      +''''+cells[4,i]+''', -- MAX_ROWS'
                      +chr(13)+chr(10)
                      +''''+cells[5,i]+''' -- MAX_ROWS'
                      +chr(13)+chr(10)
                      +');'
                      +chr(13)+chr(10);
    end;
    FormScript.RichEditScript.Lines.Append(sSql);
  end;
{
  sSql := '';
  if( strtoint(EditStateSeq.Text) = 1 ) then
    sSql := '--����prefab_sql_statement��'
                      +chr(13)+chr(10)
                      +'DELETE FROM '+m_prefix_user+'bssp_prefab_sql_statement WHERE sql_id= '+EditSqlId2.Text+';' ;
  sSql := sSql +chr(13)+chr(10)
                      +'INSERT INTO '+m_prefix_user+'bssp_prefab_sql_statement( SQL_ID, STATEMENT_SEQ, SQL_STATEMENT, TIMEOUT)'
                      +chr(13)+chr(10)
                      +'VALUES('
                      +chr(13)+chr(10)
                      +EditSqlId2.Text+',      --SQL_ID'
                      +chr(13)+chr(10)
                      +EditStateSeq.Text+',             --STATEMENT_SEQ	�����ţ�һ��sql_id���Զ�Ӧ����SQL��䡣'
                      +chr(13)+chr(10)
                      +''''+AnsiReplaceText(FormPrefabSql.MemoSQL.Text,'''','''''')+' '','
                      +chr(13)+chr(10)
                      +'                 --SQL_STATEMENT'
                      +chr(13)+chr(10)
                      +''''+edSqlTimeout.Text+''''
                      +');'
                      +chr(13)+chr(10);
  FormScript.RichEditScript.Lines.Append(sSql);
  }
end;

procedure TFormBsspCfgMain.BitBtn8Click(Sender: TObject);
begin
//ĩβ��1��
    sg_proc.RowCount := sg_proc.RowCount + 1;
    sg_proc.Cells[0,sg_proc.RowCount-1] := inttostr(sg_proc.RowCount-1);
    //����ȱʡֵ
    setProcParamDefault(sg_proc.RowCount-1);
    //�������
    setSequence(sg_proc);


end;

procedure TFormBsspCfgMain.BitBtn9Click(Sender: TObject);
var
    i : integer;
begin
    with sg_proc do
    begin
        //��ѡ����֮ǰ����һ��
        RowCount := RowCount+1;
        for i:=RowCount-1 downto sg_proc.Row+1 do
        begin
            Rows[i] := Rows[i-1];
        end;
    end;
    //����ȱʡֵ
    setProcParamDefault(sg_proc.row);
    //sg_proc.cells[1,sg_proc.row] := sql_id;
    //�������
    setSequence(sg_proc);

end;

procedure TFormBsspCfgMain.BitBtn10Click(Sender: TObject);
var
  str : string;
  tempCallName : string;
begin
    if ( cbCallName.Items.IndexOf(trim2(cbCallName.Text))=-1 ) then
    begin
        cbCallName.Items.Add(trim2(cbCallName.Text));
    end;

  tempCallName := cbCallName.Text;
  
  str := '-------------������-----------'
                    +chr(13)+chr(10)
                    +'DELETE FROM '+m_prefix_user+'bssp_service WHERE service_id='+EditServiceId.Text+' and service_name in (''' +EditServiceId.Text+''','''+ EditServicename.Text +''');'
                    +chr(13)+chr(10)
                    +'INSERT INTO '+m_prefix_user+'bssp_service(service_id, service_name, show_name, invoke_mode, data_format, group_id, call_name, TIMEOUT, status, create_date, bak_call_name, modify_date, DESCRIPTION, system_id)'
                    +chr(13)+chr(10)
                    +'VALUES('
                    +chr(13)+chr(10)
                    +EditServiceId.Text+',          --service_id �����ʶ(��Ӧorder_type)'
                    +chr(13)+chr(10)
                    +''''+trim2(EditServicename.Text)+''',        --service_name	��������(������SFDL�еĶ���)'
                    +chr(13)+chr(10)
                    +''''+trim2(EditSevShowName.Text)+''',        --show_name ��ʾ����'
                    +chr(13)+chr(10)
                    +inttostr(CBSevInvokeMode.ItemIndex+1)+',         --invoke_mode ����ģʽ (1 Tuxedo 2 TE 3 HTTP 4 FCGI 5 DLL)'
                    +chr(13)+chr(10)
                    +inttostr(CBSevDataType.ItemIndex+1)+',            --data_format ���ݸ�ʽ (1 ������XML 2 ���ò�ѯ��XML 3 FML)'
                    +chr(13)+chr(10)
                    +CBSevGroupId.Text+',                    --group_id �������ʶ'
                    +chr(13)+chr(10)
                    +''''+trim2(tempCallName)+''',            --call_name ��������'
                    +chr(13)+chr(10)
                    +EditSevTimeOut.Text+',               --timeout ��ʱʱ��'
                    +chr(13)+chr(10)
                    +inttostr(CBSevStatus.ItemIndex+1)+',            --status ״̬ (1 ���� 3 ע��)'
                    +chr(13)+chr(10)
                    +EditSevCreateDate.Text+',                  --create_date ����ʱ��'
                    +chr(13)+chr(10)
                    +''''+trim2(EditSevBakCallName.Text)+''',          --bak_call_name ���ݵ�������'
                    +chr(13)+chr(10)
                    +EditSevModifyDate.Text+',                  --modify_date �޸�ʱ��'
                    +chr(13)+chr(10)
                    +''''+trim2(EditSevDesc.Text)+''','
                    +chr(13)+chr(10)
                    +'          --description	��ϸ����'
                    +chr(13)+chr(10)
                    +inttostr(CBSystemID.itemIndex+10)+' --��ϵͳ����'
                    +chr(13)+chr(10)
                    +');'
                    +chr(13)+chr(10);

  FormScript.RichEditScript.Lines.Append(str);
end;


procedure TFormBsspCfgMain.FormShow(Sender: TObject);
var
    iniFile : string;
    myinifile : TIniFile;
begin
//    g_sVersion := label_version.caption;
    {
    g_sHwtAddr1 := '10.1.1.68';
    g_sHwtAddr2 := '10.46.6.11';
    g_iHwtPort := 1054;
    //��udp����
    try
        if( GStack.LocalAddress = g_sHwtAddr1 )or( GStack.LocalAddress = g_sHwtAddr2 ) then
        begin

            idUdpSvr.Active := true;
            FormVerup.Memo1.Lines.Add('udp service bind [' +GStack.LocalAddress+':'+inttostr(g_iHwtPort)+'] ok!') ;
        end;
    except
        FormVerUp.Memo1.Lines.Add('udp service bind port '+inttostr(g_iHwtPort)+ ' fail!');
    end;
    }
//    stextUpdate.Caption := '��ǰ�汾: '+g_sVersion;


    Caption := 'BSC���� ';//+g_sVersion;
    sg_sqlin.Cells[0,0] := '�������';
    SG_SQLIN.Cells[1,0] := 'Ԥ��sql��ʶ';
    sg_sqlin.cells[2,0] := '������';
    sg_sqlin.cells[3,0] := '��������'; //--
    sg_sqlin.cells[4,0] := '���ݳ���';
    sg_sqlin.cells[5,0] := '��Ӧ�ֶ���';
    sg_sqlin.Cells[6,0] := '�ɷ�Ϊ��'; //--
    sg_sqlin.cells[7,0] := '����ʱ��';
    sg_sqlin.cells[8,0] := '�޸�ʱ��';
    sg_sqlin.cells[9,0] := '����';

    //����ȱʡֵ
    setSqlInParamDefault(1);

    with sg_sqlout do
    begin
        cells[0,0] := '�������';
        cells[1,0] := 'Ԥ��sql��ʶ';
        cells[2,0] := 'sql������';
        cells[3,0] := '������';
        cells[4,0] := '��������'; //--
        cells[5,0] := '���ݳ���';
        Cells[6,0] := '�ɷ�Ϊ��'; //--
        cells[7,0] := '����ʱ��';
        //cells[7,0] := '�޸�ʱ��';
        cells[8,0] := '����';
        cells[9,0] := '�ֵ�����'; //dict_type
        cells[10,0]:= '�ֵ����'; //dict_class
        cells[11,0]:= '�Ƿ�ת��'; //need_replace
        setSqlOutParamDefault(1); //ȱʡ����
    end;

    with sg_proc do
    begin
        cells[0,0] := '���';
        cells[1,0] := '���̱�ʶ';
        cells[2,0] := '��������';
        cells[3,0] := '���ڵ�����';
        cells[4,0] := '���ڵ��ʶ';
        cells[5,0] := '�������';    //--
        Cells[6,0] := '��ѡ��־'; //--
        cells[7,0] := '����';
        cells[8,0] := '�ֵ�����'; //dict_type
        cells[9,0] := '�ֵ����'; //dict_class

        setProcParamDefault(1); //ȱʡ����
    end;

    with sgBizProcess do
    begin
        cells[0,0] := 'ִ�д���';
        cells[1,0] := 'ҵ���ʶ';
        cells[2,0] := '���̱�ʶ';
        cells[3,0] := '״    ̬';
        cells[4,0] := '��    ��';
    end;
    setBizProcParamDefault(1);

    with sgProcSvc do
    begin
        cells[0,0] := '��  ��';
        cells[1,0] := '���̱�ʶ';
        cells[2,0] := '�����ʶ';
        cells[3,0] := '״  ̬';
        cells[4,0] := '��    ��';
    end;
    setProcSvcParamDefault(1);

    with sgBizRequest do
    begin
        cells[0,0] := '����';
        cells[1,0] := 'ҵ���ʶ';
        cells[2,0] := '������Դ';
        cells[3,0] := '��������';
        cells[4,0] := '��ȫУ��';
        cells[5,0] := '״̬';
        cells[6,0] := 'ģ����';
        cells[7,0] := '��Чʱ��';
        cells[8,0] := 'ʧЧʱ��';
        cells[9,0] := '����';
    end;
    setBizRequestDefault(1);

    with sgSqlStat do
    begin
        cells[0,0] := '��  ��';
        cells[1,0] := 'SQL��ʶ';
        cells[2,0] := 'SQL���';
        cells[3,0] := '��ʱʱ��';
        cells[4,0] := '��ѯ����¼��';
        cells[5,0] := '�ļ�����¼��';
    end;
    setSqlStatParamDefault(1);

    //ȡ�������ӵ�ַ
    iniFile := copy(Application.ExeName,1,length(Application.ExeName)-4) +'.link';
    if ( FileExists(iniFile) ) then
    begin
        cbCallName.Items.LoadFromFile(iniFile);
        cbCallName.ItemIndex := 0;

        cbLinkUrl.Items.LoadFromFile(iniFile);
        cbLinkUrl.ItemIndex := 0;
    end;

    //ȡ���ݿ�������
    iniFile := copy(Application.ExeName,1,length(Application.ExeName)-4) +'.tns2';
    if ( FileExists(iniFile) ) then
    begin
        cb_tns_name.Items.LoadFromFile(iniFile);
        cb_tns_name.ItemIndex := 0;
    end;

    //ȡ���Է����ַ
    {
    iniFile := copy(Application.ExeName,1,length(Application.ExeName)-4) +'.http';
    if ( FileExists(iniFile) ) then
    begin
        cb_http.Items.LoadFromFile(iniFile);
        cb_http.ItemIndex := 0;
    end;
    }
    //ȡbssp admin server�����ַ
    {
    iniFile := copy(Application.ExeName,1,length(Application.ExeName)-4) +'.svr';
    if ( FileExists(iniFile) ) then
    begin
        cb_server.Items.LoadFromFile(iniFile);
        cb_server.ItemIndex := 0;
    end;
    }

    // ȡbssp machine id
      iniFile := copy(Application.ExeName,1,length(Application.ExeName)-4) +'.ini';
      myinifile:=Tinifile.create(iniFile);
    ed_machine.Text := myIniFile.ReadString('BSSP_CONFIG','MACHINE_ID','');
      myIniFile.Free;

    cb_prefixClick(nil);
end;

procedure TFormBsspCfgMain.sg_sqlinSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin

    //m_acol := acol;
    //m_arow := arow;
    cb_empty.Hide;
    cb_paramtype.hide;
    case acol of
       3 : // ��������
       begin
        cb_paramtype.left := panel2.left + sg_sqlin.cellrect(acol,arow).left+1;
        cb_paramtype.top := panel2.top + sg_sqlin.top + sg_sqlin.cellrect(acol,arow).top+1;
        cb_paramtype.width := sg_sqlin.colwidths[acol];
        cb_paramtype.height := sg_sqlin.rowheights[arow];
        cb_paramtype.Text := sg_sqlin.cells[acol,arow];
        cb_paramtype.Show;
        cb_paramtype.SetFocus;
       end;
       6 : // �ɷ�Ϊ��
       begin
        cb_empty.Left := panel2.left + sg_sqlin.left + sg_sqlin.cellrect(acol,arow).Left+1;
        cb_empty.top := panel2.top + sg_sqlin.top + sg_sqlin.cellrect(acol,arow).top+1;
        cb_empty.width := sg_sqlin.colwidths[acol];
        cb_empty.height := sg_sqlin.rowheights[arow];
        cb_empty.Text := sg_sqlin.Cells[acol,arow];
        cb_empty.show;
        cb_empty.SetFocus;
       end;
    end;
end;

procedure TFormBsspCfgMain.BitBtn14Click(Sender: TObject);
var
    i : integer;
begin
//ɾ��ָ����
//�������²�������Ųһ�У�Ȼ��ɾ�����һ��
 //   if(m_arow<1) then m_arow:=1;
    if (sg_sqlin.row<1) then exit;

    for i:= sg_sqlin.row to sg_sqlin.RowCount-2 do
    begin
        sg_sqlin.Rows[i] := sg_sqlin.Rows[i+1];
    end;

    if sg_sqlin.RowCount > 2 then
    begin
        sg_sqlin.RowCount := sg_sqlin.RowCount - 1;
    end
    else
    begin
        //����ȱʡֵ
        setSqlInParamDefault(1);
    end;
    //�������
    setSequence(sg_sqlin);
    sg_sqlin.Refresh;
end;

//�����������ȱʡֵ
procedure TFormBsspCfgMain.setSqlInParamDefault(arow : integer);
begin
    with sg_sqlin do
    begin
        Rows[arow].Clear;
        cells[0,arow] := inttostr(arow);  //���
        cells[1,arow] := cells[1,1]; //sql��ʶ
        cells[6,arow] := '0'; //�ɷ�Ϊ�� 0 ��
        cells[7,arow] := 'SYSDATE'; //����ʱ��
        cells[8,arow] := 'NULL'; //�޸�ʱ��
    end;
end;

//�����������ȱʡֵ
procedure TFormBsspCfgMain.setSqlOutParamDefault(arow : integer);
begin
    with sg_sqlout do
    begin
        Rows[arow].Clear;
        cells[0,arow] := inttostr(arow); //���
        cells[1,arow] := cells[1,1]; //sql��ʶ
        cells[2,arow] := cells[2,1]; //sql���
        cells[6,arow] := '0'; //�ɷ�Ϊ�� 0 ��
        cells[7,arow] := 'SYSDATE'; //����ʱ��
        //cells[7,arow] := 'NULL'; //�޸�ʱ��
        cells[9,arow] := 'NULL'; //
        cells[10,arow]:= 'NULL'; //
        cells[11,arow]:= '0';//�Ƿ���Ҫת��
    end;
end;

//�����������ȱʡֵ
procedure TFormBsspCfgMain.setProcParamDefault(arow : integer);
begin
    with sg_proc do
    begin
        Rows[arow].Clear;
        cells[0,arow] := inttostr(arow); //���
        cells[1,arow] := cells[1,1]; //���̱�ʶ
        cells[3,arow] := cells[3,1]; //���ڵ�����
        cells[4,arow] := cells[4,1]; //���ڵ��ʶ
        cells[5,arow] := cells[5,1]; //�������
        cells[8,arow] := 'NULL'; //
        cells[9,arow]:= 'NULL'; //
    end;
end;

//�������
procedure TFormBsspCfgMain.setSequence(sg : TStringGrid );
var
    i : integer;
begin
    //�����������
    for i:= 1 to sg.RowCount-1 do
    begin
        sg.cells[0,i] := inttostr(i);
    end;
end;

procedure TFormBsspCfgMain.BitBtn12Click(Sender: TObject);
begin
//ĩβ��1��
    sg_sqlin.RowCount := sg_sqlin.RowCount + 1;
    sg_sqlin.Cells[0,sg_sqlin.RowCount-1] := inttostr(sg_sqlin.RowCount-1);
    //����ȱʡֵ
    setSqlInParamDefault(sg_sqlin.RowCount-1);
    //�������
    setSequence(sg_sqlin);
end;

//�����Ƿ�Ϊ�ղ���
procedure TFormBsspCfgMain.cb_emptyChange(Sender: TObject);
begin
    if( m_sg = nil ) then exit;
    if( m_sg^.col <1) or (m_sg^.row<1) then
    begin
        exit;
    end;
    m_sg^.Cells[m_sg^.col,m_sg^.row] := inttostr(cb_empty.ItemIndex);
end;

//���ò�������ֵ
procedure TFormBsspCfgMain.cb_paramtypeChange(Sender: TObject);
var
    val : integer;
begin
    if( m_sg = nil ) then exit;
    if( m_sg^.col <1) or (m_sg^.row<1) then exit;
 
    if( cb_paramtype.ItemIndex >=0 ) then
    begin
        if( cb_paramtype.ItemIndex = 3 ) then
            val := 9   //in����
        else if(cb_paramtype.ItemIndex = 4 ) then
            val := 10  //like����
        else
            val := cb_paramtype.ItemIndex+1;
        m_sg^.Cells[m_sg^.col,m_sg^.row] := inttostr(val);
    end
    else
        m_sg^.Cells[m_sg^.col,m_sg^.row] := '';
end;

procedure TFormBsspCfgMain.BitBtn13Click(Sender: TObject);
var
    i : integer;
    sql_id : string;
begin
    with sg_sqlin do
    begin
        //��ѡ����֮ǰ����һ��
        sql_id := Cells[1,1];
        RowCount := RowCount+1;
        for i:=RowCount-1 downto sg_sqlin.Row+1 do
        begin
            Rows[i] := Rows[i-1];
        end;
    end;
    //����ȱʡֵ
    setSqlInParamDefault(sg_sqlin.row);
    sg_sqlin.cells[1,sg_sqlin.row] := sql_id;
    //�������
    setSequence(sg_sqlin);

end;

procedure TFormBsspCfgMain.BitBtn15Click(Sender: TObject);
var
    i : integer;
    str : string;
begin
    if not checkPrefabParam(sg_sqlin,1) then exit;
    with sg_sqlin do
    begin
      str := '--����prefab_sql_in_param��'
                +chr(13)+chr(10)
                +'DELETE FROM '+m_prefix_user+'bssp_prefab_sql_in_param WHERE sql_id='+cells[1,1]+';';
      FormScript.RichEditScript.Lines.Append(str);
      for i:= 1 to RowCount-1 do
      begin
        str := chr(13)+chr(10)
                    +'INSERT INTO '+m_prefix_user+'bssp_prefab_sql_in_param(SQL_ID, SEQ, PARAM_NAME, DATA_TYPE, DATA_LENGTH, COLUMN_NAME, CAN_EMPTY, CREATE_DATE, MODIFY_DATE, DESCRIPTION )'
                    +chr(13)+chr(10)
                    +'VALUES('
                    +chr(13)+chr(10)
                    +cells[1,i]+',              --SQL_ID'
                    +chr(13)+chr(10)
                    +cells[0,i]+',              --SEQ ����������'
                    +chr(13)+chr(10)
                    +''''+trim2(cells[2,i])+''',  --PARAM_NAME	�������������������ֶ��������������е��������'
                    +chr(13)+chr(10)
                    +cells[3,i]+',               --DATA_TYPE	�������ͣ�1��number��2��long��3��varchar2��9��in������10��like������'
                    +chr(13)+chr(10)
                    +cells[4,i]+',               --DATA_LENGTH	�����������'
                    +chr(13)+chr(10)
                    +''''+trim2(cells[5,i])+''',      --COLUMN_NAME	�ֶ�������data_type��9��ʱ��ʹ�ã��������Ϳ��Բ��䣩'
                    +chr(13)+chr(10)
                    +cells[6,i]+',                --CAN_EMPTY	�ֶ��ܷ�Ϊ�գ�0���� 1���ǣ�'
                    +chr(13)+chr(10)
                    +cells[7,i]+',                --CREATE_DATE'
                    +chr(13)+chr(10)
                    +cells[8,i]+',                   --MODIFY_DATE'
                    +chr(13)+chr(10)
                    +''''+trim2(cells[9,i])+'''             --DESCRIPTION	 ����'
                    +chr(13)+chr(10)
                    +');'
                    +chr(13)+chr(10);

        FormScript.RichEditScript.Lines.Append(str);
      end;
    end;
end;

procedure TFormBsspCfgMain.sg_sqlinEnter(Sender: TObject);
begin
    m_sg := @sg_sqlin;
    //showmessage('sg_sqlin');
end;

procedure TFormBsspCfgMain.sg_sqloutEnter(Sender: TObject);
begin
    m_sg := @sg_sqlout;
end;

procedure TFormBsspCfgMain.sg_sqloutSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
 //   m_acol := acol;
 //   m_arow := arow;
    cb_empty.Hide;
    cb_paramtype.hide;
    case acol of
       4 : // ��������
       begin
        cb_paramtype.left := panel3.left + sg_sqlout.cellrect(acol,arow).left+1;
        cb_paramtype.top := panel3.top + sg_sqlout.top + sg_sqlout.cellrect(acol,arow).top+1;
        cb_paramtype.width := sg_sqlout.colwidths[acol];
        cb_paramtype.height := sg_sqlout.rowheights[arow];
        cb_paramtype.Text := sg_sqlout.cells[acol,arow];
        cb_paramtype.Show;
        cb_paramtype.SetFocus;
       end;
       6 : // �ɷ�Ϊ��
       begin
        cb_empty.Left := panel3.left + sg_sqlout.left + sg_sqlout.cellrect(acol,arow).Left+1;
        cb_empty.top := panel3.top + sg_sqlout.top + sg_sqlout.cellrect(acol,arow).top+1;
        cb_empty.width := sg_sqlout.colwidths[acol];
        cb_empty.height := sg_sqlout.rowheights[arow];
        cb_empty.Text := sg_sqlout.Cells[acol,arow];
        cb_empty.show;
        cb_empty.SetFocus;
       end;
    end;
end;

procedure TFormBsspCfgMain.BitBtn16Click(Sender: TObject);
begin
//ĩβ��1��
    sg_sqlout.RowCount := sg_sqlout.RowCount + 1;
    sg_sqlout.Cells[0,sg_sqlout.RowCount-1] := inttostr(sg_sqlout.RowCount-1);
    //����ȱʡֵ
    setSqlOutParamDefault(sg_sqlout.RowCount-1);
    //�������
    setSequence(sg_sqlout);
    sg_sqlout.cells[1,sg_sqlout.RowCount-1] := sg_sqlout.cells[1,1];
end;

procedure TFormBsspCfgMain.BitBtn17Click(Sender: TObject);
var
    i : integer;
    sql_id : string;
begin
    with sg_sqlout do
    begin
        //��ѡ����֮ǰ����һ��
//        if (m_arow > RowCount) or (m_arow < 1) then
  //          m_arow := 1;
        sql_id := Cells[1,1];
        RowCount := RowCount+1;
        for i:=RowCount-1 downto sg_sqlout.row+1 do
        begin
            Rows[i] := Rows[i-1];
        end;
    end;
    //����ȱʡֵ
    setSqlOutParamDefault(sg_sqlout.row);
    sg_sqlout.cells[1,sg_sqlout.row] := sql_id;
    //�������
    setSequence(sg_sqlout);

end;

procedure TFormBsspCfgMain.BitBtn18Click(Sender: TObject);
var
    i : integer;
begin
//ɾ��ָ����
//�������²�������Ųһ�У�Ȼ��ɾ�����һ��
    //if(m_arow<1) then m_arow:=1;
    for i:= sg_sqlout.row to sg_sqlout.RowCount-2 do
    begin
        sg_sqlout.Rows[i] := sg_sqlout.Rows[i+1];
    end;

    if sg_sqlout.RowCount > 2 then
    begin
        sg_sqlout.RowCount := sg_sqlout.RowCount - 1;
    end
    else
    begin
        //����ȱʡֵ
        setSqlOutParamDefault(1);
    end;
    //�������
    setSequence(sg_sqlout);
    //m_arow := m_arow-1;
    //if(m_arow<1) then m_arow:=1;
end;

procedure TFormBsspCfgMain.BitBtn19Click(Sender: TObject);
var
  str : string;
  i : integer;
begin
    if not checkPrefabParam(sg_sqlout,0) then exit;
    with sg_sqlout do
    begin
        str := '--����prefab_sql_out_param��'
                    +chr(13)+chr(10)
                    +'DELETE FROM '+m_prefix_user+'bssp_prefab_sql_out_param WHERE sql_id='+cells[1,1]+' and statement_seq='+cells[2,1]+';';
        FormScript.RichEditScript.Lines.Append(str);
        for i := 1 to sg_sqlout.RowCount-1 do
        begin
          str := chr(13)+chr(10)
                    +'INSERT INTO '+m_prefix_user+'bssp_prefab_sql_out_param(sql_id, statement_seq,param_seq,param_name, data_type, data_length, can_empty, create_date, modify_date, DESCRIPTION, dict_type, CLASS, need_replace)'
                    +chr(13)+chr(10)
                    +'VALUES('
                    +chr(13)+chr(10)
                    +cells[1,i]+',          --sql_id'
                    +chr(13)+chr(10)
                    +cells[2,i]+',                 --statement_seq ������'
                    +chr(13)+chr(10)
                    +cells[0,i]+',                 --param_seq ����������'
                    +chr(13)+chr(10)
                    +''''+trim2(cells[3,i])+''',         --param_name Ϊ���������Ӧ�����еĽڵ�����'
                    +chr(13)+chr(10)
                    +cells[4,i]+',                 --data_type �������ͣ�1��number��2��long��3��varchar2��'
                    +chr(13)+chr(10)
                    +cells[5,i]+',                --data_length ��������'
                    +chr(13)+chr(10)
                    +cells[6,i]+',                 --can_empty �ֶ��ܷ�Ϊ�գ�0���� 1���ǣ�'
                    +chr(13)+chr(10)
                    +cells[7,i]+',           --create_date'
                    +chr(13)+chr(10)
                    +'NULL,              --modify_date'
                    +chr(13)+chr(10)
                    +''''+trim2(cells[8,i])+''',      --description'
                    +chr(13)+chr(10)
                    +cells[9,i]+',              --dict_type'
                    +chr(13)+chr(10)
                    +cells[10,i]+',               --class  dict_type��class�ֱ�Ϊ�ֵ����ͺ��ֵ�������������ڷ����Ӧ�����������'
                    +chr(13)+chr(10)
                    +'                              --�������ã�����ͬ���ڵ�������param_name��"_name"�Ľڵ㣬�ڴ����������ķ���ֵ��'
                    +chr(13)+chr(10)
                    +''''+cells[11,i]+'''              --need_replace �Ƿ���Ҫ�Ը��ֶε����ݽ���ת��,0��NULL��������ת�� 1������ת�壬'
                    +chr(13)+chr(10)
                    +'                          --����ֶ�������Ҫת��,�����ֶ�������varchar2���������ɷ��ر���ʱ��CDATA�����ݰ�����'
                    +chr(13)+chr(10)
                    +');'
                    +chr(13)+chr(10);

            FormScript.RichEditScript.Lines.Append(str);
        end;
    end;
end;

procedure TFormBsspCfgMain.sg_procSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
//sg_proc.Cols[1].
    cb_inout.Hide;
    cb_procopt.hide;
    case acol of
       5 : // ��������
       begin
        cb_inout.left :=  sg_proc.cellrect(acol,arow).left+1;
        cb_inout.top :=  sg_proc.top + sg_proc.cellrect(acol,arow).top+1;
        cb_inout.width := sg_proc.colwidths[acol];
        cb_inout.height := sg_proc.rowheights[arow];
        cb_inout.Text := sg_proc.cells[acol,arow];
        cb_inout.Show;
        cb_inout.SetFocus;
       end;
       6 : // �ɷ�Ϊ��
       begin
        cb_procopt.Left :=  sg_proc.left + sg_proc.cellrect(acol,arow).Left+1;
        cb_procopt.top :=  sg_proc.top + sg_proc.cellrect(acol,arow).top+1;
        cb_procopt.width := sg_proc.colwidths[acol];
        cb_procopt.height := sg_proc.rowheights[arow];
        cb_procopt.Text := sg_proc.Cells[acol,arow];
        cb_procopt.show;
        cb_procopt.SetFocus;
       end;
    end;

end;

procedure TFormBsspCfgMain.cb_inoutChange(Sender: TObject);

begin
    if( sg_proc.col <1) or (sg_proc.row<1) then exit;
    if( cb_inout.ItemIndex >=0 ) then
    begin
        sg_proc.Cells[sg_proc.col,sg_proc.row] := inttostr(cb_inout.ItemIndex);
    end
    else
        sg_proc.Cells[sg_proc.col,sg_proc.row] := '';

end;

procedure TFormBsspCfgMain.cb_procoptChange(Sender: TObject);
begin
    if( sg_proc.col <1) or (sg_proc.row<1) then exit;
    if( cb_procopt.ItemIndex >=0 ) then
    begin
        sg_proc.Cells[sg_proc.col,sg_proc.row] := inttostr(cb_procopt.ItemIndex+1);
    end
    else
        sg_proc.Cells[sg_proc.col,sg_proc.row] := '';

end;



procedure TFormBsspCfgMain.BitBtn20Click(Sender: TObject);
var
    i : integer;
begin
//ɾ��ָ����
//�������²�������Ųһ�У�Ȼ��ɾ�����һ��
 //   if(m_arow<1) then m_arow:=1;
    if (sg_proc.row<1) then exit;

    for i:= sg_proc.row to sg_proc.RowCount-2 do
    begin
        sg_proc.Rows[i] := sg_proc.Rows[i+1];
    end;

    if sg_proc.RowCount > 2 then
    begin
        sg_proc.RowCount := sg_proc.RowCount - 1;
    end
    else
    begin
        //����ȱʡֵ
        setProcParamDefault(1);
    end;
    //�������
    setSequence(sg_proc);
    sg_proc.Refresh;

end;

procedure TFormBsspCfgMain.BitBtn21Click(Sender: TObject);
VAR
  str : string;
  i,j,k : integer;
  param_id : string;
  cnt : integer;
begin
    with sg_proc do
    begin
        str := '--���̲���'+chr(13)+chr(10)
                    +'DELETE FROM '+m_prefix_user+'bssp_process_param WHERE process_id='+cells[1,1]+';'
                    +chr(13)+chr(10);
        FormScript.RichEditScript.Lines.Append(str);

        for i:=1 to rowcount-1 do
        begin
            if trim2(cells[2,i])='' then continue;
            cnt := 3;
            k:=i;
            while(k div 10 > 0) do
            begin
                k:=k div 10;
                cnt:=cnt-1;  //���㲹0�ĸ���
            end;
            param_id:=cells[1,1];
            for j:= 1 to cnt do param_id:=param_id+'0';
            param_id:=param_id+IntToStr(i);   //������ʶ����: process_id+���(4λ,�����ǰ�油0)

            str :=  'INSERT INTO '+m_prefix_user+'bssp_process_param(process_param_id,process_id,param_name,parent_name,parent_param_id,inout_flag,option_flag,description,dict_type,CLASS)'
                    +chr(13)+chr(10)
                    +'VALUES('
                    +chr(13)+chr(10)
                    +param_id+',         --process_param_id ���̲�����ʶ'
                    +chr(13)+chr(10)
                    +cells[1,i]+',         --process_id ���̱�ʶ'
                    +chr(13)+chr(10)
                    +''''+trim2(cells[2,i])+''',          --param_name ��������'
                    +chr(13)+chr(10)
                    +''''+trim2(cells[3,i])+''',            --parent_name ���ڵ�����'
                    +chr(13)+chr(10)
                    +cells[4,i]+',            --parent_param_id ���ڵ��ʶ 0 Ϊ����'
                    +chr(13)+chr(10)
                    +cells[5,i]+',            --inout_flag ���������־ 0 ��� 1 ���� 2 �������'
                    +chr(13)+chr(10)
                    +cells[6,i]+',            --option_flag ��ѡ��־ 1--0...1; 2--1; 3--0...n; 4--1...n'
                    +chr(13)+chr(10)
                    +''''+trim2(cells[7,i])+''',         --DESCRIPTION ����'
                    +chr(13)+chr(10)
                    +cells[8,i]+',         --dict_type �����ֵ䷭��'
                    +chr(13)+chr(10)
                    +cells[9,i]+'         --CLASS �����ֵ䷭��'
                    +chr(13)+chr(10)
                    +');'
                    +chr(13)+chr(10);

            FormScript.RichEditScript.Lines.Append(str);
        end;
    end;
end;

procedure TFormBsspCfgMain.bbtnDbOpenClick(Sender: TObject);
begin
    if cb_tns_name.text = '' then
    begin
        showmessage('���ݿ�TNS���Ʋ���Ϊ��');
        exit;
    end;
    if not AdoConn.Connected then
    begin
      try
        //AdoConn.ConnectionString := 'Provider=OraOLEDB.Oracle.1;Persist Security Info=True;Data Source='+cb_tns_name.text;
        //AdoConn.ConnectionString := 'Provider=MSDAORA.1;Persist Security Info=True;Data Source='+cb_tns_name.text;

        //AdoConn.Open(CB_user.Text, CB_passwd.text);
        //adoConn.ConnectString := 'bssp/bssp@10.1.0.220:1521:kf';
        adoConn.ConnectString := ledDbUser.text + '/' + ledDbPass.text + '@' +cb_tns_name.Text;// 'bssp/bssp@10.1.0.220:1521:kf';
        adoConn.Open;
        bbtnGetBiz.Enabled := true;
        bbtnGetService.Enabled := true;
        if ( cb_TNS_Name.Items.IndexOf(cb_TNS_Name.Text)=-1 ) then
        begin
            cb_TNS_Name.Items.Add(cb_TNS_Name.Text);
        end;
      except
        on e : Exception do
        begin
          showmessage('�������ݿ�ʧ��'+#13#10+e.Message);
          bbtnDbOpen.enabled := true;
          enableDBbtn();
        end;
      end;
    end;

end;

procedure TFormBsspCfgMain.FormClose(Sender: TObject; var Action: TCloseAction);
var
    iniFile : string;
  myinifile : TiniFile;
begin


//    if idUdpSvr.Active then idUdpSvr.Active := false;
    try
    if AdoConn.Connected then
        AdoConn.Close;
    except
    end;

    //����������ӵ�ַ
    iniFile := copy(Application.ExeName,1,length(Application.ExeName)-4) +'.link';
    cbCallName.Items.SaveToFile(iniFile);

    //�������ݿ�������
    iniFile := copy(Application.ExeName,1,length(Application.ExeName)-4) +'.tns2';
    cb_tns_name.Items.SaveToFile(iniFile);

    //������Է����ַ
    {
    iniFile := copy(Application.ExeName,1,length(Application.ExeName)-4) +'.http';
    cb_http.Items.SaveToFile(iniFile);
    }
    //����bssp admin server��ַ
    {
    iniFile := copy(Application.ExeName,1,length(Application.ExeName)-4) +'.svr';
    cb_server.Items.SaveToFile(iniFile);
    }
    // ����bssp machine id
      iniFile := copy(Application.ExeName,1,length(Application.ExeName)-4) +'.ini';
      myinifile:=Tinifile.create(iniFile);
      myIniFile.WriteString('BSSP_CONFIG','MACHINE_ID',ED_MACHINE.Text);
      myIniFile.Free;

    action := caFree;
end;
procedure TFormBsspCfgMain.bbtnGetBizClick(Sender: TObject);
var
    i : integer;
begin
    if trim2(EditBusinessId.text)='' then
    begin
        showmessage('������ҵ���ʶ');
        editbusinessid.SetFocus;
        exit;
    end;
    editbizshowName.Text := '';
    //bssp_business
    AdoQuery1.SQL.Clear;
    AdoQuery1.SQL.Add('select a.*,to_char(a.inure_date,''yyyymmdd'') inure_dt, to_char(a.expire_date,''yyyymmdd'') expire_dt ');
    AdoQuery1.sql.append(' from bssp_business a where business_id=' + EditBusinessId.Text );
    AdoQuery1.Open;
    if not AdoQuery1.Eof then
    begin
        editbizshowName.Text := AdoQuery1.FieldByName('show_name').AsString;
        cbbizgroupid.Text := AdoQuery1.FieldByName('group_id').AsString;
        comboxBizType.ItemIndex := AdoQuery1.FieldByName('type').asInteger-1;
        editBizLifeCycle.Text := AdoQuery1.FieldByName('lifecycle').AsString;
        comboxbizstatus.ItemIndex := AdoQuery1.FieldByName('status').asInteger-1;
        editbizinuredate.Text := AdoQuery1.fieldByName('inure_dt').asstring;
        editbizexpiredate.Text := AdoQuery1.fieldByname('expire_dt').asstring;
        editbizdesc.Text := AdoQuery1.fieldbyname('description').asstring;
    end
    else
    begin
        //showMessage('bssp_business����Ӧ��¼');
        statusbar1.Panels[1].Text :='bssp_business����Ӧ��¼';
    end;
    AdoQuery1.Close;
    Application.ProcessMessages;

    //bssp_business_request_relation
    sgBizRequest.RowCount := 2;
    setBizRequestDefault(1);
    AdoQuery1.SQL.Clear;
    AdoQuery1.SQL.Add('select a.*,to_char(a.inure_date,''yyyymmdd'') inure_dt, to_char(a.expire_date,''yyyymmdd'') expire_dt ');
    AdoQuery1.SQL.Append(' from bssp_business_request_relation a where business_id=' + EditBusinessId.Text );
    AdoQuery1.Open;

    while not AdoQuery1.Eof do
    begin
        i := sgBizRequest.RowCount-1;
        sgBizRequest.Rows[i].Text:='';
        sgBizRequest.Cells[0,i] := intToStr(i);
        sgBizRequest.cells[1,i] := AdoQuery1.FieldByName('business_id').AsString;
        sgBizRequest.cells[2,i] := AdoQuery1.FieldByName('request_source').AsString;
        sgBizRequest.cells[3,i] := AdoQuery1.FieldByName('lifecycle').asString;
        sgBizRequest.cells[4,i] := AdoQuery1.FieldByName('need_verify').AsString;
        sgBizRequest.cells[5,i] := AdoQuery1.FieldByName('status').asString;
        sgBizRequest.Cells[6,i] := AdoQuery1.FieldByName('need_fuzzy').asString;
        if (sgBizRequest.Cells[6,i]='') then sgBizRequest.Cells[6,i]:='0';
        sgBizRequest.cells[7,i] := AdoQuery1.fieldByName('inure_dt').asstring;
        sgBizRequest.cells[8,i] := AdoQuery1.fieldByname('expire_dt').asstring;
        sgBizRequest.cells[9,i] := AdoQuery1.fieldbyname('description').asstring;

{
        cbrequestsource.Text := AdoQuery1.FieldByName('request_source').AsString;
        cbrequestsource.hint := '';
        editBizreqLifeCycle.Text := AdoQuery1.FieldByName('lifecycle').AsString;
        comboxverify.itemIndex := AdoQuery1.FieldByName('need_verify').asInteger;
        editBizLifeCycle.Text := AdoQuery1.FieldByName('lifecycle').AsString;
        comboxbizreqstatus.ItemIndex := AdoQuery1.FieldByName('status').asInteger-1;
        editbizreqinuredate.Text := AdoQuery1.fieldByName('inure_dt').asstring;
        editbizreqexpiredate.Text := AdoQuery1.fieldByname('expire_dt').asstring;
        editbizreqdesc.Text := AdoQuery1.fieldbyname('description').asstring;
}
        adoQuery1.Next;
        if( not AdoQuery1.Eof ) then
            sgBizRequest.RowCount := sgBizRequest.RowCount+1;
    end ;

    AdoQuery1.Close;
    Application.ProcessMessages;

    //bssp_business_process_relation    (���ǿ����ж�����¼��)
    AdoQuery1.SQL.Clear;
    AdoQuery1.SQL.Add('select a.* ');
    AdoQuery1.SQL.Append(' from bssp_business_process_relation a where business_id=' + EditBusinessId.Text );
    AdoQuery1.Sql.Append(' order by seq' );
    AdoQuery1.Open;
    sgBizProcess.RowCount := 2;
    setBizProcParamDefault(1);
    if( not AdoQuery1.Eof ) then
    begin
      while not AdoQuery1.Eof do
      begin

        i := sgBizProcess.RowCount-1;
        sgBizProcess.Rows[i].Text:='';
        sgBizProcess.Cells[0,i] := intToStr(i);
        sgBizProcess.Cells[1,i] := AdoQuery1.fieldbyname('business_id').asString;
        sgBizProcess.Cells[2,i] := AdoQuery1.fieldbyName('process_id').asString;
        sgBizProcess.Cells[3,i] := AdoQuery1.fieldbyName('status').asString;
        sgBizProcess.Cells[4,i] := AdoQuery1.fieldbyName('description').asString;
        Application.ProcessMessages;
        AdoQuery1.Next;
        if( not AdoQuery1.Eof ) then
            sgBizProcess.RowCount := sgBizProcess.RowCount+1;
{
        editBizprocid.Text := AdoQuery1.FieldByName('process_id').AsString;
        editbizprocseq.TExt := AdoQuery1.FieldByName('seq').asString;
        comboxbizprocstatus.itemIndex := AdoQuery1.FieldByName('status').asInteger-1;
        editbizprocdesc.Text := AdoQuery1.fieldbyname('description').asstring;
}
      end;
    end
    else
    begin
        //showMessage('bssp_business_process_relation����Ӧ��¼');
        statusbar1.Panels[1].text :='bssp_business_process_relation����Ӧ��¼';
    end;

    AdoQuery1.Close;

end;


procedure TFormBsspCfgMain.bbtnGetServiceClick(Sender: TObject);
var
    v_serviceId, v_serviceName : string;
begin
    if ((trim2(EditserviceId.text)='') and (trim2(EditServiceName.Text) = '')) then
    begin
        showmessage('����������ʶ���������');
        editserviceid.SetFocus;
        exit;
    end;
    v_serviceId := trim2(EditserviceId.text);
    v_serviceName := trim2(EditServiceName.Text);

    editsevshowname.Text :='';
    //bssp_service
    AdoQuery1.Close;
    AdoQuery1.SQL.Clear;
    AdoQuery1.SQL.add('select a.* ');
    if( v_serviceId <> '' ) then
    begin
        AdoQuery1.SQL.append(' from bssp_service a where service_id=' + v_serviceId );
        EditServiceName.Text := '';
    end
    else
    begin
        AdoQuery1.SQL.append(' from bssp_service a where service_name=''' + v_serviceName +'''');
    end;

    try
        AdoQuery1.Open;
        if not AdoQuery1.Eof then
        begin
            editserviceid.text := AdoQuery1.fieldByname('service_id').asString;
            editservicename.Text := AdoQuery1.fieldbyname('service_name').asString;
            editsevshowname.Text := AdoQuery1.fieldbyname('show_name').asstring;
            cbsevinvokemode.itemIndex := AdoQuery1.fieldbyname('invoke_mode').asInteger-1;
            cbsevdatatype.itemIndex := AdoQuery1.fieldbyname('data_format').asInteger-1;
            cbsevgroupid.text := AdoQuery1.fieldbyname('group_id').asstring;
            cbcallname.text := AdoQuery1.fieldbyname('call_name').asstring;
            editsevtimeout.text := AdoQuery1.fieldbyname('timeout').asstring;
            cbsevstatus.itemIndex := AdoQuery1.fieldbyname('status').asInteger-1;
            editsevbakcallname.text := AdoQuery1.fieldbyname('bak_call_name').asstring;
            editsevdesc.text := AdoQuery1.fieldbyname('description').AsString;
            cbsystemid.itemIndex := AdoQuery1.fieldbyname('system_id').asInteger-10;
        end
        else
        begin
            //showMessage('bssp_service��û�м�¼');
            statusbar1.Panels[1].Text :=  'bssp_service��û�м�¼';
        end;
    finally
        AdoQuery1.Close;
    end;

end;

procedure TFormBsspCfgMain.BitBtn11Click(Sender: TObject);
begin
{
    MEMO_req.Text := '<?xml version="1.0" encoding="iso-8859-1"?><cmd><operator_id>999</operator_id>'
            +'<business_id>'+cb_business.text+'</business_id>'
            +'<cmd_type>1</cmd_type></cmd>';
    SendCmd();
    if ( cb_business.Items.IndexOf(cb_business.Text)=-1 ) then
    begin
        cb_business.Items.Add(cb_business.Text);
    end;
}
end;

procedure TFormBsspCfgMain.BitBtn23Click(Sender: TObject);
begin
{
    memo_req.Text := '<?xml version="1.0" encoding="iso-8859-1"?><cmd><operator_id>999</operator_id>'
        +'<process_id>'+cb_process.text+'</process_id>'
        +'<cmd_type>6</cmd_type></cmd>';
    SendCmd();
    if ( cb_process.Items.IndexOf(cb_process.Text)=-1 ) then
    begin
        cb_process.Items.Add(cb_process.Text);
    end;
    }
end;

 {procedure TFormBsspCfgMain.SendCmd();
//var
 // resp : TStringStream;
 // req : TStrings;
begin

    //����BSSP����,����ʾ���ؽ��
    req := TStringList.Create;
    resp := TStringStream.Create('');
    try
        try
            memo_resp.Clear;
            req.Add(memo_req.text);
            Application.ProcessMessages;
            IdHTTP1.Post(cb_server.Text, req, resp);
            memo_resp.text := resp.DataString;

            //������µĵ�ַ�������ӵ��б�
           if ( cb_server.Items.IndexOf(trim2(cb_server.Text))=-1 ) then
          begin
               cb_server.Items.Add(trim2(cb_server.Text));
          end;

        except
            memo_resp.text := '����ʧ��';
        end;
    finally
        req.Free;
        resp.Free;
        Application.HandleMessage;
    end;
    
end;
}
procedure TFormBsspCfgMain.BitBtn22Click(Sender: TObject);
begin
{
    memo_req.Text := '<?xml version="1.0" encoding="iso-8859-1"?><cmd><operator_id>999</operator_id>'
        +'<service_id>'+cb_service.text+'</service_id>'
        +'<cmd_type>9</cmd_type></cmd>';
    SendCmd();
    if ( cb_service.Items.IndexOf(cb_service.Text)=-1 ) then
    begin
        cb_service.Items.Add(cb_service.Text);
    end;
   }
end;

function TFormBsspCfgMain.getRefreshText(me : Tmemo):string;
var
  outstr : string;
begin

  outstr := AnsiReplaceText(trim2(me.Lines.Text),' ', ',');
  result := outstr;
end;

function TFormBsspCfgMain.getPrefabSql(serviceString : string):string;
var
  outstr : string;
  instr : string;
begin
    instr := ''''+AnsiReplaceText('0,'+serviceString, ',' , ''',''')+'''';
    AdoQuery1.SQL.Clear;
    AdoQuery1.SQL.Add('select sql_id from bssp_prefab_sql where sql_name in (' + instr + ')' );
    AdoQuery1.Open;
    outstr := '';
    while not AdoQuery1.Eof do
    begin
        if outstr <> '' then outstr := outstr +',';
        outstr := outstr +  AdoQuery1.FieldByName('sql_id').AsString;
        AdoQuery1.Next;
    end;
    AdoQuery1.close;
  result := outstr;
end;


procedure TFormBsspCfgMain.bBtnRefreshClick(Sender: TObject);
var
  business,process,service,dict,presql : string;
  cmdstr,cmdsql : string;
begin
{
    memo_req.Text := '<?xml version="1.0" encoding="iso-8859-1"?><cmd><operator_id>999</operator_id>'
        +'<dict_type>'+cb_dict_type.Text+'</dict_type>'
        +'<dict_class>'+cb_dict_class.text+'</dict_class>'
        +'<cmd_type>12</cmd_type></cmd>';
    SendCmd();
    if ( cb_dict_type.Items.IndexOf(cb_dict_type.Text)=-1 ) then
    begin
        cb_dict_type.Items.Add(cb_dict_type.Text);
    end;
    if ( cb_dict_class.Items.IndexOf(cb_dict_class.Text)=-1 ) then
    begin
        cb_dict_class.Items.Add(cb_dict_class.Text);
    end;
}
{
declare
  v_machine number(6);
  v_context varchar2(4000);
begin
  v_context := 'process=(BM_DoubleCardBackupSGL)'; 
-- ������������µ����� business=(ҵ���ʶ1��ҵ���ʶ2��),process=(��������1����������2����),service=(������1��������2����),dict=(dict_id, dict_id, ��)  
--dict_id ��ʽΪ DICT_TYPE + '.' + CLASS

  v_machine := 992; --- �������������ò��� bssp_machine ����
insert into bssp.bssp_batch_load_trigger(task_id,machine_id,load_context,status,modify_time)
values( bssp_admin_seq.nextval, v_machine, v_context,1,sysdate);

commit;
end;

}
{ 2013-2-22 ��Ϊ����ˢ��
Mem_Business

Mem_Process
Mem_Process_Param

Mem_Service
Mem_Service_Param
Mem_Presql
Mem_Presql_St
Mem_Presql_In_P
Mem_Presql_Out_P
Mem_Presql_Group_P

Mem_Dict_Def

Mem_Service_Host
Mem_Service_Route
Mem_Process_Route

}
    if (trim2(memo_business.Lines.Text )='') and
       (trim2(memo_process.lines.Text)='') and
       (trim2(memo_service.Lines.Text)='') and
       (trim2(memo_dict.Lines.Text)='') then
    begin
        showmessage('��������Ҫˢ�µ�����');
        exit;
    end;
    //bssp_business
    business := getRefreshText(memo_business);
    process  := getRefreshText(memo_process);
    service  := getRefreshText(memo_service);
    presql   := getPrefabSql(service);
    dict     := getRefreshText(memo_dict);


    cmdstr := '';
    if(business <>'')then
    begin
      cmdstr :=  'Mem_Business=(' + business + ')';
    end;
    if(process <>'')then
    begin
      if cmdstr <>'' then cmdstr := cmdstr + ',' ;
      cmdstr :=  cmdstr+'Mem_Process=(' + process + '),Mem_Process_Param=('+ process +')';
    end;
    if(service <>'')then
    begin
      if cmdstr <>'' then cmdstr := cmdstr + ','  ;
      cmdstr :=  cmdstr+'Mem_Service=(' + service + ')';
      if presql <> '0' then
        cmdstr := cmdstr+',Mem_Presql=(' +presql+'),Mem_Presql_St=('+presql+'),Mem_Presql_In_P=('+presql+'),Mem_Presql_Out_P=('+presql+')';
    end;
    if(dict <>'')then
    begin
      if cmdstr <>'' then cmdstr := cmdstr + ',' ;
      cmdstr :=  cmdstr+'Mem_Dict_Def=(' + dict + ')';
    end;

    cmdstr := AnsiReplaceText(cmdstr, ',,', ',');

    if cmdstr='' then
    begin
        showmessage('��������Ҫˢ�µ�����');
        exit;
    end;


    AdoQuery1.SQL.Clear;
    AdoQuery1.SQL.Add('select bssp_admin_seq.nextval task_id from dual');
    AdoQuery1.Open;
    if not AdoQuery1.Eof then
    begin
        ed_taskid.Text := AdoQuery1.FieldByName('task_id').AsString;
    end;
    AdoQuery1.close;

    cmdsql := 'insert into BSSP_mem_LOAD_TRIGGER(task_id,machine_id,load_context,status,modify_time)';
    cmdsql := cmdsql + ' values( '+ed_taskid.Text+', '+ed_machine.Text+', '''+cmdstr+''',1,sysdate)';

    memo_req.Lines.clear;
    memo_req.Lines.Add(cmdsql);

    AdoQuery1.SQL.Clear;
    AdoQuery1.sql.Add(cmdsql);
    AdoQuery1.ExecSQL;
    AdoQuery1.close;

end;

procedure TFormBsspCfgMain.bbtnDbCloseClick(Sender: TObject);
begin
  try
    if AdoConn.Connected then
    begin
        AdoConn.Close;
    end;
  except
    enableDBbtn();
  end;
end;

procedure TFormBsspCfgMain.bbtnGetSqlParamClick(Sender: TObject);
var
    i : integer;
begin
    if trim2(ed_sql_id.text)='' then
    begin
        showmessage('������SQL��ʶ');
        ed_sql_id.SetFocus;
        exit;
    end;
    sg_sqlin.RowCount := 2;
    //bssp_prefab_sql_in_param
    AdoQuery1.SQL.Clear;
    AdoQuery1.SQL.Add('select SQL_ID, SEQ, PARAM_NAME, DATA_TYPE, DATA_LENGTH, COLUMN_NAME, CAN_EMPTY, DESCRIPTION ');
    AdoQuery1.sql.append(' from bssp_prefab_sql_in_param where sql_id=' + ed_sql_id.Text );
    AdoQuery1.sql.append(' order by seq ');
    AdoQuery1.Open;
    if not AdoQuery1.Eof then
    begin
        while not AdoQuery1.Eof do
        begin
            i := sg_sqlin.RowCount-1;
            sg_sqlin.Rows[i].Text:='';
            sg_sqlin.Cells[0,i] := intToStr(i);
            sg_sqlin.Cells[1,i] := AdoQuery1.fieldbyname('sql_id').asString;
            sg_sqlin.Cells[2,i] := AdoQuery1.fieldbyName('param_name').asString;
            sg_sqlin.Cells[3,i] := AdoQuery1.fieldbyName('data_type').asString;
            sg_sqlin.Cells[4,i] := AdoQuery1.fieldbyName('data_length').asString;
            sg_sqlin.Cells[5,i] := AdoQuery1.fieldbyName('column_name').asString;
            sg_sqlin.Cells[6,i] := AdoQuery1.fieldbyName('can_empty').asString;
            sg_sqlin.Cells[7,i] := 'SYSDATE';
            sg_sqlin.Cells[8,i] := 'SYSDATE';
            sg_sqlin.Cells[9,i] := AdoQuery1.fieldbyName('description').asString;
            sg_sqlin.RowCount := sg_sqlin.RowCount+1;
            Application.ProcessMessages;
            AdoQuery1.Next;
        end;
        sg_sqlin.RowCount := sg_sqlin.RowCount-1;
    end
    else
    begin
        //showMessage('bssp_prefab_sql_in_param ��û�м�¼');
        statusbar1.panels[1].text :='bssp_prefab_sql_in_param ��û�м�¼';
    end;
    AdoQuery1.Close;

    if sped_sql_seq.text='' then
    begin
        showmessage('������SQL������');
        sped_sql_seq.SetFocus;
        exit;
    end;
    sg_sqlout.RowCount := 2;
    //bssp_prefab_sql_out_param
    AdoQuery1.SQL.Clear;
    AdoQuery1.SQL.Add('select sql_id, statement_seq,param_seq,param_name, data_type, data_length, can_empty, create_date, modify_date, DESCRIPTION, nvl(to_char(dict_type),''NULL'') dict_type, nvl(to_char(CLASS),''NULL'') class, nvl(need_replace,0) need_replace ');
    AdoQuery1.sql.append(' from bssp_prefab_sql_out_param where sql_id=' + ed_sql_id.Text +' and statement_seq='+sped_sql_seq.Text);
    AdoQuery1.sql.append(' order by param_seq ');
    AdoQuery1.Open;
    if not AdoQuery1.Eof then
    begin
    while not AdoQuery1.Eof do
    begin
        i := sg_sqlout.RowCount-1;
        sg_sqlout.Rows[i].Text:='';
        sg_sqlout.Cells[0,i] := intToStr(i);
        sg_sqlout.Cells[1,i] := AdoQuery1.fieldbyname('sql_id').asString;
        sg_sqlout.Cells[2,i] := AdoQuery1.fieldbyName('statement_seq').asString;
        sg_sqlout.Cells[3,i] := AdoQuery1.fieldbyName('param_name').asString;
        sg_sqlout.Cells[4,i] := AdoQuery1.fieldbyName('data_type').asString;
        sg_sqlout.Cells[5,i] := AdoQuery1.fieldbyName('data_length').asString;
        sg_sqlout.Cells[6,i] := AdoQuery1.fieldbyName('can_empty').asString;
        sg_sqlout.Cells[7,i] := 'SYSDATE';
        sg_sqlout.Cells[8,i] := AdoQuery1.fieldbyName('description').asString;
        sg_sqlout.Cells[9,i] := AdoQuery1.fieldbyName('dict_type').asString;
        sg_sqlout.Cells[10,i] := AdoQuery1.fieldbyName('class').asString;
        sg_sqlout.cells[11,i] := AdoQuery1.fieldByName('need_replace').AsString;
        sg_sqlout.RowCount := sg_sqlout.RowCount+1;
        Application.ProcessMessages;
        AdoQuery1.Next;
    end;
    sg_sqlout.RowCount := sg_sqlout.RowCount-1;
    end
    else
    begin
        //showMessage('bssp_prefab_sql_out_param ��û�м�¼');
        statusbar1.Panels[1].text :='bssp_prefab_sql_out_param ��û�м�¼';
    end;

    AdoQuery1.Close;
end;

procedure TFormBsspCfgMain.bbtnGetProcessParamClick(Sender: TObject);
var
    i : integer;
begin
//
    if trim2(ed_process_id.text)='' then
    begin
        showmessage('��������̱�ʶ');
        ed_process_id.SetFocus;
        exit;
    end;
    sg_proc.RowCount := 2;
    //bssp_process_param
    
    AdoQuery1.SQL.Clear;
    AdoQuery1.SQL.Add('select process_param_id,process_id,param_name,parent_name,parent_param_id,inout_flag,option_flag,description, nvl(to_char(dict_type),''NULL'') dict_type, nvl(to_char(CLASS),''NULL'') class ');
    AdoQuery1.sql.append(' from bssp_process_param where process_id=' + ed_process_id.Text );
    AdoQuery1.sql.append(' order by process_param_id ');
    AdoQuery1.Open;
    if not AdoQuery1.Eof then
    begin
    while not AdoQuery1.Eof do
    begin
        i := sg_proc.RowCount-1;
        sg_proc.Rows[i].Text:='';
        sg_proc.Cells[0,i] := intToStr(i);
        sg_proc.Cells[1,i] := AdoQuery1.fieldbyname('process_id').asString;
        sg_proc.Cells[2,i] := AdoQuery1.fieldbyName('param_name').asString;
        sg_proc.Cells[3,i] := AdoQuery1.fieldbyName('parent_name').asString;
        sg_proc.Cells[4,i] := AdoQuery1.fieldbyName('parent_param_id').asString;
        sg_proc.Cells[5,i] := AdoQuery1.fieldbyName('inout_flag').asString;
        sg_proc.Cells[6,i] := AdoQuery1.fieldbyName('option_flag').asString;
        sg_proc.Cells[7,i] := AdoQuery1.fieldbyName('description').asString;
        sg_proc.Cells[8,i] := AdoQuery1.fieldbyName('dict_type').asString;
        sg_proc.Cells[9,i] := AdoQuery1.fieldbyName('class').asString;
        sg_proc.RowCount := sg_proc.RowCount+1;
        Application.ProcessMessages;
        AdoQuery1.Next;
    end;
    sg_proc.RowCount := sg_proc.RowCount-1;
    end;
    AdoQuery1.Close;
end;

procedure TFormBsspCfgMain.bbtnGetProcessClick(Sender: TObject);
var
   v_procId, v_procCode : string;
   v_idx : integer;
begin
  try
    if ((trim2(EditProcessId.text)='') and (trim2(EditProcessCode.Text)='')) then
    begin
        showmessage('��������̱�ʶ���������');
        EditProcessId.SetFocus;
        exit;
    end;
    v_procId := trim2(EditProcessId.text);
    v_procCode := trim2(EditProcessCode.Text);

    editProcshowname.TExt := '';
    //bssp_process
    AdoQuery1.SQL.Clear;
    AdoQuery1.SQL.Add('select *');
    if( v_procId <> '' )then
    begin
        AdoQuery1.sql.append(' from bssp_process where process_id=' + v_procId );
        EditProcessCode.Text := '';
    end
    else
    begin
        AdoQuery1.sql.append(' from bssp_process where process_code=''' + v_procCode +'''' );
    end;

    AdoQuery1.Open;
    if not AdoQuery1.Eof then
    begin
        editprocessid.Text := AdoQuery1.FieldByName('process_id').AsString;
        editprocesscode.Text := AdoQuery1.FieldByName('process_code').AsString;
        editProcshowname.TExt := AdoQuery1.FieldByName('show_name').asString;
        //cbProcGroupId.Text := AdoQuery1.FieldByName('group_id').AsString;
        v_idx := m_procGroupList.IndexOf(AdoQuery1.FieldByName('group_id').AsString);
        if( v_idx < 0 ) then
          cbProcGroupId.Text := AdoQuery1.FieldByName('group_id').AsString
        else
          cbProcGroupId.itemIndex := v_idx ; //AdoQuery1.FieldByName('group_id').asInteger;
        cbProcType.itemIndex := AdoQuery1.FieldByName('type').asInteger-1;
        cbProcStatus.itemIndex := AdoQuery1.fieldByName('status').asInteger-1;
        editProcDesc.Text := AdoQuery1.fieldByname('description').asstring;
    end;
    AdoQuery1.Close;
    Application.ProcessMessages;

    //bssp_process_template
    if(trim2(EditProcessId.Text)<>'')then
    begin
    AdoQuery1.SQL.Clear;
    AdoQuery1.SQL.Add('select tx_type,sync_mode,open_trace,invoke_mode,link_url,pr_template ');
    AdoQuery1.SQL.Append(' from bssp_process_template  where process_id=' + EditProcessId.Text );
    AdoQuery1.Open;
    if not AdoQuery1.Eof then
    begin
        cbTxType.itemIndex := AdoQuery1.FieldByName('tx_type').AsInteger-1;
        cbSyncMode.itemIndex := AdoQuery1.FieldByName('sync_mode').AsInteger-1;
        cbOpenTrace.itemIndex := AdoQuery1.FieldByName('open_trace').asInteger;
        cbInvokeMode.itemIndex := AdoQuery1.FieldByName('invoke_mode').asInteger-1;
        cbLinkUrl.Text := AdoQuery1.fieldByName('link_url').asstring;
        FormSfdl.RichEditSfdl.Text := AnsiReplaceText(AnsiReplaceText(AdoQuery1.fieldByName('pr_template').AsString,#13#10,#10),#10,#13#10);
        FormSfdl.showSfdl();
    end;
    AdoQuery1.Close;
    Application.ProcessMessages;
    end;

    //bssp_process_service_relation
    if(trim2(EditProcessId.Text)<>'')then
    begin
    AdoQuery1.SQL.Clear;
    AdoQuery1.SQL.Add('select * ');
    AdoQuery1.SQL.Append(' from bssp_process_service_relation where process_id=' + EditProcessId.Text );
    AdoQuery1.Open;
    sgProcSvc.rowcount := 2;
    setProcSvcParamDefault(1);
    while not AdoQuery1.Eof do
    begin
        with sgProcSvc do
        begin
            cells[0,rowcount-1] := inttostr(rowcount-1);
            cells[1,rowcount-1] := AdoQuery1.FieldbyName('process_id').AsString;
            cells[2,rowcount-1] := AdoQuery1.FieldByName('service_id').asString;
            cells[3,rowcount-1] := AdoQuery1.FieldByName('status').asString;
            cells[4,rowcount-1] := AdoQuery1.FieldByName('description').AsString;
            rowcount := rowcount+1;
            setProcSvcParamDefault(rowcount-1) ;
        end;
        AdoQuery1.Next;
    end;
    AdoQuery1.Close;
    Application.ProcessMessages;
    end;
  finally
    AdoQuery1.Close;
  end;
end;

procedure TFormBsspCfgMain.bbtnGetSqlClick(Sender: TObject);
var
    v_sqlId , v_sqlName : string;
begin
    if ((trim2(EditSqlId.text)='') and (trim2(EditSqlName.Text)='')) then
    begin
        showmessage('������sql��ʶ��sql����');
        EditSqlId.SetFocus;
        exit;
    end;
    v_sqlId := trim2(EditSqlId.text);
    v_sqlName := trim2(EditSqlName.Text);

    //bssp_PREFAB_SQL
    AdoQuery1.SQL.Clear;
    AdoQuery1.SQL.Add('select  SQL_ID, SQL_NAME, GROUP_ID, SUBSYSTEM_ID, SQL_TYPE, OUT_TEMPLATE, CREATE_DATE, MODIFY_DATE, DESCRIPTION, nvl(db_type,1) db_type');
    if( v_sqlId <> '' ) then
    begin
        AdoQuery1.sql.append(' from bssp_prefab_sql where sql_id=' + v_sqlId );
        editSqlName.Text := '';
    end
    else
    begin
        AdoQuery1.sql.Append(' from bssp_prefab_sql where sql_name=''' + v_sqlName+'''');
        editSqlId.Text := '';
    end;
    AdoQuery1.Open;
    if not AdoQuery1.Eof then
    begin
        editSqlId.Text := AdoQuery1.FieldByName('SQL_ID').AsString;
        editSqlName.Text := AdoQuery1.FieldByName('sql_name').AsString;
        cbSqlGroupId.TExt := AdoQuery1.FieldByName('GROUP_ID').asString;
        cbSubSysId.itemIndex := AdoQuery1.FieldByName('SUBSYSTEM_ID').AsInteger;
        cbSqlType.itemIndex := AdoQuery1.FieldByName('SQL_TYPE').asInteger-1;
        editDescSql.Text := AdoQuery1.fieldByName('DESCRIPTION').asstring;
        FormPreSqlOutTempl.MemoPreSqlTempl.Text := AdoQuery1.fieldByname('OUT_TEMPLATE').asstring;
        cboxDbType.ItemIndex := AdoQuery1.fieldbyName('DB_TYPE').asInteger;
    end
    else
    begin
        //showMessage('bssp_prefab_sql����Ӧ��¼');
        statusbar1.Panels[1].Text :='bssp_prefab_sql����Ӧ��¼';
    end;
    AdoQuery1.Close;
    Application.ProcessMessages;

    //bssp_PREFAB_SQL_STATEMENT
    if(trim2(EditSqlId.Text)<>'')then
    begin
    AdoQuery1.SQL.Clear;
    AdoQuery1.SQL.Add('select * ');
    AdoQuery1.SQL.Append(' from bssp_prefab_sql_statement  where sql_id=' + EditSqlId.Text  );
    AdoQuery1.sql.Append(' order by statement_seq ' );
    AdoQuery1.Open;
    sgSqlStat.rowCount := 2;
    setSqlStatParamDefault(1);
    if adoQuery1.eof then
    begin
        //showMessage('bssp_prefab_sql_statement����Ӧ��¼');
        statusbar1.Panels[1].Text :='bssp_prefab_sql_statement����Ӧ��¼';
    end
    else
    begin
      while not AdoQuery1.Eof do
      begin
//        editStateSeq.Text := AdoQuery1.FieldByName('STATEMENT_SEQ').AsString;
//        FormPrefabSql.MemoSQL.Text := AdoQuery1.fieldByName('SQL_STATEMENT').AsString;
//        edSqlTimeout.Text := AdoQuery1.FieldByName('TIMEOUT').AsString;
        with sgSqlStat do
        begin
          cells[0,rowCount-1]:= adoQuery1.FieldByName('STATEMENT_SEQ').asString;
          cells[1,rowCount-1] := adoQuery1.FieldByName('SQL_ID').AsString;
          cells[2,rowCount-1] := adoQuery1.FieldByName('sql_statement').AsString;
          cells[3,rowCount-1] := adoQuery1.fieldByName('timeout').AsString;
          cells[4,rowCount-1] := adoQuery1.fieldByName('max_rows').AsString;
          cells[5,rowCount-1] := adoQuery1.fieldByName('max_file_rows').AsString;
          rowCount := rowCount+1;
          setSqlStatParamDefault(rowCount-1);

        end;
        adoQuery1.Next;
      end  ;
    end;
    AdoQuery1.Close;
    end;
    
    if( sgSqlStat.Row > 0 ) then
    begin
      with sgSqlStat do
      begin
//      editsqlid2.Text := cells[1,row];
//      editstateseq.text := cells[0,row];
//      edsqltimeout.Text := cells[3,row];
      FormPrefabSql.MemoSQL.Text := cells[2,row];
      end;
    end;

end;

procedure TFormBsspCfgMain.CB_TNS_NAMEChange(Sender: TObject);
begin
    //cb_user.ItemIndex := cb_tns_name.ItemIndex;
    //cb_passwd.ItemIndex := cb_tns_name.ItemIndex;
end;

procedure TFormBsspCfgMain.enableDBbtn();
begin
    bbtnDbOpen.Enabled := true;
    bbtnDbClose.Enabled := false;
    bbtnGetBiz.Enabled := false;
    bbtnGetService.Enabled := false;
    bbtnGetProcess.Enabled := false;
    bbtnGetSql.Enabled := false;
    bbtnGetSqlParam.Enabled := false;
    bbtnGetProcessParam.Enabled := false;
    Caption := strCaption;
    bbtnGetCallName.Enabled := false;
    bbtnGetLinkUrl.Enabled := false;


    formscript.bbtnExecute.enabled := false;
    bbtnRefresh.enabled := false; // bsspˢ�°�ť
    bbtnResult.enabled := false;

end;

procedure TFormBsspCfgMain.ADOConn_1AfterDisconnect(Sender: TObject);
begin
    enableDBbtn()
end;

procedure TFormBsspCfgMain.disableDBbtn();
begin
    bbtnDbOpen.Enabled := false;
    bbtnDbClose.Enabled := true;
    bbtnGetBiz.Enabled := true;
    bbtnGetService.Enabled := true;
    bbtnGetProcess.Enabled := true;
    bbtnGetSql.Enabled := true;
    bbtnGetSqlParam.Enabled := true;
    bbtnGetProcessParam.Enabled := true;
    strCaption := Caption;
    Caption := Caption+'  �������ݿ�:'+cb_tns_name.Text;

    bbtnGetCallName.Enabled := true;
    bbtnGetLinkUrl.Enabled := true;
    formscript.bbtnExecute.enabled := true;

    bbtnRefresh.enabled := true; // bsspˢ�°�ť
    bbtnResult.enabled := true;
end;
procedure TFormBsspCfgMain.ADOConn_1AfterConnect(Sender: TObject);
begin
    disableDBbtn();
end;
{
procedure TFormBsspCfgMain.IdUDPSvrUDPRead(Sender: TObject; AData: TStream;
  ABinding: TIdSocketHandle);
var
  DataStringStream: TStringStream;
  buf : string;
begin
  DataStringStream := TStringStream.Create('');
  try
    DataStringStream.CopyFrom(AData, AData.Size);
    FormVerUp.Memo1.Lines.Add( '[' + TimeToStr(Time()) + '] rcv from:' + ABinding.PeerIP);
    FormVerUp.Memo1.Lines.Add(DataStringStream.DataString);
    buf := 'ver['+g_sVersion+'] hint['+FormVerUp.cb_Hint.Text+']';
    ABinding.SendTo(ABinding.PeerIP, ABinding.PeerPort, buf[1], length(buf));
  except
    //showmessage('rcv from:'+ABinding.PeerIP+'['+DataStringStream.DataString+']');
    FormVerUp.Memo1.Lines.Add('����ʧ��');
  end;

end;
}
{
procedure TFormMain.stextUpdateDblClick(Sender: TObject);
begin

    if( (GStack.LocalAddress = g_sHwtAddr1) or (GStack.LocalAddress = g_sHwtAddr2) ) then
    begin
        FormVerUp.Show;
    end;

end;
}

{
procedure TFormMain.Timer1Timer(Sender: TObject);
begin
    Timer1.Enabled := false;
    if( GStack.LocalAddress = g_sHwtAddr1 ) or ( GStack.LocalAddress = g_sHwtAddr2 ) then exit; //��������汾
    reqVersion();
    Timer1.Enabled := true;
end;
}
{
procedure TFormMain.BitBtn31Click(Sender: TObject);
var
  resp : TStringStream;
  req : TStrings;
  FileName :string;
//  strReq : string;
begin
    if cb_http.Text ='' then
    begin
        showMessage('���������ӵ�ַ!');
        exit;
    end;
    //����BSSP����,����ʾ���ؽ��
    req := TStringList.Create;
    resp := TStringStream.Create('');
    try
        //try
            m_resp.Clear;
         //   strReq := stringReplace(m_req.text,#13#10,'',[rfReplaceAll]) ;

            req.Add(stringReplace(m_req.text,#13#10,'',[rfReplaceAll]));
            Application.ProcessMessages;
            IdHTTP1.Post(cb_http.Text, req, resp);
            m_resp.text := resp.DataString;

            if sbtnRespXml.Down then
            begin
        //��ʾxml����
//        pnl_resp_text.visible := false;
//        pnl_resp_xml.Visible := true;
//        pnl_resp_xml.align := alClient;
                FileName := ExtractFilePath(Application.ExeName)+'bsccfg_xml_tmp.xml';
                m_resp.Lines.SaveToFile(FileName);
                web_resp.Navigate(FileName);
            end;

            //������µĵ�ַ�������ӵ��б�
           if ( cb_http.Items.IndexOf(cb_http.Text)=-1 ) then
          begin
               cb_http.Items.Add(cb_http.Text);
          end;

        //except
        //    m_resp.text := '����ʧ��';
        //end;
    finally
        req.Free;
        resp.Free;
    end;

end;

procedure TFormMain.SpeedButton3Click(Sender: TObject);
begin
    M_REQ.Clear;
end;

procedure TFormMain.SpeedButton2Click(Sender: TObject);
begin
    M_RESP.Clear;
end;

procedure TFormMain.sbtnRespXmlClick(Sender: TObject);
var
    FileName : string;
begin
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
        FileName := ExtractFilePath(Application.ExeName)+'bsccfg_xml_tmp.xml';
        m_resp.Lines.SaveToFile(FileName);
        web_resp.Navigate(FileName);
    end;
end;

procedure TFormMain.sbtnReqXmlClick(Sender: TObject);
var
    FileName : string;
begin

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
        FileName := ExtractFilePath(Application.ExeName)+'bsccfg_xml_tmp.xml';

        m_req.Lines.SaveToFile(FileName);
        web_req.Navigate(FileName);
    end;
end;
}
procedure TFormBsspCfgMain.FormCreate(Sender: TObject);
begin
  //web_req.Navigate('about:blank');
  //web_resp.Navigate('about:blank');
  FormScript := TFormScript.Create(nil);
  FormSfdl := TFormSfdl.Create(nil);
  FormPrefabSql := TFormPrefabSql.Create(nil);
  FormPreSqlOutTempl := TFormPreSqlOutTempl.Create(nil);
  FormVerUp := TFormVerUp.Create(nil);
  pagecontrol1.ActivePageIndex := 0;
  m_procGroupList := TStringlist.Create();
  m_procGroupList.Add('301000');   // ��ѯ��
  m_procGroupList.Add('302000');   // ������
  m_procGroupList.Add('303000');   // ������


  {
  sfdl_transaction := Tsfdl_transaction.Create(self);
  sfdl_process_def := Tsfdl_process_def.Create(self);
  sfdl_process_step := Tsfdl_process_step.Create(self);
  sfdl_assign := Tsfdl_assign.Create(self);
  sfdl_invoke := Tsfdl_invoke.Create(self);
  sfdl_description := Tsfdl_description.Create(self);
  sfdl_for_each := Tsfdl_for_each.Create(self);
  sfdl_exception := Tsfdl_exception.Create(self);
  }
end;
{
procedure TFormMain.reqVersion();
var
    buf, newVer : string;
    i ,j:integer;
begin
    //�鿴�°汾
    try
        //idudpclt.Host := g_sHwtAddr1;
        idudpclt.Port := g_iHwtPort;
        idudpclt.Send(g_sHwtAddr1,g_iHwtPort,'hello['+g_sVersion+']');
        buf := '';
        buf := idudpclt.ReceiveString();
    except
        try
            //idudpclt.Host := g_sHwtAddr2;
            idudpclt.Port := g_iHwtPort;
            idudpclt.Send(g_sHwtAddr2,g_iHwtPort,'hello['+g_sVersion+']');
            buf := '';
            buf := idudpclt.ReceiveString();
        except
            FormVerUp.Memo1.Lines.Add('��ѯ�°汾ʧ��');
        end;
    end;

    i:=Pos('ver[',buf);
    if( i>0 )then
    begin
        newVer := copy(buf,i+4,length(buf)-i-3);
        j := Pos(']',newVer);
        newVer := copy(newVer,1,j-1);
        //showMessage('new version '+newVer);
    end;

    i:=Pos('hint[',buf);
    if( i>0 )then
    begin
        hint := copy(buf,i+5,length(buf)-i-4);
        j:=Pos(']',hint);
        hint := copy(hint,1,j-1);
        //showmessage('hint '+hint);
    end;

    if( newVer > g_sVersion ) then
    begin
        statusBar1.Panels[0].Text := '�����°汾: '+newVer;
        statusBar1.Panels[1].Text := hint;
    end;


    FormVerUp.Memo1.Lines.Add('['+TimeToStr(Time())+'] rcv : '+buf);
end;
}

procedure TFormBsspCfgMain.cbRequestSourceChange(Sender: TObject);
begin
//    cbRequestSource.Hint := cbRequestSource_name.Items[cbRequestSource.itemindex];
    if( sgBizRequest.col <1) or (sgBizRequest.row<1) then exit;
    //if( cbRequestSource.ItemIndex >=0 ) then
    //begin
        sgBizRequest.Cells[sgBizRequest.col,sgBizRequest.row] := cbRequestSource.Text;//(cbRequestSource.ItemIndex+1);
    //end
    //else
    //    sgBizRequest.Cells[sgBizRequest.col,sgBizRequest.row] := '';
end;

procedure TFormBsspCfgMain.m_reqKeyPress(Sender: TObject; var Key: Char);
begin
// showmessage(key);
    if( key = #1 ) then
        TMemo(sender).SelectAll;
end;

procedure TFormBsspCfgMain.EditSevShowNameChange(Sender: TObject);
begin
    editsevdesc.text := editsevshowname.text;
end;

procedure TFormBsspCfgMain.EditBizShowNameChange(Sender: TObject);
begin
    editbizdesc.Text := EditBizShowName.text;
    //editbizreqdesc.text := EditBizShowName.text;
    //editbizprocdesc.text := EditBizShowName.text;
    sgBizRequest.Cells[9,1] := editbizshowname.text;

end;

procedure TFormBsspCfgMain.EditProcShowNameChange(Sender: TObject);
begin
    editprocdesc.text := editprocshowname.text;
end;

procedure TFormBsspCfgMain.sgBizProcessSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
//sg_proc.Cols[1].
    cb_biz_status.Hide;
    case acol of
       3 : // ״̬
       begin
        cb_biz_status.left :=  sgBizProcess.cellrect(acol,arow).left+1;
        cb_biz_status.top :=  sgBizProcess.top + sgBizProcess.cellrect(acol,arow).top+1;
        cb_biz_status.width := sgBizProcess.colwidths[acol];
        cb_biz_status.height := sgBizProcess.rowheights[arow];
        cb_biz_status.Text := sgBizProcess.cells[acol,arow];
        cb_biz_status.Show;
        cb_biz_status.SetFocus;
       end;
    end;

end;

procedure TFormBsspCfgMain.cb_biz_statusChange(Sender: TObject);
begin
    if( sgbizProcess.col <1) or (sgbizProcess.row<1) then exit;
    if( cb_biz_status.ItemIndex >=0 ) then
    begin
        sgbizProcess.Cells[sgbizProcess.col,sgbizProcess.row] := inttostr(cb_biz_status.ItemIndex+1);
    end
    else
        sgbizProcess.Cells[sgbizProcess.col,sgbizProcess.row] := '';

end;

procedure TFormBsspCfgMain.sgBizProcessRowMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
    setSequence(sgBizProcess);
end;


procedure TFormBsspCfgMain.BitBtn25Click(Sender: TObject);
begin
  sgbizprocess.RowCount := sgBizProcess.RowCount+1;
  setBizProcParamDefault(sgBizProcess.RowCount-1);
end;

procedure TFormBsspCfgMain.BitBtn27Click(Sender: TObject);
var
    i : integer;
begin
    with sgBizProcess do
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
            //����ȱʡֵ
            setBizProcParamDefault(1);
        end;
        //�������
        setSequence(sgBizProcess);
    end;
end;

procedure TFormBsspCfgMain.setBizProcParamDefault(arow : integer);
begin
  with sgBizProcess do
  begin
    cells[0,arow] := inttostr(arow);
    cells[1,arow] := cells[1,1];
    cells[2,arow] := '';
    cells[3,arow] := '1';
    cells[4,arow] := '';
  end;
end;

procedure TFormBsspCfgMain.BitBtn30Click(Sender: TObject);
var
    i : integer;
begin
    with sgProcSvc do
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
            //����ȱʡֵ
            setProcSvcParamDefault(1);
        end;
        //�������
        setSequence(sgProcSvc);
    end;
end;
procedure TFormBsspCfgMain.setProcSvcParamDefault(arow : integer);
begin
  with sgProcSvc do
  begin
    cells[0,arow] := inttostr(arow);
    cells[1,arow] := cells[1,1];
    cells[2,arow] := '';
    cells[3,arow] := '1';
    cells[4,arow] := '';
  end;
end;

procedure TFormBsspCfgMain.BitBtn28Click(Sender: TObject);
var
 idx,i : integer;
 service_id, svc_desc : string;
 found : boolean;
begin
    if cbproctype.ItemIndex = 1  then //Ԥ�Ʋ�ѯ
    begin
        with sgProcSvc do
        begin
            rowcount := 2;
            cells[0,1] := '1';
            cells[1,1] := editprocessid.text;
            cells[2,1] := editprocessid.text;
            cells[3,1] := '1';
            cells[4,1] := editprocShowName.text;
        end;
    end
    else
    begin
        if( not AdoConn.Connected ) then
        begin
            showMessage('�Զ����ɹ�����Ҫ�����ݿ��ȡ����������Ϣ,�����������ݿ�!');
            exit;
        end;
        idx := 1;
        m_sProcTmpl := FormSfdl.richeditsfdl.Lines.Text;
        with sgProcSvc do
        begin
            rowcount := 2;
            setProcSvcParamDefault(1);
            while getProcSvc(idx,service_id,svc_desc) do
            begin
                //��ǰ�б��д����������
                found := false;
                for i:=1 to rowcount-1 do
                begin
                    if cells[2,i]=service_id then
                    begin
                        found := true;
                        break;
                    end;
                end;
                if found then continue;
                cells[0,rowcount-1] := inttostr(rowcount-1);
                cells[1,rowcount-1] := editprocessid2.text;
                cells[2,rowcount-1] := service_id;
                cells[3,rowcount-1] := '1';
                cells[4,rowcount-1] := editprocShowName.text+'('+svc_desc+')';
                rowcount := rowcount+1;
                setProcSvcParamDefault(rowcount-1);
            end;
        end;
    end;
end;

function TFormBsspCfgMain.getProcSvc(var idx: integer; var service_id,svc_desc : string) : boolean;
var
    sFind,svc_name : string;
    p: integer;
begin
    //�ҵ�service_name
    sFind := copy(m_sProcTmpl, idx, length(m_sProcTmpl));
    p := pos('<invoke ',sFind);
    if(p<=0)then
    begin
        result := false;
        exit;
    end;
    idx := idx+p;

    sFind := copy(sFind, p, length(sFind));
    p := pos( ' name="',sFind);
    idx := idx+p;

    sFind := copy(sFind, p+length(' name="'), length(sFind));
    p := pos('"',sFind);
    svc_name := copy(sFind, 1, p-1);
    //showmessage(svc_name);

    //�����ݿ��ȡservice_id
    AdoQuery1.SQL.Clear;
    AdoQuery1.SQL.Add('select *  ');
    AdoQuery1.sql.append(' from bssp_service where service_name=''' + svc_name+'''' );
    AdoQuery1.Open;
    if not AdoQuery1.Eof then
    begin
        service_id := adoQuery1.FieldByName('service_id').AsString;
        svc_desc := adoQuery1.FieldByName('show_name').AsString;
    end
    else
    begin
        showmessage('service_name���Ҳ���'+svc_name+'�Ķ���');
        svc_desc := svc_name;
    end;

    result := true;
end;

procedure TFormBsspCfgMain.BitBtn29Click(Sender: TObject);
var
    i : integer;
    sSql : string;
begin
    sSql := '--����-�����ϵ����';
    for i:=1 to sgProcSvc.RowCount-1 do
    begin
      with sgProcSvc do
      begin
        if( trim2(cells[2,i]) <> '') then
        begin
          sSql := sSql+chr(13)+chr(10)
            +'DELETE FROM '+m_prefix_user+'bssp_process_service_relation WHERE process_id='+Cells[1,i]+' AND service_id='+Cells[2,i]+';'
            +chr(13)+chr(10)
            + 'INSERT INTO '+m_prefix_user+'bssp_process_service_relation( process_id, service_id, status, description )'
            +chr(13)+chr(10)
            +'VALUES('
            +chr(13)+chr(10)
            +cells[1,i]+', -- process_id'
            +chr(13)+chr(10)
            +cells[2,i]+', -- service_id'
            +chr(13)+chr(10)
            +cells[3,i]+', -- status'
            +chr(13)+chr(10)
            +''''+trim2(cells[4,i])+''' -- description'
            +chr(13)+chr(10)
            +');'
            +chr(13)+chr(10)
            ;
        end;
      end;
    end;
    FormScript.RichEditScript.Lines.Append(sSql);

end;


procedure TFormBsspCfgMain.sgProcSvcRowMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
    setSequence(sgProcSvc);
end;

procedure TFormBsspCfgMain.sg_procRowMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
    setSequence(sg_proc);
end;

procedure TFormBsspCfgMain.sg_sqlinRowMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
    setSequence(sg_sqlin);
end;

procedure TFormBsspCfgMain.sg_sqloutRowMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
    setSequence(sg_sqlout);
end;

procedure TFormBsspCfgMain.sgSqlStatRowMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
    bbtSqlStat.Hide;
    setSequence(sgSqlStat);
end;

procedure TFormBsspCfgMain.sgProcSvcSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
    cbProcSvcStatus.Hide;
    case acol of
       3 : // ״̬
       begin
        with cbProcSvcStatus do
        begin
            left :=  sgProcSvc.cellrect(acol,arow).left+1;
            top :=  sgProcSvc.top + sgProcSvc.cellrect(acol,arow).top+1;
            width := sgProcSvc.colwidths[acol];
            height := sgProcSvc.rowheights[arow];
            Text := sgProcSvc.cells[acol,arow];
            Show;
            SetFocus;
        end;
       end;
    end;

end;

procedure TFormBsspCfgMain.cbProcSvcStatusChange(Sender: TObject);
begin
    if( sgProcSvc.col <1) or (sgProcSvc.row<1) then exit;
    if( cbProcSvcStatus.ItemIndex >=0 ) then
    begin
        sgProcSvc.Cells[sgProcSvc.col,sgProcSvc.row] := inttostr(cbProcSvcStatus.ItemIndex+1);
    end
    else
        sgProcSvc.Cells[sgProcSvc.col,sgProcSvc.row] := '';

end;

procedure TFormBsspCfgMain.BitBtn32Click(Sender: TObject);
begin
  sgprocSvc.RowCount := sgprocSvc.RowCount+1;
  setProcSvcParamDefault(sgprocSvc.RowCount-1);

end;

procedure TFormBsspCfgMain.setSqlStatParamDefault(arow : integer);
begin
  with sgSqlStat do
  begin
    cells[0,arow] := inttostr(arow);
    cells[1,arow] := cells[1,1];
    cells[2,arow] := '';
    cells[3,arow] := '';
    cells[4,arow] := '';
    cells[5,arow] := '';
  end;
end;
procedure TFormBsspCfgMain.setBizRequestDefault(arow : integer);
begin
  with sgBizRequest do
  begin
    cells[0,arow] := inttostr(arow);
    cells[1,arow] := cells[1,1];
    cells[2,arow] := '201028';
    cells[3,arow] := '* * * * *';
    cells[4,arow] := '0';
    cells[5,arow] := '1';
    cells[6,arow] := '0';
    cells[7,arow] := '20070101';
    cells[8,arow] := '30000101';
    cells[9,arow] := '';
  end;
end;

procedure TFormBsspCfgMain.sgSqlStatClick(Sender: TObject);
begin
    if( sgSqlStat.Row > 0 ) then
    begin
      with sgSqlStat do
      begin
//      editsqlid2.Text := cells[1,row];
//      editstateseq.text := cells[0,row];
//      edsqltimeout.Text := cells[3,row];
      FormPrefabSql.MemoSQL.Text := cells[2,row];
      end;
    end;
end;

procedure TFormBsspCfgMain.cb_prefixClick(Sender: TObject);
begin
    m_prefix_user := '';
    if( cb_prefix.Checked and (ed_user.text <> '')) then
    begin
        m_prefix_user := ed_user.Text+'.'  ;
    end;
end;
{
procedure TFormBsspCfgMain.btnBtchProcessClick(Sender: TObject);
var
 i : integer;
begin

 for i := 0 to memo_process.Lines.Count-1 do
 begin
   editProcessId.Text := memo_process.Lines.Strings[i];
   //ȡ����ģ������
   bbtnGetProcessClick(Sender);
   application.ProcessMessages;
   //���ɹ���ģ��ű�
   PButtonClickClick(sender);
   PButtonClick2Click(Sender);
   BitBtn29Click(sender);

   //ȡ����
   ed_process_id.text := memo_process.lines.strings[i];
   bbtnGetProcessParamClick(sender);
   BitBtn21Click(sender);
 end;

end;
}
{
procedure TFormBsspCfgMain.btnBthBusinessClick(Sender: TObject);
var
 i : integer;
begin

 for i := 0 to memo_business.Lines.Count-1 do
 begin
   editbusinessId.Text := memo_business.Lines.Strings[i];
   //ȡbusiness
   bbtnGetBizClick(Sender);
   application.ProcessMessages;
   //���ɽű�
   BitBtn1Click(Sender);
   BitBtn3Click(sender);
   BitBtn4Click(sender);
 end;

end;
}
{
procedure TFormBsspCfgMain.btnBtchSqlClick(Sender: TObject);
var
 i : integer;
begin

 for i := 0 to memo_sql.Lines.Count-1 do
 begin
   editSqlId.Text := memo_sql.Lines.Strings[i];
   //ȡsql����
   bbtnGetSqlClick(Sender);
   application.ProcessMessages;
   //���ɽű�
   PrefabSqlButtonClickClick(sender);
   PrefabSqlStateButtomClick(sender);
   application.ProcessMessages;

   //ȡ����
   ed_sql_id.text := memo_sql.lines.strings[i];
   bbtnGetSqlParamClick(sender);
   application.ProcessMessages;
   BitBtn15Click(sender);
   BitBtn19Click(sender);
 end;

end;
}
{
procedure TFormBsspCfgMain.btnBtchServiceClick(Sender: TObject);
var
 i : integer;
begin

 for i := 0 to memo_service.Lines.Count-1 do
 begin
   editServiceId.Text := memo_service.Lines.Strings[i];
   //ȡsql����
   bbtnGetServiceClick(Sender);
   application.ProcessMessages;
   //���ɽű�
   BitBtn10Click(sender);
 end;
end;
}
procedure TFormBsspCfgMain.BitBtn5Click(Sender: TObject);
//var
//    i : integer;
begin
    with sgSqlStat do
    begin
{        i := RowCount-1;
        cells[1,i] := editSqlId2.Text;
        cells[2,i] := FormPrefabSql.MemoSql.Text;
        cells[3,i] := edSqlTimeout.Text;
        cells[4,i] := edSqlRows.Text;
        cells[5,i] := edSqlFileRows.Text;
}        
        RowCount := RowCount+1;
        setSqlStatParamDefault(rowCount-1);
    end;
end;

procedure TFormBsspCfgMain.sgSqlStatSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
i : integer;
begin
    bbtSqlStat.Hide;
       i := sgSqlStat.cellrect(2,arow).left+sgSqlStat.Left;
        bbtSqlStat.left :=  i+sgSqlStat.colwidths[2]-bbtSqlStat.width;
        bbtSqlStat.top :=  sgSqlStat.top + sgSqlStat.cellrect(2,arow).top+1;
        //bbtSqlStat.width := sgSqlStat.colwidths[2];
        bbtSqlStat.height := sgSqlStat.rowheights[arow];
        FormPrefabSql.MemoSql.Text := sgSqlStat.cells[2,arow];
        bbtSqlStat.Show;
end;

procedure TFormBsspCfgMain.bbtSqlStatClick(Sender: TObject);
var
    i : integer;
begin
    i := sgSqlStat.Row;
    FormPrefabSql.MemoSQL.Text := sgSqlStat.Cells[2,i];

    if( FormPrefabSql.ShowModal = mrOK ) then
    begin
        sgSqlStat.Cells[2,i] := FormPrefabSql.MemoSQL.Text;
    end;
end;

procedure TFormBsspCfgMain.BitBtn26Click(Sender: TObject);
var
    i : integer;
begin
//ɾ��ָ����
//�������²�������Ųһ�У�Ȼ��ɾ�����һ��
    if (sgSqlStat.row<1) then exit;

    for i:= sgSqlStat.row to sgSqlStat.RowCount-2 do
    begin
        sgSqlStat.Rows[i] := sgSqlStat.Rows[i+1];
    end;

    if sgSqlStat.RowCount > 2 then
    begin
        sgSqlStat.RowCount := sgSqlStat.RowCount - 1;
    end
    else
    begin
        //����ȱʡֵ
        setSqlStatParamDefault(1);
    end;
    //�������
    setSequence(sgSqlStat);
    sgSqlStat.Refresh;

end;

procedure TFormBsspCfgMain.FormDestroy(Sender: TObject);
begin
  FormScript.Free;
  FormSfdl.Free;
  FormPrefabSql.Free;
  FormPreSqlOutTempl.Free;
  FormVerUp.Free;
{
  sfdl_transaction.Free;
  sfdl_process_def.Free;
  sfdl_process_step.Free;
  sfdl_assign.Free;
  sfdl_invoke.Free;
  sfdl_description.Free;
  sfdl_for_each.Free;
  sfdl_exception.Free;
}
end;

procedure TFormBsspCfgMain.sgBizRequestSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
    cbRequestSource.Hide;
    comBoxVerify.Hide;
    comBoxBizReqStatus.Hide;
    cbFuzzy.Hide;
    case acol of
       2 : // ������Դ
       begin
        cbRequestSource.left :=  sgBizRequest.cellrect(acol,arow).left+1;
        cbRequestSource.top :=  sgBizRequest.top + sgBizRequest.cellrect(acol,arow).top+1;
        cbRequestSource.width := sgBizRequest.colwidths[acol];
        cbRequestSource.height := sgBizRequest.rowheights[arow];
        cbRequestSource.Text := sgBizRequest.cells[acol,arow];
        cbRequestSource.Show;
        cbRequestSource.SetFocus;
       end;
       4: //��ȫУ��
       begin
        comBoxVerify.left :=  sgBizRequest.cellrect(acol,arow).left+1;
        comBoxVerify.top :=  sgBizRequest.top + sgBizRequest.cellrect(acol,arow).top+1;
        comBoxVerify.width := sgBizRequest.colwidths[acol];
        comBoxVerify.height := sgBizRequest.rowheights[arow];
        comBoxVerify.Text := sgBizRequest.cells[acol,arow];
        comBoxVerify.Show;
        comBoxVerify.SetFocus;
       end;
       5: //״̬
       begin
        comBoxBizReqStatus.left :=  sgBizRequest.cellrect(acol,arow).left+1;
        comBoxBizReqStatus.top :=  sgBizRequest.top + sgBizRequest.cellrect(acol,arow).top+1;
        comBoxBizReqStatus.width := sgBizRequest.colwidths[acol];
        comBoxBizReqStatus.height := sgBizRequest.rowheights[arow];
        comBoxBizReqStatus.Text := sgBizRequest.cells[acol,arow];
        comBoxBizReqStatus.Show;
        comBoxBizReqStatus.SetFocus;
       end;
       6: //ģ����
       begin
        cbFuzzy.left :=  sgBizRequest.cellrect(acol,arow).left+1;
        cbFuzzy.top :=  sgBizRequest.top + sgBizRequest.cellrect(acol,arow).top+1;
        cbFuzzy.width := sgBizRequest.colwidths[acol];
        cbFuzzy.height := sgBizRequest.rowheights[arow];
        cbFuzzy.Text := sgBizRequest.cells[acol,arow];
        cbFuzzy.Show;
        cbFuzzy.SetFocus;
       end;
    end;

end;

procedure TFormBsspCfgMain.sgBizRequestRowMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
    setSequence(sgBizRequest);
end;

procedure TFormBsspCfgMain.Button1Click(Sender: TObject);
begin
  sgBizRequest.RowCount := sgBizRequest.RowCount+1;
  setBizRequestDefault(sgBizRequest.RowCount-1);

end;

procedure TFormBsspCfgMain.Button2Click(Sender: TObject);
var
    i : integer;
begin
    with sgBizRequest do
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
            //����ȱʡֵ
            setBizRequestDefault(1);
        end;
        //�������
        setSequence(sgBizRequest);
    end;

end;

procedure TFormBsspCfgMain.Button3Click(Sender: TObject);
var
   sTmplBizReq : string;
   i : integer;
begin
    //2.ҵ��-������Դ��ϵ
    sTmplBizReq   := '--ҵ��-������Դ��ϵ' ;
    for i := 1 to sgBizRequest.RowCount-1 do
    begin
        sTmplBizReq := sTmplBizReq+chr(13)+chr(10)
            +'DELETE FROM '+m_prefix_user+'bssp_business_request_relation WHERE business_id='+sgBizRequest.cells[1,i]+' AND request_source='+sgBizRequest.cells[2,i]+';'
            +chr(13)+chr(10)
            +'INSERT INTO '+m_prefix_user+'bssp_business_request_relation( business_id, request_source, lifecycle, need_verify, status, need_fuzzy, inure_date, expire_date, create_date, modify_date, DESCRIPTION) '
            +chr(13)+chr(10)
            +'VALUES('
            +chr(13)+chr(10)
            +sgBizRequest.cells[1,i]+',                      --business_id ҵ���ʶ(��������ĵ�������д)'
            +chr(13)+chr(10)
            +sgBizRequest.cells[2,i]+',                             --request_source ������Դ BSSP_Request_Source �ж���:'+cbRequestSource.Hint
            +chr(13)+chr(10)
            +''''+trim2(sgBizRequest.cells[3,i])+''',                        --lifecycle ��������(CRONTAB��ʽ)'
            +chr(13)+chr(10)
            +sgBizRequest.cells[4,i]+',                                  --need_verify �Ƿ���Ҫ��ȫУ�� 0 ����Ҫ 1 ��Ҫ'
            +chr(13)+chr(10)
            +sgBizRequest.cells[5,i]+',                                  --status ״̬ 1	���� 2	ͣ�� 3	ע��'
            +chr(13)+chr(10)
            +sgBizRequest.cells[6,i]+',                                  --need_fuzzy ģ���� 0 �� 1 ��'
            +chr(13)+chr(10)
            +'to_date('''+trim2(sgBizRequest.cells[7,i])+''',''yyyymmdd''),     --inure_date ��Чʱ��'
            +chr(13)+chr(10)
            +'to_date('''+trim2(sgBizRequest.cells[8,i])+''',''yyyymmdd''),     --expire_date ʧЧʱ��'
            +chr(13)+chr(10)
            +'SYSDATE,                            --create_date ����ʱ��'
            +chr(13)+chr(10)
            +'SYSDATE,                               --modify_date �޸�ʱ��'
            +chr(13)+chr(10)
            +'''' + trim2(sgBizRequest.cells[9,i]) +'''                  --description ����'
            +chr(13)+chr(10)
            +');'
            +chr(13)+chr(10);
    end;
  FormScript.RichEditScript.Lines.Append(sTmplBizReq);
  //FormScript.Show;
end;

procedure TFormBsspCfgMain.ComBoxVerifyChange(Sender: TObject);
begin
    if( sgBizRequest.col <1) or (sgBizRequest.row<1) then exit;
    if( ComBoxVerify.ItemIndex >=0 ) then
    begin
        sgBizRequest.Cells[sgBizRequest.col,sgBizRequest.row] := inttostr(ComBoxVerify.ItemIndex);
    end
    else
        sgBizRequest.Cells[sgBizRequest.col,sgBizRequest.row] := '';

end;

procedure TFormBsspCfgMain.ComBoxBizReqStatusChange(Sender: TObject);
begin
    if( sgBizRequest.col <1) or (sgBizRequest.row<1) then exit;
    if( ComBoxBizReqStatus.ItemIndex >=0 ) then
    begin
        sgBizRequest.Cells[sgBizRequest.col,sgBizRequest.row] := inttostr(ComBoxBizReqStatus.ItemIndex+1);
    end
    else
        sgBizRequest.Cells[sgBizRequest.col,sgBizRequest.row] := '';

end;

procedure TFormBsspCfgMain.setBizId2SG(acol : integer; sysfunc_id:string;sg: TStringGrid);
var
    i : integer;
begin
    for i:=1 to sg.rowcount-1 do
    begin
        sg.cells[acol,i] := sysfunc_id;
    end;
end;

procedure TFormBsspCfgMain.bbtnGetCallNameClick(Sender: TObject);
begin
    adoQuery1.SQL.Clear;
    adoQuery1.SQL.Add('select server_name from bssp_server ORDER BY SERVER_NAME ASC ');
    adoquery1.Open;
    if not adoQuery1.Eof then
    begin
        cbCallName.Clear;
        while not adoQuery1.Eof do
        begin
            cbCallName.Items.Add(adoQuery1.fieldByName('server_name').asString);
            adoQuery1.Next;
        end;
    end;
    adoquery1.close;
end;

procedure TFormBsspCfgMain.bbtnGetLinkUrlClick(Sender: TObject);
begin
    adoQuery1.SQL.Clear;
    adoQuery1.SQL.Add('select server_name from bssp_server  ORDER BY SERVER_NAME ASC ');
    adoquery1.Open;
    if not adoQuery1.Eof then
    begin
        cbLinkUrl.Clear;
        while not adoQuery1.Eof do
        begin
            cbLinkUrl.Items.Add(adoQuery1.fieldByName('server_name').asString);
            adoQuery1.Next;
        end;
    end;
    adoquery1.close;
end;

procedure TFormBsspCfgMain.bbtnResultClick(Sender: TObject);
begin
  adoquery1.SQL.Clear;
  adoquery1.Sql.Add('select task_id,machine_id,load_context,status,modify_time,err_msg from BSSP_mem_LOAD_TRIGGER where task_id=' + ed_taskid.Text );
  adoquery1.open;
  if(not adoquery1.Eof) then
  begin
    memo_resp.Lines.Clear;
    memo_resp.lines.Add('������:'+adoquery1.fieldbyname('task_id').asstring);
    memo_resp.lines.Add('�������:'+adoquery1.fieldbyname('machine_id').asstring);
    memo_resp.lines.Add('ˢ������:'+adoquery1.fieldbyname('load_context').asstring);
    memo_resp.lines.Add('ˢ��״̬(1��ʼ,2�ɹ�):'+adoquery1.fieldbyname('status').asstring);
    memo_resp.lines.Add('����ʱ��:'+adoquery1.fieldbyname('modify_time').asstring);
    memo_resp.lines.Add('������Ϣ:'+adoquery1.fieldbyname('err_msg').asstring);
  end;
  adoquery1.close;
end;

procedure TFormBsspCfgMain.cbFuzzyChange(Sender: TObject);
begin
    if( sgBizRequest.col <1) or (sgBizRequest.row<1) then exit;
    if( cbFuzzy.ItemIndex >=0 ) then
    begin
        sgBizRequest.Cells[sgBizRequest.col,sgBizRequest.row] := inttostr(cbFuzzy.ItemIndex);
    end
    else
        sgBizRequest.Cells[sgBizRequest.col,sgBizRequest.row] := '0';

end;

initialization
  OleInitialize(nil);
  //ע�Ṥ����
  RegisteFormFactory('BSSP����(&B)',IFormCreator_BSSPCFG.create);
finalization
  OleUninitialize;

end.
