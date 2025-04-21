@echo off
title Ark Secure v.4.0.0 - Proteccion Avanzada contra Ataques Ciberneticos
color 0A

net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Este script requiere privilegios administrativos.
    echo Por favor, ejecutalo como administrador.
    pause
    exit /b
)

if not exist "C:\SecureLogs" mkdir "C:\SecureLogs"
set "LOG=C:\SecureLogs\SecureLog_%DATE:~-4%%DATE:~3,2%%DATE:~0,2%_%TIME:~0,2%%TIME:~3,2%.txt"
echo Iniciando examen de seguridad avanzada - %DATE% %TIME% > %LOG%

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
echo ARK DEV  --------^<^>Soporte: arkdev.pages.dev/nosotros
echo Ark Secure v.4.0.0 - Proteccion Avanzada contra Ataques Ciberneticos
echo Sistema operativo detectado: %OSName% (Build %OSBuild%)
timeout /t 2 >nul

:MENU_PRINCIPAL
cls
echo ===========================================================================
echo ARK SECURE V.4.0.0 - PROTECCION AVANZADA
echo Sistema operativo: %OSName% (Build %OSBuild%)
echo ===========================================================================
echo Selecciona una categoria:
echo 1. Verificar vulnerabilidades del sistema
echo 2. Escanear puertos abiertos
echo 3. Analizar programas en ejecucion
echo 4. Verificar conexiones TCP/IP sospechosas
echo 5. Comprobar configuracion del firewall
echo 6. Ejecutar analisis de malware
echo 7. Verificar seguridad de cuentas y permisos
echo 8. Analizar registro de eventos
echo 9. Verificar configuraciones de seguridad avanzadas
echo 10. Detectar software no autorizado
echo 11. Generar informe de seguridad
echo 12. Salir
echo ===========================================================================
set /p opcion="Ingresa tu eleccion (1-12): "

if "%opcion%"=="1" goto VULNERABILIDADES
if "%opcion%"=="2" goto PUERTOS_ABIERTOS
if "%opcion%"=="3" goto PROGRAMAS_EJECUCION
if "%opcion%"=="4" goto CONEXIONES_TCP
if "%opcion%"=="5" goto FIREWALL
if "%opcion%"=="6" goto MALWARE
if "%opcion%"=="7" goto CUENTAS_PERMISOS
if "%opcion%"=="8" goto REGISTRO_EVENTOS
if "%opcion%"=="9" goto CONFIGURACIONES_SEGURIDAD
if "%opcion%"=="10" goto SOFTWARE_NO_AUTORIZADO
if "%opcion%"=="11" goto GENERAR_INFORME
if "%opcion%"=="12" goto FIN
echo Opcion no valida.
timeout /t 2 >nul
goto MENU_PRINCIPAL

:VULNERABILIDADES
cls
echo ===========================================================================
echo Verificando vulnerabilidades del sistema...
echo ===========================================================================
echo Comprobando actualizaciones pendientes...
start powershell -Command "Get-HotFix | Select-Object HotFixID,InstalledOn | Format-Table -AutoSize > C:\SecureLogs\Patches.txt; Write-Host 'Parches instalados listados en C:\SecureLogs\Patches.txt.'; Write-Host 'Revisa C:\SecureLogs\Patches.txt y verifica manualmente Windows Update.'; pause; exit"
echo Verificacion iniciada. Revisa la ventana secundaria y Windows Update.
echo Verificacion de actualizaciones iniciada. >> %LOG%
set /p fix="¿Deseas buscar actualizaciones ahora? (S/N): "
if /i "%fix%"=="S" (
    start cmd /k "usoclient StartScan && echo Busqueda de actualizaciones iniciada. >> %LOG% && echo Busqueda iniciada. && pause && exit"
    echo Busqueda de actualizaciones iniciada en nueva ventana. >> %LOG%
)
start notepad C:\SecureLogs\Patches.txt
pause
goto MENU_PRINCIPAL

:PUERTOS_ABIERTOS
cls
echo ===========================================================================
echo Escaneando puertos abiertos...
echo ===========================================================================
echo Escaneando puertos con netstat...
netstat -an | findstr "LISTENING" > C:\SecureLogs\Ports.txt
echo Puertos abiertos listados en C:\SecureLogs\Ports.txt. >> %LOG%
echo Puertos abiertos detectados. Revisa C:\SecureLogs\Ports.txt.
set /p fix="¿Deseas cerrar algun puerto sospechoso? (S/N): "
if /i "%fix%"=="S" (
    set /p port="Ingresa el numero de puerto a cerrar (ej. 445): "
    start cmd /k "netsh advfirewall firewall add rule name=\"Bloquear Puerto %port%\" dir=in action=block protocol=TCP localport=%port% && echo Puerto %port% bloqueado. >> %LOG% && echo Puerto %port% bloqueado. && pause && exit"
    echo Intento de cerrar puerto %port% iniciado. >> %LOG%
)
start notepad C:\SecureLogs\Ports.txt
pause
goto MENU_PRINCIPAL

:PROGRAMAS_EJECUCION
cls
echo ===========================================================================
echo Analizando programas en ejecucion...
echo ===========================================================================
echo Listando procesos activos...
tasklist > C:\SecureLogs\Processes.txt
echo Procesos listados en C:\SecureLogs\Processes.txt. >> %LOG%
echo Procesos detectados. Revisa C:\SecureLogs\Processes.txt.
set /p fix="¿Deseas terminar algun proceso sospechoso? (S/N): "
if /i "%fix%"=="S" (
    set /p proc="Ingresa el nombre del proceso (ej. notepad.exe): "
    start cmd /k "taskkill /IM %proc% /F && echo Proceso %proc% terminado. >> %LOG% && echo Proceso %proc% terminado. && pause && exit"
    echo Intento de terminar %proc% iniciado. >> %LOG%
)
start notepad C:\SecureLogs\Processes.txt
pause
goto MENU_PRINCIPAL

:CONEXIONES_TCP
cls
echo ===========================================================================
echo Verificando conexiones TCP/IP sospechosas...
echo ===========================================================================
echo Analizando conexiones activas...
netstat -ano | findstr "ESTABLISHED" > C:\SecureLogs\Connections.txt
echo Conexiones activas listadas en C:\SecureLogs\Connections.txt. >> %LOG%
echo Conexiones detectadas. Revisa C:\SecureLogs\Connections.txt.
set /p fix="¿Deseas bloquear alguna conexion sospechosa? (S/N): "
if /i "%fix%"=="S" (
    set /p ip="Ingresa la IP remota a bloquear (ej. 192.168.1.1): "
    start cmd /k "netsh advfirewall firewall add rule name=\"Bloquear IP %ip%\" dir=out action=block remoteip=%ip% && echo IP %ip% bloqueada. >> %LOG% && echo IP %ip% bloqueada. && pause && exit"
    echo Intento de bloquear %ip% iniciado. >> %LOG%
)
start notepad C:\SecureLogs\Connections.txt
pause
goto MENU_PRINCIPAL

:FIREWALL
cls
echo ===========================================================================
echo Comprobando configuracion del firewall...
echo ===========================================================================
echo Verificando estado del firewall...
netsh advfirewall show allprofiles > C:\SecureLogs\Firewall.txt
echo Estado del firewall guardado en C:\SecureLogs\Firewall.txt. >> %LOG%
findstr "State.*ON" C:\SecureLogs\Firewall.txt >nul
if %errorLevel% neq 0 (
    echo Alerta: El firewall esta desactivado en algun perfil.
    echo Alerta: Firewall desactivado detectado. >> %LOG%
    set /p fix="¿Deseas activar el firewall? (S/N): "
    if /i "%fix%"=="S" (
        start cmd /k "netsh advfirewall set allprofiles state on && echo Firewall activado. >> %LOG% && echo Firewall activado. && pause && exit"
        echo Activacion del firewall iniciada. >> %LOG%
    )
) else (
    echo Firewall activo en todos los perfiles.
    echo Firewall activo detectado. >> %LOG%
)
start notepad C:\SecureLogs\Firewall.txt
pause
goto MENU_PRINCIPAL

:MALWARE
cls
echo ===========================================================================
echo Ejecutando analisis de malware...
echo ===========================================================================
echo Iniciando escaneo con Microsoft Defender...
start powershell -Command "Start-MpScan -ScanType QuickScan; if ($?) {echo 'Escaneo completado.' >> $env:LOG; Write-Host 'Escaneo completado.'} else {echo 'Error en el escaneo.' >> $env:LOG; Write-Host 'Error en el escaneo.'}; pause; exit"
echo Escaneo de malware iniciado en nueva ventana. >> %LOG%
echo Escaneo iniciado. Revisa la ventana secundaria.
pause
goto MENU_PRINCIPAL

:CUENTAS_PERMISOS
cls
echo ===========================================================================
echo Verificando seguridad de cuentas y permisos...
echo ===========================================================================
echo Listando cuentas de usuario...
net user > C:\SecureLogs\Users.txt
echo Cuentas listadas en C:\SecureLogs\Users.txt. >> %LOG%
echo Cuentas detectadas. Revisa C:\SecureLogs\Users.txt.
set /p fix="¿Deseas deshabilitar alguna cuenta sospechosa? (S/N): "
if /i "%fix%"=="S" (
    set /p user="Ingresa el nombre de la cuenta (ej. Invitado): "
    start cmd /k "net user %user% /active:no && echo Cuenta %user% deshabilitada. >> %LOG% && echo Cuenta %user% deshabilitada. && pause && exit"
    echo Intento de deshabilitar %user% iniciado. >> %LOG%
)
start notepad C:\SecureLogs\Users.txt
pause
goto MENU_PRINCIPAL

:REGISTRO_EVENTOS
cls
echo ===========================================================================
echo Analizando registro de eventos...
echo ===========================================================================
echo Buscando eventos criticos y de error...
wevtutil qe System /q:"*[System[(Level=1 or Level=2)]]" /c:10 /f:text > C:\SecureLogs\Events.txt
echo Eventos listados en C:\SecureLogs\Events.txt. >> %LOG%
echo Analisis completado. Revisa C:\SecureLogs\Events.txt.
start notepad C:\SecureLogs\Events.txt
pause
goto MENU_PRINCIPAL

:CONFIGURACIONES_SEGURIDAD
cls
echo ===========================================================================
echo Verificando configuraciones de seguridad avanzadas...
echo ===========================================================================
echo Comprobando politicas de grupo...
start cmd /k "gpresult /R > C:\SecureLogs\GroupPolicy.txt && echo Politicas de grupo listadas en C:\SecureLogs\GroupPolicy.txt. >> %LOG% && echo Politicas listadas. Revisa C:\SecureLogs\GroupPolicy.txt. && pause && exit"
echo Verificacion iniciada. Revisa la ventana secundaria.
start notepad C:\SecureLogs\GroupPolicy.txt
pause
goto MENU_PRINCIPAL

:SOFTWARE_NO_AUTORIZADO
cls
echo ===========================================================================
echo Detectando software no autorizado...
echo ===========================================================================
echo Listando programas instalados...
start powershell -Command "Get-WmiObject -Class Win32_Product | Select-Object Name,Vendor,Version | Format-Table -AutoSize > C:\SecureLogs\InstalledSoftware.txt; Write-Host 'Software instalado listado en C:\SecureLogs\InstalledSoftware.txt.'; pause; exit"
echo Deteccion iniciada. Revisa la ventana secundaria.
start notepad C:\SecureLogs\InstalledSoftware.txt
pause
goto MENU_PRINCIPAL

:GENERAR_INFORME
cls
echo ===========================================================================
echo Generando informe de seguridad...
echo ===========================================================================
set "informe=%USERPROFILE%\Desktop\Informe_Seguridad_%DATE:~-4%%DATE:~3,2%%DATE:~0,2%.txt"
echo Informe de Seguridad Avanzada - Ark Dev Solutions > %informe%
echo Fecha: %DATE% %TIME% >> %informe%
echo Sistema: %OSName% (Build %OSBuild%) >> %informe%
echo --------------------------------------------- >> %informe%
type %LOG% >> %informe%
echo Informe generado en %informe%. >> %LOG%
echo Informe generado en %informe%.
start notepad %informe%
pause
goto MENU_PRINCIPAL

:FIN
cls
echo ===========================================================================
echo Examen de seguridad avanzada completado - Ark Dev Solutions
echo Log guardado en: %LOG%
echo Gracias por usar Ark Secure v.4.0.0. Contactanos en arkdev.pages.dev/nosotros
echo ===========================================================================
pause
exit /b