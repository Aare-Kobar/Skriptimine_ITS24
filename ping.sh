#!bin/bash

for i in 1.1.1.1 4.4.4.4 8.8.8.8 9.9.9.9
do
	ping -c 3 $i
done

