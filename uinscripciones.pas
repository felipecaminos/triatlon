unit uinscripciones;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, DbCtrls,
  StdCtrls, DBGrids, Buttons;

type

  { TInscripciones }

  TInscripciones = class(TForm)
    NuevaFicha: TBitBtn;
    DBLookupComboBox2: TDBLookupComboBox;
    dsFichas: TDataSource;
    DBGrid1: TDBGrid;
    dsInscriptos: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
    dsCompetencias: TDataSource;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure NuevaFichaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Inscripciones: TInscripciones;

implementation
//* unidades que contienen los formularios *//
uses
   uabmfichas, dmConexion;

{$R *.lfm}

{ TInscripciones }

procedure TInscripciones.FormCreate(Sender: TObject);
begin
  dsCompetencias.DataSet.Open;
  dsInscriptos.DataSet.Open;
  dsInscriptos.DataSet.Append;
end;

procedure TInscripciones.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  dsCompetencias.DataSet.Close;
  dsInscriptos.DataSet.Close;
end;

procedure TInscripciones.NuevaFichaClick(Sender: TObject);
var
  ABMfichas: TABMfichas;
begin
  ABMfichas := TABMfichas.Create(Application);
  ABMfichas.dsFichas.DataSet.Append;
  try
    ABMfichas.ShowModal;
  finally
    ABMfichas.Free;
  end;
  dsFichas;
end;

end.

