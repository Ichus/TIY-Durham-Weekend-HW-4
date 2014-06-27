module ApplicationHelper
  def markdown(text)
    renderer = Redcarpet::Render::HTML.new(filter_html: true, hard_wrap: true)
    extensions = { autolink: true, no_intra_emphasis: true }
    Redcarpet::Markdown.new(renderer, extensions).render(text).html_safe
  end

  # def markdown(text)
  #   options = [:hard_wrap, :filter_html, :autolink, :no_intraemphasis]
  #   Redcarpet::Markdown.new(text, *options).to_html.html_safe
  # end
end
