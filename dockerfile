# Usa a imagem base Windows Server Core 2022
FROM mcr.microsoft.com/windows/servercore:ltsc2022

# Instala o IIS
RUN dism /online /enable-feature /all /featurename:IIS-WebServer /NoRestart

# Copia os arquivos do site para a pasta padrão do IIS
COPY site-01/ C:/inetpub/wwwroot

# Expõe a porta padrão do IIS
EXPOSE 80

# Inicia o IIS ao iniciar o container
CMD powershell -NoLogo -Command Start-Service W3SVC; Wait-Event -Timeout 3600
