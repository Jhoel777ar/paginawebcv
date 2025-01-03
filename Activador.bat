@echo off
title ARK OS - Sistema optimizado para pruebas y rendimiento avanzado
cls
echo ================================================================
echo                Bienvenido a ARK OS
echo Sistema optimizado para pruebas y rendimiento avanzado.
echo Desarrollado por Ark Dev.
echo ================================================================
echo.
echo Verificando conexión a Internet...

:check_internet
:: Pinging Google's public DNS server to check for internet connection
ping -n 1 8.8.8.8 >nul 2>nul
if errorlevel 1 (
    echo.
    echo No hay conexión a Internet. Por favor, conecta tu máquina a Internet.
    timeout /t 5 >nul
    goto check_internet
)

echo.
echo Conexión a Internet detectada.
echo.

:: Efecto de carga
echo Iniciando configuraciones avanzadas...

:: Spinner loop
for /l %%i in (1,1,20) do (
    setlocal enabledelayedexpansion
    set "spinner=/|\-"
    for %%s in (!spinner!) do (
        cls
        echo ================================================================
        echo                Bienvenido a ARK OS
        echo Sistema optimizado para pruebas y rendimiento avanzado.
        echo Desarrollado por Ark Dev.
        echo ================================================================
        echo.
        echo Iniciando configuraciones avanzadas... %%s
        timeout /t 1 >nul
    )
    endlocal
)

:: Ejecutando activador
echo.
echo Ejecutando activador...

slmgr /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX
slmgr /skms kms8.msguides.com
slmgr /ato

echo.
echo Activación completada. Presiona cualquier tecla para salir.
pause
