#!/bin/sh
# Actualiza varios sistemas que usan sip. Dominio público. 2016
# Podria ejecutar con
# SALTASIP=1 SALTASIPD=1 SALTAJN316=1 SALTAMR519=1 SALTAHEB412=1 
# SALTACOR1440=1 SALTASAL7711=1 
# SALTASIVEL2GEN=1 SALTAAPO214=1 SALTASIVEL2=1 
# SALTASIANZORC=1 SALTASIASOM=1 SALTASIIAP=1 SALTASIFASOL=1 
# SALTASIVELSJR=1 SALTAMIND=1 

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
  bundle update --bundler
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
  actuno sip-2.1 test/dummy
} fi;

if (test "$SALTAMR519" != "1") then {
  echo "**** mr519"
  actuno mr519_gen-2.1 test/dummy; 
} fi;

if (test "$SALTAHEB412" != "1") then {
  echo "**** heb412"
  actuno heb412_gen-2.1 test/dummy; 
} fi;

if (test "$SALTASIVEL2GEN" != "1") then {
  echo "**** sivel"
  actuno sivel2_gen-2.1 test/dummy; 
} fi;

if (test "$SALTAAPO214" != "1") then {
  echo "**** apo214"
  actuno apo214 test/dummy; 
} fi;

if (test "$SALTASIVEL2" != "1") then {
  echo "**** sivel"
  actuno sivel2-2.1; 
} fi;
