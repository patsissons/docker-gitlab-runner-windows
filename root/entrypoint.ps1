# $installPath = 'C:\Gitlab-Runner'
# $exeName = 'gitlab-runner.exe'
# $serviceName = 'gitlab-runner'

# $exePath = Join-Path $installPath $exeName

# # stop service if it is already started
# Stop-Service -Name $serviceName -ErrorAction SilentlyContinue

# # run startup scripts
# Get-ChildItem 'C:\startup' | Where-Object { $_.Name -match '\d+.*\.ps1' } | ForEach-Object { & $_.FullName }

# # install service if not already installed
# If (!(Get-Service $serviceName -ErrorAction SilentlyContinue))
# {
#     Write-Output "installing $serviceName service..."
#     & $exePath install

#     Write-Output "registering $serviceName agent..."
#     & $exePath register --non-interactive
# }

# Write-Output "Starting up $serviceName service..."
# Start-Service -Name $serviceName

# Write-Output "Setting up watcher for $serviceName service..."
# & .\Wait-Service.ps1 -ServiceName $serviceName


& .\Wait-Service.ps1 -ServiceName EventLog
