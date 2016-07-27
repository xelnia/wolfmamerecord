@echo off

REM Get system time
REM Format will be YYYYMMDDTHMMSS00
For /f "tokens=1-4 delims=/ " %%a in ('date /t') do (set mydate=%%d%%b%%c)
For /f "tokens=1-4 delims=/:/./ " %%a in ("%time: =0%") do (set mytime=%%a%%b%%c%%d)

REM Run WolfMAME
REM This disables NVRAM, runs in a window, disables bilinear filter, runs with no auto-frameskip at frameskip 0, and disables cheats
REM %2 - %9 are for any other options you want to use when running WolfMAME
mamearcade %1 -rec %1.inp -nvram_directory NUL -w -nofilter -noafs -fs 0 -noc %2 %3 %4 %5 %6 %7 %8 %9

REM Zip the INP
REM Archive will be named based on romset short name, WolfMAME version, and the system time at the start of recording
REM 7-Zip executable must be present in MAME root folder
REM This assumes default INP locations in inp folder
REM () is a placeholder for score
REM WolfMAME version ("wolf176") will need to be updated if used for different versions
7z a inp/%1_()_wolf176_%mydate%T%mytime%JST.zip .\inp/%1.inp*
