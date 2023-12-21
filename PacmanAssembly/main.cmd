@echo off 
set "SCRIPT_DIR=%~dp0"
set "ROOT_DIR=%SCRIPT_DIR%..\..\.."
set "NASM=%ROOT_DIR%\nasm\nasm" 
set "BIN_DIR=%ROOT_DIR%\bin" 

"%NASM%" main.asm -f bin -o "%BIN_DIR%\main.com"

pause 
  