#!/bin/bash
#Roulette Dealers
echo $1
awk -F" " '{print $1,$2,$5,$6}' $1_Dealer_schedule | grep "${2}"

