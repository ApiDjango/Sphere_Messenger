unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniBasicGrid, uniDBGrid,
  uniDBVerticalGrid, uniDBVerticalTreeGrid, uniGUIBaseClasses, uniPanel,
  FIBDatabase, pFIBDatabase, Data.DB, FIBDataSet, pFIBDataSet, uniMemo,
  uniDBMemo, uniTimer, uniTreeView, uniButton, uniGroupBox, uniDBTreeGrid,
  FIBQuery, pFIBQuery;

type
  TMainForm = class(TUniForm)
    UniPanel1: TUniPanel;
    DSTreeGroup: TpFIBDataSet;
    TRead: TpFIBTransaction;
    DSCTreeGroup: TDataSource;
    UniPanel2: TUniPanel;
    DBMemoMessenger: TUniDBMemo;
    TimeMessenger: TUniTimer;
    DSMemo: TpFIBDataSet;
    UniPanel3: TUniPanel;
    TimerTree: TUniTimer;
    UniGroupBox1: TUniGroupBox;
    UniMemo1: TUniMemo;
    UniButton1: TUniButton;
    UniGroupBox2: TUniGroupBox;
    UniGroupBox3: TUniGroupBox;
    TreeViewGroup: TUniTreeView;
    DSTreeGroupID: TFIBIntegerField;
    DSTreeGroupNAME: TFIBStringField;
    DSCMemo: TDataSource;
    QSend: TpFIBQuery;
    TRW: TpFIBTransaction;
    DSMemoSMESSAGE: TFIBStringField;
    procedure TimeMessengerTimer(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure TreeViewGroupClick(Sender: TObject);
    procedure UniButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication;

function MainForm: TMainForm;
begin
  Result := TMainForm(UniMainModule.GetFormInstance(TMainForm));
end;

procedure TMainForm.TimeMessengerTimer(Sender: TObject);
var
  I: Integer;
begin
  { if TreeViewGroup.Selected <> nil then
    begin
    DSMemo.ParamByName('PGROUP_ID').Value :=
    IntTostr(Integer(TreeViewGroup.Items
    [TreeViewGroup.Selected.SelectedIndex].Data));
    DSMemo.FullRefresh;
    end; }
end;

procedure TMainForm.TreeViewGroupClick(Sender: TObject);
var
  I: Integer;
begin
  DSMemo.ParamByName('PGROUP_ID').Value :=
    IntTostr(Integer(TreeViewGroup.Items
    [TreeViewGroup.Selected.SelectedIndex].Data));
  DSMemo.FullRefresh;
  while not DSMemo.Eof do
  begin
    DBMemoMessenger.Lines.Add(DSMemoSMESSAGE.AsString);
    DSMemo.Next;
  end;
end;

procedure TMainForm.UniButton1Click(Sender: TObject);
var
  I: Integer;
begin

  if TreeViewGroup.Selected = nil then
  begin
    ShowMessage('Выберите группу',
      procedure(Sender: TComponent; Res: Integer)
      begin
        case Res of
          mrYes:
            exit;
        end;
      end);
  end
  else
  begin
    if not TRW.Active then
      TRW.StartTransaction;
    QSend.SQL.Add
      ('Insert into SPHERE_MESSAGE(SPHERE_MESSAGE, USER_ID, GROUP_ID)VALUES(' +
      QuotedStr(UniMemo1.Text) + ',' + UniMainModule.DecryptStr
      (UniApplication.Cookies.Values['_id'], 223) + ',' +
      IntTostr(Integer(TreeViewGroup.Items[TreeViewGroup.Selected.SelectedIndex]
      .Data)) + ')');
    QSend.ExecQuery;
    DSMemo.FullRefresh;

    while not DSMemo.Eof do
    begin
      DBMemoMessenger.Lines.Add(DSMemoSMESSAGE.AsString);
      DSMemo.Next;
    end;

  end;
end;

procedure TMainForm.UniFormShow(Sender: TObject);
var
  CurrentChildID, RecordChildID: Integer;
  RootNode, ChildNode: TUniTreeNode;
begin

  if UniMainModule.pMainDB.Connected then
    UniMainModule.pMainDB.Close;

  UniMainModule.pMainDB.DBName := UniMainModule.DecryptStr
    (UniApplication.Cookies.Values['_db'], 223);
  UniMainModule.pMainDB.ConnectParams.UserName :=
    UniMainModule.DecryptStr(UniApplication.Cookies.Values['_loginname'], 223);
  UniMainModule.pMainDB.ConnectParams.Password :=
    UniMainModule.DecryptStr(UniApplication.Cookies.Values['_pwd'], 223);
  UniMainModule.pMainDB.ConnectParams.RoleName :=
    UniMainModule.DecryptStr(UniApplication.Cookies.Values['_role'], 223);
  UniMainModule.pMainDB.Open;
  //
  DSTreeGroup.Open;
  while not DSTreeGroup.Eof do
  begin
    TreeViewGroup.Items.AddChildObject(TreeViewGroup.Items[0],
      DSTreeGroup.FieldByName('Name').AsString,
      Pointer(DSTreeGroup.FieldByName('ID').AsInteger));
    DSTreeGroup.Next;
  end;
  DSTreeGroup.Close;
end;

initialization

RegisterAppFormClass(TMainForm);

end.
