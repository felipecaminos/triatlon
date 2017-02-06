unit uabmcompetencia;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, FileUtil, Forms, Controls, Graphics, Dialogs, DBCtrls,
  StdCtrls, Buttons, ExtDlgs;

type

  { TABMcompetencia }

  TABMcompetencia = class(TForm)
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    DBImage1: TDBImage;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    dsCompetencia: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBText1: TDBText;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    dlgImagen: TOpenPictureDialog;
    Label8: TLabel;
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure DBImage1Click(Sender: TObject);
  private

  public

  end;

var
  ABMcompetencia: TABMcompetencia;

implementation

{$R *.lfm}
uses
  dmConexion;

{ TABMcompetencia }

procedure TABMcompetencia.DBImage1Click(Sender: TObject);
begin
  if dlgImagen.Execute then
    DBImage1.Picture.LoadFromFile(dlgImagen.FileName);
end;

procedure TABMcompetencia.btnAceptarClick(Sender: TObject);
begin
  dsCompetencia.DataSet.Post;
  try
    begin
      if dsCompetencia.DataSet.State in dsEditModes then
      begin
        mDatos.tblCompetencias.ApplyUpdates;
      end;
    end;
  except
    on E: EDatabaseError do
    begin
      MessageDlg('Error', 'Ocurrió un error con la base de datos. Mensaje Técnico: ' + E.Message, mtError, [mbOK], 0);
    end;
  end;
  dsCompetencia.DataSet.Open;
  Close;
end;

procedure TABMcompetencia.btnCancelarClick(Sender: TObject);
begin
  dsCompetencia.DataSet.Cancel;
  Close;
end;

end.




