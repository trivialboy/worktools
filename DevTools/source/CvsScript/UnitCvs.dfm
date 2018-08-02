object FormCvsTag: TFormCvsTag
  Left = 343
  Top = 94
  Width = 819
  Height = 566
  Caption = 'WinCVS'#25209#37327#25171#26631#31614
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 811
    Height = 201
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 13
      Top = 37
      Width = 100
      Height = 13
      Caption = #28304#20195#30721#28165#21333#25991#20214':'
    end
    object SpeedButton1: TSpeedButton
      Left = 688
      Top = 36
      Width = 21
      Height = 20
      Caption = '...'
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 715
      Top = 37
      Width = 40
      Height = 19
      Caption = 'LOAD'
      OnClick = SpeedButton2Click
    end
    object SpeedButton5: TSpeedButton
      Left = 624
      Top = 8
      Width = 23
      Height = 22
      Caption = '...'
      OnClick = SpeedButton5Click
    end
    object edFile: TEdit
      Left = 120
      Top = 35
      Width = 565
      Height = 21
      TabOrder = 0
    end
    object cbSelectAll: TCheckBox
      Left = 683
      Top = 70
      Width = 102
      Height = 13
      Caption = #23548#20837#26102#20840#36873
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
    object GroupBox3: TGroupBox
      Left = 8
      Top = 88
      Width = 513
      Height = 105
      Caption = 'CVS'#29615#22659#35774#32622
      TabOrder = 2
      object SpeedButton3: TSpeedButton
        Left = 433
        Top = 45
        Width = 19
        Height = 18
        Caption = '...'
        OnClick = SpeedButton3Click
      end
      object SpeedButton4: TSpeedButton
        Left = 433
        Top = 76
        Width = 19
        Height = 18
        Caption = '...'
        OnClick = SpeedButton4Click
      end
      object btnLogin: TButton
        Left = 435
        Top = 21
        Width = 60
        Height = 20
        Caption = 'CVS'#30331#38470
        TabOrder = 0
        OnClick = btnLoginClick
      end
      object ledPath: TLabeledEdit
        Left = 89
        Top = 45
        Width = 335
        Height = 21
        EditLabel.Width = 70
        EditLabel.Height = 13
        EditLabel.Caption = 'cvs.exe'#36335#24452':  '
        LabelPosition = lpLeft
        TabOrder = 1
        Text = 'c:\Program Files\WinCvs\cvsnt\cvs.exe'
      end
      object ledCvsLocal: TLabeledEdit
        Left = 98
        Top = 73
        Width = 326
        Height = 21
        EditLabel.Width = 78
        EditLabel.Height = 13
        EditLabel.Caption = 'CVS'#26412#22320#36335#24452':  '
        LabelPosition = lpLeft
        TabOrder = 2
      end
      object cbCvsRoot: TComboBox
        Left = 89
        Top = 20
        Width = 336
        Height = 21
        ItemHeight = 13
        TabOrder = 3
        OnChange = cbCvsRootChange
      end
      object StaticText6: TStaticText
        Left = 24
        Top = 24
        Width = 65
        Height = 17
        Caption = 'CVS ROOT: '
        TabOrder = 4
      end
    end
    object BitBtn1: TBitBtn
      Left = 472
      Top = 140
      Width = 30
      Height = 30
      TabOrder = 3
      OnClick = BitBtn1Click
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333336633
        3333333333333FF3333333330000333333364463333333333333388F33333333
        00003333333E66433333333333338F38F3333333000033333333E66333333333
        33338FF8F3333333000033333333333333333333333338833333333300003333
        3333446333333333333333FF3333333300003333333666433333333333333888
        F333333300003333333E66433333333333338F38F333333300003333333E6664
        3333333333338F38F3333333000033333333E6664333333333338F338F333333
        0000333333333E6664333333333338F338F3333300003333344333E666433333
        333F338F338F3333000033336664333E664333333388F338F338F33300003333
        E66644466643333338F38FFF8338F333000033333E6666666663333338F33888
        3338F3330000333333EE666666333333338FF33333383333000033333333EEEE
        E333333333388FFFFF8333330000333333333333333333333333388888333333
        0000}
      NumGlyphs = 2
    end
    object cbShellSave: TCheckBox
      Left = 491
      Top = 69
      Width = 174
      Height = 16
      Caption = #33050#26412#23384#25918#22312#28165#21333#30446#24405
      TabOrder = 4
    end
    object Panel4: TPanel
      Left = 544
      Top = 96
      Width = 257
      Height = 97
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 5
      object Button7: TButton
        Left = 17
        Top = 68
        Width = 96
        Height = 21
        Caption = #25152#36873#21478#23384#20026
        TabOrder = 0
        OnClick = Button7Click
      end
      object Button1: TButton
        Left = 16
        Top = 44
        Width = 97
        Height = 21
        Caption = #22797#21046#25152#36873#39033
        TabOrder = 1
        OnClick = Button1Click
      end
      object Button5: TButton
        Left = 128
        Top = 48
        Width = 105
        Height = 41
        Caption = #25171#24320#28165#21333#30446#24405
        TabOrder = 2
        OnClick = Button5Click
      end
      object Button2: TButton
        Left = 20
        Top = 17
        Width = 61
        Height = 20
        Caption = #20840#36873
        TabOrder = 3
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 93
        Top = 17
        Width = 60
        Height = 20
        Caption = #20840#19981#36873
        TabOrder = 4
        OnClick = Button3Click
      end
      object Button4: TButton
        Left = 164
        Top = 17
        Width = 69
        Height = 20
        Caption = #21453#21521#36873#25321
        TabOrder = 5
        OnClick = Button4Click
      end
    end
    object btnChkOut: TButton
      Left = 656
      Top = 8
      Width = 57
      Height = 25
      Caption = #26816#20986
      TabOrder = 6
      OnClick = btnChkOutClick
    end
    object btnUpdate: TButton
      Left = 720
      Top = 8
      Width = 51
      Height = 25
      Caption = #25171#24320
      TabOrder = 7
      OnClick = btnUpdateClick
    end
    object cbCvsSubDir: TComboBox
      Left = 264
      Top = 8
      Width = 353
      Height = 21
      ItemHeight = 13
      TabOrder = 8
    end
    object cbCvsDir: TComboBox
      Left = 80
      Top = 8
      Width = 177
      Height = 21
      ItemHeight = 13
      TabOrder = 9
      Items.Strings = (
        'Document/release')
    end
    object StaticText4: TStaticText
      Left = 16
      Top = 12
      Width = 55
      Height = 17
      Caption = #39033#30446#30446#24405':'
      TabOrder = 10
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 201
    Width = 811
    Height = 147
    Align = alClient
    TabOrder = 1
    object cklBoxFile: TCheckListBox
      Left = 1
      Top = 1
      Width = 809
      Height = 145
      Hint = #21452#20987#22797#21046#21040#26631#31614#26639
      TabStop = False
      Align = alClient
      ItemHeight = 13
      PopupMenu = PopupMenu1
      TabOrder = 0
      OnDblClick = cklBoxFileDblClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 348
    Width = 811
    Height = 191
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object GroupBox1: TGroupBox
      Left = 360
      Top = 104
      Width = 433
      Height = 81
      Caption = #28165#21333#25805#20316
      TabOrder = 0
      object lbTmSpan: TLabel
        Left = 316
        Top = 18
        Width = 69
        Height = 13
        Caption = #33719#21462#32791#26102':0'#31186
      end
      object Button6: TButton
        Left = 120
        Top = 82
        Width = 73
        Height = 23
        Caption = #21462#21382#21490#28165#21333
        TabOrder = 0
      end
      object cbCodePath: TComboBox
        Left = 72
        Top = 16
        Width = 241
        Height = 21
        ItemHeight = 13
        TabOrder = 1
        Text = 'Develop/SourceCode/BSC/NG_CCS'
        Items.Strings = (
          'Develop/SourceCode/BSC/NG_CCS'
          'Develop/SourceCode/BFC'
          'Develop/Script/BSSP'
          'Develop/Script/SHELL')
      end
      object StaticText2: TStaticText
        Left = 8
        Top = 16
        Width = 55
        Height = 17
        Caption = #20195#30721#36335#24452':'
        TabOrder = 2
      end
      object dtHis: TDateTimePicker
        Left = 72
        Top = 48
        Width = 97
        Height = 21
        Date = 40841.468686550900000000
        Format = 'yyyy-MM-dd'
        Time = 40841.468686550900000000
        TabOrder = 3
      end
      object StaticText3: TStaticText
        Left = 8
        Top = 48
        Width = 52
        Height = 17
        Caption = #26085'      '#26399' :'
        TabOrder = 4
      end
      object btnHis: TButton
        Left = 358
        Top = 48
        Width = 54
        Height = 21
        Caption = #33719#21462
        TabOrder = 5
        OnClick = btnHisClick
      end
      object labEditCvsName: TLabeledEdit
        Left = 208
        Top = 48
        Width = 121
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = #29992#25143':  '
        LabelPosition = lpLeft
        TabOrder = 6
      end
    end
    object GroupBox2: TGroupBox
      Left = 360
      Top = 0
      Width = 433
      Height = 97
      Caption = #26631#31614#25805#20316
      TabOrder = 1
      object btnDo: TButton
        Left = 224
        Top = 54
        Width = 73
        Height = 20
        Hint = #20026#36873#20013#30340#25991#20214#21019#24314#25110#21024#38500#26631#31614
        Caption = #22788#29702
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = btnDoClick
      end
      object abDel: TRadioButton
        Left = 17
        Top = 55
        Width = 72
        Height = 14
        Caption = #21024#38500#26631#31614
        TabOrder = 1
        OnClick = abDelClick
      end
      object abCreate: TRadioButton
        Left = 103
        Top = 55
        Width = 74
        Height = 14
        Caption = #21019#24314#26631#31614
        Checked = True
        TabOrder = 2
        TabStop = True
        OnClick = abCreateClick
      end
      object cbOverWrite: TCheckBox
        Left = 20
        Top = 75
        Width = 205
        Height = 13
        Caption = #29992#30456#21516#30340#21517#23383#35206#30422#23384#22312#30340#26631#31614
        Checked = True
        State = cbChecked
        TabOrder = 3
      end
      object StaticText5: TStaticText
        Left = 16
        Top = 24
        Width = 62
        Height = 17
        Caption = #26631#31614'(TAG): '
        TabOrder = 4
      end
      object cbTag: TComboBox
        Left = 80
        Top = 21
        Width = 201
        Height = 21
        ItemHeight = 13
        TabOrder = 5
      end
      object btnAutoDo: TButton
        Left = 304
        Top = 53
        Width = 73
        Height = 20
        Hint = #26681#25454#28165#21333#25991#20214#20013#30340'TAG'#26631#35782#33258#21160#22788#29702#26631#31614
        Caption = #33258#21160#22788#29702
        TabOrder = 6
        OnClick = btnAutoDoClick
      end
    end
    object GroupBox4: TGroupBox
      Left = 8
      Top = 8
      Width = 337
      Height = 137
      Caption = #22791#27880#25805#20316
      TabOrder = 2
      object MemoCvs: TMemo
        Left = 2
        Top = 45
        Width = 333
        Height = 90
        Align = alBottom
        ScrollBars = ssBoth
        TabOrder = 0
        OnKeyPress = MemoCvsKeyPress
      end
      object StaticText1: TStaticText
        Left = 7
        Top = 16
        Width = 55
        Height = 17
        Caption = #22791#27880#20449#24687':'
        TabOrder = 1
      end
      object btnMemo: TButton
        Left = 68
        Top = 13
        Width = 61
        Height = 20
        Hint = #20026#36873#20013#30340#25991#20214#20462#25913#22791#27880#20449#24687'('#21407#22791#27880#23558#34987#21024#38500')'
        Caption = #22788#29702
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = btnMemoClick
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Options = [ofReadOnly, ofHideReadOnly, ofFileMustExist, ofEnableSizing]
    Title = 'CVS'#28304#20195#30721#28165#21333#25991#20214
    Left = 768
    Top = 64
  end
  object OpenDialog2: TOpenDialog
    DefaultExt = '*.exe'
    FileName = 'cvs.exe'
    Filter = #21487#25191#34892#31243#24207'|*.exe'
    InitialDir = 'c:/Program Files/WinCvs/cvsnt'
    Options = [ofReadOnly, ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = 'cvs.exe '#36335#24452
    Left = 272
    Top = 184
  end
  object PopupMenu1: TPopupMenu
    Left = 464
    Top = 176
    object N1: TMenuItem
      Caption = #22797#21046#21040#26631#31614#26639'(&T)'
      OnClick = N1Click
    end
    object C1: TMenuItem
      Caption = #22797#21046#21040#21098#36148#26495'(&C)'
      Hint = #22797#21046#24403#21069#34892#25991#23383
      OnClick = C1Click
    end
    object N2: TMenuItem
      Caption = #22797#21046#21246#36873#39033#21040#21098#36148#26495
      OnClick = N2Click
    end
  end
  object OpenDialog3: TOpenDialog
    InitialDir = 'd:\'
    Options = [ofReadOnly, ofHideReadOnly, ofPathMustExist, ofEnableSizing]
    Title = #26412#22320'CVS'#36335#24452
    Left = 312
    Top = 184
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '*.TXT'
    Left = 728
    Top = 64
  end
end
