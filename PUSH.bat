@echo off
chcp 65001 >nul
cd /d "%~dp0"
where git >nul 2>nul
if errorlevel 1 (
  echo Nie masz Gita. Zainstaluj: https://git-scm.com/download/win
  echo Potem uruchom ten plik jeszcze raz.
  pause
  exit /b 1
)
echo Wklej adres swojego repo, np. https://github.com/pingwinek337/zmianki.git
set /p REPO=Adres repo: 
if exist .git rmdir /s /q .git
git init -b main
git add -A
git -c user.name=autoreroll -c user.email=autoreroll@users.noreply.github.com commit -m "AutoReroll mod"
git remote add origin %REPO%
echo.
echo Zaloguj sie do GitHuba, gdy pojawi sie okno.
git push -u origin main --force
echo.
echo Gotowe. Wejdz na GitHub - zakladka Actions, a potem Releases.
pause
