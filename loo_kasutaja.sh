#!/bin/bash

fail="nimed.txt"

# Funktsioon, mis muudab tähed väikseks ja asendab täpitähed
asenda_tahed(){
    echo "$1" | tr '[:upper:]' '[:lower:]' | sed -e 's/õ/o/g' -e 's/ö/o/g' -e 's/ü/u/g' -e 's/ä/a/g'
}

#Loeb faili rida realt
while read enimi pnimi kursus; do

	#Töötleb ees ja perenimed ära
	eesnimi=$(asenda_tahed "$enimi")
	perenimi=$(asenda_tahed "$pnimi")

	#Loob kasutajanimi ees- ja perekonnanimest
	kasutajanimi="${eesnimi}.${perenimi}"

	# Loob grupi, kui seda ei ole olemas
	if ! getent group "$kursus" > /dev/null; then
		echo "Loon grupi: $kursus"
		sudo groupadd "$kursus"
	fi

	#Kontrollib, kas kasutaja on juba olemas
	if id "$kasutajanimi" &>/dev/null; then
		echo " Kasutaja $kasutajanimi on juba olemas, jätan vahele."
		continue
	fi

	#Loob kasutaja ja lisab ta kursuse gruppi
	echo "Loon kasutaja: $kasutajanimi (grupp: $kursus)"
	sudo useradd -m -g "$kursus" "$kasutajanimi"

done < "$fail"
