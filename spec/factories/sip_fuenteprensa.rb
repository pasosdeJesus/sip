# encoding: UTF-8

FactoryGirl.define do
  factory :sip_fuenteprensa, class: 'Sip::Fuenteprensa' do
		id 1000 # Buscamos que no interfiera con existentes
    nombre "Fuenteprensa"
    fechacreacion "2015-05-11"
    created_at "2015-05-11"
  end
end
