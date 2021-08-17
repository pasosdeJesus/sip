#!/bin/sh
# Configura un motor o aplicación que desciende de sip

if (test ! -f .env.plantilla) then {
  echo "Ejecutar desde directorio con .env.plantilla"
  exit 1;
} fi;
if (test ! -f ~/.pgpass) then {
  echo "No existe archivo ~/.pgpass"
  exit 1;
} fi;
grep ":sipdes:" ~/.pgpass > /dev/null 2>&1
if (test "$?" != "0") then {
  echo "Falta clave de sipdes en ~/.pgpass"
  exit 1;
} fi;
clavesipdes=`grep ":sipdes:" ~/.pgpass | sed -e "s/.*:\([^:]*\)$/\1/g"`
if (test "$clavesipdes" = "") then {
  echo "Falta clave de sipdes en ~/.pgpass"
  exit 1;
} fi;

if (test "$CONFIG_HOSTS" = "") then {
  echo "Falta variable de entorno CONFIG_HOSTS";
  exit 1;
} fi;
if (test "$IPDES" = "") then {
  echo "Falta variable de entorno IPDES";
  exit 1;
} fi;
if (test "$PUERTODES" = "") then {
  echo "Falta variable de entorno PUERTODES";
  exit 1;
} fi;


if (test ! -f .env) then {
  sed -e "s/BD_CLAVE=xyz/BD_CLAVE=$clavesipdes/g;s/CONFIG_HOSTS=192.168.10.1/CONFIG_HOSTS=$CONFIG_HOSTS/g;s/IPDES=192.168.10.1/IPDES=$IPDES/g;s/PUERTODES=3000/PUERTODES=$PUERTODES/g" .env.plantilla  > .env
} fi;

rutabc=".bundle/"
dac=`pwd`
nomb=`basename $dac`
if (test "$nomb" = "dummy") then {
  # Motor
  rutabc="../../.bundle/"
} fi;
if (test ! -f $rutabc/config) then {
  mkdir -p $rutabc
  cat > $rutabc/config <<EOF
---
BUNDLE_PATH: "/var/www/bundler"
BUNDLE_DISABLE_SHARED_GEMS: "true"
EOF
} fi;
bundle
. .env
createdb -U sipdes -h /var/www/var/run/postgresql $BD_DES
bin/rails db:drop db:create db:setup
bin/corre

