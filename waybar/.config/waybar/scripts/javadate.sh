#!/bin/bash 

javaMarketDateName=(Wage Kliwon Legi Pahing Pon)

dateTarget=$(date +"%d %b %Y")
dayOfWeek=$(date --date="$dateTarget" +"%u")
now=$(date --date="$dateTarget" +"%s")
first=$(date --date="1938/1/1" +"%s")
dayOfJavaneseMarket=$((($now + $first) / 86400))
res=$((dayOfJavaneseMarket%5))
echo "( $(date --date="$dateTarget" +"%a") ${javaMarketDateName[$res - 1]} )"
