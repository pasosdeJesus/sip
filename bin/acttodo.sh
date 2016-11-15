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
	actuno sip spec/dummy
} fi;
if (test "$SALTAHEB412" != "1") then {
	echo "**** heb412"
	actuno heb412_gen test/dummy; 
} fi;
if (test "$SALTASIVEL" != "1") then {
	echo "**** sivel"
	actuno sivel2_gen spec/dummy; 
	actuno sivel2; 
	actuno sivel2_anzorc; 
	actuno sivel2_marcha; 
} fi;
if (test "$SALTASIVELSJR" != "1") then {
	echo "**** sivelsjr"
	actuno sivel2_sjr spec/dummy; 
	actuno sivel2_mujeresindigenas;
} fi;
if (test "$SALTACOR1440" != "1") then {
	echo "**** cor1440"
	actuno cor1440_gen spec/dummy; 
	actuno cor1440; 
	actuno cor1440_cinep; 
	actuno cor1440_sjrlac; 
} fi;
if (test "$SALTASAL7711" != "1") then {
	echo "**** sal7711"
	actuno sal7711_gen spec/dummy; 
	actuno sal7711; 
	actuno sal7711_web test/dummy; 
	actuno sal7711_cinep; 
	actuno sivel2_sjrven; 
	actuno sivel2_sjrecu
	actuno sivel2_sjrcol
	#actuno sal7711_onbase; 
} fi;


