#!/usr/bin/env python
# -*- coding: utf-8 -*-
import os.path
import sys
print(sys.argv[0])
if len(sys.argv) <= 1:
  print('Erro de sintaxe')
  print('Informe o nome do arquivo gerado pelo fb_trace')
  sys.exit('Exemplo: python 3 analisatrace.py trace1.log')
try:
  arqtrace = sys.argv[1]
  arqsaida = sys.argv[1]+".result"
except Exception as erro:
  print('Erro no parametro fornecido')
  sys.exit('Informe o arquivo gerado pelo fb_trace')
if not os.path.isfile(arqtrace):
  sys.exit('O arquivo ' + arqtrace + ' nao foi encontrado')
arqtrace = open(arqtrace,"r",encoding='utf-8')
log = open(arqsaida,"w")
log.write("Statement;table;natural;tempo_ms\n")
comando=""
nometab=""
tab=0
tabrange=False
tabelas=[]
Natural=""
tempo=""
for lin in arqtrace:
    tab=+1
    if lin[0:9]=="Statement":
        comando = lin[10:17]
    elif ("fetch(es)" in lin) and ("ms" in lin):
        tempo = lin[0:7]
    elif lin[0:9]=="*********":
        tab=0
        tabrange=True
    elif (lin[4:5]=="-") and (lin[7:8]=="-") and lin.find("(")>0 and lin.find(")")>0:
        tabrange=False
    else:
        if tabrange and tab>0:
           if lin[0:1] != " ":
               nometab=lin[0:32]
               Natural=lin[31:41]
           if nometab.lstrip() != "" and Natural.lstrip() !="":    
               print("Statement:",comando,"Table:",nometab,"Natural:",Natural,"Tempo:",tempo)
               log.write(comando+";"+nometab.rstrip()+";"+Natural.lstrip()+";"+tempo.strip()+"\n")
arqtrace.close()
log.close()
print("Consulte o arquivo: " + arqsaida)
