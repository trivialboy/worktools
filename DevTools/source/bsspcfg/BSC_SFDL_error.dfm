object sfdl_error: Tsfdl_error
  Left = 281
  Top = 309
  Width = 427
  Height = 234
  Caption = 'sfdl error'
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
    Width = 419
    Height = 202
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object ed_errclass: TEdit
      Left = 112
      Top = 24
      Width = 265
      Height = 24
      TabOrder = 0
    end
    object StaticText1: TStaticText
      Left = 32
      Top = 24
      Width = 72
      Height = 20
      Caption = 'err_class = '
      TabOrder = 1
    end
    object BitBtn1: TBitBtn
      Left = 176
      Top = 152
      Width = 75
      Height = 25
      TabOrder = 2
      Kind = bkOK
    end
    object StaticText2: TStaticText
      Left = 32
      Top = 72
      Width = 71
      Height = 20
      Caption = 'err_code = '
      TabOrder = 3
    end
    object StaticText3: TStaticText
      Left = 32
      Top = 112
      Width = 66
      Height = 20
      Caption = 'err_msg = '
      TabOrder = 4
    end
    object ed_errcode: TEdit
      Left = 112
      Top = 72
      Width = 265
      Height = 24
      TabOrder = 5
    end
    object ed_errmsg: TEdit
      Left = 112
      Top = 112
      Width = 265
      Height = 24
      TabOrder = 6
    end
  end
end
