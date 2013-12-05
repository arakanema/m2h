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
        blocks = html_body.split("////") # page_break
        page_count = blocks.size
        pages = blocks.map.with_index { |block, i|
          unless (i + 1) == page_count
            "<div class='page_number'>#{i+1}</div>\n" + block + "\n<div class='break'/>\n"
          else
            "<div class='page_number'>#{i+1}</div>\n" + block
          end
        }.join
        File.open("#{bf}.html".encode(base.sys_enc), "w:#{base.sys_enc}").write(doc.pack(pages))
        puts "render: #{bf}.html"
      }
    end

  end
end
