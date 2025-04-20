@echo off
title Mantenimiento Ultra Pro Plus de Windows - Ark Dev Solutions
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

:: Detectar versión de Windows de forma confiable
for /f "tokens=2*" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName') do set "OSName=%%b"
for /f "tokens=2*" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v CurrentBuild') do set "OSBuild=%%b"
echo Sistema operativo: %OSName% (Build %OSBuild%) >> %LOG%
echo Sistema operativo detectado: %OSName% (Build %OSBuild%)

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
echo ARK DEV SOLUTIONS  --------^<^>Soporte: arkdev.pages.dev/nosotros
echo V.3.3 Ultra Pro Plus
echo Sistema operativo detectado: %OSName% (Build %OSBuild%)
timeout /t 2 >nul

:MENU_PRINCIPAL
cls
echo ===========================================================================
echo MANTENIMIENTO ULTRA PRO PLUS DE WINDOWS - ARK DEV SOLUTIONS
echo Sistema operativo: %OSName% (Build %OSBuild%)
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
echo 12. Verificacion y actualizacion de controladores
echo 13. Mantenimiento automatico completo
echo 14. Gestion de servicios avanzada
echo 15. Monitoreo de rendimiento
echo 16. Salir
echo ===========================================================================
set /p opcion="Ingresa tu eleccion (1-16): "

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
if "%opcion%"=="13" goto MANTENIMIENTO_AUTOMATICO
if "%opcion%"=="14" goto GESTION_SERVICIOS
if "%opcion%"=="15" goto MONITOREO_RENDIMIENTO
if "%opcion%"=="16" goto FIN
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
echo 6. Escanear sectores defectuosos
echo 7. Volver al menu principal
set /p subopcion="Ingresa tu eleccion (1-7): "

if "%subopcion%"=="1" (
    echo Ejecutando SFC /scannow...
    start cmd /k "sfc /scannow && echo SFC completado. >> %LOG% && echo SFC completado. && pause && exit"
    echo SFC iniciado en nueva ventana. >> %LOG%
    echo SFC iniciado. Revisa la ventana secundaria.
    pause
    goto EXAMEN_REPARACION
)
if "%subopcion%"=="2" (
    echo Ejecutando DISM /Online /Cleanup-Image /RestoreHealth...
    start cmd /k "DISM /Online /Cleanup-Image /RestoreHealth && echo DISM completado. >> %LOG% && echo DISM completado. && pause && exit"
    echo DISM iniciado en nueva ventana. >> %LOG%
    echo DISM iniciado. Revisa la ventana secundaria.
    pause
    goto EXAMEN_REPARACION
)
if "%subopcion%"=="3" (
    echo Ejecutando CHKDSK /f /r (requiere reinicio)...
    start cmd /k "chkdsk C: /f /r && echo CHKDSK programado. >> %LOG% && echo CHKDSK programado. Reinicia el sistema. && pause && exit"
    echo CHKDSK iniciado en nueva ventana. >> %LOG%
    echo CHKDSK iniciado. Revisa la ventana secundaria.
    pause
    goto EXAMEN_REPARACION
)
if "%subopcion%"=="4" (
    echo Ejecutando reparacion de componentes con DISM...
    start cmd /k "DISM /Online /Cleanup-Image /StartComponentCleanup && echo Reparacion completada. >> %LOG% && echo Reparacion completada. && pause && exit"
    echo Reparacion iniciada en nueva ventana. >> %LOG%
    echo Reparacion iniciada. Revisa la ventana secundaria.
    pause
    goto EXAMEN_REPARACION
)
if "%subopcion%"=="5" (
    echo Ejecutando Diagnostico de Memoria de Windows...
    start cmd /k "MdSched.exe && echo Diagnostico programado. >> %LOG% && echo Reinicia el sistema para ejecutar el diagnostico. && pause && exit"
    echo Diagnostico iniciado en nueva ventana. >> %LOG%
    echo Diagnostico iniciado. Revisa la ventana secundaria.
    pause
    goto EXAMEN_REPARACION
)
if "%subopcion%"=="6" (
    echo Escaneando sectores defectuosos con CHKDSK...
    start cmd /k "chkdsk C: /scan && echo Escaneo completado. >> %LOG% && echo Escaneo completado. && pause && exit"
    echo Escaneo iniciado en nueva ventana. >> %LOG%
    echo Escaneo iniciado. Revisa la ventana secundaria.
    pause
    goto EXAMEN_REPARACION
)
if "%subopcion%"=="7" goto MENU_PRINCIPAL
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
echo 8. Optimizar inicio con msconfig
echo 9. Volver al menu principal
set /p subopcion="Ingresa tu eleccion (1-9): "

if "%subopcion%"=="1" (
    echo Verificando actualizaciones de Windows...
    start cmd /k "usoclient StartScan && echo Verifica manualmente Windows Update. >> %LOG% && echo Verifica Windows Update para instalar actualizaciones. && pause && exit"
    echo Actualizaciones iniciadas en nueva ventana. >> %LOG%
    echo Actualizaciones iniciadas. Revisa la ventana secundaria.
    pause
    goto ACTUALIZACIONES_OPTIMIZACION
)
if "%subopcion%"=="2" (
    echo Actualizando aplicaciones con Winget...
    start cmd /k "winget upgrade --all && echo Actualizacion completada. >> %LOG% && echo Actualizacion completada. && pause && exit"
    echo Winget iniciado en nueva ventana. >> %LOG%
    echo Winget iniciado. Revisa la ventana secundaria.
    pause
    goto ACTUALIZACIONES_OPTIMIZACION
)
if "%subopcion%"=="3" (
    echo Deshabilitando aplicaciones de inicio innecesarias...
    for /f "tokens=1,2" %%a in ('wmic startup get caption^,command ^| findstr /V "Windows Defender"') do (
        reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "%%a" /f 2>nul
        reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "%%a" /f 2>nul
    )
    echo Apps de inicio deshabilitadas (excepto Defender). >> %LOG%
    echo Apps deshabilitadas.
    pause
    goto ACTUALIZACIONES_OPTIMIZACION
)
if "%subopcion%"=="4" (
    echo Desfragmentando disco...
    start cmd /k "defrag C: /O && echo Desfragmentacion completada. >> %LOG% && echo Desfragmentacion completada. && pause && exit"
    echo Desfragmentacion iniciada en nueva ventana. >> %LOG%
    echo Desfragmentacion iniciada. Revisa la ventana secundaria.
    pause
    goto ACTUALIZACIONES_OPTIMIZACION
)
if "%subopcion%"=="5" (
    echo Reseteando configuracion de energia...
    start cmd /k "powercfg -restoredefaultschemes && echo Configuracion reseteada. >> %LOG% && echo Configuracion reseteada. && pause && exit"
    echo Reset iniciado en nueva ventana. >> %LOG%
    echo Reset iniciado. Revisa la ventana secundaria.
    pause
    goto ACTUALIZACIONES_OPTIMIZACION
)
if "%subopcion%"=="6" (
    echo Optimizando servicios de Windows...
    start cmd /k "sc config wuauserv start= demand && echo Servicios optimizados. >> %LOG% && echo Servicios optimizados. && pause && exit"
    echo Optimizacion iniciada en nueva ventana. >> %LOG%
    echo Optimizacion iniciada. Revisa la ventana secundaria.
    pause
    goto ACTUALIZACIONES_OPTIMIZACION
)
if "%subopcion%"=="7" (
    echo Limpiando actualizaciones fallidas...
    start cmd /k "net stop wuauserv && del /q /s %windir%\SoftwareDistribution\Download\*.* && net start wuauserv && echo Limpieza completada. >> %LOG% && echo Limpieza completada. && pause && exit"
    echo Limpieza iniciada en nueva ventana. >> %LOG%
    echo Limpieza iniciada. Revisa la ventana secundaria.
    pause
    goto ACTUALIZACIONES_OPTIMIZACION
)
if "%subopcion%"=="8" (
    echo Optimizando inicio con msconfig...
    start cmd /k "msconfig && echo Configura manualmente y reinicia si es necesario. >> %LOG% && echo Configura manualmente en la ventana abierta. && pause && exit"
    echo Optimizacion iniciada en nueva ventana. >> %LOG%
    echo Optimizacion iniciada. Revisa la ventana secundaria.
    pause
    goto ACTUALIZACIONES_OPTIMIZACION
)
if "%subopcion%"=="9" goto MENU_PRINCIPAL
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
echo 6. Analisis de malware avanzado
echo 7. Volver al menu principal
set /p subopcion="Ingresa tu eleccion (1-7): "

if "%subopcion%"=="1" (
    echo Escaneando con Windows Defender...
    start cmd /k ""%ProgramFiles%\Windows Defender\MpCmdRun.exe" -Scan -ScanType 2 && echo Escaneo completado. >> %LOG% && echo Escaneo completado. && pause && exit"
    echo Escaneo iniciado en nueva ventana. >> %LOG%
    echo Escaneo iniciado. Revisa la ventana secundaria.
    pause
    goto SEGURIDAD_LIMPIEZA
)
if "%subopcion%"=="2" (
    echo Limpiando archivos temporales...
    start cmd /k "del /q /s %TEMP%\*.* 2>nul && cleanmgr /sagerun:1 && echo Limpieza completada. >> %LOG% && echo Limpieza completada. && pause && exit"
    echo Limpieza iniciada en nueva ventana. >> %LOG%
    echo Limpieza iniciada. Revisa la ventana secundaria.
    pause
    goto SEGURIDAD_LIMPIEZA
)
if "%subopcion%"=="3" (
    echo Eliminando versiones antiguas de Windows...
    start cmd /k "DISM /Online /Cleanup-Image /StartComponentCleanup && echo Eliminacion completada. >> %LOG% && echo Eliminacion completada. && pause && exit"
    echo Eliminacion iniciada en nueva ventana. >> %LOG%
    echo Eliminacion iniciada. Revisa la ventana secundaria.
    pause
    goto SEGURIDAD_LIMPIEZA
)
if "%subopcion%"=="4" (
    echo Verificando firewall de Windows...
    start cmd /k "netsh advfirewall show allprofiles && echo Estado del firewall mostrado. >> %LOG% && echo Revisa el log para detalles. && pause && exit"
    echo Verificacion iniciada en nueva ventana. >> %LOG%
    echo Verificacion iniciada. Revisa la ventana secundaria.
    pause
    goto SEGURIDAD_LIMPIEZA
)
if "%subopcion%"=="5" (
    echo Limpiando cache de DNS...
    start cmd /k "ipconfig /flushdns && echo Cache de DNS limpiada. >> %LOG% && echo Cache limpiada. && pause && exit"
    echo Limpieza iniciada en nueva ventana. >> %LOG%
    echo Limpieza iniciada. Revisa la ventana secundaria.
    pause
    goto SEGURIDAD_LIMPIEZA
)
if "%subopcion%"=="6" (
    echo Realizando analisis de malware avanzado...
    start cmd /k ""%ProgramFiles%\Windows Defender\MpCmdRun.exe" -Scan -ScanType 3 && echo Analisis completado. >> %LOG% && echo Analisis completado. && pause && exit"
    echo Analisis iniciado en nueva ventana. >> %LOG%
    echo Analisis iniciado. Revisa la ventana secundaria.
    pause
    goto SEGURIDAD_LIMPIEZA
)
if "%subopcion%"=="7" goto MENU_PRINCIPAL
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
echo 5. Test de estabilidad del sistema
echo 6. Volver al menu principal
set /p subopcion="Ingresa tu eleccion (1-6): "

if "%subopcion%"=="1" (
    echo Instalando CrystalDiskInfo...
    start cmd /k "winget install CrystalDewWorld.CrystalDiskInfo && echo Ejecuta CrystalDiskInfo manualmente. >> %LOG% && echo Ejecuta CrystalDiskInfo manualmente para verificar el disco. && pause && exit"
    echo Instalacion iniciada en nueva ventana. >> %LOG%
    echo Instalacion iniciada. Revisa la ventana secundaria.
    pause
    goto DIAGNOSTICO_HARDWARE_RED
)
if "%subopcion%"=="2" (
    echo Diagnosticando problemas de red...
    start cmd /k "ipconfig /release && ipconfig /renew && netsh winsock reset && netsh int ip reset && echo Reinicia el sistema para aplicar cambios. >> %LOG% && echo Reinicia el sistema. && pause && exit"
    echo Diagnostico iniciado en nueva ventana. >> %LOG%
    echo Diagnostico iniciado. Revisa la ventana secundaria.
    pause
    goto DIAGNOSTICO_HARDWARE_RED
)
if "%subopcion%"=="3" (
    echo Realizando test de red...
    start cmd /k "ping 8.8.8.8 && tracert 8.8.8.8 && echo Test completado. >> %LOG% && echo Test completado. Revisa el log. && pause && exit"
    echo Test iniciado en nueva ventana. >> %LOG%
    echo Test iniciado. Revisa la ventana secundaria.
    pause
    goto DIAGNOSTICO_HARDWARE_RED
)
if "%subopcion%"=="4" (
    echo Verificando estado de hardware...
    start cmd /k "systeminfo && echo Informacion generada. >> %LOG% && echo Informacion generada. Revisa el log. && pause && exit"
    echo Verificacion iniciada en nueva ventana. >> %LOG%
    echo Verificacion iniciada. Revisa la ventana secundaria.
    pause
    goto DIAGNOSTICO_HARDWARE_RED
)
if "%subopcion%"=="5" (
    echo Realizando test de estabilidad...
    start cmd /k "wmic cpu get loadpercentage && echo Test de CPU completado. >> %LOG% && echo Test de CPU completado. Revisa el log. && pause && exit"
    echo Test iniciado en nueva ventana. >> %LOG%
    echo Test iniciado. Revisa la ventana secundaria.
    pause
    goto DIAGNOSTICO_HARDWARE_RED
)
if "%subopcion%"=="6" goto MENU_PRINCIPAL
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
echo 4. Exportar registro completo
echo 5. Volver al menu principal
set /p subopcion="Ingresa tu eleccion (1-5): "

if "%subopcion%"=="1" (
    echo Listando aplicaciones instaladas...
    wmic product get name
    set /p app="Ingresa el nombre de la app a desinstalar (o 'cancelar'): "
    if /i "%app%" neq "cancelar" (
        start cmd /k "wmic product where name='%app%' call uninstall && echo Desinstalacion completada. >> %LOG% && echo Desinstalacion completada. && pause && exit"
        echo Desinstalacion iniciada en nueva ventana. >> %LOG%
        echo Desinstalacion iniciada. Revisa la ventana secundaria.
    ) else (
        echo Desinstalacion cancelada. >> %LOG%
        echo Desinstalacion cancelada.
    )
    pause
    goto GESTION_APLICACIONES_REGISTRO
)
if "%subopcion%"=="2" (
    echo Instalando CCleaner...
    start cmd /k "winget install Piriform.CCleaner && echo Ejecuta CCleaner manualmente. >> %LOG% && echo Ejecuta CCleaner manualmente. && pause && exit"
    echo Instalacion iniciada en nueva ventana. >> %LOG%
    echo Instalacion iniciada. Revisa la ventana secundaria.
    pause
    goto GESTION_APLICACIONES_REGISTRO
)
if "%subopcion%"=="3" (
    echo Reparando permisos del registro...
    start cmd /k "secedit /configure /cfg %windir%\inf\defltbase.inf /db defltbase.sdb /verbose && echo Permisos reparados. >> %LOG% && echo Permisos reparados. && pause && exit"
    echo Reparacion iniciada en nueva ventana. >> %LOG%
    echo Reparacion iniciada. Revisa la ventana secundaria.
    pause
    goto GESTION_APLICACIONES_REGISTRO
)
if "%subopcion%"=="4" (
    echo Exportando registro completo...
    start cmd /k "reg export HKLM\Software C:\MantenimientoLogs\Registro_%DATE:~-4%%DATE:~3,2%%DATE:~0,2%.reg /y && echo Registro exportado. >> %LOG% && echo Registro exportado. && pause && exit"
    echo Exportacion iniciada en nueva ventana. >> %LOG%
    echo Exportacion iniciada. Revisa la ventana secundaria.
    pause
    goto GESTION_APLICACIONES_REGISTRO
)
if "%subopcion%"=="5" goto MENU_PRINCIPAL
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
echo 5. Reiniciar explorador de Windows
echo 6. Volver al menu principal
set /p subopcion="Ingresa tu eleccion (1-6): "

if "%subopcion%"=="1" (
    echo Instalando BlueScreenView...
    start cmd /k "winget install NirSoft.BlueScreenView && echo Ejecuta BlueScreenView manualmente. >> %LOG% && echo Ejecuta BlueScreenView manualmente. && pause && exit"
    echo Instalacion iniciada en nueva ventana. >> %LOG%
    echo Instalacion iniciada. Revisa la ventana secundaria.
    pause
    goto SOLUCION_PROBLEMAS_ESPECIFICOS
)
if "%subopcion%"=="2" (
    echo Identificando procesos que consumen recursos...
    start cmd /k "tasklist /svc /fi \"cputime gt 00:00:00\" | sort /r && echo Procesos mostrados. >> %LOG% && echo Procesos mostrados. Revisa el log. && pause && exit"
    echo Analisis iniciado en nueva ventana. >> %LOG%
    echo Analisis iniciado. Revisa la ventana secundaria.
    pause
    goto SOLUCION_PROBLEMAS_ESPECIFICOS
)
if "%subopcion%"=="3" (
    echo Reparando errores de arranque con Bootrec...
    start cmd /k "echo Ejecuta estos comandos en el entorno de recuperacion: && echo bootrec /fixmbr && echo bootrec /fixboot && echo bootrec /scanos && echo bootrec /rebuildbcd && echo Usa el entorno de recuperacion. >> %LOG% && echo Usa el entorno de recuperacion. && pause && exit"
    echo Instrucciones mostradas en nueva ventana. >> %LOG%
    echo Instrucciones mostradas. Revisa la ventana secundaria.
    pause
    goto SOLUCION_PROBLEMAS_ESPECIFICOS
)
if "%subopcion%"=="4" (
    echo Restaurando sistema a configuracion base...
    start cmd /k "systemreset -cleanpc && echo Restauracion iniciada. >> %LOG% && echo Sigue las instrucciones en pantalla. && pause && exit"
    echo Restauracion iniciada en nueva ventana. >> %LOG%
    echo Restauracion iniciada. Revisa la ventana secundaria.
    pause
    goto SOLUCION_PROBLEMAS_ESPECIFICOS
)
if "%subopcion%"=="5" (
    echo Reiniciando explorador de Windows...
    start cmd /k "taskkill /f /im explorer.exe && start explorer.exe && echo Explorador reiniciado. >> %LOG% && echo Explorador reiniciado. && pause && exit"
    echo Reinicio iniciado en nueva ventana. >> %LOG%
    echo Reinicio iniciado. Revisa la ventana secundaria.
    pause
    goto SOLUCION_PROBLEMAS_ESPECIFICOS
)
if "%subopcion%"=="6" goto MENU_PRINCIPAL
echo Opcion no valida.
timeout /t 2 >nul
goto SOLUCION_PROBLEMAS_ESPECIFICOS

:CREAR_PUNTO_RESTAURACION
cls
echo ===========================================================================
echo Creando punto de restauracion...
echo ===========================================================================
start cmd /k "powershell -Command \"Checkpoint-Computer -Description 'Mantenimiento Ark Dev Solutions' -RestorePointType 'MODIFY_SETTINGS'\" && echo Punto de restauracion creado. >> %LOG% && echo Punto de restauracion creado. && pause && exit"
echo Creacion iniciada en nueva ventana. >> %LOG%
echo Creacion iniciada. Revisa la ventana secundaria.
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
echo Sistema: %OSName% (Build %OSBuild%) >> %informe%
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
echo Analizando eventos criticos...
start cmd /k "wevtutil qe System /q:\"*[System[(Level=1 or Level=2)]]\" /c:10 /f:text && echo Analisis completado. >> %LOG% && echo Analisis completado. Revisa el log. && pause && exit"
echo Analisis iniciado en nueva ventana. >> %LOG%
echo Analisis iniciado. Revisa la ventana secundaria.
pause
goto MENU_PRINCIPAL

:OPTIMIZACION_ALMACENAMIENTO
cls
echo ===========================================================================
echo Optimizacion de almacenamiento
echo ===========================================================================
echo Optimizando almacenamiento con Storage Sense...
start cmd /k "cleanmgr /sagerun:1 && echo Optimizacion completada. >> %LOG% && echo Optimizacion completada. && pause && exit"
echo Optimizacion iniciada en nueva ventana. >> %LOG%
echo Optimizacion iniciada. Revisa la ventana secundaria.
pause
goto MENU_PRINCIPAL

:REPARACION_APPS_STORE
cls
echo ===========================================================================
echo Reparacion de aplicaciones de Microsoft Store
echo ===========================================================================
echo Reparando aplicaciones de Store...
start cmd /k "powershell -Command \"Get-AppxPackage | % { Add-AppxPackage -DisableDevelopmentMode -Register \\\"$($_.InstallLocation)\\AppXManifest.xml\\\" -Verbose }\" && echo Reparacion completada. >> %LOG% && echo Reparacion completada. && pause && exit"
echo Reparacion iniciada en nueva ventana. >> %LOG%
echo Reparacion iniciada. Revisa la ventana secundaria.
pause
goto MENU_PRINCIPAL

:VERIFICACION_CONTROLADORES
cls
echo ===========================================================================
echo Verificacion y actualizacion de controladores
echo ===========================================================================
echo 1. Verificar controladores instalados
echo 2. Actualizar controladores con pnputil
echo 3. Volver al menu principal
set /p subopcion="Ingresa tu eleccion (1-3): "

if "%subopcion%"=="1" (
    echo Verificando controladores instalados...
    start cmd /k "pnputil /enum-drivers && echo Verificacion completada. >> %LOG% && echo Verificacion completada. Revisa el log. && pause && exit"
    echo Verificacion iniciada en nueva ventana. >> %LOG%
    echo Verificacion iniciada. Revisa la ventana secundaria.
    pause
    goto VERIFICACION_CONTROLADORES
)
if "%subopcion%"=="2" (
    echo Actualizando controladores con pnputil...
    start cmd /k "pnputil /add-driver *.inf /subdirs /install && echo Actualizacion completada. >> %LOG% && echo Actualizacion completada. && pause && exit"
    echo Actualizacion iniciada en nueva ventana. >> %LOG%
    echo Actualizacion iniciada. Revisa la ventana secundaria.
    pause
    goto VERIFICACION_CONTROLADORES
)
if "%subopcion%"=="3" goto MENU_PRINCIPAL
echo Opcion no valida.
timeout /t 2 >nul
goto VERIFICACION_CONTROLADORES

:MANTENIMIENTO_AUTOMATICO
cls
echo ===========================================================================
echo Mantenimiento automatico completo
echo ===========================================================================
echo Ejecutando mantenimiento automatico...
start cmd /k "sfc /scannow && DISM /Online /Cleanup-Image /RestoreHealth && del /q /s %TEMP%\*.* 2>nul && cleanmgr /sagerun:1 && winget upgrade --all && powershell -Command \"Checkpoint-Computer -Description 'Mantenimiento Automatico' -RestorePointType 'MODIFY_SETTINGS'\" && echo Mantenimiento automatico completado. >> %LOG% && echo Mantenimiento automatico completado. && pause && exit"
echo Mantenimiento automatico iniciado en nueva ventana. >> %LOG%
echo Mantenimiento automatico iniciado. Revisa la ventana secundaria.
pause
goto MENU_PRINCIPAL

:GESTION_SERVICIOS
cls
echo ===========================================================================
echo Gestion de servicios avanzada
echo ===========================================================================
echo 1. Listar servicios activos
echo 2. Detener un servicio especifico
echo 3. Iniciar un servicio especifico
echo 4. Volver al menu principal
set /p subopcion="Ingresa tu eleccion (1-4): "

if "%subopcion%"=="1" (
    echo Listando servicios activos...
    start cmd /k "sc query state= active && echo Lista generada. >> %LOG% && echo Lista generada. Revisa el log. && pause && exit"
    echo Lista iniciada en nueva ventana. >> %LOG%
    echo Lista iniciada. Revisa la ventana secundaria.
    pause
    goto GESTION_SERVICIOS
)
if "%subopcion%"=="2" (
    set /p servicio="Ingresa el nombre del servicio a detener (ej. wuauserv): "
    echo Deteniendo servicio %servicio%...
    start cmd /k "sc stop %servicio% && echo Servicio detenido. >> %LOG% && echo Servicio detenido. && pause && exit"
    echo Detencion iniciada en nueva ventana. >> %LOG%
    echo Detencion iniciada. Revisa la ventana secundaria.
    pause
    goto GESTION_SERVICIOS
)
if "%subopcion%"=="3" (
    set /p servicio="Ingresa el nombre del servicio a iniciar (ej. wuauserv): "
    echo Iniciando servicio %servicio%...
    start cmd /k "sc start %servicio% && echo Servicio iniciado. >> %LOG% && echo Servicio iniciado. && pause && exit"
    echo Inicio iniciado en nueva ventana. >> %LOG%
    echo Inicio iniciado. Revisa la ventana secundaria.
    pause
    goto GESTION_SERVICIOS
)
if "%subopcion%"=="4" goto MENU_PRINCIPAL
echo Opcion no valida.
timeout /t 2 >nul
goto GESTION_SERVICIOS

:MONITOREO_RENDIMIENTO
cls
echo ===========================================================================
echo Monitoreo de rendimiento
echo ===========================================================================
echo Iniciando monitoreo de rendimiento...
start cmd /k "perfmon && echo Monitoreo iniciado. >> %LOG% && echo Monitoreo iniciado. Revisa la ventana secundaria. && pause && exit"
echo Monitoreo iniciado en nueva ventana. >> %LOG%
echo Monitoreo iniciado. Revisa la ventana secundaria.
pause
goto MENU_PRINCIPAL

:FIN
cls
echo ===========================================================================
echo Mantenimiento completado - Ark Dev Solutions
echo Log guardado en: %LOG%
echo Gracias por usar nuestro script. Contactanos en arkdev.pages.dev/nosotros
echo ===========================================================================
powershell -Command "New-Item -Path 'HKLM:\SOFTWARE\ArkDevSolutions' -Force; Set-ItemProperty -Path 'HKLM:\SOFTWARE\ArkDevSolutions' -Name 'UltimoMantenimiento' -Value (Get-Date -Format 'yyyy-MM-dd HH:mm:ss'); Set-ItemProperty -Path 'HKLM:\SOFTWARE\ArkDevSolutions' -Name 'Responsable' -Value 'Ark Dev Solutions'; Set-ItemProperty -Path 'HKLM:\SOFTWARE\ArkDevSolutions' -Name 'Comentario' -Value 'Mantenimiento Ultra Pro Plus realizado'"
echo Mantenimiento registrado en el Registro de Windows. >> %LOG%
pause
exit /b