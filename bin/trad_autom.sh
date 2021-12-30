#!/bin/sh

# Facilita traducción automática de archivos yaml con Google Translator
# vtamara@pasosdeJesus.org 2021. Dominio público

fuente=$1
if (test ! -f "$fuente") then {
  echo "Falta archivo YAML fuente como primer argumento"
  exit 1;
} fi;
destino=$2
if (test "$destino" = "") then {
  echo "Falta archivo YAML destino como segundo argumento"
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


lam /tmp/llaves.txt /tmp/trad.txt > $destino
