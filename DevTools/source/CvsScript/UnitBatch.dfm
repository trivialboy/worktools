object FormCvsBatch: TFormCvsBatch
  Left = 223
  Top = 263
  Width = 696
  Height = 480
  Caption = #25209#37327#39033#30446
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 364
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Memo1: TMemo
      Left = 0
      Top = 0
      Width = 688
      Height = 364
      Align = alClient
      TabOrder = 0
      OnKeyPress = Memo1KeyPress
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 364
    Width = 688
    Height = 89
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnCancel: TButton
      Left = 366
      Top = 32
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 0
      OnClick = btnCancelClick
    end
    object btnOk: TButton
      Left = 200
      Top = 32
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 1
      OnClick = btnOkClick
    end
  end
end
