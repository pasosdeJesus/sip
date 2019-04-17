# Internacionalización y personalización de nombres de campos y modelos

Puede hacerse en la aplicación (o motores descendientes) en ```config/locale/es.yml``` por ejemplo:
```
es:
  activerecord:
    models:
      "cor1440_gen/proyectofinanciero":
        one: "Contrato Institucional" 
        other: "Contratos Institucionales"
    attributes:
      "cor1440_gen/proyectofinanciero":                                         
        fechainicio: Inicio
        fechafin: Cierre
```

Los campos de un módelo también pueden personalizarse en ```app/modelos/mimodelo.rb``` con algo como:
```
def self.human_attribute_name(atr, poromision)
  if (atr.to_s == "{:proyecto_ids=>[]}")
    "Proyectos"        
  else 
    super(atr) 
  end 
end
```

