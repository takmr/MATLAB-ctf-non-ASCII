@setlocal enableextensions
@echo on
chcp 932

mkdir lib\FOOBAR
call mcc -W python:mylib -d lib\FOOBAR myfunc.m
call robocopy /E lib\FOOBAR "lib\�R�c���Y"

set PYTHONPATH=.\lib\FOOBAR
call python myprog.py

set "PYTHONPATH=.\lib\�R�c���Y"
call python myprog.py
