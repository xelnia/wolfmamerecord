@echo off

REM Get system time at MAME startup
REM Assumes mm/dd/yyyy format for system date
for /f "tokens=1-4 delims=/ " %%a in ('date /t') do (set startdate=%%d-%%b-%%c)
for /f "tokens=1-4 delims=/:/./ " %%a in ("%time: =0%") do (set "starttime1=%%a%%b%%c%%d" & set "starttime2=%%a:%%b:%%c.%%d")

REM Run WolfMAME
REM Depending on the version being used, WolfMAME executable might be "mame", "mame64", "mamearcade", "mamearcade64", etc.
REM This disables NVRAM, runs in a window, disables bilinear filter, runs with no auto-frameskip at frameskip 0, and disables cheats
REM %2 - %9 are for any other options you want to use from the command line when running WolfMAME, for example: rec milliped -mouse
mame64 %1 -rec %1.inp -nvram_directory NUL -w -nofilter -noafs -fs 0 -noc %2 %3 %4 %5 %6 %7 %8 %9

REM Get system time at MAME exit
for /f "tokens=1-4 delims=/ " %%a in ('date /t') do (set enddate=%%d-%%b-%%c)
for /f "tokens=1-4 delims=/:/./ " %%a in ("%time: =0%") do (set "endtime1=%%a%%b%%c%%d" & set "endtime2=%%a:%%b:%%c.%%d")

REM Get MAME version
for /f "tokens=1,*" %%a in ('mame64 -version') do (set "version=%%a %%b" & set "versiona=%%b")
set versionb=%versiona:~1,-1%

REM Get romset name and description
for /f "tokens=1,*" %%a in ('mame64 %1 -listfull') do (set "romset=%%a" & set "description=%%b")

REM Create and/or update text file with INP information
echo       Player: [insert your name here]^

      romset: %romset%^

 Description: %description%^

MAME version: %version%^

MAME startup: %startdate% %starttime2% [insert your timezone here]^

   MAME exit: %enddate% %endtime2% [insert your timezone here]^

Archive name: %1_()_%versionb%_%enddate%_%endtime1%.zip>inp\info.txt

REM Zip the INP, info text file, and CFG file
REM Archive will be named based on romset short name, WolfMAME version, and the system date and time at MAME exit
REM 7-Zip executable must be present in WolfMAME root folder
REM This assumes default locations for INPs and CFG files
REM () is a placeholder for score or other information
7z a inp/%1_()_%versionb%_%enddate%_%endtime1%.zip .\inp/%1.inp* .\inp/info.txt* .\cfg/%1.cfg*
