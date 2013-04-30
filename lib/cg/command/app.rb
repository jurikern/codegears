require "cg/api"
require "colorize"

module Command
  class App
    def self.create(email = "")
      response = CG::API.create_app_request(email)
      if response["success"] == false
        response["errors"].each do |k,v|
          puts "#{k.capitalize} #{v.first}\n".red
        end
      else
        puts "Application successfully created.".green
        puts "Add the following lines to the file config/initializers/codegears.rb:\n".green
        puts "require \"cg\"\n".green
        puts "CG::App.configure do |instance|".green
        puts "  instance.id           = \"#{response['id']}\"".green
        puts "  instance.secret_id    = \"#{response['secret_id']}\"".green
        puts "  instance.secret_token = \"#{response['secret_token']}\"\n".green
        puts "end\n".green
        puts "And restart application to start using the CodeGears platform.".green
      end
    end

    def self.status(id = "")
      puts "Application ID can't be blank".red and return unless id.present?
      response = CG::API.show_app_request(id)
      if response["success"] == false
        puts "Application not found".red
      else
        status = response["active"]
        puts "Active: #{status}".send(status ? :green : :red)
      end
    end
  end
end