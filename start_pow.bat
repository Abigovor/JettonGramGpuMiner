
call ".\npm_install.bat"

:_minerstart
node send_pow.js --api tonapi
goto _minerstart

pause