l = []
atributos_index.each do |atr|  
  l << atr.to_sym
end 
json.array!(@basica) do |basica|
  if params[:labelvalue] && params[:labelvalue] == "1"
    json.label basica.busca_etiqueta
    json.value basica.busca_valor
  else
    json.extract! basica, *l
    json.url admin_basica_url(basica, format: :json)
  end
end
