# encoding: UTF-8

FactoryGirl.define do
  factory :sip_trelacion, class: 'Sip::Trelacion' do
		id 'NN' # Buscamos que no intefiera con existentes
    nombre "Trelacion"
    fechacreacion "2014-09-09"
    created_at "2014-09-09"
  end
end
