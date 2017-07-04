l = []
atributos_index.each do |atr|  
  l << atr.to_sym
end 
json.array!(@registros) do |registro|
  if params[:labelvalue] && params[:labelvalue] == "1"
    json.label registro.busca_etiqueta
    json.value registro.busca_valor
  else
    json.extract! registro, *l
    json.url admin_basica_url(registro, format: :json)
  end
end
