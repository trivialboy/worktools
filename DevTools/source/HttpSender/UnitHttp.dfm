object FormHttpSender: TFormHttpSender
  Left = 188
  Top = 125
  Width = 1199
  Height = 689
  Caption = 'FormHttpSender'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object Splitter1: TSplitter
    Left = 529
    Top = 73
    Height = 582
    ResizeStyle = rsUpdate
    OnMoved = Splitter1Moved
  end
  object Panel9: TPanel
    Left = 0
    Top = 0
    Width = 1189
    Height = 73
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Caption = 'Panel9'
    TabOrder = 0
    object Panel1: TPanel
      Left = 2
      Top = 2
      Width = 1002
      Height = 69
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object cb_http: TComboBox
        Left = 91
        Top = 35
        Width = 806
        Height = 24
        ItemHeight = 16
        TabOrder = 1
        Text = 'http://10.1.0.165/fcgi-bin/BSSP_SFC'
        OnChange = cb_httpChange
        OnDblClick = cb_httpDblClick
        OnDropDown = cb_httpDropDown
        Items.Strings = (
          'http://10.1.0.183/fcgi-bin/BSSP_SFC'
          'http://10.46.6.183:8089/fcgi-bin/BSSP_SFC'
          'http://10.1.0.183/fcgi-bin/TECLI_SERVICE'
          'http://10.1.0.183/fcgi-bin/AF_CGI_SERVICE'
          'http://10.1.0.183/fcgi-bin/Accept_Check'
          'http://10.1.0.183/fcgi-bin/BA_CGI_SERVICE'
          'http://10.1.0.183/fcgi-bin/BM_CGI_SERVICE'
          'http://10.1.0.183/fcgi-bin/BSSP_ADMIN_SRV'
          'http://10.1.0.183/fcgi-bin/BSSP_PREFAB_SQL_AC'
          'http://10.1.0.183/fcgi-bin/BSSP_PREFAB_SQL_BILLAC'
          'http://10.1.0.183/fcgi-bin/BSSP_PREFAB_SQL_BIZ'
          'http://10.1.0.183/fcgi-bin/BSSP_PREFAB_SQL_CCS'
          'http://10.1.0.183/fcgi-bin/BSSP_PREFAB_SQL_DICT'
          'http://10.1.0.183/fcgi-bin/BSSP_PREFAB_SQL_PMS'
          'http://10.1.0.183/fcgi-bin/BSSP_PREFAB_SQL_RES'
          'http://10.1.0.183/fcgi-bin/BSSP_PREFAB_SQL_SMS'
          'http://10.1.0.183/fcgi-bin/CS_VIP_SERVICE'
          'http://10.1.0.183/fcgi-bin/CS_CGI_SERVICE'
          'http://10.1.0.183/fcgi-bin/DataDictSrv'
          'http://10.1.0.183/fcgi-bin/FCGI2TE_AGENT'
          'http://10.1.0.183/fcgi-bin/FCGI_VIP_QUERY_CCS'
          'http://10.1.0.183/fcgi-bin/SM_CGI_SERVICE'
          'http://10.1.0.183/fcgi-bin/UIG_SFC_186'
          'http://10.1.0.183/fcgi-bin/UIG_SFC_CENTER'
          'http://10.1.0.183/fcgi-bin/IA_CGI_SERVICE'
          'http://10.1.0.183/fcgi-bin/IA_CGI_BILL_SERVICE'
          'http://10.1.0.183/fcgi-bin/BM_CGI_QueryUserBaseInfo'
          'http://10.46.6.150:8080/fcgi-bin/fcgi_interboss'
          'http://10.46.6.183:8089/fcgi-bin/BA_CGI_SERVICE'
          'http://10.46.6.183:8089/fcgi-bin/BM_CGI_SERVICE'
          'http://10.46.6.183:8089/fcgi-bin/BSSP_PREFAB_SQL_AC'
          'http://10.46.6.183:8089/fcgi-bin/BSSP_PREFAB_SQL_CCS'
          'http://10.46.6.183:8089/fcgi-bin/BSSP_PREFAB_SQL_DICT'
          'http://10.46.6.183:8089/fcgi-bin/BSSP_PREFAB_SQL_RES'
          'http://10.46.6.183:8089/fcgi-bin/UIG_SFC_186'
          'http://10.46.6.183:8089/fcgi-bin/UIG_SFC_CENTER'
          'http://10.46.6.183:8089/fcgi-bin/UIG_SFC_PAYMENT'
          'http://10.46.6.183:8089/fcgi-bin/fcgi_interboss'
          'http://10.46.6.183:8089/fcgi-bin/fcgi_uig_service'
          'http://10.46.6.183:8090/fcgi-bin/CS_VIP_SERVICE'
          'http://10.46.6.203/fcgi-bin/IM_FCGI_GGK_SERVICE'
          'http://10.46.6.203/fcgi-bin/fcgi_newinterboss'
          'http://10.46.6.203/fcgi-bin/fcgi_outboss'
          'http://10.46.6.203/fcgi-bin/fcgi_outerboss'
          'http://10.46.6.203/fcgi-bin/fcgi_uig_service'
          'http://10.46.6.183:8089/fcgi-bin/BSSP_PREFAB_SQL_SMS'
          'http://10.46.6.183:8089/fcgi-bin/BSSP_PREFAB_SQL_BIZ'
          'http://10.46.6.183:8089/fcgi-bin/BM_IB_CGI_SERVICE'
          'http://10.46.6.183:8089/fcgi-bin/AS_CGI_SERVICE'
          'http://10.46.6.183:8089/fcgi-bin/UIG_SFC_OTHER'
          'http://10.46.6.183:8089/fcgi-bin/IA_CGI_SERVICE'
          'http://10.46.6.183:8089/fcgi-bin/BSSP_PREFAB_SQL_BILLAC'
          'http://10.46.6.183:8089/fcgi-bin/SM_CGI_SERVICE '
          'http://10.46.6.183:8089/fcgi-bin/BSSP_PREFAB_SQL_PMS'
          'http://10.46.6.202:80/fcgi-bin/CS_CGI_SERVICE'
          'http://10.46.6.183:8089/fcgi-bin/IM_ENCODING_IMAGE_ERTRANS'
          'http://10.46.6.183:8089/fcgi-bin/BSSP_SFC_REPORT'
          'http://10.46.6.183:8089/fcgi-bin/UIG_SFC_CENTER '
          'http://10.1.0.183/fcgi-bin/AQ_CGI_SERVICE'
          'http://10.46.6.202:8081/fcgi-bin/BA_CGI_SERVICE'
          'http://10.1.0.183:80/fcgi-bin/Accept_Check'
          'http://10.46.6.183:8089/fcgi-bin/AF_CGI_SERVICE'
          ' http://10.46.6.183:80/fcgi-bin/QueryXmlGprsUserSumInfo '
          'http://10.46.6.183:8089/fcgi-bin/UIG_SFC_OUT')
      end
      object StaticText52: TStaticText
        Left = 29
        Top = 35
        Width = 31
        Height = 20
        Caption = #22320#22336':'
        TabOrder = 2
      end
      object edHttp: TEdit
        Left = 92
        Top = 6
        Width = 277
        Height = 24
        TabOrder = 0
        OnChange = edHttpChange
      end
      object StaticText5: TStaticText
        Left = 21
        Top = 10
        Width = 55
        Height = 20
        Caption = #25628#32034#22320#22336':'
        TabOrder = 3
      end
      object btnLoadReq: TButton
        Left = 569
        Top = 5
        Width = 56
        Height = 25
        Caption = #21152#36733
        TabOrder = 4
        OnClick = btnLoadReqClick
      end
      object btnSaveReq: TButton
        Left = 625
        Top = 5
        Width = 56
        Height = 25
        Caption = #20445#23384
        TabOrder = 5
        OnClick = btnSaveReqClick
      end
      object ckbUseBiz: TCheckBox
        Left = 689
        Top = 9
        Width = 137
        Height = 17
        Caption = #20351#29992#19994#21153#22320#22336
        Enabled = False
        TabOrder = 6
        OnClick = ckbUseBizClick
      end
      object cbBiz: TComboBox
        Left = 377
        Top = 6
        Width = 185
        Height = 24
        Style = csDropDownList
        ItemHeight = 16
        TabOrder = 7
      end
    end
    object Panel3: TPanel
      Left = 1004
      Top = 2
      Width = 183
      Height = 69
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 1
      object BitBtn31: TBitBtn
        Left = 50
        Top = 34
        Width = 92
        Height = 29
        Caption = #21457#36865'(&S)'
        TabOrder = 1
        OnClick = BitBtn31Click
      end
      object StaticText1: TStaticText
        Left = 149
        Top = 8
        Width = 16
        Height = 20
        Caption = #31186
        TabOrder = 0
      end
      object lbedtTimeout: TLabeledEdit
        Left = 87
        Top = 6
        Width = 33
        Height = 24
        EditLabel.Width = 66
        EditLabel.Height = 16
        EditLabel.Caption = #36229#26102#26102#38388#65306'  '
        LabelPosition = lpLeft
        TabOrder = 2
        Text = '0'
      end
      object UpDown1: TUpDown
        Left = 120
        Top = 6
        Width = 19
        Height = 24
        Associate = lbedtTimeout
        Max = 600
        Increment = 5
        TabOrder = 3
      end
    end
  end
  object pnl_req: TPanel
    Left = 0
    Top = 73
    Width = 529
    Height = 582
    Align = alLeft
    TabOrder = 1
    object Panel12: TPanel
      Left = 1
      Top = 1
      Width = 527
      Height = 59
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        527
        59)
      object SpeedButton3: TSpeedButton
        Left = 4
        Top = 30
        Width = 50
        Height = 27
        Anchors = [akLeft, akBottom]
        Caption = 'CLEAR'
        Flat = True
        OnClick = SpeedButton3Click
      end
      object sbtnReqXml: TSpeedButton
        Left = 54
        Top = 30
        Width = 40
        Height = 27
        AllowAllUp = True
        Anchors = [akLeft, akBottom]
        GroupIndex = 1
        Caption = 'XML'
        Flat = True
        OnClick = sbtnReqXmlClick
      end
      object SpeedButton1: TSpeedButton
        Left = 94
        Top = 30
        Width = 59
        Height = 27
        Anchors = [akLeft, akBottom]
        Caption = 'FmtXml'
        Flat = True
        OnClick = SpeedButton1Click
      end
      object SpeedButton7: TSpeedButton
        Left = 153
        Top = 30
        Width = 64
        Height = 27
        Anchors = [akLeft, akBottom]
        Caption = 'FmtJson'
        Flat = True
        OnClick = SpeedButton7Click
      end
      object lbBizName: TLabel
        Left = 224
        Top = 36
        Width = 56
        Height = 16
        Caption = '['#21152#36733#19994#21153']'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object bbtnSetHeader: TSpeedButton
        Left = 440
        Top = 5
        Width = 81
        Height = 22
        Anchors = [akTop, akRight]
        Caption = 'setHeader'
        OnClick = bbtnSetHeaderClick
      end
      object cbox_raw: TCheckBox
        Left = 270
        Top = 4
        Width = 169
        Height = 21
        Hint = #19981#21024#38500#27599#34892#30340#31354#26684#19982#25511#21046#31526
        Caption = #20445#30041#21407#26684#24335
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
      end
      object cb_urlencode: TCheckBox
        Left = 172
        Top = 4
        Width = 93
        Height = 21
        Hint = 'URL Encode'
        Caption = 'URL'#32534#30721
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = cb_urlencodeClick
      end
      object cbUTF8encode: TCheckBox
        Left = 76
        Top = 4
        Width = 93
        Height = 21
        Caption = 'UTF-8'#21457#36865
        TabOrder = 1
      end
      object cbContentType: TComboBox
        Left = 341
        Top = 30
        Width = 178
        Height = 24
        Hint = 'content-type '#26681#25454#38656#35201#21487#35843#25972
        Anchors = [akRight, akBottom]
        ItemHeight = 16
        TabOrder = 2
        Text = 'application/x-www-form-urlencoded'
        Items.Strings = (
          'text/xml'
          'application/x-www-form-urlencoded'
          'application/json'
          'application/xml')
      end
      object StaticText2: TStaticText
        Left = 338
        Top = 5
        Width = 85
        Height = 20
        Hint = 'BSSPapplication/x-www-form-urlencoded'#38656#35201#31867#22411
        Anchors = [akTop, akRight]
        Caption = 'Content-Type'
        TabOrder = 3
      end
      object StaticText4: TStaticText
        Left = 5
        Top = 3
        Width = 52
        Height = 20
        Caption = #21457#36865#20449#24687
        TabOrder = 4
      end
    end
    object pnl_req_text: TPanel
      Left = 1
      Top = 60
      Width = 527
      Height = 521
      Align = alClient
      Caption = 'pnl_req_text'
      TabOrder = 1
      object m_req1: TMemo
        Left = 1
        Top = 1
        Width = 525
        Height = 519
        Align = alClient
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 0
        WantTabs = True
        OnKeyPress = m_req1KeyPress
      end
      object m_req: TRichEdit
        Left = 1
        Top = 1
        Width = 525
        Height = 519
        Align = alClient
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 10000000
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 1
      end
    end
    object pnl_req_xml: TPanel
      Left = 79
      Top = 118
      Width = 298
      Height = 331
      Caption = 'pnl_req_xml'
      TabOrder = 2
      Visible = False
      object web_req: TWebBrowser
        Left = 1
        Top = 1
        Width = 296
        Height = 329
        Align = alClient
        TabOrder = 0
        ControlData = {
          4C00000079180000341B00000000000000000000000000000000000000000000
          000000004C000000000000000000000001000000E0D057007335CF11AE690800
          2B2E126208000000000000004C0000000114020000000000C000000000000046
          8000000000000000000000000000000000000000000000000000000000000000
          00000000000000000100000000000000000000000000000000000000}
      end
    end
  end
  object pnl_resp: TPanel
    Left = 532
    Top = 73
    Width = 657
    Height = 582
    Align = alClient
    Caption = 'pnl_resp'
    TabOrder = 2
    object Panel13: TPanel
      Left = 1
      Top = 1
      Width = 655
      Height = 59
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        655
        59)
      object sbtnRespXml: TSpeedButton
        Left = 484
        Top = 30
        Width = 41
        Height = 27
        AllowAllUp = True
        Anchors = [akRight, akBottom]
        GroupIndex = 1
        Caption = 'XML'
        Flat = True
        OnClick = sbtnRespXmlClick
      end
      object SpeedButton2: TSpeedButton
        Left = 433
        Top = 30
        Width = 51
        Height = 27
        Anchors = [akRight, akBottom]
        Caption = 'CLEAR'
        Flat = True
        OnClick = SpeedButton2Click
      end
      object SpeedButton4: TSpeedButton
        Left = 525
        Top = 30
        Width = 63
        Height = 27
        Anchors = [akRight, akBottom]
        Caption = 'FmtXml'
        Flat = True
        OnClick = SpeedButton4Click
      end
      object SpeedButton5: TSpeedButton
        Left = 91
        Top = 31
        Width = 81
        Height = 27
        Caption = 'RspHeader'
        OnClick = SpeedButton5Click
      end
      object SpeedButton6: TSpeedButton
        Left = 9
        Top = 31
        Width = 81
        Height = 27
        Caption = 'ReqHeader'
        OnClick = SpeedButton6Click
      end
      object SpeedButton8: TSpeedButton
        Left = 588
        Top = 30
        Width = 61
        Height = 27
        Anchors = [akRight, akBottom]
        Caption = 'FmtJson'
        Flat = True
        OnClick = SpeedButton8Click
      end
      object sbtnRespHtml: TSpeedButton
        Left = 388
        Top = 30
        Width = 45
        Height = 27
        AllowAllUp = True
        Anchors = [akRight, akBottom]
        GroupIndex = 1
        Caption = 'Html'
        Flat = True
        OnClick = sbtnRespHtmlClick
      end
      object cbMarkResp: TCheckBox
        Left = 473
        Top = 5
        Width = 105
        Height = 21
        Anchors = [akRight, akBottom]
        Caption = #26631#27880#31354#33410#28857
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object cbUtf8Decode: TCheckBox
        Left = 363
        Top = 5
        Width = 105
        Height = 21
        Anchors = [akTop, akRight]
        Caption = 'UTF-8 '#35299#30721
        TabOrder = 1
      end
      object StaticText3: TStaticText
        Left = 8
        Top = 4
        Width = 52
        Height = 20
        Caption = #36820#22238#20449#24687
        TabOrder = 2
      end
    end
    object pnl_resp_xml: TPanel
      Left = 148
      Top = 64
      Width = 306
      Height = 420
      Caption = 'pnl_resp_xml'
      TabOrder = 1
      Visible = False
      object web_resp: TWebBrowser
        Left = 1
        Top = 1
        Width = 304
        Height = 418
        Align = alClient
        TabOrder = 0
        ControlData = {
          4C00000023190000902200000000000000000000000000000000000000000000
          000000004C000000000000000000000001000000E0D057007335CF11AE690800
          2B2E126208000000000000004C0000000114020000000000C000000000000046
          8000000000000000000000000000000000000000000000000000000000000000
          00000000000000000100000000000000000000000000000000000000}
      end
    end
    object pnl_resp_text: TPanel
      Left = 1
      Top = 60
      Width = 655
      Height = 521
      Align = alClient
      Caption = 'pnl_resp_text'
      TabOrder = 2
      object m_resp1: TMemo
        Left = 1
        Top = 1
        Width = 653
        Height = 519
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 0
        WantTabs = True
        OnKeyPress = m_req1KeyPress
      end
      object m_resp: TRichEdit
        Left = 1
        Top = 1
        Width = 653
        Height = 519
        Align = alClient
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 10000000
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 1
      end
    end
  end
  object IdAntiFreeze1: TIdAntiFreeze
    OnlyWhenIdle = False
    Left = 848
    Top = 136
  end
  object OpenDialog1: TOpenDialog
    Filter = #35831#27714#25253#25991'(*.req)|*.req'
    Options = [ofHideReadOnly, ofFileMustExist, ofNoNetworkButton, ofEnableSizing]
    Title = #35831#36873#25321#35831#27714#25253#25991
    Left = 605
    Top = 197
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '.req'
    FileName = '*.req'
    Filter = #35831#27714#25253#25991'(*.req)|*.req'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 645
    Top = 197
  end
end
