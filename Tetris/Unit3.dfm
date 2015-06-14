object MF: TMF
  Left = 535
  Top = 139
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Restris'
  ClientHeight = 480
  ClientWidth = 380
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  OnKeyDown = FormKeyDown
  OnPaint = FormPaint
  DesignSize = (
    380
    480)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 460
    Width = 377
    Height = 17
    Anchors = [akLeft, akRight, akBottom]
    Caption = 'Score: 0'
    TabOrder = 0
  end
  object Button1: TButton
    Left = 16
    Top = 198
    Width = 345
    Height = 41
    Caption = 'YOU LOSE! But game isn'#39't over'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -33
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    TabStop = False
    Visible = False
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 99
    Top = 215
    Width = 184
    Height = 32
    Caption = 'Paused'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 29
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    TabStop = False
    Visible = False
    OnClick = Button2Click
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Top = 432
  end
end
