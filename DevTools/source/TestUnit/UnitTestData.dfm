object FormTestData: TFormTestData
  Left = 265
  Top = 168
  Width = 966
  Height = 575
  Caption = #29992#25143#25968#25454#23548#20986
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
  object Panel1: TPanel
    Left = 434
    Top = 0
    Width = 522
    Height = 522
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 0
    object MemoExport: TMemo
      Left = 1
      Top = 1
      Width = 520
      Height = 520
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      HideSelection = False
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 0
      OnKeyPress = MemoExportKeyPress
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 434
    Height = 522
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    object GroupBox2: TGroupBox
      Left = 0
      Top = 0
      Width = 434
      Height = 159
      Align = alTop
      Caption = 'CCS'#25968#25454#24211#36830#25509
      TabOrder = 0
      object StaticText42: TStaticText
        Left = 31
        Top = 30
        Width = 68
        Height = 20
        Caption = 'IP:Port:SID'
        TabOrder = 0
      end
      object CB_TNS_NAME: TComboBox
        Left = 106
        Top = 30
        Width = 149
        Height = 24
        ImeName = #32043#20809#25340#38899#36755#20837#27861
        ItemHeight = 16
        ItemIndex = 0
        TabOrder = 1
        Text = '10.46.158.222:1521:custom'
        Items.Strings = (
          '10.46.158.222:1521:custom'
          '10.46.180.12:1521:tcustom'
          '10.1.0.211:1521:kf')
      end
      object bbtnDbOpen: TBitBtn
        Left = 274
        Top = 34
        Width = 105
        Height = 31
        Caption = #36830#25509#25968#25454#24211
        TabOrder = 2
        OnClick = bbtnDbOpenClick
      end
      object bbtnDbClose: TBitBtn
        Left = 284
        Top = 94
        Width = 98
        Height = 30
        Caption = #26029#24320#36830#25509
        Enabled = False
        TabOrder = 3
        OnClick = bbtnDbCloseClick
      end
      object ledDbUser: TLabeledEdit
        Left = 101
        Top = 63
        Width = 144
        Height = 21
        EditLabel.Width = 27
        EditLabel.Height = 16
        EditLabel.Caption = #29992#25143':'
        LabelPosition = lpLeft
        TabOrder = 4
        Text = 'ccs'
      end
      object ledDbPass: TLabeledEdit
        Left = 101
        Top = 102
        Width = 144
        Height = 21
        EditLabel.Width = 27
        EditLabel.Height = 16
        EditLabel.Caption = #23494#30721':'
        LabelPosition = lpLeft
        TabOrder = 5
        Text = 'ccs'
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 472
      Width = 434
      Height = 50
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object bbtExport: TBitBtn
        Left = 79
        Top = 10
        Width = 92
        Height = 31
        Caption = #23548#20986
        Enabled = False
        TabOrder = 0
        OnClick = bbtExportClick
      end
      object BitBtn1: TBitBtn
        Left = 204
        Top = 10
        Width = 93
        Height = 31
        Caption = #22797#21046#32467#26524
        TabOrder = 1
        OnClick = BitBtn1Click
      end
    end
    object Panel4: TPanel
      Left = 0
      Top = 159
      Width = 434
      Height = 313
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object memoTables: TMemo
        Left = 0
        Top = 238
        Width = 434
        Height = 75
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Lines.Strings = (
          
            'users:home_city=vHomeCity,user_id=vUserId,msisdn=vMsisdn,imsi=vI' +
            'msi'
          'user_product:home_city=vHomeCity,user_id=vUserId'
          'customer:home_city=vHomeCity,customer_id=vCustomerId'
          'user_services:home_city=vHomeCity,obj_id=vUserId'
          '')
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 0
        OnKeyPress = memoTablesKeyPress
      end
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 434
        Height = 238
        Align = alTop
        TabOrder = 1
        object StaticText3: TStaticText
          Left = 20
          Top = 177
          Width = 354
          Height = 20
          Caption = #20869#37096#21464#37327':  vHomeCity, vMsisdn, vUserId, vCustomerId, vImsi'
          TabOrder = 0
        end
        object StaticText4: TStaticText
          Left = 20
          Top = 148
          Width = 368
          Height = 20
          Caption = #33509#26080#20851#38190#23383#27573', '#21017#40664#35748#20026' home_city=vHomeCity,user_id=vUserId'
          TabOrder = 1
        end
        object StaticText2: TStaticText
          Left = 20
          Top = 118
          Width = 254
          Height = 20
          Caption = #34920#21517':'#20851#38190#23383#27573'1='#20869#37096#21464#37327','#20851#38190#23383#27573'2='#20869#37096#21464#37327
          TabOrder = 2
        end
        object StaticText1: TStaticText
          Left = 20
          Top = 207
          Width = 46
          Height = 20
          Caption = #29992#25143#34920': '
          TabOrder = 3
        end
        object lbedtMsisdn: TLabeledEdit
          Left = 98
          Top = 79
          Width = 149
          Height = 21
          EditLabel.Width = 63
          EditLabel.Height = 16
          EditLabel.Caption = #29992#25143#21495#30721':    '
          LabelPosition = lpLeft
          TabOrder = 4
          Text = '13809567226'
        end
        object StaticText5: TStaticText
          Left = 30
          Top = 20
          Width = 274
          Height = 20
          Caption = #26681#25454#21495#30721#23548#20986#29992#25143#25968#25454', '#21487#29992#20110#29992#20363#22330#26223#24674#22797#25110#36801#31227
          TabOrder = 5
        end
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 522
    Width = 956
    Height = 19
    Panels = <
      item
        Width = 150
      end
      item
        Width = 50
      end>
  end
  object oraConn: TOraSession
    Options.Direct = True
    Left = 408
    Top = 72
  end
  object oraQry: TOraQuery
    Session = oraConn
    Left = 408
    Top = 144
  end
end
