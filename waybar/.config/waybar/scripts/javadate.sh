#!/bin/bash 

javaMarketDateName=(Pon Wage Kliwon Legi Pahing)

dateTarget="today"
dayOfWeek=$(date --date="$dateTarget" +"%u")
now=$(date --date="$dateTarget" +"%s")
first=$(date --date="1938/1/1" +"%s")
dayOfJavaneseMarket=$((($now + $first) / 86400))
res=$((dayOfJavaneseMarket%5))
#echo "now: $now"
#echo "first: $first"
#echo "x=$(($now + $first))"
#echo "Java: $dayOfJavaneseMarket"
#echo $(($dayOfJavaneseMarket % 5 ))
#echo $(date --date="$dateTarget" +"%d %b %Y")
echo "( $(date --date="$dateTarget" +"%a") ${javaMarketDateName[$res - 1]} )"
