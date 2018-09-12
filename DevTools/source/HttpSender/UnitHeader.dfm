object FormHeader: TFormHeader
  Left = 553
  Top = 321
  Width = 407
  Height = 304
  Caption = #35774#32622#35831#27714'HEADER'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 397
    Height = 217
    Align = alTop
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 224
    Top = 232
    Width = 75
    Height = 25
    TabOrder = 1
    OnClick = BitBtn1Click
    Kind = bkCancel
  end
  object BitBtn2: TBitBtn
    Left = 112
    Top = 232
    Width = 75
    Height = 25
    TabOrder = 2
    OnClick = BitBtn2Click
    Kind = bkOK
  end
end
