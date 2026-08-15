@echo off
echo Mathonsi Tech Creations - GitHub Pages deployment helper
echo.
where bash >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo Git Bash was not found in PATH.
    echo Open Git Bash in this repository and run:
    echo   bash setup-pages.sh
    pause
    exit /b 1
)
bash setup-pages.sh
pause
