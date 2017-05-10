$installPath = 'C:\Gitlab-Runner'
$exeName = 'gitlab-runner.exe'
$serviceName = 'gitlab-runner'

$exePath = Join-Path $installPath $exeName

If (!(Get-Service $serviceName -ErrorAction SilentlyContinue))
{
    echo "installing $serviceName service..."
    & $exePath install

    echo "registering $serviceName agent..."
    # & $exePath register --non-interactive
}

echo "Starting up $serviceName service..."
Start-Service -Name $serviceName

echo "Setting up watcher for $serviceName service..."
& .\Wait-Service.ps1 -ServiceName $serviceName
