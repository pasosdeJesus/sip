# Temas

Las aplicaciones descendientes de sip corren con un tema predeterminado
que puede ser sobrecargado por cada usuario de manera particular.

Los temas elegibles por el usuario están disponibles en la tabla
básica Sip::Temas y pueden ser creados y modificados por el administrador.

El tema predeterminado se configura en las fuentes de la aplicación y 
además se espera que coincida con el tema de id 1.

Para establecer un nuevo tema predeterminado se recomienda crear una migración
que modifique el tema con id 1, puede ver un ejemplo en
<https://github.com/pasosdeJesus/sivel2_mujeresindigenas/blob/master/db/migrate/20201001132215_tema_predeterminado_2020.rb>

Para la elección de colores se recomienda ver
<https://github.com/pasosdeJesus/sip/blob/master/doc/elementos_dise%C3%B1o_visual.md>

Para poner el tema predeterminado en fuentes, use la misma gama
de colores de la migración en `config/initializers/sip.rb` agregando:
```
  config.colorom_fondo = '#f2f2ff'
  config.colorom_color_fuente = '#000000'
  config.colorom_nav_ini = '#5377a6'
  config.colorom_nav_fin = '#1f4e8c'
  config.colorom_nav_fuente = '#f2f2ff'
  config.colorom_fondo_lista = '#5377a6'
  config.colorom_btn_primario_fondo_ini = '#04c4d9'
  config.colorom_btn_primario_fondo_fin = '#1f4e8c'
  config.colorom_btn_primario_fuente = '#f2f2ff'
  config.colorom_btn_peligro_fondo_ini = '#ff1b30'
  config.colorom_btn_peligro_fondo_fin = '#ad0a0a'
  config.colorom_btn_peligro_fuente = '#f2f2ff'
  config.colorom_btn_accion_fondo_ini = '#f2f2ff'
  config.colorom_btn_accion_fondo_fin= '#d6d6f0'
  config.colorom_btn_accion_fuente = '#000000'
  config.colorom_alerta_exito_fondo = '#01a7d1'
  config.colorom_alerta_exito_fuente = '#1f4e8c'
  config.colorom_alerta_problema_fondo = '#f8d7da'
  config.colorom_alerta_problema_fuente = '#721c24'
```
