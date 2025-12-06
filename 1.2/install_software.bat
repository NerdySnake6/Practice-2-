@echo off
chcp 65001 >nul

echo ============================================
echo Скрипт автоматизации установки ПО
echo Для компьютерных аудиторий кафедры ИТиЭО
echo ============================================
echo.

:: Проверка прав администратора
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo ОШИБКА: Требуются права администратора!
    echo Запустите скрипт от имени администратора.
    pause
    exit /b 1
)

echo Проверка прав администратора... УСПЕХ
echo.

:: Установка Chocolatey
echo Установка менеджера пакетов Chocolatey...
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
if %errorlevel% neq 0 (
    echo ОШИБКА: Не удалось установить Chocolatey
    pause
    exit /b 1
)
echo Chocolatey установлен успешно!
echo.

:: Установка пакетов через Chocolatey
echo ============================================
echo Установка пакетов через Chocolatey
echo ============================================
echo.

echo Установка Visual Studio Code...
choco install vscode -y || echo Ошибка установки vscode

echo Установка Docker Desktop...
choco install docker-desktop -y || echo Ошибка установки docker

echo Установка PyCharm Community...
choco install pycharm-community -y || echo Ошибка установки pycharm

echo Установка Git...
choco install git -y || echo Ошибка установки git

echo Установка GitHub Desktop...
choco install github-desktop -y || echo Ошибка установки github desktop

echo Установка Maxima...
choco install maxima -y || echo Ошибка установки maxima

echo Установка GIMP...
choco install gimp -y || echo Ошибка установки gimp

echo Установка Julia...
choco install julia -y || echo Ошибка установки julia

echo Установка Python...
choco install python -y || echo Ошибка установки python

echo Установка Rust...
choco install rust -y || echo Ошибка установки rust

echo Установка MSYS2...
choco install msys2 -y || echo Ошибка установки msys2

echo Установка Zettlr...
choco install zettlr -y || echo Ошибка установки zettlr

echo Установка MiKTeX...
choco install miktex -y || echo Ошибка установки miktex

echo Установка TeXstudio...
choco install texstudio -y || echo Ошибка установки texstudio

echo Установка Anaconda3...
choco install anaconda3 -y || echo Ошибка установки anaconda

echo Установка Far Manager...
choco install far -y || echo Ошибка установки far manager

echo Установка SumatraPDF...
choco install sumatrapdf -y || echo Ошибка установки sumatrapdf

echo Установка Google Chrome...
choco install googlechrome -y || echo Ошибка установки chrome

echo Установка Flameshot...
choco install flameshot -y || echo Ошибка установки flameshot

echo Установка Qalculate...
choco install qalculate -y || echo Ошибка установки qalculate

echo Установка 7-Zip...
choco install 7zip -y || echo Ошибка установки 7zip

echo Установка Firefox...
choco install firefox -y || echo Ошибка установки firefox

echo Установка Microsoft Edge...
choco install microsoft-edge -y || echo Ошибка установки microsoft-edge

echo.
echo Установка через Chocolatey завершена!
echo.

:: Установка WSL 2 и Ubuntu
echo ============================================
echo Установка WSL 2 и дистрибутивов Ubuntu
echo ============================================
echo.

echo Включение компонента WSL...
powershell -Command "Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -NoRestart" || echo Ошибка включения WSL

echo Установка WSL 2 с Ubuntu 22.04...
wsl --install -d Ubuntu-22.04 || echo Ошибка установки Ubuntu 22.04

echo Установка Ubuntu 24.04...
wsl --install -d Ubuntu-24.04 || echo Ошибка установки Ubuntu 24.04

echo.
echo Установка WSL завершена!
echo.

:: Установка расширений для VS Code
echo ============================================
echo Установка расширений для VS Code
echo ============================================
echo.

echo Ожидание установки VS Code...
timeout /t 10 /nobreak >nul

echo Установка расширения Python...
code --install-extension ms-python.python || echo Ошибка установки расширения python

echo Установка расширения C/C++...
code --install-extension ms-vscode.cpptools || echo Ошибка установки расширения C/C++

echo Установка расширения Docker...
code --install-extension ms-azuretools.vscode-docker || echo Ошибка установки расширения docker

echo Установка расширения HTML/CSS...
code --install-extension ecmel.vscode-html-css || echo Ошибка установки расширения HTML/CSS

echo Установка расширения JavaScript...
code --install-extension xabikos.JavaScriptSnippets || echo Ошибка установки расширения JS

echo.
echo Установка расширений завершена!
echo.

echo ============================================
echo ВНИМАНИЕ!
echo ============================================
echo.
echo Некоторые программы не были установлены:
echo 1. KNIME Analytics Platform - нет в Chocolatey
echo 2. Arc Browser - требуется ручная установка
echo 3. Yandex Browser - проблемы с сервером в Chocolatey
echo 4. Sber Jazz - нет в Chocolatey
echo 5. Яндекс.Телемост - нет в Chocolatey
echo.
echo Для аудитории 313 требуется дополнительно установить:
echo - Ramus Educational
echo - ARIS EXPRESS  
echo - Archi
echo.
echo ============================================
echo Установка завершена!
echo Рекомендуется перезагрузить компьютер.
echo ============================================
echo.

pause