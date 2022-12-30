require_relative "../../test_helper"

module Sip
  class PersonasControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers
    include Devise::Test::IntegrationHelpers

    setup  do
      if ENV['CONFIG_HOSTS'] != 'www.example.com'
        raise 'CONFIG_HOSTS debe ser www.example.com'
      end
      @current_usuario = ::Usuario.create(PRUEBA_USUARIO)
      sign_in @current_usuario
    end

    test "index: presenta plantilla de indice" do
      get personas_url
      assert_response :success
      assert_template :index
    end

    test "presenta plantilla de indice filtradas por termino" do
      get personas_url, params: {"persona" => {"term" => 'x'}}, as: :json
      assert_response :success
    end

    test "presenta plantilla admin/basicas/index" do
      get personas_url
      assert_template "sip/modelos/index"
    end

    test "new: formulario de nueva" do
      get new_persona_url
      assert_response :success
      assert_template :new
    end


    test "post: crea un registro" do
      assert_difference('Sip::Persona.count') do
        post personas_url, params: {persona: PRUEBA_PERSONA}
        #puts response.body
      end
      assert_redirected_to sip.persona_path(
        assigns(:persona)
      )
    end

    test "post: redirige al registro creado" do
      post personas_url, params: { persona: PRUEBA_PERSONA}
      assert_response :found
    end

    test "vuelve a plantilla nueva cuando hay errores de validación" do
      atc = PRUEBA_PERSONA.clone
      atc[:nombres] = ''
      post personas_url, params: { persona: atc }
      assert_template "new"
    end

    test "debe actualizar existente" do
      nuevopersona = Sip::Persona.create!(PRUEBA_PERSONA)
      patch sip.persona_path(nuevopersona.id),
        params: { 
          persona: { 
            id: nuevopersona.id,
            nombres: 'xyz'
          }
        }

      assert_redirected_to sip.persona_path(assigns(:persona))
    end

    test "crear presentar editar eliminar" do
      assert_difference('Sip::Persona.count') do
        post personas_url, params: {persona: PRUEBA_PERSONA}
        #puts response.body
      end
      assert_redirected_to sip.persona_path(
        assigns(:persona)
      )
      idr = response.body.gsub(/.*personas\//, "").gsub(/">.*/, "").to_i

      persona = Sip::Persona.all.take
      get persona_url(persona)
      assert_response :success
      assert_template :show

      get edit_persona_url(persona)
      assert_response :success
      assert_template :edit

      assert_difference('Persona.count', -1) do
        delete sip.persona_path(Persona.find(idr)) # Persona sin clases
      end

      assert_redirected_to sip.personas_path
    end

  end
end
