object FormPMTool: TFormPMTool
  Left = 247
  Top = 137
  Width = 969
  Height = 553
  Caption = 'PM'#24037#20855
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 961
    Height = 507
    ActivePage = TabSheet4
    Align = alClient
    TabIndex = 3
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #39033#30446#26597#35810
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 953
        Height = 137
        Align = alTop
        Caption = #26597#35810#26465#20214
        TabOrder = 0
        object cbHolder1: TComboBox
          Left = 88
          Top = 24
          Width = 73
          Height = 21
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 0
          Text = '('#20840#37096')'
          Items.Strings = (
            '('#20840#37096')'
            #40644#25991#28059
            #26519#24535#22478
            #36213#23376#24428
            #20219#24535#21191)
        end
        object StaticText1: TStaticText
          Left = 16
          Top = 24
          Width = 70
          Height = 17
          Caption = #39033#30446#36127#36131#20154': '
          TabOrder = 1
        end
        object StaticText2: TStaticText
          Left = 192
          Top = 24
          Width = 46
          Height = 17
          Caption = #24320#21457#32452': '
          TabOrder = 2
        end
        object cbGroup1: TComboBox
          Left = 240
          Top = 24
          Width = 73
          Height = 21
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 3
          Text = '('#20840#37096')'
          Items.Strings = (
            '('#20840#37096')'
            'GMG'
            'BMG'
            'MMG')
        end
        object RadioGroup1: TRadioGroup
          Left = 440
          Top = 8
          Width = 297
          Height = 97
          Caption = #39033#30446#29366#24577
          TabOrder = 4
        end
        object cbNew1: TCheckBox
          Left = 456
          Top = 32
          Width = 57
          Height = 17
          Caption = 'New'
          Checked = True
          State = cbChecked
          TabOrder = 5
        end
        object cbReqconfirmed1: TCheckBox
          Left = 512
          Top = 32
          Width = 97
          Height = 17
          Caption = 'Reqconfirmed'
          Checked = True
          State = cbChecked
          TabOrder = 6
        end
        object cbopen1: TCheckBox
          Left = 616
          Top = 32
          Width = 49
          Height = 17
          Caption = 'Open'
          TabOrder = 7
        end
        object BitBtn1: TBitBtn
          Left = 768
          Top = 32
          Width = 75
          Height = 49
          Caption = #26597#35810
          Default = True
          TabOrder = 8
          OnClick = BitBtn1Click
        end
        object edPrjId1: TLabeledEdit
          Left = 72
          Top = 56
          Width = 185
          Height = 21
          EditLabel.Width = 51
          EditLabel.Height = 13
          EditLabel.Hint = #25903#25345#22810#39033#30446#26597#35810','#29992#21322#35282#36887#21495#20998#38548'.'
          EditLabel.Caption = #39033#30446#32534#21495':'
          LabelPosition = lpLeft
          LabelSpacing = 5
          TabOrder = 9
        end
        object cbfixed1: TCheckBox
          Left = 672
          Top = 32
          Width = 57
          Height = 17
          Caption = 'Fixed'
          TabOrder = 10
        end
        object cbreopen1: TCheckBox
          Left = 456
          Top = 56
          Width = 65
          Height = 17
          Caption = 'Reopen'
          TabOrder = 11
        end
        object cbstested1: TCheckBox
          Left = 568
          Top = 56
          Width = 73
          Height = 17
          Caption = 'S-Tested'
          TabOrder = 12
        end
        object cbtested1: TCheckBox
          Left = 456
          Top = 80
          Width = 73
          Height = 17
          Caption = 'Tested'
          TabOrder = 13
        end
        object cbreleased1: TCheckBox
          Left = 568
          Top = 80
          Width = 73
          Height = 17
          Caption = 'Released'
          TabOrder = 14
        end
        object cbclosed1: TCheckBox
          Left = 648
          Top = 80
          Width = 73
          Height = 17
          Caption = 'Closed'
          TabOrder = 15
        end
        object DateTimePicker1: TDateTimePicker
          Left = 128
          Top = 88
          Width = 89
          Height = 21
          CalAlignment = dtaLeft
          Date = 41720.9171371759
          Time = 41720.9171371759
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 16
        end
        object DateTimePicker2: TDateTimePicker
          Left = 240
          Top = 88
          Width = 89
          Height = 21
          CalAlignment = dtaLeft
          Date = 41720.9939550231
          Time = 41720.9939550231
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 17
        end
        object cbReleaseTime1: TCheckBox
          Left = 24
          Top = 88
          Width = 97
          Height = 17
          Caption = #35745#21010#19978#32447#26102#38388':'
          TabOrder = 18
        end
        object BitBtn4: TBitBtn
          Left = 856
          Top = 40
          Width = 75
          Height = 25
          Caption = #25968#25454#24211#36830#25509
          TabOrder = 19
          OnClick = BitBtn4Click
        end
      end
      object sgrid_query: TStringGrid
        Left = 0
        Top = 137
        Width = 953
        Height = 342
        Align = alClient
        ColCount = 14
        FixedCols = 0
        TabOrder = 1
      end
      object bbtn_checkout: TBitBtn
        Left = 776
        Top = 104
        Width = 49
        Height = 25
        Caption = #26816#20986
        TabOrder = 2
      end
      object bbtn_opendir: TBitBtn
        Left = 832
        Top = 104
        Width = 49
        Height = 25
        Caption = #25171#24320
        TabOrder = 3
      end
    end
    object TabSheet2: TTabSheet
      Caption = #39033#30446#23433#25490
      ImageIndex = 1
      object edPlan: TRichEdit
        Left = 32
        Top = 56
        Width = 769
        Height = 313
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Lines.Strings = (
          'edPlan')
        ParentFont = False
        TabOrder = 0
      end
      object BitBtn2: TBitBtn
        Left = 320
        Top = 408
        Width = 75
        Height = 25
        Caption = #30830#23450#35745#21010
        TabOrder = 1
      end
      object BitBtn3: TBitBtn
        Left = 488
        Top = 408
        Width = 75
        Height = 25
        Caption = #21457#36865#37038#20214
        TabOrder = 2
      end
      object lbedProject: TLabeledEdit
        Left = 88
        Top = 16
        Width = 633
        Height = 21
        EditLabel.Width = 51
        EditLabel.Height = 13
        EditLabel.Caption = #39033#30446#21517#31216':'
        LabelPosition = lpLeft
        LabelSpacing = 5
        TabOrder = 3
      end
    end
    object TabSheet3: TTabSheet
      Caption = #39033#30446#36319#36394
      ImageIndex = 2
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 953
        Height = 105
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
      end
    end
    object TabSheet4: TTabSheet
      Caption = #39033#30446#32479#35745
      ImageIndex = 3
      object GroupBox2: TGroupBox
        Left = 0
        Top = 0
        Width = 953
        Height = 105
        Align = alTop
        Caption = #26597#35810#26465#20214
        TabOrder = 0
        object cbHolder2: TComboBox
          Left = 88
          Top = 24
          Width = 73
          Height = 21
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 0
          Text = #40644#25991#28059
          Items.Strings = (
            #40644#25991#28059
            #26519#24535#22478
            #36213#23376#24428
            #20219#24535#21191)
        end
        object StaticText3: TStaticText
          Left = 16
          Top = 24
          Width = 70
          Height = 17
          Caption = #39033#30446#36127#36131#20154': '
          TabOrder = 1
        end
        object StaticText4: TStaticText
          Left = 216
          Top = 24
          Width = 46
          Height = 17
          Caption = #24320#21457#32452': '
          TabOrder = 2
        end
        object cbGroup2: TComboBox
          Left = 264
          Top = 24
          Width = 73
          Height = 21
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 3
          Text = 'GMG'
          Items.Strings = (
            'GMG'
            'BMG'
            'MMG')
        end
      end
    end
    object TabSheet5: TTabSheet
      Caption = #35774#32622
      ImageIndex = 4
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 507
    Width = 961
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object oraQuery1: TOraQuery
    Session = oraQa
    Left = 352
    Top = 8
  end
  object oraQa: TOraSession
    Options.Direct = True
    Username = 'query'
    Password = 'query'
    Server = '10.1.0.246:1521:qadb'
    LoginPrompt = False
    Left = 416
    Top = 16
  end
end
