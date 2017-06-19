# encoding: UTF-8

module Sip
  module Modelo
    extend ActiveSupport::Concern
    include Sip::Localizacion

    # En principio un modelo tiene una id
    
    included do

      # Si atr corresponde a tabla combinada o a tabla
      # con accepts_nested_attributes_for la retorna.
      # En otro caso retorna nil
      def asociacion_combinada(atr)
        if atr.is_a?(Hash) && 
          (atr.first[0].to_s.ends_with?("_ids") || 
           atr.first[0].to_s.ends_with?("_attributes"))
          na = atr.first[0].to_s.chomp("_ids")
          na = na.chomp("_attributes")
          a = self.class.reflect_on_all_associations
          r = a.select { |ua| ua.name.to_s == na }[0] 
          if r.nil?
            msg="Aunque #{atr} es como nombre de asociación combinada, " +
              "no se encontro #{na} entre las de #{self.class}"
            puts msg
            self.errors.add(:base, msg)
            raise msg
          end
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

      # Como presentar un registro por ejemplo en un campo de selección
      def presenta_nombre
        if respond_to?(:nombre)
          self[:nombre]
        else
          self[:id]
        end
      end

      # Presentar campo atr del registro en index y show genérico (no sobrec)
      def presenta_gen(atr)
        clf = clase_llave_foranea(atr)
        if self.class.columns_hash && self.class.columns_hash[atr] && 
          self.class.columns_hash[atr].type == :boolean 
          self[atr] ? "Si" : "No" 
        elsif asociacion_combinada(atr)
          ac = asociacion_combinada(atr).name.to_s
          e = self.send(ac)
          e.inject("") { |memo, i| 
            (memo == "" ? "" : memo + "; ") + i.presenta_nombre 
          }
        elsif clf
          if (self[atr.to_s])
            clf.find(self[atr.to_s]).presenta_nombre
          else
            ""
          end
        elsif self.respond_to?(atr) && self[atr.to_s].nil?
          self.send(atr).to_s
        else
          self[atr.to_s].to_s
        end
      end

      # Presentar campo atr del registro en index y show para sobrecargar
      def presenta(atr)
        presenta_gen(atr)
      end

    end # included

  end
end
