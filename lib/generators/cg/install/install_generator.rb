require "cg/api"

module Cg
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)
      desc "This generator installs CodeGears configuration in config/initializers/codegears.rb"

      argument :email, :type => :string, :default => ""

      def create_config_file
        init_settings
        template "config.rb.template", "config/initializers/codegears.rb"
      end

      private

      def init_settings
        unless email.blank?
          response = CG::API.create_request(email)
          unless response["success"] == false
            @id           = response["id"]
            @secret_id    = response["secret_id"]
            @secret_token = response["secret_token"]
          end
        end
      end
    end
  end
end