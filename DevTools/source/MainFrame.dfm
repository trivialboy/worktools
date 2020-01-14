object FormDevToolsMain: TFormDevToolsMain
  Left = 368
  Top = 213
  Width = 935
  Height = 589
  Caption = #32508#21512#24320#21457#37197#32622#24037#20855
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  WindowMenu = windows_list
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object Splitter1: TSplitter
    Left = 0
    Top = 36
    Width = 925
    Height = 5
    Cursor = crVSplit
    Align = alTop
    Beveled = True
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 511
    Width = 925
    Height = 19
    Panels = <
      item
        Width = 300
      end
      item
        Width = 500
      end
      item
        Width = 100
      end
      item
        Width = 50
      end>
    OnClick = StatusBar1Click
  end
  object TabControl1: TTabControl
    Left = 0
    Top = 0
    Width = 925
    Height = 36
    Align = alTop
    HotTrack = True
    MultiLine = True
    MultiSelect = True
    TabOrder = 1
    OnChange = TabControl1Change
    OnMouseDown = TabControl1MouseDown
  end
  object edTab: TEdit
    Left = 177
    Top = 98
    Width = 149
    Height = 24
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 2
    Text = 'edTab'
    Visible = False
    OnExit = edTabExit
    OnKeyPress = edTabKeyPress
  end
  object MainMenu1: TMainMenu
    Left = 256
    Top = 64
    object N1: TMenuItem
      Caption = #31995#32479'(&1)'
      object N2: TMenuItem
        Action = actUpdate
      end
      object N6: TMenuItem
        Action = actAbout
      end
      object N3: TMenuItem
        Action = actExit
      end
    end
    object mnTools: TMenuItem
      Caption = #24037#20855#39033'(&2)'
    end
    object windows_list: TMenuItem
      Caption = #31383#21475'(&3)'
      GroupIndex = 9
      object tile1: TMenuItem
        Caption = #24179#38138#31383#21475'(&T)'
        OnClick = tile1Click
      end
      object cascade1: TMenuItem
        Caption = #23618#21472#31383#21475'(&C)'
        OnClick = cascade1Click
      end
    end
  end
  object ActionList1: TActionList
    Left = 312
    Top = 64
    object actUpdate: TAction
      Caption = #21319#32423'(&U)'
      OnExecute = actUpdateExecute
    end
    object actAbout: TAction
      Caption = #20851#20110'(&A)'
      OnExecute = actAboutExecute
    end
    object actExit: TAction
      Caption = #36864#20986'(&X)'
      OnExecute = actExitExecute
    end
  end
  object IdAntiFreeze1: TIdAntiFreeze
    Left = 664
    Top = 64
  end
  object Timer1: TTimer
    Interval = 5000
    OnTimer = Timer1Timer
    Left = 760
    Top = 64
  end
end
