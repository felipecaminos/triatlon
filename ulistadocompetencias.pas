unit ulistadocompetencias;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, FileUtil, Forms, Controls, Graphics, Dialogs, DBGrids,
  DBCtrls, Buttons;

type

  { TlistadoCompetencias }

  TlistadoCompetencias = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    DBGrid1: TDBGrid;
    dsListadoCompetencias: TDataSource;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  listadoCompetencias: TlistadoCompetencias;

implementation

{$R *.lfm}
uses
  dmConexion, uabmcompetencia;

{ TlistadoCompetencias }

procedure TlistadoCompetencias.BitBtn2Click(Sender: TObject);
var
  ABMcompetencia: TABMcompetencia;
begin
  ABMcompetencia := TABMcompetencia.Create(Application);
  ABMcompetencia.dsCompetencia.DataSet.Append;
  try
    ABMcompetencia.ShowModal;
  finally
    ABMcompetencia.Free;
  end;
end;

procedure TlistadoCompetencias.BitBtn3Click(Sender: TObject);
var
  ABMcompetencia: TABMcompetencia;
begin
  ABMcompetencia := TABMcompetencia.Create(Application);
  ABMcompetencia.dsCompetencia := dsListadoCompetencias;
  ABMcompetencia.dsCompetencia.DataSet.Edit;
  try
    ABMcompetencia.ShowModal;
  finally
    ABMcompetencia.Free;
  end;
end;

procedure TlistadoCompetencias.BitBtn4Click(Sender: TObject);
begin
  if QuestionDlg('CaptionEdit', '¿¿Está seguro que desea borrar el registro??', mtWarning, [mrYes, 'Yes', mrNo, 'No'], 0) = mrYes then
    try
      begin
        dsListadoCompetencias.DataSet.Delete;
        mDatos.tblCompetencias.ApplyUpdates;
      end;
    except
      on E: EDatabaseError do
      begin
        MessageDlg('Error', 'Ocurrió un error con la base de datos. Mensaje Técnico: ' + E.Message, mtError, [mbOK], 0);
      end;
    end;
end;

procedure TlistadoCompetencias.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  dsListadoCompetencias.DataSet.Close;
end;

procedure TlistadoCompetencias.FormCreate(Sender: TObject);
begin
  dsListadoCompetencias.DataSet.Open;
end;

end.



