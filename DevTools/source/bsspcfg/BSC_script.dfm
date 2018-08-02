object FormScript: TFormScript
  Left = 514
  Top = 263
  Width = 696
  Height = 480
  Caption = 'SQL'#33050#26412
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnResize = FormResize
  PixelsPerInch = 120
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 395
    Width = 686
    Height = 51
    Align = alBottom
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 441
      Top = 10
      Width = 93
      Height = 31
      TabOrder = 2
      Kind = bkClose
    end
    object BitBtn2: TBitBtn
      Left = 236
      Top = 10
      Width = 93
      Height = 31
      Caption = #28165#31354
      TabOrder = 0
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Left = 341
      Top = 10
      Width = 92
      Height = 31
      Caption = #22797#21046#20840#37096
      TabOrder = 1
      OnClick = BitBtn3Click
    end
    object bbtnExecute: TBitBtn
      Left = 9
      Top = 9
      Width = 92
      Height = 30
      Caption = #25191#34892'SQL'
      Enabled = False
      TabOrder = 3
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 686
    Height = 395
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 1
    object RichEditScript: TRichEdit
      Left = 1
      Top = 1
      Width = 684
      Height = 393
      Align = alClient
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -18
      Font.Name = #23435#20307
      Font.Style = []
      MaxLength = 10000000
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
end
