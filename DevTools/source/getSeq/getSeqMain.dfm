object FormGetSeq: TFormGetSeq
  Left = 203
  Top = 158
  Width = 813
  Height = 582
  Caption = 'ID'#20998#37197
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object PageControl1: TPageControl
    Left = 0
    Top = 159
    Width = 803
    Height = 211
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 0
    object TabSheet2: TTabSheet
      Caption = 'BSSP'#32534#30721
      ImageIndex = 1
      object GroupBox2: TGroupBox
        Left = 0
        Top = 0
        Width = 795
        Height = 178
        Align = alTop
        Caption = 'BSSP '#32534#30721
        TabOrder = 0
        object cboxBssp: TComboBox
          Left = 346
          Top = 30
          Width = 356
          Height = 24
          ItemHeight = 16
          TabOrder = 0
        end
        object StaticText1: TStaticText
          Left = 251
          Top = 33
          Width = 76
          Height = 20
          Caption = #23376#31995#32479#31867#22411#65306
          TabOrder = 1
        end
        object rdgroupBssp: TRadioGroup
          Left = 20
          Top = 30
          Width = 198
          Height = 119
          Caption = #31867#22411
          Enabled = False
          ItemIndex = 0
          Items.Strings = (
            'BSSP BUSINESS'
            'BSSP PROCESS'
            'BSSP SERVICE/SQL')
          TabOrder = 2
          OnClick = rdgroupBsspClick
        end
        object bbtnBsspGen: TBitBtn
          Left = 423
          Top = 98
          Width = 93
          Height = 51
          Caption = #29983#25104
          Enabled = False
          TabOrder = 3
          OnClick = bbtnBsspGenClick
        end
        object Button1: TButton
          Left = 719
          Top = 30
          Width = 92
          Height = 30
          Caption = #36830#25509
          TabOrder = 4
          OnClick = Button1Click
        end
        object bbtnBsspCopy: TBitBtn
          Left = 571
          Top = 97
          Width = 92
          Height = 51
          Caption = #22797#21046
          Enabled = False
          TabOrder = 5
          OnClick = bbtnBsspCopyClick
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = #33756#21333#32534#30721
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 795
        Height = 70
        Align = alTop
        TabOrder = 0
        Visible = False
        object edTag: TEdit
          Left = 167
          Top = 25
          Width = 258
          Height = 21
          TabOrder = 0
          Text = #21517#31216
        end
        object ckboxTag: TCheckBox
          Left = 37
          Top = 30
          Width = 100
          Height = 20
          Caption = #20010#24615#26631#31614#65306
          Checked = True
          Enabled = False
          State = cbChecked
          TabOrder = 1
        end
        object Button2: TButton
          Left = 463
          Top = 20
          Width = 92
          Height = 30
          Caption = #36830#25509
          TabOrder = 2
          OnClick = Button2Click
        end
        object StaticText6: TStaticText
          Left = 581
          Top = 10
          Width = 561
          Height = 20
          Caption = #21487#20351#29992'"'#20010#24615#26631#31614'"'#26469#26631#35782#39044#21344'ID'#30340#24402#23646','#36991#20813#34987#20182#20154#35823#29992#12290#25903#25345#21508#31867#23383#31526#21644#20013#25991','#24212#36991#20813#19982#20182#20154#35774#32622#30340#30456#21516#12290
          TabOrder = 3
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 70
        Width = 795
        Height = 110
        Align = alClient
        TabOrder = 1
        Visible = False
        object GroupBox4: TGroupBox
          Left = 1
          Top = 1
          Width = 512
          Height = 108
          Align = alLeft
          Caption = 'Portal Function ID'
          TabOrder = 0
          object cboxPortal: TComboBox
            Left = 138
            Top = 49
            Width = 257
            Height = 24
            ItemHeight = 0
            TabOrder = 0
          end
          object bbtnPortalGen: TBitBtn
            Left = 118
            Top = 138
            Width = 92
            Height = 31
            Caption = #29983#25104
            Enabled = False
            TabOrder = 1
            OnClick = bbtnPortalGenClick
          end
          object bbtnPortalCopy: TBitBtn
            Left = 226
            Top = 138
            Width = 93
            Height = 31
            Caption = #22797#21046
            Enabled = False
            TabOrder = 2
            OnClick = bbtnPortalCopyClick
          end
          object StaticText2: TStaticText
            Left = 59
            Top = 49
            Width = 64
            Height = 20
            Caption = #38376#25143#33756#21333#65306
            TabOrder = 3
          end
          object UpDown1: TUpDown
            Left = 375
            Top = 98
            Width = 19
            Height = 26
            Associate = lbedPortalAmount
            Position = 1
            TabOrder = 4
          end
          object lbedPortalAmount: TLabeledEdit
            Left = 138
            Top = 98
            Width = 237
            Height = 21
            EditLabel.Width = 36
            EditLabel.Height = 16
            EditLabel.Caption = #25968#37327#65306
            LabelPosition = lpLeft
            LabelSpacing = 5
            MaxLength = 2
            TabOrder = 5
            Text = '1'
          end
        end
        object GroupBox5: TGroupBox
          Left = 513
          Top = 1
          Width = 281
          Height = 108
          Align = alClient
          Caption = 'System Function ID'
          TabOrder = 1
          object cboxSysfunc: TComboBox
            Left = 138
            Top = 49
            Width = 277
            Height = 24
            ItemHeight = 0
            TabOrder = 0
          end
          object bbtnFuncGen: TBitBtn
            Left = 128
            Top = 138
            Width = 92
            Height = 31
            Caption = #29983#25104
            Enabled = False
            TabOrder = 1
            OnClick = bbtnFuncGenClick
          end
          object bbtnFuncCopy: TBitBtn
            Left = 236
            Top = 138
            Width = 93
            Height = 31
            Caption = #22797#21046
            Enabled = False
            TabOrder = 2
            OnClick = bbtnFuncCopyClick
          end
          object StaticText3: TStaticText
            Left = 59
            Top = 49
            Width = 64
            Height = 20
            Caption = #31995#32479#21151#33021#65306
            TabOrder = 3
          end
          object lbedSysfuncAmount: TLabeledEdit
            Left = 138
            Top = 98
            Width = 257
            Height = 21
            EditLabel.Width = 36
            EditLabel.Height = 16
            EditLabel.Caption = #25968#37327#65306
            LabelPosition = lpLeft
            LabelSpacing = 5
            MaxLength = 2
            TabOrder = 4
            Text = '1'
          end
          object UpDown2: TUpDown
            Left = 395
            Top = 98
            Width = 19
            Height = 26
            Associate = lbedSysfuncAmount
            Position = 1
            TabOrder = 5
          end
        end
      end
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 803
    Height = 70
    Align = alTop
    Caption = 'ID'#39564#35777#33539#22260
    TabOrder = 1
    object cboxDev: TCheckBox
      Left = 89
      Top = 30
      Width = 119
      Height = 20
      Caption = #24320#21457#29615#22659
      Checked = True
      Enabled = False
      State = cbChecked
      TabOrder = 0
    end
    object cboxTest: TCheckBox
      Left = 236
      Top = 30
      Width = 120
      Height = 20
      Caption = #27979#35797#29615#22659
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
    object cboxHuigui: TCheckBox
      Left = 394
      Top = 30
      Width = 119
      Height = 20
      Caption = #22238#24402#29615#22659
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
    object StaticText4: TStaticText
      Left = 522
      Top = 30
      Width = 198
      Height = 20
      Caption = #25968#25454#24211#37197#32622#22312'ini'#37197#32622#25991#20214'GEN_ID'#22495
      TabOrder = 3
    end
  end
  object GroupBox6: TGroupBox
    Left = 0
    Top = 70
    Width = 803
    Height = 89
    Align = alTop
    Caption = #20010#24615#26631#31614#21450#25968#37327
    TabOrder = 2
    object ckboxBssp: TCheckBox
      Left = 86
      Top = 18
      Width = 100
      Height = 21
      Caption = #20010#24615#26631#31614#65306
      Checked = True
      Enabled = False
      State = cbChecked
      TabOrder = 0
    end
    object edBsspTag: TEdit
      Left = 198
      Top = 14
      Width = 198
      Height = 24
      TabOrder = 1
      Text = #21517#31216
    end
    object StaticText5: TStaticText
      Left = 404
      Top = 18
      Width = 414
      Height = 62
      AutoSize = False
      Caption = #21487#20351#29992'"'#20010#24615#26631#31614'"'#26469#26631#35782#39044#21344'ID'#30340#24402#23646','#36991#20813#34987#20182#20154#35823#29992#12290#25903#25345#21508#31867#23383#31526#21644#20013#25991','#24212#36991#20813#19982#20182#20154#35774#32622#30340#30456#21516#12290#24314#35758#20351#29992#20013#25991#22995#21517#12290
      TabOrder = 2
    end
    object lbedBsspAmount: TLabeledEdit
      Left = 138
      Top = 53
      Width = 168
      Height = 24
      EditLabel.Width = 36
      EditLabel.Height = 16
      EditLabel.Caption = #25968#37327#65306
      LabelPosition = lpLeft
      MaxLength = 2
      TabOrder = 3
      Text = '1'
    end
    object UpDown3: TUpDown
      Left = 306
      Top = 53
      Width = 19
      Height = 24
      Associate = lbedBsspAmount
      Position = 1
      TabOrder = 4
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 370
    Width = 803
    Height = 178
    Align = alBottom
    TabOrder = 3
    object memoOutput: TMemo
      Left = 2
      Top = 18
      Width = 799
      Height = 158
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -25
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 0
      OnKeyPress = memoOutputKeyPress
    end
  end
  object oseDev: TOraSession
    Options.Direct = True
    LoginPrompt = False
    Left = 104
    Top = 360
  end
  object oseTest: TOraSession
    Options.Direct = True
    LoginPrompt = False
    Left = 224
    Top = 360
  end
  object oseHuigui: TOraSession
    Options.Direct = True
    LoginPrompt = False
    Left = 224
    Top = 392
  end
  object oqryDev: TOraQuery
    Session = oseDev
    Left = 136
    Top = 360
  end
  object oraStoredProcDev: TOraStoredProc
    Session = oseDev
    Left = 104
    Top = 392
  end
  object OraStoredProcTest: TOraStoredProc
    Session = oseTest
    Left = 256
    Top = 360
  end
  object OraStoredProcHuigui: TOraStoredProc
    Session = oseHuigui
    Left = 256
    Top = 392
  end
end
