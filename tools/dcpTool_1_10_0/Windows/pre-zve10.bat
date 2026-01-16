@echo off
setlocal enabledelayedexpansion

REM Step 1: Convert DCP files to XML
echo Step 1: Converting DCP files to XML
for %%F in (dcp_input\*.dcp) do (
    echo Processing %%~nxF
    dcpTool.exe -d "%%F" "xml_output\%%~nF.xml"
)

REM Step 2: Modify XML files
echo Step 2: Modifying XML files
for %%F in (xml_output\*.xml) do (
    echo Modifying %%~nxF
    powershell -Command "(gc '%%F') -replace '<UniqueCameraModelRestriction>.*</UniqueCameraModelRestriction>', '<UniqueCameraModelRestriction>Sony ZV-E10</UniqueCameraModelRestriction>' | Out-File '%%F' -Encoding UTF8"
)

REM Step 3: Rename XML files
echo Step 3: Renaming XML files
for %%F in (xml_output\*.xml) do (
    set "newname=%%~dpnF to Sony ZV-E10%%~xF"
    echo Renaming "%%F" to "!newname!"
    ren "%%F" "%%~nF to Sony ZV-E10%%~xF"
)

echo Processing complete!
pause