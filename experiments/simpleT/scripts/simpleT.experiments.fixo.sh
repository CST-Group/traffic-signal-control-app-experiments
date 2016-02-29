#!/bin/bash

for concentracao in `seq 0.1 0.3 1.0`;
do
   for i in `seq 1 1 10`;
   do
      pconcentracao=$( echo $concentracao | sed -e 's/,/./g; s/[^0-9\.]//g')	
      sumo -n simpleT.net.xml -r experimentos/simpleT.p$pconcentracao.$i.rou.xml --summary-output experimentos/fixo/output_sumo.simpleT.p$pconcentracao.$i.fixo.xml
   done   
done   
