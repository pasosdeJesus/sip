require_relative '../../test_helper'

module Sip
  class OrgsocialSectororgsocialTest < ActiveSupport::TestCase

    test "valido" do
      grupoper = Sip::Grupoper.create(PRUEBA_GRUPOPER)
      orgsocial = Sip::Orgsocial.create(PRUEBA_ORGSOCIAL)
      assert orgsocial.valid?

      sectororgsocial = Sip::Sectororgsocial.create(PRUEBA_SECTORORGSOCIAL)
      assert sectororgsocial.valid?

      pt = Sip::OrgsocialSectororgsocial.create(
        orgsocial_id: orgsocial.id,
        sectororgsocial_id: sectororgsocial.id
      )
      assert pt.valid?
      # pt.destroy!  No opera porque sip_orgsocial_sectororgsocial no tiene
      # llave primaria
      orgsocial.sectororgsocial_ids = []
      orgsocial.save!
      sectororgsocial.destroy!
      orgsocial.destroy!
      grupoper.destroy!
    end

    test "invalido: falta orgsocial" do
      sectororgsocial = Sip::Sectororgsocial.create(PRUEBA_SECTORORGSOCIAL)
      assert sectororgsocial.valid?

      pt = Sip::OrgsocialSectororgsocial.create(
        orgsocial_id: nil,
        sectororgsocial_id: sectororgsocial.id
      )
      assert_not pt.valid?
      pt.destroy!
      sectororgsocial.destroy!
    end

    test "invalido: falta sectororgsocial" do
      grupoper = Sip::Grupoper.create(PRUEBA_GRUPOPER)
      orgsocial = Sip::Orgsocial.create(PRUEBA_ORGSOCIAL)
      assert orgsocial.valid?

      pt = Sip::OrgsocialSectororgsocial.create(
        orgsocial_id: orgsocial.id,
        sectororgsocial_id: nil
      )
      assert_not pt.valid?
      pt.destroy!
      orgsocial.destroy!
      grupoper.destroy!
    end

    test "invalido: no única" do
      skip # Por hacer operar en msip
      grupoper = Sip::Grupoper.create(PRUEBA_GRUPOPER)
      orgsocial = Sip::Orgsocial.create(PRUEBA_ORGSOCIAL)
      assert orgsocial.valid?

      sectororgsocial = Sip::Sectororgsocial.create(PRUEBA_SECTORORGSOCIAL)
      assert sectororgsocial.valid?

      pt = Sip::OrgsocialSectororgsocial.create(
        orgsocial_id: orgsocial.id,
        sectororgsocial_id: sectororgsocial.id
      )
      assert pt.valid?

      pt2 = Sip::OrgsocialSectororgsocial.create(
        orgsocial_id: orgsocial.id,
        sectororgsocial_id: sectororgsocial.id
      )
      assert_not pt2.valid?
    end


  end
end
