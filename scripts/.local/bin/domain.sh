#!/bin/bash

#Specify all the domains you want to check
DOMAINS="nurohman.com jalansunyi.com lupate.men"

current_epoch=`date '+%s'`
for dm in $DOMAINS
do
  expiry_date=`whois $dm | grep -i "Exp"| head -1 | awk '{print $NF}'`
  echo -n " $dm - Expires on $expiry_date "
  expiry_epoch=`date --date="$expiry_date" '+%s'`
  epoch_diff=`expr $expiry_epoch - $current_epoch`
  days=`expr $epoch_diff / 86400`
  echo " $days days remaining. "
done
