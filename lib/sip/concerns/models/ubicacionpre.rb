
module Sip
  module Concerns
    module Models
      module Ubicacionpre
        extend ActiveSupport::Concern

        included do

          include Sip::Modelo 
          include Sip::Localizacion


          self.table_name = 'sip_ubicacionpre'

          belongs_to :pais, class_name: "Sip::Pais",
            foreign_key: "pais_id", validate: true, optional: true
          belongs_to :departamento, class_name: "Sip::Departamento",
            foreign_key: "departamento_id", validate: true, optional: true
          belongs_to :municipio, class_name: "Sip::Municipio",
            foreign_key: "municipio_id", validate: true, optional: true
          belongs_to :clase, class_name: "Sip::Clase",
            foreign_key: "clase_id", validate: true, optional: true
          belongs_to :tsitio, class_name: "Sip::Tsitio",
            foreign_key: "tsitio_id", validate: true, optional: true

          flotante_localizado :latitud
          flotante_localizado :longitud

          validates :nombre, uniqueness: true, presence: true,
            length: { maximum: 2000 }
          validates :lugar, length: { maximum: 500 } 
          validates :sitio, length: { maximum: 500 } 


          def poner_nombre_estandar
            self.nombre, self.nombre_sin_pais = Sip::Ubicacionpre::nomenclatura(
              self.pais.nombre, 
              self.departamento ? self.departamento.nombre : '',
              self.municipio ? self.municipio.nombre : '',
              self.clase ? self.clase.nombre : '',
              self.lugar, self.sitio)
            return self.save
          end

        end # include



        class_methods do

          def nomenclatura(pais, departamento, municipio,
                           clase, lugar, sitio)
            if pais.to_s.strip == ''
              nombre = nil
              nombre_sinp = nil
            elsif departamento.to_s.strip == ''
              nombre = pais.to_s
              nombre_sinp = nil
            elsif municipio.to_s == ''
              nombre = departamento.to_s.strip + ' / ' +
                pais.to_s
              nombre_sinp = departamento.to_s
            elsif lugar.to_s.strip == ''
              nombre = (clase.to_s.strip == '' ? '' : clase.to_s.strip + ' / ') +
                municipio.to_s.strip + ' / ' +
                departamento.to_s.strip + ' / ' +
                pais.to_s
              nombre_sinp = (
                clase.to_s.strip == '' ? '' : clase.to_s.strip + ' / ') +
               municipio.to_s.strip + ' / ' +
               departamento.to_s
            elsif sitio.to_s.strip == ''
              nombre = lugar.to_s + ' / ' +
                (clase.to_s.strip == '' ? '' : clase.to_s.strip + ' / ') +
                municipio.to_s.strip + ' / ' +
                departamento.to_s.strip + ' / ' +
                pais.to_s
              nombre_sinp = lugar.to_s + ' / ' +
                (clase.to_s.strip == '' ? '' : clase.to_s.strip + ' / ') +
                municipio.to_s.strip + ' / ' +
                departamento.to_s 
            else
              nombre = sitio.to_s + ' / ' +
                lugar.to_s + ' / ' +
                (clase.to_s.strip == '' ? '' : clase.to_s.strip + ' / ') +
                municipio.to_s.strip + ' / ' +
                departamento.to_s.strip + ' / ' +
                pais.to_s
              nombre_sinp = sitio.to_s + ' / ' +
                lugar.to_s + ' / ' +
                (clase.to_s.strip == '' ? '' : clase.to_s.strip + ' / ') +
                municipio.to_s.strip + ' / ' +
                departamento.to_s 
            end

            return [nombre, nombre_sinp]
          end


          # A partir de datos como para ubicacinpre los valida
          # y crea una ubicacionpre y retorna su id o retorna id de una 
          # ubicación existente hasta donde logre validar.
          # Si usa_latlon es falso y la ubicación con lugar
          # es válida ignora las que recibe y pone unas
          # de acuerdo al pais, departamento, municipio y clase
          # La latitud y longitud que recibe no debe estar localizadas
          # Retorna id de ubicación que encuentra o que crea o nil si tiene problema
          def buscar_o_agregar(pais_id, departamento_id, municipio_id,
                                    clase_id, lugar, sitio, tsitio_id,
                                    latitud, longitud, 
                                    usa_latlon = true)

            longitud = usa_latlon ? longitud.to_f : 0.0

            if !pais_id || Sip::Pais.where(id: pais_id.to_i).count == 0
              return nil 
            end
            opais = Sip::Pais.find(pais_id.to_i)
            # Aquí debería chequearse que la latitud y longitud estén 
            # dentro del país
            if (latitud.to_f == 0.0 && 
                longitud.to_f == 0.0) || 
               !usa_latlon
              latitud = opais.latitud
              longitud = opais.longitud
            end

            w = {
              pais_id: opais.id,
              departamento_id: nil,
              municipio_id: nil,
              clase_id: nil,
              lugar: nil,
              sitio: nil,
              tsitio_id: nil # SIN INFORMACIÓN
            }
            if !departamento_id || 
                Sip::Departamento.where(id: departamento_id.to_i,
                                        id_pais: opais.id).count == 0
              if Sip::Ubicacionpre.where(w).count == 0
                puts 'Problema, no se encontró ubicación esperada ' + w.to_s
                return nil
              end
              return Sip::Ubicacionpre.where(w).take.id # SIN INFORMACIÓN
            end
            odepartamento = Sip::Departamento.find(departamento_id.to_i)
            if (latitud.to_f == opais.latitud && 
                longitud.to_f == opais.longitud) || 
                !usa_latlon
              latitud = odepartamento.latitud
              longitud = odepartamento.longitud
            end
            w[:departamento_id] = odepartamento.id

            if !municipio_id || 
                Sip::Municipio.where(id: municipio_id.to_i,
                                     id_departamento: odepartamento.id).count == 0
              if Sip::Ubicacionpre.where(w).count == 0
                puts 'Problema, no se encontró ubicación esperada ' + w.to_s
                return nil
              end
              return Sip::Ubicacionpre.where(w).take.id
            end
            omunicipio = Sip::Municipio.find(municipio_id.to_i)
            if (latitud == odepartamento.latitud && 
                longitud == odepartamento.longitud) || !usa_latlon
              latitud = omunicipio.latitud
              longitud = omunicipio.longitud
            end
            w[:municipio_id] = omunicipio.id

            # clase debe ser NULL para ubicaciones rurales
            if clase_id.to_i > 0 &&
                Sip::Clase.where(id: clase_id.to_i,
                                 id_municipio: omunicipio.id).count == 0
              if Sip::Ubicacionpre.where(w).count == 0
                puts 'Problema, no se encontró ubicación esperada ' + w.to_s
                return nil
              end
              return Sip::Ubicacionpre.where(w).take.id
            end

            w[:clase_id] = nil  # Posiblemente Rural
            if clase_id.to_i > 0
              w[:clase_id] = clase_id.to_i # Urbana
              oclase = Sip::Clase.find(clase_id.to_i)
              if (latitud == omunicipio.latitud && 
                  longitud == omunicipio.longitud &&
                  oclase.latitud && oclase.longitud) || !usa_latlon
                latitud = oclase.latitud
                longitud = oclase.longitud
              end
            end

            if lugar.to_s.strip == ''
              if Sip::Ubicacionpre.where(w).count == 0
                puts 'Problema, no se encontró ubicación esperada ' + w.to_s
                return nil
              end
              return Sip::Ubicacionpre.where(w).take.id
            end

            # Latitud, longitud, tipo de sitio no modificables por usuario 
            # para ubicaciones hasta centro poblado.  
            # En ubicaciones con lugar y/o sitio modificables por cualquier
            # usuario del sistema.
            # Al buscar lugar y sitio se ignora capitalización así como
            # espacios al comienzo o final y espacios redundantes
            w.delete(:tsitio_id)
            w.delete(:sitio)
            w.delete(:lugar)

            # Revisamos posible error en información de entrada que pondría
            # como lugar un centro poblado y en tal caso se retorna el centro
            # poblado
            if !w[:clase_id] && Sip::Clase.where(nombre: lugar.to_s.strip,
                id_municipio: omunicipio.id).count == 1
              oclase = Sip::Clase.where(nombre: lugar.to_s.strip,
                                        id_municipio: omunicipio.id).first
              clase_id = w[:clase_id] = oclase.id
              if Sip::Ubicacionpre.where(w).count == 0
                puts 'Problema, no se encontró ubicación esperada ' + w
                return nil
              end
              if sitio.to_s.strip == ''
                puts "Ajustando ubicacion sin centro poblado, ni sitio pero con "\
                  "lugar '#{lugar.to_s.strip} / #{omunicipio.nombre}', "\
                  "para que coincida con centro poblado del mismo nombre. "
                if tsitio_id != 2
                  puts "** Ignorando tsitio_id errado"
                end
                if latitud.to_f != oclase.latitud || longitud.to_f != oclase.longitud
                  puts "** Ignorando (latitud, longitud) erradas "\
                    "(#{latitud.to_f}, #{longitud.to_f})"
                end
                return Sip::Ubicacionpre.where(w).take.id
              else
                puts "** Ajustando ubicacion sin centro poblado, pero con sitio y "\
                  "con lugar igual a centro poblado "\
                  "'#{sitio.to_s.strip} / #{lugar.to_s.strip} / #{omunicipio.nombre}', "\
                  "para que el sitio sea lugar y lugar sea centro poblado "\
                  "necesitamos nombres únicos para ubicaciones/polígonos diferentes."
                lugar = sitio.to_s.strip
                sitio = ''
              end
            end
            # Preparamos tsitio_id
            tsitio_id = tsitio_id.to_i > 0 ? tsitio_id.to_i : nil
            if tsitio_id && Sip::Tsitio.where(id: tsitio_id.to_i).count == 0
              puts 'Problema, no se encontró tsitio_id esperado ' + tsitio_id
              return nil
            end

            if sitio.to_s.strip == ''
              ubi = Sip::Ubicacionpre.where(w).
                where('lugar ILIKE ?', lugar.strip.gsub(/  */, ' ')).
                where("sitio IS NULL OR sitio=''")
              #puts w
              #puts ubi.to_sql
              if ubi.count > 0
                # modificando existente
                ubi[0].tsitio_id = tsitio_id
                ubi[0].latitud = latitud
                ubi[0].longitud = longitud
                if ubi[0].save
                  return ubi[0].id
                else
                  puts "Problema salvando ubi #{ubi[0]}"
                  return nil
                end
              end
              # Preparamos para añadir nuevo
              w[:lugar] = lugar.strip.gsub(/  */, ' ')
              w[:sitio] = ''
            else # Tiene sitio
              ubi = Sip::Ubicacionpre.where(w).
                where('lugar ILIKE ?', lugar.strip.gsub(/  */, ' ')).
                where('sitio ILIKE ?', sitio.strip.gsub(/  */, ' '))
              if ubi.count > 0
                # modificando existente
                ubi[0].tsitio_id = tsitio_id
                ubi[0].latitud = latitud
                ubi[0].longitud = longitud
                if ubi[0].save
                  return ubi[0].id
                else
                  puts "Problema salvando ubi #{ubi[0]}"
                  return nil
                end
              end
              w[:lugar] = lugar.strip.gsub(/  */, ' ')
              w[:sitio] = sitio.strip.gsub(/  */, ' ')
            end
            # Intentamos añadir nuevo teniendo en cuenta que lugar y sitio 
            # ya estan dilig.
            w[:tsitio_id] = tsitio_id
            w[:latitud] = latitud
            w[:longitud] = longitud
            w[:nombre], w[:nombre_sin_pais] = Sip::Ubicacionpre::nomenclatura(
              opais.nombre, 
              odepartamento.nombre,
              omunicipio.nombre,
              oclase ? oclase.nombre : '',
              w[:lugar],
              w[:sitio]
            )
            if Sip::Ubicacionpre.where(nombre: w[:nombre]).count == 1 
              puts "Problema, ya hay una ubicación con el nombre #{w[:nombre]}. "\
                "Proveniente de #{w.inspect}. Se usará esa ignorando la "\
                "informacińo recibida"
              return Sip::Ubicacionpre.where(nombre: w[:nombre]).first.id
            end
            nubi = Sip::Ubicacionpre.create!(w)
            if !nubi
              puts "Problema creando ubi #{nubi}"
              return nil
            end

            return nubi.id
          end


        end # class_methods
      end
    end
  end
end

