# encoding: UTF-8

require 'sip/application_controller'
class ApplicationController < ActionController::Base
  # Previente ataques CSRF elevando una excepción
  # En el caso de APIs, en cambio puedes querer usar :null_session
  protect_from_forgery with: :exception

	before_filter :configure_permitted_parameters, if: :devise_controller?

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:account_update, keys:
                                        [:email, 
                                          :password, 
                                          :password_confirmation, 
                                          :current_password, 
                                          :nombre, 
                                          :email, 
                                          :descripcion
      ]) 
    end
end
