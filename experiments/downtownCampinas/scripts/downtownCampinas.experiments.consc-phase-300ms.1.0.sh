#!/bin/bash

port=9000


   for i in `seq 3 1 10`;
   do	
      sumo -n centroCampinas.net.xml -r experimentos/centroCampinas.p1.0.$i.rou.xml --summary-output experimentos/consc-phase-300ms/output_sumo.centroCampinas.p1.0.$i.consc-phase-300ms.xml --remote-port $port &
      java -jar ../ExperimentoSUMO-CST-Consc-Phase-300ms.jar 127.0.0.1 $port
      port=$[$port+1]
      sleep 2
   done   
 
