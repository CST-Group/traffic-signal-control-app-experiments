#!/bin/bash

port=8000

for concentracao in `seq 0.1 0.3 1.0`;
do
   for i in `seq 1 1 10`;
   do
      pconcentracao=$( echo $concentracao | sed -e 's/,/./g; s/[^0-9\.]//g')	
      sumo -n corridor.net.xml -r experimentos/corridor.p$pconcentracao.$i.rou.xml --summary-output experimentos/rep/output_sumo.corridor.p$pconcentracao.$i.rep.xml --remote-port $port &
      java -jar ../ExperimentoSUMO.jar 127.0.0.1 $port
      port=$[$port+1]
      sleep 2
   done   
done   
