#!/bin/bash
rm /tmp/curl.txt
for i in {1..200}; do
  curl -I http://192.168.56.100 &>> /tmp/curl.txt
  sleep 0.01 # Attendre 0.5 seconde entre les requêtes
done
echo "nombre de requêtes rejeté : "
grep -i Unavailable /tmp/curl.txt | wc -l