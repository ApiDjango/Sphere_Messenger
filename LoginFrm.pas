unit LoginFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, FIBDatabase, pFIBDatabase,
  Data.DB, FIBDataSet, pFIBDataSet, uniButton, uniCheckBox, uniLabel, uniEdit,
  uniGUIBaseClasses, uniPanel;

type
  TUniLoginForm1 = class(TUniLoginForm)
    UniContainerPanel1: TUniContainerPanel;
    UniContainerPanel2: TUniContainerPanel;
    edlogin: TUniEdit;
    UniLabel1: TUniLabel;
    UniContainerPanel3: TUniContainerPanel;
    UniLabel3: TUniLabel;
    edipdb: TUniEdit;
    UniContainerPanel4: TUniContainerPanel;
    edpassword: TUniEdit;
    UniLabel2: TUniLabel;
    UniContainerPanel5: TUniContainerPanel;
    UniCheckBox1: TUniCheckBox;
    UniContainerPanel6: TUniContainerPanel;
    UniButton1: TUniButton;
    UniButton2: TUniButton;
    dsGetRole: TpFIBDataSet;
    dsGetRoleRROLE: TFIBStringField;
    dsGetRoleIS_MEMBER: TFIBIntegerField;
    dbOrg: TpFIBDatabase;
    trOrg: TpFIBTransaction;
    dsGetRoleRCODE: TFIBIntegerField;
    procedure UniButton1Click(Sender: TObject);
    procedure UniLoginFormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function UniLoginForm1: TUniLoginForm1;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication;

function UniLoginForm1: TUniLoginForm1;
begin
  Result := TUniLoginForm1(UniMainModule.GetFormInstance(TUniLoginForm1));
end;

procedure TUniLoginForm1.UniButton1Click(Sender: TObject);
begin
  dbOrg.DBName := edipdb.Text;
  dbOrg.ConnectParams.UserName := edlogin.Text;
  dbOrg.ConnectParams.Password := edpassword.Text;
  dbOrg.ConnectParams.RoleName := '';
  dbOrg.Open;
  dsGetRole.Open;
  if dbOrg.Connected then
  begin
    UniApplication.Cookies.SetCookie('_loginname',
      UniMainModule.EncryptStr(edlogin.Text, 223), Date + 7.0);
    UniApplication.Cookies.SetCookie('_pwd',
      UniMainModule.EncryptStr(edpassword.Text, 223), Date + 7.0);
    UniApplication.Cookies.SetCookie('_db',
      UniMainModule.EncryptStr(edipdb.Text, 223), Date + 7.0);
    UniApplication.Cookies.SetCookie('_role',
      UniMainModule.EncryptStr(dsGetRoleRROLE.AsString, 223), Date + 7.0);
    UniApplication.Cookies.SetCookie('_id',
      UniMainModule.EncryptStr(dsGetRoleRCODE.AsString, 223), Date + 7.0);
  end;
  dbOrg.Close;
  ModalResult := mrOK;

end;

procedure TUniLoginForm1.UniLoginFormShow(Sender: TObject);
begin
  if UniApplication.Cookies.Values['_loginname'] > '' then
  begin
    edlogin.Text := UniMainModule.DecryptStr(UniApplication.Cookies.Values
      ['_loginname'], 223);
    edpassword.Text := UniMainModule.DecryptStr
      (UniApplication.Cookies.Values['_pwd'], 223);
    edipdb.Text := UniMainModule.DecryptStr(UniApplication.Cookies.Values
      ['_db'], 223);
  end
  else
  begin
    edlogin.Text := '';
    edpassword.Text := '';
    edipdb.Text := '';
  end;
end;

initialization

RegisterAppFormClass(TUniLoginForm1);

end.
