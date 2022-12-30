require_relative "../../test_helper"
require 'rake'

module Sip
  class TareasTest < ActiveSupport::TestCase
    include Engine.routes.url_helpers
    #include Devise::Test::IntegrationHelpers

    setup do
      Dummy::Application.load_tasks
    end

    test "indices" do
      Rake::Task['sip:indices'].invoke
    end

    # modifica db/datos-basicas.sql
    #test "vuelcabasicas" do
    #  Rake::Task['sip:vuelcabasicas'].invoke
    #end

    #test "actbasicas" do
    #  Rake::Task['sip:actbasicas'].invoke
    #end

    test "vuelca y restaura" do
      Rake::Task['sip:vuelca'].invoke
      #Rake::Task['sip:restaura'].invoke
    end

    test "stimulus_motores" do
      Rake::Task['sip:stimulus_motores'].invoke
      assert Dir.exist?("app/javascript/controllers/sip")
      FileUtils.rm_f "app/javascript/controllers/sip"
    end
  end
end
