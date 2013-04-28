require "rubygems"
require "cg/command"

module CG
  class CLI
    def self.start(*args)
      CG::Command.new(*args)
    end
  end
end