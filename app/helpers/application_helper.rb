module ApplicationHelper

	def markdown(text)
		return '' unless text		
  		markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
  		markdown.render(text).html_safe
	end
end
