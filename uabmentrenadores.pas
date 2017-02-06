unit uabmentrenadores;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, DbCtrls,
  StdCtrls, Buttons;

type

  { TABMentrenadores }

  TABMentrenadores = class(TForm)
    btnCancelar: TBitBtn;
    btnAceptar: TBitBtn;
    dsEntrenadores: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  ABMentrenadores: TABMentrenadores;

implementation

{$R *.lfm}
uses
  dmConexion;

{ TABMentrenadores }

procedure TABMentrenadores.btnAceptarClick(Sender: TObject);
begin
  dsEntrenadores.DataSet.Post;
  try
    begin
      if dsEntrenadores.DataSet.State in dsEditModes then
      begin
        mDatos.tblentrenadores.ApplyUpdates;
      end;
    end;
  except
    on E: EDatabaseError do
    begin
      MessageDlg('Error', 'Ocurrió un error con la base de datos. Mensaje Técnico: ' + E.Message, mtError, [mbOK], 0);
    end;
  end;
  dsEntrenadores.DataSet.Open;
  Close;
end;

procedure TABMentrenadores.btnCancelarClick(Sender: TObject);
begin
  dsEntrenadores.DataSet.Cancel;
  Close;
end;

end.

