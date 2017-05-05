#FROM microsoft/windowsservercore
FROM microsoft/nanoserver

MAINTAINER Pat Sissons patricksissons@gmail.com

ENV REGISTRATION_TOKEN=''
ENV CI_SERVER_URL=''
ENV RUNNER_TAG_LIST=''
ENV RUNNER_NAME=''
ENV RUNNER_EXECUTOR='shell'
ENV RUNNER_SHELL='cmd'
ENV CONFIG_FILE=''
ENV REGISTER_RUN_UNTAGGED='false'
ENV RUNNER_REQUEST_CONCURRENCY=1
ENV RUNNER_BUILDS_DIR=''
ENV RUNNER_CACHE_DIR=''

RUN powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" & \
    SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin" & \
    choco install -y gitlab-runner & \
    gitlab-runner install & \
    gitlab-runner register --non-interactive

ADD root/ /

ENTRYPOINT ["C:\\ServiceMonitor.exe", "gitlab-runner"]
