#!/bin/sh
# Desenvolvido por Marcio Henrique em maio-2019
# marciohsilva@bitdoc.com.br
PWFB=`/usr/bin/cat /etc/pwfb`
TRACE="/opt/firebird/bin/fbtracemgr"
IP="localhost/3050"
# - Validando user
if [ "$(id -u)" != "0" ]; then
    /usr/bin/echo "Este script deve ser executado com o usuario 'root'."
    exit 1
fi
# Executa a ferramenta fbtracemrg
$TRACE -se $IP:service_mgr -user SYSDBA -password $PWFB -list
