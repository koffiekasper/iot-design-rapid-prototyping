#!/bin/bash


if [ ! -d /sys/class/gpio/gpio23/ ]
then
	echo "23" > /sys/class/gpio/export
	echo "in" > /sys/class/gpio/gpio23/direction
fi

while true
do
	movement=`cat /sys/class/gpio/gpio23/value`
	if [ $movement == '1' ]
	then
		moment=`date +"%D %T"`
		echo "Movement detected on "$moment
		echo $moment >> times.txt

		sleep 2
	fi
	sleep 1
done