program CrazyChat;

uses
  Forms,
  ChatServer in 'ChatServer.pas' {Form1},
  ChatCliente in 'ChatCliente.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
