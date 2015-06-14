object MF: TMF
  Left = 278
  Top = 130
  Width = 830
  Height = 605
  Caption = 'Fractals'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    822
    578)
  PixelsPerInch = 96
  TextHeight = 12
  object im: TImage
    Left = 104
    Top = 7
    Width = 715
    Height = 571
    Anchors = [akLeft, akTop, akRight, akBottom]
    OnContextPopup = imContextPopup
    OnMouseDown = imMouseDown
    OnMouseMove = imMouseMove
    OnMouseUp = imMouseUp
  end
  object Button1: TButton
    Left = 3
    Top = 211
    Width = 91
    Height = 23
    Caption = 'von Koch'
    TabOrder = 2
    OnClick = Button1Click
  end
  object edt1: TEdit
    Left = 20
    Top = 109
    Width = 67
    Height = 20
    TabOrder = 0
    Text = '3'
  end
  object edt2: TEdit
    Left = 20
    Top = 131
    Width = 67
    Height = 20
    TabOrder = 1
    Text = '3'
  end
  object btn1: TButton
    Left = 4
    Top = 183
    Width = 69
    Height = 23
    Hint = 'use right click to make a segment'
    HelpType = htKeyword
    Caption = 'Reset'
    TabOrder = 3
    OnClick = btn1Click
    OnContextPopup = btn1ContextPopup
  end
  object BitBtn1: TBitBtn
    Left = 5
    Top = 236
    Width = 89
    Height = 25
    Caption = 'Dragon (unodd)'
    TabOrder = 4
    OnClick = BitBtn1Click
  end
  object oddchx: TCheckBox
    Left = 26
    Top = 156
    Width = 65
    Height = 17
    Caption = 'odd'
    TabOrder = 5
    OnClick = oddchxClick
  end
  object Button2: TButton
    Left = 8
    Top = 264
    Width = 89
    Height = 25
    Caption = '3toop'
    TabOrder = 6
    OnClick = Button2Click
  end
  object ClosureBtn: TBitBtn
    Left = 0
    Top = 72
    Width = 65
    Height = 25
    Caption = 'Closure'
    TabOrder = 7
    OnClick = ClosureBtnClick
  end
  object SaveBtn: TBitBtn
    Left = 8
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Save'
    TabOrder = 8
    OnClick = SaveBtnClick
  end
  object degsn: TSpinEdit
    Left = 68
    Top = 72
    Width = 35
    Height = 21
    MaxLength = 1
    MaxValue = 8
    MinValue = 1
    TabOrder = 9
    Value = 8
  end
  object ClrEdt: TLabeledEdit
    Left = 8
    Top = 360
    Width = 89
    Height = 20
    EditLabel.Width = 26
    EditLabel.Height = 12
    EditLabel.Caption = 'Color'
    TabOrder = 10
    Text = '-'
  end
  object ClearBtn: TBitBtn
    Left = 76
    Top = 183
    Width = 23
    Height = 23
    Caption = 'Clear'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
    TabOrder = 11
    OnClick = ClearBtnClick
  end
  object Panel1: TPanel
    Left = 8
    Top = 392
    Width = 89
    Height = 17
    TabOrder = 12
  end
  object Panel2: TPanel
    Left = 8
    Top = 416
    Width = 89
    Height = 17
    TabOrder = 13
  end
  object NotEraseChx: TCheckBox
    Left = 8
    Top = 456
    Width = 81
    Height = 17
    Caption = 'NotErase'
    TabOrder = 14
    OnClick = NotEraseChxClick
  end
  object DownBtn: TBitBtn
    Left = 16
    Top = 488
    Width = 75
    Height = 25
    Caption = 'Down!'
    TabOrder = 15
    OnClick = DownBtnClick
  end
  object musbtn: TBitBtn
    Left = 8
    Top = 520
    Width = 75
    Height = 25
    Caption = 'mus'
    TabOrder = 16
    OnClick = musbtnClick
  end
  object gldnbtn: TBitBtn
    Left = 8
    Top = 296
    Width = 89
    Height = 25
    Caption = 'UNWRITTENgoldn'
    TabOrder = 17
    OnClick = gldnbtnClick
  end
  object qbtn: TBitBtn
    Left = 8
    Top = 552
    Width = 75
    Height = 25
    Caption = 'q'
    TabOrder = 18
    OnClick = qbtnClick
  end
end
