require 'asciidoctor'
require 'asciidoctor/extensions'

class BilibiliBlockMacro < Asciidoctor::Extensions::BlockMacroProcessor
  use_dsl
  
  named :bilibili

  def process parent, target, attrs
    html = %(<div style="position: relative; padding: 30%;">
  <iframe src="//player.bilibili.com/player.html?bvid=#{target}&high_quality=1&page=1" style="border-width: 0; position: absolute; width: 100%; height: 100%; top: 0; left: 0;" allowfullscreen></iframe>
</div>)

    create_pass_block parent, html, attrs, subs: nil
  end
end

Asciidoctor::Extensions.register do
  block_macro BilibiliBlockMacro if document.basebackend? 'html'
end
