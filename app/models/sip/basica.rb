# encoding: UTF-8

module Sip
  module Basica
    extend ActiveSupport::Concern

    included do
      include Sip::Localizacion
      include Sip::Modelo

      scope :habilitados, -> (campoord = "nombre") {
        where(fechadeshabilitacion: nil).order(campoord.to_sym)
      }

      campofecha_localizado :fechacreacion
      campofecha_localizado :fechadeshabilitacion
      validates :nombre, presence: true, allow_blank: false, 
        length: { maximum: 500 }
      validates :observaciones, length: { maximum: 5000 }
      validates :fechacreacion, presence: true, allow_blank: false

      # Las tablas basicas que tengan repetido deben definir la constante
      # Nombresunicos=false
      # Ver por ejemplo departamento
      validates_uniqueness_of :nombre, case_sensitive: false, if: Proc.new {
        |rb| !(defined? rb.class::Nombresunicos) || rb.class::Nombresunicos
      }

      validate :fechacreacion_posible?
      def fechacreacion_posible?
        if !fechacreacion || fechacreacion < Date.new(2000,1,1)
          errors.add(:fechacreacion, 'Debe ser reciente (posterior a 2000)')
        end
      end

      validate :fechadeshabilitacion_posible?
      def fechadeshabilitacion_posible?
        if (!fechadeshabilitacion.blank? && fechadeshabilitacion < fechacreacion)
          errors.add(:fechadeshabilitacion, 'Debe ser posterior a la de creación')
        end
      end

      # Por defecto tablas básicas con datos en mayúsculas y sin espacios redundantes
      def nombre=(val)
        self[:nombre] = val.upcase.squish if val
      end

      # Si atr corresponde a tabla combinada la retorna
      # en otro caso retorna nil
      def asociacion_combinada(atr)
        if atr.is_a?(Hash) && atr.first[0].to_s.ends_with?("_ids")
          na = atr.first[0].to_s.chomp("_ids")
          a = self.class.reflect_on_all_associations
          r = a.select { |ua| ua.name.to_s == na }[0] 
          return r
        end
        return nil
      end

      # Si atr es llave foranea retorna asociación a este modelo
      # en otro caso retorna nil
      def asociacion_llave_foranea(atr)
        aso = self.class.reflect_on_all_associations
        bel = aso.select { |a| a.macro == :belongs_to } 
        fk = bel.map(&:foreign_key)
        if fk.include? atr
          r = aso.select { |a| a.foreign_key == atr }[0] 
          return r
        end
        return nil
      end

      # Si atr es atributo que es llave foranea retorna su clase
      # si no retorna nil
      def clase_llave_foranea(atr)
        r = asociacion_llave_foranea(atr)
        if r
          return r.class_name.constantize
        end
        return nil
      end

      # Presentar nombre del registro en index y show
      def presenta_nombre
        self['nombre']
      end

      # Presentar campo atr del registro en index y show genérico (no sobrec)
#      def presenta_gen(atr)
#        clf = clase_llave_foranea(atr)
#        if self.class.columns_hash && self.class.columns_hash[atr] && 
#          self.class.columns_hash[atr].type == :boolean 
#          self[atr] ? "Si" : "No" 
#        elsif asociacion_combinada(atr)
#          ac = asociacion_combinada(atr).name.to_s
#          e = self.send(ac)
#          e.inject("") { |memo, i| 
#            (memo == "" ? "" : memo + "; ") + i.presenta_nombre 
#          }
#        elsif clf
#          if (self[atr.to_s])
#            clf.find(self[atr.to_s]).presenta_nombre
#          else
#            ""
#          end
#        elsif self.respond_to?(atr) && self[atr.to_s].nil?
#          self.send(atr).to_s
#        else
#          self[atr.to_s].to_s
#        end
#      end
#
#      # Presentar campo atr del registro en index y show para sobrecargar
#      def presenta(atr)
#        presenta_gen(atr)
#      end

      # Para búsquedas tipo autocompletacion en base de datos campos a observar
      def self.busca_etiqueta_campos
        ['nombre']
      end

      # Para búsquedas tipo autocompletacion etiqueta que se retorna
      def busca_etiqueta
        v = self.class.busca_etiqueta_campos.map { |c|
          self[c]
        }
        return v.join(" ")
      end

      # Para búsquedas tipo autocompletacion valor que se retorna
      def busca_valor
        self['id']
      end

      attr_accessor :habilitado

      def habilitado
        fechadeshabilitacion.nil? ? 'Si' : 'No'
      end

      scope :filtro_habilitado, lambda {|o|
        if o.upcase.strip == 'SI'
          where(fechadeshabilitacion: nil)
        elsif o.upcase.strip == 'NO'
          where.not(fechadeshabilitacion: nil)
        end 
      }

      scope :filtro_nombre, lambda { |n|
        where("unaccent(nombre) ILIKE '%' || unaccent(?) || '%'", n)
      }

      scope :filtro_observaciones, lambda { |o|
        where("unaccent(observaciones) ILIKE '%' || unaccent(?) || '%'", o)
      }

    end

  end
end
