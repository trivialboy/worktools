object FormReckonConfig: TFormReckonConfig
  Left = 234
  Top = 201
  Width = 1143
  Height = 830
  Caption = #19994#21153#37197#32622
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 120
  TextHeight = 16
  object Splitter1: TSplitter
    Left = 0
    Top = 793
    Width = 1135
    Height = 5
    Cursor = crVSplit
    Align = alBottom
    Beveled = True
  end
  object Splitter2: TSplitter
    Left = 0
    Top = 89
    Width = 1135
    Height = 5
    Cursor = crVSplit
    Align = alTop
    Beveled = True
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1135
    Height = 89
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    object StaticText18: TStaticText
      Left = 40
      Top = 16
      Width = 68
      Height = 20
      Caption = 'IP:Port:SID'
      TabOrder = 0
    end
    object StaticText19: TStaticText
      Left = 320
      Top = 16
      Width = 45
      Height = 20
      Caption = 'USER:'
      TabOrder = 1
    end
    object StaticText20: TStaticText
      Left = 504
      Top = 16
      Width = 86
      Height = 20
      Caption = 'PASSWORD:'
      TabOrder = 2
    end
    object edDbUser: TEdit
      Left = 376
      Top = 16
      Width = 121
      Height = 24
      TabOrder = 3
      Text = 'biz'
    end
    object edDbPass: TEdit
      Left = 600
      Top = 16
      Width = 121
      Height = 24
      TabOrder = 4
      Text = 'biz'
    end
    object edSysId: TEdit
      Left = 112
      Top = 56
      Width = 121
      Height = 24
      TabOrder = 5
    end
    object btnDbConn: TButton
      Left = 400
      Top = 56
      Width = 81
      Height = 25
      Caption = #36830#25509'DB'
      TabOrder = 6
      OnClick = btnDbConnClick
    end
    object btnQuery: TButton
      Left = 248
      Top = 56
      Width = 75
      Height = 25
      Caption = #26597#35810'(&Q)'
      Enabled = False
      TabOrder = 7
      OnClick = btnQueryClick
    end
    object StaticText21: TStaticText
      Left = 24
      Top = 56
      Width = 79
      Height = 20
      Caption = #31995#32479#21151#33021#26631#35782':'
      TabOrder = 8
    end
    object btnDbDisconn: TButton
      Left = 512
      Top = 56
      Width = 75
      Height = 25
      Caption = #26029#24320#36830#25509
      Enabled = False
      TabOrder = 9
      OnClick = btnDbDisconnClick
    end
    object cbDBTNS: TComboBox
      Left = 136
      Top = 16
      Width = 177
      Height = 24
      ItemHeight = 16
      ItemIndex = 0
      TabOrder = 10
      Text = '10.1.0.220:1521:kf'
      Items.Strings = (
        '10.1.0.220:1521:kf'
        '10.46.6.181:2481:custom')
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 94
    Width = 1135
    Height = 653
    ActivePage = TabSheet5
    Align = alClient
    TabIndex = 2
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = #19994#21153#37197#32622
      object Splitter3: TSplitter
        Left = 497
        Top = 0
        Width = 4
        Height = 622
        Cursor = crHSplit
        Beveled = True
      end
      object GroupBox4: TGroupBox
        Left = 501
        Top = 0
        Width = 626
        Height = 622
        Align = alClient
        Caption = #35748#35777#26041#24335' biz.accept_identify_type_cfg'
        TabOrder = 0
        object Panel9: TPanel
          Left = 2
          Top = 18
          Width = 622
          Height = 311
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object StaticText32: TStaticText
            Left = 16
            Top = 8
            Width = 52
            Height = 20
            Caption = #21151#33021#32534#30721
            TabOrder = 0
          end
          object edSysfuncId3: TEdit
            Left = 72
            Top = 8
            Width = 185
            Height = 24
            TabOrder = 1
          end
          object StaticText34: TStaticText
            Left = 287
            Top = 16
            Width = 114
            Height = 20
            Caption = #35831#27714#26469#28304'  ('#25353#34892#20998#38548')'
            TabOrder = 2
          end
          object StaticText31: TStaticText
            Left = 16
            Top = 56
            Width = 52
            Height = 20
            Caption = #22320#24066#32534#30721
            TabOrder = 3
          end
          object ckbHomeCity: TCheckBox
            Left = 16
            Top = 80
            Width = 49
            Height = 17
            Caption = #20840#36873
            Checked = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            State = cbChecked
            TabOrder = 4
            OnClick = ckbHomeCityClick
          end
          object cklbHomeCity: TCheckListBox
            Left = 72
            Top = 40
            Width = 185
            Height = 113
            OnClickCheck = cklbHomeCityClickCheck
            Columns = 2
            ItemHeight = 16
            Items.Strings = (
              '591 '#31119#24030
              '592 '#21414#38376
              '593 '#23425#24503
              '594 '#33670#30000
              '595 '#27849#24030
              '596 '#28467#24030
              '597 '#40857#23721
              '598 '#19977#26126
              '599 '#21335#24179)
            TabOrder = 5
          end
          object mmReqSrc: TMemo
            Left = 285
            Top = 40
            Width = 124
            Height = 89
            Lines.Strings = (
              '201028')
            TabOrder = 6
          end
          object StaticText25: TStaticText
            Left = 296
            Top = 152
            Width = 28
            Height = 20
            Caption = #21697#29260
            TabOrder = 7
          end
          object ckbBrand: TCheckBox
            Left = 344
            Top = 152
            Width = 65
            Height = 17
            Caption = #20840#36873
            Checked = True
            State = cbChecked
            TabOrder = 8
            OnClick = ckbBrandClick
          end
          object cklbBrand: TCheckListBox
            Left = 288
            Top = 176
            Width = 121
            Height = 97
            OnClickCheck = cklbBrandClickCheck
            ItemHeight = 16
            Items.Strings = (
              '1000 '#20840#29699#36890
              '1016 '#21160#24863#22320#24102
              '1022 '#31070#24030#34892)
            TabOrder = 9
          end
          object cklbIdenType: TCheckListBox
            Left = 72
            Top = 176
            Width = 185
            Height = 97
            OnClickCheck = cklbIdenTypeClickCheck
            ItemHeight = 16
            Items.Strings = (
              '10 '#38543#26426#30701#20449#23494#30721#35748#35777
              '20 '#19994#21153#23494#30721#35748#35777
              '30 '#38543#26426#30701#20449#23494#30721' '#65291' '#26381#21153#23494#30721
              '40 '#22996#25176#35748#35777
              '50 '#26426#20027#25345#26412#20154#36523#20221#35777#20214#35748#35777
              '60 '#36229#32423#23494#30721
              '70 '#35805#21333#39564#35777
              '81 '#20010#20154#22996#25176#20070#35748#35777
              '82 '#38598#22242#22996#25176#20070#35748#35777
              '83 '#23458#25143#32463#29702#20195#21150)
            TabOrder = 10
          end
          object StaticText33: TStaticText
            Left = 16
            Top = 184
            Width = 52
            Height = 20
            Caption = #35748#35777#26041#24335
            TabOrder = 11
          end
          object ckbIdenType: TCheckBox
            Left = 16
            Top = 208
            Width = 49
            Height = 17
            Caption = #20840#36873
            Checked = True
            State = cbChecked
            TabOrder = 12
            OnClick = ckbIdenTypeClick
          end
          object Button14: TButton
            Left = 224
            Top = 280
            Width = 75
            Height = 25
            Caption = #21152#20837
            TabOrder = 15
            OnClick = Button14Click
          end
          object Button3: TButton
            Left = 310
            Top = 280
            Width = 75
            Height = 25
            Caption = #29983#25104#33050#26412
            TabOrder = 16
            OnClick = Button3Click
          end
          object Button15: TButton
            Left = 48
            Top = 280
            Width = 75
            Height = 25
            Caption = #28165#31354
            TabOrder = 13
            OnClick = Button15Click
          end
          object Button16: TButton
            Left = 136
            Top = 280
            Width = 75
            Height = 25
            Caption = #21024#38500
            TabOrder = 14
            OnClick = Button16Click
          end
        end
        object sgIdenType: TStringGrid
          Left = 2
          Top = 329
          Width = 622
          Height = 291
          Align = alClient
          ColCount = 6
          DefaultColWidth = 50
          DefaultRowHeight = 20
          RowCount = 2
          TabOrder = 1
          ColWidths = (
            50
            82
            58
            64
            81
            88)
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 497
        Height = 622
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
        object GroupBox2: TGroupBox
          Left = 0
          Top = 0
          Width = 497
          Height = 96
          Align = alTop
          Caption = #21151#33021#23450#20041' biz.accept_sysfunc_def'
          TabOrder = 0
          object edSysfuncId1: TEdit
            Left = 88
            Top = 24
            Width = 145
            Height = 24
            TabOrder = 0
            OnChange = edSysfuncId1Change
          end
          object edSysfuncName: TEdit
            Left = 88
            Top = 56
            Width = 145
            Height = 24
            TabOrder = 1
          end
          object cbSysfuncType: TComboBox
            Left = 320
            Top = 24
            Width = 145
            Height = 24
            Style = csDropDownList
            ItemHeight = 16
            ItemIndex = 0
            TabOrder = 2
            Text = '1001 '#36164#26009#21464#26356
            Items.Strings = (
              '1001 '#36164#26009#21464#26356
              '1002 '#19994#21153#21463#29702
              '1003 '#26790#32593#19994#21153
              '1004 '#25968#25454#19994#21153
              '1006 '#32564#36153#19994#21153
              '1005 '#31215#20998#19994#21153
              '1007 '#39044#32422#21463#29702
              '2001 '#23458#25143#26381#21153
              '2002 '#36164#28304#31649#29702
              '3001 '#32479#35745#20998#26512)
          end
          object StaticText22: TStaticText
            Left = 8
            Top = 24
            Width = 76
            Height = 20
            Caption = #19994#21153#21151#33021#32534#30721
            TabOrder = 3
          end
          object StaticText23: TStaticText
            Left = 8
            Top = 56
            Width = 76
            Height = 20
            Caption = #19994#21153#21151#33021#21517#31216
            TabOrder = 4
          end
          object StaticText24: TStaticText
            Left = 256
            Top = 24
            Width = 52
            Height = 20
            Caption = #21463#29702#31867#22411
            TabOrder = 5
          end
          object Button6: TButton
            Left = 256
            Top = 56
            Width = 75
            Height = 25
            Caption = #29983#25104#33050#26412
            TabOrder = 6
            OnClick = Button6Click
          end
        end
        object GroupBox3: TGroupBox
          Left = 0
          Top = 96
          Width = 497
          Height = 526
          Align = alClient
          Caption = #21463#29702#19994#21153#35268#21017' biz.accept_sysfunc_rule'
          TabOrder = 1
          object sgSysRule: TStringGrid
            Left = 2
            Top = 18
            Width = 493
            Height = 151
            Align = alTop
            ColCount = 7
            DefaultColWidth = 40
            DefaultRowHeight = 20
            RowCount = 2
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
            TabOrder = 5
            OnSelectCell = sgSysRuleSelectCell
            ColWidths = (
              40
              70
              73
              69
              70
              63
              83)
            RowHeights = (
              20
              20)
          end
          object cbFeeFlag: TComboBox
            Left = 104
            Top = 89
            Width = 81
            Height = 24
            Style = csDropDownList
            ItemHeight = 16
            ItemIndex = 0
            TabOrder = 0
            Text = '0 '#26080#36153#29992
            Visible = False
            OnChange = cbFeeFlagChange
            Items.Strings = (
              '0 '#26080#36153#29992
              '1 '#26377#36153#29992)
          end
          object cbReckonFlag: TComboBox
            Left = 192
            Top = 94
            Width = 81
            Height = 24
            Style = csDropDownList
            ItemHeight = 16
            ItemIndex = 0
            TabOrder = 1
            Text = '0 '#19981#36711#24080' '
            Visible = False
            OnChange = cbFeeFlagChange
            Items.Strings = (
              '0 '#19981#36711#24080' '
              '1 '#26377#36711#24080)
          end
          object cbGoodsFlag: TComboBox
            Left = 296
            Top = 99
            Width = 81
            Height = 24
            Style = csDropDownList
            ItemHeight = 16
            ItemIndex = 0
            TabOrder = 2
            Text = '0 '#26080#36135#21697' '
            Visible = False
            OnChange = cbFeeFlagChange
            Items.Strings = (
              '0 '#26080#36135#21697' '
              '1 '#26377#36135#21697)
          end
          object cbBillFlag: TComboBox
            Left = 400
            Top = 96
            Width = 81
            Height = 24
            Style = csDropDownList
            ItemHeight = 16
            ItemIndex = 0
            TabOrder = 3
            Text = '0 '#26080#21463#29702#21333
            Visible = False
            OnChange = cbFeeFlagChange
            Items.Strings = (
              '0 '#26080#21463#29702#21333
              '1 '#30452#25509#25171#21360
              '2 '#31614#20986#25171#21360)
          end
          object Button8: TButton
            Left = 296
            Top = 184
            Width = 75
            Height = 25
            Caption = #29983#25104#33050#26412
            TabOrder = 4
            OnClick = Button8Click
          end
          object Button9: TButton
            Left = 120
            Top = 184
            Width = 75
            Height = 25
            Caption = #22686#21152
            TabOrder = 6
            OnClick = Button9Click
          end
          object Button10: TButton
            Left = 208
            Top = 184
            Width = 75
            Height = 25
            Caption = #21024#38500
            TabOrder = 7
            OnClick = Button10Click
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #32467#24080#37197#32622
      ImageIndex = 1
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 1127
        Height = 411
        Align = alClient
        Caption = #25253#34920#37197#32622#21015#34920' biz.accept_reckon_cfg'
        TabOrder = 0
        object sgReckonCfg: TStringGrid
          Left = 2
          Top = 18
          Width = 1123
          Height = 391
          Align = alClient
          ColCount = 17
          RowCount = 2
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowMoving, goRowSelect]
          TabOrder = 0
          OnClick = sgReckonCfgClick
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 411
        Width = 1127
        Height = 211
        Align = alBottom
        BevelOuter = bvLowered
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        object StaticText1: TStaticText
          Left = 8
          Top = 8
          Width = 76
          Height = 20
          Hint = 'sysfunc_id'#22312'accept_sysfunc_def'#23545#24212#21151#33021#21517#31216
          Caption = #31995#32479#21151#33021#26631#35782
          TabOrder = 0
        end
        object StaticText2: TStaticText
          Left = 32
          Top = 48
          Width = 52
          Height = 20
          Hint = 'Accept_mode'#31561#20110'0'#26102#20505#34920#31034#19982#21463#29702#27169#24335#26080#20851
          Caption = #21463#29702#27169#24335
          TabOrder = 1
        end
        object StaticText3: TStaticText
          Left = 8
          Top = 88
          Width = 76
          Height = 20
          Hint = 'Acceptitem_type'#31561#20110'0'#26102#20505#34920#31034#19982#21463#29702#39033#30446#31867#21035#26080#20851
          Caption = #21463#29702#39033#30446#31867#21035
          TabOrder = 2
        end
        object StaticText4: TStaticText
          Left = 11
          Top = 128
          Width = 76
          Height = 20
          Hint = 'Accept_item'#31561#20110'0'#26102#20505#34920#31034#19982#21463#29702#39033#30446#26080#20851
          Caption = #21463#29702#39033#30446#32534#30721
          TabOrder = 3
        end
        object StaticText5: TStaticText
          Left = 264
          Top = 8
          Width = 52
          Height = 20
          Hint = 'Reckon_report_type10   '#33829#19994#26085#32467#24080#25253#34920
          Caption = #25253#34920#31867#21035
          TabOrder = 4
        end
        object StaticText6: TStaticText
          Left = 240
          Top = 48
          Width = 76
          Height = 20
          Hint = 'request_source '#32467#24080#25253#34920#25968#25454#35831#27714#26469#28304':'#31561#20110'0 '#26102#20505#34920#31034#19982#35831#27714#26469#28304#26080#20851
          Caption = #25968#25454#35831#27714#26469#28304
          TabOrder = 5
        end
        object StaticText7: TStaticText
          Left = 264
          Top = 88
          Width = 52
          Height = 20
          Hint = 
            'feeitem_type0 '#19994#21153#31867' ('#32467#24080#25253#34920#26377#29992#65292#25353#19994#21153#20998#31867#21363#21487')'#21442#35265#12298'BOSS1.5-BSC-'#19994#21153#21463#29702#39033#30446#32534#30721#21015#34920'.xls'#12299 +
            #25991#26723#35828#26126
          Caption = #36153#29992#31867#22411
          TabOrder = 6
        end
        object StaticText8: TStaticText
          Left = 240
          Top = 128
          Width = 76
          Height = 20
          Hint = 'bookitem_type'#65288#33829#19994#20027#34920#26377#29992#27492#23383#27573#65289
          Caption = #25253#34920#25910#25903#31867#22411
          TabOrder = 7
        end
        object StaticText9: TStaticText
          Left = 488
          Top = 8
          Width = 52
          Height = 20
          Hint = 'First_item'#25253#34920#30340#26174#31034#39033#30446
          Caption = #19968#32423#39033#30446
          TabOrder = 8
        end
        object StaticText10: TStaticText
          Left = 488
          Top = 48
          Width = 52
          Height = 20
          Hint = 'Second_item'#25253#34920#20108#32423#39033#30446#26174#31034#39033#65292#26242#26102#20027#34920#26377#29992
          Caption = #20108#32423#39033#30446
          TabOrder = 9
        end
        object StaticText11: TStaticText
          Left = 488
          Top = 88
          Width = 52
          Height = 20
          Hint = 'Subtotal_type('#32467#24080#25253#34920#20013#26377#20851#65292#26174#31034#30340#27719#24635#39033#30446#65292#29616#22312#26242#26102#21482#38656#35201#27719#24635'2'#65292'3'#20449#24687') '
          Caption = #27719#24635#31867#21035
          TabOrder = 10
        end
        object StaticText12: TStaticText
          Left = 8
          Top = 168
          Width = 124
          Height = 20
          Hint = 'Report_display_flag'#65288#37197#32622#39033#30446#26159#21542#38656#35201#22312#25253#34920#20013#26174#31034#65289
          Caption = #26159#21542#22312#26126#32454#35760#24405#20013#26174#31034
          TabOrder = 11
        end
        object StaticText13: TStaticText
          Left = 248
          Top = 168
          Width = 124
          Height = 20
          Hint = 
            'subtotal_display_flag('#32467#24080#25253#34920#20013#26377#29992#65292#37197#32622#39033#30446#26159#21542#38656#35201#22312#27719#24635#39033#20013#26174#31034','#21333'subtotal_type<>0'#26102 +
            #20505#26377#25928') '
          Caption = #26159#21542#22312#27719#24635#35760#24405#20013#26174#31034
          TabOrder = 12
        end
        object StaticText14: TStaticText
          Left = 485
          Top = 128
          Width = 52
          Height = 20
          Hint = 'Display_level'#32467#24080#25253#34920#65306#32564#36153#31867' =1 '#12289#32508#21512#31867#65309'10 '#12289#19994#21153#31867'50'
          Caption = #26174#31034#31561#32423
          TabOrder = 13
        end
        object StaticText15: TStaticText
          Left = 760
          Top = 8
          Width = 88
          Height = 20
          Hint = 'amount_sign1:'#23454#25910#65292'2'#24212#25910#65292'3'#20248#24800'  '#33829#19994#21592#25910#20837#20026#27491#65292#25903#20986#20026#36127
          Caption = #37329#39069#26174#31034#27491#36127#20540
          TabOrder = 14
        end
        object StaticText16: TStaticText
          Left = 796
          Top = 48
          Width = 52
          Height = 20
          Hint = 'invoke_type('#22312#25253#34920#39033#30446#20540#38656#35201#21333#29420#24471#21040#30340#26102#20505#26377#25928')'
          Caption = #35843#29992#31867#22411
          TabOrder = 15
        end
        object StaticText17: TStaticText
          Left = 796
          Top = 88
          Width = 52
          Height = 20
          Hint = 'invoke_content '#35843#29992#31867#22411#38750'0'#26102#22635#20889
          Caption = #35843#29992#20869#23481
          TabOrder = 16
        end
        object edSysfuncId: TEdit
          Left = 96
          Top = 8
          Width = 137
          Height = 24
          TabOrder = 17
        end
        object edAcceptItem: TEdit
          Left = 96
          Top = 128
          Width = 137
          Height = 24
          TabOrder = 18
          Text = '0'
        end
        object cbAcceptMode: TComboBox
          Left = 96
          Top = 48
          Width = 137
          Height = 24
          ItemHeight = 16
          TabOrder = 19
          Items.Strings = (
            '-1 '#19982#21463#29702#27169#24335#26080#20851
            '10 '#25903#20986
            '11 '#25910#20837
            '12 '#31199#36161
            '13 '#22238#25910
            '14 '#36716#20986
            '15 '#36716#20837
            '16 '#30003#35831
            '17 '#21462#28040
            '18 '#20462#25913
            '20 '#20248#24800
            '21 '#20943#20813
            '22 '#36192#36865
            '23 '#25240#25187
            '30 '#29305#27530#36864#27454)
        end
        object cbAcceptItemType: TComboBox
          Left = 96
          Top = 88
          Width = 137
          Height = 24
          ItemHeight = 16
          ItemIndex = 0
          TabOrder = 20
          Text = '0 '#19982#31867#21035#26080#20851
          Items.Strings = (
            '0 '#19982#31867#21035#26080#20851
            '10 '#25209#24320#21345
            '11 '#21495#30721
            '12 '#21495#27573
            '13 SIM'#21345
            '14 '#29289#21697
            '15 '#25163#26426#32456#31471
            '16 '#20805#20540#21345
            '17 '#29233#36125#36890#24179#23433#21345
            '41 '#26381#21153#36873#39033
            '42 '#22871#39184#26723#27425
            '43 '#23492#36865#19994#21153
            '45 SP'#32534#30721
            '50 '#21463#29702
            '51 '#31215#20998
            '52 '#35805#36153
            '53 '#29616#37329
            '54 '#25276#37329
            '55 '#24080#25143
            '71 '#20943#20813
            '72 '#20248#24800
            '73 '#36192#36865
            '74 '#29305#27530#36864#27454
            '75 '#29305#27530#25910#27454
            '99 '#20854#23427#31867#29289#21697)
        end
        object cbReportType: TComboBox
          Left = 320
          Top = 8
          Width = 156
          Height = 24
          Style = csDropDownList
          ItemHeight = 16
          TabOrder = 21
          OnChange = cbReportTypeChange
          Items.Strings = (
            '10 '#33829#19994#26085#32467#24080#25253#34920
            '11 '#33829#19994#26085#25253#20027#25253#34920
            '12 SIM'#21345#38144#21806#36741#34920
            '13 '#26377#20215#21345#38144#21806#36741#34920
            '14 '#33829#38144#39044#23384#36741#34920
            '15 '#20195#25910#27454#36741#34920
            '16 '#25276#37329#36741#34920
            '17 '#29305#27530#25910#36864#27454#21450#20943#20813#36741#34920
            '18 '#20248#24800#20943#20813#36741#34920)
        end
        object edRequestSource: TEdit
          Left = 320
          Top = 48
          Width = 156
          Height = 24
          TabOrder = 22
          Text = '0'
        end
        object cbFeeItemType: TComboBox
          Left = 320
          Top = 88
          Width = 156
          Height = 24
          Style = csDropDownList
          ItemHeight = 16
          TabOrder = 23
          OnChange = cbFeeItemTypeChange
          Items.Strings = (
            '0 '#19994#21153#31867
            '11 '#32508#21512#31867
            '12 '#32564#36153#31867)
        end
        object cbBookItemType: TComboBox
          Left = 320
          Top = 128
          Width = 156
          Height = 24
          Style = csDropDownList
          ItemHeight = 16
          ItemIndex = 0
          TabOrder = 24
          Text = '0 '#26080#20998#31867
          Items.Strings = (
            '0 '#26080#20998#31867
            '1 '#33829#19994#26085#25253#25910#26041
            '2 '#33829#19994#26085#25253#20184#26041)
        end
        object cbFirstItem: TComboBox
          Left = 552
          Top = 8
          Width = 201
          Height = 24
          ItemHeight = 16
          ItemIndex = 0
          TabOrder = 25
          Text = '0 '#26080
          OnChange = cbFirstItemChange
          Items.Strings = (
            '0 '#26080
            '10001 '#29616#37329#32564#36153
            '10002 '#20840#29699#36890#24320#25143
            '11000 '#29616#37329#39044#23384
            '11001 '#19987#27454#39044#23384
            '11002 '#20195#25910
            '11003 SIM'#21345#21345#27454
            '11004 '#25910#25276#37329
            '11005 '#26377#20215#21345#21345#27454
            '11006 '#20854#20182
            '11101 '#31215#20998#20817#25442
            '11102 '#25276#37329#36864#27454
            '11103 '#20248#24800'/'#20943#20813
            '11104 '#35823#25910#36864#27454
            '11105 '#20313#39069#36864#27454
            '11106 '#25240#25187
            '11107 '#20854#23427
            '11108 '#37228#37329
            '12001 '#26222#36890#20837#32593
            '12002 '#20813#36153#20837#32593
            '12003 '#30002#31181#21345#20837#32593
            '12004 '#30002#31181#21345#20813#36153#20837#32593
            '12005 '#34917#21345
            '12006 '#20813#36153#34917#21345
            '12007 '#31215#20998#20817#25442'SIM'#21345
            '13001 '#21038#21038#36890
            '13002 17951IP'#21345
            '13003 96951IP'#21345
            '13004 '#31070#24030#34892'IC'#21345
            '13005 '#20854#20182
            '16001 '#19994#21153#25276#37329
            '16002 '#28192#36947#25276#37329
            '17001 '#35774#22791#27454
            '17002 '#26412#22320#20010#24615#29616#37329#39044#23384
            '17003 '#26412#22320#20010#24615#20195#25910#27454
            '17004 '#26412#22320#20010#24615'SIM'#21345#21345#27454
            '17005 '#20854#20182#26412#22320#20010#24615#25910#27454
            '17006 '#26412#22320#20010#24615#20943#20813
            '18001 '#26377#20215#21345#20943#20813
            '18002 SIM'#21345
            '18003 '#35821#38899#19994#21153
            '18004 '#25968#25454#19994#21153
            '18005 '#35774#22791#20943#20813
            '18006 SIM'#21345#65288#20248#24800#65289
            '18007 '#26377#20215#21345#65288#20248#24800#65289
            '18008 SIM'#21345#65288#20943#20813#65289
            '18009 '#26377#20215#21345#65288#20943#20813#65289
            '18010 SIM'#21345#65288#25240#25187#65289
            '18011 '#26377#20215#21345#65288#25240#25187#65289)
        end
        object cbSecondItem: TComboBox
          Left = 552
          Top = 48
          Width = 201
          Height = 24
          ItemHeight = 16
          TabOrder = 26
          Items.Strings = (
            '0 '#26080
            '11000001 '#29616#37329#32564#36153
            '11000002 '#24320#25143#39044#23384
            '11000003 '#30002#31181#21345#25209#24320#39044#23384
            '11000004 '#33829#38144#19994#21153#25764#38144#25910#36829#32422#37329
            '11000005 '#21574#24080#37325#32564#26412#37329
            '11000006 '#21574#24080#37325#32564#36829#32422#37329
            '11000007 '#25253#25439#37325#32564#26412#37329
            '11000008 '#25253#25439#37325#32564#36829#32422#37329
            '11000009 '#25176#25910#29616#37329#32564#36153
            '11000010 '#25253#25439#25910#22238#26412#37329
            '11000011 '#25253#25439#25910#22238#36829#32422#37329
            '11000012 '#31354#20013#20805#39044#23384
            '11000013 '#26412#22320#20010#24615#29616#37329#39044#23384
            '11001001 '#39044#23384#20248#24800#19994#21153
            '11001002 '#39044#23384#35805#36153#36865#31215#20998
            '11001003 '#24322#22320#32564#36153
            '11001004 '#31227#21160#25903#20184
            '11001005 '#20195#25910#20598#28982#25152#24471#31246
            '11001006 '#20195#25910#23450#21046#32456#31471#27454
            '11001007 '#39044#23384#35805#36153#36865#31215#20998
            '11001008 '#39044#23384#35805#36153#36865#31215#20998#21462#28040#25910#36829#32422#37329
            '11002003 '#24322#22320#32564#36153
            '11002004 '#31227#21160#25903#20184
            '11002004 '#31227#21160#25903#20184
            '11002005 '#20195#25910#20598#28982#25152#24471#31246
            '11002006 '#20195#25910#23450#21046#32456#31471#27454
            '11002007 '#20195#25910#27454
            '11002008 '#26412#22320#20010#24615#20195#25910#27454
            '11003001 '#26222#36890#20837#32593
            '11003002 '#20813#36153#20837#32593
            '11003003 '#30002#31181#21345#20837#32593
            '11003004 '#30002#31181#21345#20813#36153#20837#32593
            '11003005 '#34917#21345
            '11003006 '#20813#36153#34917#21345
            '11003007 '#26412#22320#20010#24615'SIM'#21345#21345#27454
            '11004001 '#28192#36947#25276#37329
            '11004002 '#19994#21153#25276#37329
            '11005001 '#26377#20215#21345#38144#21806
            '11006001 '#25913#21495
            '11006002 '#31199#26426#36829#32422#37329
            '11006003 '#31199#26426#36153
            '11006004 '#28322#25910#27454
            '11006005 '#39044#23384#38480#26399#21462#28040#25910#36829#32422#37329
            '11006006 '#31227#21160#20844#35805#39044#25910#27454
            '11006007 '#29233#36125#36890#24179#23433#21345#34917#21345
            '11006008 '#20854#20182
            '11006009 '#30005#20449#21345#26381#21153#25163#32493#36153
            '11006010 '#26412#22320#20854#20182#20010#24615#25910#27454
            '11101001 '#31215#20998#20817#25442#21617#21617#36890
            '11101002 '#31215#20998#20817#25442#31070#24030#34892#20805#20540#21345
            '11101003 '#31215#20998#20817#25442'IP'#20805#20540#21345
            '11101004 '#31215#20998#20817#25442#25163#26426#20805#20540#21345
            '11101005 '#31215#20998#20817#25442'sim'#21345
            '11101006 '#31215#20998#20817#25442#29289#21697
            '11101007 '#31215#20998#20817#25442#25163#26426#32456#31471
            '11101008 '#20817#25442#20854#23427#29289#21697
            '11102001 '#28192#36947#25276#37329
            '11102002 '#19994#21153#25276#37329
            '11103001 SIM'#21345'('#20837#32593')'
            '11103002 SIM'#21345'('#34917#21345')'
            '11103003 '#26377#20215#21345
            '11103004 '#36829#32422#37329
            '11103005 '#35805#36153
            '11103006 '#35774#22791
            '11103007 '#26412#22320#20010#24615#20943#20813
            '11104001 '#26376#22522#26412#36153
            '11104002 '#36890#35805#36153
            '11104003 '#22686#20540#19994#21153#20351#29992#36153
            '11104004 '#22871#39184#19994#21153#20351#29992#36153
            '11104005 '#25968#25454#19994#21153#20351#29992#36153
            '11104006 '#26790#32593
            '11104007 '#20854#20182#29305#27530#36864#27454
            '11105001 '#28165#25143#36864#27454
            '11105002 '#31227#21160#25903#20184#20817#22870
            '11105002 '#31227#21160#25903#20184#20817#22870
            '11105003 '#31354#20013#20805#36864#27454
            '11106001 IP'#21345#25240#25187
            '11106002 '#31070#24030#34892'IC'#21345
            '11107001 '#20914#27491#31227#21160#20844#35805#39044#25910#27454
            '11107002 POS'#26426#25163#32493#36153
            '11107003 '#25209#38144#24320#21345#27424#27454
            '11107004 '#20943#20813#36829#32422#37329
            '11107005 '#20010#24615#20943#20813
            '11107006 '#20943#20813#35774#22791#27454
            '11108001 '#37228#37329)
        end
        object cbSubTotalType: TComboBox
          Left = 552
          Top = 88
          Width = 241
          Height = 24
          ItemHeight = 16
          ItemIndex = 0
          TabOrder = 27
          Text = '0 '#19981#38656#35201#27719#24635
          Items.Strings = (
            '0 '#19981#38656#35201#27719#24635
            '1 '#19994#21153#27719#24635#65288#19982#21463#29702#39033#30446#31867#21035#26080#20851#65289
            '2 '#25910#20837#27719#24635#65288#21547#29616#37329#12289#29305#27530#25910#36864#27454#31561#65289
            '3 '#23454#29289#27719#24635#65288#21547#21508#31181'SIM'#21345#12289#21038#21345#12289#25163#26426#32456#31471#12289#20854#20182#21345#12289#29289#21697#65292#21253#25324#22238#25910#30340#19968#20123#29289#21697#65289
            '4 '#32564#36153#27719#24635#65288#21547#35805#36153#12289#20943#20813#12289#25276#37329#12289#24080#25143#12289#20248#24800#12289#36192#36865#31561#65289
            '5 '#31215#20998#27719#24635#65288#21547#31215#20998#31561#65289
            '6 '#20854#20182#27719#24635#65288#38500#20197#19978#20960#31867#22806#65289)
        end
        object cbRptDispFlag: TComboBox
          Left = 136
          Top = 168
          Width = 97
          Height = 24
          Style = csDropDownList
          ItemHeight = 16
          ItemIndex = 0
          TabOrder = 28
          Text = '0 '#19981#26174#31034
          Items.Strings = (
            '0 '#19981#26174#31034
            '1 '#26174#31034)
        end
        object cbSubTotalDispFlag: TComboBox
          Left = 392
          Top = 168
          Width = 81
          Height = 24
          Style = csDropDownList
          ItemHeight = 16
          ItemIndex = 0
          TabOrder = 29
          Text = '0 '#19981#26174#31034
          Items.Strings = (
            '0 '#19981#26174#31034
            '1 '#26174#31034)
        end
        object cbAmountSign: TComboBox
          Left = 848
          Top = 8
          Width = 105
          Height = 24
          ItemHeight = 16
          TabOrder = 30
          Items.Strings = (
            '1 '#23454#25910
            '2 '#24212#25910
            '3 '#20248#24800
            '-1 '#23454#25910
            '-2 '#24212#25910
            '-3 '#20248#24800)
        end
        object cbInvokeType: TComboBox
          Left = 848
          Top = 48
          Width = 105
          Height = 24
          Style = csDropDownList
          ItemHeight = 16
          ItemIndex = 0
          TabOrder = 31
          Text = '0 '#19981#25191#34892
          Items.Strings = (
            '0 '#19981#25191#34892
            '1 '#35843#29992'SQL'#35821#21477
            '2 '#35843#29992'FCGI')
        end
        object edInvokeContent: TEdit
          Left = 848
          Top = 88
          Width = 105
          Height = 24
          TabOrder = 32
        end
        object Button4: TButton
          Left = 576
          Top = 168
          Width = 75
          Height = 25
          Caption = #22686#21152
          TabOrder = 33
          OnClick = Button4Click
        end
        object Button5: TButton
          Left = 656
          Top = 168
          Width = 75
          Height = 25
          Caption = #21024#38500
          TabOrder = 34
          OnClick = Button5Click
        end
        object Button7: TButton
          Left = 736
          Top = 168
          Width = 75
          Height = 25
          Caption = #29983#25104#33050#26412
          TabOrder = 35
          OnClick = Button7Click
        end
        object edDispLevel: TEdit
          Left = 552
          Top = 128
          Width = 142
          Height = 24
          TabOrder = 36
        end
        object bbtnHelp: TBitBtn
          Left = 704
          Top = 128
          Width = 89
          Height = 25
          Caption = #37197#32622#35828#26126
          TabOrder = 37
          OnClick = bbtnHelpClick
          Kind = bkHelp
        end
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'XSL/XML'#36716#25442
      ImageIndex = 4
      object Splitter4: TSplitter
        Left = 605
        Top = 0
        Width = 3
        Height = 622
        Cursor = crHSplit
        Align = alRight
        Beveled = True
      end
      object GroupBox6: TGroupBox
        Left = 0
        Top = 0
        Width = 605
        Height = 622
        Align = alClient
        Caption = 'XSL'#25253#25991
        TabOrder = 0
        object redSmsCfg: TRichEdit
          Left = 2
          Top = 18
          Width = 601
          Height = 561
          Align = alClient
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Lines.Strings = (
            '<?xml version="1.0" encoding="GBK" standalone="no"?>'
            
              '<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/' +
              'XSL/Transform">'
            
              #9'<xsl:output method="xml" encoding="GBK" omit-xml-declaration="n' +
              'o"/>'
            #9'<xsl:template match="/sms_info">'
            #9#9'<sms>'
            #9#9#9'<xsl:variable name="strDealInfo">'
            #9#9#9#9'<xsl:for-each select="./package[deal_desc!='#39#39']">'
            
              #9#9#9#9#9'<xsl:value-of select="deal_name"/>'#21487#36873#21253#21464#26356#24050#21463#29702#25104#21151'<xsl:if test="s' +
              'ervice_area_id_name!='#39#39' or expire_time!='#39#39'">,</xsl:if><xsl:if te' +
              'st="service_area_id_name!='#39#39'">'#24403#21069#26381#21153#21306#26159'<xsl:value-of select="servic' +
              'e_area_id_name"/><xsl:if test="expire_time!='#39#39'">,</xsl:if></xsl:' +
              'if><xsl:if test="expire_time!='#39#39'">'#24403#21069#26377#25928#26399#33267'<xsl:value-of select="su' +
              'bstring(expire_time, 1, 4)"/>'#24180'<xsl:value-of select="substring(ex' +
              'pire_time, 5, 2)"/>'#26376'<xsl:value-of select="substring(expire_time,' +
              ' 7, 2)"/>'#26085#25130#27490'</xsl:if><xsl:if test="position()!=last()">;</xsl:if' +
              '>'
            #9#9#9#9'</xsl:for-each>'
            #9#9#9'</xsl:variable>'
            #9#9#9'<xsl:if test="$strDealInfo!='#39#39'">'
            
              #9#9#9#9'<content>'#23562#25964#30340'<xsl:value-of select="./brand_name"/>'#23458#25143#65292#24744#30003#35831#30340'<xsl' +
              ':value-of select="$strDealInfo"/>'#12290'</content>'
            #9#9#9'</xsl:if>'
            #9#9'</sms>'
            #9'</xsl:template>'
            '</xsl:stylesheet>')
          ParentFont = False
          ScrollBars = ssBoth
          TabOrder = 0
          WordWrap = False
        end
        object Panel6: TPanel
          Left = 2
          Top = 579
          Width = 601
          Height = 41
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 1
          object Button12: TButton
            Left = 208
            Top = 8
            Width = 75
            Height = 25
            Caption = #26684#24335#25972#29702
            TabOrder = 0
            OnClick = Button12Click
          end
          object Button13: TButton
            Left = 312
            Top = 8
            Width = 75
            Height = 25
            Caption = #29983#25104#33050#26412
            TabOrder = 1
          end
        end
      end
      object GroupBox7: TGroupBox
        Left = 608
        Top = 0
        Width = 519
        Height = 622
        Align = alRight
        Caption = 'XML'#25253#25991
        TabOrder = 1
        object Splitter5: TSplitter
          Left = 2
          Top = 265
          Width = 515
          Height = 3
          Cursor = crVSplit
          Align = alTop
          Beveled = True
        end
        object GroupBox8: TGroupBox
          Left = 2
          Top = 18
          Width = 515
          Height = 247
          Align = alTop
          Caption = 'XML'#25253#25991
          TabOrder = 0
          object Panel5: TPanel
            Left = 2
            Top = 204
            Width = 511
            Height = 41
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 0
            object Button11: TButton
              Left = 184
              Top = 8
              Width = 75
              Height = 25
              Caption = #36716#25442
              TabOrder = 0
              OnClick = Button11Click
            end
          end
          object redSmsInfo: TRichEdit
            Left = 2
            Top = 18
            Width = 511
            Height = 186
            Align = alClient
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Lines.Strings = (
              '<?xml version="1.0" encoding="GBK"?>'
              '<sms_info>'
              #9'<brand_name>'#20840#29699#36890'</brand_name>'
              #9'<package>'
              #9'<deal_name>'#21487#36873#21253'1</deal_name>'
              #9'<expire_time>20070315010101</expire_time>'
              #9'<inure_type>3</inure_type>'
              #9'<deal_desc>'#21487#36873#21253'1'#22871#39184#25551#36848'</deal_desc>'
              #9'<service_area_id_name>'#26032#26381#21153#21306'1</service_area_id_name>'
              #9'</package>'
              #9'<package>'
              #9'<deal_name>'#21487#36873#21253'2</deal_name>'
              #9'<expire_time>20070314010101</expire_time>'
              #9'<inure_type>1</inure_type>'
              #9'<deal_desc>'#21487#36873#21253'2'#22871#39184#25551#36848'</deal_desc>'
              #9'</package>'
              #9'<package>'
              #9'<deal_name>'#21487#36873#21253'3</deal_name>'
              #9'<expire_time1>20070314010101</expire_time1>'
              #9'<inure_type>1</inure_type>'
              #9'<deal_desc></deal_desc>'
              #9'</package>'
              #9'<package>'
              #9'<deal_name>'#21487#36873#21253'4</deal_name>'
              #9'<expire_time1>20070314010101</expire_time1>'
              #9'<inure_type>1</inure_type>'
              #9'<deal_desc></deal_desc>'
              #9'<service_area_id_name>'#26032#26381#21153#21306'33</service_area_id_name>'
              #9'</package>'
              '</sms_info>')
            ParentFont = False
            ScrollBars = ssBoth
            TabOrder = 1
            WordWrap = False
          end
        end
        object GroupBox9: TGroupBox
          Left = 2
          Top = 268
          Width = 515
          Height = 352
          Align = alClient
          Caption = #36716#25442#32467#26524
          TabOrder = 1
          object redSmsContent: TRichEdit
            Left = 2
            Top = 18
            Width = 511
            Height = 332
            Align = alClient
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            ScrollBars = ssBoth
            TabOrder = 0
          end
        end
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 747
    Width = 1135
    Height = 46
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      1135
      46)
    object Button2: TButton
      Left = 1021
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #20851#38381
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button1: TButton
      Left = 464
      Top = 10
      Width = 75
      Height = 25
      Caption = #26174#31034#33050#26412
      TabOrder = 1
      OnClick = Button1Click
    end
  end
  object XMLDocument1: TXMLDocument
    Left = 512
    Top = 176
    DOMVendorDesc = 'MSXML'
  end
  object ADOConnection1: TOraSession
    Options.Direct = True
    LoginPrompt = False
    AfterConnect = ADOConnection1_1AfterConnect
    AfterDisconnect = ADOConnection1_1AfterDisconnect
    Left = 464
    Top = 64
  end
  object ADOQuery1: TOraQuery
    Session = ADOConnection1
    Left = 512
    Top = 64
  end
end
