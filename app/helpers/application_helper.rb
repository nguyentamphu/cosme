module ApplicationHelper
	def include_action_javascript
	    content_for :javascript_after do
	      javascript_include_tag "#{params[:controller]}/#{params[:action]}"
	    end
	end
	
end