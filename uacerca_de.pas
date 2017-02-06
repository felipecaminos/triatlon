unit uacerca_de;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Buttons;

type

  { TfmAcercaDe }

  TfmAcercaDe = class(TForm)
    BitBtn1: TBitBtn;
    GroupBox1: TGroupBox;
    Mensaje: TMemo;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private

  public

  end;

var
  fmAcercaDe: TfmAcercaDe;

implementation

{$R *.lfm}

{ TfmAcercaDe }

procedure TfmAcercaDe.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
     CloseAction:= caFree;
end;

end.

