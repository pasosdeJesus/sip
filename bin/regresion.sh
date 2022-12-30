#!/bin/sh
# Inicializa base de prueba, corre 2 pruebas de regresión (test y test:system) 
# y finalmente genera reporte de cobertura mezclando resultados en 
# directorio coverage y publicandolo HTML en public/mimotor/cobertura


echo "== Pruebas de regresión unitarias"
mkdir -p cobertura-unitarias/
rm -rf cobertura-unitarias/{*,.*}
CONFIG_HOSTS=www.example.com bin/rails test

echo "== Pruebas de regresión al sistema"
if (test -f "test/dummy/config/application.rb") then {
  mkdir -p test/dummy/cobertura-sistema/
  rm -rf test/dummy/cobertura-sistema/{*,.*}
  (cd test/dummy; CONFIG_HOSTS=127.0.0.1 bin/rails sip:stimulus_motores test:system)
} else {
  mkdir -p cobertura-sistema/
  rm -rf cobertura-sistema/{*,.*}
  CONFIG_HOSTS=127.0.0.1 bin/rails sip:stimulus_motores test:system
} fi;

echo "== Unificando resultados de pruebas en directorio clásico coverage"
mkdir -p coverage/
rm -rf coverage/{*,.*}
bin/rails app:sip:reporteregresion

echo "== Copiando resultados para hacerlos visibles en el web en ruta cobertura"
# Copiar resultados para hacerlos visibles en web
mkdir -p test/dummy/public/sip/cobertura/
cp -rf coverage/* test/dummy/public/sip/cobertura/
cp -rf coverage/assets/* test/dummy/public/sip/assets/
