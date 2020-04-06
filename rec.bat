@echo off

REM Get system time
REM Format will be YYYYMMDDTHHMMSS00
for /f "tokens=1-4 delims=/ " %%a in ('date /t') do (set mydate=%%d%%b%%c)
for /f "tokens=1-4 delims=/:/./ " %%a in ("%time: =0%") do (set mytime=%%a%%b%%c%%d)

REM Run WolfMAME
REM Depending on the version being used, WolfMAME executable might be "mame", "mame64", "mamearcade", "mamearcade64", etc.
REM This disables NVRAM, runs in a window, disables bilinear filter, runs with no auto-frameskip at frameskip 0, and disables cheats
REM %2 - %9 are for any other options you want to use from the command line when running WolfMAME, for example: record milliped -mouse
mame64 %1 -rec %1.inp -nvram_directory NUL -w -nofilter -noafs -fs 0 -noc %2 %3 %4 %5 %6 %7 %8 %9

REM Zip the INP
REM Archive will be named based on romset short name, WolfMAME version, and the system time (with timezone) at the start of recording
REM Timezone description is not automated. This must be edited manually.
REM 7-Zip executable must be present in WolfMAME root folder
REM This assumes default INP locations in "inp" folder
REM () is a placeholder for score
REM WolfMAME version ("wolfXXX") will need to be updated if used for different versions
7z a inp/%1_()_wolf220_%mydate%T%mytime%MST-AZ.zip .\inp/%1.inp*
