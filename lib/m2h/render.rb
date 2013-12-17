module M2H
  class Render
    require "redcarpet"
    require "erb"

    class Document
      attr_accessor :html_body

      def initialize(html_body)
        @erb_template = File.open(File.dirname(__FILE__) + "/_layout.erb").read
        @html         = generate_html(html_body)
        @header       = false
      end

      def generate_html(html_body)
        @title      = $1 if /h1>(.+)\<\/h1./ =~ html_body
        @pages      = html_body.split(/\/{4,}/) # page_break
        @page_count = @pages.size
        html = @pages.map.with_index { |page, i|
          unless (i + 1) == @page_count
            "<div class='page_number'>#{i+1}/#{@page_count}</div>\n" + page + "\n<div class='break'/>\n"
          else
            "<div class='page_number'>#{i+1}/#{@page_count}</div>\n" + page
          end
        }.join
        html.gsub!(/page_number'>/, "page_number'>#{@title}&nbsp;")
        return html
      end

      def bind!
        return ERB.new(@erb_template).result(binding)
      end

      def set_header
        @header = true
      end

      def write(path, enc)
        File.open(path, enc).write(self.bind!)
      end

      def set_serif
        @serif = "serif, "
      end

      def set_cover
        cover = "\n<div class='cover'><h1>#{@title}</h1></div>\n"
        cover += "<div class='break'/>\n"
        @cover = cover
      end

      def set_toc
        @toc = true
      end
    end

    def self.render!(base)
      markdown = Redcarpet::Markdown.new(
        Redcarpet::Render::HTML,
        space_after_headers: true,
        fenced_code_blocks: true,
        no_intra_emphasis: true,
        strikethrough: true,
        footnotes: true,
        autolink: true,
        tables: true,
        with_toc_data: true,
      )

      base.files.each { |bf|
        doc = Document.new(markdown.render(File.open(bf, "r:utf-8").read))
        doc.set_serif if base.serif
        doc.set_header if base.header
        doc.set_cover if base.cover
        doc.set_toc if base.toc
        doc.write("#{bf}.html".encode(base.sys_enc), "w:#{base.sys_enc}")
        puts "render: #{bf}.html"
      }
    end

  end
end
