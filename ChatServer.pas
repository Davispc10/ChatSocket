unit ChatServer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, JvExControls, JvXPCore, JvXPButtons, ScktComp, Mask,
  JvExMask, JvSpin, Spin, Sockets;

type
  TForm1 = class(TForm)
    ServerSocket1: TServerSocket;
    JvXPButton2: TJvXPButton;
    Label1: TLabel;
    Label2: TLabel;
    JvXPButton1: TJvXPButton;
    SpinEdit1: TSpinEdit;
    memo2: TMemo;
    memo1: TMemo;
    Label3: TLabel;
    procedure JvXPButton1Click(Sender: TObject);
    procedure ServerSocket1ClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket1ClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure JvXPButton2Click(Sender: TObject);
    procedure ServerSocket1ClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  user : Integer;

implementation

{$R *.dfm}

procedure TForm1.JvXPButton1Click(Sender: TObject);
begin
  if SpinEdit1.Value <> 0 then
  begin
    ServerSocket1.Port := SpinEdit1.Value;
    ServerSocket1.Active := true;
    Memo1.Lines.Add('Server iniciado, vamo bater papo!');
  end
  else
    ShowMessage('Porta inválida!');
end;

procedure TForm1.JvXPButton2Click(Sender: TObject);
begin
  ServerSocket1.Active := false;
  Memo1.Lines.Add('Acabou a brincadeira, o servidor parou!');
end;

procedure TForm1.ServerSocket1ClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  Memo1.Lines.Add('Cliente conectado: ' + Socket.RemoteAddress + ':' + IntToStr(Socket.RemotePort));
  user := user + 1;
  Label3.Caption := 'Users: ' + IntToStr(user);
end;

procedure TForm1.ServerSocket1ClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  Memo1.Lines.Add('Cliente desconectado: ' + Socket.RemoteAddress + ':' + IntToStr(Socket.RemotePort));
  user := user - 1;
  Label3.Caption := 'Users: ' + IntToStr(user);
end;

procedure TForm1.ServerSocket1ClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
var
  i : integer;
  mensagem : AnsiString;
begin
  mensagem := Socket.ReceiveText;

  memo2.Lines.Add(mensagem);
  for i := 0 to ServerSocket1.Socket.ActiveConnections - 1 do
    ServerSocket1.Socket.Connections[i].SendText(mensagem);
end;

end.
