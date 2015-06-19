object MF: TMF
  Left = 97
  Top = 5
  Width = 1184
  Height = 721
  Anchors = [akTop, akRight]
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
    1168
    683)
  PixelsPerInch = 96
  TextHeight = 13
  object e: TImage
    Left = 0
    Top = 0
    Width = 850
    Height = 680
    Anchors = [akLeft, akTop, akRight, akBottom]
    OnContextPopup = eContextPopup
    OnMouseDown = eMouseDown
    OnMouseMove = eMouseMove
    OnMouseUp = eMouseUp
  end
  object lbl1: TLabel
    Left = 873
    Top = 96
    Width = 39
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Re(Z0)='
  end
  object lbl2: TLabel
    Left = 977
    Top = 96
    Width = 36
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Im(Z0)='
  end
  object lbl3: TLabel
    Left = 873
    Top = 128
    Width = 33
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Re(C)='
  end
  object lbl4: TLabel
    Left = 977
    Top = 128
    Width = 30
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Im(C)='
  end
  object lbl7: TLabel
    Left = 865
    Top = 216
    Width = 69
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'X of left corner'
  end
  object lbl8: TLabel
    Left = 865
    Top = 241
    Width = 69
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Y of left corner'
  end
  object lbl9: TLabel
    Left = 1002
    Top = 216
    Width = 75
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'X of right corner'
  end
  object lbl10: TLabel
    Left = 1002
    Top = 241
    Width = 75
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Y of right corner'
  end
  object lbl5: TLabel
    Left = 873
    Top = 80
    Width = 80
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'use minus to free'
  end
  object lbl6: TLabel
    Left = 873
    Top = 272
    Width = 46
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Iterations:'
  end
  object lbl11: TLabel
    Left = 977
    Top = 272
    Width = 33
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Infinity:'
  end
  object lbl12: TLabel
    Left = 873
    Top = 304
    Width = 24
    Height = 39
    Anchors = [akTop, akRight]
    Caption = 'R'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 39
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lbl13: TLabel
    Left = 897
    Top = 304
    Width = 16
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'min'
  end
  object lbl14: TLabel
    Left = 897
    Top = 320
    Width = 19
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'max'
  end
  object lbl15: TLabel
    Left = 974
    Top = 304
    Width = 24
    Height = 39
    Anchors = [akTop, akRight]
    Caption = 'G'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 39
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lbl16: TLabel
    Left = 997
    Top = 304
    Width = 16
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'min'
  end
  object lbl17: TLabel
    Left = 997
    Top = 320
    Width = 19
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'max'
  end
  object lbl18: TLabel
    Left = 1068
    Top = 304
    Width = 21
    Height = 39
    Anchors = [akTop, akRight]
    Caption = 'B'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 39
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lbl19: TLabel
    Left = 1091
    Top = 304
    Width = 16
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'min'
  end
  object lbl20: TLabel
    Left = 1091
    Top = 320
    Width = 19
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'max'
  end
  object lbl21: TLabel
    Left = 861
    Top = 521
    Width = 242
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Use right click to input coordinates of this point to C'
  end
  object lbl22: TLabel
    Left = 861
    Top = 538
    Width = 252
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'You can select rectangle area by left button of mouse'
  end
  object lbl23: TLabel
    Left = 881
    Top = 401
    Width = 74
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Current location'
  end
  object lbl24: TLabel
    Left = 1092
    Top = 72
    Width = 64
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'n, Power of Z'
  end
  object lbl25: TLabel
    Left = 873
    Top = 160
    Width = 33
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Re(V)='
  end
  object lbl26: TLabel
    Left = 977
    Top = 160
    Width = 30
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Im(V)='
  end
  object lbl27: TLabel
    Left = 1089
    Top = 152
    Width = 66
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'm, Power of V'
  end
  object lbl28: TLabel
    Left = 977
    Top = 80
    Width = 75
    Height = 13
    Anchors = [akTop, akRight]
    Caption = '(Z^n+C^k)*V^m'
  end
  object lbl29: TLabel
    Left = 1093
    Top = 112
    Width = 64
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'k, Power of C'
  end
  object Label1: TLabel
    Left = 863
    Top = 561
    Width = 183
    Height = 13
    Anchors = [akTop, akRight]
    Caption = '(c) '#1050#1086#1085#1089#1090#1072#1085#1090#1080#1085' '#1054#1089#1090#1088#1080#1082#1086#1074', 2010-2014'
  end
  object Bevel: TBevel
    Left = 865
    Top = 296
    Width = 297
    Height = 96
    Anchors = [akTop, akRight]
  end
  object widthlabel: TLabel
    Left = 786
    Top = 80
    Width = 25
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'width'
    Visible = False
  end
  object heightlabel: TLabel
    Left = 786
    Top = 120
    Width = 29
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'height'
    Visible = False
  end
  object multiplylabel: TLabel
    Left = 706
    Top = 104
    Width = 34
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'multiply'
    Visible = False
  end
  object Gauge: TGauge
    Left = 865
    Top = 635
    Width = 145
    Height = 17
    Anchors = [akTop, akRight]
    Progress = 0
    Visible = False
  end
  object SaveBlackLbl: TLabel
    Left = 995
    Top = 499
    Width = 52
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'SaveBlack'
  end
  object qlrLbl: TLabel
    Left = 872
    Top = 121
    Width = 18
    Height = 13
    Anchors = [akTop, akRight]
    Caption = '* qlr'
    Visible = False
  end
  object shLbl: TLabel
    Left = 976
    Top = 121
    Width = 47
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'zoom shift'
    Visible = False
  end
  object Paintb: TButton
    Left = 864
    Top = 0
    Width = 234
    Height = 73
    Anchors = [akTop, akRight]
    Caption = 'Paint'
    TabOrder = 0
    OnClick = PaintbClick
  end
  object e1: TEdit
    Left = 914
    Top = 96
    Width = 49
    Height = 21
    Anchors = [akTop, akRight]
    TabOrder = 1
    Text = '-'
  end
  object e2: TEdit
    Left = 1018
    Top = 96
    Width = 49
    Height = 21
    Anchors = [akTop, akRight]
    TabOrder = 2
    Text = '-'
  end
  object e3: TEdit
    Left = 914
    Top = 128
    Width = 49
    Height = 21
    Anchors = [akTop, akRight]
    TabOrder = 3
    Text = '0,671938'
  end
  object e4: TEdit
    Left = 1018
    Top = 128
    Width = 49
    Height = 21
    Anchors = [akTop, akRight]
    TabOrder = 4
    Text = '1,061935'
  end
  object se1: TSpinEdit
    Left = 922
    Top = 272
    Width = 48
    Height = 22
    Anchors = [akTop, akRight]
    MaxValue = 0
    MinValue = 0
    TabOrder = 7
    Value = 75
  end
  object se7: TSpinEdit
    Left = 922
    Top = 304
    Width = 40
    Height = 22
    Anchors = [akTop, akRight]
    Enabled = False
    MaxValue = 255
    MinValue = 0
    TabOrder = 8
    Value = 0
  end
  object se8: TSpinEdit
    Left = 922
    Top = 320
    Width = 40
    Height = 22
    Anchors = [akTop, akRight]
    Enabled = False
    MaxValue = 255
    MinValue = 0
    TabOrder = 9
    Value = 30
  end
  object se9: TSpinEdit
    Left = 1022
    Top = 304
    Width = 40
    Height = 22
    Anchors = [akTop, akRight]
    Enabled = False
    MaxValue = 255
    MinValue = 0
    TabOrder = 10
    Value = 80
  end
  object se10: TSpinEdit
    Left = 1022
    Top = 320
    Width = 40
    Height = 22
    Anchors = [akTop, akRight]
    Enabled = False
    MaxValue = 255
    MinValue = 0
    TabOrder = 11
    Value = 255
  end
  object se11: TSpinEdit
    Left = 1110
    Top = 304
    Width = 41
    Height = 22
    Anchors = [akTop, akRight]
    Enabled = False
    MaxValue = 255
    MinValue = 0
    TabOrder = 12
    Value = 70
  end
  object se12: TSpinEdit
    Left = 1110
    Top = 320
    Width = 41
    Height = 22
    Anchors = [akTop, akRight]
    Enabled = False
    MaxValue = 255
    MinValue = 0
    TabOrder = 13
    Value = 100
  end
  object chk1: TCheckBox
    Left = 873
    Top = 345
    Width = 164
    Height = 16
    Anchors = [akTop, akRight]
    Caption = 'Random system of color'
    Checked = True
    State = cbChecked
    TabOrder = 14
    OnClick = chk1Click
  end
  object edt1: TEdit
    Left = 937
    Top = 216
    Width = 58
    Height = 21
    Anchors = [akTop, akRight]
    TabOrder = 15
    Text = '-2'
  end
  object edt2: TEdit
    Left = 937
    Top = 241
    Width = 58
    Height = 21
    Anchors = [akTop, akRight]
    TabOrder = 16
    Text = '2'
  end
  object edt3: TEdit
    Left = 1099
    Top = 216
    Width = 58
    Height = 21
    Anchors = [akTop, akRight]
    TabOrder = 17
    Text = '2'
  end
  object edt4: TEdit
    Left = 1099
    Top = 241
    Width = 58
    Height = 21
    Anchors = [akTop, akRight]
    TabOrder = 18
    Text = '-2'
  end
  object edt5: TPanel
    Left = 873
    Top = 417
    Width = 122
    Height = 21
    Anchors = [akTop, akRight]
    TabOrder = 19
  end
  object edt6: TPanel
    Left = 873
    Top = 441
    Width = 122
    Height = 21
    Anchors = [akTop, akRight]
    TabOrder = 20
  end
  object se2: TEdit
    Left = 1009
    Top = 272
    Width = 49
    Height = 21
    Anchors = [akTop, akRight]
    TabOrder = 21
    Text = '2'
  end
  object chk2: TCheckBox
    Left = 1049
    Top = 342
    Width = 97
    Height = 17
    Anchors = [akTop, akRight]
    Caption = 'Crazy paint'
    TabOrder = 22
  end
  object cbb1: TComboBoxEx
    Left = 1065
    Top = 272
    Width = 91
    Height = 22
    ItemsEx = <
      item
        Caption = '|z|'
      end
      item
        Caption = '|x|'
      end
      item
        Caption = '|y|'
      end
      item
        Caption = '|Min(x,y)|'
      end
      item
        Caption = '|Max(x,y)|'
      end
      item
        Caption = '|x|+|y|'
      end
      item
        Caption = '||x|-|y||'
      end
      item
        Caption = '|x+y|'
      end
      item
        Caption = '|x-y|'
      end
      item
        Caption = '|x*y|'
      end
      item
        Caption = '|||x+y|-|x||-|x-y||'
      end
      item
        Caption = '||x+y|/2+|x-y|/2|+|x|+|y|'
      end>
    Anchors = [akTop, akRight]
    ItemHeight = 16
    TabOrder = 23
    Text = '||x|-|y||'
    DropDownCount = 8
  end
  object se3: TSpinEdit
    Left = 1099
    Top = 88
    Width = 49
    Height = 22
    Anchors = [akTop, akRight]
    MaxValue = 0
    MinValue = 0
    TabOrder = 24
    Value = -3
    OnChange = se3Change
  end
  object e7: TEdit
    Left = 914
    Top = 160
    Width = 49
    Height = 21
    Anchors = [akTop, akRight]
    TabOrder = 5
    Text = '-'
  end
  object e8: TEdit
    Left = 1018
    Top = 160
    Width = 49
    Height = 21
    Anchors = [akTop, akRight]
    TabOrder = 6
    Text = '-'
  end
  object se4: TSpinEdit
    Left = 1099
    Top = 168
    Width = 49
    Height = 22
    Anchors = [akTop, akRight]
    MaxValue = 0
    MinValue = 0
    TabOrder = 26
    Value = -1
    OnChange = se4Change
  end
  object se5: TSpinEdit
    Left = 1099
    Top = 128
    Width = 49
    Height = 22
    Anchors = [akTop, akRight]
    MaxValue = 0
    MinValue = 0
    TabOrder = 25
    Value = 1
    OnChange = se3Change
  end
  object Exponent: TCheckBox
    Left = 881
    Top = 192
    Width = 121
    Height = 17
    Anchors = [akTop, akRight]
    Caption = '(e^Z^n+C^k)*V^m'
    TabOrder = 27
  end
  object BitBtn1: TBitBtn
    Left = 1065
    Top = 587
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Next iter'
    TabOrder = 28
    OnClick = BitBtn1Click
  end
  object Panel1: TPanel
    Left = 1041
    Top = 612
    Width = 122
    Height = 21
    Anchors = [akTop, akRight]
    TabOrder = 29
  end
  object Panel2: TPanel
    Left = 1041
    Top = 636
    Width = 122
    Height = 21
    Anchors = [akTop, akRight]
    TabOrder = 30
  end
  object BitBtn2: TBitBtn
    Left = 865
    Top = 603
    Width = 65
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Mandelbrot'
    TabOrder = 31
    OnClick = BitBtn2Click
  end
  object edt7: TPanel
    Left = 873
    Top = 465
    Width = 122
    Height = 20
    Anchors = [akTop, akRight]
    TabOrder = 32
  end
  object nfracbtn: TPanel
    Left = 1145
    Top = 88
    Width = 17
    Height = 20
    Anchors = [akTop, akRight]
    Caption = '.'
    TabOrder = 33
    OnClick = nfracbtnClick
  end
  object kfracbtn: TPanel
    Left = 1143
    Top = 128
    Width = 17
    Height = 20
    Anchors = [akTop, akRight]
    Caption = '.'
    TabOrder = 34
    OnClick = kfracbtnClick
  end
  object mfracbtn: TPanel
    Left = 1143
    Top = 168
    Width = 17
    Height = 21
    Anchors = [akTop, akRight]
    Caption = '.'
    TabOrder = 35
    OnClick = mfracbtnClick
  end
  object nfracedt: TEdit
    Left = 1097
    Top = 88
    Width = 49
    Height = 21
    Anchors = [akTop, akRight]
    TabOrder = 36
    Visible = False
  end
  object kfracedt: TEdit
    Left = 1097
    Top = 128
    Width = 49
    Height = 21
    Anchors = [akTop, akRight]
    TabOrder = 37
    Visible = False
  end
  object mfracedt: TEdit
    Left = 1097
    Top = 168
    Width = 49
    Height = 21
    Anchors = [akTop, akRight]
    TabOrder = 38
    Visible = False
  end
  object SearchSpEd: TSpinEdit
    Left = 952
    Top = 488
    Width = 41
    Height = 22
    Anchors = [akTop, akRight]
    MaxValue = 255
    MinValue = 0
    TabOrder = 39
    Value = 3
  end
  object SearchBtn: TPanel
    Left = 868
    Top = 488
    Width = 80
    Height = 24
    Anchors = [akTop, akRight]
    Caption = 'Search'
    ParentShowHint = False
    ShowHint = False
    TabOrder = 40
    OnClick = SearchBtnClick
  end
  object Stochastic_label: TStaticText
    Left = 1009
    Top = 401
    Width = 83
    Height = 17
    Anchors = [akTop, akRight]
    Caption = 'Stochastic eps ='
    TabOrder = 41
  end
  object stochastic_edt: TEdit
    Left = 1099
    Top = 401
    Width = 58
    Height = 21
    Anchors = [akTop, akRight]
    TabOrder = 42
    Text = '0'
  end
  object SaveBtn: TBitBtn
    Left = 1104
    Top = 0
    Width = 56
    Height = 18
    Anchors = [akTop, akRight]
    Caption = 'Save'
    TabOrder = 43
    OnClick = SaveBtnClick
  end
  object chk1a: TCheckBox
    Left = 873
    Top = 360
    Width = 130
    Height = 17
    Anchors = [akTop, akRight]
    Caption = 'fix it!'
    Checked = True
    State = cbChecked
    TabOrder = 44
  end
  object ImportBtn: TBitBtn
    Left = 1104
    Top = 18
    Width = 56
    Height = 19
    Anchors = [akTop, akRight]
    Caption = 'Import'
    TabOrder = 45
    OnClick = ImportBtnClick
  end
  object chtofile: TCheckBox
    Left = 1101
    Top = 56
    Width = 48
    Height = 16
    Anchors = [akTop, akRight]
    Caption = 'to file'
    TabOrder = 46
    OnClick = chtofileClick
  end
  object width_spn: TSpinEdit
    Left = 786
    Top = 96
    Width = 58
    Height = 22
    Anchors = [akTop, akRight]
    MaxValue = 0
    MinValue = 0
    TabOrder = 47
    Value = 850
    Visible = False
  end
  object height_spn: TSpinEdit
    Left = 786
    Top = 137
    Width = 58
    Height = 22
    Anchors = [akTop, akRight]
    MaxValue = 0
    MinValue = 0
    TabOrder = 48
    Value = 680
    Visible = False
  end
  object multiply_spn: TSpinEdit
    Left = 706
    Top = 120
    Width = 57
    Height = 22
    Anchors = [akTop, akRight]
    MaxValue = 10000
    MinValue = 1
    TabOrder = 49
    Value = 1
    Visible = False
    OnChange = multiply_spnChange
  end
  object RofBlack_spn: TSpinEdit
    Left = 905
    Top = 304
    Width = 49
    Height = 22
    Anchors = [akTop, akRight]
    MaxValue = 255
    MinValue = 0
    TabOrder = 50
    Value = 255
    Visible = False
  end
  object GofBlack_spn: TSpinEdit
    Left = 1005
    Top = 304
    Width = 49
    Height = 22
    Anchors = [akTop, akRight]
    MaxValue = 255
    MinValue = 0
    TabOrder = 51
    Value = 255
    Visible = False
  end
  object BofBlack_spn: TSpinEdit
    Left = 1097
    Top = 304
    Width = 49
    Height = 22
    Anchors = [akTop, akRight]
    MaxValue = 255
    MinValue = 0
    TabOrder = 52
    Value = 203
    Visible = False
  end
  object Blackbtn: TPanel
    Left = 929
    Top = 360
    Width = 81
    Height = 17
    Anchors = [akTop, akRight]
    Caption = 'Black to sth'
    TabOrder = 53
    OnClick = BlackbtnClick
  end
  object NotPaintBtn: TPanel
    Left = 1049
    Top = 450
    Width = 113
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Add Not Paint Area'
    TabOrder = 54
    OnClick = NotPaintBtnClick
  end
  object ResetNotPaintBtn: TPanel
    Left = 1049
    Top = 473
    Width = 113
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Reset Not Paint Area'
    TabOrder = 55
    OnClick = ResetNotPaintBtnClick
  end
  object StopBtn: TBitBtn
    Left = 945
    Top = 603
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'PAUSE'
    TabOrder = 56
    OnClick = StopBtnClick
  end
  object ShowNPAChk: TCheckBox
    Left = 1073
    Top = 499
    Width = 90
    Height = 16
    Anchors = [akTop, akRight]
    Caption = 'Show NPA'#39's'
    TabOrder = 57
  end
  object totlcrzxhk: TCheckBox
    Left = 1049
    Top = 358
    Width = 97
    Height = 17
    Anchors = [akTop, akRight]
    Caption = 'Totally crazy'
    TabOrder = 58
  end
  object SymBtn: TBitBtn
    Left = 1001
    Top = 192
    Width = 56
    Height = 17
    Anchors = [akTop, akRight]
    Caption = 'Symmetry'
    TabOrder = 59
    OnClick = SymBtnClick
  end
  object NaturBtn: TBitBtn
    Left = 698
    Top = 156
    Width = 79
    Height = 27
    Anchors = [akTop, akRight]
    Caption = 'Natural Size'
    TabOrder = 60
    Visible = False
    OnClick = NaturBtnClick
  end
  object AcceptBtn: TBitBtn
    Left = 768
    Top = 191
    Width = 79
    Height = 27
    Anchors = [akTop, akRight]
    Caption = 'Accept'
    TabOrder = 61
    Visible = False
    OnClick = AcceptBtnClick
  end
  object SmoothBtn: TBitBtn
    Left = 1061
    Top = 192
    Width = 63
    Height = 17
    Anchors = [akTop, akRight]
    Caption = 'Brd|Sm|x2'
    TabOrder = 62
    OnClick = SmoothBtnClick
  end
  object LoadBtn: TBitBtn
    Left = 1104
    Top = 37
    Width = 56
    Height = 18
    Anchors = [akTop, akRight]
    Caption = 'Load'
    TabOrder = 63
    OnClick = LoadBtnClick
  end
  object MultiplBorderBtn: TBitBtn
    Left = 1002
    Top = 416
    Width = 35
    Height = 18
    Anchors = [akTop, akRight]
    Caption = 'BORD'
    TabOrder = 64
    OnClick = MultiplBorderBtnClick
  end
  object Smoothchx: TCheckBox
    Left = 1123
    Top = 192
    Width = 18
    Height = 18
    Anchors = [akTop, akRight]
    Checked = True
    State = cbChecked
    TabOrder = 65
  end
  object TwoStripesChx: TCheckBox
    Left = 1140
    Top = 192
    Width = 19
    Height = 18
    Anchors = [akTop, akRight]
    TabOrder = 66
  end
  object SaveBlackChx: TCheckBox
    Left = 1054
    Top = 499
    Width = 18
    Height = 16
    Anchors = [akTop, akRight]
    TabOrder = 67
  end
  object SOVBtn: TBitBtn
    Left = 1002
    Top = 433
    Width = 35
    Height = 27
    Anchors = [akTop, akRight]
    Caption = 'SOV'
    TabOrder = 68
    OnClick = SOVBtnClick
  end
  object binarfunctioncbb: TComboBox
    Left = 872
    Top = 78
    Width = 113
    Height = 21
    Anchors = [akTop, akRight]
    ItemHeight = 13
    TabOrder = 69
    Text = 'and'
    Visible = False
    Items.Strings = (
      'and'
      'or'
      'xor'
      'x|y'
      'x'#166'y'
      'x=y'
      'x<=y'
      'x>=y'
      'x>y'
      'x<y')
  end
  object qlrspn: TSpinEdit
    Left = 872
    Top = 139
    Width = 105
    Height = 22
    Anchors = [akTop, akRight]
    MaxValue = 0
    MinValue = 0
    TabOrder = 70
    Value = 0
    Visible = False
  end
  object shspn: TSpinEdit
    Left = 984
    Top = 139
    Width = 45
    Height = 22
    Anchors = [akTop, akRight]
    MaxValue = 0
    MinValue = 0
    TabOrder = 71
    Value = 0
    Visible = False
  end
  object onlyblackChx: TCheckBox
    Left = 863
    Top = 173
    Width = 105
    Height = 19
    Anchors = [akTop, akRight]
    Caption = 'use sys of clrs'
    TabOrder = 72
    Visible = False
  end
  object Transformchx: TCheckBox
    Left = 863
    Top = 581
    Width = 96
    Height = 18
    Anchors = [akTop, akRight]
    Caption = 'Transform'
    TabOrder = 73
  end
  object ZoomScroll: TScrollBar
    Left = 861
    Top = 288
    Width = 13
    Height = 100
    Anchors = [akTop, akRight]
    Kind = sbVertical
    PageSize = 0
    Position = 50
    TabOrder = 74
    OnChange = ZoomScrollChange
  end
  object CancelScroll: TButton
    Left = 861
    Top = 387
    Width = 18
    Height = 19
    Anchors = [akTop, akRight]
    Caption = 'x'
    TabOrder = 75
    OnClick = CancelScrollClick
  end
  object NotBlackChx: TCheckBox
    Left = 1049
    Top = 373
    Width = 105
    Height = 18
    Anchors = [akTop, akRight]
    Caption = 'Not Black'
    TabOrder = 76
  end
  object Floatxorchx: TCheckBox
    Left = 976
    Top = 173
    Width = 96
    Height = 19
    Anchors = [akTop, akRight]
    Caption = 'Float xoring'
    Checked = True
    State = cbChecked
    TabOrder = 77
    Visible = False
  end
  object Japanchx: TCheckBox
    Left = 950
    Top = 581
    Width = 61
    Height = 18
    Anchors = [akTop, akRight]
    Caption = 'Japan'
    TabOrder = 78
  end
  object CardioidBtn: TBitBtn
    Left = 1065
    Top = 561
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Cardioid ->'
    TabOrder = 79
    OnClick = CardioidBtnClick
  end
  object Answer: TBitBtn
    Left = 997
    Top = 472
    Width = 44
    Height = 19
    Anchors = [akTop, akRight]
    Caption = 'Answer'
    TabOrder = 80
    OnClick = AnswerClick
  end
  object RandomQBtn: TBitBtn
    Left = 857
    Top = 152
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'gen rnd qlr'
    TabOrder = 81
    Visible = False
    OnClick = RandomQBtnClick
  end
  object NormalizeChx: TCheckBox
    Left = 1024
    Top = 144
    Width = 81
    Height = 17
    Caption = 'Normalize'
    Checked = True
    State = cbChecked
    TabOrder = 82
    Visible = False
  end
  object OvernormalizeChx: TCheckBox
    Left = 1024
    Top = 160
    Width = 89
    Height = 17
    Caption = 'Overnormalize'
    Checked = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    State = cbChecked
    TabOrder = 83
    Visible = False
  end
  object ScrollBar1: TScrollBar
    Left = 1145
    Top = 520
    Width = 16
    Height = 105
    Anchors = [akTop, akRight]
    Kind = sbVertical
    Max = 10
    PageSize = 0
    TabOrder = 84
  end
  object inversechx: TCheckBox
    Left = 1054
    Top = 424
    Width = 41
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'inv'
    TabOrder = 85
  end
  object invedt: TEdit
    Left = 1099
    Top = 425
    Width = 58
    Height = 21
    Anchors = [akTop, akRight]
    TabOrder = 86
    Text = '0'
  end
  object OpenDial: TOpenDialog
    Left = 808
  end
end
