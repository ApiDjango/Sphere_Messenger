object UniLoginForm1: TUniLoginForm1
  Left = 0
  Top = 0
  ClientHeight = 245
  ClientWidth = 379
  Caption = #1040#1074#1090#1086#1088#1080#1079#1072#1094#1080#1103
  OnShow = UniLoginFormShow
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object UniContainerPanel1: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 379
    Height = 41
    Hint = ''
    ParentColor = False
    Align = alTop
    TabOrder = 0
  end
  object UniContainerPanel2: TUniContainerPanel
    Left = 0
    Top = 82
    Width = 379
    Height = 41
    Hint = ''
    ParentColor = False
    Align = alTop
    TabOrder = 1
    object edlogin: TUniEdit
      Left = 104
      Top = 6
      Width = 217
      Hint = ''
      Text = 'edlogin'
      TabOrder = 1
    end
    object UniLabel1: TUniLabel
      Left = 64
      Top = 6
      Width = 34
      Height = 13
      Hint = ''
      Caption = #1051#1086#1075#1080#1085':'
      TabOrder = 2
    end
  end
  object UniContainerPanel3: TUniContainerPanel
    Left = 0
    Top = 41
    Width = 379
    Height = 41
    Hint = ''
    ParentColor = False
    Align = alTop
    TabOrder = 2
    object UniLabel3: TUniLabel
      Left = 71
      Top = 6
      Width = 27
      Height = 13
      Hint = ''
      Caption = 'IP:DB'
      TabOrder = 1
    end
    object edipdb: TUniEdit
      Left = 104
      Top = 6
      Width = 217
      Hint = ''
      Text = ''
      TabOrder = 2
    end
  end
  object UniContainerPanel4: TUniContainerPanel
    Left = 0
    Top = 123
    Width = 379
    Height = 41
    Hint = ''
    ParentColor = False
    Align = alTop
    TabOrder = 3
    object edpassword: TUniEdit
      Left = 104
      Top = 6
      Width = 217
      Hint = ''
      PasswordChar = '*'
      Text = 'edpassword'
      TabOrder = 1
    end
    object UniLabel2: TUniLabel
      Left = 57
      Top = 6
      Width = 41
      Height = 13
      Hint = ''
      Caption = #1055#1072#1088#1086#1083#1100':'
      TabOrder = 2
    end
  end
  object UniContainerPanel5: TUniContainerPanel
    Left = 0
    Top = 164
    Width = 379
    Height = 41
    Hint = ''
    ParentColor = False
    Align = alTop
    TabOrder = 4
    object UniCheckBox1: TUniCheckBox
      Left = 104
      Top = 6
      Width = 185
      Height = 17
      Hint = ''
      Caption = #1047#1072#1087#1086#1084#1085#1080#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1085#1072' 7 '#1076#1085#1077#1081' !'
      TabOrder = 1
    end
  end
  object UniContainerPanel6: TUniContainerPanel
    Left = 0
    Top = 205
    Width = 379
    Height = 41
    Hint = ''
    ParentColor = False
    Align = alTop
    TabOrder = 5
    object UniButton1: TUniButton
      Left = 286
      Top = 3
      Width = 75
      Height = 25
      Hint = ''
      Caption = 'OK'
      TabOrder = 1
      OnClick = UniButton1Click
    end
    object UniButton2: TUniButton
      Left = 44
      Top = 3
      Width = 75
      Height = 25
      Hint = ''
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 2
    end
  end
  object dsGetRole: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    RROLE,'
      
        '    iif(exists(select 1 from USER_GETORGCODE), 1, 0) as is_membe' +
        'r,'
      '    RCODE'
      'FROM'
      '    USER_GET_ACCESS(null) ')
    Transaction = trOrg
    Database = dbOrg
    Left = 16
    Top = 9
    object dsGetRoleRROLE: TFIBStringField
      FieldName = 'RROLE'
      Size = 60
      EmptyStrToNull = True
    end
    object dsGetRoleIS_MEMBER: TFIBIntegerField
      FieldName = 'IS_MEMBER'
    end
    object dsGetRoleRCODE: TFIBIntegerField
      FieldName = 'RCODE'
    end
  end
  object dbOrg: TpFIBDatabase
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 16
    Top = 56
  end
  object trOrg: TpFIBTransaction
    DefaultDatabase = dbOrg
    Left = 16
    Top = 106
  end
end
