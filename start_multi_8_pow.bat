
call ".\npm_install.bat"

:_minerstart
node send_multigpu_pow.js --api tonapi --gpu-count 8
goto _minerstart

pause