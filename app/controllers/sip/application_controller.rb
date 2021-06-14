module Sip
  class ApplicationController < ActionController::Base

    before_action do
      resource = controller_name.singularize.to_sym
      method = "#{resource}_params"
      params[resource] &&= send(method) if respond_to?(method, true)
    end

    before_action :configure_permitted_parameters, 
      if: :devise_controller?

    # Aplicación final debe hacer algo como:
    #protect_from_forgery with: :exception
    
    def current_ability
      @current_ability ||= ::Ability.new(current_usuario)
    end

    protected

    def configure_permitted_parameters
      if (Gem.loaded_specs['devise'].version <=> Gem::Version.new('4.0.0')) < 0
        devise_parameter_sanitizer.for(:sign_up) << :nusuario
        devise_parameter_sanitizer.for(:account_update) << 
          [:nombre, :email, :descripcion, :tema_id]
      else
        devise_parameter_sanitizer.permit(:sign_up, keys: [:nusuario])
        devise_parameter_sanitizer.permit(:account_update, keys: 
                                        [:nombre, :email, :descripcion, :tema_id])
      end
    end

  end
end
