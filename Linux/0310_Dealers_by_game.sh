#!/bin/bash

#BlackJack Dealers
printf "%s\n" "Data for 3/10"
awk -F" " '{print $1,$2,$3,$4}' 0310_Dealer_schedule | grep "Hour"
awk -F" " '{print $1,$2,$3,$4}' 0310_Dealer_schedule | grep "05:00:00 AM"
awk -F" " '{print $1,$2,$3,$4}' 0310_Dealer_schedule | grep "08:00:00 AM"
awk -F" " '{print $1,$2,$3,$4}' 0310_Dealer_schedule | grep "02:00:00 PM"
awk -F" " '{print $1,$2,$3,$4}' 0310_Dealer_schedule | grep "08:00:00 PM"
awk -F" " '{print $1,$2,$3,$4}' 0310_Dealer_schedule | grep "11:00:00 PM"

#Roulette Dealers
awk -F" " '{print $1,$2,$5,$6}' 0310_Dealer_schedule | grep "Hour"
awk -F" " '{print $1,$2,$5,$6}' 0310_Dealer_schedule | grep "05:00:00 AM"
awk -F" " '{print $1,$2,$5,$6}' 0310_Dealer_schedule | grep "08:00:00 AM"
awk -F" " '{print $1,$2,$5,$6}' 0310_Dealer_schedule | grep "02:00:00 PM"
awk -F" " '{print $1,$2,$5,$6}' 0310_Dealer_schedule | grep "08:00:00 PM"
awk -F" " '{print $1,$2,$5,$6}' 0310_Dealer_schedule | grep "11:00:00 PM"

#Texas Hold_em Dealers
awk -F" " '{print $1,$2,$7,$8}' 0310_Dealer_schedule | grep "Hour"
awk -F" " '{print $1,$2,$7,$8}' 0310_Dealer_schedule | grep "05:00:00 AM"
awk -F" " '{print $1,$2,$7,$8}' 0310_Dealer_schedule | grep "08:00:00 AM"
awk -F" " '{print $1,$2,$7,$8}' 0310_Dealer_schedule | grep "02:00:00 PM"
awk -F" " '{print $1,$2,$7,$8}' 0310_Dealer_schedule | grep "08:00:00 PM"
awk -F" " '{print $1,$2,$7,$8}' 0310_Dealer_schedule | grep "11:00:00 PM"

