REM This batch executes after jive.exe has compiled.
REM command line arguments:
REM %1 = configuration name (Debug or Release)

REM Copy all the script files into the target directory
cd..
cd..

md %1\lua
md %1\lua\applets
xcopy jive\share\applets\*.* %1\lua\applets\*.* /S/Y
xcopy jive_desktop\share\applets\*.* %1\lua\applets\*.* /S/Y

md %1\lua\jive
xcopy jive\share\jive\*.* %1\lua\jive\*.* /S/Y

md %1\lua\loop
xcopy loop-2.2-alpha\loop\*.* %1\lua\loop\*.* /S/Y

xcopy luasocket-2.0.1\src\socket.lua %1\lua /Y
xcopy luasocket-2.0.1\src\ltn12.lua %1\lua /Y
xcopy luasocket-2.0.1\src\mime.lua %1\lua /Y
xcopy lualogging-1.1.2\src\logging\logging.lua %1\lua /Y

md %1\lua\socket
xcopy luasocket-2.0.1\src\ftp.lua %1\lua\socket /Y
xcopy luasocket-2.0.1\src\http.lua %1\lua\socket /Y
xcopy luasocket-2.0.1\src\smtp.lua %1\lua\socket /Y
xcopy luasocket-2.0.1\src\tp.lua %1\lua\socket /Y
xcopy luasocket-2.0.1\src\url.lua %1\lua\socket /Y

md %1\fonts
xcopy freefont-20060126\*.ttf %1\fonts /Y

xcopy SDL_image-1.2.5\VisualC\graphics\lib\*.dll %1 /Y