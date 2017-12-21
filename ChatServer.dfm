object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'CrazyChat'
  ClientHeight = 340
  ClientWidth = 589
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 191
    Top = 8
    Width = 158
    Height = 20
    Caption = 'Servidor do CrazyChat'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 310
    Width = 97
    Height = 13
    Caption = 'by David e Bianca...'
  end
  object Label3: TLabel
    Left = 522
    Top = 23
    Width = 54
    Height = 13
    Caption = 'Usu'#225'rios: 0'
  end
  object memo1: TMemo
    Left = 118
    Top = 42
    Width = 226
    Height = 281
    TabOrder = 0
  end
  object JvXPButton2: TJvXPButton
    Left = 8
    Top = 107
    Width = 104
    Height = 28
    Caption = 'Parar'
    TabOrder = 1
    OnClick = JvXPButton2Click
  end
  object JvXPButton1: TJvXPButton
    Left = 8
    Top = 70
    Width = 104
    Height = 31
    Caption = 'Iniciar'
    TabOrder = 2
    OnClick = JvXPButton1Click
  end
  object SpinEdit1: TSpinEdit
    Left = 8
    Top = 42
    Width = 104
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 3
    Value = 0
  end
  object memo2: TMemo
    Left = 350
    Top = 42
    Width = 226
    Height = 281
    TabOrder = 4
  end
  object ServerSocket1: TServerSocket
    Active = False
    Port = 0
    ServerType = stNonBlocking
    OnClientConnect = ServerSocket1ClientConnect
    OnClientDisconnect = ServerSocket1ClientDisconnect
    OnClientRead = ServerSocket1ClientRead
    Left = 8
    Top = 280
  end
end
