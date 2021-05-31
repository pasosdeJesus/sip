module Sip
  module LocalizaHelper

    # artículos y preposiciones
    PARTICULASESP=[
      "un",
      "una",
      "el",
      "la",
      "los",
      "las",
      "les",
      "a",
      "ante",
      "bajo",
      "cabe",
      "con",
      "contra",
      "de",
      "desde",
      "durante",
      "en",
      "entre",
      "hacia",
      "hasta",
      "mediante",
      "para",
      "por",
      "sin",
      "según",
      "so",
      "sobre",
      "tras",
      "versus",
      "vía"
    ]

    # Convierte palabra a minúsculas
    def minusculas(p)
      p.localize.casefold.to_s
    end
    module_function :minusculas

    # Convierte una cadena al estilo título con primera letra de cada palabra
    # en mayúsculas y las demás en minúsculas, excepto partículas del español
    # que deja en minúsculas desde la segunda posición.
    def capitaliza_titulo(t)
      r = ''
      n = t.split(/\s+/)
      if n.length > 0
        r = n[0].titleize
        (1..n.length-1).each do |i|
          m = minusculas(n[i])
          r += ' ' + (PARTICULASESP.include?(m) ? m : n[i].titleize)
        end
      end
      return r
    end
    module_function :capitaliza_titulo

  end
end
