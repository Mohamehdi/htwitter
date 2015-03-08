module ApplicationHelper

	# nav_link instead of link to
	def nav_link(link_text, link_path)

		# current page is build it rails
		class_name = current_page?(link_path) ? 'active' : ''

		#content tag turns ruby into html better, can't use html since it's not .erb
		# returns 
		content_tag(:li, :class => class_name) do
			link_to link_text, link_path
		end
	end
end
