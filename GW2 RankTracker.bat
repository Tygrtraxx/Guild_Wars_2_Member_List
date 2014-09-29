@echo off>templist.txt & setlocal EnableDelayedExpansion
color 0b
::By Tygrtraxx
::Edited by nbrane

::-----------------------------------------------------------------
::-Ask the user to enter their name-
::-----------------------------------------------------------------

set /p wantname=Do you want to add a name? (Y/N)
if /i {%wantname%}=={y} (goto :yes)
if /i {%wantname%}=={n} (goto :next)

::-----------------------------------------------------------------
::-If the answer was yes, enter a name and it will be added to the list-
::-----------------------------------------------------------------

:yes
set /p name=Enter a name:
echo 0 days %name%>>list.txt
goto :next

::-----------------------------------------------------------------
::-Ask the user if they want to add a day to everyones total day(s)-
::-----------------------------------------------------------------

:next
set /p add=Do you want to add a day to everyone? (Y/N)
::-----------------------------------------------------------------
::-If the answer is yes, add a day to everyone, otherwise show them the list-
::-----------------------------------------------------------------

if /i {%add%}=={y} (goto :yess)
if /i {%add%}=={n} (goto :list)

:yess
::-----------------------------------------------------------------
::-This adds 1 to the original total of everyones days and copys it to a temporary file.-
::-----------------------------------------------------------------

for /F "tokens=1*" %%a in (list.txt) do (
set /a originaltotal=%%a+1
echo !originaltotal! %%b>>templist.txt
)
::-----------------------------------------------------------------
::-Setup the arrays and assign the numbers and account names in different arrays-
::-----------------------------------------------------------------

copy /y templist.txt list.txt
set i=0
for /f "tokens=1*" %%a in (list.txt) do (
set /a i+=1
set A1[!i!]=%%a
set A2[!i!]=%%b
)

::-----------------------------------------------------------------
::-Display the variables and their values after combining both arrays-
::-----------------------------------------------------------------
:list
for /L %%a in (1 1 %i%) do (
echo !A1[%%a]! = !A2[%%a]!
)
del templist.txt
cls
type list.txt
pause
goto :eof