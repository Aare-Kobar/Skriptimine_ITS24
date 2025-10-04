#!bin/bash

fail="nimed.txt"

#Funktsioon, mis muudab tähed väikeseks ja asendab täpitähed
asenda_tahed(){
	echo "$1" | tr '[:upper:]' '[:lower:]' | sed -e 's/õ/o/g' -e 's/ä/a/g' -e 's/ö/o/g' -e 's/ü/y/g'
}

#Loeme faili rida realt
while read enimi pnimi sugu; do
	#Töötleme ees- ja perenimed ära
	eesnimi=$(asenda_tahed("$enimi")
	perenimi=$(asenda_tahed("$pnimi")

	#Loome kasutajanime ees- ja perekonnanimest
	kasutajanimi="${eesnimi}.${perenimi}"

	#Väljastame tulemuse
	echo "$kasutajanimi"
done < "$fail"
