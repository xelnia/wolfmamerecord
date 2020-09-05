# wolfmamerecord
Windows batch file to record and zip INPs with WolfMAME and 7-Zip

To use, place this batch file in the same folder as the WolfMAME executable. You will also need the 7-Zip executable in the same folder: http://www.7-zip.org/download.html

Once installed, usage is simply "rec gamename" where "gamename" is the short name of the game you want to record. For example, to record Donkey Kong: rec dkong. This will record your game with NVRAM disabled, run in a window, run with no frameskip, and disable cheats. When WolfMAME is finished running, it will create a text file with information about the INP just recorded. 7-Zip will then automatically zip the resulting INP, text file, and relevant CFG file with the format gamename_()_mameversion_YYYY-MM-DD_HHMMSS00.zip. The system date and time in the filename will be when MAME was exited. The () is a placeholder for score or other information to be manually entered.

This batch file should be used with newer versions of WolfMAME, as older versions do not have a "-version" command, which is used within the batch file. INP and CFG file locations should be left at their defaults.
