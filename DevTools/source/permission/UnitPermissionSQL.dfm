object FormPermissionSQL: TFormPermissionSQL
  Left = 391
  Top = 167
  Width = 610
  Height = 498
  Caption = #26435#38480#33050#26412
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 120
  TextHeight = 16
  object MemoSQL: TMemo
    Left = 0
    Top = 0
    Width = 600
    Height = 406
    Align = alClient
    ScrollBars = ssBoth
    TabOrder = 0
    OnKeyPress = MemoSQLKeyPress
  end
  object Panel1: TPanel
    Left = 0
    Top = 406
    Width = 600
    Height = 58
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 246
      Top = 10
      Width = 92
      Height = 31
      Caption = #22797#21046
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 404
      Top = 10
      Width = 92
      Height = 31
      Caption = #20851#38381
      TabOrder = 1
      OnClick = BitBtn2Click
    end
  end
end
