@echo off
title Enviar Quiz Pilates para o GitHub
echo ====================================================
echo        ENVIANDO ARQUIVOS PARA O GITHUB
echo ====================================================
echo Repositorio: https://github.com/pedroloenz-alt/PilatesParede
echo.

set "PATH=C:\Users\pedro\mingit\cmd;C:\Users\pedro\mingit\mingw64\bin;%PATH%"
cd /d "C:\Users\pedro\.gemini\antigravity\scratch\clone"

echo Verificando status dos arquivos...
git status
echo.
echo Enviando para a branch main do GitHub...
echo (Se abrir uma janela no navegador, clique em 'Authorize' para autenticar sua conta pedroloenz-alt)
echo.

git push -u origin main

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ====================================================
    echo   SUCESSO! Todos os arquivos estao no seu GitHub:
    echo   https://github.com/pedroloenz-alt/PilatesParede
    echo ====================================================
) else (
    echo.
    echo ====================================================
    echo   Nao foi possivel autenticar automaticamente.
    echo   Se preferir, voce pode gerar um Personal Access Token
    echo   no GitHub e colar no chat para eu subir para voce!
    echo ====================================================
)

echo.
pause
