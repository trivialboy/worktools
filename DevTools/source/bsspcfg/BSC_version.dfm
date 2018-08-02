object FormVerUp: TFormVerUp
  Left = 398
  Top = 212
  Width = 723
  Height = 589
  Caption = #29256#26412#26356#26032#35760#24405
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 713
    Height = 478
    Align = alClient
    TabOrder = 0
    object Memo1: TMemo
      Left = 1
      Top = 1
      Width = 711
      Height = 317
      Align = alClient
      ScrollBars = ssBoth
      TabOrder = 0
      OnChange = Memo1Change
    end
    object sgClient: TStringGrid
      Left = 1
      Top = 318
      Width = 711
      Height = 159
      Align = alBottom
      DefaultColWidth = 40
      RowCount = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      ColWidths = (
        40
        153
        146
        196
        119)
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 478
    Width = 713
    Height = 77
    Align = alBottom
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 307
      Top = 23
      Width = 92
      Height = 31
      TabOrder = 0
      Kind = bkClose
    end
  end
end
