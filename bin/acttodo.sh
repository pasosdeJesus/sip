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
		echo "actuno: Primer parametro debería ser directorio de ap (era $a)"
		exit 1;
	} fi;
	acdir=`pwd`
	cd $a
	echo "=== actuno: $a $b"
	git pull
	if (test "$?" != 0) then {
		exit 1;
	} fi;
	bundle update
	if (test "$?" != 0) then {
		exit 1;
	} fi;
	bundle install
	if (test "$?" != 0) then {
		exit 1;
	} fi;
	if (test "$b" != "") then {
		(cd $b; bundle exec rake db:migrate)
	} else {
		bundle exec rake db:migrate
	} fi;
	if (test "$?" != 0) then {
		exit 1;
	} fi;
	SINAC=1 SININS=1 MENSCONS="Actualiza" bin/gc.sh
	if (test "$?" != 0) then {
		exit 1;
	} fi;
	cd $acdir
}


if (test "$SALTASIP" != "1") then {
	echo "**** sip"
	actuno sip test/dummy
} fi;

# Usan solo sip
if (test "$SALTAJN316" != "1") then {
	echo "**** jn316"
	actuno jn316_gen test/dummy; 
} fi;

if (test "$SALTAHEB412" != "1") then {
	echo "**** heb412"
	actuno heb412_gen test/dummy; 
	actuno heb412
} fi;

if (test "$SALTACOR1440" != "1") then {
	echo "**** cor1440"
	actuno cor1440_gen test/dummy; 
	actuno cor1440; 
} fi;
if (test "$SALTASAL7711" != "1") then {
	echo "**** sal7711"
	actuno sal7711_gen test/dummy; 
	actuno sal7711; 
	actuno sal7711_web test/dummy; 
	actuno sal7711_cinep; 
	actuno sal7711_ld test/dummy; 
} fi;


# Usan 2 motores
if (test "$SALTACOR1440CINEP" != "1") then {
	actuno cor1440_cinep; 
} fi;

if (test "$SALTASIVEL" != "1") then {
	echo "**** sivel"
	actuno sivel2_gen test/dummy; 
	actuno sivel2; 
	actuno sivel2_anzorc; 
} fi;

# Usan 3 motores
if (test "$SALTASIVELSJR" != "1") then {
	echo "**** sivelsjr"
	actuno sivel2_sjr test/dummy; 
	actuno sivel2_mujeresindigenas;
} fi;

# Usan 4 motores
actuno cor1440_sjrlac; 
actuno sivel2_sjrven; 
actuno sivel2_sjrcol

