object sfdl_assign: Tsfdl_assign
  Left = 402
  Top = 380
  Width = 789
  Height = 241
  Caption = 'sfdl_assign'
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
    Width = 781
    Height = 209
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 20
      Top = 30
      Width = 138
      Height = 16
      Caption = 'assign    can_ignore  =  '
    end
    object Label2: TLabel
      Left = 20
      Top = 79
      Width = 48
      Height = 16
      Caption = 'from   =  '
    end
    object Label3: TLabel
      Left = 20
      Top = 128
      Width = 36
      Height = 16
      Caption = 'to      ='
    end
    object cb_assign_ignore: TComboBox
      Left = 167
      Top = 30
      Width = 100
      Height = 24
      ItemHeight = 16
      ItemIndex = 0
      TabOrder = 2
      Text = 'false'
      Items.Strings = (
        'false'
        'true')
    end
    object ed_assign_from: TEdit
      Left = 79
      Top = 79
      Width = 680
      Height = 24
      TabOrder = 0
    end
    object ed_assign_to: TEdit
      Left = 79
      Top = 128
      Width = 680
      Height = 24
      TabOrder = 1
    end
    object BitBtn1: TBitBtn
      Left = 329
      Top = 161
      Width = 92
      Height = 31
      TabOrder = 3
      Kind = bkOK
    end
  end
end
