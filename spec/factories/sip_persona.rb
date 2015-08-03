# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sip_persona, class: 'Sip::Persona' do
    nombres "Nombres"
    apellidos "Apellidos"
    anionac 1974
    mesnac 1
    dianac 1
    sexo "F"
    tdocumento_id 1
    numerodocumento "10000000"
  end
end
