# encoding: UTF-8
module Sip
  module OrientacionsexualHelper
    include ActionView::Helpers::TextHelper

      ORIENTACIONES= [
        [:HETEROSEXUAL, :H],
        [:LESBIANA, :L], 
        [:GAY, :G],
        [:BISEXUAL, :B], 
        [:TRANSEXUAL, :T], 
        ["SIN INFORMACIÓN", :S] 
      ]
  end
end
