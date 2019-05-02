# encoding: UTF-8

module Sip
  module Modelo
    extend ActiveSupport::Concern
    include Sip::Localizacion

    # En principio un modelo tiene una id
    
    included do

      # Si atr corresponde a tabla combinada (con relación has_many) o a 
      # tabla con accepts_nested_attributes_for la retorna.
      # En otro caso retorna nil
      def self.asociacion_combinada(atr)
        r = nil
        if atr.is_a?(Hash) && 
          (atr.first[0].to_s.ends_with?('_ids') || 
           atr.first[0].to_s.ends_with?('_attributes'))
          na = atr.first[0].to_s.chomp('_ids')
          na = na.chomp("_attributes")
          a = self.reflect_on_all_associations
          r = a.select { |ua| ua.name.to_s == na }[0] 
          if r.nil?
            msg="Aunque #{atr} es como nombre de asociación combinada, " +
              "no se encontró #{na} entre las de #{self.to_s}"
            puts msg
            raise msg
          end
        else
          na = atr.to_s.chomp('_ids')
          na = na.chomp('_attributes')
          a = self.reflect_on_all_associations
          p = a.select { |ua| ua.name.to_s == na && 
                         (ua.macro == :has_many || 
                          ua.macro == :has_and_belongs_to_many) }
          if p.count>0
            r=p[0]
          end
        end
        return r
      end

      # Si atr es llave foranea retorna asociación a este modelo
      # en otro caso retorna nil
      def self.asociacion_llave_foranea(atr)
        aso = self.reflect_on_all_associations
        bel = aso.select { |a| a.macro == :belongs_to } 
        fk = bel.map do |e|
          e.foreign_key.to_s
        end
        if fk.include? atr.to_s
          r = aso.select { |a| 
            (a.is_a?(ActiveRecord::Reflection::HasManyReflection) ||
             a.is_a?(ActiveRecord::Reflection::BelongsToReflection)) && 
              a.foreign_key.to_s == atr.to_s 
          }[0] 
          return r
        end
        ln = bel.map do |e|
          e.name.to_s
        end
        if ln.include? atr.to_s
          r = aso.select { |a| 
            (a.is_a?(ActiveRecord::Reflection::HasManyReflection) ||
             a.is_a?(ActiveRecord::Reflection::BelongsToReflection)) && 
              a.name.to_s == atr.to_s 
          }[0] 
          return r
        end

        return nil
      end

      # Si atr es atributo que es llave foranea retorna su clase
      # si no retorna nil
      def self.clase_llave_foranea(atr)
        r = self.asociacion_llave_foranea(atr)
        if r
          return r.class_name.constantize
        end
        return nil
      end

      attr_accessor :creado_en
      def creado_en
        created_at
      end

      attr_accessor :actualizado_en
      def actualizado_en
        updated_at
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
        clf = self.class.clase_llave_foranea(atr)
        if self.class.columns_hash && self.class.columns_hash[atr.to_s] && 
            self.class.columns_hash[atr.to_s].type == :boolean 
          self[atr.to_s] ? "Si" : (self[atr.to_s].nil? ? "" : "No")
        elsif self.class.asociacion_combinada(atr)
          ac = self.class.asociacion_combinada(atr).name.to_s
          e = self.send(ac)
          e.inject("") { |memo, i| 
            (memo == "" ? "" : memo + "; ") + i.presenta_nombre.to_s
          }
        elsif clf
          if (self[atr.to_s])
            r = clf.find(self[atr.to_s])
            if r.respond_to?(:presenta_nombre)
              r.presenta_nombre
            else
              r.id.to_s
            end
          elsif self.respond_to?(atr)
            r = self.send(atr)
            if r
              r.presenta_nombre
            else
              ""
            end
          else
            ""
          end
        elsif self.respond_to?(atr) && 
          self.send(atr.to_sym).respond_to?(:presenta_nombre)
          self.send(atr.to_sym).presenta_nombre
        elsif self.respond_to?(atr) && self[atr.to_s].nil?
          if self.send(atr).to_s.include?("ActiveRecord_Associations_CollectionProxy")
            e = self.send(atr)
            e.inject("") { |memo, i| 
              (memo == "" ? "" : memo + "; ") + 
                (i.respond_to?('presenta_nombre') ? i.presenta_nombre.to_s : i.to_s)
            }
          else
            self.send(atr).to_s
          end
        else
          self[atr.to_s].to_s
        end
      end

      # Presentar campo atr del registro en index y show para sobrecargar
      def presenta(atr)
        presenta_gen(atr)
      end


      def importa_gen(datosent, datossal, menserror, opciones = {})
        datosent.keys.each do |ll|
          case ll.to_sym
          when :actualizado_en
            self.updated_at = datosent[ll.to_sym]
          when :creado_en
            self.created_at = datosent[ll.to_sym]
          else
            asig = ll.to_s + '='
            if self.respond_to?(asig)
              begin
                self.send(asig, datosent[ll.to_sym])
              rescue 
                menserror <<  " No se pudo asignar a #{ll.to_s} el valor #{datosent[ll.to_sym]}."
              end
            else
              menserror << " No se conoce como importar atributo #{ll.to_sym} " +
                " con valor #{datosent[ll.to_sym]} en controlador #{self.class}."
              return nil
            end
          end
        end
        return self
      end


      # En el modelo actual crea/busca registro y lo actualiza con la
      # información de datosent.
      # @param datosent diccionario con datos de entrada (modificables)
      # @param datossal Diccionario con otros datos de salida
      # @param menserror Colchon cadena con mensajes de error
      # @param opciones Opciones para la importación
      # @return Si lo logra retorna self si no lo logra retorna nil 
      #   y agrega razones del error en el colchon menserror.
      def importa(datosent, datossal, menserror, opciones = {})
        importa_gen(datosent, datossal, menserror, opciones)
      end


      # Complementa importación una vez el modelo actual ha sido salvado
      # @param datossal Otros datos de salida de la importación que esta
      #   función debe salvar
      # @param menserror colchon cadena con mensajes de error
      # @param opciones Para importación
      # @return Verdadero si logra salvar todo datossal, de lo contrario
      #   salva lo que más puede y retorna falso
      def complementa_importa(datossal, menserror, opciones)
        return true
      end

      # Por omisión es posible filtrar por id
      scope :filtro_id, lambda {|id|
        # Puede ser una lista de ids separadas por ,
        if id.include?(',')
          where(id: id.split(','))
        else
          where(id: id)
        end
      }

    end # included

  end
end
