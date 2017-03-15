# encoding: UTF-8

require_relative 'application'

ActiveRecord::Base.pluralize_table_names=false

# Initialize the Rails application.
Rails.application.initialize!
