object sfdl_exception: Tsfdl_exception
  Left = 365
  Top = 571
  Width = 682
  Height = 180
  Caption = 'exception'
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
    Width = 674
    Height = 148
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 286
      Top = 98
      Width = 92
      Height = 31
      TabOrder = 3
      Kind = bkOK
    end
    object StaticText1: TStaticText
      Left = 39
      Top = 20
      Width = 62
      Height = 20
      Caption = 'exception'
      TabOrder = 4
    end
    object StaticText2: TStaticText
      Left = 128
      Top = 20
      Width = 72
      Height = 20
      Caption = 'err_class = '
      TabOrder = 5
    end
    object StaticText3: TStaticText
      Left = 374
      Top = 20
      Width = 71
      Height = 20
      Caption = 'err_code = '
      TabOrder = 6
    end
    object StaticText4: TStaticText
      Left = 49
      Top = 59
      Width = 66
      Height = 20
      Caption = 'err_msg = '
      TabOrder = 7
    end
    object ed_errmsg: TEdit
      Left = 128
      Top = 59
      Width = 473
      Height = 24
      TabOrder = 2
      Text = 'ed_errmsg'
    end
    object ed_errclass: TEdit
      Left = 197
      Top = 20
      Width = 149
      Height = 24
      TabOrder = 0
    end
    object ed_errcode: TEdit
      Left = 453
      Top = 20
      Width = 149
      Height = 24
      TabOrder = 1
      Text = 'ed_errcode'
    end
  end
end
