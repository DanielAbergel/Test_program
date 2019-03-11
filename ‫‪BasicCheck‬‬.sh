#!/bin/bash

folderName=$1 # foler path
executeble=$2 # the makefile output file name (a.out for example).
arguments=$3 # arguments for the program . 

currentLocation=`pwd`

cd "$folderName" # go into the folder path

make &> output.txt
secssesfullMake=$? # Checks whether the makefile has succeeded
if [[ "$secssesfullMake" -gt 0 ]]; then
echo -e '  Compilation    leaks‬‬ Memory      thread race' 
echo -e '     FAIL            FAIL              FAIL  ' 
rm output.txt
cd $currentLocation
exit 7
else 
Compile="PASS"
fi

valgrind --leak-check=full --error-exitcode=1  ./"$executeble" $arguments &> output.txt
valgrind=$? # Checks whether the valgrind(memo check) has succeeded
if [[ "$valgrind" -gt 0 ]]; then
valgrindVar="FAIL"
valgrind=1
else
valgrindVar="PASS"
fi

valgrind --tool=helgrind --error-exitcode=1 ./"$executeble" $arguments  &> output.txt
helgrind=$? # Checks whether the helgrind(race check) has succeeded
if [[ "$helgrind" -gt 0 ]]; then
threadrace="FAIL"
helgrind=1
else
threadrace="PASS"
fi

echo -e '  Compilation    leaks‬‬ Memory      thread race' 
echo    "     $Compile            $valgrindVar              $threadrace" #program out put

exitnumber="$((2#$secssesfullMake$valgrind$helgrind))" # https://unix.stackexchange.com/questions/65280/binary-to-hexadecimal-and-decimal-in-a-shell-script Binary2Decimal
rm output.txt
cd $currentLocation
exit "$exitnumber"
