# escape=`

FROM microsoft/windowsservercore

MAINTAINER Pat Sissons patricksissons@gmail.com

SHELL [ "powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';" ]

ENV chocolateyUseWindowsCompression false

ENV REGISTRATION_TOKEN=
ENV CI_SERVER_URL=
ENV RUNNER_TAG_LIST=
ENV RUNNER_NAME=
ENV RUNNER_EXECUTOR shell
ENV RUNNER_SHELL cmd
ENV CONFIG_FILE=
ENV REGISTER_RUN_UNTAGGED false
ENV RUNNER_REQUEST_CONCURRENCY 1
ENV RUNNER_BUILDS_DIR=
ENV RUNNER_CACHE_DIR=
ENV AUTO_UPDATE true

# install chocolatey
RUN iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'));

# install required packages
RUN choco install -y git --version 2.10.2 -params "/GitAndUnixToolsOnPath"; `
    choco install -y gitlab-runner

# copy scripts
ADD root/ /

CMD [ "powershell", "-File", "entrypoint.ps1" ]
