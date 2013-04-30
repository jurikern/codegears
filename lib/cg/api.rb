require "httparty"

module CG
  class API
    include HTTParty

    def self.create_request(email)
      self.post("http://localhost:3000/apps", :body => { :application => { :email => email } })
    end
  end
end