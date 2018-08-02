object FormGenStep: TFormGenStep
  Left = 289
  Top = 46
  Width = 847
  Height = 656
  Caption = #19978#32447#27493#39588#29983#25104
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 241
    Top = 0
    Width = 4
    Height = 596
    Cursor = crHSplit
    Beveled = True
  end
  object Panel2: TPanel
    Left = 0
    Top = 596
    Width = 839
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      839
      33)
    object BitBtn2: TBitBtn
      Left = 467
      Top = 7
      Width = 61
      Height = 20
      Anchors = [akTop, akRight]
      Caption = #29983#25104#27493#39588
      TabOrder = 0
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Left = 532
      Top = 7
      Width = 61
      Height = 20
      Anchors = [akTop, akRight]
      Caption = #22797#21046#27493#39588
      TabOrder = 1
      OnClick = BitBtn3Click
    end
    object StaticText1: TStaticText
      Left = 0
      Top = 0
      Width = 462
      Height = 17
      Caption = #35835#21462#31243#24207#30446#24405#19979#19978#32447#27493#39588#25991#20214'(step_list.xml)'#20869#23481#65292#20379#36873#25321#12290#21487#20197#25163#24037#20462#25913#25991#20214#27169#26495#20869#23481#12290
      TabOrder = 2
    end
    object BitBtn1: TBitBtn
      Left = 597
      Top = 7
      Width = 61
      Height = 20
      Anchors = [akTop, akRight]
      Caption = #20851#38381
      TabOrder = 3
      OnClick = BitBtn1Click
    end
    object Button1: TButton
      Left = 403
      Top = 7
      Width = 61
      Height = 20
      Anchors = [akTop, akRight]
      Caption = #27169#26495#26684#24335
      TabOrder = 4
      OnClick = Button1Click
    end
  end
  object Panel3: TPanel
    Left = 245
    Top = 0
    Width = 594
    Height = 596
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object red1: TRichEdit
      Left = 2
      Top = 2
      Width = 590
      Height = 592
      Align = alClient
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 241
    Height = 596
    Align = alLeft
    Caption = #19978#32447#31243#24207#21015#34920
    TabOrder = 2
    object clbox1: TCheckListBox
      Left = 2
      Top = 15
      Width = 237
      Height = 579
      Align = alClient
      ItemHeight = 13
      TabOrder = 0
    end
  end
  object xmldoc: TXMLDocument
    Left = 224
    Top = 528
    DOMVendorDesc = 'MSXML'
  end
end
