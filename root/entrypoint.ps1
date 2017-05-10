$installPath = 'C:\Gitlab-Runner'
$exeName = 'gitlab-runner.exe'
$serviceName = 'gitlab-runner'

$exePath = Join-Path $installPath $exeName

If (!(Get-Service $serviceName -ErrorAction SilentlyContinue))
{
    Write-Output "installing $serviceName service..."
    & $exePath install

    Write-Output "registering $serviceName agent..."
    & $exePath register --non-interactive
}

Write-Output "Starting up $serviceName service..."
Start-Service -Name $serviceName

Write-Output "Setting up watcher for $serviceName service..."
& .\Wait-Service.ps1 -ServiceName $serviceName
