object FormBsspCfgMain: TFormBsspCfgMain
  Left = 177
  Top = 92
  Width = 888
  Height = 587
  Caption = 'BSC'#37197#32622
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 878
    Height = 488
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #19994#21153#37197#32622'(business)'
      ParentShowHint = False
      ShowHint = True
      object Panel19: TPanel
        Left = 0
        Top = 0
        Width = 345
        Height = 457
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object GroupBox2: TGroupBox
          Left = 0
          Top = 205
          Width = 345
          Height = 252
          Align = alBottom
          Caption = 'BSSP'#25968#25454#24211#36830#25509
          TabOrder = 0
          object StaticText42: TStaticText
            Left = 50
            Top = 39
            Width = 68
            Height = 20
            Caption = 'IP:Port:SID'
            TabOrder = 0
          end
          object CB_TNS_NAME: TComboBox
            Left = 116
            Top = 39
            Width = 149
            Height = 24
            ImeName = #32043#20809#25340#38899#36755#20837#27861
            ItemHeight = 16
            ItemIndex = 0
            TabOrder = 1
            Text = '10.1.0.220:1521:kf'
            OnChange = CB_TNS_NAMEChange
            Items.Strings = (
              '10.1.0.220:1521:kf'
              '10.46.6.181:2481:custom')
          end
          object bbtnDbOpen: TBitBtn
            Left = 48
            Top = 162
            Width = 105
            Height = 31
            Caption = #36830#25509#25968#25454#24211
            TabOrder = 2
            OnClick = bbtnDbOpenClick
          end
          object bbtnDbClose: TBitBtn
            Left = 176
            Top = 162
            Width = 97
            Height = 31
            Caption = #26029#24320#36830#25509
            Enabled = False
            TabOrder = 3
            OnClick = bbtnDbCloseClick
          end
          object ed_user: TEdit
            Left = 32
            Top = 217
            Width = 121
            Height = 24
            TabOrder = 4
            Text = 'bssp'
            OnChange = cb_prefixClick
          end
          object cb_prefix: TCheckBox
            Left = 160
            Top = 217
            Width = 161
            Height = 16
            Caption = #33050#26412#22686#21152#29992#25143#27169#24335#21069#32512
            Checked = True
            State = cbChecked
            TabOrder = 5
            OnClick = cb_prefixClick
          end
          object ledDbUser: TLabeledEdit
            Left = 121
            Top = 73
            Width = 144
            Height = 24
            EditLabel.Width = 27
            EditLabel.Height = 16
            EditLabel.Caption = #29992#25143':'
            LabelPosition = lpLeft
            TabOrder = 6
            Text = 'bssp'
          end
          object ledDbPass: TLabeledEdit
            Left = 121
            Top = 112
            Width = 144
            Height = 24
            EditLabel.Width = 27
            EditLabel.Height = 16
            EditLabel.Caption = #23494#30721':'
            LabelPosition = lpLeft
            TabOrder = 7
            Text = 'bssp'
          end
        end
        object GroupBox10: TGroupBox
          Left = 0
          Top = 0
          Width = 345
          Height = 205
          Align = alClient
          Caption = #19994#21153#23450#20041#37197#32622' BSSP_BUSINESS'
          TabOrder = 1
          object StaticText1: TStaticText
            Left = 26
            Top = 23
            Width = 55
            Height = 20
            Hint = 'business_id '#19994#21153#26631#35782'('#26681#25454#30456#20851#25991#26723#23450#20041#22635#20889')'
            Caption = #19994#21153#26631#35782':'
            TabOrder = 0
          end
          object EditBusinessId: TEdit
            Left = 98
            Top = 23
            Width = 149
            Height = 24
            Hint = 'business_id '#19994#21153#26631#35782'('#26681#25454#30456#20851#25991#26723#23450#20041#22635#20889')'
            ImeName = #32043#20809#25340#38899#36755#20837#27861
            TabOrder = 1
            OnChange = EditBusinessIdChange
          end
          object bbtnGetBiz: TBitBtn
            Left = 256
            Top = 22
            Width = 80
            Height = 31
            Caption = #21462#19994#21153#37197#32622
            Enabled = False
            TabOrder = 2
            OnClick = bbtnGetBizClick
          end
          object StaticText2: TStaticText
            Left = 22
            Top = 57
            Width = 55
            Height = 20
            Hint = 'show_name '#26174#31034#21517#31216
            Caption = #26174#31034#21517#31216':'
            TabOrder = 3
          end
          object EditBizShowName: TEdit
            Left = 98
            Top = 53
            Width = 149
            Height = 24
            Hint = 'show_name '#26174#31034#21517#31216
            ImeName = #32043#20809#25340#38899#36755#20837#27861
            TabOrder = 4
            OnChange = EditBizShowNameChange
          end
          object StaticText3: TStaticText
            Left = 11
            Top = 87
            Width = 67
            Height = 20
            Hint = 
              'group_id '#24402#23646#32452#26631#35782' BSSP_Business_Group '#20013#23450#20041' Pms'#65306'100000 Ccs '#65306#33829#19994'101000 ' +
              #22823#23458#25143' 106000 '#38598#22242#23458#25143'107000 Biz'#65306' 210000 Res'#65306'160000'
            Caption = #24402#23646#32452#26631#35782':'
            TabOrder = 5
          end
          object CBBizGroupId: TComboBox
            Left = 98
            Top = 82
            Width = 149
            Height = 24
            ImeName = #32043#20809#25340#38899#36755#20837#27861
            ItemHeight = 16
            TabOrder = 6
            Text = '101000'
            Items.Strings = (
              '100000'
              '101000'
              '106000'
              '107000'
              '210000'
              '160000')
          end
          object StaticText4: TStaticText
            Left = 26
            Top = 117
            Width = 55
            Height = 20
            Hint = 'type '#19994#21153#31867#22411' 1 '#20132#26131#19994#21153' 2 '#26222#36890#26597#35810' 3 '#25968#25454#23383#20856#26597#35810' 4 '#39044#21046'SQL 5'#9#36716#21457#26597#35810' 6'#9#25991#20214#19994#21153' 7'#9#30331#24405
            Caption = #19994#21153#31867#22411':'
            TabOrder = 7
          end
          object ComBoxBizType: TComboBox
            Tag = 4
            Left = 98
            Top = 112
            Width = 149
            Height = 24
            Hint = 'type '#19994#21153#31867#22411' 1 '#20132#26131#19994#21153' 2 '#26222#36890#26597#35810' 3 '#25968#25454#23383#20856#26597#35810' 4 '#39044#21046'SQL 5'#9#36716#21457#26597#35810' 6 '#25991#20214#19994#21153' 7 '#30331#24405
            Style = csDropDownList
            ImeName = #32043#20809#25340#38899#36755#20837#27861
            ItemHeight = 16
            ItemIndex = 3
            TabOrder = 8
            Text = '4 '#39044#21046'SQL '
            Items.Strings = (
              '1 '#20132#26131#19994#21153' '
              '2 '#26222#36890#26597#35810' '
              '3 '#25968#25454#23383#20856#26597#35810' '
              '4 '#39044#21046'SQL '
              '5 '#36716#21457#26597#35810' '
              '6 '#25991#20214#19994#21153' '
              '7 '#30331#24405)
          end
          object StaticText5: TStaticText
            Left = 26
            Top = 145
            Width = 55
            Height = 20
            Hint = 'lifecycle '#29983#21629#21608#26399'(CRONTAB'#26684#24335')'
            Caption = #29983#21629#21608#26399':'
            TabOrder = 9
          end
          object EditBizLifeCycle: TEdit
            Left = 98
            Top = 142
            Width = 149
            Height = 24
            Hint = 'lifecycle '#29983#21629#21608#26399'(CRONTAB'#26684#24335')'
            ImeName = #32043#20809#25340#38899#36755#20837#27861
            TabOrder = 10
            Text = '* * * * *'
          end
          object ComBoxBizStatus: TComboBox
            Left = 98
            Top = 171
            Width = 149
            Height = 24
            Style = csDropDownList
            ImeName = #32043#20809#25340#38899#36755#20837#27861
            ItemHeight = 16
            ItemIndex = 0
            TabOrder = 11
            Text = '1 '#27491#24120
            Items.Strings = (
              '1 '#27491#24120
              '2 '#20572#29992
              '3 '#27880#38144)
          end
          object StaticText6: TStaticText
            Left = 55
            Top = 176
            Width = 31
            Height = 20
            Hint = 'status '#29366#24577' 1'#9#27491#24120' 2'#9#20572#29992' 3'#9#27880#38144
            Caption = #29366#24577':'
            TabOrder = 12
          end
          object StaticText7: TStaticText
            Left = 26
            Top = 204
            Width = 55
            Height = 20
            Hint = 'inure_date '#29983#25928#26102#38388
            Caption = #29983#25928#26102#38388':'
            TabOrder = 13
          end
          object EditBizInureDate: TEdit
            Left = 98
            Top = 201
            Width = 149
            Height = 24
            Hint = 'inure_date '#29983#25928#26102#38388
            ImeName = #32043#20809#25340#38899#36755#20837#27861
            TabOrder = 14
            Text = '20051001'
          end
          object EditBizExpireDate: TEdit
            Left = 98
            Top = 230
            Width = 149
            Height = 24
            Hint = 'expire_date '#22833#25928#26102#38388
            ImeName = #32043#20809#25340#38899#36755#20837#27861
            TabOrder = 15
            Text = '30000101'
          end
          object StaticText8: TStaticText
            Left = 26
            Top = 235
            Width = 55
            Height = 20
            Hint = 'expire_date '#22833#25928#26102#38388
            Caption = #22833#25928#26102#38388':'
            TabOrder = 16
          end
          object StaticText9: TStaticText
            Left = 55
            Top = 262
            Width = 31
            Height = 20
            Hint = 'description '#25551#36848
            Caption = #25551#36848':'
            TabOrder = 17
          end
          object EditBizDesc: TEdit
            Left = 98
            Top = 260
            Width = 149
            Height = 24
            Hint = 'description '#25551#36848
            ImeName = #32043#20809#25340#38899#36755#20837#27861
            TabOrder = 18
          end
          object BitBtn1: TBitBtn
            Left = 128
            Top = 290
            Width = 92
            Height = 32
            Caption = #29983#25104#33050#26412
            TabOrder = 19
            OnClick = BitBtn1Click
          end
        end
      end
      object Panel16: TPanel
        Left = 345
        Top = 0
        Width = 525
        Height = 457
        Align = alClient
        TabOrder = 1
        object GroupBox11: TGroupBox
          Left = 1
          Top = 1
          Width = 523
          Height = 272
          Align = alTop
          Caption = #19994#21153'-'#21463#29702#26469#28304#20851#31995'  BSSP_BUSINESS_REQUEST_RELATION'
          TabOrder = 0
          object sgBizRequest: TStringGrid
            Left = 2
            Top = 18
            Width = 519
            Height = 211
            Align = alClient
            ColCount = 10
            DefaultColWidth = 40
            DefaultRowHeight = 20
            RowCount = 2
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowMoving, goEditing, goTabs]
            TabOrder = 0
            OnRowMoved = sgBizRequestRowMoved
            OnSelectCell = sgBizRequestSelectCell
            ColWidths = (
              40
              75
              78
              56
              59
              56
              58
              57
              54
              40)
            RowHeights = (
              20
              20)
          end
          object Panel10: TPanel
            Left = 2
            Top = 229
            Width = 519
            Height = 41
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 1
            object Button1: TButton
              Left = 153
              Top = 9
              Width = 73
              Height = 24
              Caption = #22686#21152
              TabOrder = 0
              OnClick = Button1Click
            end
            object Button2: TButton
              Left = 256
              Top = 9
              Width = 75
              Height = 24
              Caption = #21024#38500
              TabOrder = 1
              OnClick = Button2Click
            end
            object Button3: TButton
              Left = 352
              Top = 9
              Width = 75
              Height = 24
              Caption = #29983#25104#33050#26412
              TabOrder = 2
              OnClick = Button3Click
            end
          end
          object cbRequestSource: TComboBox
            Left = 108
            Top = 82
            Width = 69
            Height = 24
            Hint = #32479#19968#19994#21153#26381#21153#24179#21488#65288'Unified Business Service Platform'#65289
            ImeName = #32043#20809#25340#38899#36755#20837#27861
            ItemHeight = 16
            TabOrder = 2
            Text = '201028'
            Visible = False
            OnChange = cbRequestSourceChange
            Items.Strings = (
              '201010'
              '201011'
              '201012'
              '201013'
              '201014'
              '201015'
              '201016'
              '201017'
              '201018'
              '201019'
              '201020'
              '201021'
              '201022'
              '201023'
              '201024'
              '201025'
              '201026'
              '201027'
              '201028'
              '201029'
              '201030')
          end
          object ComBoxVerify: TComboBox
            Left = 188
            Top = 86
            Width = 85
            Height = 24
            ImeName = #32043#20809#25340#38899#36755#20837#27861
            ItemHeight = 16
            ItemIndex = 0
            TabOrder = 3
            Text = '0 '#19981#38656#35201
            Visible = False
            OnChange = ComBoxVerifyChange
            Items.Strings = (
              '0 '#19981#38656#35201
              '1 '#38656#35201)
          end
          object ComBoxBizReqStatus: TComboBox
            Left = 268
            Top = 82
            Width = 69
            Height = 24
            ImeName = #32043#20809#25340#38899#36755#20837#27861
            ItemHeight = 16
            ItemIndex = 0
            TabOrder = 4
            Text = '1 '#27491#24120
            Visible = False
            OnChange = ComBoxBizReqStatusChange
            Items.Strings = (
              '1 '#27491#24120
              '2 '#20572#29992
              '3 '#27880#38144)
          end
          object cbRequestSource_name: TComboBox
            Left = 311
            Top = 113
            Width = 178
            Height = 24
            ImeName = #32043#20809#25340#38899#36755#20837#27861
            ItemHeight = 16
            TabOrder = 5
            Text = 'cbRequestSource_name'
            Visible = False
            Items.Strings = (
              #33829#19994#31649#29702#65288'Business ManageMent'#65289#9
              #32508#21512#24080#21153#65288'Integration Accounting'#65289#9
              #32508#21512#35745#36153#65288'Integration Billing'#65289#9
              #26381#21153#31649#29702#65288'Customer Service'#65289#9
              #33829#38144#31649#29702#65288'Active Selling Management'#65289#9
              #28192#36947#31649#29702#65288'Channel Management'#65289#9
              #36164#28304#31649#29702#65288'Resource Management'#65289#9
              #21512#20316#20249#20276#31649#29702#65288'Partner Managemnet'#65289#9
              #31995#32479#31649#29702#65288'System Management'#65289#9
              #25509#21475#31649#29702#65288'Interface Management'#65289#9
              #32479#35745#25253#34920#65288'Manufacture Report Management'#65289#9
              #21463#29702#21333#31649#29702#65288'Accept Flow Management'#65289#9
              #19994#21153#21463#29702#31649#29702#65288'Business Accept Management'#65289#9
              #19994#21153#26381#21153#20132#25442#24179#21488#65288'Business Service Switch Platform'#65289#9
              #20225#19994#31649#29702#65288'Enterprise Management'#65289#9
              #30693#35782#24211#31649#29702#65288'Knowbase Management'#65289#9
              #30005#23376#24037#20316#27969#65288'WorkFlow Management'#65289#9
              #32479#19968#25509#21475#32593#20851#65288'Unified Interface Gateway'#65289#9
              #32479#19968#19994#21153#26381#21153#24179#21488#65288'Unified Business Service Platform'#65289#9
              #32852#30431#21830#23478#65288'Cooperate Partner  Management'#65289#9
              'BIE'#25209#37327#26469#28304)
          end
          object cbFuzzy: TComboBox
            Left = 433
            Top = 79
            Width = 80
            Height = 24
            ItemHeight = 16
            ItemIndex = 0
            TabOrder = 6
            Text = '0 '#21542
            Visible = False
            OnChange = cbFuzzyChange
            Items.Strings = (
              '0 '#21542
              '1 '#26159)
          end
        end
        object GroupBox12: TGroupBox
          Left = 1
          Top = 273
          Width = 523
          Height = 183
          Align = alClient
          Caption = #19994#21153'-'#36807#31243#20851#31995' BSSP_BUSINESS_PROCESS_RELATION'
          TabOrder = 1
          object Panel12: TPanel
            Left = 2
            Top = 141
            Width = 519
            Height = 40
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 0
            object BitBtn25: TBitBtn
              Left = 142
              Top = 5
              Width = 92
              Height = 31
              Caption = #22686#21152
              TabOrder = 0
              OnClick = BitBtn25Click
            end
            object BitBtn27: TBitBtn
              Left = 250
              Top = 5
              Width = 92
              Height = 31
              Caption = #21024#38500
              TabOrder = 1
              OnClick = BitBtn27Click
            end
            object BitBtn4: TBitBtn
              Left = 358
              Top = 5
              Width = 92
              Height = 31
              Caption = #29983#25104#33050#26412
              TabOrder = 2
              OnClick = BitBtn4Click
            end
          end
          object sgBizProcess: TStringGrid
            Left = 2
            Top = 18
            Width = 519
            Height = 123
            Align = alClient
            DefaultColWidth = 60
            DefaultRowHeight = 20
            RowCount = 2
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowMoving, goEditing, goTabs, goAlwaysShowEditor]
            TabOrder = 1
            OnRowMoved = sgBizProcessRowMoved
            OnSelectCell = sgBizProcessSelectCell
            ColWidths = (
              60
              80
              77
              60
              189)
          end
          object cb_biz_status: TComboBox
            Left = 292
            Top = 54
            Width = 70
            Height = 24
            ImeName = #32043#20809#25340#38899#36755#20837#27861
            ItemHeight = 16
            TabOrder = 2
            Visible = False
            OnChange = cb_biz_statusChange
            Items.Strings = (
              '1 '#27491#24120
              '2 '#20572#29992'('#19981#33021#36873')'
              '3 '#27880#38144)
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #36807#31243#37197#32622'(process)'
      ImageIndex = 1
      ParentShowHint = False
      ShowHint = True
      object Panel7: TPanel
        Left = 289
        Top = 0
        Width = 581
        Height = 457
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object cbProcSvcStatus: TComboBox
          Left = 276
          Top = 89
          Width = 70
          Height = 24
          ImeName = #32043#20809#25340#38899#36755#20837#27861
          ItemHeight = 16
          ItemIndex = 0
          TabOrder = 0
          Text = '1 '#27491#24120
          Visible = False
          OnChange = cbProcSvcStatusChange
          Items.Strings = (
            '1 '#27491#24120
            '2 '#20572#29992'('#19981#33021#36873')'
            '3 '#27880#38144)
        end
        object GroupBox4: TGroupBox
          Left = 0
          Top = 0
          Width = 581
          Height = 217
          Align = alTop
          Caption = #36807#31243#27169#29256' BSSP_PROCESS_TEMPLATE'
          TabOrder = 1
          object Label12: TLabel
            Left = 21
            Top = 23
            Width = 51
            Height = 16
            Hint = 'process_id'
            Caption = #36807#31243#26631#35782':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label13: TLabel
            Left = 21
            Top = 55
            Width = 51
            Height = 16
            Hint = 'tx_type '#20107#21153#31867#22411' 1 TE 2 TUXEDO 3 DB'
            Caption = #20107#21153#31867#22411':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label14: TLabel
            Left = 21
            Top = 94
            Width = 51
            Height = 16
            Hint = 'pr_template SFDL'#23450#20041#30340#36807#31243#35268#21017#27169#26495
            Caption = #36807#31243#27169#26495':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label15: TLabel
            Left = 302
            Top = 23
            Width = 51
            Height = 16
            Hint = 'sync_mode '#21516#27493#27169#24335' 1 '#21516#27493' 2 '#24322#27493'('#21333#27493#31561') 3 '#24322#27493'('#20840#37096#31561')'
            Caption = #21516#27493#27169#24335':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label17: TLabel
            Left = 286
            Top = 60
            Width = 75
            Height = 16
            Hint = 'open_trace '#26159#21542#25171#24320#27969#27700' 0 '#19981#25171#24320' 1 '#25171#24320
            Caption = #26159#21542#25171#24320#27969#27700':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label18: TLabel
            Left = 278
            Top = 94
            Width = 83
            Height = 16
            Hint = 'invoke_mode '#35843#29992#27169#24335'('#36716#21457#29992') 1 Tuxedo 2 TE 3 HTTP 4 FCGI 5 DLL'
            Caption = #35843#29992#27169#24335'('#36716#21457'):'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label16: TLabel
            Left = 5
            Top = 137
            Width = 78
            Height = 16
            Hint = 'link_url '#38142#25509'URL'#22320#22336'('#36716#21457#36807#31243#29992')'
            Caption = #38142#25509'URL'#22320#22336':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object EditProcessID2: TEdit
            Left = 76
            Top = 23
            Width = 158
            Height = 24
            ImeName = #32043#20809#25340#38899#36755#20837#27861
            TabOrder = 0
          end
          object CBTxType: TComboBox
            Left = 76
            Top = 55
            Width = 158
            Height = 24
            Style = csDropDownList
            ImeName = #32043#20809#25340#38899#36755#20837#27861
            ItemHeight = 16
            ItemIndex = 2
            TabOrder = 1
            Text = '3 DB'
            Items.Strings = (
              '1 TE '
              '2 TUXEDO '
              '3 DB')
          end
          object BitBtn6: TBitBtn
            Left = 76
            Top = 90
            Width = 158
            Height = 31
            Caption = #37197#32622#27169#26495'...'
            ModalResult = 4
            TabOrder = 2
            OnClick = BitBtn6Click
            Glyph.Data = {
              DE010000424DDE01000000000000760000002800000024000000120000000100
              0400000000006801000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
              33333333333F8888883F33330000324334222222443333388F3833333388F333
              000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
              F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
              223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
              3338888300003AAAAAAA33333333333888888833333333330000333333333333
              333333333333333333FFFFFF000033333333333344444433FFFF333333888888
              00003A444333333A22222438888F333338F3333800003A2243333333A2222438
              F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
              22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
              33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
              3333333333338888883333330000333333333333333333333333333333333333
              0000}
            NumGlyphs = 2
          end
          object CBSyncMode: TComboBox
            Left = 370
            Top = 23
            Width = 159
            Height = 24
            Style = csDropDownList
            ImeName = #32043#20809#25340#38899#36755#20837#27861
            ItemHeight = 16
            ItemIndex = 0
            TabOrder = 3
            Text = '1 '#21516#27493' '
            Items.Strings = (
              '1 '#21516#27493' '
              '2 '#24322#27493'('#21333#27493#31561') '
              '3 '#24322#27493'('#20840#37096#31561')')
          end
          object CBOpenTrace: TComboBox
            Left = 369
            Top = 57
            Width = 120
            Height = 24
            Style = csDropDownList
            ImeName = #32043#20809#25340#38899#36755#20837#27861
            ItemHeight = 16
            ItemIndex = 1
            TabOrder = 4
            Text = '1 '#25171#24320
            Items.Strings = (
              '0 '#19981#25171#24320' '
              '1 '#25171#24320)
          end
          object CBInvokeMode: TComboBox
            Left = 369
            Top = 89
            Width = 120
            Height = 24
            Style = csDropDownList
            ImeName = #32043#20809#25340#38899#36755#20837#27861
            ItemHeight = 16
            ItemIndex = 2
            TabOrder = 5
            Text = '3 HTTP '
            Items.Strings = (
              '1 Tuxedo '
              '2 TE '
              '3 HTTP '
              '4 FCGI '
              '5 DLL')
          end
          object CBLinkURL: TComboBox
            Left = 91
            Top = 135
            Width = 438
            Height = 24
            ImeName = #32043#20809#25340#38899#36755#20837#27861
            ItemHeight = 16
            ItemIndex = 0
            TabOrder = 6
            Text = 'BSSP_PREFAB_SQL_CCS'
            Items.Strings = (
              'BSSP_PREFAB_SQL_CCS'
              'BSSP_PREFAB_SQL_BIZ'
              'BSSP_PREFAB_SQL_PMS'
              'BSSP_PREFAB_SQL_RES'
              'BSSP_ADMIN_SRV'
              'BSSP_PREFAB_SQL_DICT'
              'BSSP_PREFAB_SQL_SMS'
              'BSSP_PREFAB_SQL_AC')
          end
          object PButtonClick2: TButton
            Left = 268
            Top = 169
            Width = 93
            Height = 30
            Caption = #29983#25104#33050#26412
            TabOrder = 7
            OnClick = PButtonClick2Click
          end
          object bbtnGetLinkUrl: TBitBtn
            Left = 544
            Top = 137
            Width = 75
            Height = 24
            Caption = #35835#21462#37197#32622
            Enabled = False
            TabOrder = 8
            OnClick = bbtnGetLinkUrlClick
          end
        end
        object GroupBox5: TGroupBox
          Left = 0
          Top = 217
          Width = 581
          Height = 240
          Align = alClient
          Caption = #36807#31243#26381#21153#20851#31995' BSSP_PROCESS_SERVICE_RELATION'
          TabOrder = 2
          object Panel8: TPanel
            Left = 2
            Top = 18
            Width = 577
            Height = 60
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object BitBtn28: TBitBtn
              Left = 138
              Top = 12
              Width = 102
              Height = 30
              Hint = #30001#36807#31243#27169#26495#33258#21160#29983#25104#36807#31243'-'#26381#21153#23545#24212#20851#31995
              Caption = #33258#21160#29983#25104
              TabOrder = 0
              OnClick = BitBtn28Click
            end
            object BitBtn29: TBitBtn
              Left = 492
              Top = 12
              Width = 93
              Height = 30
              Caption = #29983#25104#33050#26412
              TabOrder = 1
              OnClick = BitBtn29Click
            end
            object BitBtn30: TBitBtn
              Left = 384
              Top = 12
              Width = 92
              Height = 30
              Caption = #21024#38500
              TabOrder = 2
              OnClick = BitBtn30Click
            end
            object BitBtn32: TBitBtn
              Left = 266
              Top = 12
              Width = 92
              Height = 30
              Caption = #22686#21152
              TabOrder = 3
              OnClick = BitBtn32Click
            end
          end
          object sgProcSvc: TStringGrid
            Left = 2
            Top = 78
            Width = 577
            Height = 160
            Align = alClient
            DefaultColWidth = 50
            DefaultRowHeight = 20
            RowCount = 2
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowMoving, goEditing]
            TabOrder = 1
            OnRowMoved = sgProcSvcRowMoved
            OnSelectCell = sgProcSvcSelectCell
            ColWidths = (
              50
              84
              82
              59
              241)
          end
        end
      end
      object GroupBox3: TGroupBox
        Left = 0
        Top = 0
        Width = 289
        Height = 457
        Align = alLeft
        Caption = #36807#31243#23450#20041' BSSP_PROCESS'
        TabOrder = 1
        object Label2: TLabel
          Left = 10
          Top = 39
          Width = 51
          Height = 16
          Hint = 'process_id'
          Caption = #36807#31243#26631#35782':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 10
          Top = 79
          Width = 51
          Height = 16
          Hint = 'process_code'
          Caption = #36807#31243#32534#30721':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel
          Left = 10
          Top = 118
          Width = 51
          Height = 16
          Hint = 'show_name '#20013#25991#21517#31216
          Caption = #26174#31034#21517#31216':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 10
          Top = 158
          Width = 63
          Height = 16
          Hint = 
            'group_id '#24402#23646#32452#26631#35782' BSSP_Business_Group '#20013#23450#20041' Pms'#65306'100000 Ccs '#65306#33829#19994'101000 ' +
            #22823#23458#25143' 106000 '#38598#22242#23458#25143'107000 Biz'#65306' 210000 Res'#65306'160000'
          Caption = #24402#23646#32452#26631#35782':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel
          Left = 10
          Top = 197
          Width = 51
          Height = 16
          Hint = 'type '#36807#31243#31867#22411' 1 '#27491#24120' 2 '#36716#21457'('#39044#21046#26597#35810#20351#29992'2)'
          Caption = #36807#31243#31867#22411':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 10
          Top = 226
          Width = 51
          Height = 16
          Hint = 'type '#36807#31243#31867#22411' 1 '#27491#24120' 2 status '#29366#24577' 1'#27491#24120' 2'#20572#29992' 3'#27880#38144
          Caption = #29366'        '#24577':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label8: TLabel
          Left = 10
          Top = 256
          Width = 51
          Height = 16
          Hint = 'create_date'
          Caption = #21019#24314#26102#38388':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label9: TLabel
          Left = 10
          Top = 286
          Width = 51
          Height = 16
          Hint = 'modify_date'
          Caption = #20462#25913#26102#38388':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label10: TLabel
          Left = 10
          Top = 315
          Width = 51
          Height = 16
          Hint = 'description '#35814#32454#25551#36848
          Caption = #25551'        '#36848':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object EditProcessID: TEdit
          Left = 81
          Top = 39
          Width = 112
          Height = 24
          Hint = #36807#31243#26631#35782':process_id'
          ImeName = #32043#20809#25340#38899#36755#20837#27861
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnChange = EditProcessIDChange
        end
        object bbtnGetProcess: TBitBtn
          Left = 196
          Top = 39
          Width = 90
          Height = 31
          Caption = #21462#36807#31243#37197#32622
          Enabled = False
          TabOrder = 1
          OnClick = bbtnGetProcessClick
        end
        object EditProcessCode: TEdit
          Left = 81
          Top = 79
          Width = 149
          Height = 24
          Hint = 'process_code'
          ImeName = #32043#20809#25340#38899#36755#20837#27861
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
        end
        object EditProcShowName: TEdit
          Left = 81
          Top = 118
          Width = 149
          Height = 24
          Hint = 'show_name'
          ImeName = #32043#20809#25340#38899#36755#20837#27861
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnChange = EditProcShowNameChange
        end
        object CBProcGroupID: TComboBox
          Left = 82
          Top = 158
          Width = 165
          Height = 24
          ImeName = #32043#20809#25340#38899#36755#20837#27861
          ItemHeight = 16
          ItemIndex = 0
          TabOrder = 4
          Text = '301000 : '#26597#35810#31867#20132#26131
          Items.Strings = (
            '301000 : '#26597#35810#31867#20132#26131
            '302000 : '#21463#29702#31867#20132#26131
            '303000 : '#31649#29702#31867#20132#26131)
        end
        object CBProcType: TComboBox
          Left = 81
          Top = 197
          Width = 149
          Height = 24
          Hint = #36807#31243#31867#22411':1 '#27491#24120',2 '#36716#21457
          Style = csDropDownList
          ImeName = #32043#20809#25340#38899#36755#20837#27861
          ItemHeight = 16
          ItemIndex = 1
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          Text = '2 '#36716#21457'('#39044#21046#26597#35810#20351#29992'2)'
          Items.Strings = (
            '1 '#27491#24120' '
            '2 '#36716#21457'('#39044#21046#26597#35810#20351#29992'2)')
        end
        object CBProcStatus: TComboBox
          Left = 81
          Top = 226
          Width = 149
          Height = 24
          Style = csDropDownList
          ImeName = #32043#20809#25340#38899#36755#20837#27861
          ItemHeight = 16
          ItemIndex = 0
          TabOrder = 6
          Text = '1 '#27491#24120
          Items.Strings = (
            '1 '#27491#24120
            '2 '#20572#29992
            '3 '#27880#38144)
        end
        object EditCTime: TEdit
          Left = 81
          Top = 256
          Width = 149
          Height = 24
          TabStop = False
          Color = clScrollBar
          ImeName = #32043#20809#25340#38899#36755#20837#27861
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 7
          Text = 'SYSDATE'
        end
        object EditMTime: TEdit
          Left = 81
          Top = 286
          Width = 149
          Height = 24
          TabStop = False
          Color = clScrollBar
          ImeName = #32043#20809#25340#38899#36755#20837#27861
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 8
          Text = 'NULL'
        end
        object EditProcDesc: TEdit
          Left = 81
          Top = 315
          Width = 149
          Height = 24
          ImeName = #32043#20809#25340#38899#36755#20837#27861
          ParentShowHint = False
          ShowHint = True
          TabOrder = 9
        end
        object PButtonClick: TButton
          Left = 90
          Top = 364
          Width = 93
          Height = 31
          Caption = #29983#25104#33050#26412
          TabOrder = 10
          OnClick = PButtonClickClick
        end
      end
    end
    object TabSheet6: TTabSheet
      Caption = #36807#31243#21442#25968#37197#32622
      ImageIndex = 5
      object sg_proc: TStringGrid
        Left = 0
        Top = 70
        Width = 870
        Height = 387
        Align = alClient
        ColCount = 10
        DefaultColWidth = 70
        DefaultRowHeight = 20
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowMoving, goEditing, goTabs, goAlwaysShowEditor]
        TabOrder = 0
        OnRowMoved = sg_procRowMoved
        OnSelectCell = sg_procSelectCell
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 870
        Height = 70
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 1
        DesignSize = (
          870
          70)
        object StaticText28: TStaticText
          Left = 202
          Top = 10
          Width = 242
          Height = 20
          Anchors = [akTop]
          Caption = #36807#31243#21442#25968#37197#32622' BSSP_PROCESS_PARAM'
          TabOrder = 0
        end
        object BitBtn8: TBitBtn
          Left = 399
          Top = 20
          Width = 92
          Height = 30
          Anchors = [akRight]
          Caption = #22686#21152
          TabOrder = 1
          OnClick = BitBtn8Click
        end
        object BitBtn9: TBitBtn
          Left = 497
          Top = 20
          Width = 93
          Height = 30
          Anchors = [akRight]
          Caption = #25554#20837
          TabOrder = 2
          OnClick = BitBtn9Click
        end
        object BitBtn20: TBitBtn
          Left = 596
          Top = 20
          Width = 91
          Height = 30
          Anchors = [akRight]
          Caption = #21024#38500
          TabOrder = 3
          OnClick = BitBtn20Click
        end
        object BitBtn21: TBitBtn
          Left = 695
          Top = 20
          Width = 93
          Height = 30
          Anchors = [akRight]
          Caption = #29983#25104#33050#26412
          TabOrder = 4
          OnClick = BitBtn21Click
        end
        object bbtnGetProcessParam: TBitBtn
          Left = 256
          Top = 36
          Width = 119
          Height = 30
          Caption = #21462#36807#31243#21442#25968#37197#32622
          Enabled = False
          TabOrder = 5
          OnClick = bbtnGetProcessParamClick
        end
        object StaticText47: TStaticText
          Left = 20
          Top = 39
          Width = 71
          Height = 20
          Caption = 'process_id'
          TabOrder = 6
        end
        object ed_process_id: TEdit
          Left = 89
          Top = 39
          Width = 149
          Height = 24
          ImeName = #32043#20809#25340#38899#36755#20837#27861
          TabOrder = 7
        end
      end
      object cb_inout: TComboBox
        Left = 522
        Top = 118
        Width = 90
        Height = 24
        ImeName = #32043#20809#25340#38899#36755#20837#27861
        ItemHeight = 16
        TabOrder = 2
        Visible = False
        OnChange = cb_inoutChange
        Items.Strings = (
          '0 '#36755#20986' '
          '1 '#36755#20837' '
          '2 '#36755#20837#36755#20986)
      end
      object cb_procopt: TComboBox
        Left = 620
        Top = 118
        Width = 90
        Height = 24
        ImeName = #32043#20809#25340#38899#36755#20837#27861
        ItemHeight = 16
        TabOrder = 3
        Visible = False
        OnChange = cb_procoptChange
        Items.Strings = (
          '1   0...1'
          '2   1'
          '3   0...n'
          '4   1...n')
      end
    end
    object TabSheet3: TTabSheet
      Caption = #39044#21046'SQL(prefab_sql)'
      ImageIndex = 2
      ParentShowHint = False
      ShowHint = True
      object Panel17: TPanel
        Left = 337
        Top = 0
        Width = 533
        Height = 457
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object GroupBox6: TGroupBox
          Left = 0
          Top = 0
          Width = 533
          Height = 385
          Align = alTop
          Caption = #39044#32622#26597#35810#35821#21477' BSSP_PREFAB_SQL_STATEMENT'
          TabOrder = 0
          object sgSqlStat: TStringGrid
            Left = 2
            Top = 18
            Width = 529
            Height = 302
            Align = alClient
            ColCount = 6
            DefaultColWidth = 50
            DefaultRowHeight = 20
            RowCount = 2
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowMoving, goEditing]
            TabOrder = 0
            OnClick = sgSqlStatClick
            OnRowMoved = sgSqlStatRowMoved
            OnSelectCell = sgSqlStatSelectCell
            ColWidths = (
              50
              86
              136
              96
              90
              92)
          end
          object bbtSqlStat: TBitBtn
            Left = 224
            Top = 208
            Width = 33
            Height = 25
            Caption = 'SQL'
            TabOrder = 1
            Visible = False
            OnClick = bbtSqlStatClick
          end
          object Panel15: TPanel
            Left = 2
            Top = 320
            Width = 529
            Height = 63
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 2
            object BitBtn5: TBitBtn
              Left = 124
              Top = 9
              Width = 93
              Height = 30
              Caption = #22686#21152
              TabOrder = 0
              OnClick = BitBtn5Click
            end
            object BitBtn26: TBitBtn
              Left = 224
              Top = 9
              Width = 94
              Height = 30
              Caption = #21024#38500
              TabOrder = 1
              OnClick = BitBtn26Click
            end
            object PrefabSqlStateButtom: TButton
              Left = 329
              Top = 9
              Width = 92
              Height = 30
              Caption = #29983#25104#33050#26412
              TabOrder = 2
              OnClick = PrefabSqlStateButtomClick
            end
          end
        end
      end
      object GroupBox7: TGroupBox
        Left = 0
        Top = 0
        Width = 337
        Height = 457
        Align = alLeft
        Caption = #39044#32622'SQL BSSP_PREFAB_SQL'
        TabOrder = 1
        object Label21: TLabel
          Left = 10
          Top = 49
          Width = 77
          Height = 16
          Hint = 'SQL_ID'#21807#19968#30830#23450#39044#21046'SQL'#30340#26631#35782'('#23545#24212#26381#21153#35831#27714#25253#25991#20013#30340'order_type)'
          Caption = #39044#21046'SQL'#26631#35782':'
        end
        object Label22: TLabel
          Left = 10
          Top = 89
          Width = 77
          Height = 16
          Hint = 'SQL_NAME'#26631#35782#35821#21477#20316#29992#30340#21517#31216'('#23545#24212#19994#21153#35831#27714#25253#25991#20013#30340'process_code)'
          Caption = #39044#21046'SQL'#21517#31216':'
        end
        object Label23: TLabel
          Left = 10
          Top = 128
          Width = 63
          Height = 16
          Hint = 
            'group_id '#24402#23646#32452#26631#35782' BSSP_Business_Group '#20013#23450#20041' Pms'#65306'100000 Ccs '#65306#33829#19994'101000 ' +
            #22823#23458#25143' 106000 '#38598#22242#23458#25143'107000 Biz'#65306' 210000 Res'#65306'160000'
          Caption = #24402#23646#32452#26631#35782':'
        end
        object Label24: TLabel
          Left = 10
          Top = 167
          Width = 63
          Height = 16
          Hint = 'SUBSYSTEM_ID'
          Caption = #23376#31995#32479#26631#35782':'
        end
        object Label25: TLabel
          Left = 10
          Top = 207
          Width = 77
          Height = 16
          Hint = 'SQL_TYPE'
          Caption = 'SQL'#35821#21477#31867#22411':'
        end
        object Label26: TLabel
          Left = 10
          Top = 246
          Width = 51
          Height = 16
          Hint = 'OUT_TEMPLATE'
          Caption = #36755#20986#27169#26495':'
        end
        object Label27: TLabel
          Left = 10
          Top = 286
          Width = 51
          Height = 16
          Caption = #21019#24314#26102#38388':'
        end
        object Label28: TLabel
          Left = 10
          Top = 325
          Width = 51
          Height = 16
          Caption = #20462#25913#26102#38388':'
        end
        object Label29: TLabel
          Left = 10
          Top = 364
          Width = 51
          Height = 16
          Caption = #25551'        '#36848':'
        end
        object Label1: TLabel
          Left = 10
          Top = 407
          Width = 60
          Height = 16
          Caption = #25968#25454#24211#31867#22411
        end
        object EditSqlID: TEdit
          Left = 108
          Top = 49
          Width = 117
          Height = 24
          ImeName = #32043#20809#25340#38899#36755#20837#27861
          TabOrder = 0
          OnChange = EditSqlIDChange
        end
        object EditSqlName: TEdit
          Left = 108
          Top = 89
          Width = 149
          Height = 24
          ImeName = #32043#20809#25340#38899#36755#20837#27861
          TabOrder = 1
        end
        object CBSqlGroupID: TComboBox
          Left = 108
          Top = 128
          Width = 149
          Height = 24
          ImeName = #32043#20809#25340#38899#36755#20837#27861
          ItemHeight = 16
          ItemIndex = 1
          TabOrder = 2
          Text = '101000'
          Items.Strings = (
            '100000'
            '101000'
            '106000'
            '107000'
            '210000'
            '160000')
        end
        object CBSubSysID: TComboBox
          Left = 108
          Top = 167
          Width = 149
          Height = 24
          Style = csDropDownList
          ImeName = #32043#20809#25340#38899#36755#20837#27861
          ItemHeight = 16
          ItemIndex = 1
          TabOrder = 3
          Text = '1   '#33829#19994
          Items.Strings = (
            '0   BSSP'
            '1   '#33829#19994
            '2   '#24080#21153
            '3   '#35745#36153
            '4   '#28192#36947)
        end
        object CBSqlType: TComboBox
          Left = 108
          Top = 207
          Width = 149
          Height = 24
          Style = csDropDownList
          ImeName = #32043#20809#25340#38899#36755#20837#27861
          ItemHeight = 16
          ItemIndex = 0
          TabOrder = 4
          Text = '1 select'
          Items.Strings = (
            '1 select'
            '2 update'
            '3 delete'
            '4 insert')
        end
        object BitBtnOutTempl: TBitBtn
          Left = 108
          Top = 246
          Width = 149
          Height = 31
          Caption = #37197#32622#36755#20986#27169#26495'...'
          ModalResult = 4
          TabOrder = 5
          OnClick = BitBtnOutTemplClick
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
            33333333333F8888883F33330000324334222222443333388F3833333388F333
            000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
            F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
            223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
            3338888300003AAAAAAA33333333333888888833333333330000333333333333
            333333333333333333FFFFFF000033333333333344444433FFFF333333888888
            00003A444333333A22222438888F333338F3333800003A2243333333A2222438
            F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
            22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
            33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
            3333333333338888883333330000333333333333333333333333333333333333
            0000}
          NumGlyphs = 2
        end
        object EditCTimeSql: TEdit
          Left = 108
          Top = 286
          Width = 149
          Height = 24
          TabStop = False
          Color = clScrollBar
          ImeName = #32043#20809#25340#38899#36755#20837#27861
          ReadOnly = True
          TabOrder = 6
          Text = 'SYSDATE'
        end
        object EditMTimeSql: TEdit
          Left = 108
          Top = 325
          Width = 149
          Height = 24
          TabStop = False
          Color = clScrollBar
          ImeName = #32043#20809#25340#38899#36755#20837#27861
          ReadOnly = True
          TabOrder = 7
          Text = 'NULL'
        end
        object EditDescSql: TEdit
          Left = 108
          Top = 364
          Width = 149
          Height = 24
          ImeName = #32043#20809#25340#38899#36755#20837#27861
          TabOrder = 8
        end
        object PrefabSqlButtonClick: TButton
          Left = 113
          Top = 441
          Width = 91
          Height = 30
          Caption = #29983#25104#33050#26412
          TabOrder = 9
          OnClick = PrefabSqlButtonClickClick
        end
        object bbtnGetSql: TBitBtn
          Left = 226
          Top = 46
          Width = 103
          Height = 30
          Caption = #21462#39044#21046#26597#35810#37197#32622
          Enabled = False
          TabOrder = 10
          OnClick = bbtnGetSqlClick
        end
        object cboxDbType: TComboBox
          Left = 108
          Top = 404
          Width = 149
          Height = 24
          Style = csDropDownList
          ItemHeight = 16
          ItemIndex = 1
          TabOrder = 11
          Text = '1 Oracle'#24211
          Items.Strings = (
            '0 TT'#20869#23384#24211
            '1 Oracle'#24211
            '2 '#20808'TT'#21518'Oracle')
        end
      end
    end
    object TabSheet7: TTabSheet
      Caption = #39044#21046'SQL'#21442#25968#37197#32622
      ImageIndex = 6
      object Splitter2: TSplitter
        Left = 0
        Top = 306
        Width = 870
        Height = 7
        Cursor = crVSplit
        Align = alTop
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 870
        Height = 306
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 0
        object sg_sqlin: TStringGrid
          Left = 1
          Top = 70
          Width = 868
          Height = 235
          Align = alClient
          ColCount = 10
          DefaultColWidth = 70
          DefaultRowHeight = 20
          RowCount = 2
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goColSizing, goRowMoving, goEditing, goTabs, goAlwaysShowEditor]
          TabOrder = 0
          OnEnter = sg_sqlinEnter
          OnRowMoved = sg_sqlinRowMoved
          OnSelectCell = sg_sqlinSelectCell
        end
        object Panel11: TPanel
          Left = 1
          Top = 1
          Width = 868
          Height = 69
          Align = alTop
          TabOrder = 1
          DesignSize = (
            868
            69)
          object StaticText45: TStaticText
            Left = 10
            Top = 30
            Width = 50
            Height = 20
            Caption = 'SQL_ID'
            TabOrder = 0
          end
          object ed_sql_id: TEdit
            Left = 69
            Top = 30
            Width = 149
            Height = 24
            ImeName = #32043#20809#25340#38899#36755#20837#27861
            TabOrder = 1
          end
          object StaticText46: TStaticText
            Left = 236
            Top = 30
            Width = 29
            Height = 20
            Caption = 'Seq'
            TabOrder = 2
          end
          object bbtnGetSqlParam: TBitBtn
            Left = 354
            Top = 30
            Width = 130
            Height = 30
            Caption = #21462'SQL'#35821#21477#21442#25968
            Enabled = False
            TabOrder = 3
            OnClick = bbtnGetSqlParamClick
          end
          object StaticText79: TStaticText
            Left = 107
            Top = 7
            Width = 332
            Height = 20
            Anchors = [akTop]
            Caption = #39044#21046#26597#35810#36755#20837#21442#25968#37197#32622' BSSP_PREFAB_SQL_IN_PARAM'
            TabOrder = 4
          end
          object BitBtn12: TBitBtn
            Left = 273
            Top = 26
            Width = 93
            Height = 31
            Anchors = [akRight]
            Caption = #22686#21152'(&A)'
            TabOrder = 5
            OnClick = BitBtn12Click
          end
          object BitBtn13: TBitBtn
            Left = 372
            Top = 26
            Width = 93
            Height = 31
            Anchors = [akRight]
            Caption = #25554#20837'(&I)'
            TabOrder = 6
            OnClick = BitBtn13Click
          end
          object BitBtn14: TBitBtn
            Left = 470
            Top = 26
            Width = 93
            Height = 31
            Anchors = [akRight]
            Caption = #21024#38500'(&D)'
            TabOrder = 7
            OnClick = BitBtn14Click
          end
          object BitBtn15: TBitBtn
            Left = 568
            Top = 26
            Width = 92
            Height = 31
            Anchors = [akRight]
            Caption = #29983#25104#33050#26412
            TabOrder = 8
            OnClick = BitBtn15Click
          end
          object sped_sql_seq: TSpinEdit
            Left = 276
            Top = 30
            Width = 60
            Height = 26
            MaxValue = 100
            MinValue = 1
            TabOrder = 9
            Value = 1
          end
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 313
        Width = 870
        Height = 144
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 1
        object sg_sqlout: TStringGrid
          Left = 1
          Top = 60
          Width = 868
          Height = 83
          Align = alClient
          ColCount = 12
          DefaultColWidth = 66
          DefaultRowHeight = 20
          RowCount = 2
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowMoving, goEditing, goTabs, goAlwaysShowEditor]
          TabOrder = 0
          OnEnter = sg_sqloutEnter
          OnRowMoved = sg_sqloutRowMoved
          OnSelectCell = sg_sqloutSelectCell
        end
        object Panel14: TPanel
          Left = 1
          Top = 1
          Width = 868
          Height = 59
          Align = alTop
          TabOrder = 1
          DesignSize = (
            868
            59)
          object StaticText80: TStaticText
            Left = 72
            Top = 10
            Width = 348
            Height = 20
            Anchors = [akTop]
            Caption = #39044#21046#26597#35810#36755#20986#21442#25968#37197#32622' BSSP_PREFAB_SQL_OUT_PARAM'
            TabOrder = 0
          end
          object BitBtn16: TBitBtn
            Left = 273
            Top = 11
            Width = 93
            Height = 31
            Anchors = [akRight]
            Caption = #22686#21152
            TabOrder = 1
            OnClick = BitBtn16Click
          end
          object BitBtn17: TBitBtn
            Left = 372
            Top = 11
            Width = 93
            Height = 31
            Anchors = [akRight]
            Caption = #25554#20837
            TabOrder = 2
            OnClick = BitBtn17Click
          end
          object BitBtn18: TBitBtn
            Left = 470
            Top = 11
            Width = 93
            Height = 31
            Anchors = [akRight]
            Caption = #21024#38500
            TabOrder = 3
            OnClick = BitBtn18Click
          end
          object BitBtn19: TBitBtn
            Left = 568
            Top = 11
            Width = 92
            Height = 31
            Anchors = [akRight]
            Caption = #29983#25104#33050#26412
            TabOrder = 4
            OnClick = BitBtn19Click
          end
        end
      end
      object cb_empty: TComboBox
        Left = 532
        Top = 118
        Width = 80
        Height = 24
        ImeName = #32043#20809#25340#38899#36755#20837#27861
        ItemHeight = 16
        TabOrder = 2
        TabStop = False
        Visible = False
        OnChange = cb_emptyChange
        Items.Strings = (
          '0 '#21542
          '1 '#26159)
      end
      object cb_paramtype: TComboBox
        Left = 266
        Top = 118
        Width = 80
        Height = 24
        BevelInner = bvNone
        BevelOuter = bvNone
        ImeName = #32043#20809#25340#38899#36755#20837#27861
        ItemHeight = 16
        TabOrder = 3
        TabStop = False
        Visible = False
        OnChange = cb_paramtypeChange
        Items.Strings = (
          '1'#65293'number'
          '2'#65293'long'
          '3'#65293'varchar2'
          '9'#65293'in'#26465#20214' '
          '10'#65293'like'#26465#20214)
      end
    end
    object TabSheet5: TTabSheet
      Caption = #26381#21153#37197#32622'(service)'
      ImageIndex = 4
      ParentShowHint = False
      ShowHint = True
      object GroupBox8: TGroupBox
        Left = 0
        Top = 0
        Width = 870
        Height = 417
        Align = alTop
        Caption = #26381#21153#37197#32622' BSSP_SERVICE'
        TabOrder = 0
        object StaticText55: TStaticText
          Left = 74
          Top = 59
          Width = 52
          Height = 20
          Hint = 'service_id '#26381#21153#26631#35782'('#23545#24212'order_type)'
          Caption = #26381#21153#26631#35782
          TabOrder = 0
        end
        object EditServiceId: TEdit
          Left = 148
          Top = 59
          Width = 198
          Height = 24
          ImeName = #32043#20809#25340#38899#36755#20837#27861
          TabOrder = 1
        end
        object bbtnGetService: TBitBtn
          Left = 364
          Top = 59
          Width = 100
          Height = 31
          Caption = #21462#26381#21153#37197#32622
          Enabled = False
          TabOrder = 2
          OnClick = bbtnGetServiceClick
        end
        object StaticText62: TStaticText
          Left = 502
          Top = 58
          Width = 52
          Height = 20
          Hint = 'timeout '#36229#26102#26102#38271
          Caption = #36229#26102#26102#38271
          TabOrder = 3
        end
        object EditSevTimeOut: TEdit
          Left = 581
          Top = 55
          Width = 208
          Height = 24
          ImeName = #32043#20809#25340#38899#36755#20837#27861
          TabOrder = 4
          Text = '30'
        end
        object StaticText68: TStaticText
          Left = 798
          Top = 58
          Width = 16
          Height = 20
          Caption = #31186
          TabOrder = 5
        end
        object StaticText56: TStaticText
          Left = 74
          Top = 100
          Width = 52
          Height = 20
          Hint = 'service_name'#9#26381#21153#21517#31216'('#20986#29616#22312'SFDL'#20013#30340#23450#20041')'
          Caption = #26381#21153#21517#31216
          TabOrder = 6
        end
        object EditServiceName: TEdit
          Left = 148
          Top = 98
          Width = 198
          Height = 24
          ImeName = #32043#20809#25340#38899#36755#20837#27861
          TabOrder = 7
        end
        object StaticText63: TStaticText
          Left = 532
          Top = 96
          Width = 28
          Height = 20
          Hint = 'status '#29366#24577' (1 '#27491#24120' 3 '#27880#38144')'
          Caption = #29366#24577
          TabOrder = 8
        end
        object CBSevStatus: TComboBox
          Left = 581
          Top = 95
          Width = 237
          Height = 24
          Style = csDropDownList
          ImeName = #32043#20809#25340#38899#36755#20837#27861
          ItemHeight = 16
          ItemIndex = 0
          TabOrder = 9
          Text = '1 '#27491#24120
          Items.Strings = (
            '1 '#27491#24120
            '2 '#20572#29992'('#19981#33021#36873')'
            '3 '#27880#38144)
        end
        object StaticText57: TStaticText
          Left = 74
          Top = 140
          Width = 52
          Height = 20
          Hint = 'show_name '#26174#31034#21517#31216
          Caption = #26174#31034#21517#31216
          TabOrder = 10
        end
        object EditSevShowName: TEdit
          Left = 148
          Top = 138
          Width = 198
          Height = 24
          ImeName = #32043#20809#25340#38899#36755#20837#27861
          TabOrder = 11
          OnChange = EditSevShowNameChange
        end
        object StaticText64: TStaticText
          Left = 502
          Top = 137
          Width = 52
          Height = 20
          Hint = 'create_date '#21019#24314#26102#38388
          Caption = #21019#24314#26102#38388
          TabOrder = 12
        end
        object EditSevCreateDate: TEdit
          Left = 581
          Top = 134
          Width = 237
          Height = 24
          TabStop = False
          Color = clScrollBar
          ImeName = #32043#20809#25340#38899#36755#20837#27861
          ReadOnly = True
          TabOrder = 13
          Text = 'SYSDATE'
        end
        object StaticText58: TStaticText
          Left = 74
          Top = 182
          Width = 52
          Height = 20
          Hint = 'invoke_mode '#35843#29992#27169#24335' (1 Tuxedo 2 TE 3 HTTP 4 FCGI 5 DLL)'
          Caption = #35843#29992#27169#24335
          TabOrder = 14
        end
        object CBSevInvokeMode: TComboBox
          Left = 148
          Top = 177
          Width = 198
          Height = 24
          Style = csDropDownList
          ImeName = #32043#20809#25340#38899#36755#20837#27861
          ItemHeight = 16
          ItemIndex = 2
          TabOrder = 15
          Text = '3 HTTP '
          Items.Strings = (
            '1 Tuxedo '
            '2 TE '
            '3 HTTP '
            '4 FCGI '
            '5 DLL')
        end
        object StaticText65: TStaticText
          Left = 473
          Top = 178
          Width = 76
          Height = 20
          Hint = 'bak_call_name '#22791#20221#35843#29992#21517#31216
          Caption = #22791#20221#35843#29992#21517#31216
          TabOrder = 16
        end
        object EditSevBakCallName: TEdit
          Left = 581
          Top = 174
          Width = 237
          Height = 24
          ImeName = #32043#20809#25340#38899#36755#20837#27861
          TabOrder = 17
        end
        object StaticText59: TStaticText
          Left = 70
          Top = 223
          Width = 55
          Height = 20
          Hint = 'data_format '#25968#25454#26684#24335' (1 '#26381#21153#31867'XML 2 '#37197#32622#26597#35810#31867'XML 3 FML)'
          Caption = #25968#25454#26684#24335' '
          TabOrder = 18
        end
        object CBSevDataType: TComboBox
          Left = 148
          Top = 217
          Width = 198
          Height = 24
          Style = csDropDownList
          ImeName = #32043#20809#25340#38899#36755#20837#27861
          ItemHeight = 16
          ItemIndex = 0
          TabOrder = 19
          Text = '1 '#26381#21153#31867'XML'
          Items.Strings = (
            '1 '#26381#21153#31867'XML'
            '2 '#37197#32622#26597#35810#31867'XML'
            '3 FML')
        end
        object StaticText66: TStaticText
          Left = 502
          Top = 219
          Width = 52
          Height = 20
          Hint = 'modify_date '#20462#25913#26102#38388
          Caption = #20462#25913#26102#38388
          TabOrder = 20
        end
        object EditSevModifyDate: TEdit
          Left = 581
          Top = 213
          Width = 237
          Height = 24
          TabStop = False
          Color = clScrollBar
          ImeName = #32043#20809#25340#38899#36755#20837#27861
          ReadOnly = True
          TabOrder = 21
          Text = 'NULL'
        end
        object StaticText60: TStaticText
          Left = 59
          Top = 257
          Width = 64
          Height = 20
          Hint = 
            'group_id '#24402#23646#32452#26631#35782' BSSP_Business_Group '#20013#23450#20041' Pms'#65306'100000 Ccs '#65306#33829#19994'101000 ' +
            #22823#23458#25143' 106000 '#38598#22242#23458#25143'107000 Biz'#65306' 210000 Res'#65306'160000'
          Caption = #24402#23646#32452#26631#35782
          TabOrder = 22
        end
        object CBSevGroupId: TComboBox
          Left = 148
          Top = 256
          Width = 198
          Height = 24
          ImeName = #32043#20809#25340#38899#36755#20837#27861
          ItemHeight = 16
          ItemIndex = 1
          TabOrder = 23
          Text = '101000'
          Items.Strings = (
            '100000'
            '101000'
            '106000'
            '107000'
            '210000'
            '160000')
        end
        object StaticText67: TStaticText
          Left = 502
          Top = 254
          Width = 52
          Height = 20
          Hint = 'description'#9#35814#32454#25551#36848
          Caption = #35814#32454#25551#36848
          TabOrder = 24
        end
        object EditSevDesc: TEdit
          Left = 581
          Top = 252
          Width = 237
          Height = 24
          ImeName = #32043#20809#25340#38899#36755#20837#27861
          TabOrder = 25
        end
        object StaticText29: TStaticText
          Left = 59
          Top = 295
          Width = 64
          Height = 20
          Caption = #23376#31995#32479#20195#30721
          TabOrder = 26
        end
        object CBSystemID: TComboBox
          Left = 148
          Top = 295
          Width = 669
          Height = 24
          Style = csDropDownList
          ImeName = #32043#20809#25340#38899#36755#20837#27861
          ItemHeight = 16
          ItemIndex = 0
          TabOrder = 27
          Text = '10   '#33829#19994#31649#29702#65288'Business ManageMent'#65289'   BM   '
          Items.Strings = (
            '10   '#33829#19994#31649#29702#65288'Business ManageMent'#65289'   BM   '
            '11   '#32508#21512#24080#21153#65288'Integration Accounting'#65289'   IA   '
            '12   '#32508#21512#35745#36153#65288'Integration Billing'#65289'   IB   '
            '13   '#26381#21153#31649#29702#65288'Customer Service'#65289'   CS   '
            '14   '#33829#38144#31649#29702#65288'Active Selling Management'#65289'   AS   '
            '15   '#28192#36947#31649#29702#65288'Channel Management'#65289'   CM   '
            '16   '#36164#28304#31649#29702#65288'Resource Management'#65289'   RM   '
            '17   '#21512#20316#20249#20276#31649#29702#65288'Partner Managemnet'#65289'   PM   '
            '18   '#31995#32479#31649#29702#65288'System Management'#65289'   SM   '
            '19   '#25509#21475#31649#29702#65288'Interface Management'#65289'   IM   '
            '20   '#32479#35745#25253#34920#65288'Manufacture Report Management'#65289'   MR   '
            '21   '#21463#29702#21333#31649#29702#65288'Accept Flow Management'#65289'   AF   '
            '22   '#19994#21153#21463#29702#31649#29702#65288'Business Accept Management'#65289'   BA   '
            '23   '#19994#21153#26381#21153#20132#25442#24179#21488#65288'Business Service Switch Platform'#65289'   BP   '
            '24   '#20225#19994#31649#29702#65288'Enterprise Management'#65289'   EM'
            '25   '#30693#35782#24211#31649#29702#65288'Knowbase Management'#65289'   KM'
            '26   '#30005#23376#24037#20316#27969#65288'WorkFlow Management'#65289'   WM'
            '27   '#32479#19968#25509#21475#32593#20851#65288'Unified Interface Gateway'#65289'   IG'
            '28   '#32479#19968#19994#21153#26381#21153#24179#21488#65288'Unified Business Service Platform'#65289'   UP'
            '29   '#32852#30431#21830#23478#65288'Cooperate Partner  Management'#65289'   CP'
            '30   CUI'#21069#21488#65288'Character User Interface'#65289'   CI'
            '31   BIE'#25209#37327#26469#28304#65288'BIE Batch Request'#65289'   BR'
            '32   BI'#32479#35745#20998#26512#25968#25454'(BI Analysis Data Management)   BI'
            '33   NG1'#38144#21806#31649#29702#65288'Market Management'#65289'   MM'
            '34   NG1'#24212#24613#19994#21153#31649#29702#31995#32479#65288'Emergency Management'#65289'   ES'
            '35   '#31227#21160#20351#33021#24179#21488'MOP (Mobile Operation Platform)   MOP')
        end
        object StaticText61: TStaticText
          Left = 74
          Top = 338
          Width = 52
          Height = 20
          Hint = 'call_name '#35843#29992#21517#31216
          Caption = #35843#29992#21517#31216
          TabOrder = 28
        end
        object cbCallName: TComboBox
          Left = 148
          Top = 335
          Width = 669
          Height = 24
          ImeName = #32043#20809#25340#38899#36755#20837#27861
          ItemHeight = 16
          ItemIndex = 0
          TabOrder = 29
          Text = 'BSSP_PREFAB_SQL_CCS'
          Items.Strings = (
            'BSSP_PREFAB_SQL_CCS'
            'BSSP_PREFAB_SQL_BIZ'
            'BSSP_PREFAB_SQL_PMS'
            'BSSP_PREFAB_SQL_RES'
            'BSSP_PREFAB_SQL_DICT'
            'BSSP_PREFAB_SQL_SMS'
            'BSSP_PREFAB_SQL_AC'
            'AF_CGI_SERVICE'
            'AQ_CGI_SERVICE'
            'BA_CGI_SERVICE'
            'BM_CGI_SERVICE'
            'AF_TE_SERVICE'
            'BM_TE_SERVICE'
            'CS_TE_SERVICE')
        end
        object BitBtn10: TBitBtn
          Left = 378
          Top = 370
          Width = 93
          Height = 31
          Caption = #29983#25104#33050#26412
          TabOrder = 30
          OnClick = BitBtn10Click
        end
        object bbtnGetCallName: TBitBtn
          Left = 825
          Top = 336
          Width = 73
          Height = 25
          Caption = #35835#21462#37197#32622
          Enabled = False
          TabOrder = 31
          OnClick = bbtnGetCallNameClick
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'BSSP'#37197#32622#21047#26032
      ImageIndex = 6
      object GroupBox9: TGroupBox
        Left = 0
        Top = 0
        Width = 1073
        Height = 218
        Align = alTop
        Caption = 'BSSP'#20869#23384#25968#25454#21047#26032
        TabOrder = 0
        object StaticText30: TStaticText
          Left = 39
          Top = 39
          Width = 84
          Height = 20
          Caption = 'BUSINESS'#34920
          TabOrder = 0
        end
        object StaticText39: TStaticText
          Left = 30
          Top = 59
          Width = 92
          Height = 20
          Caption = 'BUSINESS_ID'
          TabOrder = 1
        end
        object StaticText31: TStaticText
          Left = 473
          Top = 39
          Width = 81
          Height = 20
          Caption = 'PROCESS'#34920
          TabOrder = 2
        end
        object StaticText41: TStaticText
          Left = 453
          Top = 62
          Width = 114
          Height = 20
          Caption = 'PROCESS_CODE'
          TabOrder = 3
        end
        object StaticText32: TStaticText
          Left = 39
          Top = 108
          Width = 74
          Height = 20
          Caption = 'SERVICE'#34920
          TabOrder = 4
        end
        object StaticText40: TStaticText
          Left = 20
          Top = 128
          Width = 108
          Height = 20
          Caption = 'SERVICE_NAME'
          TabOrder = 5
        end
        object StaticText33: TStaticText
          Left = 433
          Top = 108
          Width = 117
          Height = 20
          Caption = #25968#25454#23383#20856'DICT_DEF'
          TabOrder = 6
        end
        object StaticText37: TStaticText
          Left = 439
          Top = 134
          Width = 124
          Height = 20
          Caption = 'DICT_TYPE.CLASS'
          TabOrder = 7
        end
        object bBtnRefresh: TBitBtn
          Left = 758
          Top = 177
          Width = 92
          Height = 31
          Caption = #25552#20132#21047#26032
          TabOrder = 8
          OnClick = bBtnRefreshClick
        end
        object memo_Business: TMemo
          Left = 138
          Top = 20
          Width = 277
          Height = 70
          ScrollBars = ssVertical
          TabOrder = 9
        end
        object memo_service: TMemo
          Left = 138
          Top = 98
          Width = 277
          Height = 71
          ScrollBars = ssVertical
          TabOrder = 10
        end
        object memo_process: TMemo
          Left = 581
          Top = 20
          Width = 277
          Height = 70
          ScrollBars = ssVertical
          TabOrder = 11
        end
        object memo_dict: TMemo
          Left = 581
          Top = 98
          Width = 277
          Height = 71
          ScrollBars = ssVertical
          TabOrder = 12
        end
      end
      object Panel18: TPanel
        Left = 0
        Top = 218
        Width = 1073
        Height = 368
        Align = alClient
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 1
        object StaticText34: TStaticText
          Left = 36
          Top = 90
          Width = 64
          Height = 20
          Caption = #21457#36865#30340#21629#20196
          TabOrder = 0
        end
        object Memo_req: TMemo
          Left = 135
          Top = 76
          Width = 270
          Height = 211
          ImeName = #32043#20809#25340#38899#36755#20837#27861
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 1
          OnKeyPress = m_reqKeyPress
        end
        object Memo_resp: TMemo
          Left = 532
          Top = 69
          Width = 326
          Height = 218
          ImeName = #32043#20809#25340#38899#36755#20837#27861
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 2
          OnKeyPress = m_reqKeyPress
        end
        object StaticText35: TStaticText
          Left = 449
          Top = 96
          Width = 52
          Height = 20
          Caption = #21047#26032#32467#26524
          TabOrder = 3
        end
        object bbtnResult: TBitBtn
          Left = 758
          Top = 30
          Width = 92
          Height = 30
          Caption = #21047#26032#32467#26524
          Enabled = False
          TabOrder = 4
          OnClick = bbtnResultClick
        end
        object StaticText10: TStaticText
          Left = 30
          Top = 30
          Width = 85
          Height = 20
          Caption = 'MACHINE_ID'
          TabOrder = 5
        end
        object ed_machine: TEdit
          Left = 138
          Top = 30
          Width = 70
          Height = 21
          TabOrder = 6
          Text = '992'
        end
        object ed_taskid: TEdit
          Left = 532
          Top = 30
          Width = 149
          Height = 21
          ReadOnly = True
          TabOrder = 7
        end
        object StaticText11: TStaticText
          Left = 453
          Top = 30
          Width = 64
          Height = 20
          Caption = #20219#21153#32534#21495#65306
          TabOrder = 8
        end
        object StaticText12: TStaticText
          Left = 217
          Top = 30
          Width = 194
          Height = 20
          Caption = 'BSSP'#20027#26426#23450#20041#34920': bssp_machine'
          TabOrder = 9
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 488
    Width = 878
    Height = 46
    Align = alBottom
    ParentShowHint = False
    ShowHint = False
    TabOrder = 1
    DesignSize = (
      878
      46)
    object BitBtn2: TBitBtn
      Left = 623
      Top = 7
      Width = 92
      Height = 31
      Anchors = [akRight]
      TabOrder = 1
      Kind = bkClose
    end
    object bbtnShowScript: TBitBtn
      Left = 335
      Top = 7
      Width = 92
      Height = 31
      Anchors = [akLeft]
      Caption = #26174#31034#33050#26412
      TabOrder = 0
      OnClick = bbtnShowScriptClick
    end
    object StaticText50: TStaticText
      Left = 731
      Top = 1
      Width = 146
      Height = 44
      Align = alRight
      Caption = 'by Huangwt && Zhengjy'
      TabOrder = 2
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 534
    Width = 878
    Height = 19
    Panels = <
      item
        Width = 150
      end
      item
        Width = 500
      end>
    ParentShowHint = False
    ShowHint = False
  end
  object IdAntiFreeze1: TIdAntiFreeze
    OnlyWhenIdle = False
    Left = 496
    Top = 136
  end
  object IdHTTP1: TIdHTTP
    MaxLineAction = maException
    ReadTimeout = 0
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = 0
    Request.ContentRangeEnd = 0
    Request.ContentRangeStart = 0
    Request.ContentType = 'text/html'
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoForceEncodeParams]
    Left = 536
    Top = 152
  end
  object AdoConn: TOraSession
    Options.Direct = True
    Username = 'bssp'
    Server = '10.1.0.220:1521:kf'
    LoginPrompt = False
    AfterConnect = ADOConn_1AfterConnect
    AfterDisconnect = ADOConn_1AfterDisconnect
    Left = 448
    Top = 144
    EncryptedPassword = '9DFF8CFF8CFF8FFF'
  end
  object AdoQuery1: TOraQuery
    Session = AdoConn
    Left = 792
    Top = 64
  end
end
