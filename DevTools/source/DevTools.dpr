program DevTools;

uses
  Forms,
  MainFrame in 'MainFrame.pas' {FormDevToolsMain},
  UnitAbout in 'UnitAbout.pas' {FormAbout},
  UnitFormFactory in 'UnitFormFactory.pas',
  UnitHttp in 'HttpSender\UnitHttp.pas' {FormHttpSender},
  BSC_version in 'bsspcfg\BSC_version.pas' {FormVerUp},
  BSC_config in 'bsspcfg\BSC_config.pas' {FormBsspCfgMain},
  BSC_prefabsql in 'bsspcfg\BSC_prefabsql.pas' {FormPrefabSql},
  BSC_presqltmpl in 'bsspcfg\BSC_presqltmpl.pas' {FormPreSqlOutTempl},
  BSC_process_def in 'bsspcfg\BSC_process_def.pas' {sfdl_process_def},
  BSC_script in 'bsspcfg\BSC_script.pas' {FormScript},
  BSC_sfdl in 'bsspcfg\BSC_sfdl.pas' {FormSfdl},
  BSC_SFDL_assign in 'bsspcfg\BSC_SFDL_assign.pas' {sfdl_assign},
  BSC_SFDL_desc in 'bsspcfg\BSC_SFDL_desc.pas' {sfdl_description},
  BSC_SFDL_exception in 'bsspcfg\BSC_SFDL_exception.pas' {sfdl_exception},
  BSC_SFDL_for_each in 'bsspcfg\BSC_SFDL_for_each.pas' {sfdl_for_each},
  BSC_SFDL_if_else in 'bsspcfg\BSC_SFDL_if_else.pas' {sfdl_if},
  BSC_SFDL_invoke in 'bsspcfg\BSC_SFDL_invoke.pas' {sfdl_invoke},
  BSC_SFDL_process_step in 'bsspcfg\BSC_SFDL_process_step.pas' {sfdl_process_step},
  BSC_SFDL_transaction in 'bsspcfg\BSC_SFDL_transaction.pas' {sfdl_transaction},
  BsspExporter in 'exporter\BsspExporter.pas' {FormBsspExporter},
  UnitReckon in 'ReckonCfg\UnitReckon.pas' {FormReckonConfig},
  UnitReckonHelp in 'ReckonCfg\UnitReckonHelp.pas' {FormReckonHelp},
  UnitReckonSql in 'ReckonCfg\UnitReckonSql.pas' {FormReckonSql},
  UnitPublic in 'UnitPublic.pas',
  BSC_SFDL_with in 'bsspcfg\BSC_SFDL_with.pas' {sfdl_with},
  BSC_SFDL_error in 'bsspcfg\BSC_SFDL_error.pas' {sfdl_error},
  GenerageStep in 'PurStep\GenerageStep.pas' {FormGenStep},
  UnitCvs in 'CvsScript\UnitCvs.pas' {FormCvsTag},
  UnitUpdate in 'UnitUpdate.pas' {FormUpdate},
  UnitBatch in 'CvsScript\UnitBatch.pas' {FormCvsBatch},
  getSeqMain in 'getSeq\getSeqMain.pas' {FormGetSeq},
  UnitTestData in 'TestUnit\UnitTestData.pas' {FormTestData},
  RegExpr in 'regexpr\RegExpr.pas',
  UnitPermission in 'permission\UnitPermission.pas' {FormPermission},
  UnitPermissionSQL in 'permission\UnitPermissionSQL.pas' {FormPermissionSQL},
  UnitDBConfig in 'db_config\UnitDBConfig.pas' {DbConfig},
  UnitHeader in 'HttpSender\UnitHeader.pas' {FormHeader};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormDevToolsMain, FormDevToolsMain);
  Application.CreateForm(TFormVerUp, FormVerUp);
  Application.CreateForm(TFormUpdate, FormUpdate);
  Application.Run;
end.
