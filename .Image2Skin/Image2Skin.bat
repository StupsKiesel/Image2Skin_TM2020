@echo off

mode con: cols=79 lines=33
title Created by StupsKiesel
echo     .BBBBBBBBBBBBBBBBBBBBBBBBB                             
echo     BBBBBBBBBBBBBBBBBBBBMBBBBBB                            
echo     BB                 ::   .BB                            
echo     BB.              BBBBBB :BB                            
echo     BB:              BBBBBB0BBBi                           
echo     BB:      2BB      BBBB  7BBBBBB:                       
echo     BB:     BBBBB:          rBBBBBBBB2                     
echo     BB:   iBBBBBBBB.0BBB    rBB BBBBBBB.                   
echo     BB.  BBBBBBBBBBBBBBBB:  rBB  BBBBBBBr                  
echo     BB  BBBBBBBBBBBBBBBBBBB  BB   BBBBBBB.                 
echo     BBBBBBBBBBBBBBBBBBBBBBBBBBB   BBBBBBBB                 
echo     BBBBBBBBBBBBBBBBBBBBBBBBBBB   MBBBBBBB:                
echo     BBBBBBBBBBBBBBBBBBBBBBBBBBB   .BBBBBBBB                
echo      BBBBBBBBBBBBBBBBBBBBBBBBM..  7BBBBBBBB  .:            
echo                               SBBBBBBBBBBBBBBBB            
echo                                .BBBBBBBBBBBBBB  :          
echo                                  7BBBBBBBBBBBBBBBBB.       
echo                                  .BBBBBBBBBBBBBBBBBBB      
echo                                 BBBBBBBBBBBBBBBBBBBBBB     
echo                              ..BBBBBBBBBBBBBBBBBBBBBBBB    
echo               BBBB7         XBBBBBBBB(:D)BBBBBBBBBBBBBBBB  
echo             iBBBBBBB     7BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB  
echo             BBBBBBBB  iBBBBBBBBBBBBBBBBBBBiBBBBBBBBBBBBB2  
echo             BBB7BBBBBBBBBBBBBBBBBBBBBBBBBBiBBBB   BBBBB:   
echo              :BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB             
echo                7BBBBBBBBBBBBBBBBBBBBBBBBBB0:               
echo                  BBBBBBBBBBBBB                             
echo                   .BBBBBBBBBBB                             
echo                       7BBBBBB2                             
echo                         BBBB                               
timeout 2 /nobreak>NUL
title Image2Skin Converter TM2020

set dir=%cd%
setlocal enabledelayedexpansion
:subfoldercheck
echo ##############################################################################
echo #  Select the Skin folder you want to convert the content from PNG to DDS:   #
echo ##############################################################################
rem list of all subfolders
set Index=1

for /d %%D in ("%cd%\*") do (
	set "Subfolders[!Index!]=%%D"
	set /a Index+=1
)

set /a UBound=Index-1

rem select folder prompt
for /l %%i in (1,1,%UBound%) do echo %%i. !Subfolders[%%i]!
:choiceloop
set /p Choice=Your choice: 

if "%Choice%"=="" goto chioceloop
if %Choice% LSS 1 goto choiceloop
if %Choice% GTR %UBound% goto choiceloop

set Subfolder=!Subfolders[%Choice%]!

if !Subfolder!==!dir!\.Image2Skin (
	title ERROR
	echo ##############################################################################
	echo #      ERROR: You can not Select this folder, sorry its a dirty fix :P       #
	echo ##############################################################################
	timeout 2 /nobreak>NUL
	set Index=1
	title Image2Skin Converter TM2020
	goto subfoldercheck
)

rem Create "DDS" folder if not exist 
if not exist "%Subfolder%\DDS\" mkdir "%Subfolder%\DDS\"
echo ##############################################################################
set skipedfiles=0
rem #####################################################################################################
set filename=Wheels_B

IF EXIST "%Subfolder%\%filename%.png" (
	title Converting %filename%.png ...
	echo Converting %filename%.png ...
	.Image2Skin\nvcompress.exe -color -bc1 -nomips "%Subfolder%\%filename%.png" "%Subfolder%\DDS\%filename%.dds">NUL
	title Image2Skin Converter TM2020
) ELSE (
	echo ERROR: %filename%.png was not found !
	set /A skipedfiles+=1
)
rem #####################################################################################################
set filename=Wheels_AO

IF EXIST "%Subfolder%\%filename%.png" (
	title Converting %filename%.png ...
	echo Converting %filename%.png ...
	.Image2Skin\nvcompress.exe -color -bc1 -nomips "%Subfolder%\%filename%.png" "%Subfolder%\DDS\%filename%.dds">NUL
	title Image2Skin Converter TM2020
) ELSE (
	echo ERROR: %filename%.png was not found !
	set /A skipedfiles+=1
)
rem #####################################################################################################

set filename=Wheels_DirtMask

IF EXIST "%Subfolder%\%filename%.png" (
	title Converting %filename%.png ...
	echo Converting %filename%.png ...
	.Image2Skin\nvcompress.exe -color -bc1 -nomips "%Subfolder%\%filename%.png" "%Subfolder%\DDS\%filename%.dds">NUL
	title Image2Skin Converter TM2020
) ELSE (
	echo ERROR: %filename%.png was not found !
	set /A skipedfiles+=1
)
rem #####################################################################################################
set filename=Wheels_N

IF EXIST "%Subfolder%\%filename%.png" (
	title Converting %filename%.png ...
	echo Converting %filename%.png ...
	.Image2Skin\nvcompress.exe -color -bc5 -nomips -normal "%Subfolder%\%filename%.png" "%Subfolder%\DDS\%filename%.dds">NUL
	title Image2Skin Converter TM2020
) ELSE (
	echo ERROR: %filename%.png was not found !
	set /A skipedfiles+=1
)
rem #####################################################################################################
set filename=Wheels_R

IF EXIST "%Subfolder%\%filename%.png" (
	title Converting %filename%.png ...
	echo Converting %filename%.png ...
	.Image2Skin\nvcompress.exe -color -bc5 -nomips "%Subfolder%\%filename%.png" "%Subfolder%\DDS\%filename%.dds">NUL
	title Image2Skin Converter TM2020
) ELSE (
	echo ERROR: %filename%.png was not found !
	set /A skipedfiles+=1
)
rem #####################################################################################################
set filename=Wheels_I

IF EXIST "%Subfolder%\%filename%.png" (
	title Converting %filename%.png ...
	echo Converting %filename%.png ...
	.Image2Skin\nvcompress.exe -color -bc3 -nomips -alpha "%Subfolder%\%filename%.png" "%Subfolder%\DDS\%filename%.dds">NUL
	title Image2Skin Converter TM2020
) ELSE (
	echo ERROR: %filename%.png was not found !
	set /A skipedfiles+=1
)
rem #####################################################################################################
set filename=Wheels_CoatR

IF EXIST "%Subfolder%\%filename%.png" (
	title Converting %filename%.png ...
	echo Converting %filename%.png ...
	.Image2Skin\nvcompress.exe -color -bc1 -nomips "%Subfolder%\%filename%.png" "%Subfolder%\DDS\%filename%.dds">NUL
	title Image2Skin Converter TM2020
) ELSE (
	echo ERROR: %filename%.png was not found !
	set /A skipedfiles+=1
)
rem #####################################################################################################
set filename=Details_AO

IF EXIST "%Subfolder%\%filename%.png" (
	title Converting %filename%.png ...
	echo Converting %filename%.png ...
	.Image2Skin\nvcompress.exe -color -bc1 -nomips "%Subfolder%\%filename%.png" "%Subfolder%\DDS\%filename%.dds">NUL
	title Image2Skin Converter TM2020
) ELSE (
	echo ERROR: %filename%.png was not found !
	set /A skipedfiles+=1
)
rem #####################################################################################################
set filename=Details_B

IF EXIST "%Subfolder%\%filename%.png" (
	title Converting %filename%.png ...
	echo Converting %filename%.png ...
	.Image2Skin\nvcompress.exe -color -bc1 -nomips "%Subfolder%\%filename%.png" "%Subfolder%\DDS\%filename%.dds">NUL
	title Image2Skin Converter TM2020
) ELSE (
	echo ERROR: %filename%.png was not found !
	set /A skipedfiles+=1
)
rem #####################################################################################################
set filename=Details_DirtMask

IF EXIST "%Subfolder%\%filename%.png" (
	title Converting %filename%.png ...
	echo Converting %filename%.png ...
	.Image2Skin\nvcompress.exe -color -bc1 -nomips "%Subfolder%\%filename%.png" "%Subfolder%\DDS\%filename%.dds">NUL
	title Image2Skin Converter TM2020
) ELSE (
	echo ERROR: %filename%.png was not found !
	set /A skipedfiles+=1
)
rem #####################################################################################################
set filename=Details_I

IF EXIST "%Subfolder%\%filename%.png" (
	title Converting %filename%.png ...
	echo Converting %filename%.png ...
	.Image2Skin\nvcompress.exe -color -bc3 -nomips -alpha "%Subfolder%\%filename%.png" "%Subfolder%\DDS\%filename%.dds">NUL
	title Image2Skin Converter TM2020
) ELSE (
	echo ERROR: %filename%.png was not found !
	set /A skipedfiles+=1
)
rem #####################################################################################################
set filename=Details_N

IF EXIST "%Subfolder%\%filename%.png" (
	title Converting %filename%.png ...
	echo Converting %filename%.png ...
	.Image2Skin\nvcompress.exe -color -bc5 -nomips -normal "%Subfolder%\%filename%.png" "%Subfolder%\DDS\%filename%.dds">NUL
	title Image2Skin Converter TM2020
) ELSE (
	echo ERROR: %filename%.png was not found !
	set /A skipedfiles+=1
)
rem #####################################################################################################
set filename=Details_R

IF EXIST "%Subfolder%\%filename%.png" (
	title Converting %filename%.png ...
	echo Converting %filename%.png ...
	.Image2Skin\nvcompress.exe -color -bc5 -nomips "%Subfolder%\%filename%.png" "%Subfolder%\DDS\%filename%.dds">NUL
	title Image2Skin Converter TM2020
) ELSE (
	echo ERROR: %filename%.png was not found !
	set /A skipedfiles+=1
)
rem #####################################################################################################
set filename=Details_CoatR

IF EXIST "%Subfolder%\%filename%.png" (
	title Converting %filename%.png ...
	echo Converting %filename%.png ...
	.Image2Skin\nvcompress.exe -color -bc1 -nomips "%Subfolder%\%filename%.png" "%Subfolder%\DDS\%filename%.dds">NUL
	title Image2Skin Converter TM2020
) ELSE (
	echo ERROR: %filename%.png was not found !
	set /A skipedfiles+=1
)
rem #####################################################################################################
set filename=Skin_AO

IF EXIST "%Subfolder%\%filename%.png" (
	title Converting %filename%.png ...
	echo Converting %filename%.png ...
	.Image2Skin\nvcompress.exe -color -bc1 -nomips "%Subfolder%\%filename%.png" "%Subfolder%\DDS\%filename%.dds">NUL
	title Image2Skin Converter TM2020
) ELSE (
	echo ERROR: %filename%.png was not found !
	set /A skipedfiles+=1
)
rem #####################################################################################################
set filename=Skin_B

IF EXIST "%Subfolder%\%filename%.png" (
	title Converting %filename%.png ...
	echo Converting %filename%.png ...
	.Image2Skin\nvcompress.exe -color -bc1 -nomips "%Subfolder%\%filename%.png" "%Subfolder%\DDS\%filename%.dds">NUL
	title Image2Skin Converter TM2020
) ELSE (
	echo ERROR: %filename%.png was not found !
	set /A skipedfiles+=1
)
rem #####################################################################################################
set filename=Skin_DirtMask

IF EXIST "%Subfolder%\%filename%.png" (
	title Converting %filename%.png ...
	echo Converting %filename%.png ...
	.Image2Skin\nvcompress.exe -color -bc1 -nomips "%Subfolder%\%filename%.png" "%Subfolder%\DDS\%filename%.dds">NUL
	title Image2Skin Converter TM2020
) ELSE (
	echo ERROR: %filename%.png was not found !
	set /A skipedfiles+=1
)
rem #####################################################################################################
set filename=Skin_I

IF EXIST "%Subfolder%\%filename%.png" (
	title Converting %filename%.png ...
	echo Converting %filename%.png ...
	.Image2Skin\nvcompress.exe -color -bc3 -nomips -alpha "%Subfolder%\%filename%.png" "%Subfolder%\DDS\%filename%.dds">NUL
	title Image2Skin Converter TM2020
) ELSE (
	echo ERROR: %filename%.png was not found !
	set /A skipedfiles+=1
)
rem #####################################################################################################
set filename=Skin_N

IF EXIST "%Subfolder%\%filename%.png" (
	title Converting %filename%.png ...
	echo Converting %filename%.png ...
	.Image2Skin\nvcompress.exe -color -bc5 -nomips -normal "%Subfolder%\%filename%.png" "%Subfolder%\DDS\%filename%.dds">NUL
	title Image2Skin Converter TM2020
) ELSE (
	echo ERROR: %filename%.png was not found !
	set /A skipedfiles+=1
)
rem #####################################################################################################
set filename=Skin_R

IF EXIST "%Subfolder%\%filename%.png" (
	title Converting %filename%.png ...
	echo Converting %filename%.png ...
	.Image2Skin\nvcompress.exe -color -bc5 -nomips "%Subfolder%\%filename%.png" "%Subfolder%\DDS\%filename%.dds">NUL
	title Image2Skin Converter TM2020
) ELSE (
	echo ERROR: %filename%.png was not found !
	set /A skipedfiles+=1
)
rem #####################################################################################################
set filename=Skin_CoatR

IF EXIST "%Subfolder%\%filename%.png" (
	title Converting %filename%.png ...
	echo Converting %filename%.png ...
	.Image2Skin\nvcompress.exe -color -bc1 -nomips "%Subfolder%\%filename%.png" "%Subfolder%\DDS\%filename%.dds">NUL
	title Image2Skin Converter TM2020
) ELSE (
	echo ERROR: %filename%.png was not found !
	set /A skipedfiles+=1
)
rem #####################################################################################################
set filename=Glass_AO

IF EXIST "%Subfolder%\%filename%.png" (
	title Converting %filename%.png ...
	echo Converting %filename%.png ...
	.Image2Skin\nvcompress.exe -color -bc1 -nomips "%Subfolder%\%filename%.png" "%Subfolder%\DDS\%filename%.dds">NUL
	title Image2Skin Converter TM2020
) ELSE (
	echo ERROR: %filename%.png was not found !
	set /A skipedfiles+=1
)
rem #####################################################################################################
set filename=Glass_B

IF EXIST "%Subfolder%\%filename%.png" (
	title Converting %filename%.png ...
	echo Converting %filename%.png ...
	.Image2Skin\nvcompress.exe -color -bc1 -nomips "%Subfolder%\%filename%.png" "%Subfolder%\DDS\%filename%.dds">NUL
	title Image2Skin Converter TM2020
) ELSE (
	echo ERROR: %filename%.png was not found !
	set /A skipedfiles+=1
)
rem #####################################################################################################
set filename=Glass_DirtMask

IF EXIST "%Subfolder%\%filename%.png" (
	title Converting %filename%.png ...
	echo Converting %filename%.png ...
	.Image2Skin\nvcompress.exe -color -bc1 -nomips "%Subfolder%\%filename%.png" "%Subfolder%\DDS\%filename%.dds">NUL
	title Image2Skin Converter TM2020
) ELSE (
	echo ERROR: %filename%.png was not found !
	set /A skipedfiles+=1
)
rem #####################################################################################################
set filename=Glass_I

IF EXIST "%Subfolder%\%filename%.png" (
	title Converting %filename%.png ...
	echo Converting %filename%.png ...
	.Image2Skin\nvcompress.exe -color -bc3 -nomips -alpha "%Subfolder%\%filename%.png" "%Subfolder%\DDS\%filename%.dds">NUL
	title Image2Skin Converter TM2020
) ELSE (
	echo ERROR: %filename%.png was not found !
	set /A skipedfiles+=1
)
rem #####################################################################################################
set filename=Glass_N

IF EXIST "%Subfolder%\%filename%.png" (
	title Converting %filename%.png ...
	echo Converting %filename%.png ...
	.Image2Skin\nvcompress.exe -color -bc5 -nomips -normal "%Subfolder%\%filename%.png" "%Subfolder%\DDS\%filename%.dds">NUL
	title Image2Skin Converter TM2020
) ELSE (
	echo ERROR: %filename%.png was not found !
	set /A skipedfiles+=1
)
rem #####################################################################################################
set filename=Glass_R

IF EXIST "%Subfolder%\%filename%.png" (
	title Converting %filename%.png ...
	echo Converting %filename%.png ...
	.Image2Skin\nvcompress.exe -color -bc5 -nomips "%Subfolder%\%filename%.png" "%Subfolder%\DDS\%filename%.dds">NUL
	title Image2Skin Converter TM2020
) ELSE (
	echo ERROR: %filename%.png was not found !
	set /A skipedfiles+=1
)
rem #####################################################################################################
set filename=Glass_CoatR

IF EXIST "%Subfolder%\%filename%.png" (
	title Converting %filename%.png ...
	echo Converting %filename%.png ...
	.Image2Skin\nvcompress.exe -color -bc1 -nomips "%Subfolder%\%filename%.png" "%Subfolder%\DDS\%filename%.dds">NUL
	title Image2Skin Converter TM2020
) ELSE (
	echo ERROR: %filename%.png was not found !
	set /A skipedfiles+=1
)
rem #####################################################################################################
set filename=Icon

IF EXIST "%Subfolder%\%filename%.png" (
	title Converting %filename%.png ...
	echo Converting %filename%.png ...
	.Image2Skin\png2tga.exe -i "%Subfolder%\%filename%.png" -o "%Subfolder%\DDS">NUL
	title Image2Skin Converter TM2020
) ELSE (
	echo ERROR: %filename%.png was not found !
	set set /A skipedfiles+=1
)
rem #####################################################################################################


if "%skipedfiles%"=="28" (
	title ERROR
	echo ##############################################################################
	echo # ERROR: Folder was empty. Call me again if you have real work for me, bye!  #
	echo ##############################################################################
	timeout 5 /nobreak>NUL
	exit
)
rem trim full path to last subfolders
set MYDIR=%Subfolder%\
set MYDIR1=%MYDIR:~0,-1%
for %%f in (%MYDIR1%) do set zipname=%%~nxf

timeout 3 /nobreak>NUL
rem creating ziped folder 
title Creating %zipname%.zip ...
echo Creating %zipname%.zip ...
%CD%\.Image2Skin\7z.exe a "%zipname%.zip" "%Subfolder%\DDS\*">NUL
title Image2Skin Converter TM2020
timeout 3 /nobreak>NUL


rem reading filesize of zip
set "file=%CD%\%zipname%.zip"
for %%A in (%file%) do SET zipsize=%%~zA
set /a kb=%zipsize% / 1024
set /a mb=%zipsize% / 1048576
set /a gb=%zipsize% / 1073741824



rem check for TM folder exist or use custom path via Image2Skin.cfg
IF exist "%cd%\.Image2Skin\Image2Skin.cfg" (
	set /p TMPath= <Image2Skin.cfg
	Set "copyfoldername=a custom"
	goto custompath
)


IF exist "%USERPROFILE%\Documents\Trackmania2020" (
	Set "copyfoldername=Trackmania2020"
	set "TMPath=%USERPROFILE%\Documents\Trackmania2020\Skins\Models\CarSport"
) ELSE (
	Set "copyfoldername=Trackmania"
	set "TMPath=%USERPROFILE%\Documents\Trackmania\Skins\Models\CarSport"
)
:custompath
rem copy skin.zip into Trackmania folder
title Copy %zipname%.zip into %copyfoldername% folder ...
echo Copy %zipname%.zip into %copyfoldername% folder ...
copy "%CD%\%zipname%.zip" "%TMPath%\%zipname%.zip">NUL
timeout 3 /nobreak>NUL
title Image2Skin Converter TM2020
echo Deleting old themp files ...
del "%CD%\%zipname%.zip">NUL


echo ##############################################################################
echo #                             Process Finished                               #
echo ##############################################################################
echo Skin Location: 
echo %TMPath%\%zipname%.zip
echo Skin Size: %mb% MB
pause

