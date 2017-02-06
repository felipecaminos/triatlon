unit uabmtutores;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  DbCtrls, Buttons;

type

  { TABMtutores }

  TABMtutores = class(TForm)
    btnCancelar: TBitBtn;
    btnAceptar: TBitBtn;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit9: TDBEdit;
    dsTutores: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  ABMtutores: TABMtutores;

implementation

{$R *.lfm}
uses
  dmConexion;

{ TABMtutores }

procedure TABMtutores.btnAceptarClick(Sender: TObject);
begin
  dsTutores.DataSet.Post;
  try
    begin
      if dsTutores.DataSet.State in dsEditModes then
      begin
        mDatos.tblTutores.ApplyUpdates;
      end;
    end;
  except
    on E: EDatabaseError do
    begin
      MessageDlg('Error', 'Ocurrió un error con la base de datos. Mensaje Técnico: ' + E.Message, mtError, [mbOK], 0);
    end;
  end;
  dsTutores.DataSet.Open;
  Close;
end;

procedure TABMtutores.btnCancelarClick(Sender: TObject);
begin
  dsTutores.DataSet.Cancel;
  Close;
end;

end.

