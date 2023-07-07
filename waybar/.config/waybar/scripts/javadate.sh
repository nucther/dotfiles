#!/bin/bash 

javaMarketDateName=(Wage Kliwon Legi Pahing Pon)

getJavaDay() {
    now=$(date --date="$1" +"%s")
    first=$(date --date="1938/1/1" +"%s")
    dayOfJavaneseMarket=$((($now + $first) / 86400))
    res=$((dayOfJavaneseMarket%5))
    echo $res
}

dateTarget=$(date +"%d %b %Y")
dayOfWeek=$(date --date="$dateTarget" +"%u")
now=$(getJavaDay $dateTarget)
nextFriday=$(date -d "friday +1 weeks")
nf=$(getJavaDay $nextFriday)

printf  '{"text": "%s", "tooltip": "%s"} ' "($(date --date="$dateTarget" +"%a") ${javaMarketDateName[$res - 1]})  " "Next Friday: ${javaMarketDateName[$nf - 1]}"
