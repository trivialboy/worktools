object sfdl_process_step: Tsfdl_process_step
  Left = 275
  Top = 230
  Width = 516
  Height = 166
  Caption = 'sfdl_process_step'
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
    Width = 508
    Height = 134
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 17
      Top = 29
      Width = 162
      Height = 16
      Caption = 'process_step        name   =  '
    end
    object ed_process_step: TEdit
      Left = 194
      Top = 29
      Width = 267
      Height = 24
      TabOrder = 0
    end
    object BitBtn1: TBitBtn
      Left = 202
      Top = 80
      Width = 92
      Height = 31
      TabOrder = 1
      Kind = bkOK
    end
  end
end
