@echo off
setlocal EnableDelayedExpansion

REM Go to the batch file directory
cd /d "%~dp0"

REM Temporary PATH for this script only
set PATH=C:\MinGW\bin;%PATH%

set COUNT=0

for %%f in (*.png *.jpg *.jpeg) do (

    echo =====================================
    echo Processing: %%f

    REM Output names
    if !COUNT! EQU 0 (
        set "OUT=image"
    ) else (
        set "OUT=image!COUNT!"
    )

    REM Temporary base name
    set "TEMP=tmp_icon_!COUNT!"

    REM Convert image -> ico
    Any2Ico.exe /Convert "%%f" "!TEMP!.ico" -formats=16,32,48,64,128,256 -crop

    REM Create rc file
    (
        echo IDI_ICON1 ICON "!TEMP!.ico"
    ) > "!TEMP!.rc"

    REM Compile rc -> o
    windres "!TEMP!.rc" -O coff -o "!OUT!.o"

    REM Delete temporary files
    del "!TEMP!.rc"
    del "!TEMP!.ico"

    echo Generated:
    echo   !OUT!.o

    set /a COUNT+=1
)

echo =====================================
echo DONE