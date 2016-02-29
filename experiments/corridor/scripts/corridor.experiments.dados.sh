#!/bin/bash

timeWindow=5400

for concentracao in `seq 0.1 0.3 1.0`;
do
   for i in `seq 1 1 10`;
   do
      pconcentracao=$( echo $concentracao | sed -e 's/,/./g; s/[^0-9\.]//g')	
      seed=$(date +%s%N | cut -b1-13)
      python /usr/share/sumo/tools/trip/randomTrips.py -n corridor.net.xml -e $timeWindow -l -L -p $pconcentracao -s $seed --fringe-factor 10 -o experimentos/corridor.p$pconcentracao.$i.trips.xml
      duarouter -n corridor.net.xml -t experimentos/corridor.p$pconcentracao.$i.trips.xml -o experimentos/corridor.p$pconcentracao.$i.rou.xml --ignore-errors --random
   done   
done   


