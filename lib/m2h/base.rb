module M2H
  class Base
    attr_reader :files, :sys_enc, :serif, :header, :cover, :toc

    def initialize(argv, option)
      @errors  = []
      @files   = path_inspect(argv)
      @sys_enc = Encoding.locale_charmap
      @serif   = option[:serif] ? true : false
      @header  = option[:header] ? true : false
      @cover   = option[:cover] ? true : false
      @toc     = option[:toc] ? true : false
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
