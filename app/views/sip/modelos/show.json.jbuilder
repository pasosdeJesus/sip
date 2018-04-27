l = []
atributos_show_json.each do |atr|  
  if atr && atr.respond_to?(:to_sym)
  	l << atr.to_sym
  end
end 
json.extract! @registro, *l
