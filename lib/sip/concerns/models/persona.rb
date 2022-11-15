
module Sip
  module Concerns
    module Models
      module Persona
        extend ActiveSupport::Concern
        include Sip::Modelo 
        include Sip::Localizacion

        included do

          self.table_name = 'sip_persona'

          CONVENCIONES_SEXO = {
            'FMS' => {
              sexo_femenino: :F,
              nombre_femenino: 'FEMENINO',
              sexo_masculino: :M,
              nombre_masculino: 'MASCULINO',
              sexo_sininformacion: :S,
              nombre_sininformacion: 'SIN INFORMACIÓN',
            },
            'MHS' => {
              sexo_femenino: :M,
              nombre_femenino: 'MUJER',
              sexo_masculino: :H,
              nombre_masculino: 'HOMBRE',
              sexo_sininformacion: :S,
              nombre_sininformacion: 'SIN INFORMACIÓN'
            }
          }

          def self.convencion_sexo_abreviada
            # La convención se almacena en base de datos en la constraint
            # persona_sexo_check de tabla sip_persona
            r=Sip::Persona.connection.execute(
              "SELECT "\
              "substring(pg_get_constraintdef(oid, TRUE) FROM 'AND ''(...)''') "\
              "  FROM pg_constraint "\
              "  WHERE conrelid='sip_persona'::regclass "\
              "    AND conname='persona_sexo_check'; "
            )[0]['substring']

            if !CONVENCIONES_SEXO.keys.include?(r)
              puts "** Convención en base para sexo desconocida: #{r}, usando FMS"
              r = 'FMS'
            end

            return r
          end

          def self.convencion_sexo
            r = self.convencion_sexo_abreviada
            return CONVENCIONES_SEXO[r]
          end

          # Retorna arreglo con convenciones es de la forma
          # [
          #   ['SIN INFORMACIÓN', :S]
          #   ['FEMENINO', :F]
          #   ['MASCULINO', :M]
          # ]
          def self.sexo_opciones
            dc = convencion_sexo
            return [
              [dc[:nombre_sininformacion], dc[:sexo_sininformacion].to_sym],
              [dc[:nombre_femenino], dc[:sexo_femenino].to_sym],
              [dc[:nombre_masculino], dc[:sexo_masculino].to_sym]
            ]
          end

          def self.sexo_opciones_cortas
            dc = convencion_sexo
            return [
              [dc[:sexo_sininformacion].to_s, dc[:sexo_sininformacion].to_sym],
              [dc[:sexo_femenino].to_s, dc[:sexo_femenino].to_sym],
              [dc[:sexo_masculino].to_s, dc[:sexo_masculino].to_sym]
            ]
          end


          # Retorna diccionario con convenciones sobre sexo de la forma
          # {
          #   :S => 'SIN INFORMACIÓN',
          #   :F => 'FEMENINO',
          #   :M => 'MASCULINO'
          # }
          def self.sexo_opciones_diccionario
            dc = convencion_sexo
            return [
              [dc[:sexo_sininformacion].to_sym, dc[:nombre_sininformacion]],
              [dc[:sexo_femenino].to_sym, dc[:nombre_femenino]],
              [dc[:sexo_masculino].to_sym, dc[:nombre_masculino]]
            ].to_h
          end


          ORIENTACION_OPCIONES = [
            ['SIN INFORMACIÓN', :S],
            ['HETEROSEXUAL', :H],
            ['LESBIANA', :L], 
            ['GAY', :G],
            ['BISEXUAL', :B], 
            ['TRANSEXUAL', :T], 
            ['LGBTQ+', :O]
          ]

          def self.orientacion_opciones_diccionario
            Sip::Persona::ORIENTACION_OPCIONES.map {|e| [e[1], e[0]]}.to_h
          end


          # Bien sea o no con inverse_of aqui y/o en orgsocial_persona
          has_many :orgsocial_persona, foreign_key: "persona_id", 
            class_name: "Sip::OrgsocialPersona", validate: true 
          #inverse_of: :persona
          belongs_to :clase, class_name: 'Sip::Clase',
            foreign_key: "id_clase", validate: true, optional: true
          belongs_to :nacional, class_name: "Sip::Pais",
            foreign_key: "nacionalde", validate: true, optional: true
          belongs_to :departamento, foreign_key: "id_departamento", 
            validate: true, class_name: "Sip::Departamento", optional: true
          belongs_to :municipio, foreign_key: "id_municipio", validate: true,
            class_name: "Sip::Municipio", optional: true
          belongs_to :pais, class_name: "Sip::Pais", foreign_key: "id_pais", 
            validate: true, optional: true
          belongs_to :tdocumento, class_name: "Sip::Tdocumento", 
            foreign_key: "tdocumento_id", validate: true, optional: true

          has_many :persona_trelacion1, foreign_key: "persona1", 
            dependent: :delete_all, 
            class_name: "Sip::PersonaTrelacion"
          has_many :persona_trelacion2, foreign_key: "persona2", 
            dependent: :delete_all, 
            class_name: "Sip::PersonaTrelacion"

          has_many :personados, through: :persona_trelacion1, 
            class_name: 'Sip::Persona'
          accepts_nested_attributes_for :personados, reject_if: :all_blank
          accepts_nested_attributes_for :persona_trelacion1,
            reject_if: :all_blank, allow_destroy: true

          # identificación autogenerada en este y demás modelos (excepto los de
          # información geográfica).
          validates :nombres, presence: true, allow_blank: false, 
            length: { maximum: 100 }
          validates :apellidos, presence: true, allow_blank: false,
            length: { maximum: 100 }
          validates :numerodocumento, length: { maximum: 100 }
          validates :sexo, presence: true
          validates :anionac, :numericality => {:allow_blank => true}
          validates :mesnac, :numericality => {:allow_blank => true}
          validates :dianac, :numericality => {:allow_blank => true}

          validate :vformatonumdoc
          def vformatonumdoc
            if (tdocumento && tdocumento.formatoregex != '' && 
                !(numerodocumento =~ Regexp.new("^#{tdocumento.formatoregex}$")))
              errors.add(:numerodocumento, 
                         "No cumple exp. regular: #{tdocumento.formatoregex}")
            end
          end

          validate :vfechanac
          def vfechanac
            anioactual= Time.now.strftime("%Y").to_i	  
            if (anionac && anionac>anioactual)
              errors.add(:anionac, "Año debe ser menor al actual")	    
            end
            if (anionac && anionac<1900)
              errors.add(:anionac, "Año debe ser mayor o igual a 1900")
            end
            if (mesnac && (mesnac < 1 || mesnac > 12))
              errors.add(:mesnac, "Mes debe estar entre 1 y 12")
            end
            if (dianac && dianac < 1)
              errors.add(:dianac, "Dia debe ser positivo")
            end
            if (dianac && mesnac && mesnac == 2 && dianac > 29)
              errors.add(:dianac, "Dia debe ser menor o igual a 29")
            elsif (anionac && mesnac && dianac && mesnac == 2 && dianac == 29)
              ud = Date.civil(anionac, mesnac, -1)
              if (dianac > ud.day)
                errors.add(:dianac, "Dia debe ser menor o igual a #{ud.day}")
              end
            elsif (dianac && mesnac && (mesnac == 4 || mesnac == 6 || 
                                        mesnac == 9 || mesnac == 11) && 
                                        dianac > 30)
              errors.add(:dianac, "Dia debe ser menor o igual a 30")
            elsif (dianac && dianac > 31)
              errors.add(:dianac, "Dia debe ser menor o igual a 31")
            end
          end

          def fechanac
            r = ""
            r += anionac.to_s if anionac
            r += "-"
            r += FormatoFechaHelper::ABMESES[mesnac] if mesnac && 
              mesnac>=1 && mesnac<=12
            r += "-"
            r += dianac.to_s if dianac
            return r

          end

          def presenta_fechanac
            r = ""
            r += dianac.to_s if dianac
            r += "/"
            r += FormatoFechaHelper::ABMESES[mesnac] if mesnac && 
              mesnac>=1 && mesnac<=12
            r += "/"
            r += anionac.to_s if anionac
            return r
          end

          def fechanac_localizada
            presenta_fechanac
          end

          def presenta_nombre
            r = nombres + " " + apellidos
            r.strip
          end

          def sip_presenta(atr)
            case atr.to_s
            when 'centro_poblado'
              self.clase ? self.clase.nombre : ''
            when 'nacionalde'
              nacionalde ? nacional.nombre : ''
            when 'sexo'
              ds = Sip::Persona::sexo_opciones_diccionario
              ds[self.sexo.to_sym] || 'Sexo desconocido'
            when 'tdoc'
              self.tdocumento.sigla if self.tdocumento
            else
              presenta_gen(atr)
            end
          end

          def presenta(atr)
            sip_presenta(atr)
          end

          def importa_sip(datosent, datossal, menserror, opciones = {})
            if !datosent.key?(:sexo)
              self.sexo = 'S'
            end

            if datosent[:fechanac]
              r = datosent[:fechanac]
              # suponemos yyyy-mm-dd
              d = Sip::FormatoFechaHelper.reconoce_adivinando_locale(r, menserror)
              if d
                self.dianac = d.day
                self.mesnac = d.month
                self.anionac = d.year
              end
              datosent.delete :fechanac
            end

            if datosent[:fechanac_localizada]
              r = datosent[:fechanac_localizada]
              # suponemos dd/M/yyy
              d = Sip::ImportaHelper.fecha_local_colombia_a_date(r, menserror)
              if d
                self.dianac = d.day
                self.mesnac = d.month
                self.anionac = d.year
              end
              datosent.delete :fechanac_localizada
            end
            if datosent[:tdocumento]
              d = Sip::ImportaHelper.nombre_en_tabla_basica(
                Sip::Tdocumento, datosent[:tdocumento], menserror)
              if !d.nil?
                self.tdocumento_id = d.id
              end
              datosent.delete :tdocumento
            end
            if datosent[:pais]
              pais = Sip::ImportaHelper.nombre_en_tabla_basica(
                Sip::Pais, datosent[:pais].upcase, menserror)
              self.id_pais = pais ? pais.id : nil
              datosent.delete :pais
            end
            if datosent[:departamento]
              if datosent[:departamento] != ''
                if self.id_pais.nil?
                  self.id_pais = Sip::Pais.where(nombre: 'COLOMBIA').take.id
                end
                d = Sip::Departamento.where( id_pais: self.id_pais).where(
                  'upper(unaccent(nombre)) = upper(unaccent(?))', 
                  datosent[:departamento].upcase
                )
                if d.count == 0
                  menserror << "  No se encontró departamento '#{datosent[:departamento]}' en el pais '#{Sip::Pais.find(self.id_pais).nombre}'."
                else 
                  self.id_departamento = d.take.id
                end
              end
              datosent.delete :departamento
            end

            if datosent[:municipio] 
              if datosent[:municipio] != ''
                if self.id_departamento.nil?
                  menserror << "  No se puede ubicar municipio #{datosent[:municipio]} sin departamento."
                else
                  m = Sip::Municipio.where(
                    id_departamento: self.id_departamento).where(
                    'upper(unaccent(nombre)) = upper(unaccent(?))', 
                    datosent[:municipio].upcase
                  )
                  if m.count == 0
                    menserror << "  No se encontró municipio #{datosent[:municipio]} en el departamento #{Sip::Departamento.find(self.id_departamento).nombre}."
                  else 
                    self.id_municipio = m.take.id
                  end
                end
              end
              datosent.delete :municipio
            end

            if datosent.keys.include?(:centro_poblado)
              if datosent[:centro_poblado] && datosent[:centro_poblado] != ''
                if self.id_municipio.nil?
                  menserror << "  No puede ubicarse centro_poblado #{datosent[:centro_poblado]} sin municipio."
                else
                  cp = Sip::Clase.where(
                    id_municipio: self.id_municipio).where(
                    'upper(unaccent(nombre))=upper(unaccent(?))', 
                    datosent[:centro_poblado].upcase
                  )
                  if cp.count == 0
                    menserror << "  No se encontró centro poblado #{datosent[:centro_poblado]} en el municipio #{Sip::Municipio.find(self.id_municipio).nombre}."
                  else 
                    self.id_clase= cp.take.id
                  end
                end
              end
              datosent.delete :centro_poblado
            end

            if datosent[:nacionalde] 
              self.nacionalde = Sip::ImportaHelper.nombre_en_tabla_basica(
                Sip::Pais, datosent[:nacionalde].upcase, menserror)
              datosent.delete :nacionalde
            end

            importa_gen(datosent, datossal, menserror, opciones)
          end


          def importa(datosent, datossal, menserror, opciones = {})
            importa_sip(datosent, datossal, menserror, opciones)
          end


          scope :filtro_nombres, lambda { |n|
            where("unaccent(nombres) ILIKE '%' || unaccent(?) || '%'", n)
          }

          scope :filtro_apellidos, lambda { |a|
            where("unaccent(apellidos) ILIKE '%' || unaccent(?) || '%'", a)
          }

          scope :filtro_numerodocumento, lambda { |n|
            where("unaccent(numerodocumento) ILIKE '%' || " +
                  "unaccent(?) || '%'", n)
          }

          scope :filtro_tdocumento, lambda {|tid|
            where(tdocumento_id: tid.to_i)
          }

          scope :filtro_sexo, lambda { |s|
            where(sexo: s)
          }


        end # include

        class_methods do

        end

      end # Persona
    end # Models
  end # Concerns
end # Sip

