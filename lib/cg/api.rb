require "httparty"

module CG
  class API
    include HTTParty
    ROOT_URL = "http://localhost:3000"

    def self.create_app_request(email)
      self.post("#{ROOT_URL}/apps", :body => { :application => { :email => email } })
    end

    def self.show_app_request(id)
      self.get("#{ROOT_URL}/apps/#{id}")
    end
  end
end