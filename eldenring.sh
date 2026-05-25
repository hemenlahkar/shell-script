#!/bin/bash

echo "You Died!"

# First beast battle

beast=$(( $RANDOM % 2 ))

echo "You first approaches. Prepare to battle. Pick a number between 0-1. (0/1)"
read tarnished

if [[ $beast == $tarnished && 47 > 28 ]]; then
	echo "Beast VANQUISHED!! Congrats fellow tarnished"
else
	echo "Beast chose $beast - You Died"
	exit 1
fi

# Second beast battle
sleep 2

echo "Boss battle. Get scared. It's Margit. Pick a number between 0-9. (0-9)"

read tarnished

beast=$(( $RANDOM % 10 ))

if [[ $beast == $tarnished || $tarnished == "coffee" ]]; then
	if [[ $USER == "root" ]]; then
		echo "Beast VANQUISHED!!!"
	fi
elif [[ $USER == "hemen" ]]; then
	echo "Hey, Hemen always wins. You vanquished beast."
else
	echo "You Died!!"
fi

