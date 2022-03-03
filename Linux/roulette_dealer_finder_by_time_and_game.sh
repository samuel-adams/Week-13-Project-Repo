#!/bin/bash
echo "Hour, AM/PM, Name"
case $3 in
	Blackjack)
		#BlackJack Dealers
		awk -F" " '{print $1,$2,$3,$4" - BlackJack"}' $1_Dealer_schedule | grep "${2}"
		;;
	Roulette)
		#Roulette Dealers
		awk -F" " '{print $1,$2,$5,$6" - Roulette"}' $1_Dealer_schedule | grep "${2}"
		;;
	Texas)
		#Texas Hold_em Dealers
		awk -F" " '{print $1,$2,$7,$8" - Texas Holdem"}' $1_Dealer_schedule | grep "${2}"
		;;
	*)
		echo "For which game are you inquiring? Blackack, Roulette or Texas Holdem"
		;;
esac
