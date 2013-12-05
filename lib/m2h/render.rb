module M2H
  class Render
    require "redcarpet"
    require "erb"

    class Document
      def initialize
        @erb = File.open(File.dirname(__FILE__) + "/_layout.erb").read
      end

      def pack(html_body)
        title, content = nil, nil
        title = $1 if /h1>(.+)\<\/h1./ =~ html_body
        content = html_body
        # page break
        content.gsub!(/\/{4,}/, "<div class='break'/>")
        return ERB.new(@erb).result(binding)
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

      doc = Document.new

      base.files.each { |bf|
        html_body = markdown.render(File.open(bf, "r:utf-8").read)
        File.open("#{bf}.html", "w:#{base.sys_enc}").write(doc.pack(html_body))
        puts "render: #{bf}.html"
      }
    end

  end
end
