@echo off
title Mantenimiento Pro de Windows - Ark Dev Solutions
color 0A

:: Verificar privilegios administrativos
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Este script requiere privilegios administrativos.
    echo Por favor, ejecutalo como administrador.
    pause
    exit /b
)

:: Crear carpeta para logs
if not exist "C:\MantenimientoLogs" mkdir "C:\MantenimientoLogs"
set "LOG=C:\MantenimientoLogs\Log_%DATE:~-4%%DATE:~3,2%%DATE:~0,2%_%TIME:~0,2%%TIME:~3,2%.txt"
echo Iniciando mantenimiento - %DATE% %TIME% > %LOG%

:INICIO
cls
echo                       @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                       
echo                        @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                         
echo                         @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                          
echo                           @@@@@@@          @@@@@@@ @@@@@@@           @@@@@@@                           
echo                            @@@@@@@        @@@@@@@   @@@@@@@@        @@@@@@@                            
echo                             @@@@@@@@@@@@@@@@@@@@      @@@@@@@@@@@@@@@@@@@                              
echo                              @@@@@@@@@@@@@@@@@@        @@@@@@@@@@@@@@@@@                               
echo                                @@@@@@@@@@@@@@           @@@@@@@@@@@@@@@                                
echo                                                                                                        
echo                                            @@@@@@@@@@@@@@@@                                            
echo                                             @@@@@@@@@@@@@@                                             
echo                                     @@@@@@@@ @@@@@@@@@@@@ @@@@@@@@                                     
echo                                      @@@@@@@@ @@@@@@@@@@ @@@@@@@                                       
echo                                        @@@@@@@ @@@@@@@ @@@@@@@@                                        
echo                                         @@@@@@@@ @@@@ @@@@@@@@                                         
echo                                          @@@@@@@@ @@ @@@@@@@                                           
echo                                            @@@@@@@  @@@@@@@                                            
echo                                             @@@@@@@@@@@@@@                                             
echo                                              @@@@@@@@@@@                                               
echo                                                @@@@@@@@                                                
echo                                                 @@@@@                                                  
echo                                                  @@@                                                   
echo                                                                                                        
echo @@@@@@@@@@@@@@@  @@@@@@@@@@@@@@  @@@       @@@@         @@@@@@@@@@@@@@@  @@@@@@@@@@@@@@  @@@         @@@
echo  @@@@@@@@@@@@@   @@@@@@@@@@@@@@  @@@     @@@@@           @@@@@@@@@@@@@@  @@@@@@@@@@@@@@  @@@         @@@
echo                             @@@  @@@   @@@@@                        @@@                  @@@         @@@
echo @@@@@@@@@@@@@@@  @@@@@@@@@@@@@@  @@@  @@@@              @@@         @@@  @@@@@@@@@@@@@@  @@@         @@@
echo @@@         @@@  @@@   @@@@@     @@@   @@@@@            @@@         @@@                  @@@         @@@
echo @@@         @@@  @@@     @@@@@   @@@     @@@@@          @@@@@@@@@@@@@@@  @@@@@@@@@@@@@@  @@@@@@@@@@@@@@@
echo @@@         @@@  @@@       @@@@  @@@       @@@@@        @@@@@@@@@@@@@@    @@@@@@@@@@@@   @@@@@@@@@@@@@@ 
echo.
echo ARK DEV SOLUTIONS  --------^<^>Suport: arkdev.pages.dev/nosotros
echo V.3.1 Ultra Pro
echo Verificando sistema...

:: Detectar versión de Windows
for /f "tokens=3" %%a in ('systeminfo ^| findstr /C:"Nombre del SO"') do set "OSName=%%a %%b"
if "%OSName%"=="Microsoft Windows 10" (
    echo Sistema operativo: Windows 10
    set "OS=10"
) else if "%OSName%"=="Microsoft Windows 11" (
    echo Sistema operativo: Windows 11
    set "OS=11"
) else (
    echo Sistema operativo no reconocido.
    set "OS=Desconocido"
)
echo Sistema detectado: %OSName% >> %LOG%
timeout /t 2 >nul

:MENU_PRINCIPAL
cls
echo ===========================================================================
echo MANTENIMIENTO ULTRA PRO DE WINDOWS - ARK DEV SOLUTIONS
echo Sistema operativo detectado: %OSName%
echo ===========================================================================
echo Selecciona una categoria:
echo 1. Examen y reparacion del sistema
echo 2. Actualizaciones y optimizacion
echo 3. Seguridad y limpieza
echo 4. Diagnostico de hardware y red
echo 5. Gestion de aplicaciones y registro
echo 6. Solucion de problemas especificos
echo 7. Crear punto de restauracion
echo 8. Generar informe de mantenimiento
echo 9. Analisis de eventos del sistema
echo 10. Optimizacion de almacenamiento
echo 11. Reparacion de aplicaciones de Store
echo 12. Verificacion de controladores
echo 13. Salir
echo ===========================================================================
set /p opcion="Ingresa tu eleccion (1-13): "

if "%opcion%"=="1" goto EXAMEN_REPARACION
if "%opcion%"=="2" goto ACTUALIZACIONES_OPTIMIZACION
if "%opcion%"=="3" goto SEGURIDAD_LIMPIEZA
if "%opcion%"=="4" goto DIAGNOSTICO_HARDWARE_RED
if "%opcion%"=="5" goto GESTION_APLICACIONES_REGISTRO
if "%opcion%"=="6" goto SOLUCION_PROBLEMAS_ESPECIFICOS
if "%opcion%"=="7" goto CREAR_PUNTO_RESTAURACION
if "%opcion%"=="8" goto GENERAR_INFORME
if "%opcion%"=="9" goto ANALISIS_EVENTOS
if "%opcion%"=="10" goto OPTIMIZACION_ALMACENAMIENTO
if "%opcion%"=="11" goto REPARACION_APPS_STORE
if "%opcion%"=="12" goto VERIFICACION_CONTROLADORES
if "%opcion%"=="13" goto FIN
echo Opcion no valida. Intenta de nuevo.
timeout /t 2 >nul
goto MENU_PRINCIPAL

:EXAMEN_REPARACION
cls
echo ===========================================================================
echo Examen y reparacion del sistema
echo ===========================================================================
echo 1. Verificar integridad con SFC
echo 2. Reparar con DISM (Salud del sistema)
echo 3. Verificar errores de disco con CHKDSK
echo 4. Reparar componentes de Windows
echo 5. Verificar memoria RAM con Diagnostico de Windows
echo 6. Volver al menu principal
set /p subopcion="Ingresa tu eleccion (1-6): "

if "%subopcion%"=="1" (
    echo Preparando SFC /scannow...
    set /p confirm="Confirmar? (1=Si, 2=No): "
    if "%confirm%"=="1" (
        start cmd /k "sfc /scannow && echo SFC completado. >> %LOG% && echo SFC completado. && pause && exit"
        echo SFC iniciado en nueva ventana. >> %LOG%
        echo SFC iniciado. Revisa la ventana secundaria.
    ) else (
        echo SFC cancelado. >> %LOG%
        echo SFC cancelado.
    )
    pause
    goto EXAMEN_REPARACION
)
if "%subopcion%"=="2" (
    echo Preparando DISM /Online /Cleanup-Image /RestoreHealth...
    set /p confirm="Confirmar? (1=Si, 2=No): "
    if "%confirm%"=="1" (
        start cmd /k "DISM /Online /Cleanup-Image /RestoreHealth && echo DISM completado. >> %LOG% && echo DISM completado. && pause && exit"
        echo DISM iniciado en nueva ventana. >> %LOG%
        echo DISM iniciado. Revisa la ventana secundaria.
    ) else (
        echo DISM cancelado. >> %LOG%
        echo DISM cancelado.
    )
    pause
    goto EXAMEN_REPARACION
)
if "%subopcion%"=="3" (
    echo Preparando CHKDSK /f /r (requiere reinicio)...
    set /p confirm="Confirmar? (1=Si, 2=No): "
    if "%confirm%"=="1" (
        start cmd /k "chkdsk C: /f /r && echo CHKDSK programado. >> %LOG% && echo CHKDSK programado. Reinicia el sistema. && pause && exit"
        echo CHKDSK iniciado en nueva ventana. >> %LOG%
        echo CHKDSK iniciado. Revisa la ventana secundaria.
    ) else (
        echo CHKDSK cancelado. >> %LOG%
        echo CHKDSK cancelado.
    )
    pause
    goto EXAMEN_REPARACION
)
if "%subopcion%"=="4" (
    echo Preparando reparacion de componentes con DISM...
    set /p confirm="Confirmar? (1=Si, 2=No): "
    if "%confirm%"=="1" (
        start cmd /k "DISM /Online /Cleanup-Image /StartComponentCleanup && echo Reparacion completada. >> %LOG% && echo Reparacion completada. && pause && exit"
        echo Reparacion iniciada en nueva ventana. >> %LOG%
        echo Reparacion iniciada. Revisa la ventana secundaria.
    ) else (
        echo Reparacion cancelada. >> %LOG%
        echo Reparacion cancelada.
    )
    pause
    goto EXAMEN_REPARACION
)
if "%subopcion%"=="5" (
    echo Preparando Diagnostico de Memoria de Windows...
    set /p confirm="Confirmar? (1=Si, 2=No): "
    if "%confirm%"=="1" (
        start cmd /k "MdSched.exe && echo Diagnostico programado. >> %LOG% && echo Reinicia el sistema para ejecutar el diagnostico. && pause && exit"
        echo Diagnostico iniciado en nueva ventana. >> %LOG%
        echo Diagnostico iniciado. Revisa la ventana secundaria.
    ) else (
        echo Diagnostico cancelado. >> %LOG%
        echo Diagnostico cancelado.
    )
    pause
    goto EXAMEN_REPARACION
)
if "%subopcion%"=="6" goto MENU_PRINCIPAL
echo Opcion no valida.
timeout /t 2 >nul
goto EXAMEN_REPARACION

:ACTUALIZACIONES_OPTIMIZACION
cls
echo ===========================================================================
echo Actualizaciones y optimizacion
echo ===========================================================================
echo 1. Verificar actualizaciones de Windows
echo 2. Actualizar aplicaciones con Winget
echo 3. Optimizar arranque (deshabilitar apps de inicio)
echo 4. Desfragmentar disco (solo HDD)
echo 5. Resetear configuracion de energia
echo 6. Optimizar servicios de Windows
echo 7. Limpiar actualizaciones fallidas
echo 8. Volver al menu principal
set /p subopcion="Ingresa tu eleccion (1-8): "

if "%subopcion%"=="1" (
    echo Preparando verificacion de actualizaciones...
    set /p confirm="Confirmar? (1=Si, 2=No): "
    if "%confirm%"=="1" (
        start cmd /k "usoclient StartScan && echo Verifica manualmente Windows Update. >> %LOG% && echo Verifica Windows Update para instalar actualizaciones. && pause && exit"
        echo Actualizaciones iniciadas en nueva ventana. >> %LOG%
        echo Actualizaciones iniciadas. Revisa la ventana secundaria.
    ) else (
        echo Actualizaciones canceladas. >> %LOG%
        echo Actualizaciones canceladas.
    )
    pause
    goto ACTUALIZACIONES_OPTIMIZACION
)
if "%subopcion%"=="2" (
    echo Preparando actualizacion con Winget...
    set /p confirm="Confirmar? (1=Si, 2=No): "
    if "%confirm%"=="1" (
        start cmd /k "winget upgrade --all && echo Actualizacion completada. >> %LOG% && echo Actualizacion completada. && pause && exit"
        echo Winget iniciado en nueva ventana. >> %LOG%
        echo Winget iniciado. Revisa la ventana secundaria.
    ) else (
        echo Actualizacion cancelada. >> %LOG%
        echo Actualizacion cancelada.
    )
    pause
    goto ACTUALIZACIONES_OPTIMIZACION
)
if "%subopcion%"=="3" (
    echo Gestionando aplicaciones de inicio...
    set /p confirm="Deshabilitar apps innecesarias (excepto Defender)? (1=Si, 2=No): "
    if "%confirm%"=="1" (
        for /f "tokens=1,2" %%a in ('wmic startup get caption^,command ^| findstr /V "Windows Defender"') do (
            reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "%%a" /f 2>nul
            reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "%%a" /f 2>nul
        )
        echo Apps de inicio deshabilitadas (excepto Defender). >> %LOG%
        echo Apps deshabilitadas.
    ) else (
        echo Apps no modificadas. >> %LOG%
        echo Apps no modificadas.
    )
    pause
    goto ACTUALIZACIONES_OPTIMIZACION
)
if "%subopcion%"=="4" (
    echo Preparando desfragmentacion de disco...
    set /p confirm="Confirmar? (1=Si, 2=No): "
    if "%confirm%"=="1" (
        start cmd /k "defrag C: /O && echo Desfragmentacion completada. >> %LOG% && echo Desfragmentacion completada. && pause && exit"
        echo Desfragmentacion iniciada en nueva ventana. >> %LOG%
        echo Desfragmentacion iniciada. Revisa la ventana secundaria.
    ) else (
        echo Desfragmentacion cancelada. >> %LOG%
        echo Desfragmentacion cancelada.
    )
    pause
    goto ACTUALIZACIONES_OPTIMIZACION
)
if "%subopcion%"=="5" (
    echo Preparando reset de configuracion de energia...
    set /p confirm="Confirmar? (1=Si, 2=No): "
    if "%confirm%"=="1" (
        start cmd /k "powercfg -restoredefaultschemes && echo Configuracion reseteada. >> %LOG% && echo Configuracion reseteada. && pause && exit"
        echo Reset iniciado en nueva ventana. >> %LOG%
        echo Reset iniciado. Revisa la ventana secundaria.
    ) else (
        echo Reset cancelado. >> %LOG%
        echo Reset cancelado.
    )
    pause
    goto ACTUALIZACIONES_OPTIMIZACION
)
if "%subopcion%"=="6" (
    echo Preparando optimizacion de servicios...
    set /p confirm="Confirmar? (1=Si, 2=No): "
    if "%confirm%"=="1" (
        start cmd /k "sc config wuauserv start= demand && echo Servicios optimizados. >> %LOG% && echo Servicios optimizados. && pause && exit"
        echo Optimizacion iniciada en nueva ventana. >> %LOG%
        echo Optimizacion iniciada. Revisa la ventana secundaria.
    ) else (
        echo Optimizacion cancelada. >> %LOG%
        echo Optimizacion cancelada.
    )
    pause
    goto ACTUALIZACIONES_OPTIMIZACION
)
if "%subopcion%"=="7" (
    echo Preparando limpieza de actualizaciones fallidas...
    set /p confirm="Confirmar? (1=Si, 2=No): "
    if "%confirm%"=="1" (
        start cmd /k "net stop wuauserv && del /q /s %windir%\SoftwareDistribution\Download\*.* && net start wuauserv && echo Limpieza completada. >> %LOG% && echo Limpieza completada. && pause && exit"
        echo Limpieza iniciada en nueva ventana. >> %LOG%
        echo Limpieza iniciada. Revisa la ventana secundaria.
    ) else (
        echo Limpieza cancelada. >> %LOG%
        echo Limpieza cancelada.
    )
    pause
    goto ACTUALIZACIONES_OPTIMIZACION
)
if "%subopcion%"=="8" goto MENU_PRINCIPAL
echo Opcion no valida.
timeout /t 2 >nul
goto ACTUALIZACIONES_OPTIMIZACION

:SEGURIDAD_LIMPIEZA
cls
echo ===========================================================================
echo Seguridad y limpieza
echo ===========================================================================
echo 1. Escanear con Windows Defender
echo 2. Limpiar archivos temporales
echo 3. Eliminar versiones antiguas de Windows
echo 4. Verificar firewall de Windows
echo 5. Limpiar cache de DNS
echo 6. Volver al menu principal
set /p subopcion="Ingresa tu eleccion (1-6): "

if "%subopcion%"=="1" (
    echo Preparando escaneo con Windows Defender...
    set /p confirm="Confirmar? (1=Si, 2=No): "
    if "%confirm%"=="1" (
        start cmd /k ""%ProgramFiles%\Windows Defender\MpCmdRun.exe" -Scan -ScanType 2 && echo Escaneo completado. >> %LOG% && echo Escaneo completado. && pause && exit"
        echo Escaneo iniciado en nueva ventana. >> %LOG%
        echo Escaneo iniciado. Revisa la ventana secundaria.
    ) else (
        echo Escaneo cancelado. >> %LOG%
        echo Escaneo cancelado.
    )
    pause
    goto SEGURIDAD_LIMPIEZA
)
if "%subopcion%"=="2" (
    echo Preparando limpieza de archivos temporales...
    set /p confirm="Confirmar? (1=Si, 2=No): "
    if "%confirm%"=="1" (
        start cmd /k "del /q /s %TEMP%\*.* 2>nul && cleanmgr /sagerun:1 && echo Limpieza completada. >> %LOG% && echo Limpieza completada. && pause && exit"
        echo Limpieza iniciada en nueva ventana. >> %LOG%
        echo Limpieza iniciada. Revisa la ventana secundaria.
    ) else (
        echo Limpieza cancelada. >> %LOG%
        echo Limpieza cancelada.
    )
    pause
    goto SEGURIDAD_LIMPIEZA
)
if "%subopcion%"=="3" (
    echo Preparando eliminacion de versiones antiguas...
    set /p confirm="Confirmar? (1=Si, 2=No): "
    if "%confirm%"=="1" (
        start cmd /k "DISM /Online /Cleanup-Image /StartComponentCleanup && echo Eliminacion completada. >> %LOG% && echo Eliminacion completada. && pause && exit"
        echo Eliminacion iniciada en nueva ventana. >> %LOG%
        echo Eliminacion iniciada. Revisa la ventana secundaria.
    ) else (
        echo Eliminacion cancelada. >> %LOG%
        echo Eliminacion cancelada.
    )
    pause
    goto SEGURIDAD_LIMPIEZA
)
if "%subopcion%"=="4" (
    echo Preparando verificacion de firewall...
    set /p confirm="Confirmar? (1=Si, 2=No): "
    if "%confirm%"=="1" (
        start cmd /k "netsh advfirewall show allprofiles && echo Estado del firewall mostrado. >> %LOG% && echo Revisa el log para detalles. && pause && exit"
        echo Verificacion iniciada en nueva ventana. >> %LOG%
        echo Verificacion iniciada. Revisa la ventana secundaria.
    ) else (
        echo Verificacion cancelada. >> %LOG%
        echo Verificacion cancelada.
    )
    pause
    goto SEGURIDAD_LIMPIEZA
)
if "%subopcion%"=="5" (
    echo Preparando limpieza de cache de DNS...
    set /p confirm="Confirmar? (1=Si, 2=No): "
    if "%confirm%"=="1" (
        start cmd /k "ipconfig /flushdns && echo Cache de DNS limpiada. >> %LOG% && echo Cache limpiada. && pause && exit"
        echo Limpieza iniciada en nueva ventana. >> %LOG%
        echo Limpieza iniciada. Revisa la ventana secundaria.
    ) else (
        echo Limpieza cancelada. >> %LOG%
        echo Limpieza cancelada.
    )
    pause
    goto SEGURIDAD_LIMPIEZA
)
if "%subopcion%"=="6" goto MENU_PRINCIPAL
echo Opcion no valida.
timeout /t 2 >nul
goto SEGURIDAD_LIMPIEZA

:DIAGNOSTICO_HARDWARE_RED
cls
echo ===========================================================================
echo Diagnostico de hardware y red
echo ===========================================================================
echo 1. Verificar estado del disco con CrystalDiskInfo
echo 2. Diagnosticar problemas de red
echo 3. Test de red con PING y TRACERT
echo 4. Verificar estado de hardware con SystemInfo
echo 5. Volver al menu principal
set /p subopcion="Ingresa tu eleccion (1-5): "

if "%subopcion%"=="1" (
    echo Preparando instalacion de CrystalDiskInfo...
    set /p confirm="Confirmar? (1=Si, 2=No): "
    if "%confirm%"=="1" (
        start cmd /k "winget install CrystalDewWorld.CrystalDiskInfo && echo Ejecuta CrystalDiskInfo manualmente. >> %LOG% && echo Ejecuta CrystalDiskInfo manualmente para verificar el disco. && pause && exit"
        echo Instalacion iniciada en nueva ventana. >> %LOG%
        echo Instalacion iniciada. Revisa la ventana secundaria.
    ) else (
        echo Instalacion cancelada. >> %LOG%
        echo Instalacion cancelada.
    )
    pause
    goto DIAGNOSTICO_HARDWARE_RED
)
if "%subopcion%"=="2" (
    echo Preparando diagnostico de red...
    set /p confirm="Confirmar? (1=Si, 2=No): "
    if "%confirm%"=="1" (
        start cmd /k "ipconfig /release && ipconfig /renew && netsh winsock reset && netsh int ip reset && echo Reinicia el sistema para aplicar cambios. >> %LOG% && echo Reinicia el sistema. && pause && exit"
        echo Diagnostico iniciado en nueva ventana. >> %LOG%
        echo Diagnostico iniciado. Revisa la ventana secundaria.
    ) else (
        echo Diagnostico cancelado. >> %LOG%
        echo Diagnostico cancelado.
    )
    pause
    goto DIAGNOSTICO_HARDWARE_RED
)
if "%subopcion%"=="3" (
    echo Preparando test de red...
    set /p confirm="Confirmar? (1=Si, 2=No): "
    if "%confirm%"=="1" (
        start cmd /k "ping 8.8.8.8 && tracert 8.8.8.8 && echo Test completado. >> %LOG% && echo Test completado. Revisa el log. && pause && exit"
        echo Test iniciado en nueva ventana. >> %LOG%
        echo Test iniciado. Revisa la ventana secundaria.
    ) else (
        echo Test cancelado. >> %LOG%
        echo Test cancelado.
    )
    pause
    goto DIAGNOSTICO_HARDWARE_RED
)
if "%subopcion%"=="4" (
    echo Preparando verificacion de hardware...
    set /p confirm="Confirmar? (1=Si, 2=No): "
    if "%confirm%"=="1" (
        start cmd /k "systeminfo && echo Informacion generada. >> %LOG% && echo Informacion generada. Revisa el log. && pause && exit"
        echo Verificacion iniciada en nueva ventana. >> %LOG%
        echo Verificacion iniciada. Revisa la ventana secundaria.
    ) else (
        echo Verificacion cancelada. >> %LOG%
        echo Verificacion cancelada.
    )
    pause
    goto DIAGNOSTICO_HARDWARE_RED
)
if "%subopcion%"=="5" goto MENU_PRINCIPAL
echo Opcion no valida.
timeout /t 2 >nul
goto DIAGNOSTICO_HARDWARE_RED

:GESTION_APLICACIONES_REGISTRO
cls
echo ===========================================================================
echo Gestion de aplicaciones y registro
echo ===========================================================================
echo 1. Desinstalar aplicaciones innecesarias
echo 2. Limpiar registro con CCleaner
echo 3. Reparar permisos del registro
echo 4. Volver al menu principal
set /p subopcion="Ingresa tu eleccion (1-4): "

if "%subopcion%"=="1" (
    echo Listando aplicaciones instaladas...
    wmic product get name
    set /p app="Ingresa el nombre de la app a desinstalar (o 'cancelar'): "
    if /i "%app%" neq "cancelar" (
        set /p confirm="Confirmar desinstalacion de %app%? (1=Si, 2=No): "
        if "%confirm%"=="1" (
            start cmd /k "wmic product where name='%app%' call uninstall && echo Desinstalacion completada. >> %LOG% && echo Desinstalacion completada. && pause && exit"
            echo Desinstalacion iniciada en nueva ventana. >> %LOG%
            echo Desinstalacion iniciada. Revisa la ventana secundaria.
        ) else (
            echo Desinstalacion cancelada. >> %LOG%
            echo Desinstalacion cancelada.
        )
    ) else (
        echo Desinstalacion cancelada. >> %LOG%
        echo Desinstalacion cancelada.
    )
    pause
    goto GESTION_APLICACIONES_REGISTRO
)
if "%subopcion%"=="2" (
    echo Preparando instalacion de CCleaner...
    set /p confirm="Confirmar? (1=Si, 2=No): "
    if "%confirm%"=="1" (
        start cmd /k "winget install Piriform.CCleaner && echo Ejecuta CCleaner manualmente. >> %LOG% && echo Ejecuta CCleaner manualmente. && pause && exit"
        echo Instalacion iniciada en nueva ventana. >> %LOG%
        echo Instalacion iniciada. Revisa la ventana secundaria.
    ) else (
        echo Instalacion cancelada. >> %LOG%
        echo Instalacion cancelada.
    )
    pause
    goto GESTION_APLICACIONES_REGISTRO
)
if "%subopcion%"=="3" (
    echo Preparando reparacion de permisos del registro...
    set /p confirm="Confirmar? (1=Si, 2=No): "
    if "%confirm%"=="1" (
        start cmd /k "secedit /configure /cfg %windir%\inf\defltbase.inf /db defltbase.sdb /verbose && echo Permisos reparados. >> %LOG% && echo Permisos reparados. && pause && exit"
        echo Reparacion iniciada en nueva ventana. >> %LOG%
        echo Reparacion iniciada. Revisa la ventana secundaria.
    ) else (
        echo Reparacion cancelada. >> %LOG%
        echo Reparacion cancelada.
    )
    pause
    goto GESTION_APLICACIONES_REGISTRO
)
if "%subopcion%"=="4" goto MENU_PRINCIPAL
echo Opcion no valida.
timeout /t 2 >nul
goto GESTION_APLICACIONES_REGISTRO

:SOLUCION_PROBLEMAS_ESPECIFICOS
cls
echo ===========================================================================
echo Solucion de problemas especificos
echo ===========================================================================
echo 1. Analizar BSOD con BlueScreenView
echo 2. Identificar procesos que consumen recursos
echo 3. Reparar errores de arranque con Bootrec
echo 4. Restaurar sistema a configuracion base
echo 5. Volver al menu principal
set /p subopcion="Ingresa tu eleccion (1-5): "

if "%subopcion%"=="1" (
    echo Preparando instalacion de BlueScreenView...
    set /p confirm="Confirmar? (1=Si, 2=No): "
    if "%confirm%"=="1" (
        start cmd /k "winget install NirSoft.BlueScreenView && echo Ejecuta BlueScreenView manualmente. >> %LOG% && echo Ejecuta BlueScreenView manualmente. && pause && exit"
        echo Instalacion iniciada en nueva ventana. >> %LOG%
        echo Instalacion iniciada. Revisa la ventana secundaria.
    ) else (
        echo Instalacion cancelada. >> %LOG%
        echo Instalacion cancelada.
    )
    pause
    goto SOLUCION_PROBLEMAS_ESPECIFICOS
)
if "%subopcion%"=="2" (
    echo Preparando analisis de procesos...
    set /p confirm="Confirmar? (1=Si, 2=No): "
    if "%confirm%"=="1" (
        start cmd /k "tasklist /svc /fi \"cputime gt 00:00:00\" | sort /r && echo Procesos mostrados. >> %LOG% && echo Procesos mostrados. Revisa el log. && pause && exit"
        echo Analisis iniciado en nueva ventana. >> %LOG%
        echo Analisis iniciado. Revisa la ventana secundaria.
    ) else (
        echo Analisis cancelado. >> %LOG%
        echo Analisis cancelado.
    )
    pause
    goto SOLUCION_PROBLEMAS_ESPECIFICOS
)
if "%subopcion%"=="3" (
    echo Preparando reparacion de arranque con Bootrec...
    set /p confirm="Confirmar? (1=Si, 2=No): "
    if "%confirm%"=="1" (
        start cmd /k "echo Ejecuta estos comandos en el entorno de recuperacion: && echo bootrec /fixmbr && echo bootrec /fixboot && echo bootrec /scanos && echo bootrec /rebuildbcd && echo Usa el entorno de recuperacion. >> %LOG% && echo Usa el entorno de recuperacion. && pause && exit"
        echo Instrucciones mostradas en nueva ventana. >> %LOG%
        echo Instrucciones mostradas. Revisa la ventana secundaria.
    ) else (
        echo Reparacion cancelada. >> %LOG%
        echo Reparacion cancelada.
    )
    pause
    goto SOLUCION_PROBLEMAS_ESPECIFICOS
)
if "%subopcion%"=="4" (
    echo Preparando restauracion del sistema...
    set /p confirm="Confirmar? (1=Si, 2=No): "
    if "%confirm%"=="1" (
        start cmd /k "systemreset -cleanpc && echo Restauracion iniciada. >> %LOG% && echo Sigue las instrucciones en pantalla. && pause && exit"
        echo Restauracion iniciada en nueva ventana. >> %LOG%
        echo Restauracion iniciada. Revisa la ventana secundaria.
    ) else (
        echo Restauracion cancelada. >> %LOG%
        echo Restauracion cancelada.
    )
    pause
    goto SOLUCION_PROBLEMAS_ESPECIFICOS
)
if "%subopcion%"=="5" goto MENU_PRINCIPAL
echo Opcion no valida.
timeout /t 2 >nul
goto SOLUCION_PROBLEMAS_ESPECIFICOS

:CREAR_PUNTO_RESTAURACION
cls
echo ===========================================================================
echo Creando punto de restauracion...
echo ===========================================================================
set /p confirm="Confirmar? (1=Si, 2=No): "
if "%confirm%"=="1" (
    start cmd /k "powershell -Command \"Checkpoint-Computer -Description 'Mantenimiento Ark Dev Solutions' -RestorePointType 'MODIFY_SETTINGS'\" && echo Punto de restauracion creado. >> %LOG% && echo Punto de restauracion creado. && pause && exit"
    echo Creacion iniciada en nueva ventana. >> %LOG%
    echo Creacion iniciada. Revisa la ventana secundaria.
) else (
    echo Creacion cancelada. >> %LOG%
    echo Creacion cancelada.
)
pause
goto MENU_PRINCIPAL

:GENERAR_INFORME
cls
echo ===========================================================================
echo Generando informe de mantenimiento...
echo ===========================================================================
set "informe=%USERPROFILE%\Desktop\Informe_Mantenimiento_%DATE:~-4%%DATE:~3,2%%DATE:~0,2%.txt"
echo Informe de Mantenimiento - Ark Dev Solutions > %informe%
echo Fecha: %DATE% %TIME% >> %informe%
echo Sistema: %OSName% >> %informe%
echo --------------------------------------------- >> %informe%
type %LOG% >> %informe%
echo Informe generado en %informe%. >> %LOG%
echo Informe generado en %informe%.
pause
goto MENU_PRINCIPAL

:ANALISIS_EVENTOS
cls
echo ===========================================================================
echo Analisis de eventos del sistema
echo ===========================================================================
echo Preparando analisis de eventos criticos...
set /p confirm="Confirmar? (1=Si, 2=No): "
if "%confirm%"=="1" (
    start cmd /k "wevtutil qe System /q:\"*[System[(Level=1 or Level=2)]]\" /c:10 /f:text && echo Analisis completado. >> %LOG% && echo Analisis completado. Revisa el log. && pause && exit"
    echo Analisis iniciado en nueva ventana. >> %LOG%
    echo Analisis iniciado. Revisa la ventana secundaria.
) else (
    echo Analisis cancelado. >> %LOG%
    echo Analisis cancelado.
)
pause
goto MENU_PRINCIPAL

:OPTIMIZACION_ALMACENAMIENTO
cls
echo ===========================================================================
echo Optimizacion de almacenamiento
echo ===========================================================================
echo Preparando optimizacion con Storage Sense...
set /p confirm="Confirmar? (1=Si, 2=No): "
if "%confirm%"=="1" (
    start cmd /k "cleanmgr /sagerun:1 && echo Optimizacion completada. >> %LOG% && echo Optimizacion completada. && pause && exit"
    echo Optimizacion iniciada en nueva ventana. >> %LOG%
    echo Optimizacion iniciada. Revisa la ventana secundaria.
) else (
    echo Optimizacion cancelada. >> %LOG%
    echo Optimizacion cancelada.
)
pause
goto MENU_PRINCIPAL

:REPARACION_APPS_STORE
cls
echo ===========================================================================
echo Reparacion de aplicaciones de Microsoft Store
echo ===========================================================================
echo Preparando reparacion de apps de Store...
set /p confirm="Confirmar? (1=Si, 2=No): "
if "%confirm%"=="1" (
    start cmd /k "powershell -Command \"Get-AppxPackage | % { Add-AppxPackage -DisableDevelopmentMode -Register \\\"$($_.InstallLocation)\\AppXManifest.xml\\\" -Verbose }\" && echo Reparacion completada. >> %LOG% && echo Reparacion completada. && pause && exit"
    echo Reparacion iniciada en nueva ventana. >> %LOG%
    echo Reparacion iniciada. Revisa la ventana secundaria.
) else (
    echo Reparacion cancelada. >> %LOG%
    echo Reparacion cancelada.
)
pause
goto MENU_PRINCIPAL

:VERIFICACION_CONTROLADORES
cls
echo ===========================================================================
echo Verificacion de controladores
echo ===========================================================================
echo Preparando verificacion de controladores...
set /p confirm="Confirmar? (1=Si, 2=No): "
if "%confirm%"=="1" (
    start cmd /k "pnputil /enum-drivers && echo Verificacion completada. >> %LOG% && echo Verificacion completada. Revisa el log. && pause && exit"
    echo Verificacion iniciada en nueva ventana. >> %LOG%
    echo Verificacion iniciada. Revisa la ventana secundaria.
) else (
    echo Verificacion cancelada. >> %LOG%
    echo Verificacion cancelada.
)
pause
goto MENU_PRINCIPAL

:FIN
cls
echo ===========================================================================
echo Mantenimiento completado - Ark Dev Solutions
echo Log guardado en: %LOG%
echo Gracias por usar nuestro script. Contactanos en arkdev.pages.dev/nosotros
echo ===========================================================================
:: Registrar mantenimiento en el Registro de Windows
powershell -Command "New-Item -Path 'HKLM:\SOFTWARE\ArkDevSolutions' -Force; Set-ItemProperty -Path 'HKLM:\SOFTWARE\ArkDevSolutions' -Name 'UltimoMantenimiento' -Value (Get-Date -Format 'yyyy-MM-dd HH:mm:ss'); Set-ItemProperty -Path 'HKLM:\SOFTWARE\ArkDevSolutions' -Name 'Responsable' -Value 'Ark Dev Solutions'; Set-ItemProperty -Path 'HKLM:\SOFTWARE\ArkDevSolutions' -Name 'Comentario' -Value 'Mantenimiento Ultra Pro realizado'"
echo Mantenimiento registrado en el Registro de Windows. >> %LOG%
pause
exit /b