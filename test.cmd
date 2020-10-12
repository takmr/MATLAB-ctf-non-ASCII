@setlocal enableextensions
@echo on
chcp 932

mkdir lib\FOOBAR
call mcc -W python:mylib -d lib\FOOBAR myfunc.m
call robocopy /E lib\FOOBAR "lib\山田太郎"

set PYTHONPATH=.\lib\FOOBAR
call python myprog.py

set "PYTHONPATH=.\lib\山田太郎"
call python myprog.py
