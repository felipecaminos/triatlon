unit uPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, LazHelpCHM, Forms, Controls, Graphics,
  Dialogs, DBGrids, Buttons, Menus, ComCtrls, ExtCtrls, StdCtrls, LazHelpHTML;

type

  { TguiPrincipal }

  TguiPrincipal = class(TForm)
    BitBtn1: TBitBtn;
    DataSource1: TDataSource;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem20: TMenuItem;
    MenuItem21: TMenuItem;
    mnAcercaDe: TMenuItem;
    mnAyuda: TMenuItem;
    mnSalir: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    BarraEstado: TStatusBar;
    Temporizador: TTimer;
    procedure MenuItem15Click(Sender: TObject);
    procedure MenuItem21Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure mnAyudaClick(Sender: TObject);
    procedure mnSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mnAcercaDeClick(Sender: TObject);
    procedure plSideBar1Select(Sender: TObject; Index,SubIndex: integer; aCaption: string);
    procedure TemporizadorTimer(Sender: TObject);
  private

  public

  end;

var
  guiPrincipal: TguiPrincipal;

implementation

{$R *.lfm}

{ TguiPrincipal }
//* unidades que contienen los formularios *//
uses
   uacerca_de, ulistadocompetencias, uinscripciones, ulistadofichas, dmConexion;


procedure TguiPrincipal.mnSalirClick(Sender: TObject);
begin
   Close();
end;

procedure TguiPrincipal.MenuItem21Click(Sender: TObject);
var
   listadoCompetencias: TlistadoCompetencias;
begin
   listadoCompetencias:= TlistadoCompetencias.Create(Application);
   Self.Hide;
   try
     listadoCompetencias.ShowModal;
   finally
     listadoCompetencias.Free;
   end;
   Self.Show;
end;

procedure TguiPrincipal.MenuItem7Click(Sender: TObject);
var
   Inscripciones: TInscripciones;
begin
   Inscripciones:= TInscripciones.Create(Application);
   Self.Hide;
   try
     Inscripciones.ShowModal;
   finally
     Inscripciones.Free;
   end;
   Self.Show;
end;

procedure TguiPrincipal.mnAyudaClick(Sender: TObject);
begin

end;

procedure TguiPrincipal.MenuItem15Click(Sender: TObject);
var
   listadoFichas: TlistadoFichas;
begin
   listadoFichas:= TlistadoFichas.Create(Application);
   Self.Hide;
   try
     listadoFichas.ShowModal;
   finally
     listadoFichas.Free;
   end;
   Self.Show;
end;

procedure TguiPrincipal.FormCreate(Sender: TObject);
begin
   Temporizador.Enabled:=true;
end;

procedure TguiPrincipal.mnAcercaDeClick(Sender: TObject);
var
   fmAcercaDe: TfmAcercaDe;
begin
   fmAcercaDe:= TfmAcercaDe.Create(Application);
   Self.Hide;
   try
     fmAcercaDe.ShowModal;
   finally
     fmAcercaDe.Free;
   end;
   Self.Show;
end;

procedure TguiPrincipal.plSideBar1Select(Sender: TObject; Index,
  SubIndex: integer; aCaption: string);
begin
   Caption := 'indice: '+IntToStr(Index)+' sub: '+IntToStr(SubIndex);
end;

procedure TguiPrincipal.TemporizadorTimer(Sender: TObject);
begin
   BarraEstado.Panels[0].Text := 'Hora: '+FormatDateTime('hh:nn',Time)+' - Fecha: '
       +FormatDateTime('dd'' de ''mmmm'' del ''yyyy', Now);
end;

end.

