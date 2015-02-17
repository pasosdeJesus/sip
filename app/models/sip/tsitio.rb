# encoding: UTF-8
module Sip
  class Tsitio < ActiveRecord::Base
    include Basica

    has_many :ubicacion, foreign_key: "id_tsitio", validate: true,
      class_name: 'Sip::Ubicacion'
  end
end
