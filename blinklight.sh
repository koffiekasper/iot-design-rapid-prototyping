if [ ! -d /sys/class/gpio/gpio21/ ]
then
	echo "21" > /sys/class/gpio/export
	echo "out" > /sys/class/gpio/gpio21/direction
fi

OUTPUT=$(cat /sys/class/gpio/gpio21/value)

if [ "$OUTPUT" = "0" ]; then	
	echo 1 > /sys/class/gpio/gpio21/value
else 
	echo 0 > /sys/class/gpio/gpio21/value
fi
