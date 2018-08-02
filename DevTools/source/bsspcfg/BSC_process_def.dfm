object sfdl_process_def: Tsfdl_process_def
  Left = 239
  Top = 200
  Width = 501
  Height = 174
  Caption = 'process_define'
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
    Width = 493
    Height = 142
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 17
      Top = 43
      Width = 164
      Height = 16
      Caption = 'process_define        name = '
    end
    object ed_process_def: TEdit
      Left = 218
      Top = 43
      Width = 228
      Height = 24
      TabOrder = 0
    end
    object BitBtn1: TBitBtn
      Left = 192
      Top = 88
      Width = 92
      Height = 31
      TabOrder = 1
      Kind = bkOK
    end
  end
end
