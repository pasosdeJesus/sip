# Personalización del punto de montaje

Para que su aplicación quede en un punto de montaje diferente a ```/```, por ejemplo ```/miorg/miap```

1. Modifique ```config/routes.rb``` teniendo en cuenta:
1.1 Poner sus rutas entre:
<pre>
scope 'miorg/miap' do
</pre>
...
<pre>
end
</pre>
No incluya entre estos el montaje de las rutas de `sip` y otros motores
1.2. Después de cerrar esa sección ```scope```, incluya puntos de montaje de motores como sip asi:
<pre>
mount Sip::Engine, at: '/miorg/miap', as: 'sip'
</pre>
2. Cree el directorio ```public/miorg/miap``` y mueva alli el contenido de ```public```
3. Indique el punto de montaje en config/application.rb:
<pre>
config.relative_url_root = "/miorg/miap"
</pre>
4. Indique también el punto de montaje en un archivo ```config/initializers/punto_montaje.rb``` con algo como:
<pre>
MiAp::Application.config.relative_url_root = '/miorg/miap'
MiAp::Application.config.assets.prefix = '/miorg/miap/assets'
</pre>
Siendo `MiAp` el mismo nombre de aplicación que haya configurado en `config/application.rb`

5. En la aplicación si requiere referirse a una ruta y no puede utilizar auxiliares, ponga como prefijo de la ruta el contenido de ```Rails.configuration.relative_url_root```

6. En javascript ese punto de montaje quedará disponible en `window.puntomontaje` (por si requiere hacer llamados AJAX  o usar URLs de la aplicación).

Aunque en versiones de Rails anteriores a la 5 se usaba la variable de ambiente `RAILS_RELATIVE_URL_ROOT` para especificar el punto de montaje, hemos notado que con Rails 5 no es necesario usarla y puede resultar conflictivo con el método anterior.  
