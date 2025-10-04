#!bin/bash

for teenus in apache2 ssh; do
	systemctl is-active --quiet $teenus && echo "Teenus $teenus töötab" || echo "Teenus $teenus ei tööta"
done
