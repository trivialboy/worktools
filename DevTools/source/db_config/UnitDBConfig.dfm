object DbConfig: TDbConfig
  Left = 163
  Top = 121
  Width = 977
  Height = 566
  Caption = 'DbConfig'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 961
    Height = 527
    Align = alClient
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 959
      Height = 61
      Align = alTop
      Caption = 'Panel2'
      TabOrder = 0
      object GroupBox1: TGroupBox
        Left = 1
        Top = 1
        Width = 957
        Height = 59
        Align = alClient
        Caption = #36830#25509#25968#25454#24211
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 30
          Width = 209
          Height = 13
          AutoSize = False
          Caption = #20027#26426#65306#31471#21475#21495#65306'SID'
        end
        object Label2: TLabel
          Left = 362
          Top = 32
          Width = 48
          Height = 13
          Caption = #29992#25143#21517#65306
        end
        object Label3: TLabel
          Left = 613
          Top = 32
          Width = 36
          Height = 13
          Caption = #23494#30721#65306
        end
        object mePassword: TMaskEdit
          Left = 654
          Top = 24
          Width = 121
          Height = 21
          ImeName = #20013#25991' - QQ'#20116#31508#36755#20837#27861
          PasswordChar = '*'
          TabOrder = 2
        end
        object btConnect: TButton
          Left = 828
          Top = 19
          Width = 82
          Height = 29
          Caption = #36830#25509
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = #24494#36719#38597#40657
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = btConnectClick
        end
        object cbOracleSID: TComboBox
          Left = 133
          Top = 24
          Width = 161
          Height = 21
          ImeName = #20013#25991' - QQ'#20116#31508#36755#20837#27861
          ItemHeight = 13
          TabOrder = 0
          Text = 'cbOracleSID'
        end
        object edtUser: TEdit
          Left = 417
          Top = 24
          Width = 121
          Height = 21
          ImeName = #20013#25991' - QQ'#20116#31508#36755#20837#27861
          TabOrder = 1
        end
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 97
      Width = 959
      Height = 429
      Align = alClient
      TabOrder = 1
      object Splitter1: TSplitter
        Left = 305
        Top = 1
        Height = 427
      end
      object Splitter2: TSplitter
        Left = 561
        Top = 1
        Height = 427
      end
      object Panel4: TPanel
        Left = 1
        Top = 1
        Width = 304
        Height = 427
        Align = alLeft
        Caption = 'Panel4'
        TabOrder = 0
        object Splitter3: TSplitter
          Left = 1
          Top = 185
          Width = 302
          Height = 3
          Cursor = crVSplit
          Align = alTop
        end
        object Panel10: TPanel
          Left = 1
          Top = 1
          Width = 302
          Height = 184
          Align = alTop
          Caption = 'Panel10'
          TabOrder = 0
          object lvUserTables: TListView
            Left = 1
            Top = 1
            Width = 300
            Height = 182
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
          Top = 188
          Width = 302
          Height = 238
          Align = alClient
          Caption = 'Panel11'
          TabOrder = 1
          object lvTables: TListView
            Left = 1
            Top = 1
            Width = 300
            Height = 236
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
        Left = 308
        Top = 1
        Width = 253
        Height = 427
        Align = alLeft
        Caption = 'Panel5'
        TabOrder = 1
        object Splitter4: TSplitter
          Left = 1
          Top = 257
          Width = 251
          Height = 3
          Cursor = crVSplit
          Align = alTop
        end
        object Panel12: TPanel
          Left = 1
          Top = 260
          Width = 251
          Height = 166
          Align = alClient
          TabOrder = 0
          object mmoSql: TMemo
            Left = 1
            Top = 89
            Width = 249
            Height = 76
            Hint = 'select [field] from [table] group by [field] having on .....; '
            Align = alClient
            Font.Charset = ANSI_CHARSET
            Font.Color = clGreen
            Font.Height = -12
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
            Width = 249
            Height = 88
            Align = alTop
            TabOrder = 1
            object chkDefine: TCheckBox
              Left = 0
              Top = 64
              Width = 241
              Height = 17
              Caption = #33258#23450#20041#20010#24615#21270#34920#20027#22495#21450#20998#31867'SQL'#65306
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #24494#36719#38597#40657
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object chkOpt: TCheckBox
              Left = 2
              Top = 6
              Width = 241
              Height = 17
              Caption = #34920#20027#22495#36880#32423#20998#31867#20248#21270#65292#35760#24405#25968#23567#31561#20110#65306
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #24494#36719#38597#40657
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object edtNumber: TEdit
              Left = 143
              Top = 28
              Width = 81
              Height = 21
              ImeName = #20013#25991' - QQ'#20116#31508#36755#20837#27861
              TabOrder = 2
              Text = '0'
            end
            object UpDown1: TUpDown
              Left = 224
              Top = 28
              Width = 16
              Height = 21
              Associate = edtNumber
              TabOrder = 3
            end
          end
        end
        object Panel13: TPanel
          Left = 1
          Top = 1
          Width = 251
          Height = 256
          Align = alTop
          Caption = 'Panel13'
          TabOrder = 1
          object clbFields: TCheckListBox
            Left = 1
            Top = 1
            Width = 249
            Height = 254
            Align = alClient
            ImeName = #20013#25991' - QQ'#20116#31508#36755#20837#27861
            ItemHeight = 13
            TabOrder = 0
            OnClick = clbFieldsClick
          end
        end
      end
      object Panel7: TPanel
        Left = 564
        Top = 1
        Width = 394
        Height = 427
        Align = alClient
        TabOrder = 2
        object Panel8: TPanel
          Left = 1
          Top = 328
          Width = 392
          Height = 98
          Align = alBottom
          Caption = 'Panel8'
          TabOrder = 0
          object tmResult: TMemo
            Left = 1
            Top = 1
            Width = 390
            Height = 96
            Align = alClient
            Color = clScrollBar
            Font.Charset = ANSI_CHARSET
            Font.Color = clGreen
            Font.Height = -12
            Font.Name = #24494#36719#38597#40657
            Font.Style = []
            ImeName = #20013#25991' - QQ'#20116#31508#36755#20837#27861
            Lines.Strings = (
              #23548#20986#32467#26524#20449#24687#65288#29983#25104#25991#20214#21517#21450#22788#29702#35760#24405#25968#65289)
            ParentFont = False
            ReadOnly = True
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
        object Panel9: TPanel
          Left = 1
          Top = 1
          Width = 392
          Height = 327
          Align = alClient
          TabOrder = 1
          object Label8: TLabel
            Left = 25
            Top = 7
            Width = 298
            Height = 13
            AutoSize = False
            Caption = #24403#21069#34920#38480#21046#35821#21477#65306#65288#19981#21547'where'#65289
          end
          object Label9: TLabel
            Left = 24
            Top = 56
            Width = 290
            Height = 13
            AutoSize = False
            Caption = #38468#21152#26465#20214#20449#24687#65306'(order by....)'
          end
          object Label6: TLabel
            Left = 19
            Top = 248
            Width = 84
            Height = 13
            AutoSize = False
            Caption = #20445#23384#30446#24405#65306
          end
          object edtWhere: TEdit
            Left = 24
            Top = 26
            Width = 333
            Height = 21
            ImeName = #20013#25991' - QQ'#20116#31508#36755#20837#27861
            TabOrder = 0
          end
          object edtInfo: TEdit
            Left = 24
            Top = 77
            Width = 333
            Height = 21
            ImeName = #20013#25991' - QQ'#20116#31508#36755#20837#27861
            TabOrder = 1
          end
          object GroupBox2: TGroupBox
            Left = 24
            Top = 105
            Width = 333
            Height = 99
            Caption = #21035#21517#65288#21487#20026#31354#65289#65306
            TabOrder = 2
            object Label10: TLabel
              Left = 12
              Top = 23
              Width = 60
              Height = 13
              Caption = #29992#25143#21035#21517#65306
            end
            object Label11: TLabel
              Left = 13
              Top = 48
              Width = 48
              Height = 13
              Caption = #34920#21035#21517#65306
            end
            object lbl1: TLabel
              Left = 15
              Top = 75
              Width = 81
              Height = 13
              Caption = 'LOB'#35270#22270#21035#21517#65306
            end
            object edtAlias: TEdit
              Left = 89
              Top = 14
              Width = 229
              Height = 21
              ImeName = #20013#25991' - QQ'#20116#31508#36755#20837#27861
              TabOrder = 0
            end
            object edtTableAlias: TEdit
              Left = 73
              Top = 42
              Width = 245
              Height = 21
              ImeName = #20013#25991' - QQ'#20116#31508#36755#20837#27861
              TabOrder = 1
            end
            object edtViewLob: TEdit
              Left = 105
              Top = 70
              Width = 213
              Height = 21
              ImeName = #20013#25991' - QQ'#20116#31508#36755#20837#27861
              TabOrder = 2
            end
          end
          object chkClob: TCheckBox
            Left = 24
            Top = 214
            Width = 193
            Height = 17
            Caption = 'CLOB'#31354#26102#20026'null'
            TabOrder = 3
          end
          object btFilePath: TButton
            Left = 316
            Top = 242
            Width = 17
            Height = 20
            Hint = #30446#24405#36873#25321
            Caption = '...'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
            OnClick = btFilePathClick
          end
          object Button1: TButton
            Left = 333
            Top = 242
            Width = 24
            Height = 20
            Hint = #23450#20301#21040#30446#24405
            Caption = 'goto'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 5
            OnClick = Button1Click
          end
          object btStart: TButton
            Left = 128
            Top = 272
            Width = 125
            Height = 42
            Caption = #24320#22987#23548#20986
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -16
            Font.Name = #24494#36719#38597#40657
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 6
            OnClick = btStartClick
          end
          object btnResult: TButton
            Left = 25
            Top = 292
            Width = 68
            Height = 22
            Caption = #38544#34255#32467#26524
            TabOrder = 7
            OnClick = btnResultClick
          end
          object Button2: TButton
            Left = 280
            Top = 288
            Width = 75
            Height = 25
            Caption = #20445#23384#37197#32622
            TabOrder = 8
            OnClick = Button2Click
          end
          object cbbPath: TComboBox
            Left = 85
            Top = 242
            Width = 231
            Height = 21
            ImeName = #20013#25991' - QQ'#20116#31508#36755#20837#27861
            ItemHeight = 13
            TabOrder = 9
            Text = 'cbbPath'
          end
        end
      end
    end
    object Panel6: TPanel
      Left = 1
      Top = 62
      Width = 959
      Height = 35
      Align = alTop
      TabOrder = 2
      object Label4: TLabel
        Left = 8
        Top = 12
        Width = 177
        Height = 13
        AutoSize = False
        Caption = #35201#23548#20986#30340#34920#65306
      end
      object Label5: TLabel
        Left = 311
        Top = 12
        Width = 209
        Height = 14
        AutoSize = False
        Caption = #36873#21462#34920#20027#22495#21450#39034#24207#35843#25972#65306
      end
      object edtTable: TEdit
        Left = 95
        Top = 7
        Width = 209
        Height = 21
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
        Left = 470
        Top = 5
        Width = 44
        Height = 24
        Caption = #19978#31227
        TabOrder = 1
        OnClick = ButtonPrevClick
      end
      object ButtonNext: TButton
        Left = 514
        Top = 5
        Width = 44
        Height = 24
        Caption = #19979#31227
        TabOrder = 2
        OnClick = ButtonNextClick
      end
      object ButtonDele: TButton
        Left = 558
        Top = 5
        Width = 44
        Height = 24
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
