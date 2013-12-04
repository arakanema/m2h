module M2H
  require "optparse"

  class OptParser < OptionParser
    attr_reader :help

    def initialize
      @help = <<-HELP
  Usage  : m2h <*.markdown>
  Options:
    -h, --help            : show this messages
    -v, --version         : show version infomation
      HELP
      super
    end
  end

  class OptionError
    def initialize(message)
      $stderr.puts "!!! " << message << " !!!"
    end
  end
end
