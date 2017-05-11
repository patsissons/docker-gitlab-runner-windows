# attempt to auto update packages
If ($env:AUTO_UPDATE -eq 'true')
{
    & choco upgrade -y git gitlab-runner
}
