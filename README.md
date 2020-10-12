# MATLAB Compiler SDK cannot find the CTF archive in non-ASCII path

This sample works on Windows with CP932 (Japenese).

### Requires

- MATLAB Compilre SDK (`mcc` command)
- python 3.7

## Result

If the library is in the ASCII-only PATH, it works fine.

But if the library is in the non-ASCII PATH, `SystemError` will occur.

```cmd
C:\work\mbtest> test.cmd

chcp 932
現在のコード ページ: 932

...

set PYTHONPATH=.\lib\FOOBAR

call python myprog.py
[[0.0,0.0],[0.0,0.0],[0.0,0.0]]

set "PYTHONPATH=.\lib\山田太郎"

call python myprog.py
Traceback (most recent call last):
  File "myprog.py", line 3, in <module>
    obj = mylib.initialize()
  File "C:\work\mbtest\lib\山田太郎\mylib\__init__.py", line 305, in initialize
    return _pir.initialize_package()
  File "C:\work\mbtest\lib\山田太郎\mylib\__init__.py", line 253, in initialize_package
    package_handle.initialize()
  File "C:\Program Files\MATLAB\R2020a\toolbox\compiler_sdk\pysdk_py\matlab_pysdk\runtime\deployablepackage.py", line 33, in initialize
    mcr_handle = self.__cppext_handle.startMatlabRuntimeInstance(self.__ctf_path)
SystemError: CTF アーカイブ 'lib\������������\mylib\mylib.ctf' が見つかりません。
```
