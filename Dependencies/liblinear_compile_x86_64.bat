IF EXIST "C:\Program Files (x86)\Microsoft Visual Studio 12.0\VC\bin\amd64\vcvars64.bat" (
	echo "Using native 64-bit compiler"
	CALL "C:\Program Files (x86)\Microsoft Visual Studio 12.0\VC\bin\amd64\vcvars64.bat"
) ELSE (
	echo "Using 32-bit compiler to compile x64 target"
	CALL "C:\Program Files (x86)\Microsoft Visual Studio 12.0\VC\bin\x86_amd64\vcvarsx86_amd64.bat"
)

SET TARGET="windows_x86_64"

del /s /q /f *.obj
del /s /q /f %TARGET%\*.lib

if not exist .\%TARGET% mkdir %TARGET%

CL.exe /c /GL /EHsc /MD /D _WIN64 /D _CRT_SECURE_NO_DEPRECATE /O2 linear.cpp tron.cpp blas\*.c
LIB.exe /LTCG /NOLOGO /OUT:%TARGET%\liblinear.lib *.obj


