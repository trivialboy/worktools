object FormSfdl: TFormSfdl
  Left = 204
  Top = 50
  Width = 1015
  Height = 632
  Caption = #36807#31243#27169#26495#23450#20041
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 120
  TextHeight = 16
  object pnl_btn: TPanel
    Left = 0
    Top = 0
    Width = 1005
    Height = 90
    Align = alTop
    TabOrder = 3
    object BitBtn4: TBitBtn
      Left = 108
      Top = 49
      Width = 93
      Height = 31
      Caption = 'if(&F)'
      TabOrder = 0
      OnClick = BitBtn4Click
    end
    object BitBtn5: TBitBtn
      Left = 108
      Top = 10
      Width = 93
      Height = 31
      Caption = 'transaction(&T)'
      TabOrder = 1
      OnClick = BitBtn5Click
    end
    object BitBtn6: TBitBtn
      Left = 207
      Top = 10
      Width = 109
      Height = 31
      Caption = 'process_step(&P)'
      TabOrder = 2
      OnClick = BitBtn6Click
    end
    object BitBtn7: TBitBtn
      Left = 325
      Top = 10
      Width = 92
      Height = 31
      Caption = 'finish(&N)'
      TabOrder = 3
      OnClick = BitBtn7Click
    end
    object BitBtn8: TBitBtn
      Left = 423
      Top = 10
      Width = 93
      Height = 31
      Caption = 'assign(&A)'
      TabOrder = 4
      OnClick = BitBtn8Click
    end
    object BitBtn9: TBitBtn
      Left = 325
      Top = 49
      Width = 92
      Height = 31
      Caption = 'elseif(&S)'
      TabOrder = 5
      OnClick = BitBtn9Click
    end
    object BitBtn10: TBitBtn
      Left = 522
      Top = 10
      Width = 92
      Height = 31
      Caption = 'exception(&E)'
      TabOrder = 6
      OnClick = BitBtn10Click
    end
    object BitBtn11: TBitBtn
      Left = 820
      Top = 10
      Width = 93
      Height = 31
      Caption = 'invoke(&V)'
      TabOrder = 7
      OnClick = BitBtn11Click
    end
    object BitBtn12: TBitBtn
      Left = 719
      Top = 10
      Width = 92
      Height = 31
      Caption = 'body(&B)'
      TabOrder = 8
      OnClick = BitBtn12Click
    end
    object BitBtn13: TBitBtn
      Left = 10
      Top = 10
      Width = 92
      Height = 31
      Caption = #27969#31243#26694#26550'(&M)'
      TabOrder = 9
      OnClick = BitBtn13Click
    end
    object BitBtn14: TBitBtn
      Left = 10
      Top = 49
      Width = 92
      Height = 31
      Caption = 'description(&D)'
      TabOrder = 10
      OnClick = BitBtn14Click
    end
    object BitBtn15: TBitBtn
      Left = 423
      Top = 49
      Width = 93
      Height = 31
      Caption = 'for_each(&H)'
      TabOrder = 11
      OnClick = BitBtn15Click
    end
    object Button1: TButton
      Left = 207
      Top = 49
      Width = 109
      Height = 31
      Caption = 'else(&L)'
      TabOrder = 12
      OnClick = Button1Click
    end
    object BitBtn16: TBitBtn
      Left = 522
      Top = 49
      Width = 92
      Height = 31
      Caption = 'break(&K)'
      TabOrder = 13
      OnClick = BitBtn16Click
    end
    object BitBtn17: TBitBtn
      Left = 620
      Top = 49
      Width = 93
      Height = 31
      Caption = 'continue(&C)'
      TabOrder = 14
      OnClick = BitBtn17Click
    end
    object BitBtn2: TBitBtn
      Left = 719
      Top = 50
      Width = 92
      Height = 31
      Caption = 'with(&W)'
      TabOrder = 15
      OnClick = BitBtn2Click
    end
    object BitBtn19: TBitBtn
      Left = 622
      Top = 10
      Width = 91
      Height = 31
      Caption = 'error(&O)'
      TabOrder = 16
      OnClick = BitBtn19Click
    end
    object cbFunc: TComboBox
      Left = 825
      Top = 57
      Width = 168
      Height = 24
      ItemHeight = 16
      TabOrder = 17
      Text = '---------'#20989#25968'---------'
      OnChange = cbFuncChange
      Items.Strings = (
        '---------'#20989#25968'---------'
        '_substr('#23383#31526#20018', '#24320#22987#20301#32622', ['#23376#20018#38271#24230'])'
        '_sysdate()'
        '_add('#25968#20540'1,'#25968#20540'2,['#31934#24230'])'
        '_sub('#34987#20943#25968','#20943#25968',['#31934#24230']) '
        '_mul('#25968#20540'1, '#25968#20540'2,['#31934#24230'])'
        '_div('#34987#38500#25968','#38500#25968',['#31934#24230'])'
        '_round('#25968#20540')'
        '_catstr('#23383#31526#20018'1,'#23383#31526#20018'2)'
        '_rand('#20301#25968')'
        '_acceptMemo('#25805#20316#35828#26126',['#21495#30721']) '
        '_ltimetos('#38271#26102#38388#20018'yyyymmdd hh24:mi:ss)'
        '_stimetol('#30701#26102#38388#20018'yyyymmddhh24miss)'
        '_sum('#21464#37327#21517')'
        '_count('#21464#37327#21517')'
        '_lastDay('#26085#26399'yyyymm[dd])'
        '_nextMonth('#26085#26399'yyyymmdd)'
        '_addMonth('#26085#26399'yyyymmdd,'#26376#20221#25968')'
        '_strlen('#23383#31526#20018')'
        '_replace('#28304#23383#31526#20018','#23376#20018','#26367#25442#20018'[,'#26367#25442#27425#25968'])'
        '_rpad('#23383#31526#20018','#38271#24230'[,'#22635#20805#23383#31526'])'
        '_lpad('#23383#31526#20018','#38271#24230'[,'#22635#20805#23383#31526'])'
        '_getAcceptId()'
        '{'#24120#37327'}in{'#21464#37327'}'
        'count({'#21464#37327'})'
        'isnull({'#21464#37327'})')
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 553
    Width = 1005
    Height = 45
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      1005
      45)
    object BitBtn1: TBitBtn
      Left = 908
      Top = 10
      Width = 93
      Height = 31
      Anchors = [akTop, akRight]
      TabOrder = 3
      OnClick = BitBtn1Click
      Kind = bkOK
    end
    object bbtn_clear: TBitBtn
      Left = 713
      Top = 10
      Width = 91
      Height = 31
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = #28165#31354
      ModalResult = 2
      TabOrder = 1
      OnClick = bbtn_clearClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object BitBtn3: TBitBtn
      Left = 613
      Top = 10
      Width = 92
      Height = 31
      Anchors = [akTop, akRight]
      Caption = #20363#23376
      TabOrder = 0
      OnClick = BitBtn3Click
    end
    object bbtnXml: TBitBtn
      Left = 810
      Top = 10
      Width = 92
      Height = 31
      Anchors = [akTop, akRight]
      Caption = 'XML(&X)'
      TabOrder = 2
      OnClick = bbtnXmlClick
    end
    object BitBtn18: TBitBtn
      Left = 514
      Top = 10
      Width = 93
      Height = 31
      Anchors = [akTop, akRight]
      Caption = #26684#24335#25972#29702'(&R)'
      TabOrder = 4
      OnClick = BitBtn18Click
    end
    object sped_indent: TSpinEdit
      Left = 89
      Top = 10
      Width = 48
      Height = 26
      Anchors = [akLeft]
      MaxValue = 8
      MinValue = 0
      TabOrder = 5
      Value = 2
    end
    object StaticText1: TStaticText
      Left = 20
      Top = 10
      Width = 52
      Height = 20
      Anchors = [akLeft]
      Caption = #32553#36827#23485#24230
      TabOrder = 6
    end
    object rb_char: TRadioButton
      Left = 144
      Top = 16
      Width = 57
      Height = 17
      Caption = #23383#31526
      Checked = True
      TabOrder = 7
      TabStop = True
      OnClick = rb_charClick
    end
    object rb_tab: TRadioButton
      Left = 208
      Top = 16
      Width = 57
      Height = 17
      Caption = 'TAB'
      TabOrder = 8
      OnClick = rb_tabClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 90
    Width = 1005
    Height = 463
    Align = alClient
    Caption = 'Panel3'
    TabOrder = 2
    object RichEditSfdl2: TRichEdit
      Left = 761
      Top = 400
      Width = 104
      Height = 137
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -18
      Font.Name = #23435#20307
      Font.Style = []
      MaxLength = 10000000
      ParentFont = False
      PlainText = True
      ScrollBars = ssBoth
      TabOrder = 0
      WantTabs = True
      OnChange = RichEditSfdl2Change
    end
    object richeditsfdl: TMemo
      Left = 1
      Top = 1
      Width = 1003
      Height = 461
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -18
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 1
      OnChange = richeditsfdlChange
      OnKeyPress = richeditsfdlKeyPress
    end
  end
  object Panel2: TPanel
    Left = 319
    Top = 218
    Width = 395
    Height = 199
    Caption = 'Panel2'
    TabOrder = 1
    Visible = False
    object web1: TWebBrowser
      Left = 48
      Top = 41
      Width = 322
      Height = 120
      TabOrder = 0
      ControlData = {
        4C000000A01A0000EC0900000000000000000000000000000000000000000000
        000000004C000000000000000000000001000000E0D057007335CF11AE690800
        2B2E126208000000000000004C0000000114020000000000C000000000000046
        8000000000000000000000000000000000000000000000000000000000000000
        00000000000000000100000000000000000000000000000000000000}
    end
  end
end
