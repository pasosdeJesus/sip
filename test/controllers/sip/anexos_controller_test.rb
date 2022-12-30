require "test_helper"

module Sip
  class AnexosControllerTest < ActionDispatch::IntegrationTest

    include Rails.application.routes.url_helpers
    include Devise::Test::IntegrationHelpers

    setup  do
      if ENV['CONFIG_HOSTS'] != 'www.example.com'
        raise 'CONFIG_HOSTS debe ser www.example.com'
      end
      @current_usuario = ::Usuario.create(PRUEBA_USUARIO)
      sign_in @current_usuario
      @anexo = Anexo.new PRUEBA_ANEXO
      @anexo.adjunto = File.new(Rails.root + 'db/seeds.rb')
      @anexo.save!
    end

    test "descarga_anexo" do
      get sip.descarga_anexo_url(@anexo.id)
      assert_response :success
    end

    test "abre_anexo" do
      get sip.abre_anexo_url(@anexo.id)
      assert_response :success
    end

    test "mostrar_portada pdf" do
      get sip.mostrar_portada_url(@anexo.id)
      assert_redirected_to Rails.configuration.relative_url_root
      @anexo2 = Anexo.new PRUEBA_ANEXO.merge(descripcion: 'yy')
      @anexo2.adjunto = File.new(Rails.root + '../../doc/erd.pdf')
      @anexo2.save!
      get sip.mostrar_portada_url(@anexo2.id)
      assert_response :success
    end

  end
end
