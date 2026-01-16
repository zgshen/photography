@echo off
setlocal enabledelayedexpansion

echo Cleaning up folders...

REM Delete files in dcp_input folder
echo Deleting files in dcp_input folder...
del /Q "dcp_input\*.*"

REM Delete files in xml_output folder
echo Deleting files in xml_output folder...
del /Q "xml_output\*.*"

REM Delete files in dcp_output folder
echo Deleting files in dcp_output folder...
del /Q "dcp_output\*.*"

echo Cleanup complete!

REM pause
REM Wait for 2 seconds before closing
timeout /t 2 /nobreak > nul