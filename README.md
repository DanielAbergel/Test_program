## Test_program <img width="24" alt="הורד" src="https://user-images.githubusercontent.com/44754325/54364865-6e2c6800-4676-11e9-80af-7f98f70c2ec9.png"><br/>
### Description
A script that checks Compilation , Memory leaks , Thread race .<br/>
This script checks whether there is a makefile file in the directory given in the path.<br/>
If there is such a file,the program will execute the executable file <br/>(which receives the name of the executable file as an argument),<br/>
then checks for memory leak in the program, and finally checks the thread race.<br/>
### Run the Script.<br/>
1.clone the project . <br/>
2.go into the folder . <br/>
3.Run this command in the terminal<br/>
`BasicCheck.sh <dir path> <program> <arguments if needed>` <br/>
  `<dir path>` = The folder path.<br/>
  `<program>` = Executable file name.<br/>
  `<arguments if needed>` = arguments for the program.<br/>
 ####  Script output.
```
    Compilation   Memory leaks   thread race
     PASS/FAIL     PASS/FAIL      PASS/FAIL
 ```
 <br/>
 #### Exit code. <br/>
<br/> `PASS = 0 , FAIL = 1 `<br/>
 * 7 - Compilation fail.<br/>
 * 3 - Memory leak and thread race fail.<br/>
 * 2 - Memory leak fail.<br/>
 * 1 - thread race fail.<br/>
 
 
 

