object sfdl_if: Tsfdl_if
  Left = 383
  Top = 419
  Width = 578
  Height = 130
  Caption = 'if...else...elseif'
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
    Width = 570
    Height = 98
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 15
      Top = 20
      Width = 82
      Height = 16
      Caption = 'condition   =    '
    end
    object ed_condition: TEdit
      Left = 90
      Top = 20
      Width = 447
      Height = 24
      TabOrder = 0
    end
    object BitBtn1: TBitBtn
      Left = 239
      Top = 55
      Width = 93
      Height = 31
      TabOrder = 1
      Kind = bkOK
    end
  end
end
