#!/bin/bash

record_photos () {
	for i in {1..$1};
	do
		filename="/home/pi/shared/iot_design_rapid_prototyping/images/$2.jpg" 
		fswebcam -r 1920x1080 $filename
	done
}



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
		moment=`date +"%F-%T"`
		record_photos 10 $moment
		echo "Movement detected on "$moment
	fi
	sleep 0.1
done
