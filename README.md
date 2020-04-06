# wolfmamerecord
Batch file to record and zip INPs with WolfMAME and Z-Zip

To use, place this batch file in the same folder as the WolfMAME executable. You will also need the 7-Zip executable in the same folder: http://www.7-zip.org/download.html

Once installed, usage is simply "rec gamename" where "gamename" is the short name of the game you want to record. For example, to record Donkey Kong: rec dkong. This will record your game with NVRAM disabled, run in a window, run with no frameskip, and disable cheats. When WolfMAME is finished running, 7-Zip will then automatically zip the resulting INP with the format gamename_()_wolf220_YYYYMMDDTHHMMSS00MST-AZ.zip. The () is a placeholder for score, the WolfMAME version will need to updated within the batch file for your specific version, and added to the end is the system time at the start of the recording. The timezone label will need to be manually updated in the batch file to suit your needs.
