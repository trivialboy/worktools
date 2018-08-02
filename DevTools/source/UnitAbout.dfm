object FormAbout: TFormAbout
  Left = 458
  Top = 326
  BorderStyle = bsDialog
  Caption = #20851#20110
  ClientHeight = 272
  ClientWidth = 418
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 117
    Top = 143
    Width = 228
    Height = 13
    Cursor = crHandPoint
    AutoSize = False
    Caption = #27426#36814#21453#39304#24847#35265#21644#24314#35758': huangwt@fmcc.boss'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsUnderline]
    ParentFont = False
    OnClick = Label1Click
  end
  object Button1: TButton
    Left = 176
    Top = 189
    Width = 60
    Height = 20
    Caption = #30830#23450
    Default = True
    TabOrder = 0
    OnClick = Button1Click
  end
  object StaticText1: TStaticText
    Left = 59
    Top = 52
    Width = 326
    Height = 24
    Caption = #27426#36814#20351#29992'BOSS'#31995#32479'-'#24320#21457#32452#32508#21512#24320#21457#37197#32622#24037#20855
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
end
