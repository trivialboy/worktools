object FormUpdate: TFormUpdate
  Left = 280
  Top = 295
  Width = 421
  Height = 168
  Caption = #29256#26412#21319#32423
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 91
    Width = 413
    Height = 13
    Cursor = crHandPoint
    Align = alBottom
    Alignment = taCenter
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsUnderline]
    ParentColor = False
    ParentFont = False
    OnClick = Label1Click
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 413
    Height = 91
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object memoNewVer: TMemo
      Left = 0
      Top = 0
      Width = 413
      Height = 91
      Align = alClient
      BevelEdges = []
      BevelInner = bvNone
      BevelOuter = bvNone
      TabOrder = 0
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 104
    Width = 413
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      413
      37)
    object Button1: TButton
      Left = 8
      Top = 8
      Width = 57
      Height = 25
      Anchors = [akLeft, akTop, akBottom]
      Caption = #20851#38381
      TabOrder = 0
      OnClick = Button1Click
    end
  end
end
