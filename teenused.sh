#!bin/bash

LOGIFAIL="/mnt/c/Skriptimine_ITS24/teenused.log"
RUN=$1


for teenus in apache2 ssh; do
	if systemctl is-active --quiet $teenus
	then
		echo "Teenus $teenus töötab"
	else
		echo "Teenus $teenus ei tööta - käivitan .."
		sudo systemctl start "$teenus"

		#Kontrollin kas teenus läks tööle
		if systemctl is-active --quiet "$teenus"
		then
			echo "$teenus käivitati edukalt."
			echo "$(date '+%d.%m.%Y %H:%M:%S') - $teenus ei töötanud ja käivitati  uuesti. Kontrollijaks oli $RUN" >> "$LOGIFAIL"
		else
			echo "Viga; $teenus ei käivitanud."
		fi
	fi
echo $RUN
done
