# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sip_oficina, class: 'Sip::Oficina' do
		id 1000 # No intefiere con existentes
    nombre "Ofi"
    observaciones 'Ofi'
    fechacreacion "2015-04-16"
    created_at "2015-04-16"
  end
end
