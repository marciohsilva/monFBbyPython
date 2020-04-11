#!/bin/sh
# Desenvolvido por Marcio Henrique em maio-2019
# marciohsilva@bitdoc.com.br
PWFB=`/usr/bin/cat /etc/pwfb`
TRACE="/opt/firebird/bin/fbtracemgr"
NOME=$1
LOG="/var/log/fbtrace_$NOME.log"
CONF="/script/fb3/traceapi/"$2
IP="localhost/3050"
# - Validando user
if [ "$(id -u)" != "0" ]; then
    /usr/bin/echo "Este script deve ser executado com o usuario 'root'."
    exit 1
fi
# - Validando parametro
if [ ! $# -eq 2 ]; then
    echo "$0 - 1.0 - Erro de sintaxe!"
    echo "Utilize $0 <nome_trace> <arquivo_conf>"
    exit 1
fi
if [ ! -e $CONF ]; then
   /usr/bin/echo "O arquivo conf $CONF nao foi encontrado!" 
   exit 1
fi
# Executa a ferramenta fbtracemrg
$TRACE -se $IP:service_mgr -user SYSDBA -password $PWFB -start -name $NOME -config $CONF > $LOG
/usr/bin/echo "Trace encerrado!"
/usr/bin/echo "Consulte o arquivo $LOG"
