require "httparty"

module CG
  class API
    include HTTParty
    ROOT_URL   = "http://api.codegears.co"
    PUSHER_URL = "#{ROOT_URL}:9292/stream"

    def self.create_app_request(email)
      self.post("#{ROOT_URL}/apps", :body => { :application => { :email => email } }).body
    end

    def self.show_app_request(id, secret_id = nil, secret_token = nil)
      self.get("#{ROOT_URL}/apps/#{id}?#{self.attach_auth(secret_id, secret_token)}").body
    end

    def self.push_message_request(channel, message)
      message = { :channel => channel,
                  :message => message,
                  :ext => { :secret_id => CG::APP.secret_id, :secret_token => CG::APP.secret_token } }.to_json
      Net::HTTP.post_form(URI.parse(PUSHER_URL), :message => message).body
    end

    def self.attach_auth(secret_id, secret_token)
      if secret_id && secret_token
        "secret_id=#{secret_id}&secret_token=#{secret_token}"
      else
        ""
      end
    end
  end
end