unit uabmfederaciones;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, DbCtrls,
  StdCtrls, Buttons;

type

  { TABMfederaciones }

  TABMfederaciones = class(TForm)
    btnCancelar: TBitBtn;
    btnAceptar: TBitBtn;
    dsFederaciones: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  ABMfederaciones: TABMfederaciones;

implementation

{$R *.lfm}
uses
  dmConexion;

procedure TABMfederaciones.btnAceptarClick(Sender: TObject);
begin
  dsFederaciones.DataSet.Post;
  try
    begin
      if dsFederaciones.DataSet.State in dsEditModes then
      begin
        mDatos.tblFederaciones.ApplyUpdates;
      end;
    end;
  except
    on E: EDatabaseError do
    begin
      MessageDlg('Error', 'Ocurrió un error con la base de datos. Mensaje Técnico: ' + E.Message, mtError, [mbOK], 0);
    end;
  end;
  dsFederaciones.DataSet.Open;
  Close;
end;

procedure TABMfederaciones.btnCancelarClick(Sender: TObject);
begin
  dsFederaciones.DataSet.Cancel;
  Close;
end;

end.

