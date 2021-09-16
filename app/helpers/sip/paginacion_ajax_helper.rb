if Sip.paginador && Sip.paginador == :will_paginate
  require_dependency 'will_paginate/view_helpers/action_view'
end

module Sip
  module PaginacionAjaxHelper
    if Sip.paginador && Sip.paginador == :will_paginate
      # Solución adaptada de https://gist.github.com/jeroenr/3142686
      class GeneraEnlace < WillPaginate::ActionView::LinkRenderer
        def link(text, target, attributes = {})
          attributes['data-remote'] = true
          super
        end
      end

      def pagina(collection, params={})
        will_paginate collection, 
        params.merge( renderer: Sip::PaginacionAjaxHelper::GeneraEnlace)
      end

    end # if :will_paginate

  end
end
