object UniMainModule: TUniMainModule
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Height = 489
  Width = 686
  object pMainDB: TpFIBDatabase
    AutoReconnect = True
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 88
    Top = 64
  end
  object tr: TpFIBTransaction
    DefaultDatabase = pMainDB
    Left = 56
    Top = 120
  end
end
