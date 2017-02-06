program InfantilTriaLaPaz;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, pl_bgracontrols, pl_excontrols, pl_zeosdbo, lz_chmhelp, uPrincipal,
  dmConexion, uacerca_de, uabmcompetencia, ulistadocompetencias, uabmcategorias,
  uabmentrenadores, uabmfederaciones, uabmtutores, uabmfichas, ulistadofichas;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Initialize;
  Application.CreateForm(TguiPrincipal, guiPrincipal);
  Application.CreateForm(TmDatos, mDatos);
  Application.CreateForm(TABMfichas, ABMfichas);
  Application.CreateForm(TlistadoFichas, listadoFichas);
  Application.Run;
end.

