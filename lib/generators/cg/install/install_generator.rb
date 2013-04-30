module CG
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)
      desc "This generator installs CodeGears configuration in config/initializers/codegears.rb"

      def create_config_file
        template "config.rb", "config/initializers/codegears.rb"
      end
    end
  end
end