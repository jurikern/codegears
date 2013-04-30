require "cg/version"

module Command
  class Version
    def self.main(*args)
      puts CG::VERSION
    end
  end
end