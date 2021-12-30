#!/bin/sh

# Facilita traducción automática de archivos YAML de español a inglés 
# con Google Translator
# vtamara@pasosdeJesus.org 2021. Dominio público

fuente=$1
if (test ! -f "$fuente") then {
  echo "Falta archivo YAML es fuente como primer argumento"
  exit 1;
} fi;
destino=$2
if (test "$destino" = "") then {
  echo "Falta archivo YAML en destino como segundo argumento"
  exit 1;
} fi;
touch $destino
if (test "$?" != "0") then {
  echo "No pudo escribir en $destino"
  exit 1;
} fi;


sed -e "s/\(.*:[ ]*\)\(.*\)/\1/g" $fuente > /tmp/llaves.txt
sed -e "s/\(.*:[ ]*\)\(.*\)/\2/g" $fuente > /tmp/textos.txt

echo "Suba el archivo /tmp/textos.txt a translate.google.com traduciendolo como
documento al idioma destino"
echo "Copie y pegue el resultado en /tmp/trad.txt"
echo "Cuando lo haya hecho presione [ENTER]"
read

sed -e "s/% {/%{/g" /tmp/trad.txt | \
  sed -e "s/& # \([0-9]*\);/\&#\1;/g" | \
  sed -e "s/& \([a-z_]*\);/\&\1;/g" > /tmp/trad2.txt

sed -e "s/^es:$/en:/g"  /tmp/llaves.txt > /tmp/llaves2.txt

l1=`wc -l /tmp/trad2.txt | sed -e "s/[^0-9]*\([0-9][0-9]*\).*/\1/g"`
l2=`wc -l /tmp/textos.txt | sed -e "s/[^0-9]*\([0-9][0-9]*\).*/\1/g"`
while (test "$l1" -lt "$l2"); do
  echo "" > /tmp/trad3.txt
  cat /tmp/trad2.txt >> /tmp/trad3.txt
  cp /tmp/trad3.txt /tmp/trad2.txt
  l1=`wc -l /tmp/trad2.txt | sed -e "s/[^0-9]*\([0-9][0-9]*\).*/\1/g"`
  l2=`wc -l /tmp/textos.txt | sed -e "s/[^0-9]*\([0-9][0-9]*\).*/\1/g"`
done

lam /tmp/llaves2.txt /tmp/trad2.txt > $destino
echo "Escrito el resultado en $destino" 
