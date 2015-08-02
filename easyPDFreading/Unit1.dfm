object Form1: TForm1
  Left = 532
  Top = 263
  Width = 222
  Height = 90
  Caption = 'SumatraPrize'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Startbtn: TButton
    Left = 56
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 0
    OnClick = StartbtnClick
  end
  object Tmr: TTimer
    Enabled = False
    OnTimer = TmrTimer
    Left = 176
    Top = 16
  end
end
