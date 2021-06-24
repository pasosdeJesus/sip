module Sip
  module Concerns
    module Models
      module Bitacora
        extend ActiveSupport::Concern

        included do
          self.table_name = 'sip_bitacora'
	        include Sip::Modelo
          include Sip::Localizacion

          serialize :params
          belongs_to :usuario, foreign_key: 'usuario_id',
            validate: true, class_name: 'Usuario',
            optional: true

          campofecha_localizado :fecha

          validates :fecha, presence: true, allow_blank: false
          validates :ip, length: {maximum: 100}
          validates :url, length: {maximum: 1023}
          validates :params, length: {maximum: 5000}
          validates :modelo, length: {maximum: 511}
          validates :operacion, length: {maximum: 63}

          def self.a(ip, usuario_id, url, params, 
                     modelo, modelo_id, operacion, detalle_json = '{}')
            url = url ? url.to_s : ''
            url = url[0..49] if url && url.length > 50
            modelo = modelo ? modelo.to_s : ''
            modelo = modelo[0..49] if modelo && modelo.length > 50
            operacion = operacion ? operacion.to_s : ''
            operacion = operacion[0..49] if operacion && operacion.length > 50
            if detalle_json == ''
              detalle_json = '{}'
            else
              begin
                JSON.parse(detalle_json)
              rescue JSON::ParserError => e
                detalle_json = detalle_json.to_json
              end
            end
            probex = ''
            begin
              b = Sip::Bitacora.new(
                fecha: Time.now.utc.iso8601,
                ip: ip,
                usuario_id: usuario_id,
                url: url,
                params: params.to_s,
                modelo: modelo,
                modelo_id: modelo_id.to_i,
                operacion: operacion,
                detalle: detalle_json
              )
              if b.params && b.params.to_yaml.length > 5000
                b.params = b.params.to_yaml[0..4000]
              end
              b.save!
            rescue StandardError => e
              probex = e.message + e.backtrace.inspect
            end
            if b.errors.messages != {} || probex != ''
              STDERR.puts "** No se puede escribir en bitácora: " +
                "#{b.errors.messages.to_s} " + probex
            end
          end

          # Agrega un registro de actualizar a la bitácra
          # @param request petición HTTP
          # @param indparam1 se usará request.param[indparam1]
          # @param indparam2 se usará request.param[indparam1][indparam2]
          #   debe tener los cambios realizados, recolectado por Javascript
          # @param usuario_id
          # @param params params
          # @param modelo e.g "Sivel2Gen::Caso"
          # @param registro_id e.g @registro.id
          def self.agregar_actualizar(
            request, indparam1, indparam2, usuario_id, params,
            modelo, registro_id)
            # Se intentó implementar a nivel de modelo con
            # before_update, after_update pero a Sivel2Gen::Caso
            # sólo le llegan los cambios al modelo Caso y no a los
            # asociados. Por eso inicialmente se prefirió a nivel de
            # controlador y los cambios al formulario en el cliente
            # con Javascript.
            detalle_bitacora = {}
            if request.params[indparam1] &&
                request.params[indparam1][indparam2] &&
                request.params[indparam1][indparam2] != ''
              begin
                detalle_bitacora = JSON.parse(
                  request.params[indparam1][indparam2])
              rescue
                detalle_bitacora = {error: 'Error al reconocer JSON'}
              end
            end
            if detalle_bitacora != {}
              Sip::Bitacora.a(request.remote_ip,
                              usuario_id,
                              request.url,
                              params,
                              'Sivel2Gen::Caso',
                              registro_id,
                              'actualizar',
                              detalle_bitacora.to_json)
            end
          end

          def presenta_nombre
            "#{id}"
          end


        end

      end
    end
  end
end

