object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'CrazyChat'
  ClientHeight = 344
  ClientWidth = 285
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 195
    Height = 20
    Caption = 'CrazyChat, Seja bem vindo!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 322
    Width = 97
    Height = 13
    Caption = 'by David e Bianca...'
  end
  object JvXPButton1: TJvXPButton
    Left = 8
    Top = 104
    Width = 97
    Height = 32
    Caption = 'Conectar'
    TabOrder = 0
    OnClick = JvXPButton1Click
  end
  object JvXPButton2: TJvXPButton
    Left = 111
    Top = 104
    Width = 98
    Height = 32
    Caption = 'Desconectar'
    TabOrder = 1
    OnClick = JvXPButton2Click
  end
  object Memo1: TMemo
    Left = 8
    Top = 150
    Width = 265
    Height = 126
    TabOrder = 2
  end
  object Edit1: TEdit
    Left = 8
    Top = 63
    Width = 153
    Height = 21
    TabOrder = 3
  end
  object SpinEdit1: TSpinEdit
    Left = 167
    Top = 63
    Width = 106
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 4
    Value = 0
  end
  object Edit2: TEdit
    Left = 8
    Top = 282
    Width = 171
    Height = 21
    TabOrder = 5
    OnKeyPress = Edit2KeyPress
  end
  object JvXPButton3: TJvXPButton
    Left = 185
    Top = 282
    Width = 88
    Height = 34
    Caption = 'Enviar'
    TabOrder = 6
    OnClick = JvXPButton3Click
  end
  object ClientSocket1: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 0
    OnConnect = ClientSocket1Connect
    OnDisconnect = ClientSocket1Disconnect
    OnRead = ClientSocket1Read
    Left = 240
    Top = 104
  end
end
