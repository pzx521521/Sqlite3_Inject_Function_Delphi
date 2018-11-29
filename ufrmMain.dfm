object FrmMian: TFrmMian
  Left = 0
  Top = 0
  Caption = 'FrmMian'
  ClientHeight = 400
  ClientWidth = 882
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 80
    Top = 128
    Width = 553
    Height = 25
    Caption = #27979#35797#19968#20010#25509#21463#20989#25968
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 80
    Top = 248
    Width = 553
    Height = 25
    Caption = #27979#35797#20004#20010#25509#21463#20989#25968
    TabOrder = 3
    OnClick = Button2Click
  end
  object Memo1: TMemo
    Left = 80
    Top = 48
    Width = 553
    Height = 74
    Lines.Strings = (
      'UPDATE table1 SET c= testone(a||b)')
    TabOrder = 0
  end
  object Memo2: TMemo
    Left = 80
    Top = 168
    Width = 553
    Height = 74
    Lines.Strings = (
      'UPDATE table1 SET c= testtwo(a, b)')
    TabOrder = 2
  end
end
