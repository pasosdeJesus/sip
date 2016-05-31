#!/bin/sh
# Actualiza varios sistemas que usan sip. Dominio público. 2016
#
# Antes agregue a ~/.profile las siguientes 4:

if [ -z "$SSH_AUTH_SOCK" ] ; then
	eval `ssh-agent -s`
	ssh-add
fi

function actuno {
	a=$1
	b=$2
	if (test ! -d "$a") then {
		echo "actuno: Primer parametro debería ser directorio de ap"
		exit 1;
	} fi;
	acdir=`pwd`
	cd $a
	echo "=== actuno: $a $b"
	git pull
	bundle update
	bundle install
	if (test "$b" != "") then {
		(cd $b; rake db:migrate)
	} else {
		rake db:migrate
	} fi;
	SINAC=1 SININS=1 MENSCONS="Actualiza" bin/gc.sh
	cd $acdir
}


if (test "$SALTASIP" != "1") then {
	echo "sip"
	actuno sip spec/dummy
} fi;
if (test "$SALTASIVEL" != "1") then {
	echo "sivel"
	actuno sivel2_gen spec/dummy; actuno sivel2; actuno sivel2_anzorc; actuno sivel2_marcha; actuno sivel2_sjr spec/dummy;  
} fi;
if (test "$SALTASIVELSJR" != "1") then {
	echo "sivelsjr"
	actuno sivel2_sjr spec/dummy; actuno sivel2_mujeresindigenas;
} fi;
if (test "$SALTACOR1440" != "1") then {
	echo "cor1440"
	actuno cor1440_gen spec/dummy; actuno cor1440; actuno cor1440_cinep; actuno cor1440_sjrlac; actuno sivel2_sjrven; actuno sivel2_sjrecu
} fi;
if (test "$SALTASAL7711" != "1") then {
	echo "sal7711"
	actuno sal7711_gen spec/dummy; actuno sal7711; actuno sal7711_onbase; actuno sivel2_sjrcol
} fi;


