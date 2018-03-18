# From https://stackoverflow.com/questions/44168957/heroku-ci-w-postgresql-extensions/44170222#44170222

module ActiveRecord
  module Tasks
    class PostgreSQLDatabaseTasks
      ON_ERROR_STOP_1 = 'ON_ERROR_STOP=0'.freeze
    end
  end
end
