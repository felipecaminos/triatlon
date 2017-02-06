unit ulistadocategorias;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, 
    ulistadocompetencias;

type

  { TlistadoCompetencias1 }

  TlistadoCategorias= class(TForm)
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  listadoCategorias: TlistadoCategorias;

implementation

{$R *.lfm}
uses
  dmConexion, uabmcategorias;
end.

