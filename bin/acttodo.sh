#!/bin/sh
# Actualiza varios sistemas que usan sip. Dominio público. 2016
# Podria ejecutar con
# SALTASIP=1 SALTASIPD=1 SALTAJN316=1 SALTAMR519=1 SALTAHEB412=1 
# SALTACOR1440=1 SALTASAL7711=1 
# SALTACOR1440CINEP=1 
# SALTASIVEL2=1 SALTAAPO214=1 
# SALTASIANZORC=1 SALTASIASOM=1 SALTASIIAP=1 
# SALTASIVELSJR=1

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
  branch=`git branch | grep "^*" | sed -e  "s/^* //g"` 
  git pull origin $branch
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
    (cd $b; CXX=c++ yarn install; bundle exec rake db:migrate)
  } else {
    CXX=c++ yarn install; bundle exec rake db:migrate
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
if (test "$SALTASIPD" != "1") then {
  echo "**** sipd"
  actuno sipd test/dummy
} fi;


if (test "$SALTAJN316" != "1") then {
  echo "**** jn316"
  actuno jn316_gen test/dummy; 
} fi;

if (test "$SALTAMR519" != "1") then {
  echo "**** mr519"
  actuno mr519_gen test/dummy; 
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
  actuno cor1440_pdJ; 
  actuno si_codacop
} fi;

if (test "$SALTASAL7711" != "1") then {
  echo "**** sal7711"
#  actuno sal7711_gen test/dummy; 
#  actuno sal7711; 
#  actuno sal7711_web test/dummy; 
} fi;

if (test "$SALTASAL7711CINEP" != "1") then {
#  actuno sal7711_cinep; 
} fi;
# Usan 2 motores
if (test "$SALTACOR1440CINEP" != "1") then {
#  actuno cor1440_cinep; 
} fi;

if (test "$SALTASIVEL2" != "1") then {
  echo "**** sivel"
  actuno sivel2_gen test/dummy; 
  actuno sivel2; 
  actuno sivel2_somosdefensores
} fi;

if (test "$SALTAAPO214" != "1") then {
  echo "**** apo214"
  actuno apo214 test/dummy; 
} fi;

# Usan 3 o más motores
if (test "$SALTASIANZORC" != "1") then {
  actuno si_anzorc; 
} fi;

if (test "$SALTASIASOM" != "1") then {
  actuno si_asom
} fi;

if (test "$SALTASIIAP" != "1") then {
  actuno si_iap; 
} fi;

if (test "$SALTASIVELSJR" != "1") then {
  echo "**** sivelsjr"
  actuno sivel2_sjr test/dummy; 
  actuno sivel2_mujeresindigenas;
} fi;

# Usan 4 motores
#actuno si_jrslac; 
#actuno sivel2_sjrven; 
actuno si_jrscol

