object FormBsspExporter: TFormBsspExporter
  Left = 244
  Top = 136
  Width = 938
  Height = 690
  Caption = 'Main v0.1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox2: TGroupBox
    Left = 0
    Top = 0
    Width = 930
    Height = 53
    Align = alTop
    Caption = 'DATA BASE'
    TabOrder = 0
    object StaticText1: TStaticText
      Left = 26
      Top = 20
      Width = 57
      Height = 17
      Caption = 'IP:Port:SID'
      TabOrder = 0
    end
    object btnDbConn: TButton
      Left = 566
      Top = 20
      Width = 60
      Height = 20
      Caption = 'Connect'
      TabOrder = 1
      OnClick = btnDbConnClick
    end
    object btnDbDisconn: TButton
      Left = 637
      Top = 20
      Width = 61
      Height = 20
      Caption = 'Disconnect'
      Enabled = False
      TabOrder = 2
      OnClick = btnDbDisconnClick
    end
    object cbDBTns: TComboBox
      Left = 91
      Top = 20
      Width = 131
      Height = 21
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 3
      Text = '10.1.0.220:1521:kf'
      Items.Strings = (
        '10.1.0.220:1521:kf'
        '10.46.6.181:2481:custom')
    end
    object ledDbUser: TLabeledEdit
      Left = 273
      Top = 20
      Width = 98
      Height = 21
      EditLabel.Width = 33
      EditLabel.Height = 13
      EditLabel.Caption = 'USER:'
      LabelPosition = lpLeft
      LabelSpacing = 3
      TabOrder = 4
      Text = 'bssp'
    end
    object ledDbPass: TLabeledEdit
      Left = 455
      Top = 20
      Width = 98
      Height = 21
      EditLabel.Width = 66
      EditLabel.Height = 13
      EditLabel.Caption = 'PASSWORD:'
      LabelPosition = lpLeft
      LabelSpacing = 3
      TabOrder = 5
      Text = 'bssp'
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 642
    Width = 930
    Height = 21
    Panels = <
      item
        Width = 300
      end
      item
        Width = 400
      end
      item
        Width = 100
      end>
    SimplePanel = False
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 53
    Width = 930
    Height = 589
    ActivePage = TabSheet1
    Align = alClient
    TabIndex = 0
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = 'BSSP'#37197#32622
      object GroupBox6: TGroupBox
        Left = 0
        Top = 0
        Width = 922
        Height = 53
        Align = alTop
        Caption = 'OUTPUT DIRECTORY'
        TabOrder = 0
        object SpeedButton1: TSpeedButton
          Left = 592
          Top = 20
          Width = 18
          Height = 17
          Caption = '...'
          OnClick = SpeedButton1Click
        end
        object edExportDir: TEdit
          Left = 13
          Top = 20
          Width = 573
          Height = 21
          Enabled = False
          TabOrder = 0
          Text = 'd:\'
        end
        object btnGetAll: TButton
          Left = 618
          Top = 20
          Width = 39
          Height = 20
          Caption = 'Get All'
          Enabled = False
          TabOrder = 1
          OnClick = btnGetAllClick
        end
        object btStop: TButton
          Left = 663
          Top = 20
          Width = 40
          Height = 20
          Caption = 'Stop'
          Enabled = False
          TabOrder = 2
          OnClick = btStopClick
        end
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 251
        Width = 922
        Height = 104
        Align = alBottom
        Caption = 'BSSP_BUSINESS'
        Color = clBtnFace
        ParentColor = False
        TabOrder = 1
        DesignSize = (
          922
          104)
        object mmBusiness: TMemo
          Left = 13
          Top = 39
          Width = 722
          Height = 53
          Anchors = [akLeft, akTop, akRight]
          Lines.Strings = (
            '1=2')
          TabOrder = 0
        end
        object btnGet1: TButton
          Left = 111
          Top = 13
          Width = 60
          Height = 20
          Caption = 'Get'
          Enabled = False
          TabOrder = 1
          OnClick = btnGet1Click
        end
        object StaticText5: TStaticText
          Left = 13
          Top = 20
          Width = 90
          Height = 17
          Caption = 'WHERE CLAUSE'
          TabOrder = 2
        end
      end
      object GroupBox3: TGroupBox
        Left = 0
        Top = 355
        Width = 922
        Height = 98
        Align = alBottom
        Caption = 'BSSP_PROCESS'
        TabOrder = 2
        DesignSize = (
          922
          98)
        object mmProcess: TMemo
          Left = 13
          Top = 39
          Width = 722
          Height = 46
          Anchors = [akLeft, akTop, akRight]
          Lines.Strings = (
            '1=2')
          TabOrder = 0
        end
        object StaticText4: TStaticText
          Left = 13
          Top = 20
          Width = 90
          Height = 17
          Caption = 'WHERE CLAUSE'
          TabOrder = 1
        end
        object btnGet2: TButton
          Left = 111
          Top = 13
          Width = 60
          Height = 20
          Caption = 'Get'
          Enabled = False
          TabOrder = 2
          OnClick = btnGet2Click
        end
        object cb_procTmpl: TCheckBox
          Left = 189
          Top = 20
          Width = 130
          Height = 13
          BiDiMode = bdLeftToRight
          Caption = #36807#31243#27169#26495#20351#29992#21333#29420#25991#20214
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentBiDiMode = False
          ParentFont = False
          TabOrder = 3
          Visible = False
        end
      end
      object GroupBox5: TGroupBox
        Left = 0
        Top = 453
        Width = 922
        Height = 108
        Align = alBottom
        Caption = 'BSSP_SERVICE && BSSP_PREFAB_SQL'
        TabOrder = 3
        DesignSize = (
          922
          108)
        object mmService: TMemo
          Left = 13
          Top = 46
          Width = 722
          Height = 52
          Anchors = [akLeft, akTop, akRight]
          Lines.Strings = (
            '1=2')
          TabOrder = 0
        end
        object StaticText7: TStaticText
          Left = 13
          Top = 20
          Width = 90
          Height = 17
          Caption = 'WHERE CLAUSE'
          TabOrder = 1
        end
        object btnGet4: TButton
          Left = 111
          Top = 18
          Width = 60
          Height = 20
          Caption = 'Get'
          Enabled = False
          TabOrder = 2
          OnClick = btnGet4Click
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 53
        Width = 922
        Height = 198
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 4
        object Memo1: TMemo
          Left = 157
          Top = 0
          Width = 765
          Height = 198
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Lines.Strings = (
            '1)'#22635#20889#27491#30830#21442#25968','#36830#25509#25968#25454#24211';'
            '2)'#25351#23450#36755#20986#30446#24405';['#40664#35748#31243#24207#25152#22312#30446#24405'] '
            '3)'#22312'WHERE CLAUSE'#26694#20013#22635#20889#26465#20214'('#19981#29992#20889'"where")['#21487#36873']')
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object GroupBox7: TGroupBox
          Left = 0
          Top = 0
          Width = 157
          Height = 198
          Align = alLeft
          Caption = 'PREFIX'
          TabOrder = 1
          object edPreFix: TEdit
            Left = 13
            Top = 20
            Width = 98
            Height = 21
            TabOrder = 0
            Text = 'bssp'
            OnChange = edPreFixChange
          end
          object cbPreFix: TCheckBox
            Left = 13
            Top = 52
            Width = 209
            Height = 14
            Hint = 'add prefix except BSSP_PROCESS_TEMPLATE'
            Caption = #21253#21547#27169#24335#21069#32512
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 1
            OnClick = cbPreFixClick
          end
        end
      end
    end
  end
  object ADOConnection1: TOraSession
    Options.Direct = True
    AfterConnect = ADOConnection1_1AfterConnect
    AfterDisconnect = ADOConnection1_1AfterDisconnect
    Left = 480
    Top = 88
  end
  object adoQuery1: TOraQuery
    Session = ADOConnection1
    Left = 528
    Top = 80
  end
  object ADOQuery2: TOraQuery
    Session = ADOConnection1
    Left = 568
    Top = 80
  end
  object ADOQuery3: TOraQuery
    Session = ADOConnection1
    Left = 608
    Top = 72
  end
end
