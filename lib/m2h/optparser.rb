module M2H
  require "optparse"

  class OptParser < OptionParser
    attr_reader :help

    def initialize
      @help = <<-HELP
  Usage  : m2h <markdonw_file1> <markdonw_file2> ...
  Options:
    -s, --serif   : font-family -> serif
    -t, --toc     : use tocify.js
    -h, --help    : show this messages
    -v, --version : show version infomation
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
