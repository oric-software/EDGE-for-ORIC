@ECHO OFF


::
:: Initial check.
:: Verify if the SDK is correctly configurated
::
IF "%OSDK%"=="" GOTO ErCfg


::
:: Set the build paremeters
::


copy ..\..\Oricutron\printer_out.txt Edgemap.s 
copy ..\..\Oricutron\printer_out.txt ..\EdgeLeveltester\Edgemap.s 
del ..\..\Oricutron\printer_out.txt
GOTO End


::
:: Outputs an error message
::
:ErCfg
ECHO == ERROR ==
ECHO The Oric SDK was not configured properly
ECHO You should have a OSDK environment variable setted to the location of the SDK
IF "%OSDKBRIEF%"=="" PAUSE
GOTO End


:End
