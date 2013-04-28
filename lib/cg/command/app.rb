require "httparty"
require "colorize"

module Command
  class App
    include HTTParty

    URL = "http://codegears.co/apps"

    def self.create!(email = "")
      response = self.post(URL, :body => { :application => { :email => email } })
      if response["success"] == false
        response["errors"].each do |k,v|
          puts "#{k.capitalize} #{v.first}\n".red
        end
      else
        puts "Application successfully created.\n".green
        puts "Add the following lines to the file config/initializers/codegears.rb:\n".green
        puts "    CG::App.id(\"#{response['id']}\")".green
        puts "    CG::App.secret_id(\"#{response['secret_id']}\")".green
        puts "    CG::App.secret_token(\"#{response['secret_token']}\")\n".green
        puts "And restart application to start using the CodeGears platform.\n".green
      end
    end
  end
end