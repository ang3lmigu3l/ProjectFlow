module ApplicationHelper
  class HTMLwithPygments < Redcarpet::Render::HTML
    def block_code(code, language)
      Pygments.highlight(code, lexer: language)
    end
  end
  def markdown(text)
    renderer = HTMLwithPygments.new(hard_wrap: true, filter_html: true )
    options = {
      autolink: true,
      no_insta_emphasis: true,
      fenced_code_blocks: true,
      lax_html_blocks: true,
      strikethrough: true,
      superscript: true
    }
    Redcarpet::Markdown.new(renderer, options).render(text).html_safe
  end

  def social_icon_helper(user, service)
    if user.respond_to?(service) && !user.send(service).nil?
      link_to user.send(service), class: "btn btn-social-social btn-#{service}" do
        content_tag(:span, class: "fa fa-#{service}")
      end
    end
  end

end
