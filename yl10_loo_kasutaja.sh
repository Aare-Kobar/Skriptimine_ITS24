#!/bin/bash

kasutajanimi=read -p "Kasutaja: " user
read -sp "Parool: " password
echo "Kasutaja on $user ja parool on $password"

useradd $kasutajanimi
