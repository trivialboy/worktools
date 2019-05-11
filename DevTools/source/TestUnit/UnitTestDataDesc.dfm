object FormTestDataDesc: TFormTestDataDesc
  Left = 405
  Top = 168
  Width = 663
  Height = 545
  Caption = #21464#37327#21450#33050#26412#35828#26126
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 120
  TextHeight = 16
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 653
    Height = 441
    Align = alTop
    Lines.Strings = (
      #19968#12289#20869#32622#21464#37327#35828#26126
      #25163#26426#29992#25143#65306'(users)'
      'vHomeCity, vMsisdn, vUserId, vCustomerId, vImsi, '
      #20114#32852#32593#30005#35270#29992#25143#65306'(itv_users)'
      'vItvAcct, vItvUid, '
      #23485#24102#29992#25143#65306'(broadband_users)'
      'vBroadbandAcct, vBroadbandUid, '
      #20843#38397#35270#39057#29992#25143#65306'(mtv_users)'
      'vMtvAcct, vMtvUid'
      #32479#19968#29992#25143#65306'(user_aggregation)'
      'vAggregationUid'
      ''
      #20108#12289#33050#26412#32534#20889#35828#26126
      #34920#21517':'#20851#38190#23383#27573'1='#20869#37096#21464#37327','#20851#38190#23383#27573'2='#20869#37096#21464#37327
      #33509#26080#20851#38190#23383#27573', '#21017#40664#35748#20026' home_city=vHomeCity,user_id=vUserId'
      ''
      #19977#12289#33050#26412#26679#20363
      '#'#29992#25143#36164#26009
      
        'users:home_city=vHomeCity,user_id=vUserId,msisdn=vMsisdn,imsi=vI' +
        'msi'
      'user_product:home_city=vHomeCity,user_id=vUserId'
      'customer:home_city=vHomeCity,customer_id=vCustomerId'
      'user_services:home_city=vHomeCity,obj_id=vUserId'
      '#'#23485#24102#29992#25143#36164#26009
      'broadband_users:home_city=vHomeCity,user_id=vBroadbandUid'
      '#'#20114#32852#32593#30005#35270#29992#25143#36164#26009
      'itv_users:home_city=vHomeCity,user_id=vItvUid'
      '#'#20843#38397#35270#39057#29992#25143#36164#26009
      'mtv_users:home_city=vHomeCity,user_id=vMtvUid'
      '#'#32479#19968#29992#25143#36164#26009
      'user_aggregation:home_city=vHomeCity,user_id=vAggregationUid'
      'user_aggregation_relation:aggregation_user_id=vAggregationUid')
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 272
    Top = 464
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkClose
  end
end
