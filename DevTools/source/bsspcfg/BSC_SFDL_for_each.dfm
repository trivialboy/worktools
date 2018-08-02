object sfdl_for_each: Tsfdl_for_each
  Left = 238
  Top = 197
  Width = 642
  Height = 181
  Caption = 'for_each'
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
    Width = 634
    Height = 149
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 20
      Top = 23
      Width = 45
      Height = 16
      Caption = 'index = '
    end
    object Label2: TLabel
      Left = 28
      Top = 55
      Width = 32
      Height = 16
      Caption = 'var = '
    end
    object ed_for_index: TEdit
      Left = 82
      Top = 23
      Width = 80
      Height = 24
      TabOrder = 0
      Text = 'i'
    end
    object ed_for_var: TEdit
      Left = 81
      Top = 55
      Width = 523
      Height = 24
      TabOrder = 1
    end
    object BitBtn1: TBitBtn
      Left = 263
      Top = 92
      Width = 92
      Height = 31
      TabOrder = 2
      Kind = bkOK
    end
  end
end
