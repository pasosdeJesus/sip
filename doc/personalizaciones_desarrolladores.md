
Al momento de este escrito las configuraciones que debe/puede 
hacer un desarrollador, típicamente al momento de la instalación son:


* Formato de la fecha: Se configura en la variable de ambiente 
  `FORMATO_FECHA` (típicamente en el archivo `.env`) sus valores típicos
  son:

  | Valor de FORMATO_FECHA | Representa | Ejemplo |
  |---|---|---|
  | `dd/M/yyyy`  | Formato colombiano | `26/Ene/2022` | 
  | `yyyy-mm-dd` | Formato ISO | '2022-01-26' | 

* Sexo biológico: Es a nivel de base de datos, se trata de la restricción de 
  nombre `persona_sexo_check` en la tabla `sip_persona`
  En el momento soportamos dos tríos:

  | Mujer | Hombre | Sin Información |
  |---|---|---|
  | F | M | S |
  | M | H | S |
  
  Para cambiarlo debe ejecutarse una migración que establezca la
  restricción.


