module ApplicationHelper
	def publisher_name(pub)
		@publisher = Publisher.find_by_id(pub)
	end
end