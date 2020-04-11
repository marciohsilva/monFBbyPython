# monFBbyPython
Monitoramento de banco de dados Firebird com Python (TraceAPI)

Para iniciar a execução da Trace API: execute o script da pasta shellscript/start_trace.sh Nome_trace arquivo.conf
Para listar a execução da Trace API: execute o script da pasta shellscript/list_trace.sh
Para interromper a execução da Trace API: execute o script da pasta shellscript/stop_trace.sh <id>

Para processar o log execute:
python3 analisatrace.py <arquivo_gerado_pelo_trace_api>
