object DbConfig: TDbConfig
  Left = 154
  Top = 120
  Width = 977
  Height = 566
  Caption = 'DbConfig'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 967
    Height = 532
    Align = alClient
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 965
      Height = 75
      Align = alTop
      Caption = 'Panel2'
      TabOrder = 0
      object GroupBox1: TGroupBox
        Left = 1
        Top = 1
        Width = 963
        Height = 73
        Align = alClient
        Caption = #36830#25509#25968#25454#24211
        TabOrder = 0
        object Label1: TLabel
          Left = 10
          Top = 37
          Width = 257
          Height = 16
          AutoSize = False
          Caption = #20027#26426#65306#31471#21475#21495#65306'SID'
        end
        object Label2: TLabel
          Left = 446
          Top = 39
          Width = 48
          Height = 16
          Caption = #29992#25143#21517#65306
        end
        object Label3: TLabel
          Left = 754
          Top = 39
          Width = 36
          Height = 16
          Caption = #23494#30721#65306
        end
        object mePassword: TMaskEdit
          Left = 805
          Top = 30
          Width = 149
          Height = 24
          ImeName = #20013#25991' - QQ'#20116#31508#36755#20837#27861
          PasswordChar = '*'
          TabOrder = 2
        end
        object btConnect: TButton
          Left = 1019
          Top = 23
          Width = 101
          Height = 36
          Caption = #36830#25509
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = #24494#36719#38597#40657
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = btConnectClick
        end
        object cbOracleSID: TComboBox
          Left = 164
          Top = 30
          Width = 198
          Height = 24
          ImeName = #20013#25991' - QQ'#20116#31508#36755#20837#27861
          ItemHeight = 16
          TabOrder = 0
          Text = 'cbOracleSID'
        end
        object edtUser: TEdit
          Left = 513
          Top = 30
          Width = 149
          Height = 24
          ImeName = #20013#25991' - QQ'#20116#31508#36755#20837#27861
          TabOrder = 1
        end
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 119
      Width = 965
      Height = 412
      Align = alClient
      TabOrder = 1
      object Splitter1: TSplitter
        Left = 375
        Top = 1
        Width = 4
        Height = 410
      end
      object Splitter2: TSplitter
        Left = 690
        Top = 1
        Width = 4
        Height = 410
      end
      object Panel4: TPanel
        Left = 1
        Top = 1
        Width = 374
        Height = 410
        Align = alLeft
        Caption = 'Panel4'
        TabOrder = 0
        object Splitter3: TSplitter
          Left = 1
          Top = 228
          Width = 372
          Height = 3
          Cursor = crVSplit
          Align = alTop
        end
        object Panel10: TPanel
          Left = 1
          Top = 1
          Width = 372
          Height = 227
          Align = alTop
          Caption = 'Panel10'
          TabOrder = 0
          object lvUserTables: TListView
            Left = 1
            Top = 1
            Width = 370
            Height = 225
            Align = alClient
            Columns = <
              item
                AutoSize = True
                Caption = #29992#25143#23548#20986#34920#36873#25321
              end>
            GridLines = True
            HideSelection = False
            ReadOnly = True
            RowSelect = True
            TabOrder = 0
            ViewStyle = vsReport
            OnSelectItem = lvUserTablesSelectItem
          end
        end
        object Panel11: TPanel
          Left = 1
          Top = 231
          Width = 372
          Height = 178
          Align = alClient
          Caption = 'Panel11'
          TabOrder = 1
          object lvTables: TListView
            Left = 1
            Top = 1
            Width = 370
            Height = 176
            Align = alClient
            Columns = <
              item
                AutoSize = True
                Caption = #23548#20986#31995#32479#24211#34920#36873#25321
              end>
            GridLines = True
            HideSelection = False
            ReadOnly = True
            RowSelect = True
            TabOrder = 0
            ViewStyle = vsReport
            OnSelectItem = lvTablesSelectItem
          end
        end
      end
      object Panel5: TPanel
        Left = 379
        Top = 1
        Width = 311
        Height = 410
        Align = alLeft
        Caption = 'Panel5'
        TabOrder = 1
        object Splitter4: TSplitter
          Left = 1
          Top = 316
          Width = 309
          Height = 4
          Cursor = crVSplit
          Align = alTop
        end
        object Panel12: TPanel
          Left = 1
          Top = 320
          Width = 309
          Height = 89
          Align = alClient
          TabOrder = 0
          object mmoSql: TMemo
            Left = 1
            Top = 110
            Width = 307
            Height = 258
            Hint = 'select [field] from [table] group by [field] having on .....; '
            Align = alClient
            Font.Charset = ANSI_CHARSET
            Font.Color = clGreen
            Font.Height = -15
            Font.Name = #24494#36719#38597#40657
            Font.Style = []
            ImeName = #20013#25991' - QQ'#20116#31508#36755#20837#27861
            Lines.Strings = (
              '')
            ParentFont = False
            ParentShowHint = False
            ScrollBars = ssVertical
            ShowHint = True
            TabOrder = 0
          end
          object Panel14: TPanel
            Left = 1
            Top = 1
            Width = 307
            Height = 109
            Align = alTop
            TabOrder = 1
            object chkDefine: TCheckBox
              Left = 0
              Top = 79
              Width = 297
              Height = 21
              Caption = #33258#23450#20041#20010#24615#21270#34920#20027#22495#21450#20998#31867'SQL'#65306
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = #24494#36719#38597#40657
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object chkOpt: TCheckBox
              Left = 2
              Top = 7
              Width = 297
              Height = 21
              Caption = #34920#20027#22495#36880#32423#20998#31867#20248#21270#65292#35760#24405#25968#23567#31561#20110#65306
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = #24494#36719#38597#40657
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object edtNumber: TEdit
              Left = 176
              Top = 34
              Width = 100
              Height = 24
              ImeName = #20013#25991' - QQ'#20116#31508#36755#20837#27861
              TabOrder = 2
              Text = '0'
            end
            object UpDown1: TUpDown
              Left = 276
              Top = 34
              Width = 19
              Height = 24
              Associate = edtNumber
              TabOrder = 3
            end
          end
        end
        object Panel13: TPanel
          Left = 1
          Top = 1
          Width = 309
          Height = 315
          Align = alTop
          Caption = 'Panel13'
          TabOrder = 1
          object clbFields: TCheckListBox
            Left = 1
            Top = 1
            Width = 307
            Height = 313
            Align = alClient
            ImeName = #20013#25991' - QQ'#20116#31508#36755#20837#27861
            ItemHeight = 16
            TabOrder = 0
            OnClick = clbFieldsClick
          end
        end
      end
      object Panel7: TPanel
        Left = 694
        Top = 1
        Width = 270
        Height = 410
        Align = alClient
        TabOrder = 2
        object Panel8: TPanel
          Left = 1
          Top = 289
          Width = 268
          Height = 120
          Align = alBottom
          Caption = 'Panel8'
          TabOrder = 0
          object tmResult: TMemo
            Left = 1
            Top = 1
            Width = 266
            Height = 118
            Align = alClient
            Color = clScrollBar
            Font.Charset = ANSI_CHARSET
            Font.Color = clGreen
            Font.Height = -15
            Font.Name = #24494#36719#38597#40657
            Font.Style = []
            ImeName = #20013#25991' - QQ'#20116#31508#36755#20837#27861
            Lines.Strings = (
              #23548#20986#32467#26524#20449#24687#65288#29983#25104#25991#20214#21517#21450#22788#29702
              #35760#24405#25968#65289)
            ParentFont = False
            ReadOnly = True
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
        object Panel9: TPanel
          Left = 1
          Top = 1
          Width = 268
          Height = 288
          Align = alClient
          TabOrder = 1
          object Label8: TLabel
            Left = 31
            Top = 9
            Width = 367
            Height = 16
            AutoSize = False
            Caption = #24403#21069#34920#38480#21046#35821#21477#65306#65288#19981#21547'where'#65289
          end
          object Label9: TLabel
            Left = 30
            Top = 69
            Width = 356
            Height = 16
            AutoSize = False
            Caption = #38468#21152#26465#20214#20449#24687#65306'(order by....)'
          end
          object Label6: TLabel
            Left = 23
            Top = 305
            Width = 104
            Height = 16
            AutoSize = False
            Caption = #20445#23384#30446#24405#65306
          end
          object edtWhere: TEdit
            Left = 30
            Top = 32
            Width = 409
            Height = 24
            ImeName = #20013#25991' - QQ'#20116#31508#36755#20837#27861
            TabOrder = 0
          end
          object edtInfo: TEdit
            Left = 30
            Top = 95
            Width = 409
            Height = 24
            ImeName = #20013#25991' - QQ'#20116#31508#36755#20837#27861
            TabOrder = 1
          end
          object GroupBox2: TGroupBox
            Left = 30
            Top = 129
            Width = 409
            Height = 122
            Caption = #21035#21517#65288#21487#20026#31354#65289#65306
            TabOrder = 2
            object Label10: TLabel
              Left = 15
              Top = 28
              Width = 60
              Height = 16
              Caption = #29992#25143#21035#21517#65306
            end
            object Label11: TLabel
              Left = 16
              Top = 59
              Width = 48
              Height = 16
              Caption = #34920#21035#21517#65306
            end
            object lbl1: TLabel
              Left = 18
              Top = 92
              Width = 86
              Height = 16
              Caption = 'LOB'#35270#22270#21035#21517#65306
            end
            object edtAlias: TEdit
              Left = 110
              Top = 17
              Width = 281
              Height = 24
              ImeName = #20013#25991' - QQ'#20116#31508#36755#20837#27861
              TabOrder = 0
            end
            object edtTableAlias: TEdit
              Left = 90
              Top = 52
              Width = 301
              Height = 24
              ImeName = #20013#25991' - QQ'#20116#31508#36755#20837#27861
              TabOrder = 1
            end
            object edtViewLob: TEdit
              Left = 129
              Top = 86
              Width = 262
              Height = 24
              ImeName = #20013#25991' - QQ'#20116#31508#36755#20837#27861
              TabOrder = 2
            end
          end
          object chkClob: TCheckBox
            Left = 30
            Top = 263
            Width = 237
            Height = 21
            Caption = 'CLOB'#31354#26102#20026'null'
            TabOrder = 3
          end
          object btFilePath: TButton
            Left = 389
            Top = 298
            Width = 21
            Height = 24
            Hint = #30446#24405#36873#25321
            Caption = '...'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
            OnClick = btFilePathClick
          end
          object Button1: TButton
            Left = 410
            Top = 298
            Width = 29
            Height = 24
            Hint = #23450#20301#21040#30446#24405
            Caption = 'goto'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 5
            OnClick = Button1Click
          end
          object btStart: TButton
            Left = 158
            Top = 335
            Width = 153
            Height = 51
            Caption = #24320#22987#23548#20986
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -20
            Font.Name = #24494#36719#38597#40657
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 6
            OnClick = btStartClick
          end
          object btnResult: TButton
            Left = 31
            Top = 359
            Width = 83
            Height = 27
            Caption = #38544#34255#32467#26524
            TabOrder = 7
            OnClick = btnResultClick
          end
          object Button2: TButton
            Left = 345
            Top = 354
            Width = 92
            Height = 31
            Caption = #20445#23384#37197#32622
            TabOrder = 8
            OnClick = Button2Click
          end
          object cbbPath: TComboBox
            Left = 105
            Top = 298
            Width = 284
            Height = 24
            ImeName = #20013#25991' - QQ'#20116#31508#36755#20837#27861
            ItemHeight = 16
            TabOrder = 9
            Text = 'cbbPath'
          end
        end
      end
    end
    object Panel6: TPanel
      Left = 1
      Top = 76
      Width = 965
      Height = 43
      Align = alTop
      TabOrder = 2
      object Label4: TLabel
        Left = 10
        Top = 15
        Width = 218
        Height = 16
        AutoSize = False
        Caption = #35201#23548#20986#30340#34920#65306
      end
      object Label5: TLabel
        Left = 383
        Top = 15
        Width = 257
        Height = 17
        AutoSize = False
        Caption = #36873#21462#34920#20027#22495#21450#39034#24207#35843#25972#65306
      end
      object edtTable: TEdit
        Left = 117
        Top = 9
        Width = 257
        Height = 24
        Hint = #36755#20837#34920#21517#21518#25353#22238#36710#38190
        ImeName = #20013#25991' - QQ'#20116#31508#36755#20837#27861
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnChange = edtTableChange
        OnEnter = edtTableEnter
        OnExit = edtTableExit
        OnKeyDown = edtTableKeyDown
      end
      object ButtonPrev: TButton
        Left = 578
        Top = 6
        Width = 55
        Height = 30
        Caption = #19978#31227
        TabOrder = 1
        OnClick = ButtonPrevClick
      end
      object ButtonNext: TButton
        Left = 633
        Top = 6
        Width = 54
        Height = 30
        Caption = #19979#31227
        TabOrder = 2
        OnClick = ButtonNextClick
      end
      object ButtonDele: TButton
        Left = 687
        Top = 6
        Width = 54
        Height = 30
        Caption = #21024#38500
        TabOrder = 3
        OnClick = ButtonDeleClick
      end
    end
  end
  object OraQuery: TOraQuery
    Session = OraSession
    FetchRows = 1024
    ReadOnly = True
    Left = 904
    Top = 64
  end
  object OraSession: TOraSession
    Options.Direct = True
    PoolingOptions.MaxPoolSize = 200
    Pooling = True
    Username = 'bssp'
    Server = '10.1.0.220:1521:kf'
    LoginPrompt = False
    Left = 864
    Top = 64
    EncryptedPassword = '9DFF8CFF8CFF8FFF'
  end
end
