object FormPermission: TFormPermission
  Left = 207
  Top = 130
  Width = 911
  Height = 543
  Caption = #26435#38480#37197#32622#33050#26412
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 901
    Height = 60
    Align = alTop
    Caption = #39033#30446
    TabOrder = 0
    object lbedtProjDesc: TLabeledEdit
      Left = 108
      Top = 20
      Width = 563
      Height = 24
      EditLabel.Width = 63
      EditLabel.Height = 16
      EditLabel.Caption = #39033#30446#22791#27880':    '
      LabelPosition = lpLeft
      TabOrder = 0
    end
    object StaticText1: TStaticText
      Left = 689
      Top = 20
      Width = 183
      Height = 20
      Caption = '[ '#21487#22635' "'#39033#30446#32534#21495'-'#39033#30446#21517#31216'-'#38454#27573'" ]'
      TabOrder = 1
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 60
    Width = 901
    Height = 449
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 1
    object Splitter1: TSplitter
      Left = 640
      Top = 1
      Width = 4
      Height = 447
      Beveled = True
      MinSize = 10
    end
    object Splitter2: TSplitter
      Left = 267
      Top = 1
      Width = 4
      Height = 447
      Beveled = True
    end
    object GroupBox2: TGroupBox
      Left = 1
      Top = 1
      Width = 266
      Height = 447
      Align = alLeft
      Caption = #21151#33021#21495' / '#33756#21333#32534#30721' '#21015#34920
      TabOrder = 0
      object StaticText2: TStaticText
        Left = 2
        Top = 18
        Width = 262
        Height = 20
        Align = alTop
        Alignment = taCenter
        Caption = #19968#34892#22635#20889#19968#20010#21151#33021#21495#25110#33756#21333#32534#30721
        TabOrder = 0
      end
      object memoSysfuncId: TMemo
        Left = 2
        Top = 38
        Width = 262
        Height = 407
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 1
        OnKeyPress = memoSysfuncIdKeyPress
      end
    end
    object GroupBox3: TGroupBox
      Left = 644
      Top = 1
      Width = 256
      Height = 447
      Align = alClient
      Caption = #25509#21475#36171#26435
      TabOrder = 1
      object sgUig: TStringGrid
        Left = 2
        Top = 18
        Width = 252
        Height = 229
        Align = alTop
        FixedCols = 0
        RowCount = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing, goTabs, goAlwaysShowEditor]
        ParentFont = False
        TabOrder = 0
        ColWidths = (
          132
          53
          58
          54
          58)
        RowHeights = (
          24
          25)
      end
      object StaticText3: TStaticText
        Left = 10
        Top = 295
        Width = 287
        Height = 51
        AutoSize = False
        Caption = #25509#21475#38376#25143#31867#24320#25918#26435#38480#38656#35201#22686#21152'verify_code'#23545#24212#30340#26435#38480#21015#34920#12290
        TabOrder = 1
      end
      object bbtnGenScript: TBitBtn
        Left = 167
        Top = 414
        Width = 139
        Height = 50
        Caption = #29983#25104#33050#26412
        TabOrder = 2
        OnClick = bbtnGenScriptClick
      end
      object BitBtn1: TBitBtn
        Left = 118
        Top = 256
        Width = 92
        Height = 31
        Caption = #22686#21152
        TabOrder = 3
        OnClick = BitBtn1Click
      end
      object BitBtn2: TBitBtn
        Left = 236
        Top = 256
        Width = 93
        Height = 31
        Caption = #21024#38500
        TabOrder = 4
        OnClick = BitBtn2Click
      end
      object MemoTmpl: TMemo
        Left = 30
        Top = 482
        Width = 188
        Height = 71
        Lines.Strings = (
          '-- '#22791#20221' bopsys.access_control_list, bopsys.operator_access_env'
          '--'
          '--'#12298'{$PROJECT_DESC$}'#12299#26435#38480#37197#32622#33050#26412
          '--'
          '-- generate by DevTools ({$VERSION$}), {$NOW_DATE$}'
          '--'
          '--'
          '--/****************************************'
          '--'#20851#20110#26435#38480#33050#26412#32534#20889#30340#20960#20010#27880#24847#28857#65306
          '--1'#12289#36171#26435#26159#38656#25353#29031#26435#38480#31649#29702#35268#21017#21482#36171#26435#32473#31649#29702#21592#35282#33394#65292#22914#26080#29305#27530#38656#27714#65292#19981#33021#36171#26435#32473#20010#20154#24037#21495#65307
          '--2'#12289#22914#26080#29305#27530#35201#27714#65292#26032#22686#33756#21333#19981#32473#35282#33394' 100026 '#36171#26435#65307
          
            '--3'#12289#28192#36947#38598#20013#31649#25511#24179#21488#65288'100105'#65289#12289#28192#36947#32508#21512#36816#33829#24179#21488#65288'100008'#65289#12289#32508#21512#33829#38144#26381#21153#24179#21488#65288'100012'#65289#12289'ESOP'#24179#21488#65288'10' +
            '0009'#65289#12289
          
            '--         BOP'#22522#30784#38376#25143#65288'100000'#65289#12289'MOP'#38376#25143' (100017)'#12289#32508#21512#32467#31639#36816#33829#24179#21488#65288'100016'#65289#12289'PBOSS' +
            #38376#25143#65288'100011'#65289' '#12289
          
            '--         '#33021#21147#24320#25918#24179#21488#36816#33829#32773#38376#25143#65288'100107'#65289' '#31561#38376#25143#19979#30340#26032#22686#33756#21333#21487#20197#25353#38468#20214#27169#26495'1'#65288'addBopPortal'#65289#30340#33050 +
            #26412#36827#34892#37197#32622#36171#26435#65292
          '--         '#27880#24847#20462#25913#23545#24212#65306#36171#26435#35282#33394#12289#38376#25143'ID'#12289#33756#21333'ID'#12289#39033#30446#22791#27880' '#31561
          '--4'#12289#25509#21475#37492#26435#38598#21512#65288'200005'#65289#25509#21475#38376#25143#36171#26435#65292#35831#25353#29031#38468#20214#27169#26495'2'#65288'addUigPortal'#65289#36827#34892#37197#32622#65292#36824#38656#27880#24847#20197#19979#20960#28857#65306
          
            '--  1>'#12289#20808#35201#22312#29983#20135#19978#30830#35748#25552#20379#30340'verify_code'#22312#29983#20135#19978'bopsys.operator_env'#34920#20013#26159#21542#23384#22312#26377#25928#35760#24405#65292#22914 +
            #19981#23384#22312#65292
          '--         '#21017#22312#26435#38480#33050#26412#20013#35201#22686#21152'bopsys.operator_env'#37197#32622#65292#21542#21017#26435#38480#26080#27861#27491#24120#20351#29992#65307
          
            '--  2>'#12289#22914'verify_code'#22312#29983#20135#19978'bopsys.operator_env'#34920#20013#23384#22312#26377#25928#35760#24405#65292#21017#27880#24847#35813#34920#20013#30340' PARTI' +
            'TION_KEY '#23383#27573#20540#65292
          
            '--         '#22312#26435#38480#33050#26412#26368#21518'insert'#21040'bopsys.operator_access_env'#34920#37324#30340#26102#20505'PARTITIO' +
            'N_KEY'#20540#35201#19982'bopsys.operator_env'#20013
          '--         '#30340#20540#20445#25345#19968#33268#65292#21542#21017#26435#38480#26080#27861#26657#39564#65307
          '--  3>'#12289#20854#20182#30340#27880#24847#20107#39033#21442#32771#31532'3'#28857#35201#27714#21363#21487#65307
          
            '--5'#12289#23458#26381#38376#25143#65288'100004'#65289' '#38376#25143#30340#36171#26435#65306#35831#25353#27169#26495'3'#65288'addCspPortal'#65289#36827#34892#37197#32622#65292#21482#38656#36171#26435#32473'100064 '#12289'9999' +
            '99 '#12289'100000 '#12289'100026 '#36825'4'#20010
          '--         '#30465#20844#21496#35282#33394#21363#21487#65292#20854#20182#30340#27880#24847#20107#39033#21442#32771#31532'3'#28857#65307
          
            '--6'#12289#25353#29031#26435#38480#31649#29702#35268#21017#65306#23545'999999'#12289'100000'#12289'210000'#12289'220000'#12289'230000'#12289'240000'#12289'250000'#12289'2' +
            '60000'#12289'270000'#12289'280000'#12289'290000'
          '--         '#36825'11'#20010#31995#32479#31649#29702#21592#35282#33394#25552#20379#21021#22987#21270#33050#26412#65306
          '--  1>'#12289#21435#25481#35282#33394#19979#25152#26377#33756#21333#26435#38480#20013#30340'"'#20351#29992'"'#25317#26377#27169#24335#65292#21482#20445#30041'"'#36716#25480'+'#22238#25910'"'#65307
          '--  2>'#12289'BOP'#38376#25143#19979#30340#25152#26377#33756#21333#20173#20445#30041'"'#20351#29992'"'#25317#26377#27169#24335#65292#19981#20570#20462#25913#65307
          '--  3>'#12289#32508#21512#33829#38144#26381#21153#24179#21488'-'#22522#30784#31649#29702#19979#30340#25152#26377#33756#21333#20173#20445#30041'"'#20351#29992'"'#25317#26377#27169#24335#65292#19981#20570#20462#25913#65307
          '--  4>'#12289'owning_mode'#20540#37197#32622#35828#26126#65306
          '--  owning_mode=1  '#8212#8212' '#20351#29992
          '--  owning_mode=6  '#8212#8212' '#36716#25480'+'#22238#25910
          '--  owning_mode=7  '#8212#8212' '#20351#29992'+'#36716#25480'+'#22238#25910
          
            '--7'#12289#20026#20102#20570#22909#29983#20135#19978#30340#23433#20840#28183#36879#27979#35797#65292#23458#25143#35201#27714#22312'BOSS/CRM/BASS'#31561#31995#32479#20013#26032#19978#32447#30340#33756#21333#36171#26435#33050#26412#20013#22686#21152#23545'9991331'#21644'9' +
            '991333'#30340#36171#26435#12290
          '--8'#12289#22686#21152'IOP'#38376#25143#36171#26435#35268#21017#65292#27169#26495'(addIopPortal) 2017-1-15'
          
            '--**************************************************************' +
            '************************/'
          ''
          ''
          '--'#21024#38500#20020#26102#34920
          'declare'
          '  bl number;'
          '  b2 number;'
          'begin'
          '--drop table tmp_sysfunc_id;'
          '--drop table tmp_op_role ;'
          
            '  select count(*) into bl from user_tables  where table_name='#39'TM' +
            'P_SYSFUNC_ID'#39';'
          '  if bl >0 then'
          '    execute immediate '#39'drop table TMP_SYSFUNC_ID'#39';'
          '  end if;'
          
            '  select count(*) into b2 from user_tables  where table_name='#39'TM' +
            'P_OP_ROLE'#39';'
          '  if b2>0 then'
          '    execute immediate '#39'drop table TMP_OP_ROLE'#39';'
          '  end if;'
          'end;'
          '/'
          ''
          '--'#26032#22686#25805#20316#21592#35282#33394#25110#24037#21495
          
            'create table tmp_op_role as select oprole_id,home_city,is_operat' +
            'or,owning_mode,PORTAL_ID,modify_content as name from bopsys.acce' +
            'ss_control_list where 1=2; '
          'declare'
          
            '  procedure addRecord(oprid number,city number, isOper number,om' +
            'ode number ,pid number,vname string) is'
          '  begin'
          
            '    --insert into tmp_op_role(oprole_id,home_city,is_operator,ow' +
            'ning_mode,PORTAL_ID,name) values('#24037#21495#35282#33394',590,0,'#26435#38480','#38376#25143'ID,'#39#35282#33394#25551#36848#39');'
          
            '    insert into tmp_op_role(oprole_id,home_city,is_operator,owni' +
            'ng_mode,PORTAL_ID,name) values(oprid,city,isOper,omode,pid,vname' +
            ');'
          '  end;'
          '  '
          '  procedure addPublic(pid number) is '
          '  begin'
          '    --'#20844#20849#35282#33394#65292#32479#19968#36171#26435
          '    addRecord(999999,590,0,6,pid,'#39#36229#32423#31649#29702#21592#35282#33394#39');'
          '    addRecord(100000,590,0,6,pid,'#39#30465#32423#31995#32479#31649#29702#35282#33394#39');'
          '  end;'
          '  {$fun_addBopPortal$}'
          '  {$fun_addCspPortal$}'
          '  {$fun_addUigPortal$}'
          '  {$fun_addIopPortal$}'
          'begin'
          #9'---'#25191#34892#20869#23481
          '  addRecord(9991331,590,1,1,100009,'#39#23433#20840#30417#23519#21592#39');'
          '  addRecord(9991333,590,1,1,100009,'#39#23433#20840#30417#23519#21592#39');'
          '  {$INSERT_TMP_OP_ROLE$}'
          'end;'
          '/'
          ''
          '--'#26032#22686#21151#33021#21495
          
            'create table tmp_sysfunc_id as select portalfun_id from bopsys.p' +
            'ortal_function_cfg where 1=2; '
          'declare'
          '  procedure addItem(v_sysfunc_id string) is'
          '  begin'
          '    insert into tmp_sysfunc_id values(v_sysfunc_id);'
          '  end;'
          'begin'
          '  --addItem('#21151#33021#21495'); '
          '  {$INSERT_TMP_SYSFUNC_ID$}'
          'end;'
          '/'
          ''
          '--'#32473#25805#20316#21592#35282#33394#25480#26435
          'insert into bopsys.access_control_list'
          
            '(OPROLE_ID,IS_OPERATOR,HOME_CITY,PORTALFUN_ID,PORTAL_ID,OWNING_M' +
            'ODE,INURE_TIME,STATUS,EXPIRE_TIME,PERMISSION,MODIFY_OPERATOR_ID,' +
            'MODIFY_TIME,MODIFY_CONTENT,HIS_SEQ_ID)'
          '  select b.oprole_id,b.is_operator,b.home_city,'
          
            '   a.portalfun_id,b.PORTAL_ID,b.owning_mode,sysdate,1,to_date('#39'3' +
            '0000101'#39','#39'yyyymmdd'#39'),'
          '   0,9999999,sysdate,'#39#22686#21152#25805#20316#21592#35282#33394'_{$PROJECT_DESC$}'#39',null'
          'from tmp_sysfunc_id a,tmp_op_role b'
          'where '
          'not exists'
          ' (select * from bopsys.access_control_list c'
          '  where home_city=b.home_city and oprole_id=b.oprole_id'
          
            '   and c.PORTALFUN_ID=a.portalfun_id and c.portal_id=b.portal_id' +
            ');'
          ''
          '--'#23545#20110#25509#21475#38376#25143#38656#22686#21152#26435#38480'env'
          'declare'
          
            '  procedure addEnv(v_code string, v_partKey number, v_portalId n' +
            'umber,v_loginType number,v_city number) is '
          '  begin'
          
            '    --insert into bopsys.operator_access_env(VERIFY_CODE,HOME_CI' +
            'TY,SYSFUNC_ID,LOGIN_TYPE,EXEC_TIME,INURE_TIME,STATUS,EXPIRE_TIME' +
            ',OWNING_MODE,PARTITION_KEY,PORTALFUN_ID,PORTAL_ID)'
          
            '    --select '#26657#39564#30721','#22320#24066',PORTALFUN_ID,'#30331#24405#31867#22411',sysdate,sysdate,1,to_date(' +
            #39'30000101'#39','#39'yyyymmdd'#39'),1,0,PORTALFUN_ID,'#38376#25143'ID from tmp_sysfunc_id' +
            ';'
          
            '    insert into bopsys.operator_access_env(VERIFY_CODE,HOME_CITY' +
            ',SYSFUNC_ID,LOGIN_TYPE,EXEC_TIME,INURE_TIME,STATUS,EXPIRE_TIME,O' +
            'WNING_MODE,PARTITION_KEY,PORTALFUN_ID,PORTAL_ID)'
          
            '    select v_code,v_city,PORTALFUN_ID,v_loginType,sysdate,sysdat' +
            'e,1,to_date('#39'30000101'#39','#39'yyyymmdd'#39'),1,v_partKey,PORTALFUN_ID,v_po' +
            'rtalId from tmp_sysfunc_id ;'
          '  end;'
          'begin'
          '  --'#26681#25454#29983#20135#23454#38469#24773#20917#30830#35748#26159#21542#22686#21152'bopsys.operator_env'#37197#32622#65288#25163#24037#28155#21152#65289
          '  -- addEnv(v_code,v_partKey,v_portalId,v_loginType,v_city);'
          '  {$INSERT_OPERATOR_ACCESS_ENV$}'
          'end;'
          '/'
          ''
          '')
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 5
        Visible = False
      end
      object StaticText4: TStaticText
        Left = 10
        Top = 345
        Width = 287
        Height = 50
        AutoSize = False
        Caption = 
          'verify_code'#12289'partition_key'#12289'login_type  '#22343#38656#19982'bopsys.operator_env '#20013#30340#19968 +
          #33268#12290
        TabOrder = 6
      end
      object memoFunBop: TMemo
        Left = 280
        Top = 488
        Width = 345
        Height = 49
        Lines.Strings = (
          '-- FunBop'
          '  procedure addBopPortal(pid number) is '
          '  begin'
          '    addPublic(pid);'
          '    --'#31867'BOP'#38376#25143
          '    addRecord(100300,590,0,7,pid,'#39#30465#20013#24515#35282#33394#39');'
          '    addRecord(210300,591,0,7,pid,'#39#22320#24066#38376#25143#31649#29702#21592#35282#33394#39');'
          '    addRecord(220300,592,0,7,pid,'#39#22320#24066#38376#25143#31649#29702#21592#35282#33394#39');'
          '    addRecord(230300,593,0,7,pid,'#39#22320#24066#38376#25143#31649#29702#21592#35282#33394#39');'
          '    addRecord(240300,594,0,7,pid,'#39#22320#24066#38376#25143#31649#29702#21592#35282#33394#39');'
          '    addRecord(250300,595,0,7,pid,'#39#22320#24066#38376#25143#31649#29702#21592#35282#33394#39');'
          '    addRecord(260300,596,0,7,pid,'#39#22320#24066#38376#25143#31649#29702#21592#35282#33394#39');'
          '    addRecord(270300,597,0,7,pid,'#39#22320#24066#38376#25143#31649#29702#21592#35282#33394#39');'
          '    addRecord(280300,598,0,7,pid,'#39#22320#24066#38376#25143#31649#29702#21592#35282#33394#39');'
          '    addRecord(290300,599,0,7,pid,'#39#22320#24066#38376#25143#31649#29702#21592#35282#33394#39');'
          ''
          '    addRecord(210000,591,0,6,pid,'#39#22320#24066#31995#32479#31649#29702#35282#33394#39');'
          '    addRecord(220000,592,0,6,pid,'#39#22320#24066#31995#32479#31649#29702#35282#33394#39');'
          '    addRecord(230000,593,0,6,pid,'#39#22320#24066#31995#32479#31649#29702#35282#33394#39');'
          '    addRecord(240000,594,0,6,pid,'#39#22320#24066#31995#32479#31649#29702#35282#33394#39');'
          '    addRecord(250000,595,0,6,pid,'#39#22320#24066#31995#32479#31649#29702#35282#33394#39');'
          '    addRecord(260000,596,0,6,pid,'#39#22320#24066#31995#32479#31649#29702#35282#33394#39');'
          '    addRecord(270000,597,0,6,pid,'#39#22320#24066#31995#32479#31649#29702#35282#33394#39');'
          '    addRecord(280000,598,0,6,pid,'#39#22320#24066#31995#32479#31649#29702#35282#33394#39');'
          '    addRecord(290000,599,0,6,pid,'#39#22320#24066#31995#32479#31649#29702#35282#33394#39');'
          '  end;')
        ScrollBars = ssBoth
        TabOrder = 7
        Visible = False
      end
      object memoFunUig: TMemo
        Left = 280
        Top = 608
        Width = 345
        Height = 49
        Lines.Strings = (
          '-- FunUig'
          '  procedure addUigPortal(pid number) is '
          '  begin'
          '    addPublic(pid);'
          '    --'#25509#21475#37492#26435#38598#21512
          '    addRecord(100030,590,0,1,pid,'#39#30465#32423#19994#21153#22806#25509#21475#35282#33394#39');'
          '  end;')
        ScrollBars = ssBoth
        TabOrder = 8
        Visible = False
      end
      object memoFunIop: TMemo
        Left = 280
        Top = 544
        Width = 345
        Height = 57
        Lines.Strings = (
          '-- FunIop'
          '  procedure addIopPortal(pid number) is '
          '  begin'
          '    addPublic(pid);'
          '    --IOP'#38376#25143
          
            '    addRecord(6100009,590,0,1,pid,trim('#39#20998#38144#21830#20840#21592#40664#35748#35282#33394'            '#39'))' +
            ';'
          '    addRecord(6100010,590,0,1,pid,trim('#39#20998#38144#21830#19968#32423#24215#38271#40664#35748#35282#33394'        '#39'));'
          '    addRecord(6100014,590,0,1,pid,trim('#39#20998#38144#21830#20108#32423#24215#38271#40664#35748#35282#33394#35282#33394'    '#39'));'
          
            '    addRecord(6100001,590,0,1,pid,trim('#39#20998#38144#21830#31354#20013#20805'                  ' +
            #39'));'
          
            '    addRecord(6100002,590,0,1,pid,trim('#39#20998#38144#21830#31354#20013#20805#36820#38144'              '#39')' +
            ');'
          
            '    addRecord(6100003,590,0,1,pid,trim('#39#20998#38144#21830#19994#21153#21150#29702'                '#39 +
            '));'
          
            '    addRecord(6100013,590,0,1,pid,trim('#39#29616#37329#32564#36153#36820#38144'                  ' +
            #39'));'
          
            '    addRecord(6100005,590,0,1,pid,trim('#39#20998#38144#21830#37228#37329#26597#35810'                '#39 +
            '));'
          
            '    addRecord(6100004,590,0,1,pid,trim('#39#32456#31471#38144#21806'                    ' +
            '  '#39'));'
          
            '    addRecord(6100006,590,0,1,pid,trim('#39#39640#26657#36814#26032'                    ' +
            '  '#39'));'
          
            '    addRecord(6100007,590,0,1,pid,trim('#39#20379#24212#21830#35282#33394'                   ' +
            ' '#39'));'
          
            '    addRecord(6100011,590,0,1,pid,trim('#39#31038#21306#32463#29702#35282#33394'                  ' +
            #39'));'
          '    addRecord(6100012,590,0,1,pid,trim('#39#28192#36947#32463#29702#35282#33394#65288#38656#35201#26657#39564#24037#21495#65289'  '#39'));'
          
            '    addRecord(6100008,590,0,1,pid,trim('#39#20869#37096#21592#24037#35282#33394'                  ' +
            #39'));'
          '  end;')
        ScrollBars = ssBoth
        TabOrder = 9
        Visible = False
      end
      object memoFunCsp: TMemo
        Left = 280
        Top = 664
        Width = 345
        Height = 49
        Lines.Strings = (
          '-- FunCsp'
          '  procedure addCspPortal(pid number) is '
          '  begin'
          '    addPublic(pid);'
          '    --'#23458#26381#38376#25143
          '    addRecord(100064,590,0,7,pid,'#39'CSP6.0'#38376#25143#31649#29702#21592#39');'
          '    --addRecord(100026,590,0,1,pid,'#39#30465#32423#19994#21153#25903#25745#39'); --'#26377#29305#21035#35201#27714#26102#20877#22686#21152#36825#39033
          '  end;')
        ScrollBars = ssBoth
        TabOrder = 10
        Visible = False
      end
    end
    object GroupBox4: TGroupBox
      Left = 271
      Top = 1
      Width = 369
      Height = 447
      Align = alLeft
      Caption = #38376#25143' '#36873#25321
      TabOrder = 2
      object RadioGroup1: TRadioGroup
        Left = 2
        Top = 18
        Width = 365
        Height = 82
        Align = alTop
        Caption = #24555#36895#36873#25321
        TabOrder = 0
      end
      object rbtnBop: TRadioButton
        Left = 10
        Top = 39
        Width = 109
        Height = 21
        Caption = 'BOP'#38376#25143#31867
        TabOrder = 1
        OnClick = rbtnBopClick
      end
      object rbtnCsp: TRadioButton
        Left = 167
        Top = 39
        Width = 120
        Height = 21
        Caption = #23458#26381#38376#25143#31867
        TabOrder = 2
        OnClick = rbtnCspClick
      end
      object rbtnUig: TRadioButton
        Left = 10
        Top = 69
        Width = 119
        Height = 21
        Caption = #25509#21475#38376#25143#31867
        TabOrder = 3
        OnClick = rbtnUigClick
      end
      object GroupBox5: TGroupBox
        Left = 2
        Top = 100
        Width = 365
        Height = 345
        Align = alClient
        Caption = #38376#25143#26126#32454
        TabOrder = 4
        object GroupBox6: TGroupBox
          Left = 2
          Top = 18
          Width = 361
          Height = 325
          Align = alClient
          TabOrder = 0
          object clboxPortal: TCheckListBox
            Left = 2
            Top = 18
            Width = 357
            Height = 305
            Align = alClient
            Columns = 1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -17
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 20
            Items.Strings = (
              '100105  '#28192#36947#38598#20013#31649#25511#24179#21488
              '100008  '#28192#36947#32508#21512#36816#33829#24179#21488
              '100012  '#32508#21512#33829#38144#26381#21153#24179#21488
              '100009  '#38598#22242#32508#21512#36816#33829#24179#21488
              '100000  BOP'#22522#30784#38376#25143
              '100106  IBOP'#20114#32852#32593#38376#25143
              '100017  MOP'#24179#21488
              '100016  '#32508#21512#32467#31639#36816#33829#24179#21488
              '100011  PBOSS'#38376#25143
              '100107  '#33021#21147#24320#25918#24179#21488#36816#33829#32773#38376#25143
              '------------------------------------------'
              '100004  '#23458#26381#31995#32479#38376#25143
              '------------------------------------------'
              '200005  '#25509#21475#37492#26435#38598#21512
              '------------------------------------------'
              '101710  IOP')
            ParentFont = False
            TabOrder = 0
          end
        end
      end
      object rbtnIop: TRadioButton
        Left = 167
        Top = 69
        Width = 139
        Height = 21
        Caption = 'IOP'#38376#25143
        TabOrder = 5
        OnClick = rbtnIopClick
      end
    end
  end
end
