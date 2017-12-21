unit ChatCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, JvExMask, JvSpin, JvExControls, JvXPCore, JvXPButtons,
  ScktComp, Spin;

type
  TForm2 = class(TForm)
    JvXPButton1: TJvXPButton;
    JvXPButton2: TJvXPButton;
    Memo1: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    ClientSocket1: TClientSocket;
    SpinEdit1: TSpinEdit;
    Edit2: TEdit;
    JvXPButton3: TJvXPButton;
    Label3: TLabel;
    Label4: TLabel;
    procedure JvXPButton1Click(Sender: TObject);
    procedure ClientSocket1Connect(Sender: TObject; Socket: TCustomWinSocket);
    procedure ClientSocket1Disconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure JvXPButton2Click(Sender: TObject);
    procedure JvXPButton3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);  
    
  private
    { Private declarations }
  public
    nome : String;
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.ClientSocket1Connect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  Memo1.Lines.Add('Conectado!!!');
end;

procedure TForm2.ClientSocket1Disconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  Memo1.Lines.Add('Desconectado!!!');
end;

procedure TForm2.ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
begin
  Memo1.Lines.Add(Socket.ReceiveText);
end;
 
procedure TForm2.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    if (ClientSocket1.Active) and (Trim(Edit2.Text) <> '') then
    begin
      ClientSocket1.Socket.SendText(nome + ': ' + Edit2.Text);
      Edit2.Text := '';
    end
    else
      ShowMessage('Nada digitado...');
  end;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
  repeat
    nome := inputbox('CrazyChat', 'Insira seu nome', '');
  until nome <> '';

  Label1.Caption := 'Seja bem vindo ' + nome;
end;

procedure TForm2.JvXPButton1Click(Sender: TObject);
begin
  if (Trim(Edit1.Text) <> '') and (SpinEdit1.Value <> 0) then
  begin
    ClientSocket1.Address := Edit1.Text;
    ClientSocket1.Port := SpinEdit1.Value;
    ClientSocket1.Active := true;
  end
  else
    ShowMessage('Campo de endereço e/ou porta vazios');
end;

procedure TForm2.JvXPButton2Click(Sender: TObject);
begin
  ClientSocket1.Active := false;
end;

procedure TForm2.JvXPButton3Click(Sender: TObject);
begin
  if (ClientSocket1.Active) and (Trim(Edit2.Text) <> '') then
  begin
    ClientSocket1.Socket.SendText(nome + ': ' + Edit2.Text);
    Edit2.Text := '';
  end
  else
    ShowMessage('Não conectado!');
end;

end.
