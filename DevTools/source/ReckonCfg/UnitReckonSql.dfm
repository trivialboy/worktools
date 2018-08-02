object FormReckonSql: TFormReckonSql
  Left = 357
  Top = 142
  Width = 894
  Height = 626
  Caption = #37197#32622#35821#21477#33050#26412
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 120
  TextHeight = 16
  object mmSql: TRichEdit
    Left = 0
    Top = 0
    Width = 886
    Height = 544
    Align = alClient
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 544
    Width = 886
    Height = 50
    Align = alBottom
    TabOrder = 1
    object Button1: TButton
      Left = 192
      Top = 16
      Width = 75
      Height = 25
      Caption = #28165#31354
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 288
      Top = 16
      Width = 75
      Height = 25
      Caption = #22797#21046
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 382
      Top = 16
      Width = 75
      Height = 25
      Caption = #20851#38381
      TabOrder = 2
      OnClick = Button3Click
    end
  end
end
