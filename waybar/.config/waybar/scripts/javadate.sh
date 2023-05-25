#!/bin/bash 

javaMarketDateName=(Pahing Pon Wage Kliwon Legi)

dayOfWeek=$(date +"%u")
echo "( $(date +"%a") ${javaMarketDateName[($dayOfWeek - 1)]} )"
