unit dmConexion;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqlite3conn, sqldb, DB, FileUtil, ZConnection, ZDataset;

type

  { TmDatos }

  TmDatos = class(TDataModule)
    lstEntrenadoresdescripcion: TMemoField;
    lstEntrenadoresid: TLargeintField;
    lstFederacionesdescipcion: TMemoField;
    lstFederacionesid: TLargeintField;
    lstTutoresdescripcion: TMemoField;
    lstTutoresid: TLargeintField;
    MemoField1: TMemoField;
    MemoField2: TMemoField;
    MemoField3: TMemoField;
    roFederacionesdescipcion: TMemoField;
    roFederacionesid: TLargeintField;
    sqlCompetenciascabecera_pagina: TMemoField;
    sqlCompetenciasdescripcion: TStringField;
    sqlCompetenciasid: TLongintField;
    sqlCompetenciaslogo: TBlobField;
    sqlCompetenciaspie_pagina: TMemoField;
    sqlCompetenciassede: TStringField;
    sqlCompetenciastemporada: TLongintField;
    sqlCompetenciastitulo: TStringField;
    sqlFichasapellido: TStringField;
    sqlFichasasociacion: TLongintField;
    sqlFichascodigo_postal: TStringField;
    sqlFichasdni: TStringField;
    sqlFichasdomicilio: TStringField;
    sqlFichasentrenador: TLongintField;
    sqlFichasfecha_nac: TDateField;
    sqlFichasid: TAutoIncField;
    sqlFichaslocalidad: TStringField;
    sqlFichasnombre: TStringField;
    sqlFichaspais: TStringField;
    sqlFichasprovincia: TStringField;
    sqlFichastelefono1: TStringField;
    sqlFichastelefono2: TStringField;
    sqlFichastutores: TLongintField;
    tblCategoriasedad_fin: TLargeintField;
    tblCategoriasedad_inicio: TLargeintField;
    tblCategoriasfecha_calculo_edad: TDateField;
    tblCategoriasid: TLargeintField;
    tblCategoriasnombre: TStringField;
    tblCompetenciascabecera_pagina: TMemoField;
    tblCompetenciasdescripcion: TStringField;
    tblCompetenciasid: TLargeintField;
    tblCompetenciaslogo: TBlobField;
    tblCompetenciaspie_pagina: TMemoField;
    tblCompetenciassede: TStringField;
    tblCompetenciastemporada: TLargeintField;
    tblCompetenciastitulo: TStringField;
    tblEntrenadoresapellido: TStringField;
    tblEntrenadoresdireccion: TStringField;
    tblEntrenadoresid: TLargeintField;
    tblEntrenadoreslocalidad: TStringField;
    tblEntrenadoresmail: TStringField;
    tblEntrenadoresnombre: TStringField;
    tblEntrenadorespais: TStringField;
    tblEntrenadoresprovincia: TStringField;
    tblEntrenadorestelefono: TStringField;
    tblFederacionesciudad: TStringField;
    tblFederacionesid: TLargeintField;
    tblFederacionesnombre: TStringField;
    tblFederacionespais: TStringField;
    tblFederacionesprovincia: TStringField;
    tblFederacionessigla: TStringField;
    tblFichasapellido: TStringField;
    tblFichasasociacion: TLargeintField;
    tblFichascodigo_postal: TStringField;
    tblFichasdni: TStringField;
    tblFichasdomicilio: TStringField;
    tblFichasentrenador: TLargeintField;
    tblFichasfecha_nac: TDateField;
    tblFichasid: TLargeintField;
    tblFichaslocalidad: TStringField;
    tblFichasnombre: TStringField;
    tblFichaspais: TStringField;
    tblFichasprovincia: TStringField;
    tblFichastelefono1: TStringField;
    tblFichastelefono2: TStringField;
    tblFichastutores: TLargeintField;
    tblInscriptoscompetencia_id: TLargeintField;
    tblInscriptosficha_p_id: TLargeintField;
    tblInscriptosid: TLargeintField;
    tblInscriptosposicion: TLargeintField;
    tblInscriptostiempo1: TTimeField;
    tblInscriptostiempo2: TTimeField;
    tblInscriptostiempo3: TTimeField;
    tblInscriptostiempo_total: TTimeField;
    tblTutoresapellido1: TStringField;
    tblTutoresapellido2: TStringField;
    tblTutoresdireccion1: TStringField;
    tblTutoresdireccion2: TStringField;
    tblTutoresid: TLargeintField;
    tblTutoreslocalidad1: TStringField;
    tblTutoreslocalidad2: TStringField;
    tblTutoresmail1: TStringField;
    tblTutoresmail2: TStringField;
    tblTutoresnombre1: TStringField;
    tblTutoresnombre2: TStringField;
    tblTutorespais1: TStringField;
    tblTutorespais2: TStringField;
    tblTutoresprovincia1: TStringField;
    tblTutoresprovincia2: TStringField;
    tblTutorestelefono1: TStringField;
    tblTutorestelefono2: TStringField;
    zConexion: TZConnection;
    tblCompetencias: TZTable;
    tblCategorias: TZTable;
    tblEntrenadores: TZTable;
    tblFederaciones: TZTable;
    tblFichas: TZTable;
    tblTutores: TZTable;
    tblInscriptos: TZTable;
    lstFederaciones: TZTable;
    lstEntrenadores: TZTable;
    lstTutores: TZTable;
    procedure lstEntrenadoresdescripcionGetText(Sender: TField;
      var aText: string; DisplayText: Boolean);
    procedure lstFederacionesdescipcionGetText(Sender: TField;
      var aText: string; DisplayText: Boolean);
    procedure lstTutoresdescripcionGetText(Sender: TField; var aText: string;
      DisplayText: Boolean);
    procedure MemoField1GetText(Sender: TField; var aText: string;
      DisplayText: Boolean);
    procedure MemoField2GetText(Sender: TField; var aText: string;
      DisplayText: Boolean);
    procedure MemoField3GetText(Sender: TField; var aText: string;
      DisplayText: Boolean);
  private

  public

  end;

var
  mDatos: TmDatos;

implementation

{$R *.lfm}

{ TmDatos }

procedure TmDatos.lstFederacionesdescipcionGetText(Sender: TField;
  var aText: string; DisplayText: Boolean);
begin
  if (DisplayText) then
    aText := Sender.AsString;
end;

procedure TmDatos.lstTutoresdescripcionGetText(Sender: TField;
  var aText: string; DisplayText: Boolean);
begin
  if (DisplayText) then
    aText := Sender.AsString;
end;

procedure TmDatos.MemoField1GetText(Sender: TField; var aText: string;
  DisplayText: Boolean);
begin
  if (DisplayText) then
    aText := Sender.AsString;
end;

procedure TmDatos.MemoField2GetText(Sender: TField; var aText: string;
  DisplayText: Boolean);
begin
  if (DisplayText) then
    aText := Sender.AsString;
end;

procedure TmDatos.MemoField3GetText(Sender: TField; var aText: string;
  DisplayText: Boolean);
begin
  if (DisplayText) then
    aText := Sender.AsString;
end;

procedure TmDatos.lstEntrenadoresdescripcionGetText(Sender: TField;
  var aText: string; DisplayText: Boolean);
begin
  if (DisplayText) then
    aText := Sender.AsString;
end;

end.





