require_relative '../../test_helper'
require 'sip/edad_sexo_helper'

module Sip
  class EdadSexoHelperTest < ActionView::TestCase

    include EdadSexoHelper

    test "edad" do
      assert_equal 47, edad_de_fechanac_fecha(1973, 7, 20, 2021, 7, 19)
      assert_equal 48, edad_de_fechanac_fecha(1973, 7, 20, 2021, 7, 21)
    end

    test "lib/sip" do 
      c = Ubicacionpre.connection
      assert Sip::existe_secuencia?(c, 'sip_ubicacionpre_id_seq')
      assert Sip::renombra_secuencia(c, 'sip_ubicacionpre_id_seq',
                                   'sip_ubicacionpre_id_tmp_seq')
      # Por ahora nos toca parar prueba aquí porque aunque 
      # se ejecuta el ALTER, el ambiente de pruebas lo hace en
      # una transacción que no permite el renombramiento en realidad
      #debugger
      #assert Sip::existe_secuencia?(c, 'sip_ubicacionpre_id_tmp_seq')
      #assert Sip::renombra_secuencia(c, 'sip_ubicacionpre_id_tmp_seq',
      #                             'sip_ubicacionpre_id_seq')
    end

  end  # class
end    # module
