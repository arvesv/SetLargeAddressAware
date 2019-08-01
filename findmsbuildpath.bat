@echo off

if exist "%ProgramFiles(x86)%\Microsoft Visual Studio\2019" (
	REM Find the path f the VS2017/toolset 15 msbuild on a machine with VS 2019 installed
    setlocal 
    FOR /F "tokens=* USEBACKQ" %%F IN (`"%ProgramFiles(x86)%\Microsoft Visual Studio\Installer\vswhere.exe" -version 15.0^,16.0 -requires Microsoft.Component.MSBuild -find MSBuild\**\Bin\MSBuild.exe`) DO (
        echo "%%F"
    )
    endlocal
) else (
	REM Find the path of msbuild for VS2017/toolset 15 
    setlocal
    FOR /F "tokens=* USEBACKQ" %%F IN (`"%ProgramFiles(x86)%\Microsoft Visual Studio\Installer\vswhere.exe" -products * -version 15 -property installationPath`) DO (
        echo "%%F\MSBuild\15.0\bin\MSBuild.exe"    
    )
    endlocal

)




