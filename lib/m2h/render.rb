module M2H
  class Render
    require "redcarpet"
    require "erb"

    class Document
      attr_accessor :html_body

      def initialize(html_body)
        @html_body    = html_body
        @pages        = html_body.split(/\/{4,}/) # page_break
        @erb_template = File.open(File.dirname(__FILE__) + "/_layout.erb").read
        @page_count   = @pages.size
        @html         = generate_html(@pages)
      end

      def generate_html(pages)
        @html = pages.map.with_index { |page, i|
          unless (i + 1) == @page_count
            "<div class='page_number'>#{i+1}/#{@page_count}</div>\n" + page + "\n<div class='break'/>\n"
          else
            "<div class='page_number'>#{i+1}/#{@page_count}</div>\n" + page
          end
        }.join
      end

      def bind!
        title, content = nil, nil
        title = $1 if /h1>(.+)\<\/h1./ =~ html_body
        set_header(title)
        content = @html
        return ERB.new(@erb_template).result(binding)
      end

      def set_header(title)
        @html.gsub!(/page_number'>/, "page_number'>#{title}&nbsp;")
      end

      def write(path, enc)
        File.open(path, enc).write(self.bind!)
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
        autolink:true,
        tables: true,
        with_toc_data: true,
      )

      base.files.each { |bf|
        doc = Document.new(markdown.render(File.open(bf, "r:utf-8").read))
        doc.write("#{bf}.html".encode(base.sys_enc), "w:#{base.sys_enc}")
        puts "render: #{bf}.html"
      }
    end

  end
end
