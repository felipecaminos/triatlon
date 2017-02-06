unit uabmfichas;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  DbCtrls, DBExtCtrls, Buttons;

type

  { TABMfichas }

  TABMfichas = class(TForm)
    btnCancelar: TBitBtn;
    btnAceptar: TBitBtn;
    DBDateEdit1: TDBDateEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    dsTutores: TDataSource;
    dsEntrenadores: TDataSource;
    dsFederaciones: TDataSource;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit9: TDBEdit;
    dsFichas: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
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
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  ABMfichas: TABMfichas;

implementation

{$R *.lfm}
uses
  dmConexion;

{ TABMfichas }

procedure TABMfichas.btnCancelarClick(Sender: TObject);
begin
  dsFichas.DataSet.Cancel;
  Close;
  //ModalResult:=mrCancel;
end;

procedure TABMfichas.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  dsEntrenadores.DataSet.Close;
  dsFederaciones.DataSet.Close;
  dsTutores.DataSet.Close;
end;

procedure TABMfichas.FormCreate(Sender: TObject);
begin
  dsEntrenadores.DataSet.Open;
  dsFederaciones.DataSet.Open;
  dsTutores.DataSet.Open;
end;

procedure TABMfichas.btnAceptarClick(Sender: TObject);
begin
  dsFichas.DataSet.Post;
  try
    begin
      if dsFichas.DataSet.State in dsEditModes then
      begin
        mDatos.tblFichas.ApplyUpdates;
      end;
    end;
  except
    on E: EDatabaseError do
    begin
      MessageDlg('Error', 'Ocurrió un error con la base de datos. Mensaje Técnico: ' + E.Message, mtError, [mbOK], 0);
    end;
  end;
  dsFichas.DataSet.Open;
  Close;
  //Self.ModalResult:=mrOK;
end;

end.

