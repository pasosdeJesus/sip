module Sip
  module PaginacionAjaxHelper
    class GeneraEnlace < WillPaginate::ActionView::LinkRenderer
      def link(text, target, attributes = {})
        attributes['data-remote'] = true
        super
      end
    end
  end
end
