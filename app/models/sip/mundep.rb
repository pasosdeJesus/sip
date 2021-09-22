
# Ideas de https://www.sitepoint.com/speed-up-with-materialized-views-on-postgresql-and-rails/
module Sip
  class Mundep < ActiveRecord::Base
    self.table_name = 'sip_mundep'

    def readonly?
      true
    end

    def self.refresca()
      if ActiveRecord::Base.connection.data_source_exists? 'sip_mundep'
        ActiveRecord::Base.connection.execute(
          'REFRESH MATERIALIZED VIEW sip_mundep')
      end
    end

  end
end
