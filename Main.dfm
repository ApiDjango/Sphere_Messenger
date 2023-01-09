object MainForm: TMainForm
  Left = 0
  Top = 0
  ClientHeight = 845
  ClientWidth = 1133
  Caption = 'MainForm'
  OnShow = UniFormShow
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object UniPanel1: TUniPanel
    Left = 0
    Top = 0
    Width = 289
    Height = 845
    Hint = ''
    Align = alLeft
    TabOrder = 0
    Caption = ''
    object UniGroupBox2: TUniGroupBox
      Left = 1
      Top = 1
      Width = 287
      Height = 456
      Hint = ''
      Caption = #1043#1088#1091#1087#1087#1099
      Align = alTop
      TabOrder = 1
      object TreeViewGroup: TUniTreeView
        Left = 2
        Top = 15
        Width = 283
        Height = 439
        Hint = ''
        Items.FontData = {0100000000}
        Align = alClient
        TabOrder = 1
        Color = clWindow
        OnClick = TreeViewGroupClick
      end
    end
    object UniGroupBox3: TUniGroupBox
      Left = 1
      Top = 457
      Width = 287
      Height = 387
      Hint = ''
      Caption = #1051#1080#1095#1085#1099#1077' '#1089#1086#1086#1073#1097#1077#1085#1080#1103
      Align = alClient
      TabOrder = 2
    end
  end
  object UniPanel2: TUniPanel
    Left = 289
    Top = 0
    Width = 844
    Height = 845
    Hint = ''
    Align = alClient
    TabOrder = 1
    Caption = ''
    object DBMemoMessenger: TUniDBMemo
      Left = 1
      Top = 1
      Width = 842
      Height = 759
      Hint = ''
      ScrollBars = ssVertical
      Align = alClient
      TabOrder = 1
      ScreenMask.Color = clMenuHighlight
    end
    object UniPanel3: TUniPanel
      Left = 1
      Top = 760
      Width = 842
      Height = 84
      Hint = ''
      Align = alBottom
      TabOrder = 2
      Caption = ''
      object UniGroupBox1: TUniGroupBox
        Left = 1
        Top = 1
        Width = 840
        Height = 82
        Hint = ''
        Caption = #1057#1086#1086#1073#1097#1077#1085#1080#1077
        Align = alClient
        Anchors = [akLeft, akRight, akBottom]
        TabOrder = 1
        object UniMemo1: TUniMemo
          Left = 2
          Top = 15
          Width = 761
          Height = 65
          Hint = ''
          Align = alClient
          TabOrder = 1
        end
        object UniButton1: TUniButton
          Left = 763
          Top = 15
          Width = 75
          Height = 65
          Hint = ''
          Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100
          Align = alRight
          TabOrder = 2
          OnClick = UniButton1Click
        end
      end
    end
  end
  object DSTreeGroup: TpFIBDataSet
    SelectSQL.Strings = (
      'select * from SPHERE_GROUP')
    Transaction = TRead
    Database = UniMainModule.pMainDB
    Left = 144
    Top = 272
    object DSTreeGroupID: TFIBIntegerField
      FieldName = 'ID'
    end
    object DSTreeGroupNAME: TFIBStringField
      FieldName = 'NAME'
      Size = 30
      EmptyStrToNull = True
    end
  end
  object TRead: TpFIBTransaction
    DefaultDatabase = UniMainModule.pMainDB
    Left = 112
    Top = 352
  end
  object DSCTreeGroup: TDataSource
    DataSet = DSTreeGroup
    Left = 160
    Top = 376
  end
  object TimeMessenger: TUniTimer
    ClientEvent.Strings = (
      'function(sender)'
      '{'
      ' '
      '}')
    OnTimer = TimeMessengerTimer
    Left = 577
    Top = 184
  end
  object DSMemo: TpFIBDataSet
    SelectSQL.Strings = (
      
        'select CHR(13) || CHR(10)|| SE.NEW_DATE||'#39': '#39'||u.fullname||'#39'-'#39'||' +
        'CHR(13) || CHR(10)|| SE.sphere_message  as smessage  from SPHERE' +
        '_MESSAGE SE join'
      'username u on u.id=se.user_id where GROUP_ID=:PGROUP_ID')
    Transaction = TRead
    Database = UniMainModule.pMainDB
    Left = 481
    Top = 192
    object DSMemoSMESSAGE: TFIBStringField
      FieldName = 'SMESSAGE'
      Size = 622
      EmptyStrToNull = True
    end
  end
  object TimerTree: TUniTimer
    ClientEvent.Strings = (
      'function(sender)'
      '{'
      ' '
      '}')
    Left = 104
    Top = 112
  end
  object DSCMemo: TDataSource
    DataSet = DSMemo
    Left = 648
    Top = 408
  end
  object QSend: TpFIBQuery
    Transaction = TRW
    Database = UniMainModule.pMainDB
    Left = 755
    Top = 793
    qoAutoCommit = True
    qoStartTransaction = True
  end
  object TRW: TpFIBTransaction
    DefaultDatabase = UniMainModule.pMainDB
    Left = 561
    Top = 784
  end
end
