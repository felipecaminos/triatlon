unit uabmcategorias;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, FileUtil, Forms, Controls, Graphics, Dialogs, DBCtrls,
  StdCtrls, Calendar, EditBtn, Buttons, DBExtCtrls;

type

  { TABMcategorias }

  TABMcategorias = class(TForm)
    btnAceptar: TBitBtn;
    btnCancel: TBitBtn;
    DBDateEdit1: TDBDateEdit;
    dsCategorias: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure btnAceptarClick(Sender: TObject);
    procedure Label2Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  ABMcategorias: TABMcategorias;

implementation

{$R *.lfm}
uses
  dmConexion;

{ TABMcategorias }

procedure TABMcategorias.btnAceptarClick(Sender: TObject);
begin
  dsCategorias.DataSet.Post;
  try
    begin
      if dsCategorias.DataSet.State in dsEditModes then
      begin
        mDatos.tblCategorias.ApplyUpdates;
      end;
    end;
  except
    on E: EDatabaseError do
    begin
      MessageDlg('Error', 'Ocurrió un error con la base de datos. Mensaje Técnico: ' + E.Message, mtError, [mbOK], 0);
    end;
  end;
  dsCategorias.DataSet.Open;
  Close;
end;

procedure TABMcategorias.Label2Click(Sender: TObject);
begin
  dsCategorias.DataSet.Cancel;
  Close;
end;

end.


