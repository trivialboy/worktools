object sfdl_invoke: Tsfdl_invoke
  Left = 223
  Top = 223
  Width = 593
  Height = 247
  Caption = 'sfdl_invoke'
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
    Width = 585
    Height = 215
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 30
      Top = 10
      Width = 43
      Height = 16
      Caption = 'invoke '
    end
    object Label2: TLabel
      Left = 65
      Top = 79
      Width = 45
      Height = 16
      Caption = 'type  =  '
    end
    object Label3: TLabel
      Left = 295
      Top = 79
      Width = 68
      Height = 16
      Hint = 'normal-'#24403#20986#29616#19994#21153#32423#24322#24120#26102#23558#20250#32456#27490#27969#31243','#22238#28378#20107#21153
      Caption = 'exception ='
    end
    object Label4: TLabel
      Left = 46
      Top = 128
      Width = 63
      Height = 16
      Hint = #23545#24212'tp_call'#20989#25968#20013#30340'flags'#21442#25968
      Caption = 'call_flag  ='
    end
    object ed_invoke_id: TEdit
      Left = 118
      Top = 30
      Width = 149
      Height = 24
      TabOrder = 0
    end
    object cb_invoke_type: TComboBox
      Left = 118
      Top = 79
      Width = 149
      Height = 24
      ItemHeight = 16
      ItemIndex = 0
      TabOrder = 1
      Text = 'TE'
      Items.Strings = (
        'TE'
        'TUXEDO'
        'HTTP')
    end
    object cb_invoke_exception: TComboBox
      Left = 374
      Top = 79
      Width = 169
      Height = 24
      ItemHeight = 16
      ItemIndex = 0
      TabOrder = 2
      Text = 'normal'
      Items.Strings = (
        'normal'
        'user'
        'customize')
    end
    object cb_invoke_flag: TComboBox
      Left = 118
      Top = 128
      Width = 149
      Height = 24
      Enabled = False
      ItemHeight = 16
      TabOrder = 3
      Items.Strings = (
        'TPNOTRAN'
        'TPNOCHANGE'
        'TPNOBLOCK')
    end
    object BitBtn1: TBitBtn
      Left = 246
      Top = 167
      Width = 92
      Height = 31
      TabOrder = 4
      Kind = bkOK
    end
    object StaticText1: TStaticText
      Left = 79
      Top = 30
      Width = 28
      Height = 20
      Caption = 'id = '
      TabOrder = 5
    end
    object ed_name: TEdit
      Left = 374
      Top = 30
      Width = 169
      Height = 24
      TabOrder = 6
    end
    object StaticText2: TStaticText
      Left = 315
      Top = 30
      Width = 48
      Height = 20
      Caption = 'name ='
      TabOrder = 7
    end
    object cb_record_accept_detail: TCheckBox
      Left = 305
      Top = 128
      Width = 169
      Height = 21
      Hint = #26159#21542#35760#24405#21463#29702#26126#32454'('#29992#20110#21463#29702#21462#28040')'
      Alignment = taLeftJustify
      BiDiMode = bdLeftToRight
      Caption = 'record_accept_detail'
      ParentBiDiMode = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
    end
  end
end
