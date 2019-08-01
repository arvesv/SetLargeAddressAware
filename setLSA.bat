if not exist "%~dp0\packages\LargeAddressAware\build\net46\SetLargeAddressAware.dll" (
    %~dp0\.paket\paket restore
)

setlocal

FOR /F "tokens=* USEBACKQ" %%F IN (`"%~dp0findmsbuildpath"`) DO (
    SET mymsbuild=%%F
)

%mymsbuild% "%~dp0\SetLSA.proj" /p:File=%1



