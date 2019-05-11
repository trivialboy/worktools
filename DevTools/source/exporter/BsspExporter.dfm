object FormBsspExporter: TFormBsspExporter
  Left = 304
  Top = 131
  Width = 938
  Height = 690
  Caption = 'Main v0.1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object GroupBox2: TGroupBox
    Left = 0
    Top = 0
    Width = 928
    Height = 65
    Align = alTop
    Caption = 'DATA BASE'
    TabOrder = 0
    object StaticText1: TStaticText
      Left = 32
      Top = 25
      Width = 68
      Height = 20
      Caption = 'IP:Port:SID'
      TabOrder = 0
    end
    object btnDbConn: TButton
      Left = 697
      Top = 25
      Width = 73
      Height = 24
      Caption = 'Connect'
      TabOrder = 1
      OnClick = btnDbConnClick
    end
    object btnDbDisconn: TButton
      Left = 784
      Top = 25
      Width = 75
      Height = 24
      Caption = 'Disconnect'
      Enabled = False
      TabOrder = 2
      OnClick = btnDbDisconnClick
    end
    object cbDBTns: TComboBox
      Left = 112
      Top = 25
      Width = 161
      Height = 24
      ItemHeight = 16
      ItemIndex = 0
      TabOrder = 3
      Text = '10.1.0.220:1521:kf'
      Items.Strings = (
        '10.1.0.220:1521:kf'
        '10.46.6.181:2481:custom')
    end
    object ledDbUser: TLabeledEdit
      Left = 336
      Top = 25
      Width = 121
      Height = 24
      EditLabel.Width = 41
      EditLabel.Height = 16
      EditLabel.Caption = 'USER:'
      LabelPosition = lpLeft
      TabOrder = 4
      Text = 'bssp'
    end
    object ledDbPass: TLabeledEdit
      Left = 560
      Top = 25
      Width = 121
      Height = 24
      EditLabel.Width = 82
      EditLabel.Height = 16
      EditLabel.Caption = 'PASSWORD:'
      LabelPosition = lpLeft
      TabOrder = 5
      Text = 'bssp'
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 635
    Width = 928
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
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 65
    Width = 928
    Height = 570
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = 'BSSP'#37197#32622
      object GroupBox6: TGroupBox
        Left = 0
        Top = 0
        Width = 920
        Height = 65
        Align = alTop
        Caption = 'OUTPUT DIRECTORY'
        TabOrder = 0
        object SpeedButton1: TSpeedButton
          Left = 729
          Top = 25
          Width = 22
          Height = 21
          Caption = '...'
          OnClick = SpeedButton1Click
        end
        object edExportDir: TEdit
          Left = 16
          Top = 25
          Width = 705
          Height = 24
          Enabled = False
          TabOrder = 0
          Text = 'd:\'
        end
        object btnGetAll: TButton
          Left = 761
          Top = 25
          Width = 48
          Height = 24
          Caption = 'Get All'
          Enabled = False
          TabOrder = 1
          OnClick = btnGetAllClick
        end
        object btStop: TButton
          Left = 816
          Top = 25
          Width = 49
          Height = 24
          Caption = 'Stop'
          Enabled = False
          TabOrder = 2
          OnClick = btStopClick
        end
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 157
        Width = 920
        Height = 128
        Align = alBottom
        Caption = 'BSSP_BUSINESS'
        Color = clBtnFace
        ParentColor = False
        TabOrder = 1
        DesignSize = (
          920
          128)
        object mmBusiness: TMemo
          Left = 16
          Top = 48
          Width = 889
          Height = 65
          Anchors = [akLeft, akTop, akRight]
          Lines.Strings = (
            'business_id = 0')
          TabOrder = 0
        end
        object btnGet1: TButton
          Left = 137
          Top = 16
          Width = 73
          Height = 25
          Caption = 'Get'
          Enabled = False
          TabOrder = 1
          OnClick = btnGet1Click
        end
        object StaticText5: TStaticText
          Left = 16
          Top = 25
          Width = 111
          Height = 20
          Caption = 'WHERE CLAUSE'
          TabOrder = 2
        end
      end
      object GroupBox3: TGroupBox
        Left = 0
        Top = 285
        Width = 920
        Height = 121
        Align = alBottom
        Caption = 'BSSP_PROCESS'
        TabOrder = 2
        DesignSize = (
          920
          121)
        object mmProcess: TMemo
          Left = 16
          Top = 48
          Width = 889
          Height = 57
          Anchors = [akLeft, akTop, akRight]
          Lines.Strings = (
            'process_id = 0')
          TabOrder = 0
        end
        object StaticText4: TStaticText
          Left = 16
          Top = 25
          Width = 111
          Height = 20
          Caption = 'WHERE CLAUSE'
          TabOrder = 1
        end
        object btnGet2: TButton
          Left = 137
          Top = 16
          Width = 73
          Height = 25
          Caption = 'Get'
          Enabled = False
          TabOrder = 2
          OnClick = btnGet2Click
        end
        object cb_procTmpl: TCheckBox
          Left = 233
          Top = 25
          Width = 160
          Height = 16
          BiDiMode = bdLeftToRight
          Caption = #36807#31243#27169#26495#20351#29992#21333#29420#25991#20214
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
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
        Top = 406
        Width = 920
        Height = 133
        Align = alBottom
        Caption = 'BSSP_SERVICE && BSSP_PREFAB_SQL'
        TabOrder = 3
        DesignSize = (
          920
          133)
        object mmService: TMemo
          Left = 16
          Top = 57
          Width = 889
          Height = 64
          Anchors = [akLeft, akTop, akRight]
          Lines.Strings = (
            'service_id = 0')
          TabOrder = 0
        end
        object StaticText7: TStaticText
          Left = 16
          Top = 25
          Width = 111
          Height = 20
          Caption = 'WHERE CLAUSE'
          TabOrder = 1
        end
        object btnGet4: TButton
          Left = 137
          Top = 22
          Width = 73
          Height = 25
          Caption = 'Get'
          Enabled = False
          TabOrder = 2
          OnClick = btnGet4Click
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 65
        Width = 920
        Height = 92
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 4
        object Memo1: TMemo
          Left = 193
          Top = 0
          Width = 727
          Height = 92
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -18
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
          Width = 193
          Height = 92
          Align = alLeft
          Caption = 'PREFIX'
          TabOrder = 1
          object edPreFix: TEdit
            Left = 16
            Top = 25
            Width = 121
            Height = 24
            TabOrder = 0
            Text = 'bssp'
            OnChange = edPreFixChange
          end
          object cbPreFix: TCheckBox
            Left = 16
            Top = 64
            Width = 257
            Height = 17
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
