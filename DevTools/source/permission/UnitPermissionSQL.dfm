object FormPermissionSQL: TFormPermissionSQL
  Left = 451
  Top = 196
  Width = 610
  Height = 498
  Caption = #26435#38480#33050#26412
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object MemoSQL: TMemo
    Left = 0
    Top = 0
    Width = 602
    Height = 424
    Align = alClient
    ScrollBars = ssBoth
    TabOrder = 0
    OnKeyPress = MemoSQLKeyPress
  end
  object Panel1: TPanel
    Left = 0
    Top = 424
    Width = 602
    Height = 47
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 200
      Top = 8
      Width = 75
      Height = 25
      Caption = #22797#21046
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 328
      Top = 8
      Width = 75
      Height = 25
      Caption = #20851#38381
      TabOrder = 1
      OnClick = BitBtn2Click
    end
  end
end
