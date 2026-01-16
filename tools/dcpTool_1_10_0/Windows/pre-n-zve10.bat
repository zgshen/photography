@echo off
setlocal enabledelayedexpansion

REM Step 4: Convert modified and renamed XML files back to DCP
echo Step 4: Converting modified and renamed XML files back to DCP
for %%F in ("xml_output\*to Sony ZV-E10.xml") do (
    echo Converting %%~nxF to DCP
    dcpTool.exe -c "%%F" "dcp_output\%%~nF.dcp"
)

echo Processing complete!
pause