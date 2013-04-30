require "singleton"

module CG
  class APP
    include Singleton

    attr_accessor :secret_id, :secret_token, :id

    def self.configure
      yield(self.instance)
    end
  end
end