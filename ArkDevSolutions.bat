@echo off
title Mantenimiento de Windows - Ark Dev Solutions
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
echo V.3.0 Ultra Plus
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
echo MANTENIMIENTO ULTRA PLUS DE WINDOWS - ARK DEV SOLUTIONS
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
echo 9. Salir
echo ===========================================================================
set /p opcion="Ingresa tu eleccion (1-9): "

if "%opcion%"=="1" goto EXAMEN_REPARACION
if "%opcion%"=="2" goto ACTUALIZACIONES_OPTIMIZACION
if "%opcion%"=="3" goto SEGURIDAD_LIMPIEZA
if "%opcion%"=="4" goto DIAGNOSTICO_HARDWARE_RED
if "%opcion%"=="5" goto GESTION_APLICACIONES_REGISTRO
if "%opcion%"=="6" goto SOLUCION_PROBLEMAS_ESPECIFICOS
if "%opcion%"=="7" goto CREAR_PUNTO_RESTAURACION
if "%opcion%"=="8" goto GENERAR_INFORME
if "%opcion%"=="9" goto FIN
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
    echo Ejecutando SFC /scannow...
    set /p confirm="Confirmar? (1=Si, 2=No): "
    if "%confirm%"=="1" (
        sfc /scannow >> %LOG% 2>&1
        echo SFC completado. >> %LOG%
        echo SFC completado.
    ) else (
        echo SFC cancelado.
    )
    pause
    goto EXAMEN_REPARACION
)
if "%subopcion%"=="2" (
    echo Ejecutando DISM /Online /Cleanup-Image /RestoreHealth...
    set /p confirm="Confirmar? (1=Si, 2=No): "
    if "%confirm%"=="1" (
        DISM /Online /Cleanup-Image /RestoreHealth >> %LOG% 2>&1
        echo DISM completado. >> %LOG%
        echo DISM completado.
    ) else (
        echo DISM cancelado.
    )
    pause
    goto EXAMEN_REPARACION
)
if "%subopcion%"=="3" (
    echo Ejecutando CHKDSK /f /r (requiere reinicio)...
    set /p confirm="Confirmar? (1=Si, 2=No): "
    if "%confirm%"=="1" (
        chkdsk C: /f /r
        echo CHKDSK programado para el proximo reinicio. >> %LOG%
        echo CHKDSK programado. Reinicia el sistema.
    ) else (
        echo CHKDSK cancelado.
    )
    pause
    goto EXAMEN_REPARACION
)
if "%subopcion%"=="4" (
    echo Reparando componentes de Windows con DISM...
    set /p confirm="Confirmar? (1=Si, 2=No): "
    if "%confirm%"=="1" (
        DISM /Online /Cleanup-Image /StartComponentCleanup >> %LOG% 2>&1
        echo Reparacion de componentes completada. >> %LOG%
        echo Reparacion completada.
    ) else (
        echo Reparacion cancelada.
    )
    pause
    goto EXAMEN_REPARACION
)
if "%subopcion%"=="5" (
    echo Iniciando Diagnostico de Memoria de Windows...
    set /p confirm="Confirmar? (1=Si, 2=No): "
    if "%confirm%"=="1" (
        MdSched.exe
        echo Diagnostico programado. Reinicia el sistema para ejecutarlo. >> %LOG%
        echo Reinicia el sistema para ejecutar el diagnostico.
    ) else (
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
echo 7. Volver al menu principal
set /p subopcion="Ingresa tu eleccion (1-7): "

if "%subopcion%"=="1" (
    echo Iniciando verificacion de actualizaciones...
    set /p confirm="Confirmar? (1=Si, 2=No): "
    if "%confirm%"=="1" (
        usoclient StartScan
        echo Verifica manualmente Windows Update. >> %LOG%
        echo Verifica Windows Update para instalar actualizaciones.
    ) else (
        echo Actualizaciones canceladas.
    )
    pause
    goto ACTUALIZACIONES_OPTIMIZACION
)
if "%subopcion%"=="2" (
    echo Actualizando aplicaciones con Winget...
    set /p confirm="Confirmar? (1=Si, 2=No): "
    if "%confirm%"=="1" (
        winget upgrade --all >> %LOG% 2>&1
        echo Actualizacion completada. >> %LOG%
        echo Actualizacion completada.
    ) else (
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
        echo Apps no modificadas.
    )
    pause
    goto ACTUALIZACIONES_OPTIMIZACION
)
if "%subopcion%"=="4" (
    echo Desfragmentando disco...
    set /p confirm="Confirmar? (1=Si, 2=No): "
    if "%confirm%"=="1" (
        defrag C: /O >> %LOG% 2>&1
        echo Desfragmentacion completada. >> %LOG%
        echo Desfragmentacion completada.
    ) else (
        echo Desfragmentacion cancelada.
    )
    pause
    goto ACTUALIZACIONES_OPTIMIZACION
)
if "%subopcion%"=="5" (
    echo Reseteando configuracion de energia...
    set /p confirm="Confirmar? (1=Si, 2=No): "
    if "%confirm%"=="1" (
        powercfg -restoredefaultschemes >> %LOG% 2>&1
        echo Configuracion de energia reseteada. >> %LOG%
        echo Configuracion reseteada.
    ) else (
        echo Reset cancelado.
    )
    pause
    goto ACTUALIZACIONES_OPTIMIZACION
)
if "%subopcion%"=="6" (
    echo Optimizando servicios de Windows...
    set /p confirm="Confirmar? (1=Si, 2=No): "
    if "%confirm%"=="1" (
        sc config wuauserv start= demand >> %LOG% 2>&1
        echo Servicios optimizados (Windows Update a manual). >> %LOG%
        echo Servicios optimizados.
    ) else (
        echo Optimizacion cancelada.
    )
    pause
    goto ACTUALIZACIONES_OPTIMIZACION
)
if "%subopcion%"=="7" goto MENU_PRINCIPAL
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
    echo Iniciando escaneo completo con Windows Defender...
    set /p confirm="Confirmar? (1=Si, 2=No): "
    if "%confirm%"=="1" (
        "%ProgramFiles%\Windows Defender\MpCmdRun.exe" -Scan -ScanType 2 >> %LOG% 2>&1
        echo Escaneo completado. >> %LOG%
        echo Escaneo completado.
    ) else (
        echo Escaneo cancelado.
    )
    pause
    goto SEGURIDAD_LIMPIEZA
)
if "%subopcion%"=="2" (
    echo Limpiando archivos temporales...
    set /p confirm="Confirmar? (1=Si, 2=No): "
    if "%confirm%"=="1" (
        del /q /s %TEMP%\*.* 2>nul
        cleanmgr /sagerun:1 >> %LOG% 2>&1
        echo Limpieza completada. >> %LOG%
        echo Limpieza completada.
    ) else (
        echo Limpieza cancelada.
    )
    pause
    goto SEGURIDAD_LIMPIEZA
)
if "%subopcion%"=="3" (
    echo Eliminando versiones antiguas de Windows...
    set /p confirm="Confirmar? (1=Si, 2=No): "
    if "%confirm%"=="1" (
        DISM /Online /Cleanup-Image /StartComponentCleanup >> %LOG% 2>&1
        echo Eliminacion completada. >> %LOG%
        echo Eliminacion completada.
    ) else (
        echo Eliminacion cancelada.
    )
    pause
    goto SEGURIDAD_LIMPIEZA
)
if "%subopcion%"=="4" (
    echo Verificando estado del firewall...
    set /p confirm="Confirmar? (1=Si, 2=No): "
    if "%confirm%"=="1" (
        netsh advfirewall show allprofiles >> %LOG% 2>&1
        echo Estado del firewall mostrado. Revisa el log para detalles. >> %LOG%
        echo Revisa el log para detalles.
    ) else (
        echo Verificacion cancelada.
    )
    pause
    goto SEGURIDAD_LIMPIEZA
)
if "%subopcion%"=="5" (
    echo Limpiando cache de DNS...
    set /p confirm="Confirmar? (1=Si, 2=No): "
    if "%confirm%"=="1" (
        ipconfig /flushdns >> %LOG% 2>&1
        echo Cache de DNS limpiada. >> %LOG%
        echo Cache limpiada.
    ) else (
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
    echo Descargando CrystalDiskInfo...
    set /p confirm="Confirmar? (1=Si, 2=No): "
    if "%confirm%"=="1" (
        winget install CrystalDewWorld.CrystalDiskInfo >> %LOG% 2>&1
        echo Ejecuta CrystalDiskInfo manualmente. >> %LOG%
        echo Ejecuta CrystalDiskInfo manualmente para verificar el disco.
    ) else (
        echo Instalacion cancelada.
    )
    pause
    goto DIAGNOSTICO_HARDWARE_RED
)
if "%subopcion%"=="2" (
    echo Diagnosticando problemas de red...
    set /p confirm="Confirmar? (1=Si, 2=No): "
    if "%confirm%"=="1" (
        ipconfig /release >> %LOG% 2>&1
        ipconfig /renew >> %LOG% 2>&1
        netsh winsock reset >> %LOG% 2>&1
        netsh int ip reset >> %LOG% 2>&1
        echo Reinicia el sistema para aplicar cambios. >> %LOG%
        echo Reinicia el sistema.
    ) else (
        echo Diagnostico cancelado.
    )
    pause
    goto DIAGNOSTICO_HARDWARE_RED
)
if "%subopcion%"=="3" (
    echo Realizando test de red...
    set /p confirm="Confirmar? (1=Si, 2=No): "
    if "%confirm%"=="1" (
        ping 8.8.8.8 >> %LOG% 2>&1
        tracert 8.8.8.8 >> %LOG% 2>&1
        echo Test completado. Revisa el log. >> %LOG%
        echo Test completado. Revisa el log.
    ) else (
        echo Test cancelado.
    )
    pause
    goto DIAGNOSTICO_HARDWARE_RED
)
if "%subopcion%"=="4" (
    echo Verificando hardware con SystemInfo...
    set /p confirm="Confirmar? (1=Si, 2=No): "
    if "%confirm%"=="1" (
        systeminfo >> %LOG% 2>&1
        echo Informacion generada. Revisa el log. >> %LOG%
        echo Informacion generada. Revisa el log.
    ) else (
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
            wmic product where name="%app%" call uninstall >> %LOG% 2>&1
            echo Desinstalacion completada. >> %LOG%
            echo Desinstalacion completada.
        ) else (
            echo Desinstalacion cancelada.
        )
    )
    pause
    goto GESTION_APLICACIONES_REGISTRO
)
if "%subopcion%"=="2" (
    echo Descargando CCleaner...
    set /p confirm="Confirmar? (1=Si, 2=No): "
    if "%confirm%"=="1" (
        winget install Piriform.CCleaner >> %LOG% 2>&1
        echo Ejecuta CCleaner manualmente para limpiar el registro. >> %LOG%
        echo Ejecuta CCleaner manualmente.
    ) else (
        echo Instalacion cancelada.
    )
    pause
    goto GESTION_APLICACIONES_REGISTRO
)
if "%subopcion%"=="3" (
    echo Reparando permisos del registro...
    set /p confirm="Confirmar? (1=Si, 2=No): "
    if "%confirm%"=="1" (
        secedit /configure /cfg %windir%\inf\defltbase.inf /db defltbase.sdb /verbose >> %LOG% 2>&1
        echo Permisos reparados. >> %LOG%
        echo Permisos reparados.
    ) else (
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
    echo Descargando BlueScreenView...
    set /p confirm="Confirmar? (1=Si, 2=No): "
    if "%confirm%"=="1" (
        winget install NirSoft.BlueScreenView >> %LOG% 2>&1
        echo Ejecuta BlueScreenView manualmente para analizar BSOD. >> %LOG%
        echo Ejecuta BlueScreenView manualmente.
    ) else (
        echo Instalacion cancelada.
    )
    pause
    goto SOLUCION_PROBLEMAS_ESPECIFICOS
)
if "%subopcion%"=="2" (
    echo Mostrando procesos que consumen CPU...
    set /p confirm="Confirmar? (1=Si, 2=No): "
    if "%confirm%"=="1" (
        tasklist /svc /fi "cputime gt 00:00:00" | sort /r >> %LOG% 2>&1
        echo Procesos mostrados en el log. >> %LOG%
        echo Procesos mostrados. Revisa el log.
    ) else (
        echo Analisis cancelado.
    )
    pause
    goto SOLUCION_PROBLEMAS_ESPECIFICOS
)
if "%subopcion%"=="3" (
    echo Reparando arranque con Bootrec (requiere entorno de recuperacion)...
    set /p confirm="Confirmar? (1=Si, 2=No): "
    if "%confirm%"=="1" (
        echo Ejecuta estos comandos en el entorno de recuperacion: >> %LOG%
        echo bootrec /fixmbr >> %LOG%
        echo bootrec /fixboot >> %LOG%
        echo bootrec /scanos >> %LOG%
        echo bootrec /rebuildbcd >> %LOG%
        echo Usa el entorno de recuperacion para ejecutar estos comandos.
    ) else (
        echo Reparacion cancelada.
    )
    pause
    goto SOLUCION_PROBLEMAS_ESPECIFICOS
)
if "%subopcion%"=="4" (
    echo Restaurando sistema a configuracion base...
    set /p confirm="Confirmar? (1=Si, 2=No): "
    if "%confirm%"=="1" (
        systemreset -cleanpc >> %LOG% 2>&1
        echo Restauracion iniciada. Sigue las instrucciones en pantalla. >> %LOG%
        echo Sigue las instrucciones en pantalla.
    ) else (
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
    powershell -Command "Checkpoint-Computer -Description 'Mantenimiento Ark Dev Solutions' -RestorePointType 'MODIFY_SETTINGS'" >> %LOG% 2>&1
    echo Punto de restauracion creado. >> %LOG%
    echo Punto de restauracion creado.
) else (
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

:FIN
cls
echo ===========================================================================
echo Mantenimiento completado - Ark Dev Solutions
echo Log guardado en: %LOG%
echo Gracias por usar nuestro script. Contactanos en arkdev.pages.dev/nosotros
echo ===========================================================================
pause
exit /b