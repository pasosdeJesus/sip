
require 'sip/application_controller'
class ApplicationController < Sip::ApplicationController
  include Turbo::Redirection
  # Previente ataques CSRF elevando una excepción
  # En el caso de APIs, en cambio puedes querer usar :null_session
  protect_from_forgery with: :exception
end
