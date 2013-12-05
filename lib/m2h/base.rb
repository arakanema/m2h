module M2H
  class Base
    attr_reader :files, :sys_enc

    def initialize(argv)
      @errors = []
      @files = path_inspect(argv)
      @sys_enc = Encoding.locale_charmap
      if @errors.empty?
        return self
      else
        @errors.each do |e|
          puts e
        end
        exit 3
      end
    end

    def path_inspect(files)
      is_valid = true
      expanded_paths = []
      files.each { |f|
        unless File.exists?(File.expand_path(f))
          is_valid = false
          @errors.push("PathError: Could not found #{f}")
        else
          expanded_paths.push(File.expand_path(f))
        end
      }
      return expanded_paths
    end
  end
end
