object sfdl_with: Tsfdl_with
  Left = 490
  Top = 544
  Width = 487
  Height = 184
  Caption = 'with'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 120
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 479
    Height = 152
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 200
      Top = 112
      Width = 75
      Height = 25
      TabOrder = 0
      Kind = bkOK
    end
    object StaticText1: TStaticText
      Left = 32
      Top = 24
      Width = 43
      Height = 20
      Caption = 'from = '
      TabOrder = 1
    end
    object StaticText2: TStaticText
      Left = 32
      Top = 72
      Width = 28
      Height = 20
      Caption = 'to = '
      TabOrder = 2
    end
    object ed_from: TEdit
      Left = 80
      Top = 24
      Width = 385
      Height = 24
      TabOrder = 3
    end
    object ed_to: TEdit
      Left = 80
      Top = 72
      Width = 385
      Height = 24
      TabOrder = 4
    end
  end
end
