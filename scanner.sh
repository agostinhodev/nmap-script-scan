#!/bin/bash

prefixo=192.168.0.
portas=(22 80 3306)
resultado=./result.txt

for(( i=0; i <= 254; i++ ))
do	
	ip=${prefixo}${i}

	for((j=0; j <= ${#portas}; j++))
	do
		echo "Scanning ${ip}:${portas[j]}"	

		if (nmap -p ${portas[j]} ${ip} | grep 'open'); then

			echo "${ip}:${portas[j]}" >> ${resultado}

		fi

	done
done
