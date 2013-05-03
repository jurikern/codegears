require "httparty"

module CG
  class API
    include HTTParty
    ROOT_URL   = "http://codegears.co"
    PUSHER_URL = "http://codegears.co:9292/stream"

    def self.create_app_request(email)
      self.post("#{ROOT_URL}/apps", :body => { :application => { :email => email } })
    end

    def self.show_app_request(id)
      self.get("#{ROOT_URL}/apps/#{id}")
    end

    def self.push_message_request(channel, message)
      message = { :channel => channel,
                  :message => message,
                  :ext => { :secret_id => CG::APP.secret_id, :secret_token => CG::APP.secret_token } }.to_json
      Net::HTTP.post_form(URI.parse(PUSHER_URL), :message => message)
    end
  end
end