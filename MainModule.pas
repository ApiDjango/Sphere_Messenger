unit MainModule;

interface

uses
  uniGUIMainModule, SysUtils, Classes, FIBDatabase, pFIBDatabase;

type
  TUniMainModule = class(TUniGUIMainModule)
    pMainDB: TpFIBDatabase;
    tr: TpFIBTransaction;
  private
    { Private declarations }
  public
    { Public declarations }
    function EncryptStr(const S: WideString; Key: Word): String;
    function DecryptStr(const S: String; Key: Word): String;
  end;


function UniMainModule: TUniMainModule;

implementation

{$R *.dfm}

uses
  UniGUIVars, ServerModule, uniGUIApplication;

function UniMainModule: TUniMainModule;
begin
  Result := TUniMainModule(UniApplication.UniMainModule)
end;




initialization

RegisterMainModuleClass(TUniMainModule);

end.
