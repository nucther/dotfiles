#!/bin/bash 
#

javaMarketDateName=(Wage Kliwon Legi Pahing Pon)

getJavaDay() {
    now=$(date --date="$1" +"%s")
    first=$(date --date="1938/1/1" +"%s")
    dayOfJavaneseMarket=$((($now + $first) / 86400))
    res=$((dayOfJavaneseMarket%5))
    echo $res
}

javanow(){
    dn=$(date)
    jn=$(getJavaDay $dn)

    echo "$(date +'%a') ${javaMarketDateName[$jn - 1]} , "
}

case $1 in
    javanow)
        javanow
        ;;
esac
