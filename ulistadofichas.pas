unit ulistadofichas;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, DBGrids,
  Buttons;

type

  { TlistadoFichas }

  TlistadoFichas = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    dsListadoFichas: TDataSource;
    DBGrid1: TDBGrid;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  listadoFichas: TlistadoFichas;

implementation

{$R *.lfm}
uses
  dmConexion, uabmfichas;

{ TlistadoFichas }

procedure TlistadoFichas.BitBtn2Click(Sender: TObject);
var
  ABMfichas: TABMfichas;
begin
  ABMfichas := TABMfichas.Create(Application);
  ABMfichas.dsFichas := dsListadoFichas;
  ABMfichas.dsFichas.DataSet.Edit;
  Self.Hide;
  try
    ABMfichas.ShowModal;
  finally
    ABMfichas.Free;
  end;
  Self.Show;
end;

procedure TlistadoFichas.BitBtn3Click(Sender: TObject);
begin
  if QuestionDlg('CaptionEdit', '¿¿Está seguro que desea borrar el registro??', mtWarning, [mrYes, 'Yes', mrNo, 'No'], 0) = mrYes then
    try
      begin
        dsListadoFichas.DataSet.Delete;
        //mDatos.sqlCompetencias.Delete;
        mDatos.tblFichas.ApplyUpdates;
      end;
    except
      on E: EDatabaseError do
      begin
        MessageDlg('Error', 'Ocurrió un error con la base de datos. Mensaje Técnico: ' + E.Message, mtError, [mbOK], 0);
      end;
    end;
end;

procedure TlistadoFichas.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TlistadoFichas.BitBtn1Click(Sender: TObject);
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
end;

procedure TlistadoFichas.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  dsListadoFichas.DataSet.Close;
end;

procedure TlistadoFichas.FormCreate(Sender: TObject);
begin
  dsListadoFichas.DataSet.Open;
end;

end.

