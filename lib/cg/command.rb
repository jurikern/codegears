module CG
  class Command
    def initialize(*args)
      Dir[File.join(File.dirname(__FILE__), "command", "*.rb")].each do |file|
        require file
      end

      namespace = args.shift.capitalize rescue nil
      namespace = Kernel.const_get("Command").const_get(namespace) rescue nil
      task      = args.shift.downcase rescue nil

      namespace.send(task, *args)
    end
  end
end