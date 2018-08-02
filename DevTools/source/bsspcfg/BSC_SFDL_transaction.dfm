object sfdl_transaction: Tsfdl_transaction
  Left = 277
  Top = 272
  Width = 506
  Height = 157
  Caption = 'sfdl_transaction'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 120
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 498
    Height = 125
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 194
      Top = 66
      Width = 92
      Height = 31
      TabOrder = 0
      Kind = bkOK
    end
    object StaticText2: TStaticText
      Left = 269
      Top = 23
      Width = 40
      Height = 20
      Caption = 'type ='
      TabOrder = 1
    end
    object StaticText3: TStaticText
      Left = 52
      Top = 23
      Width = 57
      Height = 20
      Caption = 'timeout ='
      TabOrder = 2
    end
    object sped_timeout: TSpinEdit
      Left = 121
      Top = 23
      Width = 90
      Height = 26
      MaxValue = 0
      MinValue = 0
      TabOrder = 3
      Value = 60
    end
    object cb_type: TComboBox
      Left = 328
      Top = 23
      Width = 119
      Height = 24
      Style = csDropDownList
      ItemHeight = 16
      ItemIndex = 0
      TabOrder = 4
      Text = 'TE'
      Items.Strings = (
        'TE'
        'HTTP'
        'TUXEDO')
    end
    object StaticText4: TStaticText
      Left = 220
      Top = 23
      Width = 16
      Height = 20
      Caption = #31186
      TabOrder = 5
    end
  end
end
