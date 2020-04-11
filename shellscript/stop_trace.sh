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
# - Validando parametro
if [ ! $# -eq 1 ]; then
    echo "$0 - 1.0 - Erro de sintaxe!"
    echo "Utilize $0 <Numero_trace>"
    echo "Para identificar o numero utilize list_trace.sh"
    exit 1
fi
# Interrompe a ferramenta fbtracemrg
$TRACE -se $IP:service_mgr -user SYSDBA -password $PWFB -stop -id $1
