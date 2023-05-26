#!/bin/bash 

javaMarketDateName=(Pon Wage Kliwon Legi Pahing)


dayOfWeek=$(date +"%u")
echo "( $(date +"%a") ${javaMarketDateName[($dayOfWeek - 1)]} )"
