#!/bin/sh

sing1="$1"
if (test "$sing1" = "") then {
  echo "Falta singular de prueba origen como primer parámetro";
  exit 1;
} fi;
plural1="$2"
if (test "$plural1" = "") then {
  echo "Falta plural de prueba origen como segundo parámetro";
  exit 1;
} fi;
sing2="$3"
if (test "$sing2" = "") then {
  echo "Falta singular de prueba destino como tercer parámetro";
  exit 1;
} fi;
plural2="$4"
if (test "$plural2" = "") then {
  echo "Falta plural de prueba destino como cuarto parámetro";
  exit 1;
} fi;

sing1min=`echo "$sing1" |  tr '[:upper:]' '[:lower:]'`
sing1may=`echo "$sing1" |  tr '[:lower:]' '[:upper:]'`
sing1cap=`echo "$sing1" |  awk '{ print toupper( substr( $0, 1, 1 ) ) tolower(substr( $0, 2 )); }'`

plural1min=`echo "$plural1" |  tr '[:upper:]' '[:lower:]'`
plural1may=`echo "$plural1" |  tr '[:lower:]' '[:upper:]'`
plural1cap=`echo "$plural1" |  awk '{ print toupper( substr( $0, 1, 1 ) ) tolower(substr( $0, 2 )); }'`

sing2min=`echo "$sing2" |  tr '[:upper:]' '[:lower:]'`
sing2may=`echo "$sing2" |  tr '[:lower:]' '[:upper:]'`
sing2cap=`echo "$sing2" |  awk '{ print toupper( substr( $0, 1, 1 ) ) tolower(substr( $0, 2 )); }'`

plural2min=`echo "$plural2" |  tr '[:upper:]' '[:lower:]'`
plural2may=`echo "$plural2" |  tr '[:lower:]' '[:upper:]'`
plural2cap=`echo "$plural2" |  awk '{ print toupper( substr( $0, 1, 1 ) ) tolower(substr( $0, 2 )); }'`


sed -e "s/$plural1min/$plural2min/g;s/$sing1min/$sing2min/g;s/$plural1cap/$plural2cap/g;s/$sing1cap/$sing2cap/g;s/$plural1may/$plural2may/g;s/$sing1may/$sing2may/g" test/controllers/sip/admin/${plural1min}_controller_test.rb  > test/controllers/sip/admin/${plural2min}_controller_test.rb
echo "Creado test/controllers/sip/admin/${plural2min}_controller_test.rb"
